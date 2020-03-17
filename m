Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8451887AE
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 15:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgCQOkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 10:40:51 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:50147 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgCQOkv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 10:40:51 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B6836240002;
        Tue, 17 Mar 2020 14:40:47 +0000 (UTC)
Date:   Tue, 17 Mar 2020 15:43:42 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Benoit Parrot <bparrot@ti.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
Subject: Re: OV5640 CSI2 problemsg
Message-ID: <20200317144342.6ylc2xlkxtzuc3h2@uno.localdomain>
References: <d0510b81-9ae1-9b6f-02c5-f4eb08e67bfa@ti.com>
 <20200317102214.kc2rh7s67ycl4req@uno.localdomain>
 <1496451e-b3ba-efbb-1836-6eb321993b11@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1496451e-b3ba-efbb-1836-6eb321993b11@ti.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On Tue, Mar 17, 2020 at 02:40:35PM +0200, Tomi Valkeinen wrote:
> On 17/03/2020 12:22, Jacopo Mondi wrote:
> > Hi Tomi,
> >     welcome to the ov5640 bandwagon
> >
> > This driver received lot of attention and reworking, but there are
> > indeed several issues at the moment :(
> >
> > On Fri, Mar 13, 2020 at 01:15:33PM +0200, Tomi Valkeinen wrote:
> > > Hi all,
> > >
> > > I've been testing and debugging OV5640 with TI's DRA76 and AM65 platforms,
> > > which have the CAL IP for MIPI CSI2 RX.
> > >
> > > The most clear problem is that 1280x720@30 doesn't work at all, but with all
> > > resolutions I can see occasional PHY errors reported when starting the
> > > streaming.
> >
> > I've been testing a CSI-2 setup with 2 data lanes on an IMX6 platform,
> > just for the record
>
> Two lanes here too.
>
> > > The OV5640 spec lists the video timings, but I haven't been able to figure
> > > out what exactly they mean, as e.g. the vsync time doesn't seem to match the
> > > other times according to my calculations.
> > >
> >
> > Are you referring to the ov5640_mode_info structures ?
>
> Yes.
>
> Looking at the git log, these values seem to have been there from the start.
> Initially in the raw register sequences, then moved from there to
> ov5640_mode_info. But the numbers have been the same.
>

Yup, that's my understanding as well

> I wonder where they came originally, and whether they have ever been correct.
>
> Perhaps I'll cook up a patch where I'll update the values to what the sensor
> sheet suggests, and other people can try and see if the driver still works
> for them.
>
> > > In any case, I was poking here and there, and noticed that if I use the htot
> > > value from the spec (2844), instead of the current value (1896 for most
> > > resolutions), 1280x720 works, and the PHY errors are gone.
> > >
> > > Testing more, I found out that the smaller the htot, the more unreliable the
> > > RX becomes, and going down from 2844, somewhere around 2400 I start to see
> > > errors.
> > >
> >
> > That's a good finding!
> >
> > I recall I had issues as well with that mode, and fixed them by
> > doubling the MIPI bus clock speed You might have noticed these lines
> > in the CSI-2 clock tree calculation function ov5640_set_mipi_pclk()
> >
> > 	/*
> > 	 * 1280x720 is reported to use 'SUBSAMPLING' only,
> > 	 * but according to the sensor manual it goes through the
> > 	 * scaler before subsampling.
> > 	 */
> > 	if (mode->dn_mode == SCALING ||
> > 	   (mode->id == OV5640_MODE_720P_1280_720))
> > 		mipi_div = OV5640_MIPI_DIV_SCLK; // THIS is 1
> > 	else
> > 		mipi_div = OV5640_MIPI_DIV_PCLK; // THIS is 2: halve the MIPI clock speed
> >
> > I had that mode working, but after a good year or so trying to decode
> > the clock tree of the sensor with only partially satisfactory results,
> > I can't tell if that was by accident or not :)
>
> The comment says that the above is according to the sensor manual, but I
> couldn't find mention of that. Do you recall where you found that
> information?
>

In my datasheet version (2.03) page 22 reports a list of modes and
the associated "scaling method". 1280x720 is reported as "cropping +
subsampling" that's where I got the mode "goes through the scaler".

> > > I'm not that much familiar with CSI-2, and very little with OV5640. Does
> > > anyone have a clue about what I'm observing here? Does 1280x720@30 work on
> >
> > Hugues made a great effort by sampling the actual frequencies on the
> > bus, and he found out the actual frequencies are off compared to my
> > theoretical calculations. After that I've actually dropped the ball and
> > moved on, but maybe throwing your htot findings in the mix could help?
> >
> > Here you have the thread with more information and Hugues measurement
> > results:
> > https://patchwork.kernel.org/patch/11019673/
> >
> > > other platforms with CSI2? Where do the current OV5640 video timings come
> > > from?
> > >
> >
> > I suggest you have a look at
> > dfbfb7aa832c ("media: ov5640: Compute the clock rate at runtime")
> >
> > htot is used to calculate the desired pixel clock, so it could indeed
> > be one of the reasons why the above clock tree calculations are off.
> >
> > Hope it helps a bit.
>
> Thanks! Seems that this is all a bit of a detective work =). I have no means

It is I'm afraid.

Thanks for your effort!

> to measure the CSI clock/data lanes, so debugging this is obviously rather
> frustrating.
>
>  Tomi
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
