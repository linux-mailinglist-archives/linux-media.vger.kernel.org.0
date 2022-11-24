Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53661637F9E
	for <lists+linux-media@lfdr.de>; Thu, 24 Nov 2022 20:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiKXTUR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Nov 2022 14:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiKXTUQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Nov 2022 14:20:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DEA369AB3
        for <linux-media@vger.kernel.org>; Thu, 24 Nov 2022 11:20:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 152C67FA;
        Thu, 24 Nov 2022 20:20:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669317612;
        bh=s9ddG6XsOkpU0ODTRF/UeMh6+IWr/5dc2CHjDSWtlPY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aHsYEyC3NFK5RzrqhhIWVJuwiaEjlAMF4auZHh5sRtSIeDCNdxF3Jf2soTAa2hHLm
         7JAUs0NQpoBwy9gZDbgBDm7d7MjLkxs4RrucrcAIAeso3LCisdq7AU+5Pgl0dh+qF8
         HP9NhA2qwLFWsr3qdpvSN1RBHOJ2LUz9frHqCEHI=
Date:   Thu, 24 Nov 2022 21:19:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 14/15] media: i2c: imx290: Configure data lanes at
 start time
Message-ID: <Y3/D3OUPLVt89S15@pendragon.ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
 <20221122223250.21233-15-laurent.pinchart@ideasonboard.com>
 <CAPY8ntD+82HitFj7G9QTbwx4dNFf59adqhn6q2-mKAdTwc-iQA@mail.gmail.com>
 <Y34uIE+bjlnIXGD9@pendragon.ideasonboard.com>
 <CAPY8ntB_5wQADBd2q2kO6Vstnu_1P=mQEkAFjQ9ee0PJ=eJrXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntB_5wQADBd2q2kO6Vstnu_1P=mQEkAFjQ9ee0PJ=eJrXQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Thu, Nov 24, 2022 at 06:02:54PM +0000, Dave Stevenson wrote:
> On Wed, 23 Nov 2022 at 14:29, Laurent Pinchart wrote:
> > On Wed, Nov 23, 2022 at 10:16:58AM +0000, Dave Stevenson wrote:
> > > On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart wrote:
> > > >
> > > > There's no need to configure the data lanes in the runtime PM resume
> > > > handler. Do so in imx290_start_streaming() instead.
> > >
> > > Interesting as I had Sakari advocating putting clock mode selection
> > > register control in "power on" for my recent ov9282 series. Is there
> > > any consistency?
> >
> > No there isn't :-) There hasn't been any official rule so far, so it's
> > no surprise different drivers exhibit different behaviours. I'm all for
> > standardization when possible though.
> 
> Likewise! Standardisation is a good thing!
> 
> Sorry my comment was slightly tongue-in-cheek due to having had such a
> similar thread with Sakari so recently. When a long-standing member of
> the community then comes along with a similar patch it just reinforced
> that, in the absence of any documented guidelines, it is all very much
> ad-hoc.
> It then frustrates me that these sorts of issues are then raised at
> review, which either results in having to justify the choice, or
> respinning patches often with time constraints if trying to hit a
> merge window.

I understand your frustration, and have experienced it too myself at
times. We're trying to align our messages, unfortunately it's mostly
ad-hoc. There are multiple reasons for that, sometimes we realize that
we've being done things wrong for a long time, or we need to experiment
to find the best option. The media subsystem being understaffed doesn't
help, and I think it also drives contributors away as a result, which
makes the problem worse.

With more time, I would really like to work on standardization of camera
sensor APIs in the media subsystem, both in-kernel and towards
userspace. We've discussed that in Dublin, you know how painful it is
today.

> > Overall, I think there's a general agreement that the runtime PM resume
> > handler needs to control everything required to make the sensor
> > accessible by software. That covers at least hard reset, regulators and
> > clocks.
> >
> > For software settings, it's less clear. If the sensor requires a
> > software reset sequence immediately after power on, it makes sense to
> > also handle that in the runtime PM resume handler. Same thing for any
> > other initialization required to reach a quiescent state (for instance
> > there are many sensors that start streaming automatically right after
> > power on for a reason I can't understand, so that needs to be disabled).
> >
> > This means that the runtime PM handler will thus access the sensor over
> > I2C. We may not want to do so in probe() before having a chance to probe
> > it (by reading an ID register for instance). The power on sequence could
> > be split in two to handle this, with one function that powers the sensor
> > up, and the other one that handles software initialization. Both would
> > be called from the runtime PM resume handler, and in probe(), we could
> > first power on the sensor, identify it, and then initialize it. I think
> > that will be fine on DT platforms as we don't need to RPM-resume the I2C
> > device in probe before accessing it as far as I can tell, given that the
> > probe() function should be called with the I2C controller RPM-resumed.
> > I'll let Sakari confirms if this works for ACPI).
> 
> For ov9282 I'd also raised the issue that a fair number of sensor
> drivers include a software reset in their lists of registers, which
> will undo any settings done in resume.
> 
> As above, it was more of an observation than issue with this patch.
> Alexander has already given an R-b, so there's limited point adding mine.
> 
> I'll try and test the series out tomorrow, and I will get around to
> submitting my series on top.

Great, I'll then test your patches on my board :-)

> > For other settings, I wouldn't handle them in the runtime PM resume
> > handler. In this particular case, the number of data lanes could even
> > vary based on the sensor mode (we don't do so at the moment), so
> > .s_stream() time seems better to me.
> >
> > > https://patchwork.linuxtv.org/project/linux-media/patch/20221005152809.3785786-9-dave.stevenson@raspberrypi.com/#141118
> > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/imx290.c | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index dbed703fa199..4dfa090f918d 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -753,6 +753,9 @@ static int imx290_start_streaming(struct imx290 *imx290,
> > > >                 return ret;
> > > >         }
> > > >
> > > > +       /* Set data lane count */
> > > > +       imx290_set_data_lanes(imx290);
> > > > +
> > > >         /* Apply the register values related to current frame format */
> > > >         format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> > > >         ret = imx290_setup_format(imx290, format);
> > > > @@ -1052,9 +1055,6 @@ static int imx290_power_on(struct device *dev)
> > > >         gpiod_set_value_cansleep(imx290->rst_gpio, 0);
> > > >         usleep_range(30000, 31000);
> > > >
> > > > -       /* Set data lane count */
> > > > -       imx290_set_data_lanes(imx290);
> > > > -
> > > >         return 0;
> > > >  }
> > > >

-- 
Regards,

Laurent Pinchart
