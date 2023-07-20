Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F94E75B215
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 17:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbjGTPMc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 11:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbjGTPMb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 11:12:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0657BB
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 08:12:29 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-997c4107d62so141882366b.0
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689865948; x=1690470748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GtuYt0+Dr45nQi8XDUNHzk0X6HM2ugKnWuoSLghsR4=;
        b=G2CzXqgY+Z8RavgVXuXsPlzqRAk3ZRmOMP33nN4GxGYd3I5TY31NDVa8HPOm6xUB66
         6CsFrW8apJipmu/f6AuUOdIIi/hR4XGFZ9oGyhqpj3cXuZJ07+vIKbOrn0ZRXZEM3Uw1
         tmGuHXX3pm3REZ0VRF/G0XskpFBBMMHAKwBgNtEv2bTUJ8tFhlEsZpLj2xuSVAbxT1ES
         eoH8yFmM6WOLBQVR/e/2RODSwWyZj1bz2a4w++VpwKOUccmsp/xV0DIqKii1Bg259Tdi
         K6UXNs91caDwayoAyVXpCRr12TK84GhRG1jZnfZE0Q4hMQdkyqKwKborrM5B4DrlbvM7
         /YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689865948; x=1690470748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GtuYt0+Dr45nQi8XDUNHzk0X6HM2ugKnWuoSLghsR4=;
        b=d85HSNnaSEgjgvGgHG3AXa8gL3tWCLIA3pUgtxFefSF9ItSs69xY2bxDsLGdUhGKhB
         uaYqg6ROt1G2aGGgLFLyJajHve0BtS2+QaqeXdSyVI63WuwcBTR7jeNerPsn2lnk0/Ga
         DnpzI6tJ2TY36ZY4JZOxrn9z4M09aUyoR/G1aGHIXsF283uildI+EKZT8COnmIfxUrxt
         p1fWdzxhmxW/6KDkCMfjTQs7BeoOB//kwiq3oPues6yMLa8jy9kEsB034x/afZ/Zi+Qz
         If+v4TV6f5ndbcenOG4Frbh+PQlHHs8lqu5JRKlKQueCvxOxrOzLaN75VV1Tj21g0r+o
         1q8g==
X-Gm-Message-State: ABy/qLbzq4aTCzLLoTHurQDm04/eKIb0p+F9H3iTV4YUGlE34qv+qb/d
        BC179xb2aPqivrKrzGHn1oCJVNNc9023MKs5H71tXA==
X-Google-Smtp-Source: APBJJlEvcHRMN9MNHq7WGVOKfWCxr8Jah6K5Qps2kTXIbjlK/BKJIty8LBzNODZJcpGQOdxvuor5mmmeFerjmVnBri0=
X-Received: by 2002:a17:906:8a4e:b0:98e:f13:e908 with SMTP id
 gx14-20020a1709068a4e00b0098e0f13e908mr5237890ejc.60.1689865948105; Thu, 20
 Jul 2023 08:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
 <2290635.ElGaqSPkdT@steina-w> <CAJ+vNU0_LwY+4_9LT7-Cin4Otv3ne20N72TdsfzV4odEMQrLOg@mail.gmail.com>
 <844922189.0ifERbkFSE@steina-w>
