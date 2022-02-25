Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021F84C3F1E
	for <lists+linux-media@lfdr.de>; Fri, 25 Feb 2022 08:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238148AbiBYHh4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Feb 2022 02:37:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238178AbiBYHhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Feb 2022 02:37:51 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0254814ACB4
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 23:37:19 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i20so1127764wmc.3
        for <linux-media@vger.kernel.org>; Thu, 24 Feb 2022 23:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fzGzJx0/bvJ2pJSzxEhwaZcfAv71SDdEfYQBlnrVjmM=;
        b=LAcUsDM519Ui1PvvA5cJ+oTBO9mtEz941xyyotKiAuhNPzXpx2wAynWLWAse7G69JP
         s87P09ox15/m6/tp8E5xpAea5NG3rusnsuJgBuwwApTZJO8nGBxJWQqu4bUKquJkP8+Y
         JEkWnR5vQZ4TmAzg0jOrOopi64trDkR5DSKbhtdoKHCvaCZDWUhJfPdpP5l9OdgzjJ0l
         1Ll0swsEOOP6i2Hi5Z7yDxSM2cV+BNVBDsTJ2jQAyVFghQgV+0l8Zw3/awJVH5PfWIw2
         aEc5KGvHLyfUIKLyRDsj+fpT/Dg4jD3Pe00o2urzOQyjX1PVvzIG/LGGDIJmgTRSQJtQ
         N2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fzGzJx0/bvJ2pJSzxEhwaZcfAv71SDdEfYQBlnrVjmM=;
        b=2zwSDPbOHaTL1UP7hiQ3FUl41vy3ByXUNeGBF6C/ILGuJ2Gj6grxyq86ffMtrm01cg
         WUAHJ29bqN2zRzLzLfKLx83JUq+W7dKSqA1WBIqGo8kObZ0xJOsaih1+sk4c+6rVb+GD
         /IkWMzp15hoy5K/HGG90xPUQPi5G4a/54Vc216oRWazFt4QonpdALmIunHsr2dX1GLTd
         g3jg86lFxuBS5/3lyL24BNHrMMHBQ7O1Ulal+zRfOtIyP1hAAd2eecWYWzFKKICWKRsB
         KRD2aLxtNzQrrhdqhZSoHUY1HH4aphgmrJeZdIH3+5zc5fOzz7K1lyl9G19o/vndVngv
         GSfw==
X-Gm-Message-State: AOAM531uG6hhu2l8iX41VnHOdDA8RbasdsW1Qcwpi5QJuFWWshIz1lEY
        ezdG2OPn7SGiK+QoqdWRCZStSYVSxAUFNocgG/lYisHx4Vk=
X-Google-Smtp-Source: ABdhPJzaPJw74idpxdwW15+jioeTu2okntltq5po3envMKBEMgZNMaOumhf1IDGL5e6RpclwgSuaQfpTVdmnCdjMIrQ=
X-Received: by 2002:a7b:cc8f:0:b0:37b:dcdf:cf40 with SMTP id
 p15-20020a7bcc8f000000b0037bdcdfcf40mr1515459wma.99.1645774637171; Thu, 24
 Feb 2022 23:37:17 -0800 (PST)
MIME-Version: 1.0
References: <dbb69fc2-d46f-ee91-d089-46e7370a2a14@gmail.com>
 <164570696256.4066078.10553504447380276248@Monstersaurus> <CAPuf0ENRRjMafZUOXS45PJxQrpcK_tdCRREoHn43t54pSbVhDg@mail.gmail.com>
 <411433596.ldbydfAV7o@phil>
In-Reply-To: <411433596.ldbydfAV7o@phil>
From:   Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date:   Fri, 25 Feb 2022 08:37:00 +0100
Message-ID: <CAPybu_2ZwYBLy13KAbznErGU-2=hLcot081WE7ZLZbZaEwC0ag@mail.gmail.com>
Subject: Re: RockPro65 RK3399 chipset, ISP and IMX214 camera
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Clemens Arth <clemens.arth@gmail.com>,
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

