Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 771DD635483
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 10:08:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237088AbiKWJHb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 04:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237220AbiKWJHO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 04:07:14 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E870106120
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 01:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669194411; x=1700730411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2f/9nxESPnqNnRoQ4pC724Hbf42EyScGYQyvPVJ5uoY=;
  b=XgqFNMmGh40MMhwSsHhHlX8kG5cRUn+9SqrqeT/hpS4Tl3IB81iUz6ol
   d/G3HE68h9PPXJdZKeI5DDjxspWE0kiD7PNdtdwuCefm6PCsojmjmjUWR
   FJBlxDd4R6eSrSSbZajwteFzAcIsv4zNaGnmWZU7nJM2EZmleKtcKNExe
   37LlnZV5uA7BsA2bD9g40UmMxAihxH//rHenZhd0xU6oH1ythF17xJunq
   uBCXksa/+xEZIYspDy2/hhCtV9BQTplPFWpY444qDL74eATChd23+FsfK
   dKwOjDAz7yQ7LFb76dyuFDDOMuFRHGG9LfV/f6BrZj02qC6KFocaCLdDe
   g==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27529276"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 10:06:39 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 10:06:39 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 10:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669194399; x=1700730399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2f/9nxESPnqNnRoQ4pC724Hbf42EyScGYQyvPVJ5uoY=;
  b=SDKX0YEo5Lmt6Csmai8VNwrUbLtjqPLL8aPo7LDjMx6VbRIkZGkj+rGE
   mbnjz4HIeJgTFbg+PI/z2gO0yC3qS+naBPVU3TMUqWySb84u31PzP+z24
   XTTlIzHBtQGCiaunumkNNluMm2M5JeC/qsMh/4e9LvJa3XzHSIYj8+EVi
   GKFMunHi71NjnckHIRWkULO9ClwsCQpIdaW0sI4PQAJ1hHXdT0jGtwp6V
   VeZWEfJDaDzlkABAbITnvRtqgIQALPrHMeIxZDIfRVREsF7GxuleTwJgu
   RZbmAh7UbLp3W7GsW80m6n/VRKObmExxKtgNw1d5Ufi2e5pHlekm1+W5e
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27529275"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 10:06:39 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 46CCC280056;
        Wed, 23 Nov 2022 10:06:39 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 05/15] media: i2c: imx290: Pass format and mode to imx290_calc_pixel_rate()
Date:   Wed, 23 Nov 2022 10:06:41 +0100
Message-ID: <111287339.nniJfEyVGO@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-6-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-6-laurent.pinchart@ideasonboard.com>
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

thanks for working on this.

Am Dienstag, 22. November 2022, 23:32:40 CET schrieb Laurent Pinchart:
> Avoid accessing the imx290 current_format and current_mode fields in
> imx290_calc_pixel_rate() to prepare for the removal of those fields.
> Among the two callers of the function, imx290_ctrl_update() has an
> explicit mode pointer already, and we can also give it a format pointer.
> Use those explicitly.
> 
> While at it, inline the imx290_get_link_freq() function in
> imx290_calc_pixel_rate() as it is only called there.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 2d198b167853..a676ce93f96e 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -547,21 +547,15 @@ static int imx290_write_current_format(struct imx290
> *imx290) return 0;
>  }
> 
> -static s64 imx290_get_link_freq(struct imx290 *imx290)
> +static u64 imx290_calc_pixel_rate(struct imx290 *imx290,
> +				  const struct v4l2_mbus_framefmt 
*format,

You can remove format here. It's unused and gets removed in the next patch 
anyway.

Regards,
Alexander

> +				  const struct imx290_mode *mode)
>  {
> -	u8 index = imx290->current_mode->link_freq_index;
> -
> -	return *(imx290_link_freqs_ptr(imx290) + index);
> -}
> -
> -static u64 imx290_calc_pixel_rate(struct imx290 *imx290)
> -{
> -	s64 link_freq = imx290_get_link_freq(imx290);
> -	u8 nlanes = imx290->nlanes;
> +	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode-
>link_freq_index];
>  	u64 pixel_rate;
> 
>  	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> -	pixel_rate = link_freq * 2 * nlanes;
> +	pixel_rate = link_freq * 2 * imx290->nlanes;
>  	do_div(pixel_rate, imx290->bpp);
>  	return pixel_rate;
>  }
> @@ -635,6 +629,7 @@ static const char * const imx290_test_pattern_menu[] = {
> };
> 
>  static void imx290_ctrl_update(struct imx290 *imx290,
> +			       const struct v4l2_mbus_framefmt *format,
>  			       const struct imx290_mode *mode)
>  {
>  	unsigned int hblank = mode->hmax - mode->width;
> @@ -642,7 +637,7 @@ static void imx290_ctrl_update(struct imx290 *imx290,
> 
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
>  	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> -				 imx290_calc_pixel_rate(imx290));
> +				 imx290_calc_pixel_rate(imx290, 
format, mode));
> 
>  	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
>  	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> @@ -652,6 +647,7 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  {
>  	struct v4l2_fwnode_device_properties props;
>  	unsigned int blank;
> +	u64 pixel_rate;
>  	int ret;
> 
>  	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> @@ -689,10 +685,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	if (imx290->link_freq)
>  		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> +	pixel_rate = imx290_calc_pixel_rate(imx290, &imx290->current_format,
> +					    imx290->current_mode);
>  	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
>  					       V4L2_CID_PIXEL_RATE,
> -					       1, INT_MAX, 1,
> -					       
imx290_calc_pixel_rate(imx290));
> +					       1, INT_MAX, 1, 
pixel_rate);
> 
>  	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
> @@ -913,7 +910,7 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  		imx290->current_mode = mode;
>  		imx290->bpp = imx290_formats[i].bpp;
> 
> -		imx290_ctrl_update(imx290, mode);
> +		imx290_ctrl_update(imx290, &fmt->format, mode);
>  	}
> 
>  	*format = fmt->format;




