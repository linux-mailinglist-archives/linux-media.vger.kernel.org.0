Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB080C1612
	for <lists+linux-media@lfdr.de>; Sun, 29 Sep 2019 18:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbfI2QRM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Sep 2019 12:17:12 -0400
Received: from mailoutvs24.siol.net ([185.57.226.215]:54007 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726827AbfI2QRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Sep 2019 12:17:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id A94A5522042;
        Sun, 29 Sep 2019 18:17:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id JgsM0ZqPU_-W; Sun, 29 Sep 2019 18:17:08 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 2863D522049;
        Sun, 29 Sep 2019 18:17:08 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-59-25.static.triera.net [86.58.59.25])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 9AFD2522042;
        Sun, 29 Sep 2019 18:17:07 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, mchehab@kernel.org,
        hverkuil@xs4all.nl, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: [PATCH v2 0/6] media: Introduce Allwinner H3 deinterlace driver
Date:   Sun, 29 Sep 2019 18:16:47 +0200
Message-Id: <20190929161653.160158-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Starting with H3, Allwinner began to include standalone deinterlace
core in multimedia oriented SoCs. This patch series introduces support
for it. Note that new SoCs, like H6, have radically different (updated)
deinterlace core, which will need a new driver.

v4l2-compliance report:
v4l2-compliance SHA: dece02f862f38d8f866230ca9f1015cb93ddfac4, 32 bits

Compliance test for sun8i-di device /dev/video0:

Driver Info:
        Driver name      : sun8i-di
        Card type        : sun8i-di
        Bus info         : platform:sun8i-di
        Driver version   : 5.3.0
        Capabilities     : 0x84208000
                Video Memory-to-Memory
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04208000
                Video Memory-to-Memory
                Streaming
                Extended Pix Format

Required ioctls:
        test VIDIOC_QUERYCAP: OK

Allow for multiple opens:
        test second /dev/video0 open: OK
        test VIDIOC_QUERYCAP: OK
        test VIDIOC_G/S_PRIORITY: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for sun8i-di device /dev/video0: 44, Succeeded: 44, Failed: 0, Warn=
ings: 0

Please take a look.

Best regards,
Jernej

Changes from v1:
- updated Maxime's e-mail in DT binding
- removed "items" for single item in DT binding
- implemented power management
- replaced regmap with direct io access
- set exclusive clock rate
- renamed DEINTERLACE_FRM_CTRL_COEF_CTRL to DEINTERLACE_FRM_CTRL_COEF_ACC=
ESS

Jernej Skrabec (6):
  dt-bindings: bus: sunxi: Add H3 MBUS compatible
  clk: sunxi-ng: h3: Export MBUS clock
  ARM: dts: sunxi: h3/h5: Add MBUS controller node
  dt-bindings: media: Add Allwinner H3 Deinterlace binding
  media: sun4i: Add H3 deinterlace driver
  dts: arm: sun8i: h3: Enable deinterlace unit

 .../bindings/arm/sunxi/sunxi-mbus.txt         |    1 +
 .../media/allwinner,sun8i-h3-deinterlace.yaml |   75 ++
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/sun8i-h3.dtsi               |   13 +
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |    9 +
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h           |    4 -
 drivers/media/platform/sunxi/Kconfig          |    1 +
 drivers/media/platform/sunxi/Makefile         |    1 +
 drivers/media/platform/sunxi/sun8i-di/Kconfig |   11 +
 .../media/platform/sunxi/sun8i-di/Makefile    |    2 +
 .../media/platform/sunxi/sun8i-di/sun8i-di.c  | 1020 +++++++++++++++++
 .../media/platform/sunxi/sun8i-di/sun8i-di.h  |  237 ++++
 include/dt-bindings/clock/sun8i-h3-ccu.h      |    2 +-
 13 files changed, 1378 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
8i-h3-deinterlace.yaml
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/Kconfig
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h

--=20
2.23.0

