Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C280305F97
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 16:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343862AbhA0P2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 10:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343734AbhA0P0w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 10:26:52 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F95BC0613ED
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 07:26:12 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id q7so2299548wre.13
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 07:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TBPUuow4dvu8HbmvpztLv0FJKmUn25aEC/HvUkJ8M3g=;
        b=pRTCJzwDeUwAjm4p+x5l+zBhiXQ+gXgjvUR6ulJWsMDymP2mgRgodoj0a33rXSpXnu
         cwJJXMc23WmEPA9kIkziOCr+9wzdSLVd/WEQ94JMQK/zdAnha/sac+Cakn0hsRi/PIH4
         mwStUZ1YVNL8RQ3J0xYoutZaqyqeTHy/rnxXCgEU0papOcbC1d2j85bR6/YmfoW0YyvO
         l1Ot11PJ3QDCT1WGswB3a0+EnbYILdVeY1Rl3mThcfromUbt1dtJfNwciZqCGQAQtxkr
         FCW6YITNuXCzAEnxO3jucSeuZfYjyMH+Vj05BQJhMeC/Fdbi953h7GU8FtCdj6IFpbgc
         lP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TBPUuow4dvu8HbmvpztLv0FJKmUn25aEC/HvUkJ8M3g=;
        b=b567TMqujpeUiek5McgmSTAKsp/29PQ+RvrNIgVd9DcaI7BvmOFXgLP8iaymCBXqi5
         wCkw1vYCuRlf29wBGw1dNgZiwkBolQNbFdRchfQzGsXNcSHKpPT3M1p/Lxh9nF/zW2+t
         ay5Yu6ixSskyd4SBMsJ400X/nU4RoHco6ZX5mxEgv6OEEf1mpCwvx0UJ9OhABc04NYmz
         TRjXH6TD+/qyimrozzeySSY07PS4f1Z7oYSnvtDietnTWZIRbnvWaTcPwe/gp9PuX7YI
         ARUfrFbZjrKh2XOGvnzzjHlmBaFDfgWFxFqTHWb8m/SRqRnbfTbp9JAeoOJv9u5jJeW7
         S3JA==
X-Gm-Message-State: AOAM530LfldFqXsC9rh9SDh6xLOjvXoC6tfNhNijznDkvVxggWYfyqTc
        utQBuWacS3gdZWKzOD52SbVy+deibz22Xj9B0NfwVw7lCF01Ng==
X-Google-Smtp-Source: ABdhPJz4dxyW70ymvURwWi/PE6gWPJK/IirzcxrGwR8iBO/FT61Ln+3D19W4V02Nhv9VvsvXSuoXIwkpz81P2UQCeEQ=
X-Received: by 2002:a5d:4882:: with SMTP id g2mr11515029wrq.273.1611761170873;
 Wed, 27 Jan 2021 07:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20210126074934.26980-1-andrey.konovalov@linaro.org>
 <CAPY8ntBmVoe_dMKhd7imcQYRcdJLn4PG3rXzZvGBRVbeCjiL0A@mail.gmail.com> <4c72313b-1b4a-0c7a-a553-144b17763aaa@linaro.org>
In-Reply-To: <4c72313b-1b4a-0c7a-a553-144b17763aaa@linaro.org>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Wed, 27 Jan 2021 15:25:54 +0000
Message-ID: <CAPY8ntBsbaxaLHrHnoJNUgUBZ7Lg-HnNtdyaMB0qLeRZW=x2Pw@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx219: Implement V4L2_CID_LINK_FREQ control
To:     Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andrey

