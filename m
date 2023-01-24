Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACA3067957A
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 11:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232991AbjAXKkx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 05:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbjAXKkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 05:40:52 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1CC3584
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 02:40:51 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324942849"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="324942849"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 02:40:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="786031782"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="786031782"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 24 Jan 2023 02:40:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKGjM-00EINO-2o;
        Tue, 24 Jan 2023 12:40:44 +0200
Date:   Tue, 24 Jan 2023 12:40:44 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 36/57] media: atomisp: ov2680: Use defines for fps,
 lines-per-frame and skip-frames
Message-ID: <Y8+1rMcr+wKqvGM4@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-37-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123125205.622152-37-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 23, 2023 at 01:51:44PM +0100, Hans de Goede wrote:
> The fps, lines-per-frame and skip-frames values are the same for all
> resolutions, use defines for these.
> 
> The ov2680_res_preview[] incorrectly sets fps to 60 for some low-res
> modes, this is incorrect with the current fixed (resolution independent)
> lines-per-frame value.
> 
> Note this not drop the now no longer used fps, lines-per-frame and
> skip-frames struct ov2680_resolution members. The entire struct is going
> away in the next patches so that would just cause unnecessary changes.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../staging/media/atomisp/i2c/atomisp-ov2680.c   | 16 ++++------------
>  drivers/staging/media/atomisp/i2c/ov2680.h       |  2 ++
>  2 files changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> index 6693f042f4f2..dee6eb3d8c63 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> @@ -685,11 +685,8 @@ static int ov2680_s_config(struct v4l2_subdev *sd,
>  static int ov2680_g_frame_interval(struct v4l2_subdev *sd,
>  				   struct v4l2_subdev_frame_interval *interval)
>  {
> -	struct ov2680_device *dev = to_ov2680_sensor(sd);
> -
>  	interval->interval.numerator = 1;
> -	interval->interval.denominator = dev->res->fps;
> -
> +	interval->interval.denominator = OV2680_FPS;
>  	return 0;
>  }
>  
> @@ -733,8 +730,8 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
>  	    fie->which > V4L2_SUBDEV_FORMAT_ACTIVE)
>  		return -EINVAL;
>  
> -	fract.denominator = ov2680_res_preview[fie->index].fps;
>  	fract.numerator = 1;
> +	fract.denominator = OV2680_FPS;
>  
>  	fie->interval = fract;
>  
> @@ -743,12 +740,7 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
>  
>  static int ov2680_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
>  {
> -	struct ov2680_device *dev = to_ov2680_sensor(sd);
> -
> -	mutex_lock(&dev->input_lock);
> -	*frames = dev->res->skip_frames;
> -	mutex_unlock(&dev->input_lock);
> -
> +	*frames = OV2680_SKIP_FRAMES;
>  	return 0;
>  }
>  
> @@ -792,7 +784,7 @@ static int ov2680_init_controls(struct ov2680_device *sensor)
>  	const struct v4l2_ctrl_ops *ops = &ov2680_ctrl_ops;
>  	struct ov2680_ctrls *ctrls = &sensor->ctrls;
>  	struct v4l2_ctrl_handler *hdl = &ctrls->handler;
> -	int exp_max = sensor->res->lines_per_frame - OV2680_INTEGRATION_TIME_MARGIN;
> +	int exp_max = OV2680_LINES_PER_FRAME - OV2680_INTEGRATION_TIME_MARGIN;
>  
>  	v4l2_ctrl_handler_init(hdl, 4);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
> index 9bbb34dd95a5..4c1d20f514b2 100644
> --- a/drivers/staging/media/atomisp/i2c/ov2680.h
> +++ b/drivers/staging/media/atomisp/i2c/ov2680.h
> @@ -38,6 +38,8 @@
>  /* 1704 * 1294 * 30fps = 66MHz pixel clock */
>  #define OV2680_PIXELS_PER_LINE			1704
>  #define OV2680_LINES_PER_FRAME			1294
> +#define OV2680_FPS				30
> +#define OV2680_SKIP_FRAMES			3
>  
>  /* If possible send 16 extra rows / lines to the ISP as padding */
>  #define OV2680_END_MARGIN			16
> -- 
> 2.39.0
> 

-- 
With Best Regards,
Andy Shevchenko


