Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9DF19FADB
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729097AbgDFQ50 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:57:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56412 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728690AbgDFQ50 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:57:26 -0400
Received: from [IPv6:2804:431:e7cc:377d:dcf4:aab0:a7bd:9880] (unknown [IPv6:2804:431:e7cc:377d:dcf4:aab0:a7bd:9880])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 505DE2962C1;
        Mon,  6 Apr 2020 17:57:24 +0100 (BST)
Subject: Re: [PATCH v2 2/3] media: staging: rkisp1: add rk3288 support
To:     Karthik Poduval <karthik.poduval@gmail.com>,
        linux-media@vger.kernel.org
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-3-karthik.poduval@gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <0f83014c-9176-3c8f-7718-3127dfabdda6@collabora.com>
Date:   Mon, 6 Apr 2020 13:57:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406073017.19462-3-karthik.poduval@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Karthik,

Thanks for your patch.

On 4/6/20 4:30 AM, Karthik Poduval wrote:
> Add rk3288 support to the rkisp1 driver.
> 
> tested on tinkerbaord with ov5647 using command
> cam -c 1 -C -F cap
> 
> Reported-by: Karthik Poduval <karthik.poduval@gmail.com>

Please, see my comment from previous patch regarding this tag.

> Signed-off-by: Karthik Poduval <karthik.poduval@gmail.com>
> ---
>  .../bindings/media/rockchip-isp1.yaml          |  1 +
>  drivers/staging/media/rkisp1/rkisp1-dev.c      | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> index af246b71eac6..4c31294cf14b 100644
> --- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
> +++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml

Please, update bindings in a separated patchset.

> @@ -16,6 +16,7 @@ description: |
>  properties:
>    compatible:
>      const: rockchip,rk3399-cif-isp
> +    const: rockchip,rk3288-rkisp1

Please, keep consistency, or rk3288-cif-isp, or we change rk3399-cif-isp to be rk3399-rkisp1.

>  
>    reg:
>      maxItems: 1
> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
> index b1b3c058e957..1df4f5906fd0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
> @@ -403,6 +403,20 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
>  	return IRQ_HANDLED;
>  }
>  
> +

Checkpatch error:
drivers/staging/media/rkisp1/rkisp1-dev.c:406: check: Please don't use multiple blank lines

> +static const char * const rk3288_isp_clks[] = {
> +	"clk_isp",
> +	"aclk_isp",
> +	"hclk_isp",
> +	"pclk_isp_in",
> +	"sclk_isp_jpe",
> +};

You should also update clock-names in the bindings as well.

Regards,
Helen

> +
> +static const struct rkisp1_match_data rk3288_isp_clk_data = {
> +	.clks = rk3288_isp_clks,
> +	.size = ARRAY_SIZE(rk3288_isp_clks),
> +};
> +
>  static const char * const rk3399_isp_clks[] = {
>  	"clk_isp",
>  	"aclk_isp",
> @@ -417,6 +431,10 @@ static const struct rkisp1_match_data rk3399_isp_clk_data = {
>  };
>  
>  static const struct of_device_id rkisp1_of_match[] = {
> +	{
> +		.compatible = "rockchip,rk3288-rkisp1",
> +		.data = &rk3288_isp_clk_data,
> +	},
>  	{
>  		.compatible = "rockchip,rk3399-cif-isp",
>  		.data = &rk3399_isp_clk_data,
> 
