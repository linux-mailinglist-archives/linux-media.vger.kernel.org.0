Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823E836EDFB
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 18:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240748AbhD2QRP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 12:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233480AbhD2QRP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 12:17:15 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD70DC06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 09:16:28 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2001:2003:f75d:b010:afd2:773e:79db:477b])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 6AB6020B62;
        Thu, 29 Apr 2021 19:16:25 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1619712985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xWMgWEwegRyDrwE6pvIRKHSCDv/rUibYgiL97IfwvT4=;
        b=Km+TaEgsixWI4M/+bHzrd1L43L1/vmlH3xoVLIFNq8s/wdaEBL8411o5KrBzoVtOXoYzSI
        FGtrH9r0qvP978W0KQB7qaB6o6/W9/FItLsNTe7CSLhjB1tfIb6p9ANFxlZDMK9U/B6lpx
        Ww5PgDQBkLzauUjs4wF2Hj2INdznaNg=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 60AC2634C89;
        Thu, 29 Apr 2021 19:14:24 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lc9Kz-0004qR-Km; Thu, 29 Apr 2021 19:16:25 +0300
Date:   Thu, 29 Apr 2021 19:16:25 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bob Veringa <bob.veringa@topic.nl>
Cc:     leonl@leopardimaging.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, mike.looijmans@topic.nl
Subject: Re: [PATCH 1/2] media: imx274: improve v4l2-compliance
Message-ID: <20210429161625.GX3@valkosipuli.retiisi.eu>
References: <b236611b-3635-40c5-988a-5c9e9fae4458.949ef384-8293-46b8-903f-40a477c056ae.e28b24bb-3436-45c2-9a1c-f2edfb40a571@emailsignatures365.codetwo.com>
 <b236611b-3635-40c5-988a-5c9e9fae4458.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.3cf110e4-7db2-437b-a373-f2dd879058a9@emailsignatures365.codetwo.com>
 <20210424111459.20730-1-bob.veringa@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210424111459.20730-1-bob.veringa@topic.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1619712985; a=rsa-sha256; cv=none;
        b=hetjd7FTf52VgCOE7Zfya/7mlZmknK/WPqqV5auJzHq3oMS4BaqDwqdm4+yQtMxVxPpT6q
        ro1JqFe4N13S14332cHFN+IKWECSSrKjMnz14AnEe9tlb2C0OSsErMsYvBZuYHjPYaKgtj
        ZxikcOUOeVsnHrYfcsOvs0+YdQDL3AU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1619712985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xWMgWEwegRyDrwE6pvIRKHSCDv/rUibYgiL97IfwvT4=;
        b=Rm7UfhPaQymQS4bPLd7XEn5UPpJaEEpuXVagjbLhfrBxMZBopTUwQsgzxuc0J9hoofstLO
        DDGQIEBEkROjV1aqOtEvHFCYbKuXQ9pycwpbX+N9isP3WU1J2zsUTnx2a17heImGNWzzD7
        ytuQCMIAxZAywSQRFsI3jITSU5KbmVE=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bob,

Thanks for the patch.

