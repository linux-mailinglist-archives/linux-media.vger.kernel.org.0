Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBA54CA275
	for <lists+linux-media@lfdr.de>; Wed,  2 Mar 2022 11:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238355AbiCBKvm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Mar 2022 05:51:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbiCBKvl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Mar 2022 05:51:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07229344D0
        for <linux-media@vger.kernel.org>; Wed,  2 Mar 2022 02:50:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F085B9FF;
        Wed,  2 Mar 2022 11:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646218255;
        bh=MpjubnmGaC11d91UsYs4DWj/m3+OVbL7hIZCQfKmhn8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mtQDXaYe7h93RAYOiYf+Z8nWknoT3WsBw4znBU3cpsiOae/UxWdL0AMbAF0TTs/Bm
         d1ZJ3byNJjPvynoNI/npRLqYqRh49O2Tud4tytDg8APZlb/Y4GLMpe/irNe3UVFar0
         6ncpdmTLQGChKAip05x5rpjwJku+kVVRwhSnYYOY=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6d75fd81-e6da-966b-ce50-32bd1749411e@gmail.com>
References: <dbb69fc2-d46f-ee91-d089-46e7370a2a14@gmail.com> <164570696256.4066078.10553504447380276248@Monstersaurus> <CAPuf0ENRRjMafZUOXS45PJxQrpcK_tdCRREoHn43t54pSbVhDg@mail.gmail.com> <411433596.ldbydfAV7o@phil> <CAPybu_2ZwYBLy13KAbznErGU-2=hLcot081WE7ZLZbZaEwC0ag@mail.gmail.com> <dc0a22f7-80c3-12b9-d3ec-38fdf51e374c@gmail.com> <CAPybu_0j6csK29_LNDZwmu2Xxs+tLPD3QGqxktgpj-=BKO8G-A@mail.gmail.com> <6d75fd81-e6da-966b-ce50-32bd1749411e@gmail.com>
Subject: Re: RockPro65 RK3399 chipset, ISP and IMX214 camera
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        linux-media <linux-media@vger.kernel.org>
To:     Clemens Arth <clemens.arth@gmail.com>,
        Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Wed, 02 Mar 2022 10:50:52 +0000
Message-ID: <164621825261.2555819.7180116523387185054@Monstersaurus>
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

Quoting Clemens Arth (2022-03-02 08:43:28)
> Hi all,
>=20
> so I have good news. With the help of one of the pinetab developers, I=20
> finally managed to get a working DT together. I did not realize I had to =

> use another clock to drive it, but the rest of the DT was already ok.
>=20
> While I played around with the IMX driver trying to improve it, I=20
> finally went back to the current mainline branch version testing it with =

> the rkisp1 and - voila! - the large 13M res does not work, but the=20
> 1920x1080 worked out immediately, using the pure command-line config of=20
> media-ctl and video-ctl - the libcamera refuses operation due to the=20
> missing database info and the lack of certain caps in the driver.
>=20
> There are a few things on my list though and I wanted to hear your=20
> thoughts before I move on now.
>=20
> 1) First of all, the image seems to be very badly balanced in terms of=20
> color and brightness. I assume it has to do with not properly adjusting=20
> parameters of the camera. I did not play around with it, as I have no=20
> graphical user interface on the board - it would make more sense I do=20
> that once I am able to visualize changes in real-time. @Ricardo, would=20
> you be willing to review changes I do to the IMX214 driver in the kernel =

> based on the application guide I shared earlier? As I'm not a driver guy =

> AT ALL, fixing things for me might break things for others, and I don't=20
> know how to verify that without having anyone else to check (I mean, do=20
> more than just code review, probably).

This is because the algorithms to handle color and brightness are
software algorithms that have to be run to calculate the correct
parameters (in real time, unless you have a fixed lighting environment).

This is handled by the libcamera IPA component, and the existing 3a
algorithms for the RKISP that we have started to develop. However, these
are not all the way there yet, and there is active development that you
will probably want to apply locally if they don't get merged to
libcamera before you test again.

Mostly this series I believe:

 https://patchwork.libcamera.org/project/libcamera/list/?series=3D2937

Furthermore, as you've seen libcamera needs a few controls to be
available in the driver, and a camera sensor helper to help it correctly
adapt the results of the calculation to the register settings to apply.

We can help you with those on the libcamera mailing list.

https://lists.libcamera.org/listinfo/libcamera-devel


