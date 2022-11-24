Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA42B637E20
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 18:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiKXRQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 12:16:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiKXRQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 12:16:30 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CDE4A9D0
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 09:16:28 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so5636176pjh.2
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 09:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mbyptObyGZSzblCpH5Hw8aI7CNnnwjKJnIc8Z8wS8pg=;
        b=V1d6zHrf3nWCfV2GtyqM6xVP7Y7HOonEaIyKBsEf+OWXs+13wa0akypIMJRs7vRR5X
         X417yx8dzhufEKe6HXLmsV3LkFlZnK/qeqZqCY6ZPd0LcnmGHJkM5MFR0kDt20oNDH0q
         GFe2Zip/OyCWbtKvFQGRh3wErwYxtCXURrAbHpmrfQfWYytxqAwdCtqMQS4zVSLfNQv4
         oxEwWK8ZBu94lTYHGblD/Zi4zbZGnGVPvNHiKadUmQfm8Ihou8oorZJg3Mkf45yRGhmm
         JWA91MAgtpAV7a8lekIY/7fFjbdlaKwl2Mqyf1rqO86KTY/5jgUtac9P425IDRjR1T34
         vXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbyptObyGZSzblCpH5Hw8aI7CNnnwjKJnIc8Z8wS8pg=;
        b=zLedl8UWKexrtJi5rtDNsy0MW4e+3i+aJURsz5CIWmZ485B8oFtbN6QP3O/7AI6Q9o
         JNTD+NLw1Ou4cFRszJ/v3ekYxBuo/LUAfvUCrM36a5HJgTX07kU43m4QJbMJqIEPggOc
         02zr5IF4fK4yVULWgz/+lvkFnVNV1/0wRABCprJoEfOrys/xcE4PzCUTo3ZYmWGdjRrG
         3sR/LTR/eTNvLf5lFGnfAHfz79cl0h8D/5cvo9KKnUaTCzoHtIh6ylOC5PE3eLnNVkUs
         5sGbzJpH14O/kyQbG7NecB1AwFMWGPMYsHOaVCGb7aXC3PbkHVmWUiDkgN058Szfv19c
         KtDw==
X-Gm-Message-State: ANoB5pn7vqUC9wGtffDBAJixDDTKWXs4b1yrJkLit1iM4NZZWfGWcwZ2
        MBAy5kkPTOkBceATZjyvcg295Ktu6UeCoxHBUIKXdQ==
X-Google-Smtp-Source: AA0mqf4HlRY3C2Hp65t4077hJ7wMySMxgMcS4bLkJlMeCZaC6q/HjZocpHxE21/Wx2KQDhpyK38t1Z3LKwN0Bytlw9A=
X-Received: by 2002:a17:902:d4c8:b0:186:9d71:228c with SMTP id
 o8-20020a170902d4c800b001869d71228cmr15667658plg.109.1669310188353; Thu, 24
 Nov 2022 09:16:28 -0800 (PST)
MIME-Version: 1.0
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
 <20221122223250.21233-8-laurent.pinchart@ideasonboard.com>
 <CAPY8ntAqXK3efWB+J_KG==1yuewmon1abea8enk0CL8p9pkS9A@mail.gmail.com>
 <Y339O5TYeO2jVRYP@pendragon.ideasonboard.com> <CAPY8ntBcH0fvTP82uwtpS9V4Pejv5co6qf07vnHBsfLWBX_iuA@mail.gmail.com>
 <Y3+ij+yI+yUwtTVj@pendragon.ideasonboard.com>
In-Reply-To: <Y3+ij+yI+yUwtTVj@pendragon.ideasonboard.com>
From:   David Plowman <david.plowman@raspberrypi.com>
Date:   Thu, 24 Nov 2022 17:16:17 +0000
Message-ID: <CAHW6GY+vZaqmRpAJZUZOcNKyOtR4ciG5W8jSHvXkMjiqyi5hMw@mail.gmail.com>
Subject: Re: [PATCH v1 07/15] media: i2c: imx290: Factor out black level
 setting to a function
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
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

Hi

