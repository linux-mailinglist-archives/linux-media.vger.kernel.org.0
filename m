Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC5569CF95
	for <lists+linux-media@lfdr.de>; Mon, 20 Feb 2023 15:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232174AbjBTOmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Feb 2023 09:42:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbjBTOmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Feb 2023 09:42:43 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A421EBC8
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 06:42:41 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id da10so6798964edb.3
        for <linux-media@vger.kernel.org>; Mon, 20 Feb 2023 06:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hs+81tLE9zn2g4VmuBqcCmTI6Ea5z3jwQ+R3RhkadD4=;
        b=Ow/fVDVq5GQrLjEwyyPp6og/e+oXX8y0ZmWBR3DvExqBmvUH6DMqZatQBFvxF6NDil
         cfE58z5ubrUdfZEbPEW5LgD9a6jkX0ZHl+pFbzzIHD4xynNE/sdBRYDweOR/lhYp+uF1
         B+cbIySNsRz6/U3OkHa4pX7riQmzxp4bJKEm2QogYmo51+BVF/wnrHeKhldEatOW6i8F
         j2g5FdRk8cCSHsosckD44M9v5FcBqrpXkglI1clAIIKRAsPvTmIoH/i+fvvUp0kmDxVn
         CROdyjr/heIU/HQP2MF53KiDlyBaPCMYgxHCI4yJDMe0dmLx9kAkpTK7MNuySWBoojlu
         pyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs+81tLE9zn2g4VmuBqcCmTI6Ea5z3jwQ+R3RhkadD4=;
        b=ZQVs/FGlFnKHFSFgE5m0MV0iN5nimvJUmoHBBGmv4V+/AAE1MeN2ktHBL3y2YF7pN5
         hF4MGiWozrLWVxNsUgK+QVSd6OyKXk5jvlGJPHwUznNn0QkeEE6ZXB07DdfYO29x6zl7
         xBxZnrsmTjMxXohedF312Dy7Y6Tw5QgQXvtWUpik70CBJYDvzxf1IioDIK99jMyFouJZ
         Mquc9vKeM/Cw5MyvhMdi3MKtOUVLc2WLd7WQ+HYOZ//VrWSEdtCmkHtVp/n4PYlDtCRW
         P03h5FJyngWHz4/v32h3/OMbi3IeRxSJ7/Zvz3Mq8278GXhO5oh//PTDgbfJPbm9WX4O
         xgjw==
X-Gm-Message-State: AO0yUKWKQQXE7yQDegtWT2/IdvCPZGyYhejL5YDKJrdTrOq0taR/QrnZ
        KaaopRGBdY2da4eGiEfryGpUd897OW8=
X-Google-Smtp-Source: AK7set+Wc0gdL9Tvdc71T/J2WzAy2uxSnqE3YOQKryTRto4r+3+TydEABZsBK8HSEAJafhVAsnQUcQ==
X-Received: by 2002:a17:906:af15:b0:888:1f21:4429 with SMTP id lx21-20020a170906af1500b008881f214429mr6883005ejb.19.1676904159258;
        Mon, 20 Feb 2023 06:42:39 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-56-131.cust.vodafonedsl.it. [188.217.56.131])
        by smtp.gmail.com with ESMTPSA id jr14-20020a170906a98e00b008af574fbfc2sm5926949ejb.33.2023.02.20.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:42:38 -0800 (PST)
Date:   Mon, 20 Feb 2023 15:42:36 +0100
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Valentine Barshak <valentine.barshak@cogentembedded.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov5647: Add test pattern control
Message-ID: <Y/OG3P5unNisV4LL@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230219180334.980950-1-jacopo.mondi@ideasonboard.com>
 <20230220124041.1010289-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220124041.1010289-1-jacopo.mondi@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Feb 20, 2023 at 01:40:41PM +0100, Jacopo Mondi wrote:
> From: Valentine Barshak <valentine.barshak@cogentembedded.com>
> 
> This adds V4L2_CID_TEST_PATTERN control support.
> 
> Signed-off-by: Valentine Barshak <valentine.barshak@cogentembedded.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/i2c/ov5647.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index 847a7bbb69c5..0b88ac6dee41 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -58,6 +58,7 @@
>  #define OV5647_REG_MIPI_CTRL00		0x4800
>  #define OV5647_REG_MIPI_CTRL14		0x4814
>  #define OV5647_REG_AWB			0x5001
> +#define OV5647_REG_ISPCTRL3D		0x503d
> 
>  #define REG_TERM 0xfffe
>  #define VAL_TERM 0xfe
> @@ -116,6 +117,22 @@ static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
>  	return container_of(sd, struct ov5647, sd);
>  }
> 
> +static const char * const ov5647_test_pattern_menu[] = {
> +	"Disabled",
> +	"Color Bars",
> +	"Color Squares",
> +	"Random Data",
> +	"Input Data"
> +};
> +
> +static u8 ov5647_test_pattern_val[] = {
> +	0x00,	/* Disabled */
> +	0x80,	/* Color Bars */
> +	0x82,	/* Color Squares */
> +	0x81,	/* Random Data */
> +	0x83,	/* Input Data */
> +};
> +
>  static const struct regval_list sensor_oe_disable_regs[] = {
>  	{0x3000, 0x00},
>  	{0x3001, 0x00},
> @@ -1242,6 +1259,10 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
>  				     sensor->mode->format.height + ctrl->val);
>  		break;
> +	case V4L2_CID_TEST_PATTERN:
> +		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
> +				   ov5647_test_pattern_val[ctrl->val]);
> +		break;
> 
>  	/* Read-only, but we adjust it based on mode. */
>  	case V4L2_CID_PIXEL_RATE:
> @@ -1270,7 +1291,7 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  	struct i2c_client *client = v4l2_get_subdevdata(&sensor->sd);
>  	int hblank, exposure_max, exposure_def;
> 
> -	v4l2_ctrl_handler_init(&sensor->ctrls, 8);
> +	v4l2_ctrl_handler_init(&sensor->ctrls, 9);
> 
>  	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
>  			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
> @@ -1314,6 +1335,11 @@ static int ov5647_init_controls(struct ov5647 *sensor)
>  					   sensor->mode->vts -
>  					   sensor->mode->format.height);
> 
> +	v4l2_ctrl_new_std_menu_items(&sensor->ctrls, &ov5647_ctrl_ops,
> +				     V4L2_CID_TEST_PATTERN,
> +				     ARRAY_SIZE(ov5647_test_pattern_menu) - 1,
> +				     0, 0, ov5647_test_pattern_menu);
> +
>  	if (sensor->ctrls.error)
>  		goto handler_free;
> 
> --
> 2.39.0
> 

Looks good to me.
Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>

Thanks,
Tommaso

Tommaso