> 2) The DT overlay - it is nice that I have it now, but I had to put=20
> everything together myself - should I contribute it into mainline (or=20
> armbian), does that make sense and what is the procedure?

If the camera is removable, then it would probably need to be an overlay
perhaps. That's a discussion for Heiko to continue I think.

> 3) I don't have any other camera to work with, as I just ordered FPC FCC =

> pinouts for 24-pin cams and have to rewire/solder a converter for the=20
> RockPro64. That might happen as soon as I get them from China - no=20
> Amazon or anything available right now. Still the DT seems to be the=20
> most valuable part of all of this right now.

Even if it ends up not being something that can be merged to the kernel,
please do share it on a public mailing list so that it can be indexed by
search engines for the next person who tries to do this to discover your
work.

You could post it as a patch marked [PATCH FOR TESTING ONLY] or such.

> 4) The libcamera fix - I saw lc_compliance and gst-video work already=20
> after a few minor copy/paste fixes, but by pulling the driver from=20
> mainline broke it again expectedly. What's the plausible roadmap? Fixing =

> libcamera alone resorts to fixing 10 lines of code probably, but that=20
> does not make sense without fixing the IMX214 driver in the kernel=20
> first, right?

I'd like to see code to know what to reference for that. But yes, if you
have fixes to support this cameara with libcamera, please submit to the
libcamera mailing list. If there is an upstream kernel driver we will
work towards merging them. Certainly fixing the IMX214 driver in the
kernel is required, but we can work in parallel, you don't have to wait.

--
Kieran.


>=20
> Best
> Clemens
>=20
>=20
>=20
> Am 28.02.22 um 09:15 schrieb Ricardo Ribalda Delgado:
> > On Sun, Feb 27, 2022 at 5:50 PM Clemens Arth <clemens.arth@gmail.com> w=
rote:
> >>
> >> Hi,
> >>
> >> so I moved on with some tests and trying to fix the driver and the
> >> current libcamera version. The driver has still wrong registers I gues=
s,
> >> but I can fix them later. Here's the output of v4l-ctl
> >>
> >> https://pastebin.com/ZkMZ1mjJ
> >>
> >> which looks kind of ok to me. However what does absolutely make no sen=
se
> >> to me is the output of the gst-launcher, which also makes lc_compliance
> >> go totally crazy at some point:
> >>
> >> https://pastebin.com/6MdFL5BL
> >>
> >> Although I dived through a large number of drivers, I did not get how =
to
> >> set the available formats. While Ricardo included 2 formats, there are
> >> obviously 6 or so according to the documentation, however, how are tho=
se
> >> defined such that they show up correctly there? It's clear to me that
> >> the available formats should be defined first, before moving on to
> >> getting something out from the device, right? Is this a part of the
> >> libcamera part or the driver?
> >=20
> > I had limited access to the doc, so most of the register setting come
> > from comparing with other sensors and from 3rd party drivers (nvidia
> > kernel)
> >=20
> > Also my isp only supported the 2 formats that I added support to.
> >=20
> >>
> >> I had to add quite a bunch of controls to the driver, and without
> >> checking the i2c communication in detail, there are at least no errors
> >> when I do
> >>
> >> v4l2-ctl -d /dev/v4l-subdev3 --set-ctrl "test_pattern=3D2"
> >>
> >> So I suspect that this actually works as expected...
> >>
> >> Best
> >> Clemens
> >>
> >>
> >> Am 25.02.22 um 08:37 schrieb Ricardo Ribalda Delgado:
> >>> Hi
> >>>
> >>> I think Heiko and Kieran have already given you a lot of clues.
> >>>
> >>> I would recommend to start looking at i2c communication with i2c
> >>> tools: i2cget, i2set, i2cdetect.... before trying any video operation.
> >>>
> >>> Your life will be much easier if you get your hands into a logic
> >>> analyser like this one https://www.saleae.com/
> >>>
> >>> Regarding the i2c address, bear in mind that vendors and Linux might
> >>> use different nomenclature (7 bits to 8 bits).
> >>>
> >>> Good luck!
> >>>
> >>> On Thu, Feb 24, 2022 at 6:03 PM Heiko Stuebner <heiko@sntech.de> wrot=
e:
> >>>>
> >>>> Am Donnerstag, 24. Februar 2022, 16:10:06 CET schrieb Clemens Arth:
> >>>>> Hi Kieran,
> >>>>>
> >>>>> Thx, I=E2=80=99m on my mobile now so I hope copy pasting works=E2=
=80=A6 apologies for typos=E2=80=A6
> >>>>>
> >>>>> Kieran Bingham <kieran.bingham@ideasonboard.com> schrieb am Do. 24.=
 Feb.
