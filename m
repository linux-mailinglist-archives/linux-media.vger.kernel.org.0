Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB6407D4295
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 00:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbjJWWNi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Oct 2023 18:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjJWWNg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Oct 2023 18:13:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43B1C9B
        for <linux-media@vger.kernel.org>; Mon, 23 Oct 2023 15:13:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0536AAE;
        Tue, 24 Oct 2023 00:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698099201;
        bh=pNZ+l9gur4bY1QFL11T/YAXKPA/ToYuJFHVe2pFrgx4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UE5civkeP8hXu2j7L1yAOMaR48aNiwKemCw9sHwKmZUPvRKJ0ZttU6IbhF7qztSwm
         BTmdb+bZKbNTPE5GvB9ov8RvIgUX2ls7nWFlccLnbRRsUbAa9V5bcjgblXuvM15Q4e
         LVyLINhBxZMfZ7dmRxooDqVDt1j6hB6gJIblmGEg=
Date:   Tue, 24 Oct 2023 01:13:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [PATCH v3 6/8] media: v4l: subdev: Switch to stream-aware state
 functions
Message-ID: <20231023221339.GE18687@pendragon.ideasonboard.com>
References: <20231023174408.803874-1-sakari.ailus@linux.intel.com>
 <20231023174408.803874-7-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231023174408.803874-7-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Oct 23, 2023 at 08:44:06PM +0300, Sakari Ailus wrote:
> Switch all drivers accessing sub-device state to use the stream-aware
> functions. We will soon remove the old ones.
> 
> This patch has been generated using the following Coccinelle script:
> 
> ---------8<------------
> @@
> expression E1, E2, E3;
> 
> @@
> 
> - v4l2_subdev_get_pad_format(E1, E2, E3)
> + v4l2_subdev_state_get_format(E2, E3)
> 
> @@
> expression E1, E2, E3;
> 
> @@
> 
> - v4l2_subdev_get_pad_crop(E1, E2, E3)
> + v4l2_subdev_state_get_crop(E2, E3)
> 
> @@
> expression E1, E2, E3;
> 
> @@
> 
> - v4l2_subdev_get_pad_compose(E1, E2, E3)
> + v4l2_subdev_state_get_compose(E2, E3)
> 
> @@
> expression E1, E2, E3;
> 
> @@
> 
> - v4l2_subdev_get_try_format(E1, E2, E3)
> + v4l2_subdev_state_get_format(E2, E3)
> 
> @@
> expression E1, E2, E3;
> 
> @@
> 
> - v4l2_subdev_get_try_crop(E1, E2, E3)
> + v4l2_subdev_state_get_crop(E2, E3)
> 
> @@
> expression E1, E2, E3;
> 
> @@
> 
> - v4l2_subdev_get_try_compose(E1, E2, E3)
> + v4l2_subdev_state_get_compose(E2, E3)
> ---------8<------------
> 
> Additionally drivers/media/i2c/s5k5baf.c and
> drivers/media/platform/samsung/s3c-camif/camif-capture.c have been
> manually changed as Coccinelle didn't.

Strange, I wonder why.

> Further local variables have been
> removed as they became unused as a result of the other changes. The diff
> from Coccinelle-generated changes are:
> 
> diff --git b/drivers/media/i2c/imx319.c a/drivers/media/i2c/imx319.c
> index e549692ff478..420984382173 100644
> --- b/drivers/media/i2c/imx319.c
> +++ a/drivers/media/i2c/imx319.c

I can imagine git am getting confused :-)

