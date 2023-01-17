Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30F3C66DAC1
	for <lists+linux-media@lfdr.de>; Tue, 17 Jan 2023 11:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236691AbjAQKSJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Jan 2023 05:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236345AbjAQKRh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Jan 2023 05:17:37 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A932E0EC
        for <linux-media@vger.kernel.org>; Tue, 17 Jan 2023 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673950638; x=1705486638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Q2e4esyX1Zfluzdd0jNs3eXBlO0HWsiGELh6flAyoo=;
  b=cLEzQt9h9oYHSYGBcX/swuupeKRx+s3NJNUzGNT/ZaMA4MuraNH4ylad
   J5iGi4RrLElgB2IEMrqgZ6dGRvXj+IvFKp6ZZC8CDF9+KVFDd21RYYgyT
   OskQ6azNYJJGGTYS1fdY+9YFQDFNAxMrvpX4DzPotn4NrtWzj8X2d+S+M
   Toc1pJFOod9i8/VtE3dN1IehMMoMfqZt3yUKMEICFd7IyKqoOpSn9NwbA
   zN5OiDCsvpDWiTECmAzZEhGwjwXof+G5rO7yrtvPZWL44Z+b+GgvcBpS9
   ZrPMMjv6KElyP1imApJzPPqCX+TnrJWuWxL99ec3lOBGTbi4t3shCJl1c
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="351903905"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="351903905"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:17:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="689750155"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="689750155"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:17:16 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 8FF6020165;
        Tue, 17 Jan 2023 12:17:13 +0200 (EET)
Date:   Tue, 17 Jan 2023 10:17:13 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Robert Mader <robert.mader@collabora.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 2/3] media: imx258: Register H/V flip controls
Message-ID: <Y8Z1qVTZo12tfVmi@paasikivi.fi.intel.com>
References: <20230117100603.51631-1-jacopo.mondi@ideasonboard.com>
 <20230117100603.51631-3-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117100603.51631-3-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the patch.

On Tue, Jan 17, 2023 at 11:06:02AM +0100, Jacopo Mondi wrote:
> Register controls for V4L2_CID_HFLIP and V4L2_CID_VFLIP.
> 
> The controls are registered as read-only and enabled by default, as the
> driver embeds a 180 degrees rotation in its programming sequences and
> only supports that mode of operations.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/imx258.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index 3b560865b657..2e0a4ea76589 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -1151,6 +1151,7 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	struct i2c_client *client = v4l2_get_subdevdata(&imx258->sd);
>  	struct v4l2_fwnode_device_properties props;
>  	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	struct v4l2_ctrl *vflip, *hflip;
>  	s64 vblank_def;
>  	s64 vblank_min;
>  	s64 pixel_rate_min;
> @@ -1158,7 +1159,7 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	int ret;
>  
>  	ctrl_hdlr = &imx258->ctrl_handler;
> -	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 13);
>  	if (ret)
>  		return ret;
>  
> @@ -1174,6 +1175,17 @@ static int imx258_init_controls(struct imx258 *imx258)
>  	if (imx258->link_freq)
>  		imx258->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
> +	/* The driver only supports one bayer order and flips by default. */
> +	hflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> +				  V4L2_CID_HFLIP, 1, 1, 1, 1);
> +	if (hflip)
> +		hflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
> +	vflip = v4l2_ctrl_new_std(ctrl_hdlr, &imx258_ctrl_ops,
> +				  V4L2_CID_VFLIP, 1, 1, 1, 1);

This defaults the controls to 1, which suggests the image is upside down.

The rotation property has been used to tell the driver the sensor is upside
down, and this has also had the effect of reversing flip contron values so
if they're disabled, the image is upright.

See e.g. the CCS driver.

I'd do the same here.

> +	if (vflip)
> +		vflip->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +
>  	pixel_rate_max = link_freq_to_pixel_rate(link_freq_menu_items[0]);
>  	pixel_rate_min = link_freq_to_pixel_rate(link_freq_menu_items[1]);
>  	/* By default, PIXEL_RATE is read only */

-- 
Kind regards,

Sakari Ailus
