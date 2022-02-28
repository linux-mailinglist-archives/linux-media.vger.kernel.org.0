Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78A4A4C64AA
	for <lists+linux-media@lfdr.de>; Mon, 28 Feb 2022 09:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233440AbiB1IQL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Feb 2022 03:16:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiB1IQI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Feb 2022 03:16:08 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B5F381B7
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 00:15:19 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id u1so14016547wrg.11
        for <linux-media@vger.kernel.org>; Mon, 28 Feb 2022 00:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qb+jhDVtLJWSCULCC42BGPGlgm/IACOEKH/ETM7f5K8=;
        b=TvBNOlgZM8VzHHj7jM3M3zeUXBTcZzKFgWXCdqRwQ/G7WS7nbqa7Mj3FFsrYCOIQWm
         YPH62YOB+Hz7wi9qfNEi0J+baaKR+jJTg3/yt081lnl7l8Ypai/tpbtcVgC5np5xO4Zk
         D78AuJOytjYGjumEs6lAzYMKFArr4qfnFWAlIA2WI1OKTdPdivrCwRzO+ZpvaI+galMP
         5KJG30T1mEo5871ek0QdI+MK7ArIyUPhkVH3WxVaA4bO63KBdGVDBWJKiixrSGF1hMma
         OGYImeJjCoiaur28M68obqDlnKrkQv2ykwmTOiE2APMmeLgcK705RAxjIENF23D6GW6D
         JHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qb+jhDVtLJWSCULCC42BGPGlgm/IACOEKH/ETM7f5K8=;
        b=vkm03AFk7LFxleV47f9ZE2qViksVGm4o6WQVUL0/Mi+3KbD5zVPptvkzkzdLCXmT76
         YM5iRiKFayife5o6LktDPeQkm0DEWFVBLPc0d+Aav6VCiEL5bsf4lArfBY/Yb8ZtD8NA
         4HRtw4u2aSclR85skf96MRhwvjf0lSaoKh/Mk01b2Vkpk3puAl3yJpmSGobKY3RrTuUl
         ZqOhqor+wCAORg9nlS9F0xhQ1Z0p/vT4QtwP/PPitV1MDO1Goh86giJhTJHHe2mzpLga
         A9GB0slyguuERZVPXmSjON3nhBtMu9sAoeYjUknSPFAiafM9Bvq4LvVucwqc9zXiybAO
         Z9Jw==
X-Gm-Message-State: AOAM533AUd3nRXGJvwEczgo4qaMeDcn8kPgf0Nb2xHh0JW5GvWFUKrve
        qHW5M4UyTQFrQgxVhsLCDY4dSIYXi33jSSnROiHfcfpw
X-Google-Smtp-Source: ABdhPJwkyqQ+XsxNW6aYadEuVczI21XvtV6eAhRVltNPm/ECXLWChLT26iDZ0bphcJU7z3hoXNrOUN+JGUUHg6Qxo0Y=
X-Received: by 2002:adf:a543:0:b0:1ee:4a2b:fe6 with SMTP id
 j3-20020adfa543000000b001ee4a2b0fe6mr13570146wrb.120.1646036116075; Mon, 28
 Feb 2022 00:15:16 -0800 (PST)
MIME-Version: 1.0
References: <dbb69fc2-d46f-ee91-d089-46e7370a2a14@gmail.com>
 <164570696256.4066078.10553504447380276248@Monstersaurus> <CAPuf0ENRRjMafZUOXS45PJxQrpcK_tdCRREoHn43t54pSbVhDg@mail.gmail.com>
 <411433596.ldbydfAV7o@phil> <CAPybu_2ZwYBLy13KAbznErGU-2=hLcot081WE7ZLZbZaEwC0ag@mail.gmail.com>
 <dc0a22f7-80c3-12b9-d3ec-38fdf51e374c@gmail.com>
In-Reply-To: <dc0a22f7-80c3-12b9-d3ec-38fdf51e374c@gmail.com>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Mon, 28 Feb 2022 09:15:00 +0100
Message-ID: <CAPybu_0j6csK29_LNDZwmu2Xxs+tLPD3QGqxktgpj-=BKO8G-A@mail.gmail.com>
Subject: Re: RockPro65 RK3399 chipset, ISP and IMX214 camera
To:     Clemens Arth <clemens.arth@gmail.com>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Feb 27, 2022 at 5:50 PM Clemens Arth <clemens.arth@gmail.com> wrote=
:
>
> Hi,
>
> so I moved on with some tests and trying to fix the driver and the
> current libcamera version. The driver has still wrong registers I guess,
> but I can fix them later. Here's the output of v4l-ctl
>
> https://pastebin.com/ZkMZ1mjJ
>
> which looks kind of ok to me. However what does absolutely make no sense
> to me is the output of the gst-launcher, which also makes lc_compliance
> go totally crazy at some point:
>
> https://pastebin.com/6MdFL5BL
>
> Although I dived through a large number of drivers, I did not get how to
> set the available formats. While Ricardo included 2 formats, there are
> obviously 6 or so according to the documentation, however, how are those
> defined such that they show up correctly there? It's clear to me that
> the available formats should be defined first, before moving on to
> getting something out from the device, right? Is this a part of the
> libcamera part or the driver?

