Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714C7759C5B
	for <lists+linux-media@lfdr.de>; Wed, 19 Jul 2023 19:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjGSR2M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Jul 2023 13:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjGSR2L (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Jul 2023 13:28:11 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60760BB
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 10:28:09 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b703caf344so105895121fa.1
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 10:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689787687; x=1692379687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xu9L4jaQw+ttob7Or1nQfXqlcyUn7EL+2b1xZsJNM3M=;
        b=1eSE8qTANyFaXn4x6W8QVUV3+MqmFHzGQNI05j6XF613XkuL7qfZy8jPNt47ar8QOY
         FDcvlns7+qblP+Yx+U5cYkupJTZS0O18+dymPvkzxMcGxmwcZjh8Bc1gsa34yio0PrDt
         RZpxmzKxzmZIZJb4GmTVtJ9WACbRu7S9pbtNWAuu7y5RH+wbVWC+PHJLHY+FbjLvZiZl
         TZgZAgvNu132xLbrld87SqG0fjO3YBtN1VAZWfyWr+y7QGu1jV8es92g01WfvmmEuJsu
         JvFduG17DB7ijxnpf00JF4U4vEdI2R1bFtcuyVS9s7QGrlzoOB31C1Gs4mQjMQ98M47E
         XiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689787687; x=1692379687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu9L4jaQw+ttob7Or1nQfXqlcyUn7EL+2b1xZsJNM3M=;
        b=FWTnAWQiCXlaFIiV3zDy0kzjSDtTIzfVYWWkq5V3O70yedzfhKIg7qKurzFg7H7byB
         p+db18Hixh9L0ekB6Cg4nZEYUda0NdZoXurnSFqxCnKzTDZm0JpAbSNZSFzXsnAJOLXO
         /ZBHV/kaI08falJnxE7A8PDGK22WxZ9Yuozhcy7NUdgPxl0OtnNMqX6iD057pAP6MTlU
         QxVd+vxE8eMrai0HSwr6u0RKX+vVJ5rshHHckwbblkoEqtxrZ+vJRBxw+sw0BDA8TLxz
         7rV3SJ2zOy76FSD6T9UmkYj1erbuZh8D5/HMKqnUED2X9mx+1GvejKR+BR48Cix9RXez
         AoQg==
X-Gm-Message-State: ABy/qLb5sQM4Z0OiyesARkdTGd2QeF74wbV1tEqhRsdoUUDWbzXejtFA
        Det7A52LzN5mt4Ibl6wISpZ8oWOLBPFo5bhaSQKPGw==
X-Google-Smtp-Source: APBJJlH4RMTMVsYFM0blC+ym/hbqcnglagcoLlzuQbYhFX3Dt7iNhQ7nYEr5ZaE1oAHuVNf4pRP1NmgukRpKQHIUtQU=
X-Received: by 2002:a2e:9e96:0:b0:2b6:cb55:72bc with SMTP id
 f22-20020a2e9e96000000b002b6cb5572bcmr477150ljk.1.1689787687538; Wed, 19 Jul
 2023 10:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
 <2290635.ElGaqSPkdT@steina-w>
In-Reply-To: <2290635.ElGaqSPkdT@steina-w>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 19 Jul 2023 10:27:54 -0700
Message-ID: <CAJ+vNU0_LwY+4_9LT7-Cin4Otv3ne20N72TdsfzV4odEMQrLOg@mail.gmail.com>
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
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 17, 2023 at 2:57=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi Tim,
>
> Am Freitag, 14. Juli 2023, 03:34:15 CEST schrieb Tim Harvey:
> > Alexander,
> >
> > I found that commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get
> > rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") introduced
> > an issue causing me to not be able to capture anymore on an imx8mm
> > with an imx219 camera.
> >
> > I'm using a RaspberryPi Camera v2 which has an IMX219 8MP camera module=
:
> > - https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
> > - has its own on-board 24MHz osc so no clock required from baseboard
> > - pin 11 enables 1.8V and 2.8V LDO which is connected to a GPIO I use
> > as a regulator enable
> >
> > I'm using the imx8mm-venice-gw72xx-0x-imx219 dt overlay [1] to test thi=
s.
> >
> > Here is some additional information about how I'm using the camera modu=
le:
> > # cat /sys/bus/media/devices/media*/model
> > imx-media
> > hantro-vpu
> > hantro-vpu
> > # cat /sys/class/video4linux/video*/name
> > csi capture
> > nxp,imx8mm-vpu-g1-dec
> > nxp,imx8mq-vpu-g2-dec
> > # enable imx219 to csi link
> > media-ctl --reset
> > media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
> > # configure for 640x480 raw8
> > media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
> > media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480 field:n=
one]"
> > media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
> > # configure for RGGB (8-bit bayer), 640x480 resolution
> > v4l2-ctl --device /dev/video0
> > --set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbose
> >
> > before commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get rid of
> > superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") this would report
> > back 640x480 resolution:
> > VIDIOC_QUERYCAP: ok
> > VIDIOC_G_FMT: ok
> > VIDIOC_S_FMT: ok
> > Format Video Capture:
> >         Width/Height      : 640/480
> >         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
> >         Field             : None
> >         Bytes per Line    : 640
> >         Size Image        : 307200
> >         Colorspace        : Default
> >         Transfer Function : Default (maps to Rec. 709)
> >         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> >         Quantization      : Default (maps to Full Range)
> >         Flags             :
> >
> > And after the commit it reports back an invalid 768x480 resolution:
> > VIDIOC_QUERYCAP: ok
> > VIDIOC_G_FMT: ok
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
> >         Flags             :
> >
> > This resolution and frame size mis-match causes issues for example
> > when using gstreamer to capture and stream frames.
>
> Oh, that's weird. Can you check what the call to v4l_bound_align_image()
> inside __imx7_csi_video_try_fmt() is actually doing? Check walign, width
> before and after the call. From a glance that seems to be the only way wi=
dth
> could be modified.
>

