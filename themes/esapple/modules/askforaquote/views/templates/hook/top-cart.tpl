{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<!-- MODULE Quotes cart -->
<script type="text/javascript">
    var quotesCartTop = true;
</script>

{if $active_overlay == 0}
    <div class="clearfix col-sm-4 quotesOuterBox">
        <div class="quotes_cart">
            <a href="{$quotesCart|escape:'html':'UTF-8'}" rel="nofollow" id="quotes-cart-link">
                <b>{l s='Quotes' mod='askforaquote'}</b>
                <span class="ajax_quote_quantity{if $quotesNbTotalProducts == 0} unvisible{/if}">{$quotesNbTotalProducts|intval}</span>
                <span class="ajax_quote_product_txt{if $quotesNbTotalProducts != 1} unvisible{/if}">{l s='Product' mod='askforaquote'}</span>
                <span class="ajax_quote_product_txt_s{if $quotesNbTotalProducts < 2} unvisible{/if}">{l s='Products' mod='askforaquote'}</span>
                <span class="ajax_quote_no_product{if $quotesNbTotalProducts > 0} unvisible{/if}">{l s='(empty)' mod='askforaquote'}</span>
            </a>
            <div class="col-sm-12 quotes_cart_block exclusive" id="box-body" style="display:none;">
                <div class="block_content">
                    <div class="product-list" id="product-list">
                        <div class="product-list-content{if count($afq_products) == 0} unvisible{/if}">
						    <dl class="products" id="quotes-products">
						        {foreach $afq_products as $key=>$product}
						            {if is_numeric($key)}
						            	{include file="$item_tpl_dir./top-cart-item.tpl"}
						            {/if}
						        {/foreach}
						    </dl>
						
						    {if $MAIN_PRICE}
						        <div class="quotes-cart-prices">
						            <div class="row">
						                <span class="col-xs-12 col-lg-6 text-center">{l s='Total:' mod='askforaquote'}</span>
						                <span class="quotes-cart-total col-xs-12 col-lg-6 text-center">
						                	{if !empty($afq_products_total)}
												{if $priceDisplay == $smarty.const.PS_TAX_EXC}
													{displayPrice price=$afq_products_total.total}
												{else}
													{displayPrice price=$afq_products_total.total_wt}
												{/if}
											{/if}
										</span>
						            </div>
						        </div>
						    {/if}
						</div>
						
						<div class="alert product-list-empty{if count($afq_products) > 0} unvisible{/if}">
						    {l s='No products to quote' mod='askforaquote'}
						</div>
                    </div>
                    <p class="cart-buttons">
                    	{if $logged && $enable_submit && !$terms_page}
                        	<a class="button_order_cart btn btn-default button button-small submit_quote" href="javascript:void(0);" title="{l s='Submit quote' mod='askforaquote'}" rel="nofollow">
                            	<span data-wait_text="{l s='Please wait...' mod='askforaquote'}">{l s='Submit now' mod='askforaquote'}<i class="icon-chevron-right right"></i></span>
							</a>
                        {/if}
                        {if $quote2order}
							<a id="submit_quote2order" class="button_order_cart btn btn-default button button-small" href="#" title="{l s='Convert to cart' mod='askforaquote'}" rel="nofollow">
	                        	<span>{l s='Convert to cart' mod='askforaquote'}<i class="icon-chevron-right right"></i></span>
	                        </a>
						{/if}
                        <a class="button_order_cart btn btn-default button button-small" href="{$quotesCart|escape:'html':'UTF-8'}" title="{l s='View list' mod='askforaquote'}" rel="nofollow">
                        	<span>{l s='View list' mod='askforaquote'}<i class="icon-chevron-right right"></i></span>
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
{elseif $active_overlay == 1}
	<div id="quotes_layer_cart">
		<div class="clearfix">
            <h2><i class="icon-ok-circle"></i> {l s='Product successfully added to your quotes cart' mod='askforaquote'}</h2>
			<div class="quotes_layer_cart_product col-xs-12 col-md-6">
				<span class="cross" title="{l s='Close window' mod='askforaquote'}"></span>
                {if $popup_product}
                    <div class="product-image-container layer_cart_img">
                        <img class="layer_cart_img img-responsive" src="{$link->getImageLink($popup_product.link_rewrite, $popup_product.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{$popup_product.name|escape:'html':'UTF-8'}" title="{$popup_product.name|escape:'html':'UTF-8'}">
                    </div>
                    <div class="layer_cart_product_info">
                        <span class="product-name">{$popup_product.name|escape:'html':'UTF-8'}</span>
                        <div>
                            <strong class="dark">{l s='Quantity' mod='askforaquote'}</strong>
                            <span id="layer_cart_product_quantity">{$popup_product.quantity|intval}</span>
                        </div>
						{if $MAIN_PRICE}
                        <div>
                            <strong class="dark">{l s='Total' mod='askforaquote'}:</strong>
                            <span id="layer_cart_product_price">
					            {if $priceDisplay == $smarty.const.PS_TAX_EXC}
					            	{displayPrice price=$popup_product.price_total}
					            {else}
					            	{displayPrice price=$popup_product.price_total_wt}
					            {/if}
                            </span>
                        </div>
						{/if}
                    </div>
                {/if}
			</div>
			<div class="quotes_layer_cart_cart col-xs-12 col-md-6">
				<br/>
				<hr/>
				<div class="button-container">
					<span class="continue btn btn-default button exclusive-medium" title="{l s='Continue shopping' mod='askforaquote'}">
						<span>
							<i class="icon-chevron-left left"></i>{l s='Continue shopping' mod='askforaquote'}
						</span>
					</span>
					{if $enablePopSubmit && $logged && !$terms_page}
						<a class="button_order_cart btn btn-default button button-medium submit_quote" href="javascript:void(0);" title="{l s='Submit quote' mod='askforaquote'}" rel="nofollow">
							<span data-wait_text="{l s='Please wait...' mod='askforaquote'}">
								{l s='Submit now' mod='askforaquote'}<i class="icon-chevron-right right"></i>
							</span>
						</a>
					{else}
						<a class="btn btn-default button button-medium"	href="{$link->getModuleLink('askforaquote','QuotesCart')|escape:'html':'UTF-8'}" title="{l s='Proceed to checkout' mod='askforaquote'}" rel="nofollow">
							<span>
								{l s='Proceed to checkout' mod='askforaquote'}<i class="icon-chevron-right right"></i>
							</span>
						</a>
					{/if}
				</div>
				<hr/>
			</div>
		</div>
		<div class="crossseling"></div>
	</div> <!-- #layer_cart -->
	<div class="quotes_layer_cart_overlay"></div>
{/if}
<!-- /MODULE Quotes cart -->