I had limited access to the doc, so most of the register setting come
from comparing with other sensors and from 3rd party drivers (nvidia
kernel)

Also my isp only supported the 2 formats that I added support to.

>
> I had to add quite a bunch of controls to the driver, and without
> checking the i2c communication in detail, there are at least no errors
> when I do
>
> v4l2-ctl -d /dev/v4l-subdev3 --set-ctrl "test_pattern=3D2"
>
> So I suspect that this actually works as expected...
>
> Best
> Clemens
>
>
> Am 25.02.22 um 08:37 schrieb Ricardo Ribalda Delgado:
> > Hi
> >
> > I think Heiko and Kieran have already given you a lot of clues.
> >
> > I would recommend to start looking at i2c communication with i2c
> > tools: i2cget, i2set, i2cdetect.... before trying any video operation.
> >
> > Your life will be much easier if you get your hands into a logic
> > analyser like this one https://www.saleae.com/
> >
> > Regarding the i2c address, bear in mind that vendors and Linux might
> > use different nomenclature (7 bits to 8 bits).
> >
> > Good luck!
> >
> > On Thu, Feb 24, 2022 at 6:03 PM Heiko Stuebner <heiko@sntech.de> wrote:
> >>
> >> Am Donnerstag, 24. Februar 2022, 16:10:06 CET schrieb Clemens Arth:
> >>> Hi Kieran,
> >>>
> >>> Thx, I=E2=80=99m on my mobile now so I hope copy pasting works=E2=80=
=A6 apologies for typos=E2=80=A6
> >>>
> >>> Kieran Bingham <kieran.bingham@ideasonboard.com> schrieb am Do. 24. F=
eb.
> >>> 2022 um 13:49:
> >>>
> >>>> Hi Clemens,
> >>>>
> >>>> Quoting Clemens Arth (2022-02-23 18:36:28)
> >>>>> Hi everyone,
> >>>>>
> >>>>> + Ricardo and Heiko in CC as the driver originators and rockchip pr=
os...
> >>>>>
> >>>>> I'm reaching out to you based on a discussion with Sebastian Fricke=
, who
> >>>>> was working on the OV13850 driver for the v5 kernel. I tried gettin=
g the
> >>>>> IMX214 finally to work on the RockPro64 from Pine64, which only wor=
ks on
> >>>>> Android so far and I need to get that done on Mainline Linux (I did=
 not
> >>>>> find anyone who managed that and reported about it). However, I'm a=
lso
> >>>>> totally stuck.
> >>>>>
> >>>>> The RockPro64 runs Dietpi, which is essentially Armbian + a few twe=
aks.
> >>>>> I'm using the Armbian 5.15.18 kernel, so mainline, with a custom de=
vice
> >>>>> tree, which in the first place powers the MIPI ports. I suspect it =
is a
> >>>>> bad idea to have one pinctrl as a placeholder for 4 converters, how=
ever,
> >>>>> I'm not too deep into proxying in the devicetree, so here's the cur=
rent
> >>>>> status:
> >>>>>
> >>>>> https://pastebin.com/vs277ex0
> >>>>
> >>>> Your regulators are all listed as fixed-regulators. Are you sure
> >>>> there's nothing else to turn on ? I expect this was from another
> >>>> fragement for the same platform? So I hope it's consistent.
> >>>>
> >>>
> >>> The schematics are here, from which I took the regulator and gpio con=
fig.
> >>> The regulators all seem to be fixed ones. There is just one pin that =
pulls
> >>> up all the regulators (DVP_PWR).
> >>>
> >>> https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
> >>>
> >>> The IMX214 driver has only one pin, the enable_pin, but it is somewha=
t
> >>> different from the IMX219 for example. Looking at both driver's code =
I
> >>> believe what is the reset_pin with the IMX219 is the enable_pin with =
the
> >>> IMX214, but I am not sure about that. There is no MIPI reset on the
> >>> RockPro64 afaik. Therefore I think it needs to be wired to the DVP_PD=
N0_H
> >>> pin, but other drivers define that one specifically and it apparently=
 does
