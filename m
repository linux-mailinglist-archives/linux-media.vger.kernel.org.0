Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C92178495C
	for <lists+linux-media@lfdr.de>; Tue, 22 Aug 2023 20:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjHVSXp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Aug 2023 14:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjHVSXo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Aug 2023 14:23:44 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3DA7CCB
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 11:23:42 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-79aeb0a4665so1499911241.1
        for <linux-media@vger.kernel.org>; Tue, 22 Aug 2023 11:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692728622; x=1693333422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gH0mWMBzAwnA/E1wYdWAwzPV35rmR1eaXYA+hhV0M+M=;
        b=nxkO1iCYtchdwg1FcpKyjjuJ311k6SHNWhyvrWJZbTId0euq8beXRfBKuR5cR29C9w
         RTFDA9+uyxiUFBYSzHuz9Z+MhclVE5+eo0G41O0RfD2r1LH1VvWPND6o4zLZqfMr9bb1
         Di0aV4GVBw5Jm295dD9WeVzy8XdhtaOgktqqXMcRixIP6wCm/h+eYcS5YLJ1jCeDYTtr
         auU4BJMV8Y4VsqJpgAtxAw//sGE1fA9OZvRp2R1mFWgdUiWv3GfvDUNNZpZQeWp3IhJs
         RKq9DHSqXCGV24qULYdOpmP3A/XhoOmTyxLiCyVOk8tb1C3ewVKg9S//xNLCsWdBJZUu
         RU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692728622; x=1693333422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gH0mWMBzAwnA/E1wYdWAwzPV35rmR1eaXYA+hhV0M+M=;
        b=gDQxp4JTHCMLzCupGeBtJ3b2/i4gFnvgmAuGsWiwKdsrq1JLzvs5+EYK4cGZ2vWw9f
         QuQ39YjK6OaXPnqLxyTbQlGekQCyjksFJOUcClWxyTFEv3kuqnHidl1SFMg4IxEZTnin
         87inG6kaebuEO0lTWFFdEx5sXYbSURRNIWRsEFMV4czlMx2b9Hz8DqW5VpZJEKvhth2u
         Bs4v+iEeWV1tIDlr6IQr4fzEkmij0KvyEUFRSpE/g9UPEjxpjXwoBZCqOx/JPU0Yd827
         cEUMTOn+nKk3HySY+WRcxKmM4Po+fWkL3kqlU0TIlp8gTBDgoSTfMXK0QH8Hpw+FpYjR
         wzFQ==
X-Gm-Message-State: AOJu0YzRZFw+HFIuMpBqQC+QNnW6A8y5AXff6CV69s0pSsx6iK1tDXF/
        8Xrg7cGPHC4nKDh0vlEEeOSJXa6+SIv+weLx3M97Jg==
X-Google-Smtp-Source: AGHT+IHlcBJSUCWAPD3WJVDXt8OBP6mTtuG8uQxOTT1sIReRYuee6qczHnsTkg+FtJ5LinEAvmvtaAGGwnLfokCgNhI=
X-Received: by 2002:a1f:e246:0:b0:48d:3a9:d561 with SMTP id
 z67-20020a1fe246000000b0048d03a9d561mr7611531vkg.2.1692728622103; Tue, 22 Aug
 2023 11:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com> <20230821223001.28480-19-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230821223001.28480-19-laurent.pinchart@ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 22 Aug 2023 19:23:26 +0100
Message-ID: <CAPY8ntA1f_swjJ2uF3yMO3XtEXZpi0_w2=-35CA81wFPuh3cnw@mail.gmail.com>
Subject: Re: [PATCH v2 18/18] media: i2c: imx219: Move variables to inner scope
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
> The exposure_max, exposure_def and hblank variables are only used in an
> inner scope in the imx219_set_pad_format() function. Move them to that
> scope to keep them closer to their usage and improve readability.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index e2f0d3782e7c..69908ebed04a 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -801,7 +801,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  {
>         struct imx219 *imx219 = to_imx219(sd);
>         const struct imx219_mode *mode;
> -       int exposure_max, exposure_def, hblank;
>         struct v4l2_mbus_framefmt *format;
>         struct v4l2_rect *crop;
>         unsigned int bin;
> @@ -830,6 +829,10 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +               int exposure_max;
> +               int exposure_def;
> +               int hblank;
> +
>                 /* Update limits and set FPS to default */
>                 __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
>                                          IMX219_VTS_MAX - mode->height, 1,
> --
> Regards,
>
> Laurent Pinchart
>