with debugging added in __imx7_csi_video_try_fmt:

root@jammy-venice:~# dmesg | grep csi
[    0.038495] platform 32e30000.mipi-csi: Fixed dependency cycle(s)
with /soc@0/bus@32c00000/csi@32e20000/port/endpoint
[    1.195055] __imx7_csi_video_try_fmt walign=3D4 bpp=3D16 640/480
[    1.200746] __imx7_csi_video_try_fmt walign=3D4 bpp=3D16
bytesperline=3D1280 sizeimage=3D614400 640/480
[    1.209633] imx7-csi 32e20000.csi: Registered csi capture as /dev/video0
[    1.775321] i2c 2-0010: Fixed dependency cycle(s) with
/soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
[    2.010372] imx-mipi-csis 32e30000.mipi-csi: lanes: 2, freq: 333000000
^^^ this is kernel init and looks fine

# media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
# media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
# media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480 field:non=
e]"
# media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
^^^ nothing changes here during link config (no calls to
__imx7_csi_video_try_fmt)

# v4l2-ctl --device /dev/video0
--set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbose
VIDIOC_QUERYCAP: ok
[  120.367874] __imx7_csi_video_try_fmt walign=3D8 bpp=3D8 640/480
^^^ before calling v4l_bound_align_image()

VIDIOC_G_FMT: ok
[  120.374974] __imx7_csi_video_try_fmt walign=3D8 bpp=3D8
bytesperline=3D768 sizeimage=3D368640 768/480
^^^ after calling v4l_bound_align_image() width is changed from 640 to 768

VIDIOC_S_FMT: ok
Format Video Capture:
        Width/Height      : 768/480
        Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
        Field             : None
        Bytes per Line    : 768
        Size Image        : 368640
        Colorspace        : Default
        Transfer Function : Default (maps to Rec. 709)
        YCbCr/HSV Encoding: Default (maps to ITU-R 601)
        Quantization      : Default (maps to Full Range)
        Flags             :


> > I noticed you have several outstanding patches pending for
> > imx7-media-csi... perhaps there is something there you already know of
> > that addresses this issue?
>
> There nothing pending AFAICS. Everything has been integrated into linux-n=
ext
> at least.

v6.5-rc2 shows the issue I've been discussing but linux-next
next-20230718 doesn't even probe mipi-csi and I'm not clear why yet:

with linux-next next-20230718:
# dmesg | grep csi
[    1.172711] imx7-csi 32e20000.csi: Registered csi capture as /dev/video0
[    1.179674] imx7-csi 32e20000.csi: error -ENOTCONN: Failed to get
remote endpoint
[    1.187513] imx7-csi: probe of 32e20000.csi failed with error -107
[    1.757693] i2c 2-0010: Fixed dependency cycle(s) with
/soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
[   16.352048] platform 32e30000.mipi-csi: deferred probe pending
# cat /sys/kernel/debug/devices_deferred
32e30000.mipi-csi       platform: wait for supplier
/soc@0/bus@32c00000/csi@32e20000/port/endpoint

In this tree both drivers/media/i2c/imx219.c and
drivers/media/platform/nxp/imx7-media-csi.c are at the same patch
level and I'm not sure what else is involved here to look at.

It seems mipi-dsi and mipi-csi are extremely fragile and require
constant regression testing unfortunately.

best regards,

Tim
