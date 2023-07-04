Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 663EB746F78
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbjGDLMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjGDLMK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:12:10 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E823BDA
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:12:08 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4435fa903f2so1299408137.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 04:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688469128; x=1691061128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkz59f0Y9h6n96jKqifZxfAwM41yCtGPSf6Bmmpi3aE=;
        b=A26W+Hmf/XT4xE8IA9anV3En2EScl9tBwIYj9CXlSviyqqrWHbK6pGtNAkAd2F3xEx
         CQbWezJjc4gMvc7Pxgfk0YkISmi0E9bGFIX1X987KAM4mjjtzixL5hZVxUtCwuW7ZHo2
         N0SRDk+n/PbuHJxcvY/0D5cNP0vTYUhuhGkzHWlwzqsuiWbJMZiB91vEqWYJSvWwRL3V
         nfEZoYLmr3571czKM55H49wxabejO5izUhNp4oUe++2JmgK1+AJiU3N1/iQjvMzeGlh6
         xwFgNOxWcjbl/ZED1lEc5sfZlrMojjW0/Cs7RmG2WbTEqtKoOqq3VMWk1RvwrFqDZT1z
         UguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688469128; x=1691061128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tkz59f0Y9h6n96jKqifZxfAwM41yCtGPSf6Bmmpi3aE=;
        b=dSL3muzyQcwZd9yF08I7lek2wgw9/Fd7QE834dnP2wzuKxr8bpq1Kw5z3tQGjjiT6n
         HRTyORqH9KFokU2xbs3uOQhFUWQcqcJskkDJkGE3StYEmU6ZtJvYrsCCyAb0wEAqdQHL
         uJqFVLVoQCA1s2pw3VDm/oro0kzlPhxbqTYdzD3w5vXFMCbRvW09E1fiQBbAgdYRGKqN
         XwKcthi89aIfPD9zoJv1+XkM7RPjVAyW+GqcDCHqM7U6TNyNYcNGj8uGID659rUUN7mW
         SjtRg5bT0oEpZNbEF5ddXHQ/OBCml41/OBWkIIJQTXXILC/jxchuTCK6NoFI0XRaNLCr
         9Ieg==
X-Gm-Message-State: ABy/qLYGIghrupnf2pPBrrT44ly99RCjnpYdDLeR0X/k0pcD75rXWPxs
        uxgzySw7xokQShpxkw2XwwAXzyhbemniDLKTv1IP9w==
X-Google-Smtp-Source: APBJJlGF6G0bksNtxADUt6M4LdJMdXtbP46bogbUdHqyUtRdrDoKz6LQOKPRboIpjTCBJm9TIcrcyXbH513bNTA5nSk=
X-Received: by 2002:a67:b14b:0:b0:43f:4af8:d39d with SMTP id
 z11-20020a67b14b000000b0043f4af8d39dmr4173595vsl.4.1688469127998; Tue, 04 Jul
 2023 04:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230704103611.149631-1-jacopo.mondi@ideasonboard.com>
 <20230704104057.149837-1-jacopo.mondi@ideasonboard.com> <20230704104057.149837-3-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230704104057.149837-3-jacopo.mondi@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 12:11:52 +0100
Message-ID: <CAPY8ntCNdRW-C7-Fm1y-v6-e+CjMmktER045qd-thnqmVTG4Rw@mail.gmail.com>
Subject: Re: [PATCH 2/5] media: i2c: imx219: Switch from open to init_cfg
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo

Thanks for the patch.

On Tue, 4 Jul 2023 at 11:41, Jacopo Mondi <jacopo.mondi@ideasonboard.com> wrote:
>
> From: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
>
> Use the init_cfg pad level operation instead of the internal subdev
> open operation to set default formats on the pads.
>
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 58 +++++++++++++++++---------------------
>  1 file changed, 26 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 998a673a4290..191cb4a427cc 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -608,34 +608,6 @@ static void imx219_set_default_format(struct imx219 *imx219)
>         fmt->field = V4L2_FIELD_NONE;
>  }
>
> -static int imx219_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
> -{
> -       struct imx219 *imx219 = to_imx219(sd);
> -       struct v4l2_mbus_framefmt *try_fmt =
> -               v4l2_subdev_get_try_format(sd, fh->state, 0);
> -       struct v4l2_rect *try_crop;
> -
> -       mutex_lock(&imx219->mutex);
> -
> -       /* Initialize try_fmt */
> -       try_fmt->width = supported_modes[0].width;
> -       try_fmt->height = supported_modes[0].height;
> -       try_fmt->code = imx219_get_format_code(imx219,
> -                                              MEDIA_BUS_FMT_SRGGB10_1X10);
> -       try_fmt->field = V4L2_FIELD_NONE;
> -
> -       /* Initialize try_crop rectangle. */
> -       try_crop = v4l2_subdev_get_try_crop(sd, fh->state, 0);
> -       try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> -       try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> -       try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> -       try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> -
> -       mutex_unlock(&imx219->mutex);
> -
> -       return 0;
> -}
> -
>  static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         struct imx219 *imx219 =
> @@ -725,6 +697,31 @@ static const struct v4l2_ctrl_ops imx219_ctrl_ops = {
>         .s_ctrl = imx219_set_ctrl,
>  };
>
> +static int imx219_init_cfg(struct v4l2_subdev *sd,
> +                          struct v4l2_subdev_state *state)
> +{
> +       struct imx219 *imx219 = to_imx219(sd);
> +       struct v4l2_mbus_framefmt *format;
> +       struct v4l2_rect *try_crop;
> +
> +       /* Initialize try_fmt */
> +       format = v4l2_subdev_get_try_format(sd, state, 0);
> +       format->width = supported_modes[0].width;
> +       format->height = supported_modes[0].height;
> +       format->code = imx219_get_format_code(imx219,
> +                                             MEDIA_BUS_FMT_SRGGB10_1X10);
> +       format->field = V4L2_FIELD_NONE;
> +
> +       /* Initialize try_crop rectangle. */
> +       try_crop = v4l2_subdev_get_try_crop(sd, state, 0);
> +       try_crop->top = IMX219_PIXEL_ARRAY_TOP;
> +       try_crop->left = IMX219_PIXEL_ARRAY_LEFT;
> +       try_crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> +       try_crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> +
> +       return 0;
> +}
> +
>  static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -1235,6 +1232,7 @@ static const struct v4l2_subdev_video_ops imx219_video_ops = {
>  };
>
>  static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
> +       .init_cfg = imx219_init_cfg,
>         .enum_mbus_code = imx219_enum_mbus_code,
>         .get_fmt = imx219_get_pad_format,
>         .set_fmt = imx219_set_pad_format,
> @@ -1248,9 +1246,6 @@ static const struct v4l2_subdev_ops imx219_subdev_ops = {
>         .pad = &imx219_pad_ops,
>  };
>
> -static const struct v4l2_subdev_internal_ops imx219_internal_ops = {
> -       .open = imx219_open,
> -};
>
>  static unsigned long imx219_get_pixel_rate(struct imx219 *imx219)
>  {
> @@ -1509,7 +1504,6 @@ static int imx219_probe(struct i2c_client *client)
>                 goto error_power_off;
>
>         /* Initialize subdev */
> -       imx219->sd.internal_ops = &imx219_internal_ops;
>         imx219->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
>                             V4L2_SUBDEV_FL_HAS_EVENTS;
>         imx219->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> --
> 2.40.1
>