On Thu, 24 Nov 2022 at 16:58, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dave,
>
> On Thu, Nov 24, 2022 at 03:10:02PM +0000, Dave Stevenson wrote:
> > On Wed, 23 Nov 2022 at 11:00, Laurent Pinchart wrote:
> > > On Wed, Nov 23, 2022 at 10:08:19AM +0000, Dave Stevenson wrote:
> > > > On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart wrote:
> > > > >
> > > > > The black level programmed in the BLKLEVEL register depends on the
> > > > > output format. The black level value computation is currently performed
> > > > > in imx290_set_ctrl(), in addition to having different black level values
> > > > > in the output-specific register value tables. Move it to a separate
> > > > > function to simplify the imx290_set_ctrl() code.
> > > >
> > > > Does this actually help?
> > > > The sensor only supports 10 and 12 bpp readout, so making it generic
> > > > for any bpp is rather redundant.
> > > > If you are looking at having different on-sensor black level values
> > > > kicking around, then tuning data goes out the window.
> > >
> > > This may be needed for some use cases, but that's not what I'm after
> > > here. By the way, could you explain why we can't just set it to 0 in the
> > > sensor and avoid subtracting it in the ISP (at least for the data
> > > pedestal value that is added on purpose in the sensor, there can also be
> > > an additional black level due to other reasons) ? I'm sure there's a
> > > reason :-)
> >
> > A quick play does imply that it works with 0 being defined in both
> > places, but personally I'd prefer following the manufacturer's
> > guidance on this sort of setting. David P may have some bright ideas
> > as to why a pedestal is desired.
> >
> > There is a little bit of me thinking that if it were 0, then the mono
> > variant of the sensor with a lens exhibiting minimal vignetting could
> > be used directly for 10 or 12bit data under controlled lighting.
> > However that is a very specific and unusual use case, so not worth
> > potentially compromising IQ for normal use cases.
>
> One reason I can think of is to get the dark areas away from
> non-linearities in the analogue path, but I lack visibility (no pun
> intended) on the real issues this could cause. Some insight from David
> would indeed be very appreciated.

Not sure I can add very much! If you don't have a black level it's
certainly true that your "zero" pixels will have a very odd
distribution because the noise can't take them negative. Perhaps
there's a 50% chance of getting zero, and a 50% chance of positive
noise? So that would be like a 50% chance of zero, and 50% of coming
from a "half Normal" distribution? Which would give an expected value
of something like 0.4 * standard deviation. Or something like that!

David