> >>>>> 2022 um 13:49:
> >>>>>
> >>>>>> Hi Clemens,
> >>>>>>
> >>>>>> Quoting Clemens Arth (2022-02-23 18:36:28)
> >>>>>>> Hi everyone,
> >>>>>>>
> >>>>>>> + Ricardo and Heiko in CC as the driver originators and rockchip =
pros...
> >>>>>>>
> >>>>>>> I'm reaching out to you based on a discussion with Sebastian Fric=
ke, who
> >>>>>>> was working on the OV13850 driver for the v5 kernel. I tried gett=
ing the
> >>>>>>> IMX214 finally to work on the RockPro64 from Pine64, which only w=
orks on
> >>>>>>> Android so far and I need to get that done on Mainline Linux (I d=
id not
> >>>>>>> find anyone who managed that and reported about it). However, I'm=
 also
> >>>>>>> totally stuck.
> >>>>>>>
> >>>>>>> The RockPro64 runs Dietpi, which is essentially Armbian + a few t=
weaks.
> >>>>>>> I'm using the Armbian 5.15.18 kernel, so mainline, with a custom =
device
> >>>>>>> tree, which in the first place powers the MIPI ports. I suspect i=
t is a
> >>>>>>> bad idea to have one pinctrl as a placeholder for 4 converters, h=
owever,
> >>>>>>> I'm not too deep into proxying in the devicetree, so here's the c=
urrent
> >>>>>>> status:
> >>>>>>>
> >>>>>>> https://pastebin.com/vs277ex0
> >>>>>>
> >>>>>> Your regulators are all listed as fixed-regulators. Are you sure
> >>>>>> there's nothing else to turn on ? I expect this was from another
> >>>>>> fragement for the same platform? So I hope it's consistent.
> >>>>>>
> >>>>>
> >>>>> The schematics are here, from which I took the regulator and gpio c=
onfig.
> >>>>> The regulators all seem to be fixed ones. There is just one pin tha=
t pulls
> >>>>> up all the regulators (DVP_PWR).
> >>>>>
> >>>>> https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
> >>>>>
> >>>>> The IMX214 driver has only one pin, the enable_pin, but it is somew=
hat
> >>>>> different from the IMX219 for example. Looking at both driver's cod=
e I
> >>>>> believe what is the reset_pin with the IMX219 is the enable_pin wit=
h the
> >>>>> IMX214, but I am not sure about that. There is no MIPI reset on the
> >>>>> RockPro64 afaik. Therefore I think it needs to be wired to the DVP_=
PDN0_H
> >>>>> pin, but other drivers define that one specifically and it apparent=
ly does
> >>>>> something different.
> >>>>
> >>>> For the pins also check the direction (active_low / active_high).
> >>>> I remember having fun somewhere when changing between the vendor
> >>>> kernel and mainline.
> >>>>
> >>>>
> >>>>>> Can you validate that the enable-gpios definition is to the correc=
t GPIO
> >>>>>> to enable the camera ?
> >>>>>>
> >>>>>>> The camera is connected to the first MIPI port. The kernel boot l=
ogs
> >>>>>>> look ok to me (except for the cyclic dependency issue, but I thin=
k that
> >>>>>>> does not matter much).
> >>>>>>>
> >>>>>>> https://pastebin.com/hvhdEfxm
> >>>>>>>
> >>>>>>> Without the camera configured in the device tree, it shows up as =
0x0c
> >>>>>>> device on the #1 I2C bus, which is a bit suspicious to me given t=
he
> >>>>>>> addresses in the documentation and the info given in the kernel
> >>>>>>> documentation.
> >>>>>>>
> >>>>>>> However, I essentially followed the description according to this=
 guide
> >>>>>>> to set up the RKISP:
> >>>>>>>
> >>>>>>> https://linuxtv.org/downloads/v4l-dvb-apis/admin-guide/rkisp1.html
> >>>>>>>
> >>>>>>> using this:
> >>>>>>>
> >>>>>>> https://pastebin.com/ZqWC5vhC
> >>>>>>>
> >>>>>>> It looks like this (see also png attached).
> >>>>>>>
> >>>>>>> https://pastebin.com/MfTNp5Pd
> >>>>>>>
> >>>>>>> However, the IMX214 driver does not complain until that point and=
 seems