On Sat, Apr 24, 2021 at 01:14:58PM +0200, Bob Veringa wrote:
> 1) Fix incorrect return of get_fmt when fmt->which is set
> to V4L2_SUBDEV_FORMAT_TRY. get_fmt always returns the active format,
> but should return the pad configuration when V4L2_SUBDEV_FORMAT_TRY
> is requested.
> 
> 2) Fix set_fmt not functioning correctly when fmt->which is set to
> V4L2_SUBDEV_FORMAT_TRY. When a trying a format the driver assumes that
> try_crop is already set. If this is not the case it causes
> unexpected behavior. Add a default value if crop value is not set.
> 
> 3) Add support for enumerating media bus formats
> via VIDIOC_SUBDEV_ENUM_MBUS_CODE.
> 
> 4) Add  support for enumerating frame sizes
> via VIDIOC_SUBDEV_ENUM_FRAME_SIZE.
> 
> 5) Fix v4l2-compliance error 'VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL'
> by implementing v4l2_subdev_core_ops struct with default functions.
> 
> Signed-off-by: Bob Veringa <bob.veringa@topic.nl>
> Acked-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  drivers/media/i2c/imx274.c | 72 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 68 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index d9849d34f39f..942407ed931b 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -28,6 +28,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-subdev.h>
> +#include <media/v4l2-event.h>
>  
>  /*
>   * See "SHR, SVR Setting" in datasheet
> @@ -72,6 +73,7 @@
>  #define IMX274_MAX_FRAME_RATE			(120)
>  #define IMX274_MIN_FRAME_RATE			(5)
>  #define IMX274_DEF_FRAME_RATE			(60)
> +#define IMX274_DEFAULT_MEDIA_FORMAT		MEDIA_BUS_FMT_SRGGB10_1X10
>  
>  /*
>   * register SHR is limited to (SVR value + 1) x VMAX value - 4
> @@ -1011,7 +1013,7 @@ static int __imx274_change_compose(struct stimx274 *imx274,
>  				   u32 flags)
>  {
>  	struct device *dev = &imx274->client->dev;
> -	const struct v4l2_rect *cur_crop;
> +	struct v4l2_rect *cur_crop;
>  	struct v4l2_mbus_framefmt *tgt_fmt;
>  	unsigned int i;
>  	const struct imx274_mode *best_mode = &imx274_modes[0];
> @@ -1025,6 +1027,11 @@ static int __imx274_change_compose(struct stimx274 *imx274,
>  		tgt_fmt = &imx274->format;
>  	}
>  
> +	if (cur_crop->height == 0 || cur_crop->width == 0) {
> +		cur_crop->height = IMX274_MAX_HEIGHT;
> +		cur_crop->width = IMX274_MAX_WIDTH;

Shouldn't this be done in probe / init_cfg (to be added to subdev ops),
unconditionally?

The try format should also be initialised there. Both should be device
defaults, i.e. the same as those set in probe.

> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(imx274_modes); i++) {
>  		u8 wratio = imx274_modes[i].wbin_ratio;
>  		u8 hratio = imx274_modes[i].hbin_ratio;
> @@ -1072,11 +1079,24 @@ static int imx274_get_fmt(struct v4l2_subdev *sd,
>  			  struct v4l2_subdev_format *fmt)
>  {
>  	struct stimx274 *imx274 = to_imx274(sd);
> +	int ret = 0;
>  
>  	mutex_lock(&imx274->lock);
> -	fmt->format = imx274->format;
> +
> +	switch (fmt->which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +		break;
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		fmt->format = imx274->format;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
>  	mutex_unlock(&imx274->lock);
> -	return 0;
> +	return ret;
>  }
>  
>  /**
> @@ -1274,6 +1294,41 @@ static int imx274_set_selection(struct v4l2_subdev *sd,
>  	return -EINVAL;
>  }
>  
> +static int imx274_enum_frame_size(struct v4l2_subdev *sd,
> +				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_frame_size_enum *fse)
> +{
> +	__u32 width, height;

u32, please. __u32 is for the user space facing headers.

> +
> +	if (fse->index >= ARRAY_SIZE(imx274_modes))
> +		return -EINVAL;
> +
> +	width = IMX274_MAX_WIDTH / imx274_modes[fse->index].wbin_ratio;
> +	height = IMX274_MAX_HEIGHT / imx274_modes[fse->index].hbin_ratio;
> +
> +	fse->code = IMX274_DEFAULT_MEDIA_FORMAT;
> +	fse->min_width = width;
> +	fse->max_width = width;
> +	fse->min_height = height;
> +	fse->max_height = height;
> +	return 0;
> +}
> +
> +static int imx274_enum_mbus_code(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_pad_config *cfg,
> +				 struct v4l2_subdev_mbus_code_enum *code)
> +{
> +	if (code->index > 0)
> +		return -EINVAL;
> +
> +	if (code->pad != 0)
> +		return -EINVAL;

The caller has checked the pad field is valid, and with a single pad in the
entity no additional check is necessary.

> +
> +	code->code = IMX274_DEFAULT_MEDIA_FORMAT;
> +
> +	return 0;
> +}
> +
>  static int imx274_apply_trimming(struct stimx274 *imx274)
>  {
>  	u32 h_start;
> @@ -1903,11 +1958,19 @@ static int imx274_set_frame_interval(struct stimx274 *priv,
>  	return err;
>  }
>  
> +static const struct v4l2_subdev_core_ops imx274_core_ops = {
> +	.log_status = v4l2_ctrl_subdev_log_status,
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
>  static const struct v4l2_subdev_pad_ops imx274_pad_ops = {
>  	.get_fmt = imx274_get_fmt,
>  	.set_fmt = imx274_set_fmt,
>  	.get_selection = imx274_get_selection,
>  	.set_selection = imx274_set_selection,
> +	.enum_mbus_code = imx274_enum_mbus_code,
> +	.enum_frame_size = imx274_enum_frame_size,
>  };
>  
>  static const struct v4l2_subdev_video_ops imx274_video_ops = {
> @@ -1917,6 +1980,7 @@ static const struct v4l2_subdev_video_ops imx274_video_ops = {
>  };
>  
>  static const struct v4l2_subdev_ops imx274_subdev_ops = {
> +	.core = &imx274_core_ops,
>  	.pad = &imx274_pad_ops,
>  	.video = &imx274_video_ops,
>  };
> @@ -1968,7 +2032,7 @@ static int imx274_probe(struct i2c_client *client)
>  	imx274->format.width = imx274->crop.width / imx274->mode->wbin_ratio;
>  	imx274->format.height = imx274->crop.height / imx274->mode->hbin_ratio;
>  	imx274->format.field = V4L2_FIELD_NONE;
> -	imx274->format.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +	imx274->format.code = IMX274_DEFAULT_MEDIA_FORMAT;
>  	imx274->format.colorspace = V4L2_COLORSPACE_SRGB;
>  	imx274->frame_interval.numerator = 1;
>  	imx274->frame_interval.denominator = IMX274_DEF_FRAME_RATE;

-- 
Kind regards,

Sakari Ailus
