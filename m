Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7894C2C1D
	for <lists+linux-media@lfdr.de>; Thu, 24 Feb 2022 13:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbiBXMuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Feb 2022 07:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbiBXMuL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Feb 2022 07:50:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918961F7660
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 04:49:27 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B5F7DD;
        Thu, 24 Feb 2022 13:49:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645706965;
        bh=sfxYRijlyDLM1p3OEcsuYo8mR1DnrtULrstRPpTwtGI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Nv2XaohweffrQSbEL51qmh8bgQxuskjjzdC0sVaeksFeMNG6FD8VZjcj/UIQKItWg
         bauFkhS0AQxvFDhK75PIuD4V9LQc+ateG+Qs/D+FCCf/H3cpELp1yFqAqo1L9V6o08
         OrYT16ktssXUnYGz1Ro9cNAr962lOzuuXo3/se0g=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dbb69fc2-d46f-ee91-d089-46e7370a2a14@gmail.com>
References: <dbb69fc2-d46f-ee91-d089-46e7370a2a14@gmail.com>
Subject: Re: RockPro65 RK3399 chipset, ISP and IMX214 camera
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     ricardo.ribalda@gmail.com, heiko@sntech.de
To:     Clemens Arth <clemens.arth@gmail.com>, linux-media@vger.kernel.org
Date:   Thu, 24 Feb 2022 12:49:22 +0000
Message-ID: <164570696256.4066078.10553504447380276248@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Clemens,

Quoting Clemens Arth (2022-02-23 18:36:28)
> Hi everyone,
>=20
> + Ricardo and Heiko in CC as the driver originators and rockchip pros...
>=20
> I'm reaching out to you based on a discussion with Sebastian Fricke, who =

> was working on the OV13850 driver for the v5 kernel. I tried getting the =

> IMX214 finally to work on the RockPro64 from Pine64, which only works on =

> Android so far and I need to get that done on Mainline Linux (I did not=20
> find anyone who managed that and reported about it). However, I'm also=20
> totally stuck.
>=20
> The RockPro64 runs Dietpi, which is essentially Armbian + a few tweaks.
> I'm using the Armbian 5.15.18 kernel, so mainline, with a custom device=20
> tree, which in the first place powers the MIPI ports. I suspect it is a=20
> bad idea to have one pinctrl as a placeholder for 4 converters, however, =

> I'm not too deep into proxying in the devicetree, so here's the current=20
> status:
>=20
> https://pastebin.com/vs277ex0

Your regulators are all listed as fixed-regulators. Are you sure
there's nothing else to turn on ? I expect this was from another
fragement for the same platform? So I hope it's consistent.

Can you validate that the enable-gpios definition is to the correct GPIO
to enable the camera ?

> The camera is connected to the first MIPI port. The kernel boot logs=20
> look ok to me (except for the cyclic dependency issue, but I think that=20
> does not matter much).
>=20
> https://pastebin.com/hvhdEfxm
>=20
> Without the camera configured in the device tree, it shows up as 0x0c=20
> device on the #1 I2C bus, which is a bit suspicious to me given the=20
> addresses in the documentation and the info given in the kernel=20
> documentation.
>=20
> However, I essentially followed the description according to this guide=20
> to set up the RKISP:
>=20
> https://linuxtv.org/downloads/v4l-dvb-apis/admin-guide/rkisp1.html
>=20
> using this:
>=20
> https://pastebin.com/ZqWC5vhC
>=20
> It looks like this (see also png attached).
>=20
> https://pastebin.com/MfTNp5Pd
>=20
> However, the IMX214 driver does not complain until that point and seems=20
> to do right. I expected that at least something happens, however it does =

> not. The last command does this:
>=20
> VIDIOC_STREAMON returned -1 (No such device or address) and this is the=20
> kernel output
>=20
> [1509.435228] imx214 1-000c: write_table error: -6
> [1509.435868] imx214 1-000c: could not sent common table -6

-6 is ENXIO 6 No such device or address. So I expect the device isn't
responding to the I2C controller.

What shows up with i2c-detect -r -y 1 ?


> There is no more info given, even if I do some "echo 0x3F >=20
> /sys/class/video4linux/v4l-subdev0/dev_debug" to the subdevs.
>=20
> Here's the IMX214 documentation btw. that I got through a detour from CSD=
N.
>=20
> https://www.dropbox.com/sh/5d3mp2akr3kmu7t/AADaAsSxZu2kVSIfEceStwuoa?dl=
=3D0
>=20
> I'm not entirely sure, but there is something wrong somewhere and I=20
> can't find out if it is with the driver, the RKISP or anything else.=20
> Here's what "v4l2-ctl -d /dev/v4l-subdev3 --all" gives - not sure but=20
> shouldn't it show supported resolutions or something?
>=20
> https://pastebin.com/ckAFPbAs

You might find it useful to check what is missing to support libcamera
with this sensor, then you can use cam/qcam to test it too. The RKISP1
pipeline handler in libcamera will handle all the media controller
configuration, and identifying the available formats for you, but we
haven't had an IMX214 sensor added yet, so you might need to add a
mapping to the src/libcamera/camera_sensor_properties.cpp sensor
database, and the driver is missing at least V4L2_CID_HBLANK and
V4L2_CID_VBLANK that are required for libcamera.  So it might not be as
straightforward as I'd like, but it would be helpful I expect.

But ... I think your issues are more likely underlying hardware or DT
issues, as the device sounds like it's not responding on the i2c
address.

Sometimes I2C devices have a configurable address, can you check if this
really is the correct I2C address for your camera?



> Any help would be appreciated.

Regards

Kieran


>=20
> Best
> Clemens
