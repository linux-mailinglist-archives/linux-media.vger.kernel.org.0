Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B60975A6E4
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 08:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbjGTGtL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 02:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjGTGtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 02:49:10 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAEB12F
        for <linux-media@vger.kernel.org>; Wed, 19 Jul 2023 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689835744; x=1721371744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WZ3v3utVO0Zb95j6GDnt+exK2K/OuKT5kKWXUw3dTW4=;
  b=nigP4TAJzt4QYRmo5qkkENVPJeGXPn9vNtdI9m1OYkTAe14YY3trcVzh
   3QI4hu7bZu21hgvI4/fEhgkgtS8uhGswR0dVIhWbGK1X0diT3v9xvHANw
   C0aO0H5x6/AdxgexxxIxsiHxN9PLmKbnBXHkJY9+EXeS602t7dkNH/O/e
   LrctmpxkDpEkn5+P80N8mKToviPbO65Ifjqbo/Zv2TuzfJTpWctlXsIRd
   UOdr3gnM6gms/wjFSvQPgw3FEGR/bSjr4bTbeiqAAEhaL2glYHkQ9eZ67
   W80DJWqwyOI79Og4DYMGOOBsxZRmpreMqo7Q3jfVydZ1zVgGOtmNdAYAk
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,218,1684792800"; 
   d="scan'208";a="32023041"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 20 Jul 2023 08:49:01 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 57989280078;
        Thu, 20 Jul 2023 08:49:01 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Tim Harvey <tharvey@gateworks.com>
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
Subject: Re: media: imx: imx7-media-csi: Get rid of superfluous call to imx7_csi_mbus_fm t_to_pix_fmt
Date:   Thu, 20 Jul 2023 08:49:00 +0200
Message-ID: <844922189.0ifERbkFSE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAJ+vNU0_LwY+4_9LT7-Cin4Otv3ne20N72TdsfzV4odEMQrLOg@mail.gmail.com>
References: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com> <2290635.ElGaqSPkdT@steina-w> <CAJ+vNU0_LwY+4_9LT7-Cin4Otv3ne20N72TdsfzV4odEMQrLOg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

Am Mittwoch, 19. Juli 2023, 19:27:54 CEST schrieb Tim Harvey:
> On Mon, Jul 17, 2023 at 2:57=E2=80=AFAM Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi Tim,
> >=20
> > Am Freitag, 14. Juli 2023, 03:34:15 CEST schrieb Tim Harvey:
> > > Alexander,
> > >=20
> > > I found that commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get
> > > rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") introduced
> > > an issue causing me to not be able to capture anymore on an imx8mm
> > > with an imx219 camera.
> > >=20
> > > I'm using a RaspberryPi Camera v2 which has an IMX219 8MP camera modu=
le:
> > > - https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
> > > - has its own on-board 24MHz osc so no clock required from baseboard
> > > - pin 11 enables 1.8V and 2.8V LDO which is connected to a GPIO I use
> > > as a regulator enable
> > >=20
> > > I'm using the imx8mm-venice-gw72xx-0x-imx219 dt overlay [1] to test
> > > this.
> > >=20
> > > Here is some additional information about how I'm using the camera
> > > module:
> > > # cat /sys/bus/media/devices/media*/model
> > > imx-media
> > > hantro-vpu
> > > hantro-vpu
> > > # cat /sys/class/video4linux/video*/name
> > > csi capture
> > > nxp,imx8mm-vpu-g1-dec
> > > nxp,imx8mq-vpu-g2-dec
> > > # enable imx219 to csi link
> > > media-ctl --reset
> > > media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
> > > # configure for 640x480 raw8
> > > media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
> > > media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480
> > > field:none]" media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
> > > # configure for RGGB (8-bit bayer), 640x480 resolution
> > > v4l2-ctl --device /dev/video0
> > > --set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbo=
se
> > >=20
> > > before commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get rid of
> > > superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") this would report
> > > back 640x480 resolution:
> > > VIDIOC_QUERYCAP: ok
> > > VIDIOC_G_FMT: ok
> > > VIDIOC_S_FMT: ok
> > >=20
> > > Format Video Capture:
> > >         Width/Height      : 640/480
> > >         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
> > >         Field             : None
> > >         Bytes per Line    : 640
> > >         Size Image        : 307200
> > >         Colorspace        : Default
> > >         Transfer Function : Default (maps to Rec. 709)
> > >         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> > >         Quantization      : Default (maps to Full Range)
> > >=20
> > >         Flags             :
> > > And after the commit it reports back an invalid 768x480 resolution:
> > > VIDIOC_QUERYCAP: ok
> > > VIDIOC_G_FMT: ok
> > > VIDIOC_S_FMT: ok
> > >=20
> > > Format Video Capture:
> > >         Width/Height      : 768/480
> > >         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
> > >         Field             : None
> > >         Bytes per Line    : 768
> > >         Size Image        : 368640
> > >         Colorspace        : Default
> > >         Transfer Function : Default (maps to Rec. 709)
> > >         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
> > >         Quantization      : Default (maps to Full Range)
> > >=20
> > >         Flags             :
> > > This resolution and frame size mis-match causes issues for example
> > > when using gstreamer to capture and stream frames.
> >=20
> > Oh, that's weird. Can you check what the call to v4l_bound_align_image()
> > inside __imx7_csi_video_try_fmt() is actually doing? Check walign, width
> > before and after the call. From a glance that seems to be the only way
> > width could be modified.
>=20
> with debugging added in __imx7_csi_video_try_fmt:
>=20
> root@jammy-venice:~# dmesg | grep csi
> [    0.038495] platform 32e30000.mipi-csi: Fixed dependency cycle(s)
> with /soc@0/bus@32c00000/csi@32e20000/port/endpoint
> [    1.195055] __imx7_csi_video_try_fmt walign=3D4 bpp=3D16 640/480
> [    1.200746] __imx7_csi_video_try_fmt walign=3D4 bpp=3D16
> bytesperline=3D1280 sizeimage=3D614400 640/480
> [    1.209633] imx7-csi 32e20000.csi: Registered csi capture as /dev/vide=
o0
> [    1.775321] i2c 2-0010: Fixed dependency cycle(s) with
> /soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
> [    2.010372] imx-mipi-csis 32e30000.mipi-csi: lanes: 2, freq: 333000000
> ^^^ this is kernel init and looks fine
>=20
> # media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
> # media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
> # media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480
> field:none]" # media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
> ^^^ nothing changes here during link config (no calls to
> __imx7_csi_video_try_fmt)
>=20
> # v4l2-ctl --device /dev/video0
> --set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbose
> VIDIOC_QUERYCAP: ok
> [  120.367874] __imx7_csi_video_try_fmt walign=3D8 bpp=3D8 640/480
> ^^^ before calling v4l_bound_align_image()
>=20
> VIDIOC_G_FMT: ok
> [  120.374974] __imx7_csi_video_try_fmt walign=3D8 bpp=3D8
> bytesperline=3D768 sizeimage=3D368640 768/480
> ^^^ after calling v4l_bound_align_image() width is changed from 640 to 768

