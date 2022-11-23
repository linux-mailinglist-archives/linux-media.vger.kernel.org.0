Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60CD76351BE
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 08:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236198AbiKWH7j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 02:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235968AbiKWH7S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 02:59:18 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05605275F2
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 23:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669190345; x=1700726345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1xlHd29Jm4x+zUds/HJxJ8cvmQU94rU4x1DSi3XWpno=;
  b=okwxSJMdIECXqgFPasYIxN3sfSEMGIRP6lVXLyZIYKa4nrp0tRkgIL4C
   d3WxewCSthkXDz3167/gf0n2n625rBAjwjVEWZxgAM8GpV2LLakemOU/k
   IC5AaIJMckOzVex+ANkm0W+eL9yvEdEhnWntRq0M/q8NMzTgoH/nIHDCq
   9cOyVSYeXeGr4s/R8FhJhLUNiReZxAIP652CcRb+A6WZVxOlGpJTfTch9
   XTigdvpdhUfE6hXUDISRFitTu+GjrjqBtuYnO7rrheervCBvEe7TSLZ8A
   O6CYCfFN7rikjiufldp4wYJtTZsT62j6LZawhN9Fc1IszHmjSWz2tAVa8
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525857"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 23 Nov 2022 08:59:03 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 23 Nov 2022 08:59:03 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 23 Nov 2022 08:59:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1669190343; x=1700726343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1xlHd29Jm4x+zUds/HJxJ8cvmQU94rU4x1DSi3XWpno=;
  b=LLc4e0g13pD6H+bbanTRrQA2i97zF7+Apz8pME+DcF0s/XIG8tQmzdDZ
   n5x8rkbswisXiM88HVGzRdWxmA4/Nn92J8HfusVtJam3Z1L3+anVWuFVS
   bEeaaYjX5eMos1cmPGqF3A3DxG4OjodnMDBzoLfPKrf3J+a1AALTO+R1p
   orNz03MYP6Syy4X09mnNSlI/swen1OOvUSdq8L2M99vdN2vHHjXLwB027
   NPlCH0QOnDSgDAZUcfbzONU5CZJu2/SLFOTIjUWzU8hRcS7ZUrUE6Kk3S
   lkPKRsoO3U4sOq3S9bPCnsltkpxRvgqZ9AkoeGwWv6HN1kXgMndB6Ixzc
   w==;
X-IronPort-AV: E=Sophos;i="5.96,186,1665439200"; 
   d="scan'208";a="27525856"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Nov 2022 08:59:03 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 47AD0280056;
        Wed, 23 Nov 2022 08:59:03 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 06/15] media: i2c: imx290: Compute pixel rate and blanking in one place
Date:   Wed, 23 Nov 2022 08:59:03 +0100
Message-ID: <3211533.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221122223250.21233-7-laurent.pinchart@ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com> <20221122223250.21233-7-laurent.pinchart@ideasonboard.com>
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