In-Reply-To: <844922189.0ifERbkFSE@steina-w>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 20 Jul 2023 08:12:12 -0700
Message-ID: <CAJ+vNU21HytYLDojnPqLu8a9BRGRbMNgmGzdqbm67_5TYZT2tg@mail.gmail.com>
Subject: Re: media: imx: imx7-media-csi: Get rid of superfluous call to
 imx7_csi_mbus_fm t_to_pix_fmt
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 19, 2023 at 11:49=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Tim,
>
> Am Mittwoch, 19. Juli 2023, 19:27:54 CEST schrieb Tim Harvey:
> > On Mon, Jul 17, 2023 at 2:57=E2=80=AFAM Alexander Stein
> >
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi Tim,
> > >
> > > Am Freitag, 14. Juli 2023, 03:34:15 CEST schrieb Tim Harvey:
> > > > Alexander,
> > > >
> > > > I found that commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get
> > > > rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") introduce=
d
> > > > an issue causing me to not be able to capture anymore on an imx8mm
> > > > with an imx219 camera.
> > > >
> > > > I'm using a RaspberryPi Camera v2 which has an IMX219 8MP camera mo=
dule:
> > > > - https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pd=
f
> > > > - has its own on-board 24MHz osc so no clock required from baseboar=
d
> > > > - pin 11 enables 1.8V and 2.8V LDO which is connected to a GPIO I u=
se
> > > > as a regulator enable
> > > >
> > > > I'm using the imx8mm-venice-gw72xx-0x-imx219 dt overlay [1] to test
> > > > this.
> > > >
> > > > Here is some additional information about how I'm using the camera
> > > > module:
> > > > # cat /sys/bus/media/devices/media*/model
> > > > imx-media
> > > > hantro-vpu
> > > > hantro-vpu
> > > > # cat /sys/class/video4linux/video*/name
> > > > csi capture
> > > > nxp,imx8mm-vpu-g1-dec
> > > > nxp,imx8mq-vpu-g2-dec
> > > > # enable imx219 to csi link
> > > > media-ctl --reset
> > > > media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
> > > > # configure for 640x480 raw8
> > > > media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
> > > > media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480
> > > > field:none]" media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:non=
e]"
> > > > # configure for RGGB (8-bit bayer), 640x480 resolution
> > > > v4l2-ctl --device /dev/video0
> > > > --set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --ver=
bose
> > > >
> > > > before commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get rid o=
f
> > > > superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") this would repor=
t
> > > > back 640x480 resolution:
> > > > VIDIOC_QUERYCAP: ok
> > > > VIDIOC_G_FMT: ok
> > > > VIDIOC_S_FMT: ok
> > > >
> > > > Format Video Capture:
> > > >         Width/Height      : 640/480
> > > >         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
> > > >         Field             : None
> > > >         Bytes per Line    : 640
> > > >         Size Image        : 307200
> > > >         Colorspace        : Default
> > > >         Transfer Function : Default (maps to Rec. 709)
> > > >         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> > > >         Quantization      : Default (maps to Full Range)
> > > >
> > > >         Flags             :
> > > > And after the commit it reports back an invalid 768x480 resolution:
> > > > VIDIOC_QUERYCAP: ok
> > > > VIDIOC_G_FMT: ok
> > > > VIDIOC_S_FMT: ok
> > > >
> > > > Format Video Capture:
> > > >         Width/Height      : 768/480
> > > >         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
> > > >         Field             : None
> > > >         Bytes per Line    : 768
> > > >         Size Image        : 368640
> > > >         Colorspace        : Default
> > > >         Transfer Function : Default (maps to Rec. 709)
> > > >         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> > > >         Quantization      : Default (maps to Full Range)
> > > >
> > > >         Flags             :
> > > > This resolution and frame size mis-match causes issues for example
> > > > when using gstreamer to capture and stream frames.
> > >
> > > Oh, that's weird. Can you check what the call to v4l_bound_align_imag=
e()
> > > inside __imx7_csi_video_try_fmt() is actually doing? Check walign, wi=
dth
> > > before and after the call. From a glance that seems to be the only wa=
y
> > > width could be modified.
> >
> > with debugging added in __imx7_csi_video_try_fmt:
> >
> > root@jammy-venice:~# dmesg | grep csi
> > [    0.038495] platform 32e30000.mipi-csi: Fixed dependency cycle(s)
> > with /soc@0/bus@32c00000/csi@32e20000/port/endpoint
> > [    1.195055] __imx7_csi_video_try_fmt walign=3D4 bpp=3D16 640/480
> > [    1.200746] __imx7_csi_video_try_fmt walign=3D4 bpp=3D16
> > bytesperline=3D1280 sizeimage=3D614400 640/480
> > [    1.209633] imx7-csi 32e20000.csi: Registered csi capture as /dev/vi=
deo0
> > [    1.775321] i2c 2-0010: Fixed dependency cycle(s) with
> > /soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
> > [    2.010372] imx-mipi-csis 32e30000.mipi-csi: lanes: 2, freq: 3330000=
00
> > ^^^ this is kernel init and looks fine
> >
> > # media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
> > # media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
> > # media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480
> > field:none]" # media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]=
"
> > ^^^ nothing changes here during link config (no calls to
> > __imx7_csi_video_try_fmt)
> >
> > # v4l2-ctl --device /dev/video0
> > --set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbose
> > VIDIOC_QUERYCAP: ok
> > [  120.367874] __imx7_csi_video_try_fmt walign=3D8 bpp=3D8 640/480
> > ^^^ before calling v4l_bound_align_image()
> >
> > VIDIOC_G_FMT: ok
> > [  120.374974] __imx7_csi_video_try_fmt walign=3D8 bpp=3D8
> > bytesperline=3D768 sizeimage=3D368640 768/480
> > ^^^ after calling v4l_bound_align_image() width is changed from 640 to =
768
>
> So this call is the culprit, I noticed the important change to before. Th=
e
> alignment enforced in clamp_align(), called by v4l_bound_align_image(), i=
s a
> multiple of 2^align, _not_ a multiple of align. So obviously 640 is incre=
ased
> to the next multiple of 2^8 (256) which is 768. Can you give the followin=
g
> diff a try?

