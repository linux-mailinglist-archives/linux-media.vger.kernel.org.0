Return-Path: <linux-media+bounces-37676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 599B5B04399
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC3D64A8216
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A259925D8E8;
	Mon, 14 Jul 2025 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DobKFmfJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E8E1F55FA;
	Mon, 14 Jul 2025 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506373; cv=none; b=mkg4gsfbJsw0fL1bBVqg5zAA2/oqHE3wwUBDrzGlaLsjPSpLEoefznULOgeYdMCc+jBxX7yUfJN8Bt2hUfRXEc85QIGwQp3NcZ7JvAo0QqMDFoEERKip6f1iI3sAaB00GArco6zo3yAslKfktL+XInPUL2Qj14TUDMURTl6CBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506373; c=relaxed/simple;
	bh=qw2dZlPqTjcKIGKNedcDpRfZyoEkFKW3mfzlag+uLiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eecdN7XGtl5ywnSx74lGsQRTFNjTBI1XIACx2JOhAloFAz6RXUAiE/zeppQgTHbry6igJHNrPsx+9bOHSF78YAyKsVF6f53XjVhD9McDXZdF2uOMkmUrc6xOfTRoU+8OrooUvyBFpfhzFePfm6XvzEomF8pXOtqJi9zgUNGOx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DobKFmfJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46E5882A;
	Mon, 14 Jul 2025 17:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752506337;
	bh=qw2dZlPqTjcKIGKNedcDpRfZyoEkFKW3mfzlag+uLiw=;
	h=From:Subject:Date:To:Cc:From;
	b=DobKFmfJ49lx6Jh5vUrlJDlfeBSmjpTLV33y5Zzbajd4otdBadf/PsczAVTj09Q6u
	 dH/jNia7TAEzNJtSE2Iz+gLNa2/LU+2Y7PDSMF12gIuJIV1fc4qm4/H4MqHLtdxPNi
	 ttEgPanH+/AnY7Br/X2uzMprc6Eab4OR+ZRJHu1E=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v4 0/3] Add Input Video Control Block driver for RZ/V2H
Date: Mon, 14 Jul 2025 16:19:16 +0100
Message-Id: <20250714-ivc-v4-0-534ea488c738@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPUfdWgC/22Qy2rDMBBFf8VoXQU9Lcur/kfpYjQaNwLHTiXXJ
 IT8e+U0kJZmeZk5l5lzYYVyosL65sIyramkearBvDQM9zB9EE+xZqaEsqJVhqcVead1VEa7Vra
 O1c1jpiGdbi1v7zUPeT7wZZ8JHqyVXhrrrNkZa4SwXPII064gjOP5NUWCMk9hhhx3OB/urZk+v
 +pJy081C1CI1+khLX0DnfUdukgyYPTGtBLBGvRO0QA+GAIr5BA8+/1K39yOcUJyOi00lRRG4kf
 IcKCFcuErjCnCUi1w7LQc3GARRehX9axnE4LW8qBRt0GRjB32q5Rss7BPZZnz+aa24tsDfyyui
 gtOhjDGGAT49r+FrWbVD9SJO6oratHY6HVLg6In6PV6/QY/jtV63gEAAA==
X-Change-ID: 20250624-ivc-833d24376167
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 laurent.pinchart@ideasonboard.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13105;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=qw2dZlPqTjcKIGKNedcDpRfZyoEkFKW3mfzlag+uLiw=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBodR/+QXN4pPtpqfTSq7NLPpad7AwOl59G94OPI
 hjpb17s5wyJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaHUf/gAKCRDISVd6bEV1
 MlUmD/9yV/4Jrv6QvzmNQfyhK68jPZuHobqnDenrggoSLOAmsNTbS/bXhuDo9WXKg4IrOMpX6b8
 yNJR8ivTQ1dux+dEKaxospck0A/gyFsTQYtpphPAWDwXf9t9CzyHe64x07v8HHi5JuD4/RNRC4V
 QeWXsvm01pjoQpvoV+9lQ7pMolpU6xG+CXFV50yeSmXxLscrScmrAS/ctmwg7Xl1s/859mBaqvY
 gBvkV0W5gX3Ao924o6yOBMIBuoICNHb81CSD1W+U2H8oLWBqBQv1UfijwKqOIY56EQog9OFw9BN
 tEyHq7COEcge1dw73FhIIHksHwC6Yi9wNtMhTsm9R7wUZsSlh8ns8bEFVfUAKUlIMsXjIXyLSp2
 7fvyyooMS5wyx3k9Vgl77eVk51VST2vL6dF75wc3FcYlqaiQ7wr+5+i44S1h23YjQYT+PSgUaos
 l4kzj71cAojWEqVuU45031qBYPslIsLKkYtfj2NY5Cjjq15pqt0Sv103JSZWwbwz9LvfntxLoHQ
 DMNOIpRDiop5bK/WMnXDXxPX8caH6qZmrdLgPCYfyuuJ6A7Is9aaMeoTy/HiaLweh2tQqJW21A1
 od8cQDST028qo/SqmvN7bYMp9gndkaoTlk9FJVpnwsdmHotahZMREmCreakgTADT7N1P+paBVib
 Sm7YnM4OIZOjXWw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Hello all