> >>>>>>> to do right. I expected that at least something happens, however =
it does
> >>>>>>> not. The last command does this:
> >>>>>>>
> >>>>>>> VIDIOC_STREAMON returned -1 (No such device or address) and this =
is the
> >>>>>>> kernel output
> >>>>>>>
> >>>>>>> [1509.435228] imx214 1-000c: write_table error: -6
> >>>>>>> [1509.435868] imx214 1-000c: could not sent common table -6
> >>>>>>
> >>>>>> -6 is ENXIO 6 No such device or address. So I expect the device is=
n't
> >>>>>> responding to the I2C controller.
> >>>>>>
> >>>>>> What shows up with i2c-detect -r -y 1 ?
> >>>>>>
> >>>>>
> >>>>>   From the top of my head, it shows 1c on the 0x0c address iirc, bu=
t only if
> >>>>> I remove the IMX from the DT. Otherwise the driver takes over and i=
t shows
> >>>>> UU. I removed the camera physically and it was gone on i2cdetect, s=
o I
> >>>>> suspect that it indeed is the camera. From the driver and the docum=
entation
> >>>>> I need to configure it 4-lane, as it is hardcoded in the driver (co=
mpared
> >>>>> to the application notes for registers for the ImX214).
> >>>>>
> >>>>>
> >>>>>>
> >>>>>>> There is no more info given, even if I do some "echo 0x3F >
> >>>>>>> /sys/class/video4linux/v4l-subdev0/dev_debug" to the subdevs.
> >>>>>>>
> >>>>>>> Here's the IMX214 documentation btw. that I got through a detour =
from
> >>>>>> CSDN.
> >>>>>>>
> >>>>>>>
> >>>>>> https://www.dropbox.com/sh/5d3mp2akr3kmu7t/AADaAsSxZu2kVSIfEceStwu=
oa?dl=3D0
> >>>>>>>
> >>>>>>> I'm not entirely sure, but there is something wrong somewhere and=
 I
> >>>>>>> can't find out if it is with the driver, the RKISP or anything el=
se.
> >>>>>>> Here's what "v4l2-ctl -d /dev/v4l-subdev3 --all" gives - not sure=
 but
> >>>>>>> shouldn't it show supported resolutions or something?
> >>>>>>>
> >>>>>>> https://pastebin.com/ckAFPbAs
> >>>>>>
> >>>>>> You might find it useful to check what is missing to support libca=
mera
> >>>>>> with this sensor, then you can use cam/qcam to test it too. The RK=
ISP1
> >>>>>> pipeline handler in libcamera will handle all the media controller
> >>>>>> configuration, and identifying the available formats for you, but =
we
> >>>>>> haven't had an IMX214 sensor added yet, so you might need to add a
> >>>>>> mapping to the src/libcamera/camera_sensor_properties.cpp sensor
> >>>>>> database, and the driver is missing at least V4L2_CID_HBLANK and
> >>>>>> V4L2_CID_VBLANK that are required for libcamera.  So it might not =
be as
> >>>>>> straightforward as I'd like, but it would be helpful I expect.
> >>>>>
> >>>>>
> >>>>> I tried that at an earlier stage, to no avail unfortunately. But I =
will try
> >>>>> again as soon as I get back to my desk.
> >>>>>
> >>>>>>
> >>>>>>
> >>>>>> But ... I think your issues are more likely underlying hardware or=
 DT
> >>>>>> issues, as the device sounds like it's not responding on the i2c
> >>>>>> address.
> >>>>>>
> >>>>>> Sometimes I2C devices have a configurable address, can you check i=
f this
> >>>>>> really is the correct I2C address for your camera?
> >>>>>>
> >>>>>> That=E2=80=99s one of the issues. Ricardo wrote about iirc 0x10 an=
d 0x1a, but the
> >>>>> app note says something entirely different (forgot), and my camera =
appears
> >>>>> to be on yet another address=E2=80=A6
> >>>>
> >>>> not specific to cameras, but in the past I had i2c devices that set =
the
> >>>> address depending on the state of a gpio during powerup - which was
> >>>> floating in my old case, producing random settings ;-) .
> >>>>
> >>>>
> >>>> Heiko
> >>>>
> >>>>
> >>>
> >>>
> >>
> >=20
> >