>
> > > > OK we do appear to have duplication between imx290_[10|12]bit_settings
> > > > and imx290_set_ctrl, but I don't get the need to compute it.
> > >
> > > The idea was to centralize black level setting in a single place, to
> > > prepare for the removal of he imx290->bpp field. It's really in
> > > imx290_set_ctrl() that it matters, I could keep the value in the
> > > imx290_10bit_settings and imx290_12bit_settings arrays, but I thought I
> > > could as well do it the same way everywhere.
> >
> > I'd missed that it was reprogramming the black level for the test patterns.
> >
> > Changing the black level when choosing a test pattern seems a very odd
> > thing to do. You're wanting to test the pipeline as configured for the
> > sensor, but you're artificially changing the incoming data and
> > therefore any processing steps are misconfigured.
>
> Now that you mention it, it's indeed very clear that there's a problem
> there. We shouldn't have to change ISP parameters when switching to a
> test pattern (some things may need to change in the algorithms though,
> AGC and AWB won't necessarily work nicely).
>
> > Looking at the data it's weird. Viewing the data as
> > V4L2_PIX_FMT_SRGGB12 Pattern 4 as is gives a 12 pixel pattern of
> > (bytes reversed):
> > 0105 0105 c204 c204 3e01 3e01 0000 0000 0000 0000 0000 0105
> > repeated multiple times along each line, and then that line repeated
> > vertically. So we definitely have pixels below the black level.
> > Alter the black level back to the default 0xf0 and you get:
> > f105 f105 b205 b205 2e02 2e02 0000 0000 9c00 9c00 0000 f105
> > So it's added the offset of 0xf0 to the non-zero pixels, but only some
> > of the zero ones and then not by the configured amount.
>
> What the... :-S
>
> > My datasheets have no reference to a PGCTRL register or 0x308c, so I
> > can't say if Sony has provided any guidance on needing to change black level.
> > Perhaps Manivannan has some further information on this as he added
> > the test pattern support.
>
> I thought I saw documentation about that, but it was for the IMX296, not
> the IMX290.
>
> > As it stands the code retains the existing (weird) behaviour, and
> > drops the duplication, so I'll add:
> >
> > Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Thanks. We can fix the test pattern on top.
>
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > >  drivers/media/i2c/imx290.c | 53 +++++++++++++++++++++-----------------
> > > > >  1 file changed, 29 insertions(+), 24 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > > index 135ed55592a1..d9fc6c44b0f0 100644
> > > > > --- a/drivers/media/i2c/imx290.c
> > > > > +++ b/drivers/media/i2c/imx290.c
> > > > > @@ -152,6 +152,9 @@
> > > > >  #define IMX290_PIXEL_ARRAY_RECORDING_WIDTH             1920
> > > > >  #define IMX290_PIXEL_ARRAY_RECORDING_HEIGHT            1080
> > > > >
> > > > > +/* Equivalent value for 16bpp */
> > > > > +#define IMX290_BLACK_LEVEL_DEFAULT                     3840
> > > > > +
> > > > >  #define IMX290_NUM_SUPPLIES                            3
> > > > >
> > > > >  struct imx290_regval {
> > > > > @@ -315,7 +318,6 @@ static const struct imx290_regval imx290_10bit_settings[] = {
> > > > >         { IMX290_ADBIT2, IMX290_ADBIT2_10BIT },
> > > > >         { IMX290_ADBIT3, IMX290_ADBIT3_10BIT },
> > > > >         { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW10 },
> > > > > -       { IMX290_BLKLEVEL, 60 },
> > > > >  };
> > > > >
> > > > >  static const struct imx290_regval imx290_12bit_settings[] = {
> > > > > @@ -325,7 +327,6 @@ static const struct imx290_regval imx290_12bit_settings[] = {
> > > > >         { IMX290_ADBIT2, IMX290_ADBIT2_12BIT },
> > > > >         { IMX290_ADBIT3, IMX290_ADBIT3_12BIT },
> > > > >         { IMX290_CSI_DT_FMT, IMX290_CSI_DT_FMT_RAW12 },
> > > > > -       { IMX290_BLKLEVEL, 240 },
> > > > >  };
> > > > >
> > > > >  /* supported link frequencies */
> > > > > @@ -516,35 +517,43 @@ static int imx290_set_data_lanes(struct imx290 *imx290)
> > > > >         return ret;
> > > > >  }
> > > > >
> > > > > +static int imx290_set_black_level(struct imx290 *imx290,
> > > > > +                                 unsigned int black_level, int *err)
> > > > > +{
> > > > > +       return imx290_write(imx290, IMX290_BLKLEVEL,
> > > > > +                           black_level >> (16 - imx290->bpp), err);
> > > > > +}
> > > > > +
> > > > >  static int imx290_write_current_format(struct imx290 *imx290)
> > > > >  {
> > > > > +       const struct imx290_regval *regs;
> > > > > +       unsigned int num_regs;
> > > > > +       unsigned int bpp;
> > > > >         int ret;
> > > > >
> > > > >         switch (imx290->current_format.code) {
> > > > >         case MEDIA_BUS_FMT_SRGGB10_1X10:
> > > > > -               ret = imx290_set_register_array(imx290, imx290_10bit_settings,
> > > > > -                                               ARRAY_SIZE(
> > > > > -                                                       imx290_10bit_settings));
> > > > > -               if (ret < 0) {
> > > > > -                       dev_err(imx290->dev, "Could not set format registers\n");
> > > > > -                       return ret;
> > > > > -               }
> > > > > +               regs = imx290_10bit_settings;
> > > > > +               num_regs = ARRAY_SIZE(imx290_10bit_settings);
> > > > > +               bpp = 10;
> > > > >                 break;
> > > > >         case MEDIA_BUS_FMT_SRGGB12_1X12:
> > > > > -               ret = imx290_set_register_array(imx290, imx290_12bit_settings,
> > > > > -                                               ARRAY_SIZE(
> > > > > -                                                       imx290_12bit_settings));
> > > > > -               if (ret < 0) {
> > > > > -                       dev_err(imx290->dev, "Could not set format registers\n");
> > > > > -                       return ret;
> > > > > -               }
> > > > > +               regs = imx290_12bit_settings;
> > > > > +               num_regs = ARRAY_SIZE(imx290_12bit_settings);
> > > > > +               bpp = 12;
> > > > >                 break;
> > > > >         default:
> > > > >                 dev_err(imx290->dev, "Unknown pixel format\n");
> > > > >                 return -EINVAL;
> > > > >         }
> > > > >
> > > > > -       return 0;
> > > > > +       ret = imx290_set_register_array(imx290, regs, num_regs);
> > > > > +       if (ret < 0) {
> > > > > +               dev_err(imx290->dev, "Could not set format registers\n");
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > > > > +       return imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT, &ret);
> > > > >  }
> > > > >
> > > > >  /* ----------------------------------------------------------------------------
> > > > > @@ -573,7 +582,7 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > >
> > > > >         case V4L2_CID_TEST_PATTERN:
> > > > >                 if (ctrl->val) {
> > > > > -                       imx290_write(imx290, IMX290_BLKLEVEL, 0, &ret);
> > > > > +                       imx290_set_black_level(imx290, 0, &ret);
> > > > >                         usleep_range(10000, 11000);
> > > > >                         imx290_write(imx290, IMX290_PGCTRL,
> > > > >                                      (u8)(IMX290_PGCTRL_REGEN |
> > > > > @@ -582,12 +591,8 @@ static int imx290_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > >                 } else {
> > > > >                         imx290_write(imx290, IMX290_PGCTRL, 0x00, &ret);
> > > > >                         usleep_range(10000, 11000);
> > > > > -                       if (imx290->bpp == 10)
> > > > > -                               imx290_write(imx290, IMX290_BLKLEVEL, 0x3c,
> > > > > -                                            &ret);
> > > > > -                       else /* 12 bits per pixel */
> > > > > -                               imx290_write(imx290, IMX290_BLKLEVEL, 0xf0,
> > > > > -                                            &ret);
> > > > > +                       imx290_set_black_level(imx290, IMX290_BLACK_LEVEL_DEFAULT,
> > > > > +                                              &ret);
> > > > >                 }
> > > > >                 break;
> > > > >         default:
>
> --
> Regards,
>
> Laurent Pinchart
