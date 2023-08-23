Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA040785584
	for <lists+linux-media@lfdr.de>; Wed, 23 Aug 2023 12:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbjHWKgU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Aug 2023 06:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbjHWKgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Aug 2023 06:36:09 -0400
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com [IPv6:2607:f8b0:4864:20::a30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E51ECC
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 03:36:06 -0700 (PDT)
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-48d2c072030so1759626e0c.0
        for <linux-media@vger.kernel.org>; Wed, 23 Aug 2023 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1692786965; x=1693391765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6d+7f3MnJT1yn57ZjNVL+PHY0cFyx7NfZeSH/jRGoDY=;
        b=fmY9pyT+WOn3SNmKu1cRoTcrzjrCDcBY7dJnZydeMEYc2bdUWNISSvwHqFWmjEDlKn
         hv5dloATqiMrrtCw+hBAFxI8JCNBuXOD2+0bS8Ba+aLwqjjg2GKaSiElhQEm62cOrGM1
         5ejYRhGxWWD6ZQDTXrjMsahBiEpQzj/nlnZGCPmsaBUr80qqxMpr5TDtlnh7qvQ0neaH
         RcpJDcjweZVlTz7fmKAeOq0jq1bQv3Svkl/mB/cl+GYMKnPIUVvSMM95/cwCcWhRsRQa
         j/zzfcjVZhA0McYMQ0zre7VatD/P1sH33/pAEBK2acM7JjwpJszCnNYjedfZZDuLiilC
         Izsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692786965; x=1693391765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6d+7f3MnJT1yn57ZjNVL+PHY0cFyx7NfZeSH/jRGoDY=;
        b=anfc0RdVas0b7wAe3YXBQAViJW/r4ZnG4O1JjOGWwSqc9OZyRyvPNB+9dEKmpmbPI0
         bhOJ+ERcVvz3kF50XmuLgURMuPOSrPolg7OXDXSKQhUzogozgYzFMGIVMR+nhJSg+qdq
         6c4r58uUz0/D3ERgCH8haXZBXTpBgceVvNxQZ2AQ0tblMyQKoaahemqWvjSxL0uU6/C3
         CKrek79g4T+taR7SDU5Jvq4p7rVOqGKNmNaIK0w4Qk7J4EVQhin+ppo7nIB1I5P9EgdS
         j2Xy4C0ZLVVRGZSCR3r6/O2krINcXO/cewcBjhGVvHgTVQTDMhvBfT0g/KbwgOpaVMxz
         0YPA==
X-Gm-Message-State: AOJu0Yx7DbUXJxLDTV4LutogkcjnMnNNqg8F6D1ntMC79AOkWU6cZJxE
        eS6VRtjrBvzj7zWxQMlw/9WOmCzjsYUssmALJO0ljg==
X-Google-Smtp-Source: AGHT+IHIJxC3/wwNFE/CWuW8hhBnhxqY1LgekqgCn7qM++DbPbZmGq01HC+nuMnkWpxBnTtlVQWptOFmwGsm4b9xjj8=
X-Received: by 2002:a1f:94c2:0:b0:48c:f9f0:5453 with SMTP id
 w185-20020a1f94c2000000b0048cf9f05453mr5845837vkd.0.1692786965473; Wed, 23
 Aug 2023 03:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230821223001.28480-1-laurent.pinchart@ideasonboard.com>
 <20230821223001.28480-17-laurent.pinchart@ideasonboard.com>
 <CAPY8ntAmdkSKcGVdCURt-Zae-nQk9Ljwu0Gp28bx-Er6_Vq-AA@mail.gmail.com> <20230823090742.GE4143@pendragon.ideasonboard.com>
In-Reply-To: <20230823090742.GE4143@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 23 Aug 2023 11:35:49 +0100
Message-ID: <CAPY8ntBFkksVHa-p97HnwDAW=PARTXKY-rJUjOx5QnKOpMkyPQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/18] media: i2c: imx219: Calculate crop rectangle dynamically
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 23 Aug 2023 at 10:07, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Tue, Aug 22, 2023 at 07:15:21PM +0100, Dave Stevenson wrote:
> > On Mon, 21 Aug 2023 at 23:30, Laurent Pinchart wrote:
> > >
> > > Calculate the crop rectangle size and location dynamically when setting
> > > the format, instead of storing it in the imx219_mode structure. This
> > > removes duplicated information from the mode, to guarantee consistency.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx219.c | 45 +++++++++++++-------------------------
> > >  1 file changed, 15 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 646d73d1e6a3..4140d9b78e4c 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/delay.h>
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > > +#include <linux/minmax.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regulator/consumer.h>
> > > @@ -152,9 +153,6 @@ struct imx219_mode {
> > >         /* Frame height */
> > >         unsigned int height;
> > >
> > > -       /* Analog crop rectangle. */
> > > -       struct v4l2_rect crop;
> > > -
> > >         /* V-timing */
> > >         unsigned int vts_def;
> > >  };
> > > @@ -292,48 +290,24 @@ static const struct imx219_mode supported_modes[] = {
> > >                 /* 8MPix 15fps mode */
> > >                 .width = 3280,
> > >                 .height = 2464,
> > > -               .crop = {
> > > -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> > > -                       .top = IMX219_PIXEL_ARRAY_TOP,
> > > -                       .width = 3280,
> > > -                       .height = 2464
> > > -               },
> > >                 .vts_def = 3526,
> > >         },
> > >         {
> > >                 /* 1080P 30fps cropped */
> > >                 .width = 1920,
> > >                 .height = 1080,
> > > -               .crop = {
> > > -                       .left = 688,
> > > -                       .top = 700,
> > > -                       .width = 1920,
> > > -                       .height = 1080
> > > -               },
> > >                 .vts_def = 1763,
> > >         },
> > >         {
> > >                 /* 2x2 binned 30fps mode */
> > >                 .width = 1640,
> > >                 .height = 1232,
> > > -               .crop = {
> > > -                       .left = IMX219_PIXEL_ARRAY_LEFT,
> > > -                       .top = IMX219_PIXEL_ARRAY_TOP,
> > > -                       .width = 3280,
> > > -                       .height = 2464
> > > -               },
> > >                 .vts_def = 1763,
> > >         },
> > >         {
> > >                 /* 640x480 30fps mode */
> > >                 .width = 640,
> > >                 .height = 480,
> > > -               .crop = {
> > > -                       .left = 1008,
> > > -                       .top = 760,
> > > -                       .width = 1280,
> > > -                       .height = 960
> > > -               },
> > >                 .vts_def = 1763,
> > >         },
> > >  };
> > > @@ -830,6 +804,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >         int exposure_max, exposure_def, hblank;
> > >         struct v4l2_mbus_framefmt *format;
> > >         struct v4l2_rect *crop;
> > > +       unsigned int bin;
> > >
> > >         mode = v4l2_find_nearest_size(supported_modes,
> > >                                       ARRAY_SIZE(supported_modes),
> > > @@ -839,10 +814,20 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
> > >         imx219_update_pad_format(imx219, mode, &fmt->format, fmt->format.code);
> > >
> > >         format = v4l2_subdev_get_pad_format(sd, sd_state, 0);
> > > -       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > > -
> > >         *format = fmt->format;
> > > -       *crop = mode->crop;
> > > +
> > > +       /*
> > > +        * Use binning to maximize the crop rectangle size, and centre it in the
> > > +        * sensor. Bin by the same factor horizontally and vertically.
> > > +        */
> > > +       bin = min3(IMX219_PIXEL_ARRAY_WIDTH / format->width,
> > > +                  IMX219_PIXEL_ARRAY_HEIGHT / format->height, 2U);
> >
> > If you're insisting that binning is by the same factor horizontally
> > and vertically, why consider both in the min? Either only look at one,
> > or we start looking at making H & V binning independent.
>
> I was considering making them independent. It should be fairly easy. If
> you're fine with that, I think that would be my preference.

I haven't tried this sensor with different binning settings between H
& V, but have no issue with it being investigated.

It was the combination of stating that they must be the same but then
considering both that seemed odd.

  Dave

> > > +
> > > +       crop = v4l2_subdev_get_pad_crop(sd, sd_state, 0);
> > > +       crop->width = format->width * bin;
> > > +       crop->height = format->height * bin;
> > > +       crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
> > > +       crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
> > >
> > >         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> > >                 /* Update limits and set FPS to default */
>
> --
> Regards,
>
> Laurent Pinchart
