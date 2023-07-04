Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A12B0746FD1
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 13:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjGDLXq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 07:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjGDLXp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 07:23:45 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BF69D
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 04:23:42 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-47e3d3e859dso626975e0c.3
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688469822; x=1691061822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok5HgP9Tq50/Zh37AN740soKJISQQJG03hKFvbCGzOY=;
        b=VAEnlMLb9CARaWu8F+M+/usshyX8zM+k0/ohhyf822G3YL/GIv/ZmFHhuyeLq/6L0b
         d2Ww80ZCnBatZkr04eNKdEOdEH7FnDC3dxI4WWx4QguvVPUy9UCliY6tlt4R0Yn9x1YF
         BV1jnrDE1+H+RRpQOJ5a1EGyZ71utc9aBq6tEoT3VaNBqWIJmFiOIxVzaR+Q6FG9eRYs
         Zx3oEb6ezrdyQEfG54lIwDVpwh7G0nmVYYrtg+NYREji1gzd2RYP4GnrT6+JOYbnyytS
         9QMAr19cVKTp3RFa4pb0XeitZMUf6IEpP0If0+i/JobpKWJHG6HsLPqp5A/Hry5LTfOr
         K7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688469822; x=1691061822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok5HgP9Tq50/Zh37AN740soKJISQQJG03hKFvbCGzOY=;
        b=CvciCjSMVdaXuFnKoHVC5jduv5+2Kv1y0LoHWubJqmglJyS7JAI6Z57LAvF7Yz51ev
         GpWpaEf80IvNfm2pQASHOqmJHkz/UacIEo2SznQI1nshja5eiB3nxZpQJaKWZgFD5Rn+
         7F+aSwPvFkS3AyfYKSBmNYqt9pie7ZAQzaXUeZStWRLwHMgQ/vM0FEABnjPnKsMwZfXH
         Af9Da6UH8XOfiq3C5Cm7mNzwt8wJxpLFq2+LxM8ymIl472XiVZV9oRthpf6CkT6Sb1Xu
         M6RrQzrgFwNWh0+uxN5mhOQbeXvlPJ33x3aITq/5vRzmuW9aRitIMlK1yXhBsxCKAKI4
         ed4Q==
X-Gm-Message-State: ABy/qLa8fmzN1oVa/gfkBP035Nlm91fYeIno186HeMk9Jy8GRIa0yAdH
        qAN0p2hoyXx45Ch6aFt/GzTLIVjzH1PAGlqsGRyTFg==
X-Google-Smtp-Source: APBJJlFQg5WKPsbWIq70ifVM3SQd5vpHatQ6L0d9DZdUD0FEqLnQ7GHmjyEkCqhccIvqOGGZZZHWcdqztHpC7J305SQ=
X-Received: by 2002:a1f:5ed6:0:b0:47e:fd6:6d77 with SMTP id
 s205-20020a1f5ed6000000b0047e0fd66d77mr5293245vkb.3.1688469821737; Tue, 04
 Jul 2023 04:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230627131830.54601-1-hdegoede@redhat.com> <20230627131830.54601-29-hdegoede@redhat.com>
 <6f3d903c-acdc-983c-216b-45792a71d603@ideasonboard.com> <750f6763-d08a-efe1-f75e-b8c3a10b7c46@redhat.com>
In-Reply-To: <750f6763-d08a-efe1-f75e-b8c3a10b7c46@redhat.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 12:23:25 +0100
Message-ID: <CAPY8ntA4NexYVDuuw6-vqLJ33zz7jx+qN9bzx6c3wVGgF51ZfQ@mail.gmail.com>
Subject: Re: [PATCH v3 28/29] media: ov2680: Add link-freq and pixel-rate controls
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans and Dan