This series adds a driver for the Input Video Control Block in the
RZ/V2H SoC. The IVC block transmits input image data from memory to
the ISP core (on this SoC, a Mali-C55 ISP). The driver registers an
output video device for userspace to queue image buffers to. One
noteworthy feature is that - because it is not a part of the main ISP
drive - the IVC driver also registers a subdevice, which connects to
the media device created by the ISP driver through the usual v4l2
async framework. This requires delaying the registration of the video
device until the .registered() callback of the subdevice, so that the
struct v4l2_dev pointer the subdevice connected to can be set to the
video device.

This version of the driver drops the reliance on the new media
framework that was posted recently [1], so can be merged without it
and updated later. The series is also based on top of the latest
version of the Mali-C55 driver [2].

Thanks
Dan

[1] https://lore.kernel.org/linux-media/20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com/T/#t
[2] https://lore.kernel.org/linux-media/20250714-c55-v11-0-bc20e460e42a@ideasonboard.com/

---
Changes in v4:
- Dropped the mc / V4L2 helper patches - they're in the C55 series instead, the aim
  being to avoid creating a circular dependency between the two sets
- Link to v3: https://lore.kernel.org/r/20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com

Changes in v3:
- Added two new patches that create helpers in V4L2 and mc core that
  the driver then consumes.

- Link to v2: https://lore.kernel.org/r/20250624-ivc-v2-0-e4ecdddb0a96@ideasonboard.com

The rest of this message is the v4l2-compliance report for the video
device and subdevice:

v4l2-compliance 1.31.0-5380, 64 bits, 64-bit time_t
v4l2-compliance SHA: 1cc84dfb41d8 2025-07-08 08:28:16

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 6.15.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000003
streams interval-uses-which 
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
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
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0

v4l2-compliance 1.31.0-5380, 64 bits, 64-bit time_t
v4l2-compliance SHA: 1cc84dfb41d8 2025-07-08 08:28:16

Compliance test for rzv2h-ivc device /dev/video3:

Driver Info:
        Driver name      : rzv2h-ivc
        Card type        : Renesas Input Video Control
        Bus info         : platform:16080000.isp
        Driver version   : 6.15.0
        Capabilities     : 0x84202000
                Video Output Multiplanar
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x04202000
                Video Output Multiplanar
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : mali-c55
        Model            : ARM Mali-C55 ISP
        Serial           : 
        Bus info         : platform:16080000.isp
        Media version    : 6.15.0
        Hardware revision: 0x01d982d6 (31032022)
        Driver version   : 6.15.0
Interface Info:
        ID               : 0x0300002a
        Type             : V4L Video
Entity Info:
        ID               : 0x00000028 (40)
        Name             : rzv2h-ivc
        Function         : V4L2 I/O
        Pad 0x01000029   : 0: Source
          Link 0x0200002c: to remote pad 0x1000026 of entity 'rzv2h ivc block' (Video Pixel Formatter): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video3 open: OK
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
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for rzv2h-ivc device /dev/video3: 49, Succeeded: 49, Failed: 0, Warnings: 0

To: linux-media@vger.kernel.org
To: devicetree@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: jacopo.mondi@ideasonboard.com
Cc: biju.das.jz@bp.renesas.com
Cc: laurent.pinchart@ideasonboard.com

