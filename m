Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF347600D9F
	for <lists+linux-media@lfdr.de>; Mon, 17 Oct 2022 13:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbiJQLVd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Oct 2022 07:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiJQLVc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Oct 2022 07:21:32 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D317662A91
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 04:21:26 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id b12so15543088edd.6
        for <linux-media@vger.kernel.org>; Mon, 17 Oct 2022 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ESlVYACg7riS16UtYuQf8DPZbmCk4aeHdyRBRqmKcMQ=;
        b=cuvpDnh3oQn+2krK9gGawHvchiNGzUZPJrH40k9IFHSOKzXBH+4OK4IYo9BpZVnLvB
         9yUsFy6ZVWfFu0Y4dzKisCDRWJoYE0+s32FCjVL+tra8ruehR3SsPt1pqu20ATIfH51x
         Bz0DARwDQeEqIkuNhIUsnBGsWrOPL1NVMHKdIjEj/tJmWk6SKcNNb/rOmthiewSAIL+j
         LugZMETnGds05xxafY4cXyXslqbKXhi/8JMTv6IAlto9jJlMox6tPi2MrLT78fonvlLv
         /SgtZlRu3gUd3aTIoBmO6RD8o3Gn51Jr2l1jY6bAruD6BLdjN7WKGgzDfCoBbG+ZH0Q3
         u4eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESlVYACg7riS16UtYuQf8DPZbmCk4aeHdyRBRqmKcMQ=;
        b=3DCen5YmA7dyL8Ld6v3DDsJo1VmbyPSeWoor1NViQ+BuDDk/8GvO/bkdZF5SOCZC3A
         8wjEHmPhVt7Twcx20HNn6CYzTGdTfiHosLbGhvSkjtwlikin2SfC3NvUcsmR9UqcMS5R
         pNcO9lpFI97DsJWqcht7pMXUS+Judgm6bbj699SXmx2SYFvFQ6fQL96+fCwu32lO3wlg
         p49nQ7Cn2dyjWmPSa2ErcSxTdkmLYz8pBNHNr2sSchRL+ZTYuKfZp7Xq/dS0oCAGVA6S
         QZcEZLKL6+vBkKcDiHOmaVpwUO68g6GrPDB1Isio/PHygpqaeb6ctEd05vRgGttsrhDF
         etLA==
X-Gm-Message-State: ACrzQf3skzfqPWM63sFozDaUwfrpqDKB8VU6y7zepV08QKB1Y3Q8NUMc
        ezA3w4QC9DqgWvbM01UaKkurTl4fd5LTYNm9PNpxeg==
X-Google-Smtp-Source: AMsMyM7A3PjdSXRnrBIXfCBlckfJOaIYLmrlvm3Qp2Nz/5Soi8cx5UzMMW9MrIcGenob37a4iAKrCFM4otKIG448IXY=
X-Received: by 2002:a05:6402:2913:b0:45c:a7d6:c1ef with SMTP id
 ee19-20020a056402291300b0045ca7d6c1efmr9656066edb.276.1666005685364; Mon, 17
 Oct 2022 04:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-6-jacopo@jmondi.org>
 <CAPY8ntB_JQHJQH7DChEyou-RSRTcEF-Uy=+3Ly06MUtg0TCZ6A@mail.gmail.com>
 <Y0AxI2RKxomjEb2t@pendragon.ideasonboard.com> <CAPY8ntCh4UFT5swHvwPj7xz8wPH3MJB-aJjEd9bCgXVubRyp5w@mail.gmail.com>
 <Y0tkBvcufgwSe/AT@pendragon.ideasonboard.com>
In-Reply-To: <Y0tkBvcufgwSe/AT@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 17 Oct 2022 12:21:10 +0100
Message-ID: <CAPY8ntBU_ELTKnM9+uV+3H3tvzbKGxS+6bF=wv4PMvNyVb+Yiw@mail.gmail.com>
Subject: Re: [PATCH 05/10] media: ar0521: Add LINK_FREQ control
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
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

