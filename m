Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1776E78493E
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 20:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjHVSIR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 14:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjHVSIQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 14:08:16 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1533991
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 11:08:15 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-79a31d66002so1553536241.3
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692727694; x=1693332494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uUQmlUCaewlDqxxpqCLQtSiE1HENYG5QgU7vFvPrTlw=;
        b=o2DT5+O/+dd59oPG5EXgBdJaAKVZjHdeMSf2Q/sPCSlFhBI/TS57+mTUmhHrdz4RYS
         N/VC3UTcF8Tzb1hQHJD4KOYkzYlGM2mky2bzBz3yy10HUKnBPozcr5BJUyxeOJeioL6U
         9yzzBftY6AgcjI42b0lGQwoBJ0EPTXOuMtbAoodxDL0CBf8Y4pIWpBc4Vxj5qGI0GxHY
         aIJj/1boTKd0/d74PY44l1KODMaItS2ZMzWEHCfbrg4btuWb5PA7l859ATadpPOn2APL
         WKa/V3wm+MNIdUle8jRsfVNXlITdnpNYkc/H1emqUoo9Is8h8WwwXbdesbQ5iF+MpfrT
         0QzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692727694; x=1693332494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUQmlUCaewlDqxxpqCLQtSiE1HENYG5QgU7vFvPrTlw=;
        b=RVtheZ18TJhHq70b8tphPV/9YEL26xNSBi3K799PEMoVQc3Xm9qLoDkKwzmVhzNgKt
         n5xZwsKb41lQJ1LY2xOmjB/hr5JL9AhwA5OTlGS2DdqwOwq4uvedT9bDoeuFr/iZu2cB
         72HMh0L/6LgJlOEzVJgD7Bys/wQbvy6QJeyiip0VX4TeHT45R+gE4vn+cc2lmqbS/a27
         cSPXRbkwBj3y46/mdkdUPJB917hw+GASrknD7v1g5K7AearbNSIdYy5FM2Na3J/R2VCO
         0i4A8e5SrX4xKa54cJHpx6dSMaI/hfkRRnu1bS25ho1oGXfU0i31cr4MvQo/tvhnrVJV
         rd4g==
X-Gm-Message-State: AOJu0Yzr4KbVpd3Teu43AKdRAI6WDnkbIFgzX47Wj1BOb+jZ+tY1cyFM
        DngPqHQDBjSN+czq6Q1oZ5Vr0bnNeXF9ZeM+8KryBw==
X-Google-Smtp-Source: AGHT+IEp+r/G+F9ALTJcJwSWUUIq84xXeqbbTxwq+hyJDfyMLSX41SrDv0IBYEaao6LfexAo+FaMbOG1b+mtcTJPf1o=
X-Received: by 2002:a67:b14a:0:b0:447:8e0c:4372 with SMTP id
 z10-20020a67b14a000000b004478e0c4372mr8027267vsl.35.1692727694189; Tue, 22
 Aug 2023 11:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-16-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-16-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 19:07:58 +0100
Message-ID: <CAPY8ntAXTB9vJCCmO7Rwx60EqpsxJ2LPVvFte64r1_jaOMuPOg@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] media: i2c: imx219: Implement .init_cfg() using .set_fmt()
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Instead of duplicating the logical implemented in the .set_fmt()
> operation in .init_cfg(), call .set_fmt() directly. This centralize the

s/centralize/centralizes

> format and crop rectangle calculations in a single place.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 40 +++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index da2a8d0210fa..646d73d1e6a3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -785,28 +785,6 @@ static void imx219_update_pad_format(struct imx219 *imx219,
>         fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>  }
>
> -static int imx219_init_cfg(struct v4l2_subdev *sd,
> -                          struct v4l2_subdev_state *state)
> -{
> -       struct imx219 *imx219 = to_imx219(sd);
> -       struct v4l2_mbus_framefmt *format;
> -       struct v4l2_rect *crop;
> -
> -       /* Initialize the format. */
> -       format = v4l2_subdev_get_pad_format(sd, state, 0);
> -       imx219_update_pad_format(imx219, &supported_modes[0], format,
> -                                MEDIA_BUS_FMT_SRGGB10_1X10);
> -
> -       /* Initialize the crop rectangle. */
> -       crop = v4l2_subdev_get_pad_crop(sd, state, 0);
> -       crop->top = IMX219_PIXEL_ARRAY_TOP;
> -       crop->left = IMX219_PIXEL_ARRAY_LEFT;
> -       crop->width = IMX219_PIXEL_ARRAY_WIDTH;
> -       crop->height = IMX219_PIXEL_ARRAY_HEIGHT;
> -
> -       return 0;
> -}
> -
>  static int imx219_enum_mbus_code(struct v4l2_subdev *sd,
>                                  struct v4l2_subdev_state *sd_state,
>                                  struct v4l2_subdev_mbus_code_enum *code)
> @@ -925,6 +903,24 @@ static int imx219_get_selection(struct v4l2_subdev *sd,
>         return -EINVAL;
>  }
>
> +static int imx219_init_cfg(struct v4l2_subdev *sd,
> +                          struct v4l2_subdev_state *state)
> +{
> +       struct v4l2_subdev_format fmt = {
> +               .which = V4L2_SUBDEV_FORMAT_TRY,
> +               .pad = 0,
> +               .format = {
> +                       .code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +                       .width = supported_modes[0].width,
> +                       .height = supported_modes[0].height,
> +               },
> +       };
> +
> +       imx219_set_pad_format(sd, state, &fmt);
> +
> +       return 0;
> +}
> +
>  static const struct v4l2_subdev_core_ops imx219_core_ops = {
>         .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
>         .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> --
> Regards,
>
> Laurent Pinchart
>