---
Daniel Scally (3):
      dt-bindings: media: Add bindings for the RZ/V2H IVC block
      media: platform: Add Renesas Input Video Control block driver
      MAINTAINERS: Add entry for rzv2h-ivc driver

 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 ++++
 MAINTAINERS                                        |   7 +
 drivers/media/platform/renesas/Kconfig             |   1 +
 drivers/media/platform/renesas/Makefile            |   1 +
 drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  18 +
 drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 229 +++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 376 ++++++++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 568 +++++++++++++++++++++
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 131 +++++
 10 files changed, 1439 insertions(+)
---
base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
change-id: 20250624-ivc-833d24376167
prerequisite-change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b:v2
prerequisite-patch-id: eedc860a79e00a7b875b51c1b27369b7d9343ea7
prerequisite-patch-id: 92fbff7664257963606b4b528a9ce517462a9b6c
prerequisite-patch-id: e7986bc6bf23aced55153711a840568810638aed
prerequisite-patch-id: b5e5b4110ff198562face15fdb99813d3792ebe1
prerequisite-patch-id: e6ebc9baad32ef8286b05f9ebc77b25b2c53d39c
prerequisite-patch-id: 2b002f36ec01afc3571f19cf6b6474e59cd8ed65
prerequisite-patch-id: 64d6914de4c8c877567752ba4fec82328a8a9ea9
prerequisite-patch-id: 35f7062835d60a07930bc8733b3f47771f68c074
prerequisite-change-id: 20250624-c55-b3c36b2e1d8c:v11
prerequisite-patch-id: eedc860a79e00a7b875b51c1b27369b7d9343ea7
prerequisite-patch-id: 92fbff7664257963606b4b528a9ce517462a9b6c
prerequisite-patch-id: e7986bc6bf23aced55153711a840568810638aed
prerequisite-patch-id: b5e5b4110ff198562face15fdb99813d3792ebe1
prerequisite-patch-id: e6ebc9baad32ef8286b05f9ebc77b25b2c53d39c
prerequisite-patch-id: 2b002f36ec01afc3571f19cf6b6474e59cd8ed65
prerequisite-patch-id: 64d6914de4c8c877567752ba4fec82328a8a9ea9
prerequisite-patch-id: 35f7062835d60a07930bc8733b3f47771f68c074
prerequisite-patch-id: 833a35b9ac1ed96d059b3d4ba779593b0e5b156e
prerequisite-patch-id: 17de205479b4594a017ba8e444b7f5629d85b380
prerequisite-patch-id: ecc5483454fc52289c093e711d5423e1cdd8bc3b
prerequisite-patch-id: 1aea6316a2a4a7b56316dbef3ca6034de6ec1672
prerequisite-patch-id: e48d41a6a7af49983fa9b34499e25ee4657d5af2
prerequisite-patch-id: e9aa66a8455fc64be546098dcb0573567ca0a389
prerequisite-patch-id: e3d958df2440718af06d00ba377126fd9179db1b
prerequisite-patch-id: 19226131d738efc4319fe493e68d8287936670c0
prerequisite-patch-id: 03df7faabe3da3b07bb69127206f1123ea6d601b
prerequisite-patch-id: dff49267a0db686172ae90cee86ad82af985b292
prerequisite-patch-id: 8b5b0ff8043abbe1eb15c005697a91171365e272
prerequisite-patch-id: 67c6aaf1985cc437c3a82ab88e1b5fbd14bb0737
prerequisite-patch-id: 09c97e68cbd196d71d289ba2ee71ad6752f7f03d
prerequisite-patch-id: db4133370a99861b1ec50eea46b13797473cab22
prerequisite-patch-id: 7843ebd2523bcdbdcd8446a2a5abac6d1a8f85c1
prerequisite-patch-id: 8f4c5c8f7aca170aa951b0ce02a6720a47a231da
prerequisite-patch-id: 704ce2c3f16eafb4ec974d9b6b574fe58991313a
prerequisite-patch-id: b0683fafcd57b8a64c40910b9795370748a46a84
prerequisite-patch-id: ba97bc1b7d997001ba18b7ba3a1a80009d5625d4

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