Hi

I think Heiko and Kieran have already given you a lot of clues.

I would recommend to start looking at i2c communication with i2c
tools: i2cget, i2set, i2cdetect.... before trying any video operation.

Your life will be much easier if you get your hands into a logic
analyser like this one https://www.saleae.com/

Regarding the i2c address, bear in mind that vendors and Linux might
use different nomenclature (7 bits to 8 bits).

Good luck!

On Thu, Feb 24, 2022 at 6:03 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Donnerstag, 24. Februar 2022, 16:10:06 CET schrieb Clemens Arth:
> > Hi Kieran,
> >
> > Thx, I=E2=80=99m on my mobile now so I hope copy pasting works=E2=80=A6=
 apologies for typos=E2=80=A6
> >
> > Kieran Bingham <kieran.bingham@ideasonboard.com> schrieb am Do. 24. Feb=
.
> > 2022 um 13:49:
> >
> > > Hi Clemens,
> > >
> > > Quoting Clemens Arth (2022-02-23 18:36:28)
> > > > Hi everyone,
> > > >
> > > > + Ricardo and Heiko in CC as the driver originators and rockchip pr=
os...
> > > >
> > > > I'm reaching out to you based on a discussion with Sebastian Fricke=
, who
> > > > was working on the OV13850 driver for the v5 kernel. I tried gettin=
g the
> > > > IMX214 finally to work on the RockPro64 from Pine64, which only wor=
ks on
> > > > Android so far and I need to get that done on Mainline Linux (I did=
 not
> > > > find anyone who managed that and reported about it). However, I'm a=
lso
> > > > totally stuck.
> > > >
> > > > The RockPro64 runs Dietpi, which is essentially Armbian + a few twe=
aks.
> > > > I'm using the Armbian 5.15.18 kernel, so mainline, with a custom de=
vice
> > > > tree, which in the first place powers the MIPI ports. I suspect it =
is a
> > > > bad idea to have one pinctrl as a placeholder for 4 converters, how=
ever,
> > > > I'm not too deep into proxying in the devicetree, so here's the cur=
rent
> > > > status:
> > > >
> > > > https://pastebin.com/vs277ex0
> > >
> > > Your regulators are all listed as fixed-regulators. Are you sure
> > > there's nothing else to turn on ? I expect this was from another
> > > fragement for the same platform? So I hope it's consistent.
> > >
> >
> > The schematics are here, from which I took the regulator and gpio confi=
g.
> > The regulators all seem to be fixed ones. There is just one pin that pu=
lls
> > up all the regulators (DVP_PWR).
> >
> > https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
> >
> > The IMX214 driver has only one pin, the enable_pin, but it is somewhat
> > different from the IMX219 for example. Looking at both driver's code I
> > believe what is the reset_pin with the IMX219 is the enable_pin with th=
e
> > IMX214, but I am not sure about that. There is no MIPI reset on the
> > RockPro64 afaik. Therefore I think it needs to be wired to the DVP_PDN0=
_H
> > pin, but other drivers define that one specifically and it apparently d=
oes
> > something different.
>
> For the pins also check the direction (active_low / active_high).
> I remember having fun somewhere when changing between the vendor
> kernel and mainline.
>
>
> > > Can you validate that the enable-gpios definition is to the correct G=
PIO
> > > to enable the camera ?
> > >
> > > > The camera is connected to the first MIPI port. The kernel boot log=
s
> > > > look ok to me (except for the cyclic dependency issue, but I think =
that
> > > > does not matter much).
> > > >
> > > > https://pastebin.com/hvhdEfxm
> > > >
> > > > Without the camera configured in the device tree, it shows up as 0x=
0c
> > > > device on the #1 I2C bus, which is a bit suspicious to me given the
> > > > addresses in the documentation and the info given in the kernel
> > > > documentation.
> > > >
> > > > However, I essentially followed the description according to this g=
uide
> > > > to set up the RKISP:
> > > >
> > > > https://linuxtv.org/downloads/v4l-dvb-apis/admin-guide/rkisp1.html
> > > >
> > > > using this:
> > > >
> > > > https://pastebin.com/ZqWC5vhC
> > > >
> > > > It looks like this (see also png attached).
> > > >
> > > > https://pastebin.com/MfTNp5Pd
> > > >
> > > > However, the IMX214 driver does not complain until that point and s=
eems
> > > > to do right. I expected that at least something happens, however it=
 does
