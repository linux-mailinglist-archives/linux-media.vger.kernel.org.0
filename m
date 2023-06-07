Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15F27266AE
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 19:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjFGRFG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 13:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjFGRFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 13:05:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E067EBA
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 10:05:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126233170111.36.openmobile.ne.jp [126.233.170.111])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5EEE2B6;
        Wed,  7 Jun 2023 19:04:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686157473;
        bh=oV8n8J30WfhUhu10ifWD3p99Fseiknouo3jiIU4Qk14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ClQnrb4+vdQTHZbjLpF0bltI7dRONNOrlUTT4f7TjUaWc2Upbu9iQ0Ldg0Q8p8rBz
         EIt1Ohih0OEN1uY2rmjR7u26kYAYTBl5UhKoUwuvp+jQRSdLz3uloKze2GgkQ2LkS4
         fjX4npv66e+d01pWsw/h8YeqDJPe00GDhMrXeWkQ=
Date:   Wed, 7 Jun 2023 20:04:55 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 26/28] media: ov2680: Add g_skip_frames op support
Message-ID: <20230607170455.GA5058@pendragon.ideasonboard.com>
References: <20230607164712.63579-1-hdegoede@redhat.com>
 <20230607164712.63579-27-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230607164712.63579-27-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Wed, Jun 07, 2023 at 06:47:10PM +0200, Hans de Goede wrote:
> Add support for v4l2_subdev_sensor_ops.g_skip_frames.

The .g_skip_frames() subdev operation was a mistake in hindsight, and
should probably not be used in new drivers (or existing drivers that
don't use it yet). Why do you need it ?

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2680.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> index 867df602ee53..9e4f0bcbe979 100644
> --- a/drivers/media/i2c/ov2680.c
> +++ b/drivers/media/i2c/ov2680.c
> @@ -62,6 +62,8 @@
>  
>  #define OV2680_FRAME_RATE			30
>  
> +#define OV2680_SKIP_FRAMES			3
> +
>  #define OV2680_NATIVE_WIDTH			1616
>  #define OV2680_NATIVE_HEIGHT			1216
>  #define OV2680_NATIVE_START_LEFT		0
> @@ -759,6 +761,12 @@ static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
>  	return 0;
>  }
>  
> +static int ov2680_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
> +{
> +	*frames = OV2680_SKIP_FRAMES;
> +	return 0;
> +}
> +
>  static int ov2680_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct v4l2_subdev *sd = ctrl_to_sd(ctrl);
> @@ -806,6 +814,10 @@ static const struct v4l2_subdev_video_ops ov2680_video_ops = {
>  	.s_stream		= ov2680_s_stream,
>  };
>  
> +static const struct v4l2_subdev_sensor_ops ov2680_sensor_ops = {
> +	.g_skip_frames	= ov2680_g_skip_frames,
> +};
> +
>  static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
>  	.init_cfg		= ov2680_init_cfg,
>  	.enum_mbus_code		= ov2680_enum_mbus_code,
> @@ -820,6 +832,7 @@ static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
>  static const struct v4l2_subdev_ops ov2680_subdev_ops = {
>  	.video	= &ov2680_video_ops,
>  	.pad	= &ov2680_pad_ops,
> +	.sensor = &ov2680_sensor_ops,
>  };
>  
>  static int ov2680_mode_init(struct ov2680_dev *sensor)

-- 
Regards,

Laurent Pinchart
