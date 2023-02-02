Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAF8687C17
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 12:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjBBLUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Feb 2023 06:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjBBLUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Feb 2023 06:20:35 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E37549426
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 03:20:31 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id cq16-20020a17090af99000b0022c9791ac39so5231004pjb.4
        for <linux-media@vger.kernel.org>; Thu, 02 Feb 2023 03:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qX7BIqDIO3YtfBIW1WPQ0fxLJ7P/Bld9aGg46QQJtnI=;
        b=b1RQYSVZF3w22gH8sjOU/U99i9Goo5oG2f1cNWUUSRXHqcxQw0oifeiOnT7ulQPCq1
         LOJKLGrfIqtwS1Eu8gBEdc0T9e+w3e0E5UbVlQqiC69zDYt3qF9c8FkcVYm00cRWNOMP
         JbBdBBPFq1GVeGCWy9hjyQ6picxGMXsfLDKO2TfvEUd0QWBYXmrtetzgAQXitXMnEsVy
         M5yhx8559ZXuBWuBivM47bgvu9Z8KWOOPYlqWx611nAaiWSNAFvnQx9Bchif25hLWxwT
         ka35HEBxXkA5NCPygA4EPtIXXjNwwvjU40q0+N0zMRMVfIiJ/ygH8BPNrhlpLzmUBgdM
         6lRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qX7BIqDIO3YtfBIW1WPQ0fxLJ7P/Bld9aGg46QQJtnI=;
        b=LWl87Jm9ZrAV4UMSsxbfh7eKLrcPHLcqHrcQgP6wEbbgcehtQpMa/2Vgnzw6dyZnaT
         sxEP+/pf0Cm7DH8R2iBjX6KSLkViA1CFFEtijcutQf3Ok1jMSSyk0ySFzHtnr0MzOqGM
         dARBuuM9gG48oQCBRG4Pg2h340bMx6pwT/6SfppC/HlzyRqcIYecycyiNX1dOKgOEyyF
         qT55uH4IFJS/YNA/TOUyeNsg4k6C2yao5Wkv07eiIMEMw1+fBmBf/f0n4sEACuxWkfol
         uvY9JWYHdjxzLEUetxX2eQiUQR6NzOwYAkQhMeVX+YQS2jp0IJ8LgBk0WNCEANt/orwI
         A9IQ==
X-Gm-Message-State: AO0yUKV+2Y3vR8QROtlhCIj82UTqHhksopRGMVZeivory1CZMfMxc+Ce
        8kNWv5c8ndTDg3MBf1ekBL1Kp8JGwiVmWRY7VNZuyA==
X-Google-Smtp-Source: AK7set9RPFs6i3Gy+61OXLVfI2IdFXGg0m1yLDb1kvGB2Tk6CjvyzgRwtErD+j8CWBS2rtgwkXAlCmjUxcXhC7iBR0k=
X-Received: by 2002:a17:902:d506:b0:196:cca:a0b4 with SMTP id
 b6-20020a170902d50600b001960ccaa0b4mr1469934plg.20.1675336831028; Thu, 02 Feb
 2023 03:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20230131190700.3476796-1-dave.stevenson@raspberrypi.com>
 <20230131190700.3476796-3-dave.stevenson@raspberrypi.com> <5647238.DvuYhMxLoT@steina-w>
 <Y9sAhVSanMmHGHmX@pendragon.ideasonboard.com>
