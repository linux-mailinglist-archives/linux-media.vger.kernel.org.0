Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9921A637EC3
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 19:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbiKXSDP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 13:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiKXSDN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 13:03:13 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D57716FF
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 10:03:11 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id p141so1635760iod.6
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 10:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mjuRiPX7EHTo5vSfyT35utZHsBrQyctoZatQb3kpAbg=;
        b=eEnTaLBMv9JwbzOpxmj2aH4aBTyQJG2kRPbDjCLEBQVws4kynw/hkQ1+C7mTkhyjWs
         bPinj1TngQTQByeMsljQMksdO1oFwwMn1LRBZcXJlsEoJbo77yAKtAdb+5vZb+cKtNiL
         psyEmzlUJBbm6av0GggolSXFViq7ds8HiZnY0pPYbRYsYnhUY1THqeDtCMLxoWa3/Wcq
         ZVb/zQihje+FeHFzXkwxt0ELIQm3WNsNkL4eIjZn1ul687h5Iy6WS2kR906bOiya0QBF
         vCi9AL1ZeHHJztx/Q8InUEU1ky/9RunVqduau1fauMvdvsDnNmXZzylCs6aW/gheaPX3
         sY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjuRiPX7EHTo5vSfyT35utZHsBrQyctoZatQb3kpAbg=;
        b=xzdRZATFrvFvUgCjk7669yPw9EBmLUov9h1PK3OeXzSZSau7Aq2ubdPj2HWhNVcuHy
         Cn6rYsxFj+oSzJwqSVNuLErRoQHoXuho4VH+4TW4LMMdSerk0bHoV4R4FK85CArVx9u+
         t2AB1gbmcSjeboA0gOyLLh7Zz/5XYkPjsZ7taWedMby5FBNZXtG/tVB1ocQI3IXEqEyb
         G0oXYql7Gukd/30Bxy5qD3LpL5ulO2W1mN2J/u0THZdqdMPB34abePI0VAz7bqNUn+2A
         unaGNtaiiuFIIhcySIRBMjjYv8fK3Lwzu5qmJtRErtBmuG3MiaJZz5hYL+gzR8Bb/CcW
         JUGA==
X-Gm-Message-State: ANoB5pmGk38BNsWIHylhw7SVbKu2wBdyCm7fDcqImaTZGcytM6GFNjxC
        q9o/QBUaMF1uJLLyHx+8KmhgtGnd5AL4XlzrgqvVRuvCMDc=
X-Google-Smtp-Source: AA0mqf41LVQz7bFI12cFLvEvgpbzMJOWeEUNrH3XpJVQxJup0POXGeBAa6DQdeORw2hmdT/89sAdHHK1hs5dFqN/yN8=
X-Received: by 2002:a05:6602:2814:b0:6de:ca95:45d8 with SMTP id
 d20-20020a056602281400b006deca9545d8mr9895054ioe.26.1669312991048; Thu, 24
 Nov 2022 10:03:11 -0800 (PST)
MIME-Version: 1.0
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
 <20221122223250.21233-15-laurent.pinchart@ideasonboard.com>
 <CAPY8ntD+82HitFj7G9QTbwx4dNFf59adqhn6q2-mKAdTwc-iQA@mail.gmail.com> <Y34uIE+bjlnIXGD9@pendragon.ideasonboard.com>
In-Reply-To: <Y34uIE+bjlnIXGD9@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Thu, 24 Nov 2022 18:02:54 +0000
Message-ID: <CAPY8ntB_5wQADBd2q2kO6Vstnu_1P=mQEkAFjQ9ee0PJ=eJrXQ@mail.gmail.com>
Subject: Re: [PATCH v1 14/15] media: i2c: imx290: Configure data lanes at
 start time
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
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

On Wed, 23 Nov 2022 at 14:29, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Wed, Nov 23, 2022 at 10:16:58AM +0000, Dave Stevenson wrote:
> > On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart wrote:
> > >
> > > There's no need to configure the data lanes in the runtime PM resume
> > > handler. Do so in imx290_start_streaming() instead.
> >
> > Interesting as I had Sakari advocating putting clock mode selection
> > register control in "power on" for my recent ov9282 series. Is there
> > any consistency?
>
> No there isn't :-) There hasn't been any official rule so far, so it's
> no surprise different drivers exhibit different behaviours. I'm all for
> standardization when possible though.

Likewise! Standardisation is a good thing!

Sorry my comment was slightly tongue-in-cheek due to having had such a
similar thread with Sakari so recently. When a long-standing member of
the community then comes along with a similar patch it just reinforced
that, in the absence of any documented guidelines, it is all very much
ad-hoc.
It then frustrates me that these sorts of issues are then raised at
review, which either results in having to justify the choice, or
respinning patches often with time constraints if trying to hit a
merge window.

> Overall, I think there's a general agreement that the runtime PM resume
> handler needs to control everything required to make the sensor
> accessible by software. That covers at least hard reset, regulators and
> clocks.
>
> For software settings, it's less clear. If the sensor requires a
> software reset sequence immediately after power on, it makes sense to
> also handle that in the runtime PM resume handler. Same thing for any
> other initialization required to reach a quiescent state (for instance
> there are many sensors that start streaming automatically right after
> power on for a reason I can't understand, so that needs to be disabled).
>
> This means that the runtime PM handler will thus access the sensor over
> I2C. We may not want to do so in probe() before having a chance to probe
> it (by reading an ID register for instance). The power on sequence could
> be split in two to handle this, with one function that powers the sensor
> up, and the other one that handles software initialization. Both would
> be called from the runtime PM resume handler, and in probe(), we could
> first power on the sensor, identify it, and then initialize it. I think
> that will be fine on DT platforms as we don't need to RPM-resume the I2C
> device in probe before accessing it as far as I can tell, given that the
> probe() function should be called with the I2C controller RPM-resumed.
> I'll let Sakari confirms if this works for ACPI).

For ov9282 I'd also raised the issue that a fair number of sensor
drivers include a software reset in their lists of registers, which
will undo any settings done in resume.

As above, it was more of an observation than issue with this patch.
Alexander has already given an R-b, so there's limited point adding mine.

I'll try and test the series out tomorrow, and I will get around to
submitting my series on top.

Cheers.
  Dave

> For other settings, I wouldn't handle them in the runtime PM resume
> handler. In this particular case, the number of data lanes could even
> vary based on the sensor mode (we don't do so at the moment), so
> .s_stream() time seems better to me.
>
> > https://patchwork.linuxtv.org/project/linux-media/patch/20221005152809.3785786-9-dave.stevenson@raspberrypi.com/#141118
> >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index dbed703fa199..4dfa090f918d 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -753,6 +753,9 @@ static int imx290_start_streaming(struct imx290 *imx290,
> > >                 return ret;
> > >         }
> > >
> > > +       /* Set data lane count */
> > > +       imx290_set_data_lanes(imx290);
> > > +
> > >         /* Apply the register values related to current frame format */
> > >         format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> > >         ret = imx290_setup_format(imx290, format);
> > > @@ -1052,9 +1055,6 @@ static int imx290_power_on(struct device *dev)
> > >         gpiod_set_value_cansleep(imx290->rst_gpio, 0);
> > >         usleep_range(30000, 31000);
> > >
> > > -       /* Set data lane count */
> > > -       imx290_set_data_lanes(imx290);
> > > -
> > >         return 0;
> > >  }
> > >
>
> --
> Regards,
>
> Laurent Pinchart
