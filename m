Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72EE431398
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 11:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhJRJjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 05:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhJRJjy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 05:39:54 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61011C061745;
        Mon, 18 Oct 2021 02:37:41 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id cP5MmtodIk3b0cP5PmhCaU; Mon, 18 Oct 2021 11:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634549860; bh=NxXn58f8Oe+CrFtq795xZOZeWXo5STeA9om7IcmnNyA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NHzWX3UP7FaFfRqjDTNI6HFbAp3bvE3bLWRHLmbbXm6nPA8M/NwNp48Hph0L/6mhg
         1JuAM5Lb37NDSHT5iMLOKsLD53MbHHkj4hTx6CGF7bGf1n4X1SOQm+7gHVgMPnzldW
         Pm/vt/LMhpzHOvERFMW03UYk8e/cnfsp7GjRrT/dz5WapQPA2SBOW2GwjhW6gvFQ8J
         9YEq/fUMzKp/RjwsmKx5k5InUfIY7n2XZOY524tZhyuwJwkuqlFuSXbB76FiNaH9Qe
         qsOYmLsEJU8m7b5HGkKeyesSYylCBNGSRSuCUaGRh7fQfY2N9oP2jrL3Eu0riJnEMA
         AbgTU/mCBKDEg==
Subject: Re: [PATCH v5 09/10] clk: stm32: Fix ltdc's clock turn off by
 clk_disable_unused() after system enter shell
To:     dillon.minfei@gmail.com, mchehab@kernel.org,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1634533488-25334-1-git-send-email-dillon.minfei@gmail.com>
 <1634533488-25334-10-git-send-email-dillon.minfei@gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1159ec06-cf36-efef-e87a-5d826b6b44d3@xs4all.nl>
Date:   Mon, 18 Oct 2021 11:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1634533488-25334-10-git-send-email-dillon.minfei@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOl2ErOMpmPSxtXTC2aZoM5FBesFtm2XHy5IIYTU9xh2boMRz5eDSNX5KCsSgdoZTG3xf9sX7LRpg1hGhWVDxYrCxq9uuS0syN8CxK/AweI1sdj9hfQ2
 XhaBTGfn2LtUyCCQkZ+jSbaMH1zi8bRoY42Jz97j40p7qhcm98urYJ+mkx+dFQzJRoN2ac+mloZcV6KaJvysM8CT8dphGqhmXaToRVZbJPvUKQbRQQqsx7rP
 hAn3k5VnD2n3tJIdiSc0+nW9nNNTFEgJJfwmze4IANtaRLmO+GG8Y5lngaf03fNmH9g+Uc4IPng5Cl1iJSmTTMcSxtb7t/BSWS/L73wjoY3L0NqW11CCAAFJ
 0wGQUREWbbfxglX2D/FAR11FltGHWpb94hErpQ6dzwbKSI9uUTs1NwacQNrIL2/EQc77f+9MQwg1gVFMDI6C/+Bt33J3sYfwX4M6//pnk7Xa6eTGsitd1VT7
 VzcysJvz7UlRGiluk+TUxBIHV2t9k3VABxMdF187TM0TfRic3nVWWGlGS7J+rVCU8ftmSfvA7eNcq387gKWivMCv7pp1phx52E4e+2LPM1ZzXi09ZyTphLaf
 KuHJqIvcqoVPyH36psej0P2+F9nqLW7eMk97aS9zwLEg/QDY+wrugy8oS8hOcAnRLbp0eHuXc+HG4v0GZdn0QBKqAHgcsMdxLRqUEOHWJ8FYbWagwpLlr+JE
 tATfk4Ly6J6hXp9zM6JbU4GF0gzqe1WREkjaMTPwzPeP1C5/q80vVCRZ2ic2kjxuJc9CAPe0dI9Zj5xzY1IecjS8TKxafPOAA4M+JOir0clDNJMO+3L37W7y
 qVPb1QlsSfKUzFLTT9+bSVeE2RrISZ5KTkqdJIeAtKEN+tjAsCbDSeYf738pbor7ybZYxMuzE1CWEVfRfCvA8kF6yKiinpPNum3++t5Edmq7PtMyKXnII10G
 2cZL7w1h+v/7En2tBbLIqeQkgvI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dillon,

On 18/10/2021 07:04, dillon.minfei@gmail.com wrote:
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
> stm32f469/746/769 have the same issue, fix it.
> 
> Fixes: daf2d117cbca ("clk: stm32f4: Add lcd-tft clock")
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Just to double check (I asked as well when v1 was posted, but that's a long time ago):
I can ignore this patch, right? If so, then make sure you follow up on this in the clk
subsystem since it is not yet merged in mainline.

If you DO want me to pick it up, then I see that the clk maintainer has already Acked
it, so I take it as well.

Regards,

	Hans

> Link: https://lore.kernel.org/linux-arm-kernel/1590564453-24499-7-git-send-email-dillon.minfei@gmail.com/
> Link: https://lore.kernel.org/lkml/CAPTRvHkf0cK_4ZidM17rPo99gWDmxgqFt4CDUjqFFwkOeQeFDg@mail.gmail.com/
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> v5: no change.
> 
>  drivers/clk/clk-stm32f4.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index af46176ad053..473dfe632cc5 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,6 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -211,7 +210,6 @@ static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 20,	"spi5",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
> @@ -286,7 +284,6 @@ static const struct stm32f4_gate_data stm32f746_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  };
>  
>  static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
> @@ -364,7 +361,6 @@ static const struct stm32f4_gate_data stm32f769_gates[] __initconst = {
>  	{ STM32F4_RCC_APB2ENR, 21,	"spi6",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 22,	"sai1",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 23,	"sai2",		"apb2_div" },
> -	{ STM32F4_RCC_APB2ENR, 26,	"ltdc",		"apb2_div" },
>  	{ STM32F4_RCC_APB2ENR, 30,	"mdio",		"apb2_div" },
>  };
>  
> 