In-Reply-To: <Y9sAhVSanMmHGHmX@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 2 Feb 2023 11:20:14 +0000
Message-ID: <CAPY8ntDYum7b5KYMry3oR6N8sdiwU=FOsyL3NVeFMQObET=SyQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: imx290: Add support for the mono sensor variant.
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Thu, 2 Feb 2023 at 00:15, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Feb 01, 2023 at 08:03:36AM +0100, Alexander Stein wrote:
> > Am Dienstag, 31. Januar 2023, 20:07:00 CET schrieb Dave Stevenson:
> > > The IMX290 module is available as either mono or colour (Bayer).
> > >
> > > Update the driver so that it can advertise the correct mono
> > > formats instead of the colour ones.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 47 ++++++++++++++++++++++++--------------
> > >  1 file changed, 30 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index 49d6c8bdec41..a370f1102334 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -13,6 +13,7 @@
> > >  #include <linux/gpio/consumer.h>
> > >  #include <linux/i2c.h>
> > >  #include <linux/module.h>
> > > +#include <linux/of_device.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/regulator/consumer.h>
> > > @@ -177,6 +178,7 @@ struct imx290 {
> > >     struct clk *xclk;
> > >     struct regmap *regmap;
> > >     u8 nlanes;
> > > +   u8 mono;
> > >
> > >     struct v4l2_subdev sd;
> > >     struct media_pad pad;
> > > @@ -414,7 +416,8 @@ static inline int imx290_modes_num(const struct imx290 *imx290) }
> > >
> > >  struct imx290_format_info {
> > > -   u32 code;
> > > +   /* Array of codes. [0] is for colour, [1] is for mono. */
> > > +   u32 code[2];
> >
> > Please use a define for that.
> >
> > >     u8 bpp;
> > >     const struct imx290_regval *regs;
> > >     unsigned int num_regs;
> > > @@ -422,26 +425,27 @@ struct imx290_format_info {
> > >
> > >  static const struct imx290_format_info imx290_formats[] = {
> > >     {
> > > -           .code = MEDIA_BUS_FMT_SRGGB10_1X10,
> > > +           .code = { MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_Y10_1X10 },
> > >             .bpp = 10,
> > >             .regs = imx290_10bit_settings,
> > >             .num_regs = ARRAY_SIZE(imx290_10bit_settings),
> > >     }, {
> > > -           .code = MEDIA_BUS_FMT_SRGGB12_1X12,
> > > +           .code = { MEDIA_BUS_FMT_SRGGB12_1X12, MEDIA_BUS_FMT_Y12_1X12 },
> > >             .bpp = 12,
> > >             .regs = imx290_12bit_settings,
> > >             .num_regs = ARRAY_SIZE(imx290_12bit_settings),
> > >     }
> > >  };
> > >
> > > -static const struct imx290_format_info *imx290_format_info(u32 code)
> > > +static const struct imx290_format_info *
> > > +imx290_format_info(const struct imx290 *imx290, u32 code)
> > >  {
> > >     unsigned int i;
> > >
> > >     for (i = 0; i < ARRAY_SIZE(imx290_formats); ++i) {
> > >             const struct imx290_format_info *info = &imx290_formats[i];
> > >
> > > -           if (info->code == code)
> > > +           if (info->code[imx290->mono] == code)
> > >                     return info;
> > >     }
> > >
> > > @@ -536,7 +540,7 @@ static int imx290_set_black_level(struct imx290 *imx290,
> > > const struct v4l2_mbus_framefmt *format,
> > >                               unsigned int black_level, int *err)
> > >  {
> > > -   unsigned int bpp = imx290_format_info(format->code)->bpp;
> > > +   unsigned int bpp = imx290_format_info(imx290, format->code)->bpp;
> > >
> > >     return imx290_write(imx290, IMX290_BLKLEVEL,
> > >                         black_level >> (16 - bpp), err);
> > > @@ -548,7 +552,7 @@ static int imx290_setup_format(struct imx290 *imx290,
> > >     const struct imx290_format_info *info;
> > >     int ret;
> > >
> > > -   info = imx290_format_info(format->code);
> > > +   info = imx290_format_info(imx290, format->code);
> > >
> > >     ret = imx290_set_register_array(imx290, info->regs, info->num_regs);
> > >     if (ret < 0) {
> > > @@ -844,10 +848,12 @@ static int imx290_enum_mbus_code(struct v4l2_subdev
> > > *sd, struct v4l2_subdev_state *sd_state,
> > >                              struct v4l2_subdev_mbus_code_enum *code)
> > >  {
> > > +   const struct imx290 *imx290 = to_imx290(sd);
> > > +
> > >     if (code->index >= ARRAY_SIZE(imx290_formats))
> > >             return -EINVAL;
> > >
> > > -   code->code = imx290_formats[code->index].code;
> > > +   code->code = imx290_formats[code->index].code[imx290->mono];
> > >
> > >     return 0;
> > >  }
> > > @@ -859,7 +865,7 @@ static int imx290_enum_frame_size(struct v4l2_subdev
> > > *sd, const struct imx290 *imx290 = to_imx290(sd);
> > >     const struct imx290_mode *imx290_modes = imx290_modes_ptr(imx290);
> > >
> > > -   if (!imx290_format_info(fse->code))
> > > +   if (!imx290_format_info(imx290, fse->code))
> > >             return -EINVAL;
> > >
> > >     if (fse->index >= imx290_modes_num(imx290))
> > > @@ -888,8 +894,8 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
> > >     fmt->format.width = mode->width;
> > >     fmt->format.height = mode->height;
> > >
> > > -   if (!imx290_format_info(fmt->format.code))
> > > -           fmt->format.code = imx290_formats[0].code;
> > > +   if (!imx290_format_info(imx290, fmt->format.code))
> > > +           fmt->format.code = imx290_formats[0].code[imx290->mono];
> > >
> > >     fmt->format.field = V4L2_FIELD_NONE;
> > >
> > > @@ -1177,16 +1183,29 @@ static s64 imx290_check_link_freqs(const struct
> > > imx290 *imx290, return 0;
> > >  }
> > >
> > > +static const struct of_device_id imx290_of_match[] = {
> > > +   { .compatible = "sony,imx290" },
> > > +   { .compatible = "sony,imx290-mono", .data = (void *)1 },
> >
> > Would you mind using a model specific struct? I have a patch on my stack
> > adding support for imx327. There are some imx327 specific writes to registers
> > during initialization. I do not mind adding this struct later though.
>
> If not a structure already, at least an enum
>
> enum imx290_model {
>         IMX290_MODEL_COLOUR,
>         IMX290_MODEL_MONO,
> };
>
> > > +   { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, imx290_of_match);
> > > +
> > >  static int imx290_parse_dt(struct imx290 *imx290)
> > >  {
> > > +   struct i2c_client *client = to_i2c_client(imx290->dev);
> > >     /* Only CSI2 is supported for now: */
> > >     struct v4l2_fwnode_endpoint ep = {
> > >             .bus_type = V4L2_MBUS_CSI2_DPHY
> > >     };
> > > +   const struct of_device_id *match;
> > >     struct fwnode_handle *endpoint;
> > >     int ret;
> > >     s64 fq;
> > >
> > > +   match = i2c_of_match_device(imx290_of_match, client);
> > > +   if (match)
> > > +           imx290->mono = match->data ? 1 : 0;
> > > +
>
> You can simplify this to
>
>         imx290->mono = (enum imx290_model)of_device_get_match_data(imx290->dev);
>
> which may then be best placed in the probe function.
>
> I'd be tempted to rename the imx290 mono field to model as the above
> looks weird, but if Alexander needs a structure anyway, we may also just
> do it right away:
>
> enum imx290_model {
>         IMX290_MODEL_COLOUR,
>         IMX290_MODEL_MONO,
> };
>
> struct imx290_model_info {
>         bool mono;
> };

To my mind this gets confusing as to whether imx290_model is the
mono/colour switch reference for finding a code in imx290_formats, or
differentiating between imx290llr (mono), imx290lqr (colour),
imx327xyz, etc as different models of the sensor. (Having the IMX290
prefix because it is in the imx290 driver will get even more confusing
when you get IMX290_MODEL_IMX327_COLOUR).

Alexander was asking for a define to set the size of code in struct
imx290_format_info. As you also point out above, switching to using an
enum makes more sense, and then you can add a _MAX to get the array
size.

enum imx290_colour_variant {
        IMX290_VARIANT_COLOUR,
        IMX290_VARIANT_MONO,
        IMX290_VARIANT_MAX
};

enum imx290_model {
        IMX290_MODEL_IMX290LLR,
        IMX290_MODEL_IMX290LQR,
/*
        IMX290_MODEL_IMX327LQR,
        IMX290_MODEL_IMX462LQR,
        IMX290_MODEL_IMX462LLR,
        etc,
*/
};

static const struct imx290_model_info imx290_models[] = {
        [IMX290_MODEL_IMX290LQR]= {
                .colour_variant = IMX290_VARIANT_COLOUR,
        },
        [IMX290_MODEL_IMX290LLR] = {
                .colour_variant = IMX290_VARIANT_MONO,
        },
};

Thoughts?
Otherwise I will drop back to the simplest option - I'm afraid I
haven't got masses of time to be messing about revising patches at
present.

  Dave

>
> static const struct imx290_model_info imx290_models[] = {
>         [IMX290_MODEL_COLOUR] = {
>                 .mono = false,
>         },
>         [IMX290_MODEL_MONO] = {
>                 .mono = true,
>         },
> };
>
> static const struct of_device_id imx290_of_match[] = {
>         {
>                 .compatible = "sony,imx290",
>                 .data = &imx290_models[IMX290_MODEL_COLOUR],
>         },
>         {
>                 .compatible = "sony,imx290-mono",
>                 .data = &imx290_models[IMX290_MODEL_MONO],
>         },
>         { /* sentinel */ },
> };
>
> ...
>
>         imx290->model = of_device_get_match_data(imx290->dev);
>
> and use imx290->model->mono instead of imx290->mono through the code.
>
> I'm OK if you don't want this additional complexity yet, but the code is
> here already and will be needed soon :-)
>
> > >     endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(imx290->dev), NULL);
> > >     if (!endpoint) {
> > >             dev_err(imx290->dev, "Endpoint node not found\n");
> > > @@ -1351,12 +1370,6 @@ static void imx290_remove(struct i2c_client *client)
> > >     pm_runtime_set_suspended(imx290->dev);
> > >  }
> > >
> > > -static const struct of_device_id imx290_of_match[] = {
> > > -   { .compatible = "sony,imx290" },
> > > -   { /* sentinel */ }
> > > -};
> > > -MODULE_DEVICE_TABLE(of, imx290_of_match);
> > > -
> > >  static struct i2c_driver imx290_i2c_driver = {
> > >     .probe_new  = imx290_probe,
> > >     .remove = imx290_remove,
>
> --
> Regards,
>
> Laurent Pinchart