Yes, enforcing alignment of 2^8 is definitely not what we want.

>
> --8<--
> diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/
> platform/nxp/imx7-media-csi.c
> index 2f9302fc7570..a040665eca7c 100644
> --- a/drivers/media/platform/nxp/imx7-media-csi.c
> +++ b/drivers/media/platform/nxp/imx7-media-csi.c
> @@ -1137,9 +1137,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pi=
xfmt,
>          * TODO: Implement configurable stride support.
>          */
>         walign =3D 8 * 8 / cc->bpp;
> -       v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
> -                             &pixfmt->height, 1, 0xffff, 1, 0);
> -
> +       pixfmt->width =3D clamp_roundup(pixfmt->width, 1, 0xffff, walign)=
;
> +       pixfmt->height =3D clamp_roundup(pixfmt->width, 1, 0xffff, 1);
>         pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;
>         pixfmt->sizeimage =3D pixfmt->bytesperline * pixfmt->height;
>         pixfmt->field =3D V4L2_FIELD_NONE;
> --8<--

clamp_roundup is static in v4l2-common.c so it would have to be
something like the following:

        pixfmt->width =3D round_up(clamp(pixfmt->width, (unsigned int)1,
(unsigned int)0xffff), walign);
        pixfmt->height =3D round_up(clamp(pixfmt->height, (unsigned
int)1, (unsigned int)0xffff), walign);

the above works. I'm not sure how to keep the compiler from
complaining about types other than typecasting the min/max values as
above.

>
> Thanks and best regards,
> Alexander
>
> > VIDIOC_S_FMT: ok
> > Format Video Capture:
> >         Width/Height      : 768/480
> >         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
> >         Field             : None
> >         Bytes per Line    : 768
> >         Size Image        : 368640
> >         Colorspace        : Default
> >         Transfer Function : Default (maps to Rec. 709)
> >         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> >         Quantization      : Default (maps to Full Range)
> >
> >         Flags             :
> > > > I noticed you have several outstanding patches pending for
> > > > imx7-media-csi... perhaps there is something there you already know=
 of
> > > > that addresses this issue?
> > >
> > > There nothing pending AFAICS. Everything has been integrated into
> > > linux-next at least.
> >
> > v6.5-rc2 shows the issue I've been discussing but linux-next
> > next-20230718 doesn't even probe mipi-csi and I'm not clear why yet:
> >
> > with linux-next next-20230718:
> > # dmesg | grep csi
> > [    1.172711] imx7-csi 32e20000.csi: Registered csi capture as /dev/vi=
deo0
> > [    1.179674] imx7-csi 32e20000.csi: error -ENOTCONN: Failed to get
> > remote endpoint
> > [    1.187513] imx7-csi: probe of 32e20000.csi failed with error -107
> > [    1.757693] i2c 2-0010: Fixed dependency cycle(s) with
> > /soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
> > [   16.352048] platform 32e30000.mipi-csi: deferred probe pending
> > # cat /sys/kernel/debug/devices_deferred
> > 32e30000.mipi-csi       platform: wait for supplier
> > /soc@0/bus@32c00000/csi@32e20000/port/endpoint
> >
> > In this tree both drivers/media/i2c/imx219.c and
> > drivers/media/platform/nxp/imx7-media-csi.c are at the same patch
> > level and I'm not sure what else is involved here to look at.
> >
> > It seems mipi-dsi and mipi-csi are extremely fragile and require
> > constant regression testing unfortunately.
> >

have you tested mipi-csi with linux-next recently and observed it not
probing? I assume there is another issue awaiting us when linux-next
gets merged.

best regards,

Tim