On Tue, 26 Jan 2021 at 15:55, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Dave,
>
> On 26.01.2021 16:01, Dave Stevenson wrote:
> > Hi Andrey
> >
> > On Tue, 26 Jan 2021 at 07:50, Andrey Konovalov
> > <andrey.konovalov@linaro.org> wrote:
> >>
> >> This control is needed for imx219 driver, as the link frequency
> >> is independent from the pixel rate in this case, and can't be
> >> calculated from the pixel rate.
> >>
> >> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> >> ---
> >>   drivers/media/i2c/imx219.c | 15 ++++++++++++++-
> >>   1 file changed, 14 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> >> index 92a8d52776b8..6e3382b85a90 100644
> >> --- a/drivers/media/i2c/imx219.c
> >> +++ b/drivers/media/i2c/imx219.c
> >> @@ -390,6 +390,10 @@ static const struct imx219_reg raw10_framefmt_regs[] = {
> >>          {0x0309, 0x0a},
> >>   };
> >>
> >> +static const s64 imx219_link_freq_menu[] = {
> >> +       IMX219_DEFAULT_LINK_FREQ,
> >
> > Link frequency is one of the parameters that is largely irrelevant on
> > the Pi, so I've partially ignored it.
>
> I faced a problem with the imx219 8-bit modes not working with the camss driver
> (drivers/media/platform/qcom/camss), as based on the link frequency calculated
> from the pixel rate the driver sets the csiphy clock to 100MHz which is too low
> for the actual link frequency (4 * 100MHz < 456MHz), and the captured image
> becomes garbage.
>
> > Is the link frequency really the same for all modes? Even 8 bit vs 10
> > bit readout?
>
> Yes, this is exactly the case.
>
> > The pixel rate is constant at 182.4Mpix/s for all modes.
>
> Right.
>
> > Switching to 8 bit changes register 0x0309 (op_pix_clk_div) from 10 to 8.
> > Figure 43 "Clock System Block Diagram" in the datasheet I have says
> > this reduces the divider to the FIFO between the pipeline and MIPI. As
> > we haven't changed PLL2 or Pre-div2 I'd expect the link frequency to
> > stay the same,
>
> That's true.
>
> > but that leaves me confused over that FIFO clock as
> > it'll go UP in frequency. I can't quite see how that works, but it
> > clearly does.
>
> Yes, the FIFO makes it possible for the different write and read rates to work.
> There are few words regarding this in the datasheet, but this isn't enough
> to fully understand how it works:
> "If, Pix Rate of PLL1 domain < Data Rate of PLL2 domain, data is always
> correctly output from the sensor" (page 81)
>
> If I read the datasheet right, for 10-bit modes the both rates are the same
> (91.2 MHz). In the 8-bit modes the "Data Rate" increases to 114 MHz while
> the "Pix Rate" remains at 91.2 MHz.

There looks to be some magic in there. Without knowing the details of
the size of the FIFO and when it triggers the output stage to start
sending data, it's hard to say exactly what is going on.
I'm guessing that it has to be large enough to take a whole line, and
triggers when the line is complete. The CSI2 bus can then run at the
frequency defined, independent of pixel rate or bit depth.

> > Both 8 and 10 bit modes do read out at the same frame / pixel rate,
> > therefore that bit is correct, but that leaves me puzzling over link
> > frequency. I have no information on how big that FIFO is, or how it's
> > clocked on input and output.
> >
> > Simplest option is that as I need to go into the office in the next
> > day or so I'll pop into the lab and measure it in each mode.
>
> That would be nice!
> In my home "office" I only have a small piece of hardware which claims
> to be able to deal with 2 signals up to 72MHz each, which is not enough
> for such kind of measurements.

My home "office" is likewise compromised, but the work office is still
available and has suitable equipment :-)

I can't be that precise as I'm not bothering to get differential
probes out and the like, but it does appear that the clock lane is
running at the same speed for both 8 and 10 bit.
I measured (cursors off the scope, measured over 4 cycles) 2.21ns for
8 bit, and 2.18ns for 10 bit, corresponding to 452 and 458MHz
respectively. Those are well within the experimental error of my setup
to be the 456MHz defined in the driver.

Based on that I'm happy.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> > Otherwise I have no issues with the implementation of the patch.
> >
> >    Dave
>
> Thanks,
> Andrey
>
> >> +};
> >> +
> >>   static const char * const imx219_test_pattern_menu[] = {
> >>          "Disabled",
> >>          "Color Bars",
> >> @@ -547,6 +551,7 @@ struct imx219 {
> >>          struct v4l2_ctrl_handler ctrl_handler;
> >>          /* V4L2 Controls */
> >>          struct v4l2_ctrl *pixel_rate;
> >> +       struct v4l2_ctrl *link_freq;
> >>          struct v4l2_ctrl *exposure;
> >>          struct v4l2_ctrl *vflip;
> >>          struct v4l2_ctrl *hflip;
> >> @@ -1269,7 +1274,7 @@ static int imx219_init_controls(struct imx219 *imx219)
> >>          int i, ret;
> >>
> >>          ctrl_hdlr = &imx219->ctrl_handler;
> >> -       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
> >> +       ret = v4l2_ctrl_handler_init(ctrl_hdlr, 12);
> >>          if (ret)
> >>                  return ret;
> >>
> >> @@ -1283,6 +1288,14 @@ static int imx219_init_controls(struct imx219 *imx219)
> >>                                                 IMX219_PIXEL_RATE, 1,
> >>                                                 IMX219_PIXEL_RATE);
> >>
> >> +       imx219->link_freq =
> >> +               v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx219_ctrl_ops,
> >> +                                      V4L2_CID_LINK_FREQ,
> >> +                                      ARRAY_SIZE(imx219_link_freq_menu) - 1, 0,
> >> +                                      imx219_link_freq_menu);
> >> +       if (imx219->link_freq)
> >> +               imx219->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> >> +
> >>          /* Initial vblank/hblank/exposure parameters based on current mode */
> >>          imx219->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
> >>                                             V4L2_CID_VBLANK, IMX219_VBLANK_MIN,
> >> --
> >> 2.17.1
> >>
