Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9533A771C
	for <lists+linux-media@lfdr.de>; Tue, 15 Jun 2021 08:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhFOGdX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Jun 2021 02:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhFOGdW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Jun 2021 02:33:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93EBC061574
        for <linux-media@vger.kernel.org>; Mon, 14 Jun 2021 23:31:17 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 7FCE11F412A9
Subject: Re: [PATCH v2 7/7] media: rockchip: rkisp1: add support for px30 isp
 version
To:     Heiko Stuebner <heiko@sntech.de>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, helen.koike@collabora.com,
        Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
References: <20210615003741.3758316-1-heiko@sntech.de>
 <20210615003741.3758316-8-heiko@sntech.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <80e47c31-8711-37fb-8bef-43376d6558ac@collabora.com>
Date:   Tue, 15 Jun 2021 09:31:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210615003741.3758316-8-heiko@sntech.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 15.06.21 03:37, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The px30 uses a V12 isp block so add compatible and matchdata
> for it.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>   .../media/platform/rockchip/rkisp1/rkisp1-dev.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index ddc05189c62a..6e4c0710f3a3 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -398,6 +398,19 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
>   	return IRQ_HANDLED;
>   }
>   
> +static const char * const px30_isp_clks[] = {
> +	"isp",
> +	"aclk",
> +	"hclk",
> +	"pclk",
> +};
> +
> +static const struct rkisp1_match_data px30_isp_match_data = {
> +	.clks = px30_isp_clks,
> +	.size = ARRAY_SIZE(px30_isp_clks),
> +	.isp_ver = RKISP1_V12,
> +};
> +
>   static const char * const rk3399_isp_clks[] = {
>   	"isp",
>   	"aclk",
> @@ -411,6 +424,10 @@ static const struct rkisp1_match_data rk3399_isp_match_data = {
>   };
>   
>   static const struct of_device_id rkisp1_of_match[] = {
> +	{
> +		.compatible = "rockchip,px30-cif-isp",
> +		.data = &px30_isp_match_data,
> +	},

I think the yaml should be updated to add the compatible "rockchip,px30-cif-isp"
also, maybe interrupt-names values should be added to the 'rkisp1_match_data' of each compatible
and then in patch 1 those values can be used instead of the if-else implementation in the probe.

Thanks,
Dafna

>   	{
>   		.compatible = "rockchip,rk3399-cif-isp",
>   		.data = &rk3399_isp_match_data,
> 
