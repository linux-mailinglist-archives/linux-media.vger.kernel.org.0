Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B27A5F79AF
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 16:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiJGO1P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 10:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJGO1O (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 10:27:14 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 338E01204F2
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 07:27:13 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id r17so11692596eja.7
        for <linux-media@vger.kernel.org>; Fri, 07 Oct 2022 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IpmYryjc9nMc9Om3VTeUL9pEBMN5PGsg8fqgQ0tY5sI=;
        b=bTkIcvcxs0j5UCOUyX8/YvmgGNnX3JctdSpUyGCy4rH2CaTpVU5RqhhzZ/ZenR72QY
         Pw3GjJjj57bdpZsKjJuIzDGEvjHplGyWzzSgVPRXK1Ox+ESm7E/eSpOuggiMBOuR4WHN
         BZ6uAqPVOtsATpFBwoETosqxUhxuLFvIDkpHFMKqjPCh6Xeblp9Pt4UkFyCbNwUmbtUg
         QTGov0IXy83/dwRjJiGBI4oqhVHuXxyq07Tbd+RPm2JCnu0Hxplp+HxjURo1NEDturYS
         44PGrxSmNisfl7ZhQ7ZivMhR+LwR+VAry8mqCIZ7kzEoScvGwDJ+7MykRNk7igC8j3Xs
         BR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpmYryjc9nMc9Om3VTeUL9pEBMN5PGsg8fqgQ0tY5sI=;
        b=dsdzwvoQyvAUOh0PifQT6HotnamRyWc1UUKSYQvB2mdg2db3emaTIcOq5Whxj4gDIe
         OmC0hy8IdqJjst4cS0i9DezTaF+/Lh+aKdjcgadahZ3bKUdeAjQwPrLQNes0w7px5mJM
         2B0jbe+cygf8RfDQjAVrzIUoj/pOUn5TTF/VTV5Vl2k3ueassIRVicdSi6wjN8V7I2gO
         hK382YrL+7aQ7tmErinwgYWUJpzRFARCI5vVsmeuOvc3rifRrkv/oVXkxDOovq4/1osv
         ff4nReJmRnBzNPy6OP9pGdwFjnCpyvkfLX7+9tdlHejL+Q/KGdGfYktRYR3NCsJtbNDe
         i3oA==
X-Gm-Message-State: ACrzQf17qyoY9i3rEwFCz0OvTJZDttB4qQUowDhLltRNNVgus58wgYlX
        rdGMTTn0VbbEWmzz9Ld6VPclE+9ShgMc5dm1ltvcaA==
X-Google-Smtp-Source: AMsMyM54k80oW9RLpshbGWbQHb+uqOZIvCFkQicATtVAEC+7TPv3FreFgsSDG9wUH4cpx2z5QqZEv5uZqsDdOm1g2BI=
X-Received: by 2002:a17:907:3e0b:b0:78d:4b7c:89bd with SMTP id
 hp11-20020a1709073e0b00b0078d4b7c89bdmr4119136ejc.742.1665152831720; Fri, 07
 Oct 2022 07:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221005190613.394277-1-jacopo@jmondi.org> <20221005190613.394277-6-jacopo@jmondi.org>
 <CAPY8ntB_JQHJQH7DChEyou-RSRTcEF-Uy=+3Ly06MUtg0TCZ6A@mail.gmail.com> <Y0AxI2RKxomjEb2t@pendragon.ideasonboard.com>
In-Reply-To: <Y0AxI2RKxomjEb2t@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 7 Oct 2022 15:26:55 +0100
Message-ID: <CAPY8ntCh4UFT5swHvwPj7xz8wPH3MJB-aJjEd9bCgXVubRyp5w@mail.gmail.com>
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

On Fri, 7 Oct 2022 at 15:01, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Oct 06, 2022 at 04:10:10PM +0100, Dave Stevenson wrote:
> > On Wed, 5 Oct 2022 at 20:07, Jacopo Mondi wrote:
> > >
> > > Add support for V4L2_CID_LINK_FREQ which currently reports a single
> > > hard-coded frequency which depends on the fixed pixel clock.
> > >
> > > This will change in the next patches where the pixel rate will be
> > > computed from the desired link_frequency.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >
> > Looks valid based on the current pixel rate of 184MPix/s, 8bpp,
> > divided by 4 lanes, and DDR.
> >
> > > ---
> > >  drivers/media/i2c/ar0521.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> > > index 21649aecf442..c5410b091654 100644
> > > --- a/drivers/media/i2c/ar0521.c
> > > +++ b/drivers/media/i2c/ar0521.c
> > > @@ -90,6 +90,10 @@ static const char * const ar0521_supply_names[] = {
> > >         "vaa",          /* Analog (2.7V) supply */
> > >  };
> > >
> > > +static const s64 ar0521_link_frequencies[] = {
> > > +       184000000,
> > > +};
> > > +
> > >  struct ar0521_ctrls {
> > >         struct v4l2_ctrl_handler handler;
> > >         struct v4l2_ctrl *ana_gain;
> > > @@ -104,6 +108,7 @@ struct ar0521_ctrls {
> > >         };
> > >         struct v4l2_ctrl *pixrate;
> > >         struct v4l2_ctrl *exposure;
> > > +       struct v4l2_ctrl *link_freq;
> > >         struct v4l2_ctrl *test_pattern;
> > >  };
> > >
> > > @@ -655,6 +660,10 @@ static int ar0521_init_controls(struct ar0521_dev *sensor)
> > >         ctrls->exposure = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_EXPOSURE, 0,
> > >                                             65535, 1, 360);
> > >
> > > +       ctrls->link_freq = v4l2_ctrl_new_int_menu(hdl, ops, V4L2_CID_LINK_FREQ,
> > > +                                       ARRAY_SIZE(ar0521_link_frequencies) - 1,
> > > +                                       0, ar0521_link_frequencies);
> > > +
> >
> > Admittedly there is only one entry, but did you want to make it a read
> > only control? With no case for it in s_ctrl, you'll get errors thrown
> > from the control handler framework.
>
> I'd make it writable even if there's a single entry, so that userspace
> won't need special logic. It will also prepare for support of multiple
> entries in the future.

Do you really see a situation where userspace will be configuring link
frequency instead of DT / ACPI?
A quick search seems to imply that only 1 current driver supports a
r/w link frequency - mt9v032. That would imply that having a
controllable link frequency would require the special logic in
userspace.

I'm always very cautious about drivers that are linking PIXEL_RATE and
LINK_FREQ - most of the sensors are tending to have 2 (or more) PLLs,
and there is a FIFO between the image sensor (PIXEL_RATE) and the MIPI
block (LINK_FREQ). imx290 is certainly wrong (pixel rate does not
change with mode, but link freq does), and I'm fairly certain that
ov7251 is as well (pixel rate is 48MPix/s whether at 240 or 319.2MHz
link frequency). Patches coming soon for both.

  Dave

> > >         ctrls->test_pattern = v4l2_ctrl_new_std_menu_items(hdl, ops,
> > >                                         V4L2_CID_TEST_PATTERN,
> > >                                         ARRAY_SIZE(test_pattern_menu) - 1,
>
> --
> Regards,
>
> Laurent Pinchart
