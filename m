Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9116361DA
	for <lists+linux-media@lfdr.de>; Wed, 23 Nov 2022 15:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238490AbiKWObE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Nov 2022 09:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236152AbiKWOa0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Nov 2022 09:30:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690E825E9B
        for <linux-media@vger.kernel.org>; Wed, 23 Nov 2022 06:29:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E33DA890;
        Wed, 23 Nov 2022 15:29:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669213744;
        bh=YrsVhcOJdBlujnbAsem3aTFifvs1YlthrJD+5ta9iy4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PugmKgsBcC+SGmkymg7KSBP1FCrnWOykj3oBi9MOu8KjP8iPQnj2i1Om2J3MCf/By
         cEYiR/GlTzCYl9fxDevyecMhrutKuqBtcTAnp4nObtuh5vj0eOpN8C8N0Fc+B+tk9t
         bNfRgEDp+9ACthrGFTyge4JROznpIUU278ZOHbU8=
Date:   Wed, 23 Nov 2022 16:28:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH v1 14/15] media: i2c: imx290: Configure data lanes at
 start time
Message-ID: <Y34uIE+bjlnIXGD9@pendragon.ideasonboard.com>
References: <20221122223250.21233-1-laurent.pinchart@ideasonboard.com>
 <20221122223250.21233-15-laurent.pinchart@ideasonboard.com>
 <CAPY8ntD+82HitFj7G9QTbwx4dNFf59adqhn6q2-mKAdTwc-iQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntD+82HitFj7G9QTbwx4dNFf59adqhn6q2-mKAdTwc-iQA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

On Wed, Nov 23, 2022 at 10:16:58AM +0000, Dave Stevenson wrote:
> On Tue, 22 Nov 2022 at 22:34, Laurent Pinchart wrote:
> >
> > There's no need to configure the data lanes in the runtime PM resume
> > handler. Do so in imx290_start_streaming() instead.
> 
> Interesting as I had Sakari advocating putting clock mode selection
> register control in "power on" for my recent ov9282 series. Is there
> any consistency?

No there isn't :-) There hasn't been any official rule so far, so it's
no surprise different drivers exhibit different behaviours. I'm all for
standardization when possible though.

Overall, I think there's a general agreement that the runtime PM resume
handler needs to control everything required to make the sensor
accessible by software. That covers at least hard reset, regulators and
clocks.

For software settings, it's less clear. If the sensor requires a
software reset sequence immediately after power on, it makes sense to
also handle that in the runtime PM resume handler. Same thing for any
other initialization required to reach a quiescent state (for instance
there are many sensors that start streaming automatically right after
power on for a reason I can't understand, so that needs to be disabled).

This means that the runtime PM handler will thus access the sensor over
I2C. We may not want to do so in probe() before having a chance to probe
it (by reading an ID register for instance). The power on sequence could
be split in two to handle this, with one function that powers the sensor
up, and the other one that handles software initialization. Both would
be called from the runtime PM resume handler, and in probe(), we could
first power on the sensor, identify it, and then initialize it. I think
that will be fine on DT platforms as we don't need to RPM-resume the I2C
device in probe before accessing it as far as I can tell, given that the
probe() function should be called with the I2C controller RPM-resumed.
I'll let Sakari confirms if this works for ACPI).

For other settings, I wouldn't handle them in the runtime PM resume
handler. In this particular case, the number of data lanes could even
vary based on the sensor mode (we don't do so at the moment), so
.s_stream() time seems better to me.

> https://patchwork.linuxtv.org/project/linux-media/patch/20221005152809.3785786-9-dave.stevenson@raspberrypi.com/#141118
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx290.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > index dbed703fa199..4dfa090f918d 100644
> > --- a/drivers/media/i2c/imx290.c
> > +++ b/drivers/media/i2c/imx290.c
> > @@ -753,6 +753,9 @@ static int imx290_start_streaming(struct imx290 *imx290,
> >                 return ret;
> >         }
> >
> > +       /* Set data lane count */
> > +       imx290_set_data_lanes(imx290);
> > +
> >         /* Apply the register values related to current frame format */
> >         format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);
> >         ret = imx290_setup_format(imx290, format);
> > @@ -1052,9 +1055,6 @@ static int imx290_power_on(struct device *dev)
> >         gpiod_set_value_cansleep(imx290->rst_gpio, 0);
> >         usleep_range(30000, 31000);
> >
> > -       /* Set data lane count */
> > -       imx290_set_data_lanes(imx290);
> > -
> >         return 0;
> >  }
> >

-- 
Regards,

Laurent Pinchart
