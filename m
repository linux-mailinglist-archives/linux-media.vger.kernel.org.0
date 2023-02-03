Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A749689328
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 10:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjBCJJv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 04:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbjBCJJo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 04:09:44 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304561C32C
        for <linux-media@vger.kernel.org>; Fri,  3 Feb 2023 01:09:43 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id g12so853486uae.6
        for <linux-media@vger.kernel.org>; Fri, 03 Feb 2023 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1v/dEYQzJsE3ifu00Vlzb2h1KtsGX9drZR1o2Dv1A80=;
        b=lXIEZvBw5pcPR4hoaK0j615o2BMKRZkh40+0s+iGk8L1EFBC0Rfl+giiHxctpGx9Ne
         Npj1sChxNVaRtxvp09AApXG/KKfawZpEkA8uvSQPwXBOysiNyzRKeyG+3oowgcdyRGPu
         OUjwKYRivnkEtQf/4Nu6QDisfG1jmMnEeM9Yl5qLXE+OxZNzhnPsYgp3wYJRWszflVFD
         85Ov07BkkVX/owrCjVuWPynVghlOqWCsCYAG+kLZhuDw310D0lPrsNyOBzi0t6809MOi
         KhDX3LvgGjKuD1Ch57+OdCZ5bDIItFMaAY2N+ICD90sKw6pYMAWEKl5tP7psz8zbD1wR
         vIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1v/dEYQzJsE3ifu00Vlzb2h1KtsGX9drZR1o2Dv1A80=;
        b=aRCCbfP5lE2JelqofWag+Gd/SMYRhd2qtzfNO5hfQ2aoHBNmRtbqkMPjB0FptWaFjz
         jPKZvICOw04fejtIoHo/3994g4RJ31vyotJSUtf2q/KW8CdYV2pG0Yd7OUH0gy/mrD8X
         4K6utOnFntAvUPF2aQFESW/odlJ46WGXO15WTKzKP5Rl6jPcPA9plCleKi9AO8N979Cm
         KXKRC7VHGUm1sFCKdoLq3gFre4JoKb5EHZJg/IJyBXaLklesn7GXwtbehHe1vU9Le50v
         xok9RBmMVGzE9qhiBGa31WVbEuNdROfVYwEXJgdiUN44myqxheFrkoD4LetrathW1700
         7cSw==
X-Gm-Message-State: AO0yUKUR6pk/qRJOS964E7oJdUPukMZSo0knSRSrfYzgMuF5OL9KCGuI
        soGzDamhQOULY5cXGvOI0N6vRwoKtI9mS5xY8wcP/g==
X-Google-Smtp-Source: AK7set/BQ6xN2Ed0ihdwGgR1bBD7wIwmZ3GtdcqLBXaJuwCWm/TeOG4kTbT6CWL4YilRx3Qi4vTcM4IAzUD/GE2fN8c=
X-Received: by 2002:ab0:49e9:0:b0:662:b4d9:ff5f with SMTP id
 f38-20020ab049e9000000b00662b4d9ff5fmr1527201uad.46.1675415382255; Fri, 03
 Feb 2023 01:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com>
 <20230131192016.3476937-7-dave.stevenson@raspberrypi.com> <2743472.BEx9A2HvPv@steina-w>
In-Reply-To: <2743472.BEx9A2HvPv@steina-w>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Fri, 3 Feb 2023 09:09:24 +0000
Message-ID: <CAPY8ntDD04+7AnwZO_-7=+HoXPAyKAE6frsa01vgRT0t-VOPuA@mail.gmail.com>
Subject: Re: [PATCH 06/11] media: i2c: imx290: Use CSI timings as per datasheet
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander

