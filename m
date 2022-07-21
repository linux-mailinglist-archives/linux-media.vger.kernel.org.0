Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2ED57C88C
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbiGUKFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:05:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbiGUKFt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:05:49 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9047113DF4
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397948; x=1689933948;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bUK5qe81CwHoESITxcJPWP1hY6GqrkiReYOepc1JOaQ=;
  b=cKvWza2UZyoTnieNDnsfWT/JJd5AVEXB96i63ivnHJp6ta7GkZLr/8rL
   c2zKcrEWkmq4tFbNpD8kapqMC8cbQY5gxDoZiNRQJo5aObwLZtFdxq6w4
   qoimWaNvp0rArS8lf2OKbYgCQaazxvEROVCtCPqD0gZerUkHu7sp7YHu3
   2ddG935XooYeiK+jes+tKfbLIcIDJlnITqQ1jSy9v7zD8Kko6dXWrUrH/
   AzQ2M5t+MrBs6KDAjXkR0K8HqqJ310bmTVdzT/olT6jCBiRzX83qiX7ja
   K01URFagfPKsxGVVDX7Xl4ILd8PN/+2SLgHJuN5hTIjyLmxgIvmwZHdjQ
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181340"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 12:05:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 12:05:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 12:05:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658397947; x=1689933947;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=bUK5qe81CwHoESITxcJPWP1hY6GqrkiReYOepc1JOaQ=;
  b=TwfxXcnRAIR4S9NaaxsnYOc7rXm2W7FTzfxHfa+s4PLYORm5zMDI50ZF
   pFb0pPfSBvWf0FMPy20ROsbxcEcq9tDcYLk5gZGpKPQXU693WjmtjUBUJ
   21I98ciDL9y0qbaICpHdvyroxrOOOh3yjMFDQVhjybP0+8Cdk4k5NdLj1
   a9Dk4ZY/vh+mYYZaApZO8XhaTTgQC1NHGi5gs8IiPu8I5+XZSCrqJlgoJ
   7vZqtNpCwFLsc8aiv31VuIzzOHeaPeWjQgCBJ3ehNA6caYOj7N8RAadTm
   9ugTjoLC+41PXJhdWW5i+9Py3VSG/hZHL9vEEqdDBCYCLpTxzeX0d5s6f
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181339"
Subject: Re: [PATCH 14/19] media: i2c: imx290: Implement HBLANK and VBLANK controls
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 12:05:46 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D6752280056;
        Thu, 21 Jul 2022 12:05:46 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 12:05:46 +0200
Message-ID: <3399452.atdPhlSkOF@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-15-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-15-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for the patch.

Am Donnerstag, 21. Juli 2022, 10:35:35 CEST schrieb Laurent Pinchart:
> Add support for the V4L2_CID_HBLANK and V4L2_CID_VBLANK controls to the
> imx290 driver. Make the controls read-only to start with, to report the
> values to userspace for timing calculation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 39 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 4408dd3e191f..7190399f4111 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -146,6 +146,8 @@ struct imx290 {
>  	struct v4l2_ctrl_handler ctrls;
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
> +	struct v4l2_ctrl *hblank;
> +	struct v4l2_ctrl *vblank;
> 
>  	struct mutex lock;
>  };
> @@ -642,6 +644,20 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  		if (imx290->pixel_rate)
>  			__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
>  						 
imx290_calc_pixel_rate(imx290));
> +
> +		if (imx290->hblank) {
> +			unsigned int hblank = mode->hmax - mode-
>width;
> +
> +			__v4l2_ctrl_modify_range(imx290->hblank, 
hblank, hblank,
> +						 1, hblank);
> +		}
> +
> +		if (imx290->vblank) {
> +			unsigned int vblank = IMX290_VMAX_DEFAULT - 
mode->height;
> +
> +			__v4l2_ctrl_modify_range(imx290->vblank, 
vblank, vblank,
> +						 1, vblank);
> +		}
>  	}
> 
>  	*format = fmt->format;
> @@ -880,9 +896,10 @@ static const struct media_entity_operations
> imx290_subdev_entity_ops = {
> 
>  static int imx290_ctrl_init(struct imx290 *imx290)
>  {
> +	unsigned int blank;
>  	int ret;
> 
> -	v4l2_ctrl_handler_init(&imx290->ctrls, 5);
> +	v4l2_ctrl_handler_init(&imx290->ctrls, 7);
>  	imx290->ctrls.lock = &imx290->lock;
> 
>  	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> @@ -910,6 +927,26 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  				     
ARRAY_SIZE(imx290_test_pattern_menu) - 1,
>  				     0, 0, 
imx290_test_pattern_menu);
> 
> +	/*
> +	 * Horizontal blanking is controlled through the HMAX register, 
which
> +	 * contains a line length in INCK clock units. The INCK frequency 
is
> +	 * fixed to 74.25 MHz. The HMAX value is currently fixed to 1100,
> +	 * convert it to a number of pixels based on the nominal pixel 
rate.
> +	 */

Currently the driver only supports 37.125 MHz, please refer to imx290_probe.

Regards,
Alexander

> +	blank = imx290->current_mode->hmax - imx290->current_mode->width;
> +	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
> +					   V4L2_CID_HBLANK, 
blank, blank, 1,
> +					   blank);
> +	if (imx290->hblank)
> +		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
> +	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
> +					   V4L2_CID_VBLANK, 
blank, blank, 1,
> +					   blank);
> +	if (imx290->vblank)
> +		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>  	imx290->sd.ctrl_handler = &imx290->ctrls;
> 
>  	if (imx290->ctrls.error) {




