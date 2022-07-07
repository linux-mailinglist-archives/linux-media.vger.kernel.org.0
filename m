Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4F1056A3D5
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 15:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236004AbiGGNiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 09:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235303AbiGGNiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 09:38:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3BA72CDE4
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 06:38:16 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 261DBD00;
        Thu,  7 Jul 2022 15:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657201094;
        bh=LbsJnxGU9iYd6zfMNbJdS8L/YRRNIr+LQftTx73xm2A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vKp8aK5Vq44sPcR5cpUHtDPSabO2yY3vH0zU3jit83gnvN0tPgsEycfqbvUwkBaCM
         G+tGovoIH87nrfe/RbDUlamsbePtRkfVizQxsU+kdvELchNHa1bYP3UY09JVbIviYD
         HUOw9iy7n+5OMo0OeFQONWhqYl+59eMzM0cjErWE=
Date:   Thu, 7 Jul 2022 22:38:05 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v2 10/55] media: rkisp1: Access ISP version from info
 pointer
Message-ID: <20220707133805.GH3886060@pyrite.rasen.tech>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
 <20220630230713.10580-11-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630230713.10580-11-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jul 01, 2022 at 02:06:28AM +0300, Laurent Pinchart wrote:
> The ISP version is stored in the media_device hw_revision field and
> access from there in the driver. Now that we store a pointer to the
> match data in the rkisp1_device structure, access the ISP version from
> there to make the code clearer and avoid depending on the media_device.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 4 ++--
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 2 +-
>  drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c  | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index bc94a51124b0..69c60814ecc1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -417,7 +417,7 @@ static int rkisp1_config_mipi(struct rkisp1_device *rkisp1)
>  	rkisp1_write(rkisp1, RKISP1_CIF_MIPI_CTRL, mipi_ctrl);
>  
>  	/* V12 could also use a newer csi2-host, but we don't want that yet */
> -	if (rkisp1->media_dev.hw_revision == RKISP1_V12)
> +	if (rkisp1->info->isp_ver == RKISP1_V12)
>  		rkisp1_write(rkisp1, RKISP1_CIF_ISP_CSI0_CTRL0, 0);
>  
>  	/* Configure Data Type and Virtual Channel */
> @@ -535,7 +535,7 @@ static void rkisp1_config_clk(struct rkisp1_device *rkisp1)
>  	rkisp1_write(rkisp1, RKISP1_CIF_VI_ICCL, val);
>  
>  	/* ensure sp and mp can run at the same time in V12 */
> -	if (rkisp1->media_dev.hw_revision == RKISP1_V12) {
> +	if (rkisp1->info->isp_ver == RKISP1_V12) {
>  		val = RKISP1_CIF_CLK_CTRL_MI_Y12 | RKISP1_CIF_CLK_CTRL_MI_SP |
>  		      RKISP1_CIF_CLK_CTRL_MI_RAW0 | RKISP1_CIF_CLK_CTRL_MI_RAW1 |
>  		      RKISP1_CIF_CLK_CTRL_MI_READ | RKISP1_CIF_CLK_CTRL_MI_RAWRD |
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index c88a9c0fa86e..9da7dc1bc690 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1801,7 +1801,7 @@ static void rkisp1_init_params(struct rkisp1_params *params)
>  	params->vdev_fmt.fmt.meta.buffersize =
>  		sizeof(struct rkisp1_params_cfg);
>  
> -	if (params->rkisp1->media_dev.hw_revision == RKISP1_V12)
> +	if (params->rkisp1->info->isp_ver == RKISP1_V12)
>  		params->ops = &rkisp1_v12_params_ops;
>  	else
>  		params->ops = &rkisp1_v10_params_ops;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> index b7ae9166c52f..7d82356b5345 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> @@ -427,7 +427,7 @@ static void rkisp1_init_stats(struct rkisp1_stats *stats)
>  	stats->vdev_fmt.fmt.meta.buffersize =
>  		sizeof(struct rkisp1_stat_buffer);
>  
> -	if (stats->rkisp1->media_dev.hw_revision == RKISP1_V12)
> +	if (stats->rkisp1->info->isp_ver == RKISP1_V12)
>  		stats->ops = &rkisp1_v12_stats_ops;
>  	else
>  		stats->ops = &rkisp1_v10_stats_ops;