On Tue, 4 Jul 2023 at 10:45, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Dan,
>
> On 7/4/23 11:22, Dan Scally wrote:
> > Morning Hans
> >
> > On 27/06/2023 15:18, Hans de Goede wrote:
> >> Add read-only link-freq and pixel-rate controls. This is necessary for
> >> the sensor to work with the ipu3-cio2 driver and for libcamera.
> >>
> >> Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   drivers/media/i2c/ov2680.c | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/drivers/media/i2c/ov2680.c b/drivers/media/i2c/ov2680.c
> >> index 8bc542df1890..95d3152ddd22 100644
> >> --- a/drivers/media/i2c/ov2680.c
> >> +++ b/drivers/media/i2c/ov2680.c
> >> @@ -75,6 +75,12 @@
> >>   #define OV2680_MIN_CROP_WIDTH            2
> >>   #define OV2680_MIN_CROP_HEIGHT            2
> >>   +/* Fixed pre-div of 1/2 */
> >> +#define OV2680_PLL_PREDIV0            2
> >> +
> >> +/* Pre-div configurable through reg 0x3080, left at its default of 0x=
02 : 1/2 */
> >> +#define OV2680_PLL_PREDIV            2
> >> +
> >>   /* 66MHz pixel clock: 66MHz / 1704 * 1294 =3D 30fps */
> >>   #define OV2680_PIXELS_PER_LINE            1704
> >>   #define OV2680_LINES_PER_FRAME            1294
> >> @@ -118,6 +124,8 @@ struct ov2680_ctrls {
> >>       struct v4l2_ctrl *hflip;
> >>       struct v4l2_ctrl *vflip;
> >>       struct v4l2_ctrl *test_pattern;
> >> +    struct v4l2_ctrl *link_freq;
> >> +    struct v4l2_ctrl *pixel_rate;
> >>   };
> >>     struct ov2680_mode {
> >> @@ -145,6 +153,8 @@ struct ov2680_dev {
> >>       struct clk            *xvclk;
> >>       u32                xvclk_freq;
> >>       u8                pll_mult;
> >> +    s64                link_freq[1];
> >> +    s64                pixel_rate;
> >>       struct regulator_bulk_data    supplies[OV2680_NUM_SUPPLIES];
> >>         struct gpio_desc        *pwdn_gpio;
> >> @@ -906,6 +916,12 @@ static int ov2680_v4l2_register(struct ov2680_dev=
 *sensor)
> >>       ctrls->gain =3D v4l2_ctrl_new_std(hdl, ops, V4L2_CID_GAIN,
> >>                       0, 1023, 1, 250);
> >>   +    ctrls->link_freq =3D v4l2_ctrl_new_int_menu(hdl, NULL, V4L2_CID=
_LINK_FREQ,
> >> +                          0, 0, sensor->link_freq);
> >> +    ctrls->pixel_rate =3D v4l2_ctrl_new_std(hdl, NULL, V4L2_CID_PIXEL=
_RATE,
> >> +                          0, sensor->pixel_rate,
> >> +                          1, sensor->pixel_rate);
> >> +
> >>       if (hdl->error) {
> >>           ret =3D hdl->error;
> >>           goto cleanup_entity;
> >> @@ -913,6 +929,7 @@ static int ov2680_v4l2_register(struct ov2680_dev =
*sensor)
> >>         ctrls->vflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >>       ctrls->hflip->flags |=3D V4L2_CTRL_FLAG_MODIFY_LAYOUT;
> >> +    ctrls->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> >>         sensor->sd.ctrl_handler =3D hdl;
> >>   @@ -1030,6 +1047,12 @@ static int ov2680_parse_dt(struct ov2680_dev =
*sensor)
> >>         sensor->pll_mult =3D ov2680_pll_multipliers[i];
> >>   +    sensor->link_freq[0] =3D sensor->xvclk_freq / OV2680_PLL_PREDIV=
0 /
> >> +                   OV2680_PLL_PREDIV * sensor->pll_mult;
> >> +
> >> +    /* CSI-2 is double data rate, bus-format is 10 bpp */
> >> +    sensor->pixel_rate =3D sensor->link_freq[0] * 2 / 10;
> >
> >
> > I'm a little unsure on this one. My understanding is that the link freq=
uency really ought to come from the endpoint properties (which in our case =
would be set by the ipu-bridge; though it doesn't for this sensor at the mo=
ment because I didn't understand it properly back then) because it's a plat=
form specific thing. What the value should be, I have been determining by r=
eading the PLL settings for the sensor whilst the laptop's running Windows.=
 So whilst this is probably technically fine in supporting the link frequen=
cy that the driver already expects to configure for whatever platform this =
was originally designed for, my guess would be that the Miix expects a diff=
erent link frequency and ideally we'd support that instead. For example see=
 these commits for the ov7251:
>
> The datasheet is clear that the ov2680 is intended to be used with
> a fixed pixelclock of 66 MHz:
>
> "2.2 architecture
>
> The OV2680 sensor core generates streaming pixel data at a constant
> frame rate to a pixel clock of 66 MHz."
>
> and the ov2680 always operates in single lane mode. So there really is
> not much to configure here.
>
> Also the datasheet only contains a rudimentary description of the PLL,
> which is not really enough to write a function to configure the PLL for
> arbitrary link-frequencies.

Working from an OV2680 datasheet I've found on the internet [1] I'll
agree with you that the pixel clock is intended only ever to be 66MHz.

With the FIFO at the front of the "image output interface" in fig 2-1,
and the dividers shown in fig 2-8, the link frequencies could differ
from one fixed ratio from the pixel clock.
Not being able to produce fully arbitrary link frequencies is totally
acceptable in a driver, so there's no obligation to understand or
control those dividers.

> The adjustment to make the sensor work with a 19.2MHz xvclk instead
> of the default 24 MHz comes from the atomisp code. How to make other
> adjustments would pretty much be guess work.
>
> I guess we could add code to check the link-frequencies and check
> that there is only 1 and it matches the expected 330 MHz then the driver
> still honors the link-frequencies property while at the same time
> sticking with the fixed setup the sensor is intended to be used with.
>
> Would adding a link-frequency check like that work for you ?

This is the approach taken in other drivers - see imx214 and imx219
for 2 examples (I've not gone looking for more).

> And if yes what should the link-frequency control return then,
> the actual achieved frequency (this would be better IMHO) or
> the one from the property ?

You've checked that the link-frequency matches the expected 330MHz, so
isn't the actual achieved frequency the same as the one configured?
I'm confused by your statement.

I'm assuming that it's the ipu3-cio that needs link-frequency, as
AFAIK libcamera doesn't.

  Dave

[1] http://www.datasheet.es/PDF/1045403/OV2680-pdf.html

> Regards,
>
> Hans
>
>