> >>> something different.
> >>
> >> For the pins also check the direction (active_low / active_high).
> >> I remember having fun somewhere when changing between the vendor
> >> kernel and mainline.
> >>
> >>
> >>>> Can you validate that the enable-gpios definition is to the correct =
GPIO
> >>>> to enable the camera ?
> >>>>
> >>>>> The camera is connected to the first MIPI port. The kernel boot log=
s
> >>>>> look ok to me (except for the cyclic dependency issue, but I think =
that
> >>>>> does not matter much).
> >>>>>
> >>>>> https://pastebin.com/hvhdEfxm
> >>>>>
> >>>>> Without the camera configured in the device tree, it shows up as 0x=
0c
> >>>>> device on the #1 I2C bus, which is a bit suspicious to me given the
> >>>>> addresses in the documentation and the info given in the kernel
> >>>>> documentation.
> >>>>>
> >>>>> However, I essentially followed the description according to this g=
uide
> >>>>> to set up the RKISP:
> >>>>>
> >>>>> https://linuxtv.org/downloads/v4l-dvb-apis/admin-guide/rkisp1.html
> >>>>>
> >>>>> using this:
> >>>>>
> >>>>> https://pastebin.com/ZqWC5vhC
> >>>>>
> >>>>> It looks like this (see also png attached).
> >>>>>
> >>>>> https://pastebin.com/MfTNp5Pd
> >>>>>
> >>>>> However, the IMX214 driver does not complain until that point and s=
eems
> >>>>> to do right. I expected that at least something happens, however it=
 does
> >>>>> not. The last command does this:
> >>>>>
> >>>>> VIDIOC_STREAMON returned -1 (No such device or address) and this is=
 the
> >>>>> kernel output
> >>>>>
> >>>>> [1509.435228] imx214 1-000c: write_table error: -6
> >>>>> [1509.435868] imx214 1-000c: could not sent common table -6
> >>>>
> >>>> -6 is ENXIO 6 No such device or address. So I expect the device isn'=
t
> >>>> responding to the I2C controller.
> >>>>
> >>>> What shows up with i2c-detect -r -y 1 ?
> >>>>
> >>>
> >>>  From the top of my head, it shows 1c on the 0x0c address iirc, but o=
nly if
> >>> I remove the IMX from the DT. Otherwise the driver takes over and it =
shows
> >>> UU. I removed the camera physically and it was gone on i2cdetect, so =
I
> >>> suspect that it indeed is the camera. From the driver and the documen=
tation
> >>> I need to configure it 4-lane, as it is hardcoded in the driver (comp=
ared
> >>> to the application notes for registers for the ImX214).
> >>>
> >>>
> >>>>
> >>>>> There is no more info given, even if I do some "echo 0x3F >
> >>>>> /sys/class/video4linux/v4l-subdev0/dev_debug" to the subdevs.
> >>>>>
> >>>>> Here's the IMX214 documentation btw. that I got through a detour fr=
om
> >>>> CSDN.
> >>>>>
> >>>>>
> >>>> https://www.dropbox.com/sh/5d3mp2akr3kmu7t/AADaAsSxZu2kVSIfEceStwuoa=
?dl=3D0
> >>>>>
> >>>>> I'm not entirely sure, but there is something wrong somewhere and I
> >>>>> can't find out if it is with the driver, the RKISP or anything else=
.
> >>>>> Here's what "v4l2-ctl -d /dev/v4l-subdev3 --all" gives - not sure b=
ut
> >>>>> shouldn't it show supported resolutions or something?
> >>>>>
> >>>>> https://pastebin.com/ckAFPbAs
> >>>>
> >>>> You might find it useful to check what is missing to support libcame=
ra
> >>>> with this sensor, then you can use cam/qcam to test it too. The RKIS=
P1
> >>>> pipeline handler in libcamera will handle all the media controller
> >>>> configuration, and identifying the available formats for you, but we
> >>>> haven't had an IMX214 sensor added yet, so you might need to add a
> >>>> mapping to the src/libcamera/camera_sensor_properties.cpp sensor
> >>>> database, and the driver is missing at least V4L2_CID_HBLANK and
> >>>> V4L2_CID_VBLANK that are required for libcamera.  So it might not be=
 as
> >>>> straightforward as I'd like, but it would be helpful I expect.
> >>>
> >>>
> >>> I tried that at an earlier stage, to no avail unfortunately. But I wi=
ll try
> >>> again as soon as I get back to my desk.
> >>>
> >>>>
> >>>>
> >>>> But ... I think your issues are more likely underlying hardware or D=
T
> >>>> issues, as the device sounds like it's not responding on the i2c
> >>>> address.
> >>>>
> >>>> Sometimes I2C devices have a configurable address, can you check if =
this
> >>>> really is the correct I2C address for your camera?
> >>>>
> >>>> That=E2=80=99s one of the issues. Ricardo wrote about iirc 0x10 and =
0x1a, but the
> >>> app note says something entirely different (forgot), and my camera ap=
pears
> >>> to be on yet another address=E2=80=A6
> >>
> >> not specific to cameras, but in the past I had i2c devices that set th=
e
> >> address depending on the state of a gpio during powerup - which was
> >> floating in my old case, producing random settings ;-) .
> >>
> >>
> >> Heiko
> >>
> >>
> >
> >
>


--=20
Ricardo Ribalda
