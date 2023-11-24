Return-Path: <linux-media+bounces-985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AA97F764F
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 15:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35CFB1C211BB
	for <lists+linux-media@lfdr.de>; Fri, 24 Nov 2023 14:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BFE2D626;
	Fri, 24 Nov 2023 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZhwKEzfE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 842D619A1;
	Fri, 24 Nov 2023 06:26:22 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A0AE2E7;
	Fri, 24 Nov 2023 15:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700835948;
	bh=uISx97yy7PS/5tZo3HMpu2UerRFS+Z6/L0jul6kTsBk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZhwKEzfERMGvADlIgXgs18fhPHlAqy7USMMlUCBP6+OntQL3Y0bEd62UFSVVwkSVw
	 Zju3unqJDensIMzJ+nALQZpZDVC6ZXbM1OaATFYp2OVoeX4+ht/jNSZWQDlx7gZEqP
	 QiNDN6QeUaJ1XBKspslIF9i7Lshd6RXvt7WDtMgM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	linux-mediatek@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 0/3] media: i2c: Add driver for THine THP7312 ISP
Date: Fri, 24 Nov 2023 16:26:22 +0200
Message-ID: <20231124142625.25979-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series adds a new driver for the THine THP7312 ISP. It has
been tested on an OLogic Pumpkin i350, which has a Mediatek MT8365 SoC,
with the THine THSCG101 camera module.

Technically the driver itself (and its bindings) have no dependencies,
but to run/test this on the Pumpkin i350 with the mainline kernel, a
number of patches are needed to support the board and the MT8365 SoC.
Some of those patches are on their way to mainline, and some, like the
Pumpkin i350 board device tree, will require more work. For convenience
and reference, the needed patches are available in [1].

Example overlays for DT integration of the THP7312 are available in that
branch, in
arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso and
arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso.

Compared to v7, usage of an uninitialized variable, reported by smatch,
has been fixed.

The series is based on top of the latest media tree, with all the V4L2
dependencies finally merged for v6.8. The driver still depends on the
"[RESEND PATCH v4 1/1] device property: Add fwnode_name_eq()" path
previously submitted to the linux-media mailing list ([2]), which I will
include in the pull request. If anyone wants to check it out, the tag I
will use for the pull request is available from [3].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=mtk/v6.7/pumpkin/camera
[2] https://lore.kernel.org/linux-media/20231106073141.1250344-1-sakari.ailus@linux.intel.com
[3] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=media-thp7312-next-20231124

Below is the mandatory v4l2-compliance report.

v4l2-compliance 1.25.0-5097, 64 bits, 64-bit time_t
v4l2-compliance SHA: b79e00a74fde 2023-09-13 07:19:23

Compliance test for device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.7.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
[  994.389651] thp7312 2-0061: =================  START STATUS  =================
[  994.390610] thp7312 2-0061: Focus, Automatic Continuous: true
[  994.391614] thp7312 2-0061: Focus, Absolute: 0
[  994.392240] thp7312 2-0061: Auto-Focus Method: 2
[  994.392875] thp7312 2-0061: White Balance, Automatic: true
[  994.393616] thp7312 2-0061: Red Balance: 64
[  994.394193] thp7312 2-0061: Blue Balance: 50
[  994.394778] thp7312 2-0061: Brightness: 0
[  994.395328] thp7312 2-0061: Saturation: 10
[  994.395957] thp7312 2-0061: Contrast: 10
[  994.396504] thp7312 2-0061: Sharpness: 8
[  994.397046] thp7312 2-0061: Horizontal Flip: false
[  994.397687] thp7312 2-0061: Vertical Flip: false
[  994.398297] thp7312 2-0061: Auto Exposure, Bias: 0
[  994.398929] thp7312 2-0061: Power Line Frequency: 50 Hz
[  994.399660] thp7312 2-0061: Link Frequency: 387500000
[  994.400340] thp7312 2-0061: Camera Orientation: Front
[  994.401009] thp7312 2-0061: Camera Sensor Rotation: 0
[  994.401673] thp7312 2-0061: Low Light Compensation: false
[  994.402381] thp7312 2-0061: Noise Reduction Auto: true
[  994.403055] thp7312 2-0061: Noise Reduction Level: 0
[  994.403748] thp7312 2-0061: ==================  END STATUS  ==================
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
        Standard Controls: 20 Private Controls: 4

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev2: 43, Succeeded: 43, Failed: 0, Warnings: 0

Laurent Pinchart (1):
  media: uapi: Add controls for the THP7312 ISP

Paul Elder (2):
  dt-bindings: media: Add bindings for THine THP7312 ISP
  media: i2c: Add driver for THine THP7312

 .../bindings/media/i2c/thine,thp7312.yaml     |  224 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../userspace-api/media/drivers/thp7312.rst   |   39 +
 MAINTAINERS                                   |   11 +
 drivers/media/i2c/Kconfig                     |   16 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/thp7312.c                   | 2237 +++++++++++++++++
 include/uapi/linux/thp7312.h                  |   19 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2554 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 drivers/media/i2c/thp7312.c
 create mode 100644 include/uapi/linux/thp7312.h


base-commit: a00b3f296eac3d43328615c3113e1a74143fc67a
prerequisite-patch-id: 3dc1549c51cc7ff0257c09d6dc599c8f6e87e1d5
-- 
Regards,

Laurent Pinchart