Am Dienstag, 22. November 2022, 23:32:41 CET schrieb Laurent Pinchart:
> The hblank, vblank, pixel rate and link frequency values and limits are
> currently computed when creating controls, in imx290_ctrl_init(), and
> updated in imx290_ctrl_update(). This duplicates the logic in different
> places. Simplify the code by setting the control values and limits to
> hardcoded values when creating the controls, and call
> imx290_ctrl_update() to then update them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 46 +++++++++++++++++---------------------
>  1 file changed, 20 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index a676ce93f96e..135ed55592a1 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -547,19 +547,6 @@ static int imx290_write_current_format(struct imx290
> *imx290) return 0;
>  }
> 
> -static u64 imx290_calc_pixel_rate(struct imx290 *imx290,
> -				  const struct v4l2_mbus_framefmt 
*format,
> -				  const struct imx290_mode *mode)
> -{
> -	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode-
>link_freq_index];
> -	u64 pixel_rate;
> -
> -	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> -	pixel_rate = link_freq * 2 * imx290->nlanes;
> -	do_div(pixel_rate, imx290->bpp);
> -	return pixel_rate;
> -}
> -
>  /*
> ---------------------------------------------------------------------------
> - * Controls
>   */
> @@ -634,10 +621,15 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  {
>  	unsigned int hblank = mode->hmax - mode->width;
>  	unsigned int vblank = IMX290_VMAX_DEFAULT - mode->height;
> +	s64 link_freq = imx290_link_freqs_ptr(imx290)[mode-
>link_freq_index];
> +	u64 pixel_rate;
> +
> +	/* pixel rate = link_freq * 2 * nr_of_lanes / bits_per_sample */
> +	pixel_rate = link_freq * 2 * imx290->nlanes;
> +	do_div(pixel_rate, imx290->bpp);
> 
>  	__v4l2_ctrl_s_ctrl(imx290->link_freq, mode->link_freq_index);
> -	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate,
> -				 imx290_calc_pixel_rate(imx290, 
format, mode));
> +	__v4l2_ctrl_s_ctrl_int64(imx290->pixel_rate, pixel_rate);
> 
>  	__v4l2_ctrl_modify_range(imx290->hblank, hblank, hblank, 1, hblank);
>  	__v4l2_ctrl_modify_range(imx290->vblank, vblank, vblank, 1, vblank);
> @@ -646,8 +638,6 @@ static void imx290_ctrl_update(struct imx290 *imx290,
>  static int imx290_ctrl_init(struct imx290 *imx290)
>  {
>  	struct v4l2_fwnode_device_properties props;
> -	unsigned int blank;
> -	u64 pixel_rate;
>  	int ret;
> 
>  	ret = v4l2_fwnode_device_parse(imx290->dev, &props);
> @@ -677,6 +667,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  			  V4L2_CID_EXPOSURE, 1, IMX290_VMAX_DEFAULT - 2, 
1,
>  			  IMX290_VMAX_DEFAULT - 2);
> 
> +	/*
> +	 * Set the link frequency, pixel rate, horizontal blanking and 
vertical
> +	 * blanking it hardcoded values, they will be updated by
> +	 * imx290_ctrl_update().
> +	 */
>  	imx290->link_freq =
>  		v4l2_ctrl_new_int_menu(&imx290->ctrls, &imx290_ctrl_ops,
>  				       V4L2_CID_LINK_FREQ,
> @@ -685,28 +680,22 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  	if (imx290->link_freq)
>  		imx290->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> -	pixel_rate = imx290_calc_pixel_rate(imx290, &imx290->current_format,
> -					    imx290->current_mode);
>  	imx290->pixel_rate = v4l2_ctrl_new_std(&imx290->ctrls, 
&imx290_ctrl_ops,
>  					       V4L2_CID_PIXEL_RATE,
> -					       1, INT_MAX, 1, 
pixel_rate);
> +					       1, INT_MAX, 1, 1);
> 
>  	v4l2_ctrl_new_std_menu_items(&imx290->ctrls, &imx290_ctrl_ops,
>  				     V4L2_CID_TEST_PATTERN,
>  				     
ARRAY_SIZE(imx290_test_pattern_menu) - 1,
>  				     0, 0, imx290_test_pattern_menu);
> 
> -	blank = imx290->current_mode->hmax - imx290->current_mode->width;
>  	imx290->hblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -					   V4L2_CID_HBLANK, blank, 
blank, 1,
> -					   blank);
> +					   V4L2_CID_HBLANK, 1, 1, 1, 
1);
>  	if (imx290->hblank)
>  		imx290->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> -	blank = IMX290_VMAX_DEFAULT - imx290->current_mode->height;
>  	imx290->vblank = v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
> -					   V4L2_CID_VBLANK, blank, 
blank, 1,
> -					   blank);
> +					   V4L2_CID_VBLANK, 1, 1, 1, 
1);
>  	if (imx290->vblank)
>  		imx290->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> 
> @@ -721,6 +710,11 @@ static int imx290_ctrl_init(struct imx290 *imx290)
>  		return ret;
>  	}
> 
> +	mutex_lock(imx290->ctrls.lock);
> +	imx290_ctrl_update(imx290, &imx290->current_format,
> +			   imx290->current_mode);
> +	mutex_unlock(imx290->ctrls.lock);
> +
>  	return 0;
>  }

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>



