Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 317C956BC7A
	for <lists+linux-media@lfdr.de>; Fri,  8 Jul 2022 17:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237978AbiGHPCg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jul 2022 11:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237848AbiGHPCf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jul 2022 11:02:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1408A252B7
        for <linux-media@vger.kernel.org>; Fri,  8 Jul 2022 08:02:34 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A5E956D;
        Fri,  8 Jul 2022 17:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657292551;
        bh=ocnrOIoCfRwibBCiZ+RwJd0XDGrI+GgLvnRAzWASL7o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KLWBp6RDoZW5xkiMgXZndAxBR2BykK13S8w868jYDYwOG/gtspp2L+dEcmQ9AuVPd
         03ePUft+ipPUGxzqrE7zTfSJWH9BpzpPIh6hqabqyjvCMkKeqcP7/VokNgTcRjsQQ0
         0g+C3zclK0cCNIL9QpVHfot4RUY93ESmuH1j/Eec=
Date:   Fri, 8 Jul 2022 18:02:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] media: rkisp1: Support devices without self path
Message-ID: <YshG7eSvijdaPOYY@pendragon.ideasonboard.com>
References: <20220628054430.1349988-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220628054430.1349988-1-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Paul,

Thank you for the patch.

On Tue, Jun 28, 2022 at 02:44:30PM +0900, Paul Elder wrote:
> Some hardware supported by the rkisp1 driver, such as the ISP in the
> i.MX8MP, don't have a self path. Add a feature flag for this, and
> massage the rest of the driver to support the lack of a self path.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> 
> ---
> Changes in v2:
> - add rkisp1_path_count() helper to obtain the number of paths
> - fix forcing config update when there's no self path
> 
> This patch depends on "media: rkisp1: Cleanups and add support for
> i.MX8MP" [1], which in turn depends on v4 of "media: rkisp1: Misc bug
> fixes and cleanups" [2].
> 
> [1] https://lore.kernel.org/linux-media/20220625070034.6odv6cyvqqigb2sa@guri/T/
> [2] https://lore.kernel.org/linux-media/Ymbxs2p9Tuf331qM@pendragon.ideasonboard.com/T/
> ---
>  .../platform/rockchip/rkisp1/rkisp1-capture.c     |  9 ++++++---
>  .../platform/rockchip/rkisp1/rkisp1-common.h      | 15 +++++++++++++++
>  .../media/platform/rockchip/rkisp1/rkisp1-dev.c   |  9 ++++++---
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c     |  6 ++++--
>  4 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 234b1f8488cb..215be4034c52 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -709,6 +709,7 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
>  {
>  	struct device *dev = ctx;
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
> +	unsigned int dev_count = rkisp1_path_count(rkisp1);
>  	unsigned int i;
>  	u32 status;
>  
> @@ -718,7 +719,7 @@ irqreturn_t rkisp1_capture_isr(int irq, void *ctx)
>  
>  	rkisp1_write(rkisp1, RKISP1_CIF_MI_ICR, status);
>  
> -	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); ++i) {
> +	for (i = 0; i < dev_count; ++i) {
>  		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
>  
>  		if (!(status & RKISP1_CIF_MI_FRAME(cap)))
> @@ -875,6 +876,7 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
>  {
>  	struct rkisp1_device *rkisp1 = cap->rkisp1;
>  	struct rkisp1_capture *other = &rkisp1->capture_devs[cap->id ^ 1];
> +	bool has_self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
>  
>  	cap->ops->set_data_path(cap);
>  	cap->ops->config(cap);
> @@ -892,7 +894,7 @@ static void rkisp1_cap_stream_enable(struct rkisp1_capture *cap)
>  	 * This's also required because the second FE maybe corrupt
>  	 * especially when run at 120fps.
>  	 */
> -	if (!other->is_streaming) {
> +	if (!has_self_path || !other->is_streaming) {
>  		/* force cfg update */
>  		rkisp1_write(rkisp1, RKISP1_CIF_MI_INIT,
>  			     RKISP1_CIF_MI_INIT_SOFT_UPD);
> @@ -1445,10 +1447,11 @@ rkisp1_capture_init(struct rkisp1_device *rkisp1, enum rkisp1_stream_id id)
>  
>  int rkisp1_capture_devs_register(struct rkisp1_device *rkisp1)
>  {
> +	unsigned int dev_count = rkisp1_path_count(rkisp1);
>  	unsigned int i;
>  	int ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkisp1->capture_devs); i++) {
> +	for (i = 0; i < dev_count; i++) {
>  		struct rkisp1_capture *cap = &rkisp1->capture_devs[i];
>  
>  		rkisp1_capture_init(rkisp1, i);
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 0b834579d08c..f25d885c79ff 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -114,6 +114,7 @@ enum rkisp1_feature {
>  	RKISP1_FEATURE_RSZ_CROP = BIT(2),
>  	RKISP1_FEATURE_MAIN_STRIDE = BIT(3),
>  	RKISP1_FEATURE_DMA_34BIT = BIT(4),
> +	RKISP1_FEATURE_SELF_PATH = BIT(5),
>  };
>  
>  /*
> @@ -552,6 +553,20 @@ unsigned int rkisp1_mbus_info_length(void);
>   */
>  const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_index(unsigned int index);
>  
> +/*
> + * rkisp1_path_count - Return the number of paths supported by the device
> + *
> + * Some devices only have a main path, while other device have both a main path
> + * and a self path. This function returns the number of paths that this device
> + * has, based on the feature flags. It should be used insted of checking
> + * ARRAY_SIZE of capture_devs/resizer_devs.
> + */
> +static inline unsigned int rkisp1_path_count(struct rkisp1_device *rkisp1)
> +{
> +	bool has_self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
> +	return has_self_path ? 2 : 1;

	return rkisp1->info->features & RKISP1_FEATURE_SELF_PATH ? 2 : 1;

would do.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  /*
>   * rkisp1_sd_adjust_crop_rect - adjust a rectangle to fit into another rectangle.
>   *
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 4c77aa2bc50a..8fd9f67836a5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -326,6 +326,7 @@ static const struct dev_pm_ops rkisp1_pm_ops = {
>  
>  static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>  {
> +	unsigned int dev_count = rkisp1_path_count(rkisp1);
>  	unsigned int i;
>  	int ret;
>  
> @@ -341,7 +342,7 @@ static int rkisp1_create_links(struct rkisp1_device *rkisp1)
>  	}
>  
>  	/* create ISP->RSZ->CAP links */
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < dev_count; i++) {
>  		struct media_entity *resizer =
>  			&rkisp1->resizer_devs[i].sd.entity;
>  		struct media_entity *capture =
> @@ -466,7 +467,8 @@ static const struct rkisp1_info px30_isp_info = {
>  	.isr_size = ARRAY_SIZE(px30_isp_isrs),
>  	.isp_ver = RKISP1_V12,
>  	.features = RKISP1_FEATURE_MIPI_CSI2
> -		  | RKISP1_FEATURE_DUAL_CROP,
> +		  | RKISP1_FEATURE_DUAL_CROP
> +		  | RKISP1_FEATURE_SELF_PATH,
>  };
>  
>  static const char * const rk3399_isp_clks[] = {
> @@ -486,7 +488,8 @@ static const struct rkisp1_info rk3399_isp_info = {
>  	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
>  	.isp_ver = RKISP1_V10,
>  	.features = RKISP1_FEATURE_MIPI_CSI2
> -		  | RKISP1_FEATURE_DUAL_CROP,
> +		  | RKISP1_FEATURE_DUAL_CROP
> +		  | RKISP1_FEATURE_SELF_PATH,
>  };
>  
>  static const char * const imx8mp_isp_clks[] = {
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> index 29a31b18a082..a18dacc84568 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> @@ -673,6 +673,7 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
>  	struct rkisp1_device *rkisp1 = rsz->rkisp1;
>  	struct rkisp1_capture *other = &rkisp1->capture_devs[rsz->id ^ 1];
>  	enum rkisp1_shadow_regs_when when = RKISP1_SHADOW_REGS_SYNC;
> +	bool has_self_path = rkisp1->info->features & RKISP1_FEATURE_SELF_PATH;
>  
>  	if (!enable) {
>  		if (rkisp1->info->features & RKISP1_FEATURE_DUAL_CROP)
> @@ -681,7 +682,7 @@ static int rkisp1_rsz_s_stream(struct v4l2_subdev *sd, int enable)
>  		return 0;
>  	}
>  
> -	if (other->is_streaming)
> +	if (has_self_path && other->is_streaming)
>  		when = RKISP1_SHADOW_REGS_ASYNC;
>  
>  	mutex_lock(&rsz->ops_lock);
> @@ -769,10 +770,11 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
>  
>  int rkisp1_resizer_devs_register(struct rkisp1_device *rkisp1)
>  {
> +	unsigned int dev_count = rkisp1_path_count(rkisp1);
>  	unsigned int i;
>  	int ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkisp1->resizer_devs); i++) {
> +	for (i = 0; i < dev_count; i++) {
>  		struct rkisp1_resizer *rsz = &rkisp1->resizer_devs[i];
>  
>  		rsz->rkisp1 = rkisp1;

-- 
Regards,

Laurent Pinchart
