Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A79A71491DA
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 00:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbgAXXU3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 18:20:29 -0500
Received: from mailoutvs52.siol.net ([185.57.226.243]:37329 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729147AbgAXXU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 18:20:29 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id D21A95227DD;
        Sat, 25 Jan 2020 00:20:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 9kCMi8KzJ6Ui; Sat, 25 Jan 2020 00:20:25 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id 46B585227E3;
        Sat, 25 Jan 2020 00:20:25 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net [194.152.20.232])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 15DBD5227DD;
        Sat, 25 Jan 2020 00:20:21 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 0/8] media: sunxi: Add DE2 rotate driver
Date:   Sat, 25 Jan 2020 00:20:06 +0100
Message-Id: <20200124232014.574989-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some of Allwinner SoCs like A83T and A64 SoCs contain DE2 rotate core
which can flip image horizontal and vertical and rotate it in 90 deg.
steps. It support a lot of output formats, but a bit less capture
formats. All YUV input formats get converted to yuv420p, while RGB
formats are preserved.

Patches 1-2 fix few issues with DE2 clocks.

Patches 3-4 fix register range of DE2 clocks (it would overlap with
rotate driver)

Patches 5-8 provide binding, implement driver and add nodes.

v4l2-compliance SHA: ec55a961487b449bedbe07650674b4965814cf07, 32 bits, 3=
2-bit time_t

Compliance test for sun8i-rotate device /dev/video0:

Driver Info:
        Driver name      : sun8i-rotate
        Card type        : sun8i-rotate
        Bus info         : platform:sun8i-rotate
        Driver version   : 5.5.0
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

        test invalid ioctls: OK
Debug ioctls:
        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
        test VIDIOC_LOG_STATUS: OK

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
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 4 Private Controls: 0

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
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for sun8i-rotate device /dev/video0: 45, Succeeded: 45, Failed: 0, =
Warnings: 0

Best regards,
Jernej

Jernej Skrabec (8):
  clk: sunxi-ng: sun8i-de2: Swap A64 and H6 definitions
  clk: sunxi-ng: sun8i-de2: Fix A83T clocks and reset
  ARM: dts: sunxi: Fix DE2 clocks register range
  arm64: dts: allwinner: a64: Fix display clock register range
  media: dt-bindings: media: Add Allwinner A83T Rotate driver
  media: sun8i: Add Allwinner A83T Rotate driver
  ARM: dts: sun8i: a83t: Add device node for rotation core
  arm64: dts: allwinner: a64: add node for rotation core

 .../allwinner,sun8i-a83t-de2-rotate.yaml      |  70 ++
 MAINTAINERS                                   |   8 +
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  13 +-
 arch/arm/boot/dts/sun8i-r40.dtsi              |   2 +-
 arch/arm/boot/dts/sun8i-v3s.dtsi              |   2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  14 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  49 +-
 drivers/media/platform/Kconfig                |  12 +
 drivers/media/platform/sunxi/Makefile         |   1 +
 .../platform/sunxi/sun8i-rotate/Makefile      |   2 +
 .../sunxi/sun8i-rotate/sun8i-formats.c        | 273 ++++++
 .../sunxi/sun8i-rotate/sun8i-formats.h        |  25 +
 .../sunxi/sun8i-rotate/sun8i-rotate.c         | 924 ++++++++++++++++++
 .../sunxi/sun8i-rotate/sun8i-rotate.h         | 135 +++
 15 files changed, 1512 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun=
8i-a83t-de2-rotate.yaml
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-forma=
ts.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-forma=
ts.h
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotat=
e.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-rotate/sun8i-rotat=
e.h

--=20
2.25.0