On Fri, 3 Feb 2023 at 08:04, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Dave,
>
> thanks for the patch.
>
> Am Dienstag, 31. Januar 2023, 20:20:11 CET schrieb Dave Stevenson:
> > Commit "98e0500eadb7 media: i2c: imx290: Add configurable link frequency
> > and pixel rate" added support for the increased link frequencies
> > on 2 data lanes, but didn't update the CSI timing registers in
> > accordance with the datasheet.
> >
> > Use the specified settings.
> >
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  drivers/media/i2c/imx290.c | 126 +++++++++++++++++++++++++++++++------
> >  1 file changed, 106 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index 6bcfa535872f..9ddd6382b127 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -174,6 +174,18 @@ struct imx290_mode {
> >       u32 data_size;
> >  };
> >
> > +struct imx290_csi_cfg {
> > +     u16 repitition;
> > +     u16 tclkpost;
> > +     u16 thszero;
> > +     u16 thsprepare;
> > +     u16 tclktrail;
> > +     u16 thstrail;
> > +     u16 tclkzero;
> > +     u16 tclkprepare;
> > +     u16 tlpx;
> > +};
> > +
> >  struct imx290 {
> >       struct device *dev;
> >       struct clk *xclk;
> > @@ -273,16 +285,6 @@ static const struct imx290_regval
> > imx290_1080p_settings[] = { { IMX290_INCKSEL4, 0x01 },
> >       { IMX290_INCKSEL5, 0x1a },
> >       { IMX290_INCKSEL6, 0x1a },
> > -     /* data rate settings */
> > -     { IMX290_REPETITION, 0x10 },
> > -     { IMX290_TCLKPOST, 87 },
> > -     { IMX290_THSZERO, 55 },
> > -     { IMX290_THSPREPARE, 31 },
> > -     { IMX290_TCLKTRAIL, 31 },
> > -     { IMX290_THSTRAIL, 31 },
> > -     { IMX290_TCLKZERO, 119 },
> > -     { IMX290_TCLKPREPARE, 31 },
> > -     { IMX290_TLPX, 23 },
> >  };
> >
> >  static const struct imx290_regval imx290_720p_settings[] = {
> > @@ -298,16 +300,6 @@ static const struct imx290_regval
> > imx290_720p_settings[] = { { IMX290_INCKSEL4, 0x01 },
> >       { IMX290_INCKSEL5, 0x1a },
> >       { IMX290_INCKSEL6, 0x1a },
> > -     /* data rate settings */
> > -     { IMX290_REPETITION, 0x10 },
> > -     { IMX290_TCLKPOST, 79 },
> > -     { IMX290_THSZERO, 47 },
> > -     { IMX290_THSPREPARE, 23 },
> > -     { IMX290_TCLKTRAIL, 23 },
> > -     { IMX290_THSTRAIL, 23 },
> > -     { IMX290_TCLKZERO, 87 },
> > -     { IMX290_TCLKPREPARE, 23 },
> > -     { IMX290_TLPX, 23 },
> >  };
> >
> >  static const struct imx290_regval imx290_10bit_settings[] = {
> > @@ -328,6 +320,58 @@ static const struct imx290_regval
> > imx290_12bit_settings[] = { { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
> >  };
> >
> > +static const struct imx290_csi_cfg imx290_csi_222_75mhz = {
> > +     /* 222.25MHz or 445.5Mbit/s per lane */
>
> 222.75MHz.

Ack s/222.25/222.75. Silly typo.

> This is also 891 MBit/s per lane, no? This link frequency is used
> for 4 lane setup only.

CSI2 is Double Data Rate (DDR), so 2 bits per clock cycle. If the
clock is 222.75MHz, that makes 445.5Mbit/s/lane.

We only use 222.75MHz (1080p) and 148.5MHz (720p) link frequencies on
4 lanes, and 445.5MHz (1080p) and 297MHz (720p) on 2 lanes. That
allows a max of 60fps in either configuration.

Whilst the datasheet says you can drop the link frequencies if you're
running at 30fps, there is no need to, so the driver doesn't.
Looking at it I don't believe there is an actual requirement to drop
the link frequency for 720p either. What's the difference in pixel
readout between their 720p mode and a windowed mode that configures
the same offset and size? There should be none, but from the datasheet
they would use different link frequencies / data rates.

> > +     .repitition = 0x10,
> > +     .tclkpost = 87,
> > +     .thszero = 55,
> > +     .thsprepare = 31,
> > +     .tclktrail = 31,
> > +     .thstrail = 31,
> > +     .tclkzero = 119,
> > +     .tclkprepare = 31,
> > +     .tlpx = 23,
> > +};
> > +
> > +static const struct imx290_csi_cfg imx290_csi_445_5mhz = {
> > +     /* 445.5MHz or 891Mbit/s per lane */
> > +     .repitition = 0x00,
> > +     .tclkpost = 119,
> > +     .thszero = 103,
> > +     .thsprepare = 71,
> > +     .tclktrail = 55,
> > +     .thstrail = 63,
> > +     .tclkzero = 255,
> > +     .tclkprepare = 63,
> > +     .tlpx = 55,
> > +};
> > +
> > +static const struct imx290_csi_cfg imx290_csi_148_5mhz = {
> > +     /* 148.5MHz or 297Mbit/s per lane */
>
> 594 MBit/s per lane, no? This link freq is only used for 4 lanes

As above.

> > +     .repitition = 0x10,
>
> Ah, this is so confusing. This structure is used depending on the link_freq,
> but this value is defined on the data rate (for both 2 & 4 lanes separately).

link_freq = data rate / 2
(Note that this is the data rate on the CSI-2 bus, not pixel rate)

Data rate in the datasheet mode tables is quoted as units of Mbps/lane
Looking at the table for all-pixel mode:
2 lane 30/25fps, data rate 445.5Mbps/lane, repetition 1
2 lane 60/50fps, data rate 891Mbps/lane, repetition 0
4 lane 30/25fps, data rate 222.75Mbps/lane, repetition 2
4 lane 60/50fps, data rate 445.5Mbps/lane, repetition 1
4 lane 120/100fps, data rate 891Mbps/lane, repetition 0

Repetition and all the other CSI2 timing parameters are based solely
on data rate and therefore link frequency. Number of lanes doesn't
change them.

  Dave

> Best regards,
> Alexander
>
> > +     .tclkpost = 79,
> > +     .thszero = 47,
> > +     .thsprepare = 23,
> > +     .tclktrail = 23,
> > +     .thstrail = 23,
> > +     .tclkzero = 87,
> > +     .tclkprepare = 23,
> > +     .tlpx = 23,
> > +};
> > +
> > +static const struct imx290_csi_cfg imx290_csi_297mhz = {
> > +     /* 297MHz or 594Mbit/s per lane */
> > +     .repitition = 0x00,
> > +     .tclkpost = 103,
> > +     .thszero = 87,
> > +     .thsprepare = 47,
> > +     .tclktrail = 39,
> > +     .thstrail = 47,
> > +     .tclkzero = 191,
> > +     .tclkprepare = 47,
> > +     .tlpx = 39,
> > +};
> > +
> >  /* supported link frequencies */
> >  #define FREQ_INDEX_1080P     0
> >  #define FREQ_INDEX_720P              1
> > @@ -536,6 +580,42 @@ static int imx290_set_black_level(struct imx290
> > *imx290, black_level >> (16 - bpp), err);
> >  }
> >
> > +static int imx290_set_csi_config(struct imx290 *imx290)
> > +{
> > +     const s64 *link_freqs = imx290_link_freqs_ptr(imx290);
> > +     const struct imx290_csi_cfg *csi_cfg;
> > +     int ret = 0;
> > +
> > +     switch (link_freqs[imx290->current_mode->link_freq_index]) {
> > +     case 445500000:
> > +             csi_cfg = &imx290_csi_445_5mhz;
> > +             break;
> > +     case 297000000:
> > +             csi_cfg = &imx290_csi_297mhz;
> > +             break;
> > +     case 222750000:
> > +             csi_cfg = &imx290_csi_222_75mhz;
> > +             break;
> > +     case 148500000:
> > +             csi_cfg = &imx290_csi_148_5mhz;
> > +             break;
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     imx290_write(imx290, IMX290_REPETITION, csi_cfg->repitition, &ret);
> > +     imx290_write(imx290, IMX290_TCLKPOST, csi_cfg->tclkpost, &ret);
> > +     imx290_write(imx290, IMX290_THSZERO, csi_cfg->thszero, &ret);
> > +     imx290_write(imx290, IMX290_THSPREPARE, csi_cfg->thsprepare, &ret);
> > +     imx290_write(imx290, IMX290_TCLKTRAIL, csi_cfg->tclktrail, &ret);
> > +     imx290_write(imx290, IMX290_THSTRAIL, csi_cfg->thstrail, &ret);
> > +     imx290_write(imx290, IMX290_TCLKZERO, csi_cfg->tclkzero, &ret);
> > +     imx290_write(imx290, IMX290_TCLKPREPARE, csi_cfg->tclkprepare,
> &ret);
> > +     imx290_write(imx290, IMX290_TLPX, csi_cfg->tlpx, &ret);
> > +
> > +     return ret;
> > +}
> > +
> >  static int imx290_setup_format(struct imx290 *imx290,
> >                              const struct v4l2_mbus_framefmt *format)
> >  {
> > @@ -748,6 +828,12 @@ static int imx290_start_streaming(struct imx290
> > *imx290, return ret;
> >       }
> >
> > +     ret = imx290_set_csi_config(imx290);
> > +     if (ret < 0) {
> > +             dev_err(imx290->dev, "Could not set csi cfg\n");
> > +             return ret;
> > +     }
> > +
> >       /* Apply the register values related to current frame format */
> >       format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> >       ret = imx290_setup_format(imx290, format);
>
>
>
>