So this call is the culprit, I noticed the important change to before. The=
=20
alignment enforced in clamp_align(), called by v4l_bound_align_image(), is =
a=20
multiple of 2^align, _not_ a multiple of align. So obviously 640 is increas=
ed=20
to the next multiple of 2^8 (256) which is 768. Can you give the following=
=20
diff a try?

=2D-8<--
diff --git a/drivers/media/platform/nxp/imx7-media-csi.c b/drivers/media/
platform/nxp/imx7-media-csi.c
index 2f9302fc7570..a040665eca7c 100644
=2D-- a/drivers/media/platform/nxp/imx7-media-csi.c
+++ b/drivers/media/platform/nxp/imx7-media-csi.c
@@ -1137,9 +1137,8 @@ __imx7_csi_video_try_fmt(struct v4l2_pix_format *pixf=
mt,
         * TODO: Implement configurable stride support.
         */
        walign =3D 8 * 8 / cc->bpp;
=2D       v4l_bound_align_image(&pixfmt->width, 1, 0xffff, walign,
=2D                             &pixfmt->height, 1, 0xffff, 1, 0);
=2D
+       pixfmt->width =3D clamp_roundup(pixfmt->width, 1, 0xffff, walign);
+       pixfmt->height =3D clamp_roundup(pixfmt->width, 1, 0xffff, 1);
        pixfmt->bytesperline =3D pixfmt->width * cc->bpp / 8;
        pixfmt->sizeimage =3D pixfmt->bytesperline * pixfmt->height;
        pixfmt->field =3D V4L2_FIELD_NONE;
=2D-8<--

Thanks and best regards,
Alexander

> VIDIOC_S_FMT: ok
> Format Video Capture:
>         Width/Height      : 768/480
>         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
>         Field             : None
>         Bytes per Line    : 768
>         Size Image        : 368640
>         Colorspace        : Default
>         Transfer Function : Default (maps to Rec. 709)
>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>         Quantization      : Default (maps to Full Range)
>=20
>         Flags             :
> > > I noticed you have several outstanding patches pending for
> > > imx7-media-csi... perhaps there is something there you already know of
> > > that addresses this issue?
> >=20
> > There nothing pending AFAICS. Everything has been integrated into
> > linux-next at least.
>=20
> v6.5-rc2 shows the issue I've been discussing but linux-next
> next-20230718 doesn't even probe mipi-csi and I'm not clear why yet:
>=20
> with linux-next next-20230718:
> # dmesg | grep csi
> [    1.172711] imx7-csi 32e20000.csi: Registered csi capture as /dev/vide=
o0
> [    1.179674] imx7-csi 32e20000.csi: error -ENOTCONN: Failed to get
> remote endpoint
> [    1.187513] imx7-csi: probe of 32e20000.csi failed with error -107
> [    1.757693] i2c 2-0010: Fixed dependency cycle(s) with
> /soc@0/bus@32c00000/mipi-csi@32e30000/ports/port@0/endpoint
> [   16.352048] platform 32e30000.mipi-csi: deferred probe pending
> # cat /sys/kernel/debug/devices_deferred
> 32e30000.mipi-csi       platform: wait for supplier
> /soc@0/bus@32c00000/csi@32e20000/port/endpoint
>=20
> In this tree both drivers/media/i2c/imx219.c and
> drivers/media/platform/nxp/imx7-media-csi.c are at the same patch
> level and I'm not sure what else is involved here to look at.
>=20
> It seems mipi-dsi and mipi-csi are extremely fragile and require
> constant regression testing unfortunately.
>=20
> best regards,
>=20
> Tim


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


