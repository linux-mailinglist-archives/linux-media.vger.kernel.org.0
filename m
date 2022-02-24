Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B522D4C3329
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 18:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231407AbiBXRGo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 24 Feb 2022 12:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbiBXRGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 12:06:00 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A535D20A96B
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 09:03:34 -0800 (PST)
Received: from [185.156.123.69] (helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1nNHWW-0002Je-UU; Thu, 24 Feb 2022 18:03:24 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Clemens Arth <clemens.arth@gmail.com>
Cc:     linux-media@vger.kernel.org, ricardo.ribalda@gmail.com
Subject: Re: RockPro65 RK3399 chipset, ISP and IMX214 camera
Date:   Thu, 24 Feb 2022 18:03:22 +0100
Message-ID: <411433596.ldbydfAV7o@phil>
In-Reply-To: <CAPuf0ENRRjMafZUOXS45PJxQrpcK_tdCRREoHn43t54pSbVhDg@mail.gmail.com>
References: <dbb69fc2-d46f-ee91-d089-46e7370a2a14@gmail.com> <164570696256.4066078.10553504447380276248@Monstersaurus> <CAPuf0ENRRjMafZUOXS45PJxQrpcK_tdCRREoHn43t54pSbVhDg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Donnerstag, 24. Februar 2022, 16:10:06 CET schrieb Clemens Arth:
> Hi Kieran,
> 
> Thx, I’m on my mobile now so I hope copy pasting works… apologies for typos…
> 
> Kieran Bingham <kieran.bingham@ideasonboard.com> schrieb am Do. 24. Feb.
> 2022 um 13:49:
> 
> > Hi Clemens,
> >
> > Quoting Clemens Arth (2022-02-23 18:36:28)
> > > Hi everyone,
> > >
> > > + Ricardo and Heiko in CC as the driver originators and rockchip pros...
> > >
> > > I'm reaching out to you based on a discussion with Sebastian Fricke, who
> > > was working on the OV13850 driver for the v5 kernel. I tried getting the
> > > IMX214 finally to work on the RockPro64 from Pine64, which only works on
> > > Android so far and I need to get that done on Mainline Linux (I did not
> > > find anyone who managed that and reported about it). However, I'm also
> > > totally stuck.
> > >
> > > The RockPro64 runs Dietpi, which is essentially Armbian + a few tweaks.
> > > I'm using the Armbian 5.15.18 kernel, so mainline, with a custom device
> > > tree, which in the first place powers the MIPI ports. I suspect it is a
> > > bad idea to have one pinctrl as a placeholder for 4 converters, however,
> > > I'm not too deep into proxying in the devicetree, so here's the current
> > > status:
> > >
> > > https://pastebin.com/vs277ex0
> >
> > Your regulators are all listed as fixed-regulators. Are you sure
> > there's nothing else to turn on ? I expect this was from another
> > fragement for the same platform? So I hope it's consistent.
> >
> 
> The schematics are here, from which I took the regulator and gpio config.
> The regulators all seem to be fixed ones. There is just one pin that pulls
> up all the regulators (DVP_PWR).
> 
> https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
> 
> The IMX214 driver has only one pin, the enable_pin, but it is somewhat
> different from the IMX219 for example. Looking at both driver's code I
> believe what is the reset_pin with the IMX219 is the enable_pin with the
> IMX214, but I am not sure about that. There is no MIPI reset on the
> RockPro64 afaik. Therefore I think it needs to be wired to the DVP_PDN0_H
> pin, but other drivers define that one specifically and it apparently does
> something different.

For the pins also check the direction (active_low / active_high).
I remember having fun somewhere when changing between the vendor
kernel and mainline.


> > Can you validate that the enable-gpios definition is to the correct GPIO
> > to enable the camera ?
> >
> > > The camera is connected to the first MIPI port. The kernel boot logs
> > > look ok to me (except for the cyclic dependency issue, but I think that
> > > does not matter much).
> > >
> > > https://pastebin.com/hvhdEfxm
> > >
> > > Without the camera configured in the device tree, it shows up as 0x0c
> > > device on the #1 I2C bus, which is a bit suspicious to me given the
> > > addresses in the documentation and the info given in the kernel
> > > documentation.
> > >
> > > However, I essentially followed the description according to this guide
> > > to set up the RKISP:
> > >
> > > https://linuxtv.org/downloads/v4l-dvb-apis/admin-guide/rkisp1.html
> > >
> > > using this:
> > >
> > > https://pastebin.com/ZqWC5vhC
> > >
> > > It looks like this (see also png attached).
> > >
> > > https://pastebin.com/MfTNp5Pd
> > >
> > > However, the IMX214 driver does not complain until that point and seems
> > > to do right. I expected that at least something happens, however it does
> > > not. The last command does this:
> > >
> > > VIDIOC_STREAMON returned -1 (No such device or address) and this is the
> > > kernel output
> > >
> > > [1509.435228] imx214 1-000c: write_table error: -6
> > > [1509.435868] imx214 1-000c: could not sent common table -6
> >
> > -6 is ENXIO 6 No such device or address. So I expect the device isn't
> > responding to the I2C controller.
> >
> > What shows up with i2c-detect -r -y 1 ?
> >
> 
> From the top of my head, it shows 1c on the 0x0c address iirc, but only if
> I remove the IMX from the DT. Otherwise the driver takes over and it shows
> UU. I removed the camera physically and it was gone on i2cdetect, so I
> suspect that it indeed is the camera. From the driver and the documentation
> I need to configure it 4-lane, as it is hardcoded in the driver (compared
> to the application notes for registers for the ImX214).
> 
> 
> >
> > > There is no more info given, even if I do some "echo 0x3F >
> > > /sys/class/video4linux/v4l-subdev0/dev_debug" to the subdevs.
> > >
> > > Here's the IMX214 documentation btw. that I got through a detour from
> > CSDN.
> > >
> > >
> > https://www.dropbox.com/sh/5d3mp2akr3kmu7t/AADaAsSxZu2kVSIfEceStwuoa?dl=0
> > >
> > > I'm not entirely sure, but there is something wrong somewhere and I
> > > can't find out if it is with the driver, the RKISP or anything else.
> > > Here's what "v4l2-ctl -d /dev/v4l-subdev3 --all" gives - not sure but
> > > shouldn't it show supported resolutions or something?
> > >
> > > https://pastebin.com/ckAFPbAs
> >
> > You might find it useful to check what is missing to support libcamera
> > with this sensor, then you can use cam/qcam to test it too. The RKISP1
> > pipeline handler in libcamera will handle all the media controller
> > configuration, and identifying the available formats for you, but we
> > haven't had an IMX214 sensor added yet, so you might need to add a
> > mapping to the src/libcamera/camera_sensor_properties.cpp sensor
> > database, and the driver is missing at least V4L2_CID_HBLANK and
> > V4L2_CID_VBLANK that are required for libcamera.  So it might not be as
> > straightforward as I'd like, but it would be helpful I expect.
> 
> 
> I tried that at an earlier stage, to no avail unfortunately. But I will try
> again as soon as I get back to my desk.
> 
> >
> >
> > But ... I think your issues are more likely underlying hardware or DT
> > issues, as the device sounds like it's not responding on the i2c
> > address.
> >
> > Sometimes I2C devices have a configurable address, can you check if this
> > really is the correct I2C address for your camera?
> >
> > That’s one of the issues. Ricardo wrote about iirc 0x10 and 0x1a, but the
> app note says something entirely different (forgot), and my camera appears
> to be on yet another address…

not specific to cameras, but in the past I had i2c devices that set the
address depending on the state of a gpio during powerup - which was
floating in my old case, producing random settings ;-) .


Heiko


