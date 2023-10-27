Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1C87D9482
	for <lists+linux-media@lfdr.de>; Fri, 27 Oct 2023 11:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345711AbjJ0J7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Oct 2023 05:59:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345698AbjJ0J7f (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Oct 2023 05:59:35 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B45C710E
        for <linux-media@vger.kernel.org>; Fri, 27 Oct 2023 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698400768; x=1729936768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n1FJhCSjAX9OLla/z36KzCV4wTw/aSqFl8qTaisaGSo=;
  b=VIF64V2ZGXUEJEc9cgvM5CxJwu9oCt9I1d1IrfwOWrwkuxNjWj6p5DLi
   ugK9v34ZS/twuHFcsf9q8y4gVR972JONun3c+a7ycGJe6nXmF8j83baPj
   UNKNhzrID/uLDtLRQUXJ1o5PldBknrfTib8fxkjdrKUrUHAGcw9wfHg32
   J4gQgsET29+B8askNzzqQiy8ngjN8IrpOejv83/aHdACJHYw9uyrzSsFe
   sURbhfxfXozj7lb1SGCNALfR1RrJhYE1DEDRxO9+/hfheF0A4LqCf2WdC
   O6DHNbTzb368wVNoPMUDtUb1T8KUpme3JEq46EIpdsKQ1CI/TwkN5rA5H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="473986703"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="473986703"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="7179902"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:58:01 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id B87C711F82E;
        Fri, 27 Oct 2023 12:59:20 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v5 6/8] media: v4l: subdev: Switch to stream-aware state functions
Date:   Fri, 27 Oct 2023 12:59:11 +0300
Message-Id: <20231027095913.1010187-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231027095913.1010187-1-sakari.ailus@linux.intel.com>
References: <20231027095913.1010187-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Switch all drivers accessing sub-device state to use the stream-aware
functions. We will soon remove the old ones.

This patch has been generated using the following Coccinelle script:

---------8<------------
@@
expression E1, E2, E3;

@@

- v4l2_subdev_get_pad_format(E1, E2, E3)
+ v4l2_subdev_state_get_format(E2, E3)

@@
expression E1, E2, E3;

@@

- v4l2_subdev_get_pad_crop(E1, E2, E3)
+ v4l2_subdev_state_get_crop(E2, E3)

@@
expression E1, E2, E3;

@@

- v4l2_subdev_get_pad_compose(E1, E2, E3)
+ v4l2_subdev_state_get_compose(E2, E3)

@@
expression E1, E2, E3;

@@

- v4l2_subdev_get_try_format(E1, E2, E3)
+ v4l2_subdev_state_get_format(E2, E3)

@@
expression E1, E2, E3;

@@

- v4l2_subdev_get_try_crop(E1, E2, E3)
+ v4l2_subdev_state_get_crop(E2, E3)

@@
expression E1, E2, E3;

@@

- v4l2_subdev_get_try_compose(E1, E2, E3)
+ v4l2_subdev_state_get_compose(E2, E3)
---------8<------------

Additionally drivers/media/i2c/s5k5baf.c and
drivers/media/platform/samsung/s3c-camif/camif-capture.c have been
manually changed as Coccinelle didn't. Further local variables have been
removed as they became unused as a result of the other changes. The diff
from Coccinelle-generated changes are:

> diff --git b/drivers/media/i2c/imx319.c a/drivers/media/i2c/imx319.c
> index e549692ff478..420984382173 100644
> --- b/drivers/media/i2c/imx319.c
> +++ a/drivers/media/i2c/imx319.c
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
> diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
> index 67da2045f543..03ccfb0e1e11 100644
> --- a/drivers/media/i2c/s5k5baf.c
> +++ b/drivers/media/i2c/s5k5baf.c
> @@ -1472,14 +1472,11 @@ static int s5k5baf_set_selection(struct v4l2_subdev *sd,
>
>  	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
>  		rects = (struct v4l2_rect * []) {
> -				&s5k5baf_cis_rect,
> -				v4l2_subdev_get_try_crop(sd, sd_state,
> -							 PAD_CIS),
> -				v4l2_subdev_get_try_compose(sd, sd_state,
> -							    PAD_CIS),
> -				v4l2_subdev_get_try_crop(sd, sd_state,
> -							 PAD_OUT)
> -			};
> +			&s5k5baf_cis_rect,
> +			v4l2_subdev_state_get_crop(sd_state, PAD_CIS),
> +			v4l2_subdev_state_get_compose(sd_state, PAD_CIS),
> +			v4l2_subdev_state_get_crop(sd_state, PAD_OUT)
> +		};
>  		s5k5baf_set_rect_and_adjust(rects, rtype, &sel->r);
>  		return 0;
>  	}
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

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv7180.c                   |   4 +-
 drivers/media/i2c/adv748x/adv748x-afe.c       |   6 +-
 drivers/media/i2c/adv748x/adv748x-csi2.c      |   2 +-
 drivers/media/i2c/adv748x/adv748x-hdmi.c      |   6 +-
 drivers/media/i2c/adv7511-v4l2.c              |   4 +-
 drivers/media/i2c/adv7604.c                   |   4 +-
 drivers/media/i2c/adv7842.c                   |   4 +-
 drivers/media/i2c/ar0521.c                    |   5 +-
 drivers/media/i2c/ccs/ccs-core.c              |  22 ++--
 drivers/media/i2c/et8ek8/et8ek8_driver.c      |   3 +-
 drivers/media/i2c/hi556.c                     |  13 +--
 drivers/media/i2c/hi846.c                     |  11 +-
 drivers/media/i2c/hi847.c                     |   9 +-
 drivers/media/i2c/imx208.c                    |   9 +-
 drivers/media/i2c/imx214.c                    |   4 +-
 drivers/media/i2c/imx219.c                    |  12 +-
 drivers/media/i2c/imx258.c                    |   9 +-
 drivers/media/i2c/imx290.c                    |   8 +-
 drivers/media/i2c/imx296.c                    |  18 +--
 drivers/media/i2c/imx319.c                    |   7 +-
 drivers/media/i2c/imx334.c                    |   4 +-
 drivers/media/i2c/imx335.c                    |   4 +-
 drivers/media/i2c/imx355.c                    |   7 +-
 drivers/media/i2c/imx412.c                    |   4 +-
 drivers/media/i2c/imx415.c                    |   6 +-
 drivers/media/i2c/isl7998x.c                  |   6 +-
 drivers/media/i2c/max9286.c                   |   4 +-
 drivers/media/i2c/mt9m001.c                   |   4 +-
 drivers/media/i2c/mt9m111.c                   |   4 +-
 drivers/media/i2c/mt9m114.c                   |  58 +++++-----
 drivers/media/i2c/mt9p031.c                   |   6 +-
 drivers/media/i2c/mt9v032.c                   |  10 +-
 drivers/media/i2c/mt9v111.c                   |   2 +-
 drivers/media/i2c/og01a1b.c                   |  10 +-
 drivers/media/i2c/ov01a10.c                   |   2 +-
 drivers/media/i2c/ov02a10.c                   |   6 +-
 drivers/media/i2c/ov08d10.c                   |   9 +-
 drivers/media/i2c/ov08x40.c                   |   7 +-
 drivers/media/i2c/ov13858.c                   |  10 +-
 drivers/media/i2c/ov13b10.c                   |  10 +-
 drivers/media/i2c/ov2640.c                    |   4 +-
 drivers/media/i2c/ov2659.c                    |   6 +-
 drivers/media/i2c/ov2680.c                    |   6 +-
 drivers/media/i2c/ov2685.c                    |   4 +-
 drivers/media/i2c/ov2740.c                    |   4 +-
 drivers/media/i2c/ov4689.c                    |   2 +-
 drivers/media/i2c/ov5640.c                    |   9 +-
 drivers/media/i2c/ov5645.c                    |   4 +-
 drivers/media/i2c/ov5647.c                    |  12 +-
 drivers/media/i2c/ov5648.c                    |   6 +-
 drivers/media/i2c/ov5670.c                    |  13 +--
 drivers/media/i2c/ov5675.c                    |   9 +-
 drivers/media/i2c/ov5693.c                    |   4 +-
 drivers/media/i2c/ov5695.c                    |   8 +-
 drivers/media/i2c/ov7251.c                    |   4 +-
 drivers/media/i2c/ov7670.c                    |   7 +-
 drivers/media/i2c/ov7740.c                    |   7 +-
 drivers/media/i2c/ov8856.c                    |   9 +-
 drivers/media/i2c/ov8858.c                    |   6 +-
 drivers/media/i2c/ov8865.c                    |   8 +-
 drivers/media/i2c/ov9282.c                    |   6 +-
 drivers/media/i2c/ov9650.c                    |   7 +-
 drivers/media/i2c/ov9734.c                    |   9 +-
 drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  37 +++----
 drivers/media/i2c/s5k5baf.c                   |  35 +++---
 drivers/media/i2c/s5k6a3.c                    |   8 +-
 drivers/media/i2c/st-mipid02.c                |  11 +-
 drivers/media/i2c/st-vgxy61.c                 |   5 +-
 drivers/media/i2c/tc358746.c                  |  12 +-
 drivers/media/i2c/tda1997x.c                  |   6 +-
 drivers/media/i2c/tvp5150.c                   |   2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  10 +-
 drivers/media/pci/intel/ivsc/mei_csi.c        |   4 +-
 drivers/media/platform/cadence/cdns-csi2rx.c  |   4 +-
 drivers/media/platform/cadence/cdns-csi2tx.c  |   3 +-
 .../platform/microchip/microchip-csi2dc.c     |  15 ++-
 .../platform/microchip/microchip-isc-scaler.c |  16 +--
 drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
 drivers/media/platform/nxp/imx7-media-csi.c   |  16 +--
 .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  18 +--
 .../platform/nxp/imx8-isi/imx8-isi-video.c    |   2 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  13 ++-
 .../media/platform/qcom/camss/camss-csid.c    |   3 +-
 .../media/platform/qcom/camss/camss-csiphy.c  |   3 +-
 .../media/platform/qcom/camss/camss-ispif.c   |   3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |  10 +-
 drivers/media/platform/renesas/rcar-isp.c     |   4 +-
 .../platform/renesas/rcar-vin/rcar-csi2.c     |   4 +-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   6 +-
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |   6 +-
 .../media/platform/renesas/vsp1/vsp1_brx.c    |   2 +-
 .../media/platform/renesas/vsp1/vsp1_entity.c |   8 +-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   |   3 +-
 .../platform/rockchip/rkisp1/rkisp1-csi.c     |  16 ++-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 103 +++++++++---------
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  53 ++++-----
 .../samsung/exynos4-is/fimc-capture.c         |  12 +-
 .../platform/samsung/exynos4-is/fimc-isp.c    |  24 ++--
 .../platform/samsung/exynos4-is/fimc-lite.c   |  16 ++-
 .../platform/samsung/exynos4-is/mipi-csis.c   |   3 +-
 .../samsung/s3c-camif/camif-capture.c         |   8 +-
 .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   8 +-
 .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
 .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   8 +-
 .../sun8i_a83t_mipi_csi2.c                    |   8 +-
 drivers/media/platform/ti/cal/cal-camerarx.c  |  18 ++-
 drivers/media/platform/ti/cal/cal-video.c     |   2 +-
 drivers/media/platform/ti/omap3isp/ispccdc.c  |   7 +-
 drivers/media/platform/ti/omap3isp/ispccp2.c  |   3 +-
 drivers/media/platform/ti/omap3isp/ispcsi2.c  |   3 +-
 .../media/platform/ti/omap3isp/isppreview.c   |   6 +-
 .../media/platform/ti/omap3isp/ispresizer.c   |   5 +-
 drivers/media/platform/video-mux.c            |  18 +--
 .../media/platform/xilinx/xilinx-csi2rxss.c   |   5 +-
 drivers/media/platform/xilinx/xilinx-tpg.c    |   9 +-
 drivers/media/platform/xilinx/xilinx-vip.c    |   4 +-
 .../media/test-drivers/vimc/vimc-debayer.c    |  10 +-
 drivers/media/test-drivers/vimc/vimc-scaler.c |   9 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c |   6 +-
 .../media/atomisp/i2c/atomisp-gc0310.c        |   2 +-
 .../staging/media/atomisp/pci/atomisp_csi2.c  |   3 +-
 .../media/atomisp/pci/atomisp_subdev.c        |   6 +-
 drivers/staging/media/imx/imx-ic-prp.c        |   4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   4 +-
 drivers/staging/media/imx/imx-media-csi.c     |   8 +-
 drivers/staging/media/imx/imx-media-utils.c   |   2 +-
 drivers/staging/media/imx/imx-media-vdic.c    |   2 +-
 drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c        |  14 +--
 drivers/staging/media/omap4iss/iss_csi2.c     |   3 +-
 drivers/staging/media/omap4iss/iss_ipipe.c    |   3 +-
 drivers/staging/media/omap4iss/iss_ipipeif.c  |   3 +-
 drivers/staging/media/omap4iss/iss_resizer.c  |   3 +-
 .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   8 +-
 134 files changed, 556 insertions(+), 649 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 54134473186b..444c322d756a 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -769,7 +769,7 @@ static int adv7180_get_pad_format(struct v4l2_subdev *sd,
 	struct adv7180_state *state = to_state(sd);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
 	} else {
 		adv7180_mbus_fmt(sd, &format->format);
 		format->format.field = state->field;
@@ -806,7 +806,7 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 			adv7180_set_power(state, true);
 		}
 	} else {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
 		*framefmt = format->format;
 	}
 
diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 00095c7762c2..50d9fbadbe38 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -354,8 +354,8 @@ static int adv748x_afe_get_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mbusformat = v4l2_subdev_get_try_format(sd, sd_state,
-							sdformat->pad);
+		mbusformat = v4l2_subdev_state_get_format(sd_state,
+							  sdformat->pad);
 		sdformat->format = *mbusformat;
 	} else {
 		adv748x_afe_fill_format(afe, &sdformat->format);
@@ -378,7 +378,7 @@ static int adv748x_afe_set_format(struct v4l2_subdev *sd,
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return adv748x_afe_get_format(sd, sd_state, sdformat);
 
-	mbusformat = v4l2_subdev_get_try_format(sd, sd_state, sdformat->pad);
+	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 	*mbusformat = sdformat->format;
 
 	return 0;
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index a5a7cb228896..5b265b722394 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -147,7 +147,7 @@ adv748x_csi2_get_pad_format(struct v4l2_subdev *sd,
 	struct adv748x_csi2 *tx = adv748x_sd_to_csi2(sd);
 
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 
 	return &tx->format;
 }
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index 400d71c2745c..ec151dc69c23 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -441,8 +441,8 @@ static int adv748x_hdmi_get_format(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mbusformat = v4l2_subdev_get_try_format(sd, sd_state,
-							sdformat->pad);
+		mbusformat = v4l2_subdev_state_get_format(sd_state,
+							  sdformat->pad);
 		sdformat->format = *mbusformat;
 	} else {
 		adv748x_hdmi_fill_format(hdmi, &sdformat->format);
@@ -464,7 +464,7 @@ static int adv748x_hdmi_set_format(struct v4l2_subdev *sd,
 	if (sdformat->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return adv748x_hdmi_get_format(sd, sd_state, sdformat);
 
-	mbusformat = v4l2_subdev_get_try_format(sd, sd_state, sdformat->pad);
+	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 	*mbusformat = sdformat->format;
 
 	return 0;
diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index a9183d9282fd..0f780eb6ef63 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1238,7 +1238,7 @@ static int adv7511_get_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		format->format.code = fmt->code;
 		format->format.colorspace = fmt->colorspace;
 		format->format.ycbcr_enc = fmt->ycbcr_enc;
@@ -1293,7 +1293,7 @@ static int adv7511_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		fmt->code = format->format.code;
 		fmt->colorspace = format->format.colorspace;
 		fmt->ycbcr_enc = format->format.ycbcr_enc;
diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
index b202a85fbeaa..810fa8826f30 100644
--- a/drivers/media/i2c/adv7604.c
+++ b/drivers/media/i2c/adv7604.c
@@ -1929,7 +1929,7 @@ static int adv76xx_get_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		format->format.code = fmt->code;
 	} else {
 		format->format.code = state->format->code;
@@ -1978,7 +1978,7 @@ static int adv76xx_set_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		fmt->code = format->format.code;
 	} else {
 		state->format = info;
diff --git a/drivers/media/i2c/adv7842.c b/drivers/media/i2c/adv7842.c
index c1664a3620c8..2ad0f9f5503d 100644
--- a/drivers/media/i2c/adv7842.c
+++ b/drivers/media/i2c/adv7842.c
@@ -2087,7 +2087,7 @@ static int adv7842_get_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		format->format.code = fmt->code;
 	} else {
 		format->format.code = state->format->code;
@@ -2119,7 +2119,7 @@ static int adv7842_set_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		fmt->code = format->format.code;
 	} else {
 		state->format = info;
diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
index 701f36345f1e..c7d5fa532ae1 100644
--- a/drivers/media/i2c/ar0521.c
+++ b/drivers/media/i2c/ar0521.c
@@ -446,8 +446,7 @@ static int ar0521_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&sensor->lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state, 0
-						 /* pad */);
+		fmt = v4l2_subdev_state_get_format(sd_state, 0);
 	else
 		fmt = &sensor->fmt;
 
@@ -472,7 +471,7 @@ static int ar0521_set_fmt(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, 0 /* pad */);
+		fmt = v4l2_subdev_state_get_format(sd_state, 0);
 		*fmt = format->format;
 
 		mutex_unlock(&sensor->lock);
diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 12e6f0a26fc8..61280d0b80fa 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2030,7 +2030,7 @@ static int __ccs_get_format(struct v4l2_subdev *subdev,
 			    struct v4l2_subdev_state *sd_state,
 			    struct v4l2_subdev_format *fmt)
 {
-	fmt->format = *v4l2_subdev_get_pad_format(subdev, sd_state, fmt->pad);
+	fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	fmt->format.code = __ccs_get_mbus_code(subdev, fmt->pad);
 
 	return 0;
@@ -2061,10 +2061,10 @@ static void ccs_get_crop_compose(struct v4l2_subdev *subdev,
 	if (crops)
 		for (i = 0; i < subdev->entity.num_pads; i++)
 			crops[i] =
-				v4l2_subdev_get_pad_crop(subdev, sd_state, i);
+				v4l2_subdev_state_get_crop(sd_state, i);
 	if (comps)
-		*comps = v4l2_subdev_get_pad_compose(subdev, sd_state,
-						     ssd->sink_pad);
+		*comps = v4l2_subdev_state_get_compose(sd_state,
+						       ssd->sink_pad);
 }
 
 /* Changes require propagation only on sink pad. */
@@ -2097,7 +2097,7 @@ static void ccs_propagate(struct v4l2_subdev *subdev,
 		fallthrough;
 	case V4L2_SEL_TGT_COMPOSE:
 		*crops[CCS_PAD_SRC] = *comp;
-		fmt = v4l2_subdev_get_pad_format(subdev, sd_state, CCS_PAD_SRC);
+		fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
 		fmt->width = comp->width;
 		fmt->height = comp->height;
 		if (which == V4L2_SUBDEV_FORMAT_ACTIVE && ssd == sensor->src)
@@ -2507,7 +2507,7 @@ static int ccs_set_crop(struct v4l2_subdev *subdev,
 
 	if (sel->pad == ssd->sink_pad) {
 		struct v4l2_mbus_framefmt *mfmt =
-			v4l2_subdev_get_pad_format(subdev, sd_state, sel->pad);
+			v4l2_subdev_state_get_format(sd_state, sel->pad);
 
 		src_size.width = mfmt->width;
 		src_size.height = mfmt->height;
@@ -2567,8 +2567,8 @@ static int ccs_get_selection(struct v4l2_subdev *subdev,
 			ccs_get_native_size(ssd, &sel->r);
 		} else if (sel->pad == ssd->sink_pad) {
 			struct v4l2_mbus_framefmt *sink_fmt =
-				v4l2_subdev_get_pad_format(subdev, sd_state,
-							   ssd->sink_pad);
+				v4l2_subdev_state_get_format(sd_state,
+							     ssd->sink_pad);
 			sel->r.top = sel->r.left = 0;
 			sel->r.width = sink_fmt->width;
 			sel->r.height = sink_fmt->height;
@@ -3012,9 +3012,9 @@ static int ccs_init_cfg(struct v4l2_subdev *sd,
 	unsigned int pad = ssd == sensor->pixel_array ?
 		CCS_PA_PAD_SRC : CCS_PAD_SINK;
 	struct v4l2_mbus_framefmt *fmt =
-		v4l2_subdev_get_pad_format(sd, sd_state, pad);
+		v4l2_subdev_state_get_format(sd_state, pad);
 	struct v4l2_rect *crop =
-		v4l2_subdev_get_pad_crop(sd, sd_state, pad);
+		v4l2_subdev_state_get_crop(sd_state, pad);
 	bool is_active = !sd->active_state || sd->active_state == sd_state;
 
 	mutex_lock(&sensor->mutex);
@@ -3034,7 +3034,7 @@ static int ccs_init_cfg(struct v4l2_subdev *sd,
 		return 0;
 	}
 
-	fmt = v4l2_subdev_get_pad_format(sd, sd_state, CCS_PAD_SRC);
+	fmt = v4l2_subdev_state_get_format(sd_state, CCS_PAD_SRC);
 	fmt->code = ssd == sensor->src ?
 		sensor->csi_format->code : sensor->internal_csi_format->code;
 	fmt->field = V4L2_FIELD_NONE;
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index d6fc843f9368..63616dc5a02f 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -995,8 +995,7 @@ __et8ek8_get_pad_format(struct et8ek8_sensor *sensor,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&sensor->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &sensor->format;
 	default:
diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index f6ea9b7b9700..38c77d515786 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -935,7 +935,7 @@ __hi556_get_pad_crop(struct hi556 *hi556,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&hi556->sd, sd_state, pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &hi556->cur_mode->crop;
 	}
@@ -1075,7 +1075,7 @@ static int hi556_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&hi556->mutex);
 	hi556_assign_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		hi556->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(hi556->link_freq, mode->link_freq_index);
@@ -1109,9 +1109,8 @@ static int hi556_get_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&hi556->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&hi556->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		hi556_assign_pad_format(hi556->cur_mode, &fmt->format);
 
@@ -1157,10 +1156,10 @@ static int hi556_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&hi556->mutex);
 	hi556_assign_pad_format(&supported_modes[0],
-				v4l2_subdev_get_try_format(sd, fh->state, 0));
+				v4l2_subdev_state_get_format(fh->state, 0));
 
 	/* Initialize try_crop rectangle. */
-	try_crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
+	try_crop = v4l2_subdev_state_get_crop(fh->state, 0);
 	try_crop->top = HI556_PIXEL_ARRAY_TOP;
 	try_crop->left = HI556_PIXEL_ARRAY_LEFT;
 	try_crop->width = HI556_PIXEL_ARRAY_WIDTH;
diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 825fc8dc48f5..0595080c2211 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1705,7 +1705,7 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	}
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = *mf;
+		*v4l2_subdev_state_get_format(sd_state, format->pad) = *mf;
 		return 0;
 	}
 
@@ -1783,9 +1783,8 @@ static int hi846_get_format(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format->format = *v4l2_subdev_get_try_format(&hi846->sd,
-							sd_state,
-							format->pad);
+		format->format = *v4l2_subdev_state_get_format(sd_state,
+							       format->pad);
 		return 0;
 	}
 
@@ -1852,7 +1851,7 @@ static int hi846_get_selection(struct v4l2_subdev *sd,
 		mutex_lock(&hi846->mutex);
 		switch (sel->which) {
 		case V4L2_SUBDEV_FORMAT_TRY:
-			v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
+			v4l2_subdev_state_get_crop(sd_state, sel->pad);
 			break;
 		case V4L2_SUBDEV_FORMAT_ACTIVE:
 			sel->r = hi846->cur_mode->crop;
@@ -1878,7 +1877,7 @@ static int hi846_init_cfg(struct v4l2_subdev *sd,
 	struct hi846 *hi846 = to_hi846(sd);
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
+	mf = v4l2_subdev_state_get_format(sd_state, 0);
 
 	mutex_lock(&hi846->mutex);
 	mf->code        = HI846_MEDIA_BUS_FORMAT;
diff --git a/drivers/media/i2c/hi847.c b/drivers/media/i2c/hi847.c
index 4075c389804c..72c60747a839 100644
--- a/drivers/media/i2c/hi847.c
+++ b/drivers/media/i2c/hi847.c
@@ -2655,7 +2655,7 @@ static int hi847_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&hi847->mutex);
 	hi847_assign_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) =
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =
 			fmt->format;
 	} else {
 		hi847->cur_mode = mode;
@@ -2690,9 +2690,8 @@ static int hi847_get_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&hi847->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&hi847->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		hi847_assign_pad_format(hi847->cur_mode, &fmt->format);
 
@@ -2737,7 +2736,7 @@ static int hi847_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&hi847->mutex);
 	hi847_assign_pad_format(&supported_modes[0],
-				v4l2_subdev_get_try_format(sd, fh->state, 0));
+				v4l2_subdev_state_get_format(fh->state, 0));
 	mutex_unlock(&hi847->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/imx208.c b/drivers/media/i2c/imx208.c
index a9b0aea1ae3b..639e05340dbb 100644
--- a/drivers/media/i2c/imx208.c
+++ b/drivers/media/i2c/imx208.c
@@ -395,7 +395,7 @@ static int imx208_write_regs(struct imx208 *imx208,
 static int imx208_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->state, 0);
+		v4l2_subdev_state_get_format(fh->state, 0);
 
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
@@ -548,9 +548,8 @@ static int __imx208_get_pad_format(struct imx208 *imx208,
 				   struct v4l2_subdev_format *fmt)
 {
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&imx208->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		imx208_mode_to_pad_format(imx208, imx208->cur_mode, fmt);
 
@@ -591,7 +590,7 @@ static int imx208_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	imx208_mode_to_pad_format(imx208, mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		imx208->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(imx208->link_freq, mode->link_freq_index);
diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index 4f77ea02cc27..8bc7b114c57d 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -538,7 +538,7 @@ __imx214_get_pad_format(struct imx214 *imx214,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&imx214->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &imx214->fmt;
 	default:
@@ -568,7 +568,7 @@ __imx214_get_pad_crop(struct imx214 *imx214,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&imx214->sd, sd_state, pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &imx214->crop;
 	default:
diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 8436880dcf7a..675795ac2e83 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -374,7 +374,7 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
 	int ret = 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx219->sd);
-	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
@@ -593,8 +593,8 @@ static int imx219_set_framefmt(struct imx219 *imx219,
 	u64 bin_h, bin_v;
 	int ret = 0;
 
-	format = v4l2_subdev_get_pad_format(&imx219->sd, state, 0);
-	crop = v4l2_subdev_get_pad_crop(&imx219->sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
 
 	switch (format->code) {
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
@@ -826,7 +826,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 
 	imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
 
-	format = v4l2_subdev_get_pad_format(sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 	*format = fmt->format;
 
 	/*
@@ -836,7 +836,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
 	bin_h = min(IMX219_PIXEL_ARRAY_WIDTH / format->width, 2U);
 	bin_v = min(IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
 
-	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
 	crop->width = format->width * bin_h;
 	crop->height = format->height * bin_v;
 	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
@@ -880,7 +880,7 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP: {
-		sel->r = *v4l2_subdev_get_pad_crop(sd, state, 0);
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
 		return 0;
 	}
 
diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index b3827f4bc0eb..a577afb530b7 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -708,7 +708,7 @@ static int imx258_write_regs(struct imx258 *imx258,
 static int imx258_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->state, 0);
+		v4l2_subdev_state_get_format(fh->state, 0);
 
 	/* Initialize try_fmt */
 	try_fmt->width = supported_modes[0].width;
@@ -862,9 +862,8 @@ static int __imx258_get_pad_format(struct imx258 *imx258,
 				   struct v4l2_subdev_format *fmt)
 {
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&imx258->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		imx258_update_pad_format(imx258->cur_mode, fmt);
 
@@ -908,7 +907,7 @@ static int imx258_set_pad_format(struct v4l2_subdev *sd,
 		fmt->format.width, fmt->format.height);
 	imx258_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		imx258->cur_mode = mode;
diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 29098612813c..aa8cfbcd40aa 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -758,7 +758,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	state = v4l2_subdev_get_locked_active_state(&imx290->sd);
-	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
@@ -994,7 +994,7 @@ static int imx290_start_streaming(struct imx290 *imx290,
 	}
 
 	/* Apply the register values related to current frame format */
-	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 	ret = imx290_setup_format(imx290, format);
 	if (ret < 0) {
 		dev_err(imx290->dev, "Could not set frame format - %d\n", ret);
@@ -1132,7 +1132,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 
-	format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
+	format = v4l2_subdev_state_get_format(sd_state, 0);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		imx290->current_mode = mode;
@@ -1155,7 +1155,7 @@ static int imx290_get_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP: {
-		format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
+		format = v4l2_subdev_state_get_format(sd_state, 0);
 
 		/*
 		 * The sensor moves the readout by 1 pixel based on flips to
diff --git a/drivers/media/i2c/imx296.c b/drivers/media/i2c/imx296.c
index 94aac9d2732f..8399cca496a7 100644
--- a/drivers/media/i2c/imx296.c
+++ b/drivers/media/i2c/imx296.c
@@ -323,7 +323,7 @@ static int imx296_s_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
-	format = v4l2_subdev_get_pad_format(&sensor->subdev, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
@@ -511,8 +511,8 @@ static int imx296_setup(struct imx296 *sensor, struct v4l2_subdev_state *state)
 	unsigned int i;
 	int ret = 0;
 
-	format = v4l2_subdev_get_pad_format(&sensor->subdev, state, 0);
-	crop = v4l2_subdev_get_pad_crop(&sensor->subdev, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
 
 	for (i = 0; i < ARRAY_SIZE(imx296_init_table); ++i)
 		imx296_write(sensor, imx296_init_table[i].reg,
@@ -662,7 +662,7 @@ static int imx296_enum_frame_size(struct v4l2_subdev *sd,
 {
 	const struct v4l2_mbus_framefmt *format;
 
-	format = v4l2_subdev_get_pad_format(sd, state, fse->pad);
+	format = v4l2_subdev_state_get_format(state, fse->pad);
 
 	if (fse->index >= 2 || fse->code != format->code)
 		return -EINVAL;
@@ -683,8 +683,8 @@ static int imx296_set_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	crop = v4l2_subdev_get_pad_crop(sd, state, fmt->pad);
-	format = v4l2_subdev_get_pad_format(sd, state, fmt->pad);
+	crop = v4l2_subdev_state_get_crop(state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	/*
 	 * Binning is only allowed when cropping is disabled according to the
@@ -732,7 +732,7 @@ static int imx296_get_selection(struct v4l2_subdev *sd,
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_get_pad_crop(sd, state, sel->pad);
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
 		break;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
@@ -780,14 +780,14 @@ static int imx296_set_selection(struct v4l2_subdev *sd,
 	rect.height = min_t(unsigned int, rect.height,
 			    IMX296_PIXEL_ARRAY_HEIGHT - rect.top);
 
-	crop = v4l2_subdev_get_pad_crop(sd, state, sel->pad);
+	crop = v4l2_subdev_state_get_crop(state, sel->pad);
 
 	if (rect.width != crop->width || rect.height != crop->height) {
 		/*
 		 * Reset the output image size if the crop rectangle size has
 		 * been modified.
 		 */
-		format = v4l2_subdev_get_pad_format(sd, state, sel->pad);
+		format = v4l2_subdev_state_get_format(state, sel->pad);
 		format->width = rect.width;
 		format->height = rect.height;
 	}
diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c
index 5378f607f340..420984382173 100644
--- a/drivers/media/i2c/imx319.c
+++ b/drivers/media/i2c/imx319.c
@@ -1860,7 +1860,7 @@ static int imx319_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct imx319 *imx319 = to_imx319(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->state, 0);
+		v4l2_subdev_state_get_format(fh->state, 0);
 
 	mutex_lock(&imx319->mutex);
 
@@ -2001,10 +2001,9 @@ static int imx319_do_get_pad_format(struct imx319 *imx319,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *framefmt;
-	struct v4l2_subdev *sd = &imx319->sd;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		imx319_update_pad_format(imx319, imx319->cur_mode, fmt);
@@ -2055,7 +2054,7 @@ imx319_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	imx319_update_pad_format(imx319, mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		imx319->cur_mode = mode;
diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 1196fe93506b..493a43b9fa36 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -879,7 +879,7 @@ static int imx334_get_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		fmt->format.code = imx334->cur_code;
@@ -920,7 +920,7 @@ static int imx334_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else if (imx334->cur_mode != mode || imx334->cur_code != fmt->format.code) {
 		imx334->cur_code = fmt->format.code;
diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index ec729126274b..eaa0e9c251ce 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -569,7 +569,7 @@ static int imx335_get_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		imx335_fill_pad_format(imx335, imx335->cur_mode, fmt);
@@ -604,7 +604,7 @@ static int imx335_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		ret = imx335_update_controls(imx335, mode);
diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 9c58c1a80cba..e1b1d2fc79dd 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1158,7 +1158,7 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct imx355 *imx355 = to_imx355(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->state, 0);
+		v4l2_subdev_state_get_format(fh->state, 0);
 
 	mutex_lock(&imx355->mutex);
 
@@ -1299,10 +1299,9 @@ static int imx355_do_get_pad_format(struct imx355 *imx355,
 				    struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *framefmt;
-	struct v4l2_subdev *sd = &imx355->sd;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		imx355_update_pad_format(imx355, imx355->cur_mode, fmt);
@@ -1353,7 +1352,7 @@ imx355_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	imx355_update_pad_format(imx355, mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		imx355->cur_mode = mode;
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 962b3136c31e..df6f84f81d1b 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -721,7 +721,7 @@ static int imx412_get_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		imx412_fill_pad_format(imx412, imx412->cur_mode, fmt);
@@ -756,7 +756,7 @@ static int imx412_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		ret = imx412_update_controls(imx412, mode);
diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index b3fa71a16839..6436a32c4025 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -546,7 +546,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	state = v4l2_subdev_get_locked_active_state(&sensor->subdev);
-	format = v4l2_subdev_get_pad_format(&sensor->subdev, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	switch (ctrl->id) {
 	case V4L2_CID_EXPOSURE:
@@ -828,7 +828,7 @@ static int imx415_enum_frame_size(struct v4l2_subdev *sd,
 {
 	const struct v4l2_mbus_framefmt *format;
 
-	format = v4l2_subdev_get_pad_format(sd, state, fse->pad);
+	format = v4l2_subdev_state_get_format(state, fse->pad);
 
 	if (fse->index > 0 || fse->code != format->code)
 		return -EINVAL;
@@ -846,7 +846,7 @@ static int imx415_set_format(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *format;
 
-	format = v4l2_subdev_get_pad_format(sd, state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	format->width = fmt->format.width;
 	format->height = fmt->format.height;
diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index 73460688c356..89e13ebbce0c 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1007,8 +1007,8 @@ static int isl7998x_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&isl7998x->lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state,
-							     format->pad);
+		format->format = *v4l2_subdev_state_get_format(sd_state,
+							       format->pad);
 		goto out;
 	}
 
@@ -1044,7 +1044,7 @@ static int isl7998x_set_fmt(struct v4l2_subdev *sd,
 	mf->field = mode->field;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = format->format;
+		*v4l2_subdev_state_get_format(sd_state, format->pad) = format->format;
 
 	mutex_unlock(&isl7998x->lock);
 
diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index fc1cf196ef01..ee11ae682d8d 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -913,7 +913,7 @@ max9286_get_pad_format(struct max9286_priv *priv,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &priv->fmt[pad];
 	default:
@@ -1020,7 +1020,7 @@ static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	unsigned int i;
 
 	for (i = 0; i < MAX9286_N_SINKS; i++) {
-		format = v4l2_subdev_get_try_format(subdev, fh->state, i);
+		format = v4l2_subdev_state_get_format(fh->state, i);
 		max9286_init_format(format);
 	}
 
diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 79192cf79d28..995edf641f11 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -325,7 +325,7 @@ static int mt9m001_get_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		mf = v4l2_subdev_state_get_format(sd_state, 0);
 		format->format = *mf;
 		return 0;
 	}
@@ -656,7 +656,7 @@ static int mt9m001_init_cfg(struct v4l2_subdev *sd,
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, sd_state, 0);
+		v4l2_subdev_state_get_format(sd_state, 0);
 
 	try_fmt->width		= MT9M001_MAX_WIDTH;
 	try_fmt->height		= MT9M001_MAX_HEIGHT;
diff --git a/drivers/media/i2c/mt9m111.c b/drivers/media/i2c/mt9m111.c
index 1f44b72e8a70..2d69275917d9 100644
--- a/drivers/media/i2c/mt9m111.c
+++ b/drivers/media/i2c/mt9m111.c
@@ -525,7 +525,7 @@ static int mt9m111_get_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, format->pad);
 		format->format = *mf;
 		return 0;
 	}
@@ -1115,7 +1115,7 @@ static int mt9m111_init_cfg(struct v4l2_subdev *sd,
 			    struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *format =
-		v4l2_subdev_get_try_format(sd, sd_state, 0);
+		v4l2_subdev_state_get_format(sd_state, 0);
 
 	format->width	= MT9M111_MAX_WIDTH;
 	format->height	= MT9M111_MAX_HEIGHT;
diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index ac19078ceda3..23cf84f1a746 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -796,13 +796,13 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	u64 read_mode;
 	int ret = 0;
 
-	pa_format = v4l2_subdev_get_pad_format(&sensor->pa.sd, pa_state, 0);
-	pa_crop = v4l2_subdev_get_pad_crop(&sensor->pa.sd, pa_state, 0);
+	pa_format = v4l2_subdev_state_get_format(pa_state, 0);
+	pa_crop = v4l2_subdev_state_get_crop(pa_state, 0);
 
-	ifp_format = v4l2_subdev_get_pad_format(&sensor->ifp.sd, ifp_state, 1);
+	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
 	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
-	ifp_crop = v4l2_subdev_get_pad_crop(&sensor->ifp.sd, ifp_state, 0);
-	ifp_compose = v4l2_subdev_get_pad_compose(&sensor->ifp.sd, ifp_state, 0);
+	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
+	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
 
 	ret = cci_read(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		       &read_mode, NULL);
@@ -1045,7 +1045,7 @@ static int mt9m114_pa_s_ctrl(struct v4l2_ctrl *ctrl)
 		return 0;
 
 	state = v4l2_subdev_get_locked_active_state(&sensor->pa.sd);
-	format = v4l2_subdev_get_pad_format(&sensor->pa.sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	switch (ctrl->id) {
 	case V4L2_CID_HBLANK:
@@ -1158,14 +1158,14 @@ static int mt9m114_pa_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
 
 	crop->left = 0;
 	crop->top = 0;
 	crop->width = MT9M114_PIXEL_ARRAY_WIDTH;
 	crop->height = MT9M114_PIXEL_ARRAY_HEIGHT;
 
-	format = v4l2_subdev_get_pad_format(sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	format->width = MT9M114_PIXEL_ARRAY_WIDTH;
 	format->height = MT9M114_PIXEL_ARRAY_HEIGHT;
@@ -1220,8 +1220,8 @@ static int mt9m114_pa_set_fmt(struct v4l2_subdev *sd,
 	unsigned int hscale;
 	unsigned int vscale;
 
-	crop = v4l2_subdev_get_pad_crop(sd, state, fmt->pad);
-	format = v4l2_subdev_get_pad_format(sd, state, fmt->pad);
+	crop = v4l2_subdev_state_get_crop(state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	/* The sensor can bin horizontally and vertically. */
 	hscale = DIV_ROUND_CLOSEST(crop->width, fmt->format.width ? : 1);
@@ -1243,7 +1243,7 @@ static int mt9m114_pa_get_selection(struct v4l2_subdev *sd,
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_get_pad_crop(sd, state, sel->pad);
+		sel->r = *v4l2_subdev_state_get_crop(state, sel->pad);
 		return 0;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
@@ -1271,8 +1271,8 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	crop = v4l2_subdev_get_pad_crop(sd, state, sel->pad);
-	format = v4l2_subdev_get_pad_format(sd, state, sel->pad);
+	crop = v4l2_subdev_state_get_crop(state, sel->pad);
+	format = v4l2_subdev_state_get_format(state, sel->pad);
 
 	/*
 	 * Clamp the crop rectangle. The vertical coordinates must be even, and
@@ -1402,7 +1402,7 @@ static int mt9m114_pa_init(struct mt9m114 *sensor)
 
 	/* Update the range of the blanking controls based on the format. */
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	format = v4l2_subdev_get_pad_format(sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 	mt9m114_pa_ctrl_update_blanking(sensor, format);
 	v4l2_subdev_unlock_state(state);
 
@@ -1632,7 +1632,7 @@ static int mt9m114_ifp_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_rect *crop;
 	struct v4l2_rect *compose;
 
-	format = v4l2_subdev_get_pad_format(sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	format->width = MT9M114_PIXEL_ARRAY_WIDTH;
 	format->height = MT9M114_PIXEL_ARRAY_HEIGHT;
@@ -1643,21 +1643,21 @@ static int mt9m114_ifp_init_cfg(struct v4l2_subdev *sd,
 	format->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 	format->xfer_func = V4L2_XFER_FUNC_NONE;
 
-	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
 
 	crop->left = 4;
 	crop->top = 4;
 	crop->width = format->width - 8;
 	crop->height = format->height - 8;
 
-	compose = v4l2_subdev_get_pad_compose(sd, state, 0);
+	compose = v4l2_subdev_state_get_compose(state, 0);
 
 	compose->left = 0;
 	compose->top = 0;
 	compose->width = crop->width;
 	compose->height = crop->height;
 
-	format = v4l2_subdev_get_pad_format(sd, state, 1);
+	format = v4l2_subdev_state_get_format(state, 1);
 
 	format->width = compose->width;
 	format->height = compose->height;
@@ -1738,7 +1738,7 @@ static int mt9m114_ifp_enum_framesizes(struct v4l2_subdev *sd,
 	} else {
 		const struct v4l2_rect *crop;
 
-		crop = v4l2_subdev_get_pad_crop(sd, state, 0);
+		crop = v4l2_subdev_state_get_crop(state, 0);
 
 		fse->max_width = crop->width;
 		fse->max_height = crop->height;
@@ -1777,7 +1777,7 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = ifp_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = v4l2_subdev_get_pad_format(sd, state, fmt->pad);
+	format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (fmt->pad == 0) {
 		/* Only the size can be changed on the sink pad. */
@@ -1797,7 +1797,7 @@ static int mt9m114_ifp_set_fmt(struct v4l2_subdev *sd,
 
 		/* If the output format is RAW10, bypass the scaler. */
 		if (format->code == MEDIA_BUS_FMT_SGRBG10_1X10)
-			*format = *v4l2_subdev_get_pad_format(sd, state, 0);
+			*format = *v4l2_subdev_state_get_format(state, 0);
 	}
 
 	fmt->format = *format;
@@ -1819,7 +1819,7 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_get_pad_crop(sd, state, 0);
+		sel->r = *v4l2_subdev_state_get_crop(state, 0);
 		break;
 
 	case V4L2_SEL_TGT_CROP_DEFAULT:
@@ -1828,7 +1828,7 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 		 * The crop default and bounds are equal to the sink
 		 * format size minus 4 pixels on each side for demosaicing.
 		 */
-		format = v4l2_subdev_get_pad_format(sd, state, 0);
+		format = v4l2_subdev_state_get_format(state, 0);
 
 		sel->r.left = 4;
 		sel->r.top = 4;
@@ -1837,7 +1837,7 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 		break;
 
 	case V4L2_SEL_TGT_COMPOSE:
-		sel->r = *v4l2_subdev_get_pad_compose(sd, state, 0);
+		sel->r = *v4l2_subdev_state_get_compose(state, 0);
 		break;
 
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
@@ -1846,7 +1846,7 @@ static int mt9m114_ifp_get_selection(struct v4l2_subdev *sd,
 		 * The compose default and bounds sizes are equal to the sink
 		 * crop rectangle size.
 		 */
-		crop = v4l2_subdev_get_pad_crop(sd, state, 0);
+		crop = v4l2_subdev_state_get_crop(state, 0);
 		sel->r.left = 0;
 		sel->r.top = 0;
 		sel->r.width = crop->width;
@@ -1877,9 +1877,9 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	if (sel->pad != 0)
 		return -EINVAL;
 
-	format = v4l2_subdev_get_pad_format(sd, state, 0);
-	crop = v4l2_subdev_get_pad_crop(sd, state, 0);
-	compose = v4l2_subdev_get_pad_compose(sd, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	compose = v4l2_subdev_state_get_compose(state, 0);
 
 	if (sel->target == V4L2_SEL_TGT_CROP) {
 		/*
@@ -1921,7 +1921,7 @@ static int mt9m114_ifp_set_selection(struct v4l2_subdev *sd,
 	}
 
 	/* Propagate the compose rectangle to the source format. */
-	format = v4l2_subdev_get_pad_format(sd, state, 1);
+	format = v4l2_subdev_state_get_format(state, 1);
 	format->width = compose->width;
 	format->height = compose->height;
 
diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 348f1e1098fb..89bcd48748b9 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -549,8 +549,7 @@ __mt9p031_get_pad_format(struct mt9p031 *mt9p031,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&mt9p031->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9p031->format;
 	default:
@@ -565,8 +564,7 @@ __mt9p031_get_pad_crop(struct mt9p031 *mt9p031,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&mt9p031->subdev, sd_state,
-						pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9p031->crop;
 	default:
diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
index 1c6f6cea1204..3ca76eeae7ff 100644
--- a/drivers/media/i2c/mt9v032.c
+++ b/drivers/media/i2c/mt9v032.c
@@ -356,8 +356,7 @@ __mt9v032_get_pad_format(struct mt9v032 *mt9v032,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&mt9v032->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9v032->format;
 	default:
@@ -372,8 +371,7 @@ __mt9v032_get_pad_crop(struct mt9v032 *mt9v032,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&mt9v032->subdev, sd_state,
-						pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9v032->crop;
 	default:
@@ -931,13 +929,13 @@ static int mt9v032_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	crop = v4l2_subdev_get_try_crop(subdev, fh->state, 0);
+	crop = v4l2_subdev_state_get_crop(fh->state, 0);
 	crop->left = MT9V032_COLUMN_START_DEF;
 	crop->top = MT9V032_ROW_START_DEF;
 	crop->width = MT9V032_WINDOW_WIDTH_DEF;
 	crop->height = MT9V032_WINDOW_HEIGHT_DEF;
 
-	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
+	format = v4l2_subdev_state_get_format(fh->state, 0);
 
 	if (mt9v032->model->color)
 		format->code = MEDIA_BUS_FMT_SGRBG10_1X10;
diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c
index f859b49e13bf..741145c8667d 100644
--- a/drivers/media/i2c/mt9v111.c
+++ b/drivers/media/i2c/mt9v111.c
@@ -795,7 +795,7 @@ static struct v4l2_mbus_framefmt *__mt9v111_get_pad_format(
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&mt9v111->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &mt9v111->fmt;
 	default:
diff --git a/drivers/media/i2c/og01a1b.c b/drivers/media/i2c/og01a1b.c
index 51378ba16a5d..bac9597faf68 100644
--- a/drivers/media/i2c/og01a1b.c
+++ b/drivers/media/i2c/og01a1b.c
@@ -769,8 +769,7 @@ static int og01a1b_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&og01a1b->mutex);
 	og01a1b_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state,
-					    fmt->pad) = fmt->format;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		og01a1b->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(og01a1b->link_freq, mode->link_freq_index);
@@ -803,9 +802,8 @@ static int og01a1b_get_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&og01a1b->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&og01a1b->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		og01a1b_update_pad_format(og01a1b->cur_mode, &fmt->format);
 
@@ -850,7 +848,7 @@ static int og01a1b_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&og01a1b->mutex);
 	og01a1b_update_pad_format(&supported_modes[0],
-				  v4l2_subdev_get_try_format(sd, fh->state, 0));
+				  v4l2_subdev_state_get_format(fh->state, 0));
 	mutex_unlock(&og01a1b->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index bbd5740d2280..c72280bb1f5b 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -723,7 +723,7 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 					 h_blank);
 	}
 
-	format = v4l2_subdev_get_pad_format(sd, sd_state, fmt->stream);
+	format = v4l2_subdev_state_get_format(sd_state, fmt->stream);
 	*format = fmt->format;
 
 	return 0;
diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 848e47a464ac..8454cb39a47b 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -315,7 +315,7 @@ static int ov02a10_set_fmt(struct v4l2_subdev *sd,
 	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		frame_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		frame_fmt = v4l2_subdev_state_get_format(sd_state, 0);
 	else
 		frame_fmt = &ov02a10->fmt;
 
@@ -336,8 +336,8 @@ static int ov02a10_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&ov02a10->mutex);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	} else {
 		fmt->format = ov02a10->fmt;
 		mbus_fmt->code = ov02a10->fmt.code;
diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 3d49e3fa8e56..1bacbdfa4298 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -1145,7 +1145,7 @@ static int ov08d10_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&ov08d10->mutex);
 	ov08d10_update_pad_format(ov08d10, mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) =
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =
 								fmt->format;
 	} else {
 		ov08d10->cur_mode = mode;
@@ -1184,9 +1184,8 @@ static int ov08d10_get_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov08d10->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov08d10->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		ov08d10_update_pad_format(ov08d10, ov08d10->cur_mode,
 					  &fmt->format);
@@ -1242,7 +1241,7 @@ static int ov08d10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov08d10->mutex);
 	ov08d10_update_pad_format(ov08d10, &ov08d10->priv_lane->sp_modes[0],
-				  v4l2_subdev_get_try_format(sd, fh->state, 0));
+				  v4l2_subdev_state_get_format(fh->state, 0));
 	mutex_unlock(&ov08d10->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index b41b6866a0ab..abbb0b774d43 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -2536,7 +2536,7 @@ static int ov08x40_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	const struct ov08x40_mode *default_mode = &supported_modes[0];
 	struct ov08x40 *ov08x = to_ov08x40(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, fh->state, 0);
+		v4l2_subdev_state_get_format(fh->state, 0);
 
 	mutex_lock(&ov08x->mutex);
 
@@ -2774,10 +2774,9 @@ static int ov08x40_do_get_pad_format(struct ov08x40 *ov08x,
 				     struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *framefmt;
-	struct v4l2_subdev *sd = &ov08x->sd;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		ov08x40_update_pad_format(ov08x->cur_mode, fmt);
@@ -2826,7 +2825,7 @@ ov08x40_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	ov08x40_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		ov08x->cur_mode = mode;
diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 4c419014dd7b..09387e335d80 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1147,9 +1147,8 @@ static int ov13858_write_reg_list(struct ov13858 *ov13858,
 static int ov13858_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct ov13858 *ov13858 = to_ov13858(sd);
-	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_get_try_format(sd,
-									fh->state,
-									0);
+	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_state_get_format(fh->state,
+									  0);
 
 	mutex_lock(&ov13858->mutex);
 
@@ -1317,10 +1316,9 @@ static int ov13858_do_get_pad_format(struct ov13858 *ov13858,
 				     struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *framefmt;
-	struct v4l2_subdev *sd = &ov13858->sd;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		ov13858_update_pad_format(ov13858->cur_mode, fmt);
@@ -1369,7 +1367,7 @@ ov13858_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	ov13858_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		ov13858->cur_mode = mode;
diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
index 970d2caeb3d6..c06411d5ee2b 100644
--- a/drivers/media/i2c/ov13b10.c
+++ b/drivers/media/i2c/ov13b10.c
@@ -755,9 +755,8 @@ static int ov13b10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	const struct ov13b10_mode *default_mode = &supported_modes[0];
 	struct ov13b10 *ov13b = to_ov13b10(sd);
-	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_get_try_format(sd,
-									fh->state,
-									0);
+	struct v4l2_mbus_framefmt *try_fmt = v4l2_subdev_state_get_format(fh->state,
+									  0);
 
 	mutex_lock(&ov13b->mutex);
 
@@ -1002,10 +1001,9 @@ static int ov13b10_do_get_pad_format(struct ov13b10 *ov13b,
 				     struct v4l2_subdev_format *fmt)
 {
 	struct v4l2_mbus_framefmt *framefmt;
-	struct v4l2_subdev *sd = &ov13b->sd;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		ov13b10_update_pad_format(ov13b->cur_mode, fmt);
@@ -1054,7 +1052,7 @@ ov13b10_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	ov13b10_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		ov13b->cur_mode = mode;
diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index 28a01c6eff64..735602cd8fcf 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -920,7 +920,7 @@ static int ov2640_get_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		mf = v4l2_subdev_state_get_format(sd_state, 0);
 		format->format = *mf;
 		return 0;
 	}
@@ -1000,7 +1000,7 @@ static int ov2640_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *try_fmt =
-		v4l2_subdev_get_try_format(sd, sd_state, 0);
+		v4l2_subdev_state_get_format(sd_state, 0);
 	const struct ov2640_win_size *win =
 		ov2640_select_win(SVGA_WIDTH, SVGA_HEIGHT);
 
diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 2c3dbe164eb6..1d0ef72a6403 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1033,7 +1033,7 @@ static int ov2659_get_fmt(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *mf;
 
-		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		mf = v4l2_subdev_state_get_format(sd_state, 0);
 		mutex_lock(&ov2659->lock);
 		fmt->format = *mf;
 		mutex_unlock(&ov2659->lock);
@@ -1109,7 +1109,7 @@ static int ov2659_set_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&ov2659->lock);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*mf = fmt->format;
 	} else {
 		s64 val;
@@ -1304,7 +1304,7 @@ static int ov2659_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->state, 0);
+				v4l2_subdev_state_get_format(fh->state, 0);
 
 	dev_dbg(&client->dev, "%s:\n", __func__);
 
diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
index 72bab0ff8a36..1c572c48576a 100644
--- a/drivers/media/i2c/ov2680.c
+++ b/drivers/media/i2c/ov2680.c
@@ -309,7 +309,7 @@ __ov2680_get_pad_format(struct ov2680_dev *sensor,
 			enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&sensor->sd, state, pad);
+		return v4l2_subdev_state_get_format(state, pad);
 
 	return &sensor->mode.fmt;
 }
@@ -321,7 +321,7 @@ __ov2680_get_pad_crop(struct ov2680_dev *sensor,
 		      enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
+		return v4l2_subdev_state_get_crop(state, pad);
 
 	return &sensor->mode.crop;
 }
@@ -650,7 +650,7 @@ static int ov2680_set_fmt(struct v4l2_subdev *sd,
 	ov2680_fill_format(sensor, &format->format, width, height);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		try_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		try_fmt = v4l2_subdev_state_get_format(sd_state, 0);
 		*try_fmt = format->format;
 		return 0;
 	}
diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 396583826ae9..9b8481b8dcd4 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -404,7 +404,7 @@ __ov2685_get_pad_crop(struct ov2685 *ov2685,
 
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov2685->subdev, state, pad);
+		return v4l2_subdev_state_get_crop(state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return mode->analog_crop;
 	}
@@ -547,7 +547,7 @@ static int ov2685_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov2685->mutex);
 
-	try_fmt = v4l2_subdev_get_try_format(sd, fh->state, 0);
+	try_fmt = v4l2_subdev_state_get_format(fh->state, 0);
 	/* Initialize try_fmt */
 	ov2685_fill_fmt(&supported_modes[0], try_fmt);
 
diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 24e468485fbf..23cbd8b7846e 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -826,7 +826,7 @@ static int ov2740_set_format(struct v4l2_subdev *sd,
 				      fmt->format.height);
 
 	ov2740_update_pad_format(mode, &fmt->format);
-	*v4l2_subdev_get_pad_format(sd, sd_state, fmt->pad) = fmt->format;
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
@@ -883,7 +883,7 @@ static int ov2740_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *sd_state)
 {
 	ov2740_update_pad_format(&supported_modes[0],
-				 v4l2_subdev_get_pad_format(sd, sd_state, 0));
+				 v4l2_subdev_state_get_format(sd_state, 0));
 
 	return 0;
 }
diff --git a/drivers/media/i2c/ov4689.c b/drivers/media/i2c/ov4689.c
index 3bd972a822e7..403091651885 100644
--- a/drivers/media/i2c/ov4689.c
+++ b/drivers/media/i2c/ov4689.c
@@ -570,7 +570,7 @@ static int ov4689_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov4689->mutex);
 
-	try_fmt = v4l2_subdev_get_try_format(sd, fh->state, 0);
+	try_fmt = v4l2_subdev_state_get_format(fh->state, 0);
 	/* Initialize try_fmt */
 	ov4689_fill_fmt(&supported_modes[OV4689_MODE_2688_1520], try_fmt);
 
diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 40532f7bcabe..3f79a3b77044 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2797,8 +2797,7 @@ static int ov5640_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&sensor->lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
-						 format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 	else
 		fmt = &sensor->fmt;
 
@@ -2971,7 +2970,7 @@ static int ov5640_set_fmt(struct v4l2_subdev *sd,
 		goto out;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, 0) = *mbus_fmt;
+		*v4l2_subdev_state_get_format(sd_state, 0) = *mbus_fmt;
 		goto out;
 	}
 
@@ -3750,8 +3749,8 @@ static int ov5640_init_cfg(struct v4l2_subdev *sd,
 {
 	struct ov5640_dev *sensor = to_ov5640_dev(sd);
 	struct v4l2_mbus_framefmt *fmt =
-				v4l2_subdev_get_try_format(sd, state, 0);
-	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
+				v4l2_subdev_state_get_format(state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
 
 	*fmt = ov5640_is_csi2(sensor) ? ov5640_csi2_default_fmt :
 					ov5640_dvp_default_fmt;
diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index a70db7e601a4..695f4f673536 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -851,7 +851,7 @@ __ov5645_get_pad_format(struct ov5645 *ov5645,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&ov5645->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov5645->fmt;
 	default:
@@ -878,7 +878,7 @@ __ov5645_get_pad_crop(struct ov5645 *ov5645,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov5645->sd, sd_state, pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov5645->crop;
 	default:
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index dcfe3129c63a..96c0fd4ff5ab 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -882,7 +882,7 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov5647->sd, sd_state, pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov5647->mode->crop;
 	}
@@ -975,8 +975,8 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&sensor->lock);
 	switch (format->which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		sensor_format = v4l2_subdev_get_try_format(sd, sd_state,
-							   format->pad);
+		sensor_format = v4l2_subdev_state_get_format(sd_state,
+							     format->pad);
 		break;
 	default:
 		sensor_format = &sensor->mode->format;
@@ -1004,7 +1004,7 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	/* Update the sensor mode and apply at it at streamon time. */
 	mutex_lock(&sensor->lock);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, format->pad) = mode->format;
+		*v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
 	} else {
 		int exposure_max, exposure_def;
 		int hblank, vblank;
@@ -1121,8 +1121,8 @@ static int ov5647_detect(struct v4l2_subdev *sd)
 static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->state, 0);
-	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
+				v4l2_subdev_state_get_format(fh->state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(fh->state, 0);
 
 	crop->left = OV5647_PIXEL_ARRAY_LEFT;
 	crop->top = OV5647_PIXEL_ARRAY_TOP;
diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index aa10eb4e3991..13e6060d15d4 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2232,8 +2232,8 @@ static int ov5648_get_fmt(struct v4l2_subdev *subdev,
 	mutex_lock(&sensor->mutex);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, sd_state,
-							   format->pad);
+		*mbus_format = *v4l2_subdev_state_get_format(sd_state,
+							     format->pad);
 	else
 		ov5648_mbus_format_fill(mbus_format, sensor->state.mbus_code,
 					sensor->state.mode);
@@ -2285,7 +2285,7 @@ static int ov5648_set_fmt(struct v4l2_subdev *subdev,
 	ov5648_mbus_format_fill(mbus_format, mbus_code, mode);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, sd_state, format->pad) =
+		*v4l2_subdev_state_get_format(sd_state, format->pad) =
 			*mbus_format;
 	else if (sensor->state.mode != mode ||
 		 sensor->state.mbus_code != mbus_code)
diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index e80db3ecd4f8..470d848f40d8 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2200,9 +2200,9 @@ static int ov5670_init_cfg(struct v4l2_subdev *sd,
 			   struct v4l2_subdev_state *state)
 {
 	struct v4l2_mbus_framefmt *fmt =
-				v4l2_subdev_get_try_format(sd, state, 0);
+				v4l2_subdev_state_get_format(state, 0);
 	const struct ov5670_mode *default_mode = &supported_modes[0];
-	struct v4l2_rect *crop = v4l2_subdev_get_try_crop(sd, state, 0);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
 
 	fmt->width = default_mode->width;
 	fmt->height = default_mode->height;
@@ -2263,9 +2263,8 @@ static int ov5670_do_get_pad_format(struct ov5670 *ov5670,
 				    struct v4l2_subdev_format *fmt)
 {
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov5670->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		ov5670_update_pad_format(ov5670->cur_mode, fmt);
 
@@ -2310,7 +2309,7 @@ static int ov5670_set_pad_format(struct v4l2_subdev *sd,
 				      fmt->format.width, fmt->format.height);
 	ov5670_update_pad_format(mode, fmt);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov5670->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov5670->link_freq, mode->link_freq_index);
@@ -2550,7 +2549,7 @@ __ov5670_get_pad_crop(struct ov5670 *sensor, struct v4l2_subdev_state *state,
 
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&sensor->sd, state, pad);
+		return v4l2_subdev_state_get_crop(state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return mode->analog_crop;
 	}
diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index e63d9d402d34..3641911bc73f 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -1036,7 +1036,7 @@ static int ov5675_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&ov5675->mutex);
 	ov5675_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov5675->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov5675->link_freq, mode->link_freq_index);
@@ -1069,9 +1069,8 @@ static int ov5675_get_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov5675->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov5675->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		ov5675_update_pad_format(ov5675->cur_mode, &fmt->format);
 
@@ -1141,7 +1140,7 @@ static int ov5675_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov5675->mutex);
 	ov5675_update_pad_format(&supported_modes[0],
-				 v4l2_subdev_get_try_format(sd, fh->state, 0));
+				 v4l2_subdev_state_get_format(fh->state, 0));
 	mutex_unlock(&ov5675->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 819425e21349..205193baa06e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -775,7 +775,7 @@ __ov5693_get_pad_format(struct ov5693_device *ov5693,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&ov5693->sd, state, pad);
+		return v4l2_subdev_state_get_format(state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov5693->mode.format;
 	default:
@@ -790,7 +790,7 @@ __ov5693_get_pad_crop(struct ov5693_device *ov5693,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov5693->sd, state, pad);
+		return v4l2_subdev_state_get_crop(state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov5693->mode.crop;
 	}
diff --git a/drivers/media/i2c/ov5695.c b/drivers/media/i2c/ov5695.c
index c8f57ce1578d..663eccdfea6a 100644
--- a/drivers/media/i2c/ov5695.c
+++ b/drivers/media/i2c/ov5695.c
@@ -820,7 +820,7 @@ static int ov5695_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.height = mode->height;
 	fmt->format.field = V4L2_FIELD_NONE;
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov5695->cur_mode = mode;
 		h_blank = mode->hts_def - mode->width;
@@ -846,8 +846,8 @@ static int ov5695_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov5695->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	} else {
 		fmt->format.width = mode->width;
 		fmt->format.height = mode->height;
@@ -1039,7 +1039,7 @@ static int ov5695_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct ov5695 *ov5695 = to_ov5695(sd);
 	struct v4l2_mbus_framefmt *try_fmt =
-				v4l2_subdev_get_try_format(sd, fh->state, 0);
+				v4l2_subdev_state_get_format(fh->state, 0);
 	const struct ov5695_mode *def_mode = &supported_modes[0];
 
 	mutex_lock(&ov5695->mutex);
diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 6582cc0e2384..774f5dfb8186 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1139,7 +1139,7 @@ __ov7251_get_pad_format(struct ov7251 *ov7251,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&ov7251->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov7251->fmt;
 	default:
@@ -1169,7 +1169,7 @@ __ov7251_get_pad_crop(struct ov7251 *ov7251,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov7251->sd, sd_state, pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov7251->crop;
 	default:
diff --git a/drivers/media/i2c/ov7670.c b/drivers/media/i2c/ov7670.c
index 172483597c54..8164c0c433c5 100644
--- a/drivers/media/i2c/ov7670.c
+++ b/drivers/media/i2c/ov7670.c
@@ -1112,8 +1112,7 @@ static int ov7670_set_fmt(struct v4l2_subdev *sd,
 		ret = ov7670_try_fmt_internal(sd, &format->format, NULL, NULL);
 		if (ret)
 			return ret;
-		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state,
-						      format->pad);
+		mbus_fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		*mbus_fmt = format->format;
 		return 0;
 	}
@@ -1141,7 +1140,7 @@ static int ov7670_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mbus_fmt;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		mbus_fmt = v4l2_subdev_state_get_format(sd_state, 0);
 		format->format = *mbus_fmt;
 		return 0;
 	} else {
@@ -1707,7 +1706,7 @@ static void ov7670_get_default_format(struct v4l2_subdev *sd,
 static int ov7670_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->state, 0);
+				v4l2_subdev_state_get_format(fh->state, 0);
 
 	ov7670_get_default_format(sd, format);
 
diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 356a45e65b81..9c13ff5fe9fa 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -812,8 +812,7 @@ static int ov7740_set_fmt(struct v4l2_subdev *sd,
 		if (ret)
 			goto error;
 
-		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state,
-						      format->pad);
+		mbus_fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		*mbus_fmt = format->format;
 		mutex_unlock(&ov7740->mutex);
 		return 0;
@@ -843,7 +842,7 @@ static int ov7740_get_fmt(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov7740->mutex);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mbus_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		mbus_fmt = v4l2_subdev_state_get_format(sd_state, 0);
 		format->format = *mbus_fmt;
 	} else {
 		format->format = ov7740->format;
@@ -883,7 +882,7 @@ static int ov7740_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
 	struct v4l2_mbus_framefmt *format =
-				v4l2_subdev_get_try_format(sd, fh->state, 0);
+				v4l2_subdev_state_get_format(fh->state, 0);
 
 	mutex_lock(&ov7740->mutex);
 	ov7740_get_default_format(sd, format);
diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index a0f673a24e52..6ffe10e57b5b 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -2134,7 +2134,7 @@ static int ov8856_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&ov8856->mutex);
 	ov8856_update_pad_format(ov8856, mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov8856->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov8856->link_freq, mode->link_freq_index);
@@ -2172,9 +2172,8 @@ static int ov8856_get_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov8856->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov8856->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		ov8856_update_pad_format(ov8856, ov8856->cur_mode, &fmt->format);
 
@@ -2225,7 +2224,7 @@ static int ov8856_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov8856->mutex);
 	ov8856_update_pad_format(ov8856, &ov8856->priv_lane->supported_modes[0],
-				 v4l2_subdev_get_try_format(sd, fh->state, 0));
+				 v4l2_subdev_state_get_format(fh->state, 0));
 	mutex_unlock(&ov8856->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3af6125a2eee..ad0437b49e26 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1333,7 +1333,7 @@ static int ov8858_start_stream(struct ov8858 *ov8858,
 	if (ret)
 		return ret;
 
-	format = v4l2_subdev_get_pad_format(&ov8858->subdev, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 	mode = v4l2_find_nearest_size(ov8858_modes, ARRAY_SIZE(ov8858_modes),
 				      width, height, format->width,
 				      format->height);
@@ -1428,7 +1428,7 @@ static int ov8858_set_fmt(struct v4l2_subdev *sd,
 	fmt->format.field = V4L2_FIELD_NONE;
 
 	/* Store the format in the current subdev state. */
-	*v4l2_subdev_get_pad_format(sd, state, 0) =  fmt->format;
+	*v4l2_subdev_state_get_format(state, 0) =  fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
 		return 0;
@@ -1547,7 +1547,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	 * - by the driver when s_ctrl is called in the s_stream(1) call path
 	 */
 	state = v4l2_subdev_get_locked_active_state(&ov8858->subdev);
-	format = v4l2_subdev_get_pad_format(&ov8858->subdev, state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
 
 	/* Propagate change of current control to all related controls */
 	switch (ctrl->id) {
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index f2213c6158d3..fb19ab0c2a9d 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2710,8 +2710,8 @@ static int ov8865_get_fmt(struct v4l2_subdev *subdev,
 	mutex_lock(&sensor->mutex);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, sd_state,
-							   format->pad);
+		*mbus_format = *v4l2_subdev_state_get_format(sd_state,
+							     format->pad);
 	else
 		ov8865_mbus_format_fill(mbus_format, sensor->state.mbus_code,
 					sensor->state.mode);
@@ -2765,7 +2765,7 @@ static int ov8865_set_fmt(struct v4l2_subdev *subdev,
 	ov8865_mbus_format_fill(mbus_format, mbus_code, mode);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, sd_state, format->pad) =
+		*v4l2_subdev_state_get_format(sd_state, format->pad) =
 			*mbus_format;
 	else if (sensor->state.mode != mode ||
 		 sensor->state.mbus_code != mbus_code)
@@ -2818,7 +2818,7 @@ __ov8865_get_pad_crop(struct ov8865_sensor *sensor,
 
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		*r = *v4l2_subdev_get_try_crop(&sensor->subdev, state, pad);
+		*r = *v4l2_subdev_state_get_crop(state, pad);
 		break;
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		r->height = mode->output_size_y;
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index bf6dfce1b5dd..9baaa219a1ad 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -814,7 +814,7 @@ static int ov9282_get_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *framefmt;
 	} else {
 		ov9282_fill_pad_format(ov9282, ov9282->cur_mode, ov9282->code,
@@ -860,7 +860,7 @@ static int ov9282_set_pad_format(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *framefmt;
 
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*framefmt = fmt->format;
 	} else {
 		ret = ov9282_update_controls(ov9282, mode, fmt);
@@ -902,7 +902,7 @@ __ov9282_get_pad_crop(struct ov9282 *ov9282,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_crop(&ov9282->sd, sd_state, pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &ov9282->cur_mode->crop;
 	}
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index da1ab5135eaa..753f6222102a 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1172,7 +1172,7 @@ static int ov965x_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		mf = v4l2_subdev_state_get_format(sd_state, 0);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1233,8 +1233,7 @@ static int ov965x_set_fmt(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
 		if (sd_state) {
-			mf = v4l2_subdev_get_try_format(sd, sd_state,
-							fmt->pad);
+			mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 			*mf = fmt->format;
 		}
 	} else {
@@ -1363,7 +1362,7 @@ static int ov965x_s_stream(struct v4l2_subdev *sd, int on)
 static int ov965x_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *mf =
-		v4l2_subdev_get_try_format(sd, fh->state, 0);
+		v4l2_subdev_state_get_format(fh->state, 0);
 
 	ov965x_get_default_format(mf);
 	return 0;
diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index ee3315299605..2b766bfc98fc 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -697,7 +697,7 @@ static int ov9734_set_format(struct v4l2_subdev *sd,
 	mutex_lock(&ov9734->mutex);
 	ov9734_update_pad_format(mode, &fmt->format);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = fmt->format;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
 	} else {
 		ov9734->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov9734->link_freq, mode->link_freq_index);
@@ -730,9 +730,8 @@ static int ov9734_get_format(struct v4l2_subdev *sd,
 
 	mutex_lock(&ov9734->mutex);
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(&ov9734->sd,
-							  sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		ov9734_update_pad_format(ov9734->cur_mode, &fmt->format);
 
@@ -777,7 +776,7 @@ static int ov9734_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 
 	mutex_lock(&ov9734->mutex);
 	ov9734_update_pad_format(&supported_modes[0],
-				 v4l2_subdev_get_try_format(sd, fh->state, 0));
+				 v4l2_subdev_state_get_format(fh->state, 0));
 	mutex_unlock(&ov9734->mutex);
 
 	return 0;
diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
index ed5b10731a14..8f9b5713daf7 100644
--- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
+++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
@@ -819,7 +819,6 @@ static void s5c73m3_oif_try_format(struct s5c73m3 *state,
 				   struct v4l2_subdev_format *fmt,
 				   const struct s5c73m3_frame_size **fs)
 {
-	struct v4l2_subdev *sd = &state->sensor_sd;
 	u32 code;
 
 	switch (fmt->pad) {
@@ -841,10 +840,8 @@ static void s5c73m3_oif_try_format(struct s5c73m3 *state,
 		if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 			*fs = state->oif_pix_size[RES_ISP];
 		else
-			*fs = s5c73m3_find_frame_size(
-						v4l2_subdev_get_try_format(sd, sd_state,
-									   OIF_ISP_PAD),
-						RES_ISP);
+			*fs = s5c73m3_find_frame_size(v4l2_subdev_state_get_format(sd_state, OIF_ISP_PAD),
+						      RES_ISP);
 		break;
 	}
 
@@ -990,8 +987,8 @@ static int s5c73m3_get_fmt(struct v4l2_subdev *sd,
 	u32 code;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 		return 0;
 	}
 
@@ -1025,8 +1022,8 @@ static int s5c73m3_oif_get_fmt(struct v4l2_subdev *sd,
 	u32 code;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 		return 0;
 	}
 
@@ -1069,7 +1066,7 @@ static int s5c73m3_set_fmt(struct v4l2_subdev *sd,
 	s5c73m3_try_format(state, sd_state, fmt, &frame_size);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*mf = fmt->format;
 	} else {
 		switch (fmt->pad) {
@@ -1108,11 +1105,11 @@ static int s5c73m3_oif_set_fmt(struct v4l2_subdev *sd,
 	s5c73m3_oif_try_format(state, sd_state, fmt, &frame_size);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*mf = fmt->format;
 		if (fmt->pad == OIF_ISP_PAD) {
-			mf = v4l2_subdev_get_try_format(sd, sd_state,
-							OIF_SOURCE_PAD);
+			mf = v4l2_subdev_state_get_format(sd_state,
+							  OIF_SOURCE_PAD);
 			mf->width = fmt->format.width;
 			mf->height = fmt->format.height;
 		}
@@ -1260,8 +1257,8 @@ static int s5c73m3_oif_enum_frame_size(struct v4l2_subdev *sd,
 			if (fse->which == V4L2_SUBDEV_FORMAT_TRY) {
 				struct v4l2_mbus_framefmt *mf;
 
-				mf = v4l2_subdev_get_try_format(sd, sd_state,
-								OIF_ISP_PAD);
+				mf = v4l2_subdev_state_get_format(sd_state,
+								  OIF_ISP_PAD);
 
 				w = mf->width;
 				h = mf->height;
@@ -1316,11 +1313,11 @@ static int s5c73m3_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, fh->state, S5C73M3_ISP_PAD);
+	mf = v4l2_subdev_state_get_format(fh->state, S5C73M3_ISP_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_isp_resolutions[1],
 						S5C73M3_ISP_FMT);
 
-	mf = v4l2_subdev_get_try_format(sd, fh->state, S5C73M3_JPEG_PAD);
+	mf = v4l2_subdev_state_get_format(fh->state, S5C73M3_JPEG_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_jpeg_resolutions[1],
 					S5C73M3_JPEG_FMT);
 
@@ -1331,15 +1328,15 @@ static int s5c73m3_oif_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, fh->state, OIF_ISP_PAD);
+	mf = v4l2_subdev_state_get_format(fh->state, OIF_ISP_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_isp_resolutions[1],
 						S5C73M3_ISP_FMT);
 
-	mf = v4l2_subdev_get_try_format(sd, fh->state, OIF_JPEG_PAD);
+	mf = v4l2_subdev_state_get_format(fh->state, OIF_JPEG_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_jpeg_resolutions[1],
 					S5C73M3_JPEG_FMT);
 
-	mf = v4l2_subdev_get_try_format(sd, fh->state, OIF_SOURCE_PAD);
+	mf = v4l2_subdev_state_get_format(fh->state, OIF_SOURCE_PAD);
 	s5c73m3_fill_mbus_fmt(mf, &s5c73m3_isp_resolutions[1],
 						S5C73M3_ISP_FMT);
 	return 0;
diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
index 67da2045f543..03ccfb0e1e11 100644
--- a/drivers/media/i2c/s5k5baf.c
+++ b/drivers/media/i2c/s5k5baf.c
@@ -1273,7 +1273,7 @@ static int s5k5baf_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1307,7 +1307,7 @@ static int s5k5baf_set_fmt(struct v4l2_subdev *sd,
 	mf->field = V4L2_FIELD_NONE;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) = *mf;
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = *mf;
 		return 0;
 	}
 
@@ -1379,11 +1379,11 @@ static int s5k5baf_get_selection(struct v4l2_subdev *sd,
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
 		if (rtype == R_COMPOSE)
-			sel->r = *v4l2_subdev_get_try_compose(sd, sd_state,
-							      sel->pad);
+			sel->r = *v4l2_subdev_state_get_compose(sd_state,
+								sel->pad);
 		else
-			sel->r = *v4l2_subdev_get_try_crop(sd, sd_state,
-							   sel->pad);
+			sel->r = *v4l2_subdev_state_get_crop(sd_state,
+							     sel->pad);
 		return 0;
 	}
 
@@ -1472,14 +1472,11 @@ static int s5k5baf_set_selection(struct v4l2_subdev *sd,
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
 		rects = (struct v4l2_rect * []) {
-				&s5k5baf_cis_rect,
-				v4l2_subdev_get_try_crop(sd, sd_state,
-							 PAD_CIS),
-				v4l2_subdev_get_try_compose(sd, sd_state,
-							    PAD_CIS),
-				v4l2_subdev_get_try_crop(sd, sd_state,
-							 PAD_OUT)
-			};
+			&s5k5baf_cis_rect,
+			v4l2_subdev_state_get_crop(sd_state, PAD_CIS),
+			v4l2_subdev_state_get_compose(sd_state, PAD_CIS),
+			v4l2_subdev_state_get_crop(sd_state, PAD_OUT)
+		};
 		s5k5baf_set_rect_and_adjust(rects, rtype, &sel->r);
 		return 0;
 	}
@@ -1696,22 +1693,22 @@ static int s5k5baf_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, fh->state, PAD_CIS);
+	mf = v4l2_subdev_state_get_format(fh->state, PAD_CIS);
 	s5k5baf_try_cis_format(mf);
 
 	if (s5k5baf_is_cis_subdev(sd))
 		return 0;
 
-	mf = v4l2_subdev_get_try_format(sd, fh->state, PAD_OUT);
+	mf = v4l2_subdev_state_get_format(fh->state, PAD_OUT);
 	mf->colorspace = s5k5baf_formats[0].colorspace;
 	mf->code = s5k5baf_formats[0].code;
 	mf->width = s5k5baf_cis_rect.width;
 	mf->height = s5k5baf_cis_rect.height;
 	mf->field = V4L2_FIELD_NONE;
 
-	*v4l2_subdev_get_try_crop(sd, fh->state, PAD_CIS) = s5k5baf_cis_rect;
-	*v4l2_subdev_get_try_compose(sd, fh->state, PAD_CIS) = s5k5baf_cis_rect;
-	*v4l2_subdev_get_try_crop(sd, fh->state, PAD_OUT) = s5k5baf_cis_rect;
+	*v4l2_subdev_state_get_crop(fh->state, PAD_CIS) = s5k5baf_cis_rect;
+	*v4l2_subdev_state_get_compose(fh->state, PAD_CIS) = s5k5baf_cis_rect;
+	*v4l2_subdev_state_get_crop(fh->state, PAD_OUT) = s5k5baf_cis_rect;
 
 	return 0;
 }
diff --git a/drivers/media/i2c/s5k6a3.c b/drivers/media/i2c/s5k6a3.c
index b3560c8f8b41..0c2674115b7b 100644
--- a/drivers/media/i2c/s5k6a3.c
+++ b/drivers/media/i2c/s5k6a3.c
@@ -127,8 +127,7 @@ static struct v4l2_mbus_framefmt *__s5k6a3_get_format(
 		u32 pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return sd_state ? v4l2_subdev_get_try_format(&sensor->subdev,
-							     sd_state, pad) : NULL;
+		return sd_state ? v4l2_subdev_state_get_format(sd_state, pad) : NULL;
 
 	return &sensor->format;
 }
@@ -174,9 +173,8 @@ static const struct v4l2_subdev_pad_ops s5k6a3_pad_ops = {
 
 static int s5k6a3_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	struct v4l2_mbus_framefmt *format = v4l2_subdev_get_try_format(sd,
-								       fh->state,
-								       0);
+	struct v4l2_mbus_framefmt *format = v4l2_subdev_state_get_format(fh->state,
+									 0);
 
 	*format		= s5k6a3_formats[0];
 	format->width	= S5K6A3_DEFAULT_WIDTH;
diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index fa27638edc07..9c9361354c00 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -724,8 +724,7 @@ static int mipid02_get_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(&bridge->sd, sd_state,
-						 format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 	else
 		fmt = &bridge->fmt;
 
@@ -751,8 +750,8 @@ static void mipid02_set_fmt_source(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		format->format = bridge->fmt;
 	else
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state,
-							     MIPID02_SINK_0);
+		format->format = *v4l2_subdev_state_get_format(sd_state,
+						               MIPID02_SINK_0);
 
 	/* but code may need to be converted */
 	format->format.code = serial_to_parallel_code(format->format.code);
@@ -761,7 +760,7 @@ static void mipid02_set_fmt_source(struct v4l2_subdev *sd,
 	if (format->which != V4L2_SUBDEV_FORMAT_TRY)
 		return;
 
-	*v4l2_subdev_get_try_format(sd, sd_state, MIPID02_SOURCE) =
+	*v4l2_subdev_state_get_format(sd_state, MIPID02_SOURCE) =
 		format->format;
 }
 
@@ -775,7 +774,7 @@ static void mipid02_set_fmt_sink(struct v4l2_subdev *sd,
 	format->format.code = get_fmt_code(format->format.code);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 	else
 		fmt = &bridge->fmt;
 
diff --git a/drivers/media/i2c/st-vgxy61.c b/drivers/media/i2c/st-vgxy61.c
index 5dbfb04b3124..507cd9661e9d 100644
--- a/drivers/media/i2c/st-vgxy61.c
+++ b/drivers/media/i2c/st-vgxy61.c
@@ -780,8 +780,7 @@ static int vgxy61_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&sensor->lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt = v4l2_subdev_get_try_format(&sensor->sd, sd_state,
-						 format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 	else
 		fmt = &sensor->fmt;
 
@@ -1289,7 +1288,7 @@ static int vgxy61_set_fmt(struct v4l2_subdev *sd,
 		goto out;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		fmt = v4l2_subdev_state_get_format(sd_state, 0);
 		*fmt = format->format;
 	} else if (sensor->current_mode != new_mode ||
 		   sensor->fmt.code != format->format.code) {
diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index ce612a47ba84..8be9c0f293e0 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -427,7 +427,7 @@ static int tc358746_apply_misc_config(struct tc358746 *tc358746)
 
 	sink_state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	mbusfmt = v4l2_subdev_get_pad_format(sd, sink_state, TC358746_SINK);
+	mbusfmt = v4l2_subdev_state_get_format(sink_state, TC358746_SINK);
 	fmt = tc358746_get_format_by_code(TC358746_SINK, mbusfmt->code);
 
 	/* Self defined CSI user data type id's are not supported yet */
@@ -745,10 +745,10 @@ static int tc358746_init_cfg(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = v4l2_subdev_get_pad_format(sd, state, TC358746_SINK);
+	fmt = v4l2_subdev_state_get_format(state, TC358746_SINK);
 	*fmt = tc358746_def_fmt;
 
-	fmt = v4l2_subdev_get_pad_format(sd, state, TC358746_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, TC358746_SOURCE);
 	*fmt = tc358746_def_fmt;
 	fmt->code = tc358746_src_mbus_code(tc358746_def_fmt.code);
 
@@ -781,7 +781,7 @@ static int tc358746_set_fmt(struct v4l2_subdev *sd,
 	if (format->pad == TC358746_SOURCE)
 		return v4l2_subdev_get_fmt(sd, sd_state, format);
 
-	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state, TC358746_SINK);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, TC358746_SINK);
 
 	fmt = tc358746_get_format_by_code(format->pad, format->format.code);
 	if (IS_ERR(fmt)) {
@@ -800,7 +800,7 @@ static int tc358746_set_fmt(struct v4l2_subdev *sd,
 
 	*sink_fmt = format->format;
 
-	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state, TC358746_SOURCE);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, TC358746_SOURCE);
 	*src_fmt = *sink_fmt;
 	src_fmt->code = tc358746_src_mbus_code(sink_fmt->code);
 
@@ -905,7 +905,7 @@ tc358746_link_validate(struct v4l2_subdev *sd, struct media_link *link,
 		return err;
 
 	sink_state = v4l2_subdev_lock_and_get_active_state(sd);
-	mbusfmt = v4l2_subdev_get_pad_format(sd, sink_state, TC358746_SINK);
+	mbusfmt = v4l2_subdev_state_get_format(sink_state, TC358746_SINK);
 
 	/* Check the FIFO settings */
 	fmt = tc358746_get_format_by_code(TC358746_SINK, mbusfmt->code);
diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index 325e99125941..63c12b77ff1e 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -1740,7 +1740,7 @@ static int tda1997x_init_cfg(struct v4l2_subdev *sd,
 	struct tda1997x_state *state = to_state(sd);
 	struct v4l2_mbus_framefmt *mf;
 
-	mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
+	mf = v4l2_subdev_state_get_format(sd_state, 0);
 	mf->code = state->mbus_codes[0];
 
 	return 0;
@@ -1792,7 +1792,7 @@ static int tda1997x_get_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		format->format.code = fmt->code;
 	} else
 		format->format.code = state->mbus_code;
@@ -1826,7 +1826,7 @@ static int tda1997x_set_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_try_format(sd, sd_state, format->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, format->pad);
 		*fmt = format->format;
 	} else {
 		int ret = tda1997x_setup_format(state, format->format.code);
diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index e543b3f7a4d8..76a92bfb6fde 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1035,7 +1035,7 @@ tvp5150_get_pad_crop(struct tvp5150 *decoder,
 		return &decoder->rect;
 	case V4L2_SUBDEV_FORMAT_TRY:
 #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
-		return v4l2_subdev_get_try_crop(&decoder->sd, sd_state, pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 #else
 		return ERR_PTR(-EINVAL);
 #endif
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 5dd69a251b6a..dce4b0e1f6e9 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -1205,11 +1205,11 @@ static int cio2_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	};
 
 	/* Initialize try_fmt */
-	format = v4l2_subdev_get_try_format(sd, fh->state, CIO2_PAD_SINK);
+	format = v4l2_subdev_state_get_format(fh->state, CIO2_PAD_SINK);
 	*format = fmt_default;
 
 	/* same as sink */
-	format = v4l2_subdev_get_try_format(sd, fh->state, CIO2_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(fh->state, CIO2_PAD_SOURCE);
 	*format = fmt_default;
 
 	return 0;
@@ -1231,8 +1231,8 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&q->subdev_lock);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_get_try_format(sd, sd_state,
-							  fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 	else
 		fmt->format = q->subdev_fmt;
 
@@ -1265,7 +1265,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
 		return cio2_subdev_get_fmt(sd, sd_state, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		mbus = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mbus = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	else
 		mbus = &q->subdev_fmt;
 
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 2a6b828fd8dd..b2b9d1669a82 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -338,7 +338,7 @@ mei_csi_get_pad_format(struct v4l2_subdev *sd,
 
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &csi->format_mbus[pad];
 	default:
@@ -356,7 +356,7 @@ static int mei_csi_init_cfg(struct v4l2_subdev *sd,
 	mutex_lock(&csi->lock);
 
 	for (i = 0; i < sd->entity.num_pads; i++) {
-		mbusformat = v4l2_subdev_get_try_format(sd, sd_state, i);
+		mbusformat = v4l2_subdev_state_get_format(sd_state, i);
 		*mbusformat = mei_csi_format_mbus_default;
 	}
 
diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 889f4fbbafb3..0171ea7b834d 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -406,12 +406,12 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 	format->format.field = V4L2_FIELD_NONE;
 
 	/* Set sink format */
-	fmt = v4l2_subdev_get_pad_format(subdev, state, format->pad);
+	fmt = v4l2_subdev_state_get_format(state, format->pad);
 	*fmt = format->format;
 
 	/* Propagate to source formats */
 	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
-		fmt = v4l2_subdev_get_pad_format(subdev, state, i);
+		fmt = v4l2_subdev_state_get_format(state, i);
 		*fmt = format->format;
 	}
 
diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index c115742f347f..3d98f91f1bee 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -176,8 +176,7 @@ __csi2tx_get_pad_format(struct v4l2_subdev *subdev,
 	struct csi2tx_priv *csi2tx = v4l2_subdev_to_csi2tx(subdev);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(subdev, sd_state,
-						  fmt->pad);
+		return v4l2_subdev_state_get_format(sd_state, fmt->pad);
 
 	return &csi2tx->pad_fmts[fmt->pad];
 }
diff --git a/drivers/media/platform/microchip/microchip-csi2dc.c b/drivers/media/platform/microchip/microchip-csi2dc.c
index 988c1cc1d8b6..87a2d092aad2 100644
--- a/drivers/media/platform/microchip/microchip-csi2dc.c
+++ b/drivers/media/platform/microchip/microchip-csi2dc.c
@@ -232,8 +232,8 @@ static int csi2dc_get_fmt(struct v4l2_subdev *csi2dc_sd,
 	struct v4l2_mbus_framefmt *v4l2_try_fmt;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		v4l2_try_fmt = v4l2_subdev_get_try_format(csi2dc_sd, sd_state,
-							  format->pad);
+		v4l2_try_fmt = v4l2_subdev_state_get_format(sd_state,
+							    format->pad);
 		format->format = *v4l2_try_fmt;
 
 		return 0;
@@ -281,13 +281,12 @@ static int csi2dc_set_fmt(struct v4l2_subdev *csi2dc_sd,
 	req_fmt->format.field = V4L2_FIELD_NONE;
 
 	if (req_fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		v4l2_try_fmt = v4l2_subdev_get_try_format(csi2dc_sd, sd_state,
-							  req_fmt->pad);
+		v4l2_try_fmt = v4l2_subdev_state_get_format(sd_state,
+							    req_fmt->pad);
 		*v4l2_try_fmt = req_fmt->format;
 		/* Trying on the sink pad makes the source pad change too */
-		v4l2_try_fmt = v4l2_subdev_get_try_format(csi2dc_sd,
-							  sd_state,
-							  CSI2DC_PAD_SOURCE);
+		v4l2_try_fmt = v4l2_subdev_state_get_format(sd_state,
+							    CSI2DC_PAD_SOURCE);
 		*v4l2_try_fmt = req_fmt->format;
 
 		/* if we are just trying, we are done */
@@ -440,7 +439,7 @@ static int csi2dc_init_cfg(struct v4l2_subdev *csi2dc_sd,
 			   struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *v4l2_try_fmt =
-		v4l2_subdev_get_try_format(csi2dc_sd, sd_state, 0);
+		v4l2_subdev_state_get_format(sd_state, 0);
 
 	v4l2_try_fmt->height = 480;
 	v4l2_try_fmt->width = 640;
diff --git a/drivers/media/platform/microchip/microchip-isc-scaler.c b/drivers/media/platform/microchip/microchip-isc-scaler.c
index 0f29a32d15ce..58dffbc9fbcb 100644
--- a/drivers/media/platform/microchip/microchip-isc-scaler.c
+++ b/drivers/media/platform/microchip/microchip-isc-scaler.c
@@ -33,8 +33,8 @@ static int isc_scaler_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *v4l2_try_fmt;
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		v4l2_try_fmt = v4l2_subdev_get_try_format(sd, sd_state,
-							  format->pad);
+		v4l2_try_fmt = v4l2_subdev_state_get_format(sd_state,
+							    format->pad);
 		format->format = *v4l2_try_fmt;
 
 		return 0;
@@ -74,12 +74,12 @@ static int isc_scaler_set_fmt(struct v4l2_subdev *sd,
 	req_fmt->format.code = fmt->mbus_code;
 
 	if (req_fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		v4l2_try_fmt = v4l2_subdev_get_try_format(sd, sd_state,
-							  req_fmt->pad);
+		v4l2_try_fmt = v4l2_subdev_state_get_format(sd_state,
+							    req_fmt->pad);
 		*v4l2_try_fmt = req_fmt->format;
 		/* Trying on the sink pad makes the source pad change too */
-		v4l2_try_fmt = v4l2_subdev_get_try_format(sd, sd_state,
-							  ISC_SCALER_PAD_SOURCE);
+		v4l2_try_fmt = v4l2_subdev_state_get_format(sd_state,
+							    ISC_SCALER_PAD_SOURCE);
 		*v4l2_try_fmt = req_fmt->format;
 
 		v4l_bound_align_image(&v4l2_try_fmt->width,
@@ -149,13 +149,13 @@ static int isc_scaler_init_cfg(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *sd_state)
 {
 	struct v4l2_mbus_framefmt *v4l2_try_fmt =
-		v4l2_subdev_get_try_format(sd, sd_state, 0);
+		v4l2_subdev_state_get_format(sd_state, 0);
 	struct v4l2_rect *try_crop;
 	struct isc_device *isc = container_of(sd, struct isc_device, scaler_sd);
 
 	*v4l2_try_fmt = isc->scaler_format[ISC_SCALER_PAD_SOURCE];
 
-	try_crop = v4l2_subdev_get_try_crop(sd, sd_state, 0);
+	try_crop = v4l2_subdev_state_get_crop(sd_state, 0);
 
 	try_crop->top = 0;
 	try_crop->left = 0;
diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 6cb20b45e0a1..a2c748217376 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -954,7 +954,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	format = v4l2_subdev_get_pad_format(sd, state, CSIS_PAD_SINK);
+	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
 	csis_fmt = find_csis_format(format->code);
 
 	ret = mipi_csis_calculate_params(csis, csis_fmt);
@@ -1002,7 +1002,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_get_pad_format(sd, sd_state, code->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
 		code->code = fmt->code;
 		return 0;
 	}
@@ -1069,7 +1069,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			      &sdformat->format.height, 1,
 			      CSIS_MAX_PIX_HEIGHT, 0, 0);
 
-	fmt = v4l2_subdev_get_pad_format(sd, sd_state, sdformat->pad);
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 
 	fmt->code = csis_fmt->code;
 	fmt->width = sdformat->format.width;
@@ -1083,7 +1083,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	sdformat->format = *fmt;
 
 	/* Propagate the format from sink to source. */
-	fmt = v4l2_subdev_get_pad_format(sd, sd_state, CSIS_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(sd_state, CSIS_PAD_SOURCE);
 	*fmt = sdformat->format;
 
 	/* The format on the source pad might change due to unpacking. */
@@ -1104,7 +1104,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	fmt = v4l2_subdev_get_pad_format(sd, state, CSIS_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
 	csis_fmt = find_csis_format(fmt->code);
 	v4l2_subdev_unlock_state(state);
 
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/platform/nxp/imx7-media-csi.c
index 15049c6aab37..da29971acf26 100644
--- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -542,8 +542,8 @@ static void imx7_csi_configure(struct imx7_csi *csi,
 	} else {
 		const struct v4l2_mbus_framefmt *sink_fmt;
 
-		sink_fmt = v4l2_subdev_get_pad_format(&csi->sd, sd_state,
-						      IMX7_CSI_PAD_SINK);
+		sink_fmt = v4l2_subdev_state_get_format(sd_state,
+							IMX7_CSI_PAD_SINK);
 
 		cr1 = BIT_SOF_POL | BIT_REDGE | BIT_HSYNC_POL | BIT_FCC
 		    | BIT_MCLKDIV(1) | BIT_MCLKEN;
@@ -1738,7 +1738,7 @@ static int imx7_csi_init_cfg(struct v4l2_subdev *sd,
 
 	for (i = 0; i < IMX7_CSI_PADS_NUM; i++) {
 		struct v4l2_mbus_framefmt *mf =
-			v4l2_subdev_get_pad_format(sd, sd_state, i);
+			v4l2_subdev_state_get_format(sd_state, i);
 
 		mf->code = IMX7_CSI_DEF_MBUS_CODE;
 		mf->width = IMX7_CSI_DEF_PIX_WIDTH;
@@ -1762,7 +1762,7 @@ static int imx7_csi_enum_mbus_code(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *in_fmt;
 	int ret = 0;
 
-	in_fmt = v4l2_subdev_get_pad_format(sd, sd_state, IMX7_CSI_PAD_SINK);
+	in_fmt = v4l2_subdev_state_get_format(sd_state, IMX7_CSI_PAD_SINK);
 
 	switch (code->pad) {
 	case IMX7_CSI_PAD_SINK:
@@ -1841,7 +1841,7 @@ static void imx7_csi_try_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *in_fmt;
 	u32 code;
 
-	in_fmt = v4l2_subdev_get_pad_format(sd, sd_state, IMX7_CSI_PAD_SINK);
+	in_fmt = v4l2_subdev_state_get_format(sd_state, IMX7_CSI_PAD_SINK);
 
 	switch (sdformat->pad) {
 	case IMX7_CSI_PAD_SRC:
@@ -1891,7 +1891,7 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 
 	imx7_csi_try_fmt(sd, sd_state, sdformat, &cc);
 
-	fmt = v4l2_subdev_get_pad_format(sd, sd_state, sdformat->pad);
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 
 	*fmt = sdformat->format;
 
@@ -1902,8 +1902,8 @@ static int imx7_csi_set_fmt(struct v4l2_subdev *sd,
 		format.format = sdformat->format;
 		imx7_csi_try_fmt(sd, sd_state, &format, &outcc);
 
-		outfmt = v4l2_subdev_get_pad_format(sd, sd_state,
-						    IMX7_CSI_PAD_SRC);
+		outfmt = v4l2_subdev_state_get_format(sd_state,
+						      IMX7_CSI_PAD_SRC);
 		*outfmt = format.format;
 	}
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index 65d20e9bae69..14c6da392803 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -263,10 +263,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 	/* Configure the pipeline. */
 	state = v4l2_subdev_lock_and_get_active_state(sd);
 
-	sink_fmt = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SINK);
-	src_fmt = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SOURCE);
-	compose = v4l2_subdev_get_try_compose(sd, state, MXC_ISI_PIPE_PAD_SINK);
-	crop = *v4l2_subdev_get_try_crop(sd, state, MXC_ISI_PIPE_PAD_SOURCE);
+	sink_fmt = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SOURCE);
+	compose = v4l2_subdev_state_get_compose(state, MXC_ISI_PIPE_PAD_SINK);
+	crop = *v4l2_subdev_state_get_crop(state, MXC_ISI_PIPE_PAD_SOURCE);
 
 	sink_info = mxc_isi_bus_format_by_code(sink_fmt->code,
 					       MXC_ISI_PIPE_PAD_SINK);
@@ -322,7 +322,7 @@ mxc_isi_pipe_get_pad_format(struct mxc_isi_pipe *pipe,
 			    struct v4l2_subdev_state *state,
 			    unsigned int pad)
 {
-	return v4l2_subdev_get_try_format(&pipe->sd, state, pad);
+	return v4l2_subdev_state_get_format(state, pad);
 }
 
 static struct v4l2_rect *
@@ -330,7 +330,7 @@ mxc_isi_pipe_get_pad_crop(struct mxc_isi_pipe *pipe,
 			  struct v4l2_subdev_state *state,
 			  unsigned int pad)
 {
-	return v4l2_subdev_get_try_crop(&pipe->sd, state, pad);
+	return v4l2_subdev_state_get_crop(state, pad);
 }
 
 static struct v4l2_rect *
@@ -338,7 +338,7 @@ mxc_isi_pipe_get_pad_compose(struct mxc_isi_pipe *pipe,
 			     struct v4l2_subdev_state *state,
 			     unsigned int pad)
 {
-	return v4l2_subdev_get_try_compose(&pipe->sd, state, pad);
+	return v4l2_subdev_state_get_compose(state, pad);
 }
 
 static int mxc_isi_pipe_init_cfg(struct v4l2_subdev *sd,
@@ -832,8 +832,8 @@ int mxc_isi_pipe_acquire(struct mxc_isi_pipe *pipe,
 	int ret;
 
 	state = v4l2_subdev_lock_and_get_active_state(sd);
-	sink_fmt = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SINK);
-	src_fmt = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SOURCE);
+	sink_fmt = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SOURCE);
 	v4l2_subdev_unlock_state(state);
 
 	sink_info = mxc_isi_bus_format_by_code(sink_fmt->code,
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 10840c9a0912..49bca2b01cc6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -713,7 +713,7 @@ static int mxc_isi_video_validate_format(struct mxc_isi_video *video)
 
 	info = mxc_isi_format_by_fourcc(video->pix.pixelformat,
 					MXC_ISI_VIDEO_CAP);
-	format = v4l2_subdev_get_try_format(sd, state, MXC_ISI_PIPE_PAD_SOURCE);
+	format = v4l2_subdev_state_get_format(state, MXC_ISI_PIPE_PAD_SOURCE);
 
 	if (format->code != info->mbus_code ||
 	    format->width != video->pix.width ||
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index ed048f73c982..02a4c546a90a 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -296,7 +296,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 
 	/* Calculate the line rate from the pixel rate. */
 
-	fmt = v4l2_subdev_get_pad_format(&state->sd, sd_state, MIPI_CSI2_PAD_SINK);
+	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SINK);
 	csi2_fmt = find_csi2_format(fmt->code);
 
 	link_freq = v4l2_get_link_freq(state->src_sd->ctrl_handler,
@@ -443,8 +443,9 @@ static int imx8mq_mipi_csi_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *fmt_sink;
 	struct v4l2_mbus_framefmt *fmt_source;
 
-	fmt_sink = v4l2_subdev_get_pad_format(sd, sd_state, MIPI_CSI2_PAD_SINK);
-	fmt_source = v4l2_subdev_get_pad_format(sd, sd_state, MIPI_CSI2_PAD_SOURCE);
+	fmt_sink = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SINK);
+	fmt_source = v4l2_subdev_state_get_format(sd_state,
+						  MIPI_CSI2_PAD_SOURCE);
 
 	fmt_sink->code = MEDIA_BUS_FMT_SGBRG10_1X10;
 	fmt_sink->width = MIPI_CSI2_DEF_PIX_WIDTH;
@@ -477,7 +478,7 @@ static int imx8mq_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_get_pad_format(sd, sd_state, code->pad);
+		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
 		code->code = fmt->code;
 		return 0;
 	}
@@ -514,7 +515,7 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	if (!csi2_fmt)
 		csi2_fmt = &imx8mq_mipi_csi_formats[0];
 
-	fmt = v4l2_subdev_get_pad_format(sd, sd_state, sdformat->pad);
+	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 
 	fmt->code = csi2_fmt->code;
 	fmt->width = sdformat->format.width;
@@ -523,7 +524,7 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	sdformat->format = *fmt;
 
 	/* Propagate the format from sink to source. */
-	fmt = v4l2_subdev_get_pad_format(sd, sd_state, MIPI_CSI2_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SOURCE);
 	*fmt = sdformat->format;
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 95873f988f7e..07fbdba354dc 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -276,8 +276,7 @@ __csid_get_format(struct csid_device *csid,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csid->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 
 	return &csid->fmt[pad];
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index edd573606a6a..169b2cd6f644 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -325,8 +325,7 @@ __csiphy_get_format(struct csiphy_device *csiphy,
 		    enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csiphy->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 
 	return &csiphy->fmt[pad];
 }
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index be9d2f0a10c1..6f763b5ac8c8 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -879,8 +879,7 @@ __ispif_get_format(struct ispif_line *line,
 		   enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&line->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 
 	return &line->fmt[pad];
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4839e2cedfe5..daa4f5477f72 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -828,8 +828,7 @@ __vfe_get_format(struct vfe_line *line,
 		 enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&line->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 
 	return &line->fmt[pad];
 }
@@ -848,8 +847,8 @@ __vfe_get_compose(struct vfe_line *line,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_compose(&line->subdev, sd_state,
-						   MSM_VFE_PAD_SINK);
+		return v4l2_subdev_state_get_compose(sd_state,
+						     MSM_VFE_PAD_SINK);
 
 	return &line->compose;
 }
@@ -868,8 +867,7 @@ __vfe_get_crop(struct vfe_line *line,
 	       enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&line->subdev, sd_state,
-						MSM_VFE_PAD_SRC);
+		return v4l2_subdev_state_get_crop(sd_state, MSM_VFE_PAD_SRC);
 
 	return &line->crop;
 }
diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 19a005d83733..530d65fc546b 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -282,7 +282,7 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		isp->mf = format->format;
 	} else {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
 		*framefmt = format->format;
 	}
 
@@ -302,7 +302,7 @@ static int risp_get_pad_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		format->format = isp->mf;
 	else
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
 
 	mutex_unlock(&isp->lock);
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
index 66fe553a00e7..582d5e35db0e 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-csi2.c
@@ -1185,7 +1185,7 @@ static int rcsi2_set_pad_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		priv->mf = format->format;
 	} else {
-		framefmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
+		framefmt = v4l2_subdev_state_get_format(sd_state, 0);
 		*framefmt = format->format;
 	}
 
@@ -1205,7 +1205,7 @@ static int rcsi2_get_pad_format(struct v4l2_subdev *sd,
 	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		format->format = priv->mf;
 	else
-		format->format = *v4l2_subdev_get_try_format(sd, sd_state, 0);
+		format->format = *v4l2_subdev_state_get_format(sd_state, 0);
 
 	mutex_unlock(&priv->lock);
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index ad2bd71037ab..04e61e783045 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -250,7 +250,7 @@ static int rzg2l_csi2_calc_mbps(struct rzg2l_csi2 *csi2)
 	}
 
 	state = v4l2_subdev_lock_and_get_active_state(&csi2->subdev);
-	fmt = v4l2_subdev_get_pad_format(&csi2->subdev, state, RZG2L_CSI2_SINK);
+	fmt = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
 	format = rzg2l_csi2_code_to_fmt(fmt->code);
 	v4l2_subdev_unlock_state(state);
 
@@ -500,13 +500,13 @@ static int rzg2l_csi2_set_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
-	src_format = v4l2_subdev_get_pad_format(sd, state, RZG2L_CSI2_SOURCE);
+	src_format = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SOURCE);
 	if (fmt->pad == RZG2L_CSI2_SOURCE) {
 		fmt->format = *src_format;
 		return 0;
 	}
 
-	sink_format = v4l2_subdev_get_pad_format(sd, state, RZG2L_CSI2_SINK);
+	sink_format = v4l2_subdev_state_get_format(state, RZG2L_CSI2_SINK);
 
 	if (!rzg2l_csi2_code_to_fmt(fmt->format.code))
 		sink_format->code = rzg2l_csi2_formats[0].code;
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 4dcd2faff5bb..17a59dfc8363 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -39,7 +39,7 @@ struct v4l2_mbus_framefmt *rzg2l_cru_ip_get_src_fmt(struct rzg2l_cru_dev *cru)
 	struct v4l2_mbus_framefmt *fmt;
 
 	state = v4l2_subdev_lock_and_get_active_state(&cru->ip.subdev);
-	fmt = v4l2_subdev_get_pad_format(&cru->ip.subdev, state, 1);
+	fmt = v4l2_subdev_state_get_format(state, 1);
 	v4l2_subdev_unlock_state(state);
 
 	return fmt;
@@ -108,13 +108,13 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
-	src_format = v4l2_subdev_get_pad_format(sd, state, RZG2L_CRU_IP_SOURCE);
+	src_format = v4l2_subdev_state_get_format(state, RZG2L_CRU_IP_SOURCE);
 	if (fmt->pad == RZG2L_CRU_IP_SOURCE) {
 		fmt->format = *src_format;
 		return 0;
 	}
 
-	sink_format = v4l2_subdev_get_pad_format(sd, state, fmt->pad);
+	sink_format = v4l2_subdev_state_get_format(state, fmt->pad);
 
 	if (!rzg2l_cru_ip_code_to_fmt(fmt->format.code))
 		sink_format->code = rzg2l_cru_ip_formats[0].code;
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
index 89385b4cabe5..95bf7b4ac9b8 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
@@ -100,7 +100,7 @@ static struct v4l2_rect *brx_get_compose(struct vsp1_brx *brx,
 					 struct v4l2_subdev_state *sd_state,
 					 unsigned int pad)
 {
-	return v4l2_subdev_get_try_compose(&brx->entity.subdev, sd_state, pad);
+	return v4l2_subdev_state_get_compose(sd_state, pad);
 }
 
 static void brx_try_format(struct vsp1_brx *brx,
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
index c31f05a80bb5..d5a49e08a607 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
@@ -142,7 +142,7 @@ vsp1_entity_get_pad_format(struct vsp1_entity *entity,
 			   struct v4l2_subdev_state *sd_state,
 			   unsigned int pad)
 {
-	return v4l2_subdev_get_try_format(&entity->subdev, sd_state, pad);
+	return v4l2_subdev_state_get_format(sd_state, pad);
 }
 
 /**
@@ -163,11 +163,9 @@ vsp1_entity_get_pad_selection(struct vsp1_entity *entity,
 {
 	switch (target) {
 	case V4L2_SEL_TGT_COMPOSE:
-		return v4l2_subdev_get_try_compose(&entity->subdev, sd_state,
-						   pad);
+		return v4l2_subdev_state_get_compose(sd_state, pad);
 	case V4L2_SEL_TGT_CROP:
-		return v4l2_subdev_get_try_crop(&entity->subdev, sd_state,
-						pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	default:
 		return NULL;
 	}
diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
index 22a82d218152..ae7ff8d5ecf1 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
@@ -19,8 +19,7 @@
 struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
 				     struct v4l2_subdev_state *sd_state)
 {
-	return v4l2_subdev_get_try_crop(&rwpf->entity.subdev, sd_state,
-					RWPF_PAD_SINK);
+	return v4l2_subdev_state_get_crop(sd_state, RWPF_PAD_SINK);
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
index 6e17b2817e61..47f4353a1784 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
@@ -242,8 +242,8 @@ static int rkisp1_csi_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index)
 			return -EINVAL;
 
-		sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-						      RKISP1_CSI_PAD_SINK);
+		sink_fmt = v4l2_subdev_state_get_format(sd_state,
+							RKISP1_CSI_PAD_SINK);
 		code->code = sink_fmt->code;
 
 		return 0;
@@ -275,10 +275,8 @@ static int rkisp1_csi_init_config(struct v4l2_subdev *sd,
 {
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 
-	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-					      RKISP1_CSI_PAD_SINK);
-	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-					     RKISP1_CSI_PAD_SRC);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_CSI_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_CSI_PAD_SRC);
 
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
@@ -301,7 +299,7 @@ static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
 	if (fmt->pad == RKISP1_CSI_PAD_SRC)
 		return v4l2_subdev_get_fmt(sd, sd_state, fmt);
 
-	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state, RKISP1_CSI_PAD_SINK);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_CSI_PAD_SINK);
 
 	sink_fmt->code = fmt->format.code;
 
@@ -321,7 +319,7 @@ static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
 	fmt->format = *sink_fmt;
 
 	/* Propagate the format to the source pad. */
-	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state, RKISP1_CSI_PAD_SRC);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_CSI_PAD_SRC);
 	*src_fmt = *sink_fmt;
 
 	return 0;
@@ -374,7 +372,7 @@ static int rkisp1_csi_s_stream(struct v4l2_subdev *sd, int enable)
 		return -EINVAL;
 
 	sd_state = v4l2_subdev_lock_and_get_active_state(sd);
-	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state, RKISP1_CSI_PAD_SINK);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_CSI_PAD_SINK);
 	format = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 	v4l2_subdev_unlock_state(sd_state);
 
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 88ca8b2283b7..117912d3bfbd 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -66,8 +66,8 @@ static void rkisp1_config_ism(struct rkisp1_isp *isp,
 			      struct v4l2_subdev_state *sd_state)
 {
 	const struct v4l2_rect *src_crop =
-		v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
-					 RKISP1_ISP_PAD_SOURCE_VIDEO);
+		v4l2_subdev_state_get_crop(sd_state,
+					   RKISP1_ISP_PAD_SOURCE_VIDEO);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 val;
 
@@ -102,12 +102,12 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	const struct v4l2_mbus_framefmt *sink_frm;
 	const struct v4l2_rect *sink_crop;
 
-	sink_frm = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-					      RKISP1_ISP_PAD_SINK_VIDEO);
-	sink_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
-					     RKISP1_ISP_PAD_SINK_VIDEO);
-	src_frm = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+	sink_frm = v4l2_subdev_state_get_format(sd_state,
+						RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state,
+					       RKISP1_ISP_PAD_SINK_VIDEO);
+	src_frm = v4l2_subdev_state_get_format(sd_state,
+					       RKISP1_ISP_PAD_SOURCE_VIDEO);
 
 	sink_fmt = rkisp1_mbus_info_get_by_code(sink_frm->code);
 	src_fmt = rkisp1_mbus_info_get_by_code(src_frm->code);
@@ -201,8 +201,8 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	} else {
 		struct v4l2_mbus_framefmt *src_frm;
 
-		src_frm = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-						     RKISP1_ISP_PAD_SOURCE_VIDEO);
+		src_frm = v4l2_subdev_state_get_format(sd_state,
+						       RKISP1_ISP_PAD_SOURCE_VIDEO);
 		rkisp1_params_pre_configure(&rkisp1->params, sink_fmt->bayer_pat,
 					    src_frm->quantization,
 					    src_frm->ycbcr_enc);
@@ -318,8 +318,8 @@ static void rkisp1_isp_start(struct rkisp1_isp *isp,
 	       RKISP1_CIF_ISP_CTRL_ISP_INFORM_ENABLE;
 	rkisp1_write(rkisp1, RKISP1_CIF_ISP_CTRL, val);
 
-	src_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(sd_state,
+				               RKISP1_ISP_PAD_SOURCE_VIDEO);
 	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
 
 	if (src_info->pixel_enc != V4L2_PIXEL_ENC_BAYER)
@@ -416,8 +416,8 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 	struct v4l2_rect *sink_crop, *src_crop;
 
 	/* Video. */
-	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-					      RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state,
+						RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
 	sink_fmt->field = V4L2_FIELD_NONE;
@@ -427,15 +427,15 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
 	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
-	sink_crop = v4l2_subdev_get_pad_crop(sd, sd_state,
-					     RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state,
+					       RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_crop->width = RKISP1_DEFAULT_WIDTH;
 	sink_crop->height = RKISP1_DEFAULT_HEIGHT;
 	sink_crop->left = 0;
 	sink_crop->top = 0;
 
-	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(sd_state,
+					       RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_fmt = *sink_fmt;
 	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
 	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
@@ -443,15 +443,15 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
 	src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 
-	src_crop = v4l2_subdev_get_pad_crop(sd, sd_state,
-					    RKISP1_ISP_PAD_SOURCE_VIDEO);
+	src_crop = v4l2_subdev_state_get_crop(sd_state,
+					      RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_crop = *sink_crop;
 
 	/* Parameters and statistics. */
-	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-					      RKISP1_ISP_PAD_SINK_PARAMS);
-	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-					     RKISP1_ISP_PAD_SOURCE_STATS);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state,
+						RKISP1_ISP_PAD_SINK_PARAMS);
+	src_fmt = v4l2_subdev_state_get_format(sd_state,
+					       RKISP1_ISP_PAD_SOURCE_STATS);
 	sink_fmt->width = 0;
 	sink_fmt->height = 0;
 	sink_fmt->field = V4L2_FIELD_NONE;
@@ -472,12 +472,12 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 	const struct v4l2_rect *src_crop;
 	bool set_csc;
 
-	sink_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-					      RKISP1_ISP_PAD_SINK_VIDEO);
-	src_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-					     RKISP1_ISP_PAD_SOURCE_VIDEO);
-	src_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
-					    RKISP1_ISP_PAD_SOURCE_VIDEO);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state,
+						RKISP1_ISP_PAD_SINK_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(sd_state,
+				               RKISP1_ISP_PAD_SOURCE_VIDEO);
+	src_crop = v4l2_subdev_state_get_crop(sd_state,
+				              RKISP1_ISP_PAD_SOURCE_VIDEO);
 
 	/*
 	 * Media bus code. The ISP can operate in pass-through mode (Bayer in,
@@ -570,10 +570,10 @@ static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
 	const struct v4l2_rect *sink_crop;
 	struct v4l2_rect *src_crop;
 
-	src_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
-					    RKISP1_ISP_PAD_SOURCE_VIDEO);
-	sink_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
-					     RKISP1_ISP_PAD_SINK_VIDEO);
+	src_crop = v4l2_subdev_state_get_crop(sd_state,
+					      RKISP1_ISP_PAD_SOURCE_VIDEO);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state,
+					       RKISP1_ISP_PAD_SINK_VIDEO);
 
 	src_crop->left = ALIGN(r->left, 2);
 	src_crop->width = ALIGN(r->width, 2);
@@ -584,8 +584,8 @@ static void rkisp1_isp_set_src_crop(struct rkisp1_isp *isp,
 	*r = *src_crop;
 
 	/* Propagate to out format */
-	src_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-					     RKISP1_ISP_PAD_SOURCE_VIDEO);
+	src_fmt = v4l2_subdev_state_get_format(sd_state,
+					       RKISP1_ISP_PAD_SOURCE_VIDEO);
 	rkisp1_isp_set_src_fmt(isp, sd_state, src_fmt);
 }
 
@@ -596,10 +596,10 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
 	struct v4l2_rect *sink_crop, *src_crop;
 	const struct v4l2_mbus_framefmt *sink_fmt;
 
-	sink_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
-					     RKISP1_ISP_PAD_SINK_VIDEO);
-	sink_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-					      RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state,
+					       RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state,
+						RKISP1_ISP_PAD_SINK_VIDEO);
 
 	sink_crop->left = ALIGN(r->left, 2);
 	sink_crop->width = ALIGN(r->width, 2);
@@ -610,8 +610,8 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
 	*r = *sink_crop;
 
 	/* Propagate to out crop */
-	src_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
-					    RKISP1_ISP_PAD_SOURCE_VIDEO);
+	src_crop = v4l2_subdev_state_get_crop(sd_state,
+					      RKISP1_ISP_PAD_SOURCE_VIDEO);
 	rkisp1_isp_set_src_crop(isp, sd_state, src_crop);
 }
 
@@ -624,8 +624,8 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 	struct v4l2_rect *sink_crop;
 	bool is_yuv;
 
-	sink_fmt = v4l2_subdev_get_pad_format(&isp->sd, sd_state,
-					      RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state,
+						RKISP1_ISP_PAD_SINK_VIDEO);
 	sink_fmt->code = format->code;
 	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SINK)) {
@@ -673,8 +673,8 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 	*format = *sink_fmt;
 
 	/* Propagate to in crop */
-	sink_crop = v4l2_subdev_get_pad_crop(&isp->sd, sd_state,
-					     RKISP1_ISP_PAD_SINK_VIDEO);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state,
+					       RKISP1_ISP_PAD_SINK_VIDEO);
 	rkisp1_isp_set_sink_crop(isp, sd_state, sink_crop);
 }
 
@@ -689,7 +689,8 @@ static int rkisp1_isp_set_fmt(struct v4l2_subdev *sd,
 	else if (fmt->pad == RKISP1_ISP_PAD_SOURCE_VIDEO)
 		rkisp1_isp_set_src_fmt(isp, sd_state, &fmt->format);
 	else
-		fmt->format = *v4l2_subdev_get_pad_format(sd, sd_state, fmt->pad);
+		fmt->format = *v4l2_subdev_state_get_format(sd_state,
+							    fmt->pad);
 
 	return 0;
 }
@@ -709,19 +710,19 @@ static int rkisp1_isp_get_selection(struct v4l2_subdev *sd,
 		if (sel->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
 			struct v4l2_mbus_framefmt *fmt;
 
-			fmt = v4l2_subdev_get_pad_format(sd, sd_state, sel->pad);
+			fmt = v4l2_subdev_state_get_format(sd_state, sel->pad);
 			sel->r.height = fmt->height;
 			sel->r.width = fmt->width;
 			sel->r.left = 0;
 			sel->r.top = 0;
 		} else {
-			sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state,
-							   RKISP1_ISP_PAD_SINK_VIDEO);
+			sel->r = *v4l2_subdev_state_get_crop(sd_state,
+							     RKISP1_ISP_PAD_SINK_VIDEO);
 		}
 		break;
 
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state, sel->pad);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		break;
 
 	default:
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
index 28ecc7347d54..9f94b9f60c35 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
@@ -142,10 +142,8 @@ static void rkisp1_dcrop_config(struct rkisp1_resizer *rsz,
 	struct v4l2_rect *sink_crop;
 	u32 dc_ctrl;
 
-	sink_crop = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
-					     RKISP1_RSZ_PAD_SINK);
-	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
-					      RKISP1_RSZ_PAD_SINK);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SINK);
 
 	if (sink_crop->width == sink_fmt->width &&
 	    sink_crop->height == sink_fmt->height &&
@@ -275,10 +273,8 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	struct v4l2_area src_y, src_c;
 	struct v4l2_rect sink_c;
 
-	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
-					      RKISP1_RSZ_PAD_SINK);
-	src_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
-					     RKISP1_RSZ_PAD_SRC);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SRC);
 
 	sink_yuv_info = rkisp1_rsz_get_yuv_mbus_info(sink_fmt->code);
 	src_yuv_info = rkisp1_rsz_get_yuv_mbus_info(src_fmt->code);
@@ -292,8 +288,7 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 		return;
 	}
 
-	sink_y = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
-					  RKISP1_RSZ_PAD_SINK);
+	sink_y = v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK);
 	sink_c.width = sink_y->width / sink_yuv_info->hdiv;
 	sink_c.height = sink_y->height / sink_yuv_info->vdiv;
 
@@ -377,8 +372,7 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-					      RKISP1_RSZ_PAD_SRC);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SRC);
 	sink_fmt->width = RKISP1_DEFAULT_WIDTH;
 	sink_fmt->height = RKISP1_DEFAULT_HEIGHT;
 	sink_fmt->field = V4L2_FIELD_NONE;
@@ -388,15 +382,13 @@ static int rkisp1_rsz_init_config(struct v4l2_subdev *sd,
 	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
 	sink_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
 
-	sink_crop = v4l2_subdev_get_try_crop(sd, sd_state,
-					     RKISP1_RSZ_PAD_SINK);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK);
 	sink_crop->width = RKISP1_DEFAULT_WIDTH;
 	sink_crop->height = RKISP1_DEFAULT_HEIGHT;
 	sink_crop->left = 0;
 	sink_crop->top = 0;
 
-	src_fmt = v4l2_subdev_get_pad_format(sd, sd_state,
-					     RKISP1_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SINK);
 	*src_fmt = *sink_fmt;
 
 	/* NOTE: there is no crop in the source pad, only in the sink */
@@ -411,10 +403,8 @@ static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
 	const struct rkisp1_mbus_info *sink_mbus_info;
 	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
 
-	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
-					      RKISP1_RSZ_PAD_SINK);
-	src_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
-					     RKISP1_RSZ_PAD_SRC);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SRC);
 
 	sink_mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
 
@@ -441,10 +431,8 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
 	struct v4l2_mbus_framefmt *sink_fmt;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
-					      RKISP1_RSZ_PAD_SINK);
-	sink_crop = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
-					     RKISP1_RSZ_PAD_SINK);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SINK);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK);
 
 	/* Not crop for MP bayer raw data */
 	mbus_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
@@ -478,12 +466,9 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	struct v4l2_rect *sink_crop;
 	bool is_yuv;
 
-	sink_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
-					      RKISP1_RSZ_PAD_SINK);
-	src_fmt = v4l2_subdev_get_pad_format(&rsz->sd, sd_state,
-					     RKISP1_RSZ_PAD_SRC);
-	sink_crop = v4l2_subdev_get_pad_crop(&rsz->sd, sd_state,
-					     RKISP1_RSZ_PAD_SINK);
+	sink_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SINK);
+	src_fmt = v4l2_subdev_state_get_format(sd_state, RKISP1_RSZ_PAD_SRC);
+	sink_crop = v4l2_subdev_state_get_crop(sd_state, RKISP1_RSZ_PAD_SINK);
 
 	if (rsz->id == RKISP1_SELFPATH)
 		sink_fmt->code = MEDIA_BUS_FMT_YUYV8_2X8;
@@ -573,8 +558,8 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		mf_sink = v4l2_subdev_get_pad_format(sd, sd_state,
-						     RKISP1_RSZ_PAD_SINK);
+		mf_sink = v4l2_subdev_state_get_format(sd_state,
+						       RKISP1_RSZ_PAD_SINK);
 		sel->r.height = mf_sink->height;
 		sel->r.width = mf_sink->width;
 		sel->r.left = 0;
@@ -582,8 +567,8 @@ static int rkisp1_rsz_get_selection(struct v4l2_subdev *sd,
 		break;
 
 	case V4L2_SEL_TGT_CROP:
-		sel->r = *v4l2_subdev_get_pad_crop(sd, sd_state,
-						   RKISP1_RSZ_PAD_SINK);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state,
+						     RKISP1_RSZ_PAD_SINK);
 		break;
 
 	default:
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index a0d43bf892e6..05cafba1c728 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -1479,7 +1479,7 @@ static int fimc_subdev_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1534,7 +1534,7 @@ static int fimc_subdev_set_fmt(struct v4l2_subdev *sd,
 	mf->colorspace = V4L2_COLORSPACE_JPEG;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*mf = fmt->format;
 		return 0;
 	}
@@ -1604,10 +1604,10 @@ static int fimc_subdev_get_selection(struct v4l2_subdev *sd,
 		return 0;
 
 	case V4L2_SEL_TGT_CROP:
-		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
+		try_sel = v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
+		try_sel = v4l2_subdev_state_get_compose(sd_state, sel->pad);
 		f = &ctx->d_frame;
 		break;
 	default:
@@ -1651,10 +1651,10 @@ static int fimc_subdev_set_selection(struct v4l2_subdev *sd,
 
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
-		try_sel = v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
+		try_sel = v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		try_sel = v4l2_subdev_get_try_compose(sd, sd_state, sel->pad);
+		try_sel = v4l2_subdev_state_get_compose(sd_state, sel->pad);
 		f = &ctx->d_frame;
 		break;
 	default:
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
index b85986e50f46..3c5d7bee2655 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
@@ -126,7 +126,7 @@ static int fimc_isp_subdev_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf = &fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*mf = *v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		*mf = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		return 0;
 	}
 
@@ -172,9 +172,8 @@ static void __isp_subdev_try_format(struct fimc_isp *isp,
 		mf->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	} else {
 		if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-			format = v4l2_subdev_get_try_format(&isp->subdev,
-							    sd_state,
-							    FIMC_ISP_SD_PAD_SINK);
+			format = v4l2_subdev_state_get_format(sd_state,
+							      FIMC_ISP_SD_PAD_SINK);
 		else
 			format = &isp->sink_fmt;
 
@@ -207,7 +206,7 @@ static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
 	__isp_subdev_try_format(isp, sd_state, fmt);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*mf = fmt->format;
 
 		/* Propagate format to the source pads */
@@ -220,8 +219,8 @@ static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
 				format.pad = pad;
 				__isp_subdev_try_format(isp, sd_state,
 							&format);
-				mf = v4l2_subdev_get_try_format(sd, sd_state,
-								pad);
+				mf = v4l2_subdev_state_get_format(sd_state,
+								  pad);
 				*mf = format.format;
 			}
 		}
@@ -374,18 +373,17 @@ static int fimc_isp_subdev_open(struct v4l2_subdev *sd,
 		.field = V4L2_FIELD_NONE,
 	};
 
-	format = v4l2_subdev_get_try_format(sd, fh->state,
-					    FIMC_ISP_SD_PAD_SINK);
+	format = v4l2_subdev_state_get_format(fh->state, FIMC_ISP_SD_PAD_SINK);
 	*format = fmt;
 
-	format = v4l2_subdev_get_try_format(sd, fh->state,
-					    FIMC_ISP_SD_PAD_SRC_FIFO);
+	format = v4l2_subdev_state_get_format(fh->state,
+					      FIMC_ISP_SD_PAD_SRC_FIFO);
 	fmt.width = DEFAULT_PREVIEW_STILL_WIDTH;
 	fmt.height = DEFAULT_PREVIEW_STILL_HEIGHT;
 	*format = fmt;
 
-	format = v4l2_subdev_get_try_format(sd, fh->state,
-					    FIMC_ISP_SD_PAD_SRC_DMA);
+	format = v4l2_subdev_state_get_format(fh->state,
+					      FIMC_ISP_SD_PAD_SRC_DMA);
 	*format = fmt;
 
 	return 0;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
index 9396b10b5b1c..7898c9bebb04 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -574,16 +574,14 @@ static const struct fimc_fmt *fimc_lite_subdev_try_fmt(struct fimc_lite *fimc,
 		struct v4l2_rect *rect;
 
 		if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-			sink_fmt = v4l2_subdev_get_try_format(&fimc->subdev,
-							      sd_state,
-							      FLITE_SD_PAD_SINK);
+			sink_fmt = v4l2_subdev_state_get_format(sd_state,
+								FLITE_SD_PAD_SINK);
 
 			mf->code = sink_fmt->code;
 			mf->colorspace = sink_fmt->colorspace;
 
-			rect = v4l2_subdev_get_try_crop(&fimc->subdev,
-							sd_state,
-							FLITE_SD_PAD_SINK);
+			rect = v4l2_subdev_state_get_crop(sd_state,
+							  FLITE_SD_PAD_SINK);
 		} else {
 			mf->code = sink->fmt->mbus_code;
 			mf->colorspace = sink->fmt->colorspace;
@@ -1021,7 +1019,7 @@ static struct v4l2_mbus_framefmt *__fimc_lite_subdev_get_try_fmt(
 	if (pad != FLITE_SD_PAD_SINK)
 		pad = FLITE_SD_PAD_SOURCE_DMA;
 
-	return v4l2_subdev_get_try_format(sd, sd_state, pad);
+	return v4l2_subdev_state_get_format(sd_state, pad);
 }
 
 static int fimc_lite_subdev_get_fmt(struct v4l2_subdev *sd,
@@ -1129,7 +1127,7 @@ static int fimc_lite_subdev_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sel->r = *v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		return 0;
 	}
 
@@ -1166,7 +1164,7 @@ static int fimc_lite_subdev_set_selection(struct v4l2_subdev *sd,
 	fimc_lite_try_crop(fimc, &sel->r);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_crop(sd, sd_state, sel->pad) = sel->r;
+		*v4l2_subdev_state_get_crop(sd_state, sel->pad) = sel->r;
 	} else {
 		unsigned long flags;
 		spin_lock_irqsave(&fimc->slock, flags);
diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
index 686ca8753ba2..aae8a8b2c0f4 100644
--- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
@@ -569,8 +569,7 @@ static struct v4l2_mbus_framefmt *__s5pcsis_get_format(
 		enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return sd_state ? v4l2_subdev_get_try_format(&state->sd,
-							     sd_state, 0) : NULL;
+		return sd_state ? v4l2_subdev_state_get_format(sd_state, 0) : NULL;
 
 	return &state->format;
 }
diff --git a/drivers/media/platform/samsung/s3c-camif/camif-capture.c b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
index 0f5b3845d7b9..be58260ea67e 100644
--- a/drivers/media/platform/samsung/s3c-camif/camif-capture.c
+++ b/drivers/media/platform/samsung/s3c-camif/camif-capture.c
@@ -1216,7 +1216,7 @@ static int s3c_camif_subdev_get_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf = &fmt->format;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		fmt->format = *mf;
 		return 0;
 	}
@@ -1305,7 +1305,7 @@ static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
 	__camif_subdev_try_format(camif, mf, fmt->pad);
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 		*mf = fmt->format;
 		mutex_unlock(&camif->lock);
 		return 0;
@@ -1357,7 +1357,7 @@ static int s3c_camif_subdev_get_selection(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		sel->r = *v4l2_subdev_get_try_crop(sd, sd_state, sel->pad);
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
 		return 0;
 	}
 
@@ -1445,7 +1445,7 @@ static int s3c_camif_subdev_set_selection(struct v4l2_subdev *sd,
 	__camif_try_crop(camif, &sel->r);
 
 	if (sel->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_get_try_crop(sd, sd_state, sel->pad) = sel->r;
+		*v4l2_subdev_state_get_crop(sd_state, sel->pad) = sel->r;
 	} else {
 		unsigned long flags;
 		unsigned int i;
diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 48702134ccc5..c37bb1d76ef6 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -271,7 +271,7 @@ static int sun4i_csi_subdev_init_cfg(struct v4l2_subdev *subdev,
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = v4l2_subdev_get_try_format(subdev, sd_state, CSI_SUBDEV_SINK);
+	fmt = v4l2_subdev_state_get_format(sd_state, CSI_SUBDEV_SINK);
 	*fmt = sun4i_csi_pad_fmt_default;
 
 	return 0;
@@ -285,8 +285,7 @@ static int sun4i_csi_subdev_get_fmt(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *subdev_fmt;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		subdev_fmt = v4l2_subdev_get_try_format(subdev, sd_state,
-							fmt->pad);
+		subdev_fmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	else
 		subdev_fmt = &csi->subdev_fmt;
 
@@ -303,8 +302,7 @@ static int sun4i_csi_subdev_set_fmt(struct v4l2_subdev *subdev,
 	struct v4l2_mbus_framefmt *subdev_fmt;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		subdev_fmt = v4l2_subdev_get_try_format(subdev, sd_state,
-							fmt->pad);
+		subdev_fmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	else
 		subdev_fmt = &csi->subdev_fmt;
 
diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
index e573413123b9..d57481feee05 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
@@ -507,7 +507,7 @@ static int sun6i_csi_bridge_init_cfg(struct v4l2_subdev *subdev,
 	struct sun6i_csi_device *csi_dev = v4l2_get_subdevdata(subdev);
 	unsigned int pad = SUN6I_CSI_BRIDGE_PAD_SINK;
 	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_get_try_format(subdev, state, pad);
+		v4l2_subdev_state_get_format(state, pad);
 	struct mutex *lock = &csi_dev->bridge.lock;
 
 	mutex_lock(lock);
@@ -547,8 +547,8 @@ static int sun6i_csi_bridge_get_fmt(struct v4l2_subdev *subdev,
 	mutex_lock(lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
-							   format->pad);
+		*mbus_format = *v4l2_subdev_state_get_format(state,
+							     format->pad);
 	else
 		*mbus_format = csi_dev->bridge.mbus_format;
 
@@ -570,7 +570,7 @@ static int sun6i_csi_bridge_set_fmt(struct v4l2_subdev *subdev,
 	sun6i_csi_bridge_mbus_format_prepare(mbus_format);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
+		*v4l2_subdev_state_get_format(state, format->pad) =
 			*mbus_format;
 	else
 		csi_dev->bridge.mbus_format = *mbus_format;
diff --git a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
index 08d86c17b284..d2c9f5d20496 100644
--- a/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
@@ -311,7 +311,7 @@ static int sun6i_mipi_csi2_init_cfg(struct v4l2_subdev *subdev,
 	struct sun6i_mipi_csi2_device *csi2_dev = v4l2_get_subdevdata(subdev);
 	unsigned int pad = SUN6I_MIPI_CSI2_PAD_SINK;
 	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_get_try_format(subdev, state, pad);
+		v4l2_subdev_state_get_format(state, pad);
 	struct mutex *lock = &csi2_dev->bridge.lock;
 
 	mutex_lock(lock);
@@ -351,8 +351,8 @@ static int sun6i_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
 	mutex_lock(lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
-							   format->pad);
+		*mbus_format = *v4l2_subdev_state_get_format(state,
+							     format->pad);
 	else
 		*mbus_format = csi2_dev->bridge.mbus_format;
 
@@ -374,7 +374,7 @@ static int sun6i_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 	sun6i_mipi_csi2_mbus_format_prepare(mbus_format);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
+		*v4l2_subdev_state_get_format(state, format->pad) =
 			*mbus_format;
 	else
 		csi2_dev->bridge.mbus_format = *mbus_format;
diff --git a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
index 14a1844812c0..d6275954af98 100644
--- a/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
+++ b/drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
@@ -345,7 +345,7 @@ static int sun8i_a83t_mipi_csi2_init_cfg(struct v4l2_subdev *subdev,
 		v4l2_get_subdevdata(subdev);
 	unsigned int pad = SUN8I_A83T_MIPI_CSI2_PAD_SINK;
 	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_get_try_format(subdev, state, pad);
+		v4l2_subdev_state_get_format(state, pad);
 	struct mutex *lock = &csi2_dev->bridge.lock;
 
 	mutex_lock(lock);
@@ -387,8 +387,8 @@ static int sun8i_a83t_mipi_csi2_get_fmt(struct v4l2_subdev *subdev,
 	mutex_lock(lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
-							   format->pad);
+		*mbus_format = *v4l2_subdev_state_get_format(state,
+							     format->pad);
 	else
 		*mbus_format = csi2_dev->bridge.mbus_format;
 
@@ -411,7 +411,7 @@ static int sun8i_a83t_mipi_csi2_set_fmt(struct v4l2_subdev *subdev,
 	sun8i_a83t_mipi_csi2_mbus_format_prepare(mbus_format);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
+		*v4l2_subdev_state_get_format(state, format->pad) =
 			*mbus_format;
 	else
 		csi2_dev->bridge.mbus_format = *mbus_format;
diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
index 1a4273bbe752..61433744c6c4 100644
--- a/drivers/media/platform/ti/cal/cal-camerarx.c
+++ b/drivers/media/platform/ti/cal/cal-camerarx.c
@@ -57,7 +57,7 @@ static s64 cal_camerarx_get_ext_link_freq(struct cal_camerarx *phy)
 
 	state = v4l2_subdev_get_locked_active_state(&phy->subdev);
 
-	fmt = v4l2_subdev_get_pad_format(&phy->subdev, state, CAL_CAMERARX_PAD_SINK);
+	fmt = v4l2_subdev_state_get_format(state, CAL_CAMERARX_PAD_SINK);
 
 	fmtinfo = cal_format_by_code(fmt->code);
 	if (!fmtinfo)
@@ -621,8 +621,6 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 					  struct v4l2_subdev_state *state,
 					  struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct cal_camerarx *phy = to_cal_camerarx(sd);
-
 	/* No transcoding, source and sink codes must match. */
 	if (cal_rx_pad_is_source(code->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
@@ -630,8 +628,8 @@ static int cal_camerarx_sd_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_get_pad_format(&phy->subdev, state,
-						 CAL_CAMERARX_PAD_SINK);
+		fmt = v4l2_subdev_state_get_format(state,
+						   CAL_CAMERARX_PAD_SINK);
 		code->code = fmt->code;
 	} else {
 		if (code->index >= cal_num_formats)
@@ -656,8 +654,8 @@ static int cal_camerarx_sd_enum_frame_size(struct v4l2_subdev *sd,
 	if (cal_rx_pad_is_source(fse->pad)) {
 		struct v4l2_mbus_framefmt *fmt;
 
-		fmt = v4l2_subdev_get_pad_format(sd, state,
-						 CAL_CAMERARX_PAD_SINK);
+		fmt = v4l2_subdev_state_get_format(state,
+						   CAL_CAMERARX_PAD_SINK);
 		if (fse->code != fmt->code)
 			return -EINVAL;
 
@@ -713,11 +711,11 @@ static int cal_camerarx_sd_set_fmt(struct v4l2_subdev *sd,
 
 	/* Store the format and propagate it to the source pad. */
 
-	fmt = v4l2_subdev_get_pad_format(sd, state, CAL_CAMERARX_PAD_SINK);
+	fmt = v4l2_subdev_state_get_format(state, CAL_CAMERARX_PAD_SINK);
 	*fmt = format->format;
 
-	fmt = v4l2_subdev_get_pad_format(sd, state,
-					 CAL_CAMERARX_PAD_FIRST_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state,
+					   CAL_CAMERARX_PAD_FIRST_SOURCE);
 	*fmt = format->format;
 
 	return 0;
diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index a8abcd0fee17..da4dcfc829b7 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -697,7 +697,7 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 
 	state = v4l2_subdev_lock_and_get_active_state(&ctx->phy->subdev);
 
-	format = v4l2_subdev_get_pad_format(&ctx->phy->subdev, state, remote_pad->index);
+	format = v4l2_subdev_state_get_format(state, remote_pad->index);
 	if (!format) {
 		ret = -EINVAL;
 		goto out;
diff --git a/drivers/media/platform/ti/omap3isp/ispccdc.c b/drivers/media/platform/ti/omap3isp/ispccdc.c
index 2fe42aa91800..7f46d0cdde6e 100644
--- a/drivers/media/platform/ti/omap3isp/ispccdc.c
+++ b/drivers/media/platform/ti/omap3isp/ispccdc.c
@@ -1948,8 +1948,7 @@ __ccdc_get_format(struct isp_ccdc_device *ccdc,
 		  unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ccdc->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &ccdc->formats[pad];
 }
@@ -1960,8 +1959,8 @@ __ccdc_get_crop(struct isp_ccdc_device *ccdc,
 		enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&ccdc->subdev, sd_state,
-						CCDC_PAD_SOURCE_OF);
+		return v4l2_subdev_state_get_crop(sd_state,
+						  CCDC_PAD_SOURCE_OF);
 	else
 		return &ccdc->crop;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index da5f0176ec78..0517d410b22c 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -625,8 +625,7 @@ __ccp2_get_format(struct isp_ccp2_device *ccp2,
 		  unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ccp2->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &ccp2->formats[pad];
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispcsi2.c b/drivers/media/platform/ti/omap3isp/ispcsi2.c
index 0f9a54b11f98..21270fc4e623 100644
--- a/drivers/media/platform/ti/omap3isp/ispcsi2.c
+++ b/drivers/media/platform/ti/omap3isp/ispcsi2.c
@@ -834,8 +834,7 @@ __csi2_get_format(struct isp_csi2_device *csi2,
 		  unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &csi2->formats[pad];
 }
diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 53aedec7990d..fe550021d930 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -1684,8 +1684,7 @@ __preview_get_format(struct isp_prev_device *prev,
 		     unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&prev->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &prev->formats[pad];
 }
@@ -1696,8 +1695,7 @@ __preview_get_crop(struct isp_prev_device *prev,
 		   enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&prev->subdev, sd_state,
-						PREV_PAD_SINK);
+		return v4l2_subdev_state_get_crop(sd_state, PREV_PAD_SINK);
 	else
 		return &prev->crop;
 }
diff --git a/drivers/media/platform/ti/omap3isp/ispresizer.c b/drivers/media/platform/ti/omap3isp/ispresizer.c
index ed2fb0c7a57e..bbcb27508fab 100644
--- a/drivers/media/platform/ti/omap3isp/ispresizer.c
+++ b/drivers/media/platform/ti/omap3isp/ispresizer.c
@@ -119,7 +119,7 @@ __resizer_get_format(struct isp_res_device *res,
 		     unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&res->subdev, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &res->formats[pad];
 }
@@ -136,8 +136,7 @@ __resizer_get_crop(struct isp_res_device *res,
 		   enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&res->subdev, sd_state,
-						RESZ_PAD_SINK);
+		return v4l2_subdev_state_get_crop(sd_state, RESZ_PAD_SINK);
 	else
 		return &res->crop.request;
 }
diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
index 5de6b6694f53..06a28531ed02 100644
--- a/drivers/media/platform/video-mux.c
+++ b/drivers/media/platform/video-mux.c
@@ -89,10 +89,10 @@ static int video_mux_link_setup(struct media_entity *entity,
 
 		/* Propagate the active format to the source */
 		sd_state = v4l2_subdev_lock_and_get_active_state(sd);
-		source_mbusformat = v4l2_subdev_get_pad_format(sd, sd_state,
-							       source_pad);
-		*source_mbusformat = *v4l2_subdev_get_pad_format(sd, sd_state,
-								 vmux->active);
+		source_mbusformat = v4l2_subdev_state_get_format(sd_state,
+								 source_pad);
+		*source_mbusformat = *v4l2_subdev_state_get_format(sd_state,
+								   vmux->active);
 		v4l2_subdev_unlock_state(sd_state);
 	} else {
 		if (vmux->active != local->index)
@@ -154,11 +154,11 @@ static int video_mux_set_format(struct v4l2_subdev *sd,
 	struct media_pad *pad = &vmux->pads[sdformat->pad];
 	u16 source_pad = sd->entity.num_pads - 1;
 
-	mbusformat = v4l2_subdev_get_pad_format(sd, sd_state, sdformat->pad);
+	mbusformat = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
 	if (!mbusformat)
 		return -EINVAL;
 
-	source_mbusformat = v4l2_subdev_get_pad_format(sd, sd_state, source_pad);
+	source_mbusformat = v4l2_subdev_state_get_format(sd_state, source_pad);
 	if (!source_mbusformat)
 		return -EINVAL;
 
@@ -268,8 +268,8 @@ static int video_mux_set_format(struct v4l2_subdev *sd,
 
 	/* Source pad mirrors active sink pad, no limitations on sink pads */
 	if ((pad->flags & MEDIA_PAD_FL_SOURCE) && vmux->active >= 0)
-		sdformat->format = *v4l2_subdev_get_pad_format(sd, sd_state,
-							       vmux->active);
+		sdformat->format = *v4l2_subdev_state_get_format(sd_state,
+								 vmux->active);
 
 	*mbusformat = sdformat->format;
 
@@ -292,7 +292,7 @@ static int video_mux_init_cfg(struct v4l2_subdev *sd,
 	mutex_lock(&vmux->lock);
 
 	for (i = 0; i < sd->entity.num_pads; i++) {
-		mbusformat = v4l2_subdev_get_pad_format(sd, sd_state, i);
+		mbusformat = v4l2_subdev_state_get_format(sd_state, i);
 		*mbusformat = video_mux_format_mbus_default;
 	}
 
diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
index 5b53745fe44e..3e94d4f0b623 100644
--- a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
+++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
@@ -671,8 +671,7 @@ __xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&xcsi2rxss->subdev,
-						  sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &xcsi2rxss->format;
 	default:
@@ -699,7 +698,7 @@ static int xcsi2rxss_init_cfg(struct v4l2_subdev *sd,
 
 	mutex_lock(&xcsi2rxss->lock);
 	for (i = 0; i < XCSI_MEDIA_PADS; i++) {
-		format = v4l2_subdev_get_try_format(sd, sd_state, i);
+		format = v4l2_subdev_state_get_format(sd_state, i);
 		*format = xcsi2rxss->default_format;
 	}
 	mutex_unlock(&xcsi2rxss->lock);
diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index 80353ca44402..e05e528ffc6f 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -256,8 +256,7 @@ __xtpg_get_pad_format(struct xtpg_device *xtpg,
 {
 	switch (which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
-		return v4l2_subdev_get_try_format(&xtpg->xvip.subdev,
-						  sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	case V4L2_SUBDEV_FORMAT_ACTIVE:
 		return &xtpg->formats[pad];
 	default:
@@ -326,7 +325,7 @@ static int xtpg_enum_frame_size(struct v4l2_subdev *subdev,
 {
 	struct v4l2_mbus_framefmt *format;
 
-	format = v4l2_subdev_get_try_format(subdev, sd_state, fse->pad);
+	format = v4l2_subdev_state_get_format(sd_state, fse->pad);
 
 	if (fse->index || fse->code != format->code)
 		return -EINVAL;
@@ -354,11 +353,11 @@ static int xtpg_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 	struct xtpg_device *xtpg = to_tpg(subdev);
 	struct v4l2_mbus_framefmt *format;
 
-	format = v4l2_subdev_get_try_format(subdev, fh->state, 0);
+	format = v4l2_subdev_state_get_format(fh->state, 0);
 	*format = xtpg->default_format;
 
 	if (xtpg->npads == 2) {
-		format = v4l2_subdev_get_try_format(subdev, fh->state, 1);
+		format = v4l2_subdev_state_get_format(fh->state, 1);
 		*format = xtpg->default_format;
 	}
 
diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index 5b214bf7f93a..f1574edd2b43 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -260,7 +260,7 @@ int xvip_enum_mbus_code(struct v4l2_subdev *subdev,
 	if (code->index)
 		return -EINVAL;
 
-	format = v4l2_subdev_get_try_format(subdev, sd_state, code->pad);
+	format = v4l2_subdev_state_get_format(sd_state, code->pad);
 
 	code->code = format->code;
 
@@ -295,7 +295,7 @@ int xvip_enum_frame_size(struct v4l2_subdev *subdev,
 	if (fse->which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		return -EINVAL;
 
-	format = v4l2_subdev_get_try_format(subdev, sd_state, fse->pad);
+	format = v4l2_subdev_state_get_format(sd_state, fse->pad);
 
 	if (fse->index || fse->code != format->code)
 		return -EINVAL;
diff --git a/drivers/media/test-drivers/vimc/vimc-debayer.c b/drivers/media/test-drivers/vimc/vimc-debayer.c
index f671251fdf0e..a2fb32c97c84 100644
--- a/drivers/media/test-drivers/vimc/vimc-debayer.c
+++ b/drivers/media/test-drivers/vimc/vimc-debayer.c
@@ -157,11 +157,11 @@ static int vimc_debayer_init_cfg(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf;
 	unsigned int i;
 
-	mf = v4l2_subdev_get_try_format(sd, sd_state, 0);
+	mf = v4l2_subdev_state_get_format(sd_state, 0);
 	*mf = sink_fmt_default;
 
 	for (i = 1; i < sd->entity.num_pads; i++) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
+		mf = v4l2_subdev_state_get_format(sd_state, i);
 		*mf = sink_fmt_default;
 		mf->code = vdebayer->src_code;
 	}
@@ -221,7 +221,7 @@ static int vimc_debayer_get_fmt(struct v4l2_subdev *sd,
 
 	/* Get the current sink format */
 	fmt->format = fmt->which == V4L2_SUBDEV_FORMAT_TRY ?
-		      *v4l2_subdev_get_try_format(sd, sd_state, 0) :
+		      *v4l2_subdev_state_get_format(sd_state, 0) :
 		      vdebayer->sink_fmt;
 
 	/* Set the right code for the source pad */
@@ -267,8 +267,8 @@ static int vimc_debayer_set_fmt(struct v4l2_subdev *sd,
 		sink_fmt = &vdebayer->sink_fmt;
 		src_code = &vdebayer->src_code;
 	} else {
-		sink_fmt = v4l2_subdev_get_try_format(sd, sd_state, 0);
-		src_code = &v4l2_subdev_get_try_format(sd, sd_state, 1)->code;
+		sink_fmt = v4l2_subdev_state_get_format(sd_state, 0);
+		src_code = &v4l2_subdev_state_get_format(sd_state, 1)->code;
 	}
 
 	/*
diff --git a/drivers/media/test-drivers/vimc/vimc-scaler.c b/drivers/media/test-drivers/vimc/vimc-scaler.c
index b671774e2784..f6592a789f1e 100644
--- a/drivers/media/test-drivers/vimc/vimc-scaler.c
+++ b/drivers/media/test-drivers/vimc/vimc-scaler.c
@@ -78,11 +78,11 @@ static int vimc_scaler_init_cfg(struct v4l2_subdev *sd,
 	unsigned int i;
 
 	for (i = 0; i < sd->entity.num_pads; i++) {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
+		mf = v4l2_subdev_state_get_format(sd_state, i);
 		*mf = fmt_default;
 	}
 
-	r = v4l2_subdev_get_try_crop(sd, sd_state, VIMC_SCALER_SINK);
+	r = v4l2_subdev_state_get_crop(sd_state, VIMC_SCALER_SINK);
 	*r = crop_rect_default;
 
 	return 0;
@@ -138,7 +138,7 @@ vimc_scaler_pad_format(struct vimc_scaler_device *vscaler,
 		    enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&vscaler->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &vscaler->fmt[pad];
 }
@@ -149,8 +149,7 @@ vimc_scaler_pad_crop(struct vimc_scaler_device *vscaler,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&vscaler->sd, sd_state,
-						VIMC_SCALER_SINK);
+		return v4l2_subdev_state_get_crop(sd_state, VIMC_SCALER_SINK);
 	else
 		return &vscaler->crop_rect;
 }
diff --git a/drivers/media/test-drivers/vimc/vimc-sensor.c b/drivers/media/test-drivers/vimc/vimc-sensor.c
index 41a3dce2d714..676ab503f0ca 100644
--- a/drivers/media/test-drivers/vimc/vimc-sensor.c
+++ b/drivers/media/test-drivers/vimc/vimc-sensor.c
@@ -49,7 +49,7 @@ static int vimc_sensor_init_cfg(struct v4l2_subdev *sd,
 	for (i = 0; i < sd->entity.num_pads; i++) {
 		struct v4l2_mbus_framefmt *mf;
 
-		mf = v4l2_subdev_get_try_format(sd, sd_state, i);
+		mf = v4l2_subdev_state_get_format(sd_state, i);
 		*mf = fmt_default;
 	}
 
@@ -100,7 +100,7 @@ static int vimc_sensor_get_fmt(struct v4l2_subdev *sd,
 				container_of(sd, struct vimc_sensor_device, sd);
 
 	fmt->format = fmt->which == V4L2_SUBDEV_FORMAT_TRY ?
-		      *v4l2_subdev_get_try_format(sd, sd_state, fmt->pad) :
+		      *v4l2_subdev_state_get_format(sd_state, fmt->pad) :
 		      vsensor->mbus_format;
 
 	return 0;
@@ -159,7 +159,7 @@ static int vimc_sensor_set_fmt(struct v4l2_subdev *sd,
 
 		mf = &vsensor->mbus_format;
 	} else {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, fmt->pad);
+		mf = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	}
 
 	/* Set the new format */
diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index 58cddf11c9ab..5d89e4c1b0c2 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -361,7 +361,7 @@ gc0310_get_pad_format(struct gc0310_device *dev,
 		      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&dev->sd, state, pad);
+		return v4l2_subdev_state_get_format(state, pad);
 
 	return &dev->mode.fmt;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index abf55a86f795..89118438a3b6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -29,8 +29,7 @@ v4l2_mbus_framefmt *__csi2_get_format(struct atomisp_mipi_csi2_device *csi2,
 				      unsigned int pad)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &csi2->formats[pad];
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 471912dea5cd..a87fc74159e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -240,9 +240,9 @@ struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	if (which == V4L2_SUBDEV_FORMAT_TRY) {
 		switch (target) {
 		case V4L2_SEL_TGT_CROP:
-			return v4l2_subdev_get_try_crop(sd, sd_state, pad);
+			return v4l2_subdev_state_get_crop(sd_state, pad);
 		case V4L2_SEL_TGT_COMPOSE:
-			return v4l2_subdev_get_try_compose(sd, sd_state, pad);
+			return v4l2_subdev_state_get_compose(sd_state, pad);
 		}
 	}
 
@@ -264,7 +264,7 @@ struct v4l2_mbus_framefmt
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 
 	return &isp_sd->fmt[pad].fmt;
 }
diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index ac5fb332088e..61d69f19657e 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -82,10 +82,8 @@ static struct v4l2_mbus_framefmt *
 __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 	      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
-	struct imx_ic_priv *ic_priv = priv->ic_priv;
-
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ic_priv->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &priv->format_mbus;
 }
diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 9b81cfbcd777..ec73c901079e 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -790,10 +790,8 @@ static struct v4l2_mbus_framefmt *
 __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 	      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
-	struct imx_ic_priv *ic_priv = priv->ic_priv;
-
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ic_priv->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &priv->format_mbus[pad];
 }
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index dda1ebc34692..33902f5daf80 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1148,7 +1148,7 @@ __csi_get_fmt(struct csi_priv *priv, struct v4l2_subdev_state *sd_state,
 	      unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &priv->format_mbus[pad];
 }
@@ -1158,8 +1158,7 @@ __csi_get_crop(struct csi_priv *priv, struct v4l2_subdev_state *sd_state,
 	       enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&priv->sd, sd_state,
-						CSI_SINK_PAD);
+		return v4l2_subdev_state_get_crop(sd_state, CSI_SINK_PAD);
 	else
 		return &priv->crop;
 }
@@ -1169,8 +1168,7 @@ __csi_get_compose(struct csi_priv *priv, struct v4l2_subdev_state *sd_state,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_compose(&priv->sd, sd_state,
-						   CSI_SINK_PAD);
+		return v4l2_subdev_state_get_compose(sd_state, CSI_SINK_PAD);
 	else
 		return &priv->compose;
 }
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 064dc562bc96..ec4349ab48cd 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -445,7 +445,7 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
 		if (ret)
 			continue;
 
-		mf_try = v4l2_subdev_get_try_format(sd, sd_state, pad);
+		mf_try = v4l2_subdev_state_get_format(sd_state, pad);
 		*mf_try = format.format;
 	}
 
diff --git a/drivers/staging/media/imx/imx-media-vdic.c b/drivers/staging/media/imx/imx-media-vdic.c
index 3c2093c520ba..792bca1d2d25 100644
--- a/drivers/staging/media/imx/imx-media-vdic.c
+++ b/drivers/staging/media/imx/imx-media-vdic.c
@@ -536,7 +536,7 @@ __vdic_get_fmt(struct vdic_priv *priv, struct v4l2_subdev_state *sd_state,
 	       unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&priv->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &priv->format_mbus[pad];
 }
diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index b2d8476d83a0..6906220ee89e 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -501,7 +501,7 @@ __csi2_get_fmt(struct csi2_dev *csi2, struct v4l2_subdev_state *sd_state,
 	       unsigned int pad, enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi2->sd, sd_state, pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		return &csi2->format_mbus;
 }
diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index e530767e80a5..0fe2b858da83 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -36,7 +36,7 @@ static int imgu_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	/* Initialize try_fmt */
 	for (i = 0; i < IMGU_NODE_NUM; i++) {
 		struct v4l2_mbus_framefmt *try_fmt =
-			v4l2_subdev_get_try_format(sd, fh->state, i);
+			v4l2_subdev_state_get_format(fh->state, i);
 
 		try_fmt->width = try_crop.width;
 		try_fmt->height = try_crop.height;
@@ -44,8 +44,8 @@ static int imgu_subdev_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 		try_fmt->field = V4L2_FIELD_NONE;
 	}
 
-	*v4l2_subdev_get_try_crop(sd, fh->state, IMGU_NODE_IN) = try_crop;
-	*v4l2_subdev_get_try_compose(sd, fh->state, IMGU_NODE_IN) = try_crop;
+	*v4l2_subdev_state_get_crop(fh->state, IMGU_NODE_IN) = try_crop;
+	*v4l2_subdev_state_get_compose(fh->state, IMGU_NODE_IN) = try_crop;
 
 	return 0;
 }
@@ -136,7 +136,7 @@ static int imgu_subdev_get_fmt(struct v4l2_subdev *sd,
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		fmt->format = imgu_pipe->nodes[pad].pad_fmt;
 	} else {
-		mf = v4l2_subdev_get_try_format(sd, sd_state, pad);
+		mf = v4l2_subdev_state_get_format(sd_state, pad);
 		fmt->format = *mf;
 	}
 
@@ -161,7 +161,7 @@ static int imgu_subdev_set_fmt(struct v4l2_subdev *sd,
 
 	imgu_pipe = &imgu->imgu_pipe[pipe];
 	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		mf = v4l2_subdev_get_try_format(sd, sd_state, pad);
+		mf = v4l2_subdev_state_get_format(sd_state, pad);
 	else
 		mf = &imgu_pipe->nodes[pad].pad_fmt;
 
@@ -194,7 +194,7 @@ imgu_subdev_get_crop(struct imgu_v4l2_subdev *sd,
 		     enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_crop(&sd->subdev, sd_state, pad);
+		return v4l2_subdev_state_get_crop(sd_state, pad);
 	else
 		return &sd->rect.eff;
 }
@@ -205,7 +205,7 @@ imgu_subdev_get_compose(struct imgu_v4l2_subdev *sd,
 			enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_compose(&sd->subdev, sd_state, pad);
+		return v4l2_subdev_state_get_compose(sd_state, pad);
 	else
 		return &sd->rect.bds;
 }
diff --git a/drivers/staging/media/omap4iss/iss_csi2.c b/drivers/staging/media/omap4iss/iss_csi2.c
index d2844414de4f..3fd4a773ad80 100644
--- a/drivers/staging/media/omap4iss/iss_csi2.c
+++ b/drivers/staging/media/omap4iss/iss_csi2.c
@@ -830,8 +830,7 @@ __csi2_get_format(struct iss_csi2_device *csi2,
 		  enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&csi2->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 
 	return &csi2->formats[pad];
 }
diff --git a/drivers/staging/media/omap4iss/iss_ipipe.c b/drivers/staging/media/omap4iss/iss_ipipe.c
index 23f707cb336f..ad013ed923e7 100644
--- a/drivers/staging/media/omap4iss/iss_ipipe.c
+++ b/drivers/staging/media/omap4iss/iss_ipipe.c
@@ -180,8 +180,7 @@ __ipipe_get_format(struct iss_ipipe_device *ipipe,
 		   enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ipipe->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 
 	return &ipipe->formats[pad];
 }
diff --git a/drivers/staging/media/omap4iss/iss_ipipeif.c b/drivers/staging/media/omap4iss/iss_ipipeif.c
index 5e7f25cd53ac..5cafcd38438a 100644
--- a/drivers/staging/media/omap4iss/iss_ipipeif.c
+++ b/drivers/staging/media/omap4iss/iss_ipipeif.c
@@ -361,8 +361,7 @@ __ipipeif_get_format(struct iss_ipipeif_device *ipipeif,
 		     enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&ipipeif->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	return &ipipeif->formats[pad];
 }
 
diff --git a/drivers/staging/media/omap4iss/iss_resizer.c b/drivers/staging/media/omap4iss/iss_resizer.c
index a5f8f9f1ab16..be26467ad653 100644
--- a/drivers/staging/media/omap4iss/iss_resizer.c
+++ b/drivers/staging/media/omap4iss/iss_resizer.c
@@ -420,8 +420,7 @@ __resizer_get_format(struct iss_resizer_device *resizer,
 		     enum v4l2_subdev_format_whence which)
 {
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_get_try_format(&resizer->subdev, sd_state,
-						  pad);
+		return v4l2_subdev_state_get_format(sd_state, pad);
 	return &resizer->formats[pad];
 }
 
diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
index ccbb530aa2e2..b2ce0d4fae95 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp_proc.c
@@ -262,7 +262,7 @@ static int sun6i_isp_proc_init_cfg(struct v4l2_subdev *subdev,
 	struct sun6i_isp_device *isp_dev = v4l2_get_subdevdata(subdev);
 	unsigned int pad = SUN6I_ISP_PROC_PAD_SINK_CSI;
 	struct v4l2_mbus_framefmt *mbus_format =
-		v4l2_subdev_get_try_format(subdev, state, pad);
+		v4l2_subdev_state_get_format(state, pad);
 	struct mutex *lock = &isp_dev->proc.lock;
 
 	mutex_lock(lock);
@@ -302,8 +302,8 @@ static int sun6i_isp_proc_get_fmt(struct v4l2_subdev *subdev,
 	mutex_lock(lock);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*mbus_format = *v4l2_subdev_get_try_format(subdev, state,
-							   format->pad);
+		*mbus_format = *v4l2_subdev_state_get_format(state,
+							     format->pad);
 	else
 		*mbus_format = isp_dev->proc.mbus_format;
 
@@ -325,7 +325,7 @@ static int sun6i_isp_proc_set_fmt(struct v4l2_subdev *subdev,
 	sun6i_isp_proc_mbus_format_prepare(mbus_format);
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*v4l2_subdev_get_try_format(subdev, state, format->pad) =
+		*v4l2_subdev_state_get_format(state, format->pad) =
 			*mbus_format;
 	else
 		isp_dev->proc.mbus_format = *mbus_format;
-- 
2.39.2

