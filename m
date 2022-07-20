Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBD6957B450
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 12:12:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231420AbiGTKMn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 06:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbiGTKMm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 06:12:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA28A62490
        for <linux-media@vger.kernel.org>; Wed, 20 Jul 2022 03:12:40 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240121080.bbtec.net [36.240.121.80])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B654F6DB;
        Wed, 20 Jul 2022 12:12:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658311958;
        bh=Z5QDKlwQZ63wCP+vpTpnemHkq8H/YPYUpKSAaki8ZTs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LDuJzL8FXbpeaIh/roGNw2L82U22L+ARgsxBxOxISW/1ZN+X8ArL540VQHD4qhbwI
         ZyKmL/xpSPBEAmd8J0S4ZIUiQv9CqLuERhK/21o4DlRO2mDHi1gmocip7EWd82/Nwx
         +NwdEGgSsAd9q5XQ4qipMRsxidJ+9OSbBP5tNiyI=
Date:   Wed, 20 Jul 2022 19:12:31 +0900
From:   paul.elder@ideasonboard.com
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] media: rkisp1: Add and use rkisp1_has_feature() macro
Message-ID: <20220720101231.GF3984498@pyrite.rasen.tech>
References: <20220719222432.4356-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719222432.4356-1-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, Jul 20, 2022 at 01:24:32AM +0300, Laurent Pinchart wrote:
> Simplify feature tests with a macro that shortens lines.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Sending to the correct mailing list this time, sorry for the noise.
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  3 +++
>  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    | 14 +++++++-------
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 8056997d5c29..0aae802464ac 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -111,6 +111,9 @@ enum rkisp1_feature {
>  	RKISP1_FEATURE_MIPI_CSI2 = BIT(0),
>  };
>  
> +#define rkisp1_has_feature(rkisp1, feature) \
> +	((rkisp1)->info->features & RKISP1_FEATURE_##feature)
> +
>  /*
>   * struct rkisp1_info - Model-specific ISP Information
>   *
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index f2475c6235ea..e348d8c86861 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -206,7 +206,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  		switch (reg) {
>  		case 0:
>  			/* MIPI CSI-2 port */
> -			if (!(rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)) {
> +			if (!rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
>  				dev_err(rkisp1->dev,
>  					"internal CSI must be available for port 0\n");
>  				ret = -EINVAL;
> @@ -338,7 +338,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>  	unsigned int i;
>  	int ret;
>  
> -	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
> +	if (rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
>  		/* Link the CSI receiver to the ISP. */
>  		ret = media_create_pad_link(&rkisp1->csi.sd.entity,
>  					    RKISP1_CSI_PAD_SRC,
> @@ -390,7 +390,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>  
>  static void rkisp1_entities_unregister(struct rkisp1_device *rkisp1)
>  {
> -	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
> +	if (rkisp1_has_feature(rkisp1, MIPI_CSI2))
>  		rkisp1_csi_unregister(rkisp1);
>  	rkisp1_params_unregister(rkisp1);
>  	rkisp1_stats_unregister(rkisp1);
> @@ -423,7 +423,7 @@ static int rkisp1_entities_register(struct rkisp1_device *rkisp1)
>  	if (ret)
>  		goto error;
>  
> -	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
> +	if (rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
>  		ret = rkisp1_csi_register(rkisp1);
>  		if (ret)
>  			goto error;
> @@ -590,7 +590,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  		goto err_unreg_v4l2_dev;
>  	}
>  
> -	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2) {
> +	if (rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
>  		ret = rkisp1_csi_init(rkisp1);
>  		if (ret)
>  			goto err_unreg_media_dev;
> @@ -611,7 +611,7 @@ static int rkisp1_probe(struct platform_device *pdev)
>  err_unreg_entities:
>  	rkisp1_entities_unregister(rkisp1);
>  err_cleanup_csi:
> -	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
> +	if (rkisp1_has_feature(rkisp1, MIPI_CSI2))
>  		rkisp1_csi_cleanup(rkisp1);
>  err_unreg_media_dev:
>  	media_device_unregister(&rkisp1->media_dev);
> @@ -630,7 +630,7 @@ static int rkisp1_remove(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&rkisp1->notifier);
>  
>  	rkisp1_entities_unregister(rkisp1);
> -	if (rkisp1->info->features & RKISP1_FEATURE_MIPI_CSI2)
> +	if (rkisp1_has_feature(rkisp1, MIPI_CSI2))
>  		rkisp1_csi_cleanup(rkisp1);
>  	rkisp1_debug_cleanup(rkisp1);
