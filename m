Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC463AB07E
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 11:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232043AbhFQJ7o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 05:59:44 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42949 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230272AbhFQJ7o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 05:59:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tom9l2lerhqlttomCl03mC; Thu, 17 Jun 2021 11:57:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623923853; bh=mNLOxBASZ1Rj1Q0TCJlnQtfYaEmFKt0BCfAy0LhPKmM=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=X3Fqw3pUXTbnpQY0zLgjBH2dv22Uiwlmucwp0069twdAiX4EnNQfVRT5mNVOEDXu8
         +CGFjB5/26tnLe+UokrbNVsaL9FQp8SxfCLA20/aZjPjpy3HcFfd/msRxF9dJRHzA5
         8Lx9YFiY3/jxd8QqFV5V5LTczjtEP3UZSnBjGXoVrjxQVRc1hgYveHp5+Gk4H4Ai24
         hoAD6XQMJHlBJ6rnQTAQC5nONwme634ivzc9RQbpkcOsZ7lPhxgEStktUxFcGLnb+A
         y/OBHoVeYxPv6kGT26PA4u1ikryeMH+Lss2PDOLuCOhV4zbtBEkJg0LVts/zmpw4Ne
         hPvUGsMJNNEjA==
Subject: Re: [PATCH 3/7] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after kernel startup
To:     dillon.minfei@gmail.com, mchehab@kernel.org,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-4-git-send-email-dillon.minfei@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cd510ab8-a128-05cc-2f0b-f70f02d23d04@xs4all.nl>
Date:   Thu, 17 Jun 2021 11:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1621508727-24486-4-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfM4WVfO1x/QqHFAjsJ8BftwtBgjz6mLzYtrj42sOhjPILBFsr8uTR1/QInmrEYs6LtL65IyoLiqZF1Ze8j5tEXKulzVUXbtsQhrCONE4BhUw2qc9Lgy5
 E/vjz1Za/62HatPFYewZMmgIsGNz2NWTuQDZF8xHiZekQmZ1/FrXgOD7YKYpWOvQdVJa90xFcEcEWqsMJNmbddPQMvoeFkS1rMi+QSYxpIY0twSnsbEon8Dm
 A4CNXM2fqNGK1uCA4WRFhM5CkxlaZIVZUXml+OrBHt/E9JrPoq8AIXd8Bwfoq8dxD4JH3Y2gHm83nQoiAA0k+lCEZp/bngfkiXRG2swQRoHByBZGqqhptVyq
 WwWCfsgXR8owQWYEV1bFMh8zAx3+ZKnjR3aiK2iVEFYxkZVhxsFXhbUDiTiiF77sIjY8cE/GVux2kuPcfs2T5uoqOeUBj6Ics0wpx1ToDxU7Ro7UoNVbo7iN
 yaC35coKnh40XhnPZTj5irJDniM9ehFAa4D6SB3aX3D85B4o1to2Pvz8+vyjTy0vbQzI4f6yf5GtA3tTaS+fFUMYoff/XIgnhic3Uhi2SUwkE2Hvfcb/eBFX
 IENsSsWz/qH7z7CbmYi6ciSEaup9bMcxSSjE2AcSrO6pzw8yvl5/h2QXHFq97WygBjhxElW5d0XwYxqTPL7Sr/TaP7jNH/lCmLTH3FPXFFdgGLGskip43Z4C
 fIJZ+fGKn6RbqmiOtB4aCN4va+pUn2CMW0YvNgYzMdzrELFaSl1hZiiHaV2B5NitLKIaruwD/AUzpPRoxycRJqDtvGNHNv++dwGkAA4zHHDbdtfYh0o0e5U8
 n7Ykin3FHrCisDQPuL7Xpw3zHj4gLjRiSVVjkiQDLklxuA7TX2oJ7uJmYAhJcA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/05/2021 13:05, dillon.minfei@gmail.com wrote:
> From: Dillon Min <dillon.minfei@gmail.com>
> 
> stm32's clk driver register two ltdc gate clk to clk core by
> clk_hw_register_gate() and clk_hw_register_composite()
> 
> first: 'stm32f429_gates[]', clk name is 'ltdc', which no user to use.
> second: 'stm32f429_aux_clk[]', clk name is 'lcd-tft', used by ltdc driver
> 
> both of them point to the same offset of stm32's RCC register. after
> kernel enter console, clk core turn off ltdc's clk as 'stm32f429_gates[]'
> is no one to use. but, actually 'stm32f429_aux_clk[]' is in use.
> 
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/

For my understanding: this patch is going/has already gone in via a different
subsystem, right? And I should skip it when adding this driver to the media subsystem?

Regards,

	Hans

> ---
> 
> This patch was submitted in
> https://lore.kernel.org/lkml/1620990152-19255-1-git-send-email-dillon.minfei@gmail.com/
> 
>  drivers/clk/clk-stm32f4.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 18117ce5ff85..b6ab8c3a7994 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -211,7 +211,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> @@ -557,13 +556,13 @@ static const struct clk_div_table post_divr_table[] = {
>  
>  #define MAX_POST_DIV 3
>  static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
> -	{ CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
> +	{ CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
>  		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
>  
> -	{ CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
> +	{ CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
>  		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
>  
> -	{ NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
> +	{ NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
>  		STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
>  };
>  
> 