On Sun, 16 Oct 2022 at 02:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Fri, Oct 07, 2022 at 03:26:55PM +0100, Dave Stevenson wrote:
> > On Fri, 7 Oct 2022 at 15:01, Laurent Pinchart wrote:
> > > On Thu, Oct 06, 2022 at 04:10:10PM +0100, Dave Stevenson wrote:
> > > > On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi wrote:
> > > > >
> > > > > Add support for V4L2_CID_LINK_FREQ which currently reports a single
> > > > > hard-coded frequency which depends on the fixed pixel clock.
> > > > >
> > > > > This will change in the next patches where the pixel rate will be
> > > > > computed from the desired link_frequency.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > >
> > > > Looks valid based on the current pixel rate of 184MPix/s, 8bpp,
> > > > divided by 4 lanes, and DDR.
> > > >
> > > > > ---
> > > > >  drivers/media/i2c/ar0521.c | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > > > index 21649aecf442..c5410b091654 100644
> > > > > --- a/drivers/media/i2c/ar0521.c
> > > > > +++ b/drivers/media/i2c/ar0521.c
> > > > > @@ -90,6 +90,10 @@ static const char * const ar0521_supply_names[] = {
> > > > >         "vaa",          /* Analog (2.7V) supply */
> > > > >  };
> > > > >
> > > > > +static const s64 ar0521_link_frequencies[] = {
> > > > > +       184000000,
> > > > > +};
> > > > > +
> > > > >  struct ar0521_ctrls {
> > > > >         struct v4l2_ctrl_handler handler;
> > > > >         struct v4l2_ctrl *ana_gain;
> > > > > @@ -104,6 +108,7 @@ struct ar0521_ctrls {
> > > > >         };
> > > > >         struct v4l2_ctrl *pixrate;
> > > > >         struct v4l2_ctrl *exposure;
> > > > > +       struct v4l2_ctrl *link_freq;
> > > > >         struct v4l2_ctrl *test_pattern;
> > > > >  };
> > > > >
> > > > > @@ -655,6 +660,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> > > > >         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
> > > > >                                             65535, 1, 360);
> > > > >
> > > > > +       ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> > > > > +                                       ARRAY_SIZE(ar0521_link_frequencies) - 1,
> > > > > +                                       0, ar0521_link_frequencies);
> > > > > +
> > > >
> > > > Admittedly there is only one entry, but did you want to make it a read
> > > > only control? With no case for it in s_ctrl, you'll get errors thrown
> > > > from the control handler framework.
> > >
> > > I'd make it writable even if there's a single entry, so that userspace
> > > won't need special logic. It will also prepare for support of multiple
> > > entries in the future.
> >
> > Do you really see a situation where userspace will be configuring link
> > frequency instead of DT / ACPI?
> > A quick search seems to imply that only 1 current driver supports a
> > r/w link frequency - mt9v032. That would imply that having a
> > controllable link frequency would require the special logic in
> > userspace.
>
> Looking at the mainline kernel only, the N9, N950 and Librem5 all
> specify multiple link frequencies, and so does the sdm845-db845c
> development board.

Sorry, insufficient time to go through all of those in detail.

Looking at sdm845-db845c, yes the base DT lists multiple link
frequencies for OV8856 [1], however the OV8856 driver then makes the
LINK_FREQ control READ_ONLY[2].
So what is userspace meant to do with that information?

IMX290 also requires 2 link frequencies to be listed, but the control
is read only, and which is used is based on mode selection.
(Hmm, I've just noticed that the DT binding example doesn't match the
driver as it only lists one link-freq. OV8856 binding lists the
restriction of the driver in the binding).

N9 and N950 use "nokia,smia", which maps to CCS. Yes that driver does
allow configuration of link frequency from userspace, but it still
feels to me to be an odd control to allow userspace to control.

[1] https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/qcom/sdm845-db845c.dts#L1240
[2] https://elixir.bootlin.com/linux/latest/source/drivers/media/i2c/ov8856.c#L1949

> This indeed requires specific logic in userspace, and to be honest, I
> haven't really thought about how it would be implemented. Sakari has
> more experience than me here, he may be able to shed some light.
>
> > I'm always very cautious about drivers that are linking PIXEL_RATE and
> > LINK_FREQ - most of the sensors are tending to have 2 (or more) PLLs,
> > and there is a FIFO between the image sensor (PIXEL_RATE) and the MIPI
> > block (LINK_FREQ). imx290 is certainly wrong (pixel rate does not
> > change with mode, but link freq does), and I'm fairly certain that
> > ov7251 is as well (pixel rate is 48MPix/s whether at 240 or 319.2MHz
> > link frequency). Patches coming soon for both.
>
> That's a good point, different link frequencies may or may not result in
> different pixel rates.

See my response to Jacopo.

As you know I have a fair number of sensors around, and I see a fairly
large number of the mainline drivers getting this wrong. I don't know
whether that is down to copy/paste of drivers, or misunderstanding of
the requirements, but it fouls up frame rate control and exposure
calibration in almost every case.

  Dave

> > > >         ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
> > > > >                                         V4L2_CID_TEST_PATTERN,
> > > > >                                         ARRAY_SIZE(test_pattern_menu) - 1,
>
> --
> Regards,
>
> Laurent Pinchart