> @@ -2001,7 +2001,6 @@ static int imx319_do_get_pad_format(struct imx319 *imx319,
>  				    struct v4l2_subdev_format *fmt)
>  {
>  	struct v4l2_mbus_framefmt *framefmt;
> -	struct v4l2_subdev *sd = &imx319->sd;
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> diff --git b/drivers/media/i2c/imx355.c a/drivers/media/i2c/imx355.c
> index 96bdde685d65..e1b1d2fc79dd 100644
> --- b/drivers/media/i2c/imx355.c
> +++ a/drivers/media/i2c/imx355.c
> @@ -1299,7 +1299,6 @@ static int imx355_do_get_pad_format(struct imx355 *imx355,
>  				    struct v4l2_subdev_format *fmt)
>  {
>  	struct v4l2_mbus_framefmt *framefmt;
> -	struct v4l2_subdev *sd = &imx355->sd;
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> diff --git b/drivers/media/i2c/ov08x40.c a/drivers/media/i2c/ov08x40.c
> index ca799bbcfdb7..abbb0b774d43 100644
> --- b/drivers/media/i2c/ov08x40.c
> +++ a/drivers/media/i2c/ov08x40.c
> @@ -2774,7 +2774,6 @@ static int ov08x40_do_get_pad_format(struct ov08x40 *ov08x,
>  				     struct v4l2_subdev_format *fmt)
>  {
>  	struct v4l2_mbus_framefmt *framefmt;
> -	struct v4l2_subdev *sd = &ov08x->sd;
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> diff --git b/drivers/media/i2c/ov13858.c a/drivers/media/i2c/ov13858.c
> index 7816d9787c61..09387e335d80 100644
> --- b/drivers/media/i2c/ov13858.c
> +++ a/drivers/media/i2c/ov13858.c
> @@ -1316,7 +1316,6 @@ static int ov13858_do_get_pad_format(struct ov13858 *ov13858,
>  				     struct v4l2_subdev_format *fmt)
>  {
>  	struct v4l2_mbus_framefmt *framefmt;
> -	struct v4l2_subdev *sd = &ov13858->sd;
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> diff --git b/drivers/media/i2c/ov13b10.c a/drivers/media/i2c/ov13b10.c
> index 268cd4b03f9c..c06411d5ee2b 100644
> --- b/drivers/media/i2c/ov13b10.c
> +++ a/drivers/media/i2c/ov13b10.c
> @@ -1001,7 +1001,6 @@ static int ov13b10_do_get_pad_format(struct ov13b10 *ov13b,
>  				     struct v4l2_subdev_format *fmt)
>  {
>  	struct v4l2_mbus_framefmt *framefmt;
> -	struct v4l2_subdev *sd = &ov13b->sd;
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
> diff --git b/drivers/media/i2c/s5c73m3/s5c73m3-core.c a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> index 47605e36bc60..8f9b5713daf7 100644
> --- b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> +++ a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> @@ -819,7 +819,6 @@ static void s5c73m3_oif_try_format(struct s5c73m3 *state,
>  				   struct v4l2_subdev_format *fmt,
>  				   const struct s5c73m3_frame_size **fs)
>  {
> -	struct v4l2_subdev *sd = &state->sensor_sd;
>  	u32 code;
> 
>  	switch (fmt->pad) {
> diff --git b/drivers/media/i2c/s5k5baf.c a/drivers/media/i2c/s5k5baf.c
> index a36b310b32e1..3f3005cca9d0 100644
> --- b/drivers/media/i2c/s5k5baf.c
> +++ a/drivers/media/i2c/s5k5baf.c
> @@ -1473,12 +1473,10 @@ static int s5k5baf_set_selection(struct v4l2_subdev *sd,
>  	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		rects = (struct v4l2_rect * []) {
>  				&s5k5baf_cis_rect,
> -				v4l2_subdev_get_try_crop(sd, sd_state,
> -							 PAD_CIS),
> -				v4l2_subdev_get_try_compose(sd, sd_state,
> -							    PAD_CIS),
> -				v4l2_subdev_get_try_crop(sd, sd_state,
> -							 PAD_OUT)
> +				v4l2_subdev_state_get_crop(sd_state, PAD_CIS),
> +				v4l2_subdev_state_get_compose(sd_state,
> +							      PAD_CIS),

A single line would be more readable I think.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +				v4l2_subdev_state_get_crop(sd_state, PAD_OUT)
>  			};
>  		s5k5baf_set_rect_and_adjust(rects, rtype, &sel->r);
>  		return 0;
> diff --git b/drivers/media/platform/samsung/s3c-camif/camif-capture.c a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> index 295e083f38e8..be58260ea67e 100644
> --- b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> +++ a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
> @@ -1216,7 +1216,7 @@ static int s3c_camif_subdev_get_fmt(struct v4l2_subdev *sd,
>  	struct v4l2_mbus_framefmt *mf = &fmt->format;
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> +		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>  		fmt->format = *mf;
>  		return 0;
>  	}
> @@ -1305,7 +1305,7 @@ static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
>  	__camif_subdev_try_format(camif, mf, fmt->pad);
> 
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
> +		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>  		*mf = fmt->format;
>  		mutex_unlock(&camif->lock);
>  		return 0;
> diff --git b/drivers/media/platform/ti/cal/cal-camerarx.c a/drivers/media/platform/ti/cal/cal-camerarx.c
> index cea454ed9c20..61433744c6c4 100644
> --- b/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ a/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -621,8 +621,6 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
>  					  struct v4l2_subdev_state *state,
>  					  struct v4l2_subdev_mbus_code_enum *code)
>  {
> -	struct cal_camerarx *phy = to_cal_camerarx(sd);
> -
>  	/* No transcoding, source and sink codes must match. */
>  	if (cal_rx_pad_is_source(code->pad)) {
>  		struct v4l2_mbus_framefmt *fmt;
> diff --git b/drivers/staging/media/imx/imx-ic-prp.c a/drivers/staging/media/imx/imx-ic-prp.c
> index dd558fac6477..61d69f19657e 100644
> --- b/drivers/staging/media/imx/imx-ic-prp.c
> +++ a/drivers/staging/media/imx/imx-ic-prp.c
> @@ -82,8 +82,6 @@ static struct v4l2_mbus_framefmt *
>  __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
>  	      unsigned int pad, enum v4l2_subdev_format_whence which)
>  {
> -	struct imx_ic_priv *ic_priv = priv->ic_priv;
> -
>  	if (which == V4L2_SUBDEV_FORMAT_TRY)
>  		return v4l2_subdev_state_get_format(sd_state, pad);
>  	else
> diff --git b/drivers/staging/media/imx/imx-ic-prpencvf.c a/drivers/staging/media/imx/imx-ic-prpencvf.c
> index 02db7dbb884b..ec73c901079e 100644
> --- b/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ a/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -790,8 +790,6 @@ static struct v4l2_mbus_framefmt *
>  __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
>  	      unsigned int pad, enum v4l2_subdev_format_whence which)
>  {
> -	struct imx_ic_priv *ic_priv = priv->ic_priv;
> -
>  	if (which == V4L2_SUBDEV_FORMAT_TRY)
>  		return v4l2_subdev_state_get_format(sd_state, pad);
>  	else
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/adv7180.c                   |   4 +-
>  drivers/media/i2c/adv748x/adv748x-afe.c       |   6 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      |   2 +-
>  drivers/media/i2c/adv748x/adv748x-hdmi.c      |   6 +-
>  drivers/media/i2c/adv7511-v4l2.c              |   4 +-
>  drivers/media/i2c/adv7604.c                   |   4 +-
>  drivers/media/i2c/adv7842.c                   |   4 +-
>  drivers/media/i2c/ar0521.c                    |   5 +-
>  drivers/media/i2c/ccs/ccs-core.c              |  22 ++--
>  drivers/media/i2c/et8ek8/et8ek8_driver.c      |   3 +-
>  drivers/media/i2c/hi556.c                     |  13 +--
>  drivers/media/i2c/hi846.c                     |  11 +-
>  drivers/media/i2c/hi847.c                     |   9 +-
>  drivers/media/i2c/imx208.c                    |   9 +-
>  drivers/media/i2c/imx214.c                    |   4 +-
>  drivers/media/i2c/imx219.c                    |  12 +-
>  drivers/media/i2c/imx258.c                    |   9 +-
>  drivers/media/i2c/imx290.c                    |   8 +-
>  drivers/media/i2c/imx296.c                    |  18 +--
>  drivers/media/i2c/imx319.c                    |   7 +-
>  drivers/media/i2c/imx334.c                    |   4 +-
>  drivers/media/i2c/imx335.c                    |   4 +-
>  drivers/media/i2c/imx355.c                    |   7 +-
>  drivers/media/i2c/imx412.c                    |   4 +-
>  drivers/media/i2c/imx415.c                    |   6 +-
>  drivers/media/i2c/isl7998x.c                  |   6 +-
>  drivers/media/i2c/max9286.c                   |   4 +-
>  drivers/media/i2c/mt9m001.c                   |   4 +-
>  drivers/media/i2c/mt9m111.c                   |   4 +-
>  drivers/media/i2c/mt9m114.c                   |  58 +++++-----
>  drivers/media/i2c/mt9p031.c                   |   6 +-
>  drivers/media/i2c/mt9v032.c                   |  10 +-
>  drivers/media/i2c/mt9v111.c                   |   2 +-
>  drivers/media/i2c/og01a1b.c                   |  10 +-
>  drivers/media/i2c/ov01a10.c                   |   2 +-
>  drivers/media/i2c/ov02a10.c                   |   6 +-
>  drivers/media/i2c/ov08d10.c                   |   9 +-
>  drivers/media/i2c/ov08x40.c                   |   7 +-
>  drivers/media/i2c/ov13858.c                   |  10 +-
>  drivers/media/i2c/ov13b10.c                   |  10 +-
>  drivers/media/i2c/ov2640.c                    |   4 +-
>  drivers/media/i2c/ov2659.c                    |   6 +-
>  drivers/media/i2c/ov2680.c                    |   6 +-
>  drivers/media/i2c/ov2685.c                    |   4 +-
>  drivers/media/i2c/ov2740.c                    |   4 +-
>  drivers/media/i2c/ov4689.c                    |   2 +-
>  drivers/media/i2c/ov5640.c                    |   9 +-
>  drivers/media/i2c/ov5645.c                    |   4 +-
>  drivers/media/i2c/ov5647.c                    |  12 +-
>  drivers/media/i2c/ov5648.c                    |   6 +-
>  drivers/media/i2c/ov5670.c                    |  13 +--
>  drivers/media/i2c/ov5675.c                    |   9 +-
>  drivers/media/i2c/ov5693.c                    |   4 +-
>  drivers/media/i2c/ov5695.c                    |   8 +-
>  drivers/media/i2c/ov7251.c                    |   4 +-
>  drivers/media/i2c/ov7670.c                    |   7 +-
>  drivers/media/i2c/ov7740.c                    |   7 +-
>  drivers/media/i2c/ov8856.c                    |   9 +-
>  drivers/media/i2c/ov8858.c                    |   6 +-
>  drivers/media/i2c/ov8865.c                    |   8 +-
>  drivers/media/i2c/ov9282.c                    |   6 +-
>  drivers/media/i2c/ov9650.c                    |   7 +-
>  drivers/media/i2c/ov9734.c                    |   9 +-
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  37 +++----
>  drivers/media/i2c/s5k5baf.c                   |  32 +++---
>  drivers/media/i2c/s5k6a3.c                    |   8 +-
>  drivers/media/i2c/st-mipid02.c                |  11 +-
>  drivers/media/i2c/st-vgxy61.c                 |   5 +-
>  drivers/media/i2c/tc358746.c                  |  12 +-
>  drivers/media/i2c/tda1997x.c                  |   6 +-
>  drivers/media/i2c/tvp5150.c                   |   2 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  10 +-
>  drivers/media/pci/intel/ivsc/mei_csi.c        |   4 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |   4 +-
>  drivers/media/platform/cadence/cdns-csi2tx.c  |   3 +-
>  .../platform/microchip/microchip-csi2dc.c     |  15 ++-
>  .../platform/microchip/microchip-isc-scaler.c |  16 +--
>  drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
>  drivers/media/platform/nxp/imx7-media-csi.c   |  16 +--
>  .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  18 +--
>  .../platform/nxp/imx8-isi/imx8-isi-video.c    |   2 +-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  13 ++-
>  .../media/platform/qcom/camss/camss-csid.c    |   3 +-
>  .../media/platform/qcom/camss/camss-csiphy.c  |   3 +-
>  .../media/platform/qcom/camss/camss-ispif.c   |   3 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c |  10 +-
>  drivers/media/platform/renesas/rcar-isp.c     |   4 +-
>  .../platform/renesas/rcar-vin/rcar-csi2.c     |   4 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   6 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |   6 +-
>  .../media/platform/renesas/vsp1/vsp1_brx.c    |   2 +-
>  .../media/platform/renesas/vsp1/vsp1_entity.c |   8 +-
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   |   3 +-
>  .../platform/rockchip/rkisp1/rkisp1-csi.c     |  16 ++-
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 103 +++++++++---------
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  53 ++++-----
>  .../samsung/exynos4-is/fimc-capture.c         |  12 +-
>  .../platform/samsung/exynos4-is/fimc-isp.c    |  24 ++--
>  .../platform/samsung/exynos4-is/fimc-lite.c   |  16 ++-
>  .../platform/samsung/exynos4-is/mipi-csis.c   |   3 +-
>  .../samsung/s3c-camif/camif-capture.c         |   8 +-
>  .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   8 +-
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   8 +-
>  .../sun8i_a83t_mipi_csi2.c                    |   8 +-
>  drivers/media/platform/ti/cal/cal-camerarx.c  |  18 ++-
>  drivers/media/platform/ti/cal/cal-video.c     |   2 +-
>  drivers/media/platform/ti/omap3isp/ispccdc.c  |   7 +-
>  drivers/media/platform/ti/omap3isp/ispccp2.c  |   3 +-
>  drivers/media/platform/ti/omap3isp/ispcsi2.c  |   3 +-
>  .../media/platform/ti/omap3isp/isppreview.c   |   6 +-
>  .../media/platform/ti/omap3isp/ispresizer.c   |   5 +-
>  drivers/media/platform/video-mux.c            |  18 +--
>  .../media/platform/xilinx/xilinx-csi2rxss.c   |   5 +-
>  drivers/media/platform/xilinx/xilinx-tpg.c    |   9 +-
>  drivers/media/platform/xilinx/xilinx-vip.c    |   4 +-
>  .../media/test-drivers/vimc/vimc-debayer.c    |  10 +-
>  drivers/media/test-drivers/vimc/vimc-scaler.c |   9 +-
>  drivers/media/test-drivers/vimc/vimc-sensor.c |   6 +-
>  .../media/atomisp/i2c/atomisp-gc0310.c        |   2 +-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |   3 +-
>  .../media/atomisp/pci/atomisp_subdev.c        |   6 +-
>  drivers/staging/media/imx/imx-ic-prp.c        |   4 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |   4 +-
>  drivers/staging/media/imx/imx-media-csi.c     |   8 +-
>  drivers/staging/media/imx/imx-media-utils.c   |   2 +-
>  drivers/staging/media/imx/imx-media-vdic.c    |   2 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +-
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |  14 +--
>  drivers/staging/media/omap4iss/iss_csi2.c     |   3 +-
>  drivers/staging/media/omap4iss/iss_ipipe.c    |   3 +-
>  drivers/staging/media/omap4iss/iss_ipipeif.c  |   3 +-
>  drivers/staging/media/omap4iss/iss_resizer.c  |   3 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   8 +-
>  134 files changed, 555 insertions(+), 647 deletions(-)

[snip]

-- 
Regards,

Laurent Pinchart