> > > > not. The last command does this:
> > > >
> > > > VIDIOC_STREAMON returned -1 (No such device or address) and this is=
 the
> > > > kernel output
> > > >
> > > > [1509.435228] imx214 1-000c: write_table error: -6
> > > > [1509.435868] imx214 1-000c: could not sent common table -6
> > >
> > > -6 is ENXIO 6 No such device or address. So I expect the device isn't
> > > responding to the I2C controller.
> > >
> > > What shows up with i2c-detect -r -y 1 ?
> > >
> >
> > From the top of my head, it shows 1c on the 0x0c address iirc, but only=
 if
> > I remove the IMX from the DT. Otherwise the driver takes over and it sh=
ows
> > UU. I removed the camera physically and it was gone on i2cdetect, so I
> > suspect that it indeed is the camera. From the driver and the documenta=
tion
> > I need to configure it 4-lane, as it is hardcoded in the driver (compar=
ed
> > to the application notes for registers for the ImX214).
> >
> >
> > >
> > > > There is no more info given, even if I do some "echo 0x3F >
> > > > /sys/class/video4linux/v4l-subdev0/dev_debug" to the subdevs.
> > > >
> > > > Here's the IMX214 documentation btw. that I got through a detour fr=
om
> > > CSDN.
> > > >
> > > >
> > > https://www.dropbox.com/sh/5d3mp2akr3kmu7t/AADaAsSxZu2kVSIfEceStwuoa?=
dl=3D0
> > > >
> > > > I'm not entirely sure, but there is something wrong somewhere and I
> > > > can't find out if it is with the driver, the RKISP or anything else=
.
> > > > Here's what "v4l2-ctl -d /dev/v4l-subdev3 --all" gives - not sure b=
ut
> > > > shouldn't it show supported resolutions or something?
> > > >
> > > > https://pastebin.com/ckAFPbAs
> > >
> > > You might find it useful to check what is missing to support libcamer=
a
> > > with this sensor, then you can use cam/qcam to test it too. The RKISP=
1
> > > pipeline handler in libcamera will handle all the media controller
> > > configuration, and identifying the available formats for you, but we
> > > haven't had an IMX214 sensor added yet, so you might need to add a
> > > mapping to the src/libcamera/camera_sensor_properties.cpp sensor
> > > database, and the driver is missing at least V4L2_CID_HBLANK and
> > > V4L2_CID_VBLANK that are required for libcamera.  So it might not be =
as
> > > straightforward as I'd like, but it would be helpful I expect.
> >
> >
> > I tried that at an earlier stage, to no avail unfortunately. But I will=
 try
> > again as soon as I get back to my desk.
> >
> > >
> > >
> > > But ... I think your issues are more likely underlying hardware or DT
> > > issues, as the device sounds like it's not responding on the i2c
> > > address.
> > >
> > > Sometimes I2C devices have a configurable address, can you check if t=
his
> > > really is the correct I2C address for your camera?
> > >
> > > That=E2=80=99s one of the issues. Ricardo wrote about iirc 0x10 and 0=
x1a, but the
> > app note says something entirely different (forgot), and my camera appe=
ars
> > to be on yet another address=E2=80=A6
>
> not specific to cameras, but in the past I had i2c devices that set the
> address depending on the state of a gpio during powerup - which was
> floating in my old case, producing random settings ;-) .
>
>
> Heiko
>
>


--=20
Ricardo Ribalda
