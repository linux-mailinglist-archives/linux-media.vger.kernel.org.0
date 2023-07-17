Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D74755FE3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jul 2023 11:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjGQJ5e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jul 2023 05:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbjGQJ5d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jul 2023 05:57:33 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDB0188
        for <linux-media@vger.kernel.org>; Mon, 17 Jul 2023 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1689587849; x=1721123849;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k8AqfeTIT15pBQHKdrs1BtKxgX246yAD5CipWxKHC2M=;
  b=VongPd1aEzn4XO4LMWZ2zbERwf8Y00jEL37lBgUKSDDDPv5QufeXG8SB
   JpLzIkCh40PSnKsSBpqKczkyYFTLh1iFG4mg7X3dy+4xWsJY84gCv43kZ
   EedJgA48P9h4sKcBsX8INTsV+bpDQHaCYTEJQisr+LTUxezgH3NbVmo3u
   e/iHDC2PhVB4CMogTu/eCysZzrrkBnhN9+pSm0nUIc2Wgvh6blL2cWreF
   M5tDgv8RwYjYAp9pZmWIh1e/+6F90DWiYAlfSA+yzSLFO7E34plBgZm6S
   4FwhvnqJrp7Pxm7ZX6JBrER9AJlKbI0xDILIOx1PfvoXYebwimZcS5hIp
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,211,1684792800"; 
   d="scan'208";a="31960340"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 17 Jul 2023 11:57:27 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7DFBB280078;
        Mon, 17 Jul 2023 11:57:26 +0200 (CEST)
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
Date:   Mon, 17 Jul 2023 11:57:26 +0200
Message-ID: <2290635.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
References: <CAJ+vNU0BOVLTL17ofgHwtexbpuMYwH_aGUC==EXABUtHHiv_ag@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

Am Freitag, 14. Juli 2023, 03:34:15 CEST schrieb Tim Harvey:
> Alexander,
>=20
> I found that commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get
> rid of superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") introduced
> an issue causing me to not be able to capture anymore on an imx8mm
> with an imx219 camera.
>=20
> I'm using a RaspberryPi Camera v2 which has an IMX219 8MP camera module:
> - https://datasheets.raspberrypi.com/camera/camera-v2-schematics.pdf
> - has its own on-board 24MHz osc so no clock required from baseboard
> - pin 11 enables 1.8V and 2.8V LDO which is connected to a GPIO I use
> as a regulator enable
>=20
> I'm using the imx8mm-venice-gw72xx-0x-imx219 dt overlay [1] to test this.
>=20
> Here is some additional information about how I'm using the camera module:
> # cat /sys/bus/media/devices/media*/model
> imx-media
> hantro-vpu
> hantro-vpu
> # cat /sys/class/video4linux/video*/name
> csi capture
> nxp,imx8mm-vpu-g1-dec
> nxp,imx8mq-vpu-g2-dec
> # enable imx219 to csi link
> media-ctl --reset
> media-ctl -l "'imx219 2-0010':0 -> 'csis-32e30000.mipi-csi':0 [1]"
> # configure for 640x480 raw8
> media-ctl -v -V "'imx219 2-0010':0 [fmt:SRGGB8/640x480 field:none]"
> media-ctl -v -V "'csis-32e30000.mipi-csi':0 [fmt:SRGGB8/640x480 field:non=
e]"
> media-ctl -v -V "'csi':0 [fmt:SRGGB8/640x480 field:none]"
> # configure for RGGB (8-bit bayer), 640x480 resolution
> v4l2-ctl --device /dev/video0
> --set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbose
>=20
> before commit 6f482c4729d9: ("media: imx: imx7-media-csi: Get rid of
> superfluous call to imx7_csi_mbus_fmt_to_pix_fmt") this would report
> back 640x480 resolution:
> VIDIOC_QUERYCAP: ok
> VIDIOC_G_FMT: ok
> VIDIOC_S_FMT: ok
> Format Video Capture:
>         Width/Height      : 640/480
>         Pixel Format      : 'RGGB' (8-bit Bayer RGRG/GBGB)
>         Field             : None
>         Bytes per Line    : 640
>         Size Image        : 307200
>         Colorspace        : Default
>         Transfer Function : Default (maps to Rec. 709)
>         YCbCr/HSV Encoding: Default (maps to ITU-R 601)
>         Quantization      : Default (maps to Full Range)
>         Flags             :
>=20
> And after the commit it reports back an invalid 768x480 resolution:
> VIDIOC_QUERYCAP: ok
> VIDIOC_G_FMT: ok
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
>         Flags             :
>=20
> This resolution and frame size mis-match causes issues for example
> when using gstreamer to capture and stream frames.

Oh, that's weird. Can you check what the call to v4l_bound_align_image()=20
inside __imx7_csi_video_try_fmt() is actually doing? Check walign, width=20
before and after the call. From a glance that seems to be the only way widt=
h=20
could be modified.

> I noticed you have several outstanding patches pending for
> imx7-media-csi... perhaps there is something there you already know of
> that addresses this issue?

There nothing pending AFAICS. Everything has been integrated into linux-nex=
t=20
at least.

Best regards,
Alexander

> best regards,
>=20
> Tim
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rc
> h/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-imx219.dtso


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


