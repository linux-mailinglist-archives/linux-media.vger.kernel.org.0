Return-Path: <linux-media+bounces-43626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 032D4BB3A73
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A103516EE3B
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB12130AD07;
	Thu,  2 Oct 2025 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wOhhrZFr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD113B7AE;
	Thu,  2 Oct 2025 10:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759401476; cv=none; b=lqHMAVjDQCEVWjbcflCbLFlSwtc61Z6md/T7ZU+sGpvkAu20ox0Af3QNo6Sw2OETaijRd/GKewARQPkynRmUEdRrqBaD1mFlj+5bNzoHE1VMTgfAru3CPBoJGhPzu3K9YdImtPJQHJduMwT+NJu10dY9y2euyHTCllWCwww747U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759401476; c=relaxed/simple;
	bh=ADQOU1F7+1NqIdtHOPLmjhZ9YZ6qm94XM8YkZXyudoE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cDC8xpJMJ1kivdrISytmI6ySa45XCQIAv2nucJZB5Y4pazF7dJZ7WChbRkJCQvXpZWx3g+W5Np245tGMYR2C87cptM4xrBycy6e1QQBGyg7CaS+8WZuScYc/x91ScG9bxBGW5pmz4B1zyzsWUqlwzjgQUvMr2/dWFW8pZ9rFkaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wOhhrZFr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2799AF06;
	Thu,  2 Oct 2025 12:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759401381;
	bh=ADQOU1F7+1NqIdtHOPLmjhZ9YZ6qm94XM8YkZXyudoE=;
	h=From:Subject:Date:To:Cc:From;
	b=wOhhrZFrbrdmjUpHUbAgCB1EEp1P71xk/FkohS7Xmx8QcslFN/6hVguEkxeF7dGWl
	 dt9Hc/gkEqktkuk/2spDxqDFWyv7YAr4nu0EYWcy9S8zf3QrnDbz0CnMsrDJU5JkB5
	 J4JotR8LtODKO1cN35mXGL7MfD25VDRbEJZXmUcY=
From: Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v5 0/3] Add Input Video Control Block driver for RZ/V2H
Date: Thu, 02 Oct 2025 11:36:59 +0100
Message-Id: <20251002-ivc-v5-0-192c663fa70b@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMxV3mgC/3WQy2rDMBBFf8VoXQW9ZXvV/yhdjKVxI/AjlVyRE
 Pzvld1AUpouLzPnMnOuJGEMmEhbXUnEHFKYpxL0S0XcEaYPpMGXTAQTmhmhaMiO1lJ6oaQ13Fh
 SNk8R+3DeW97eS+7jPNLlGBHurOYNV9pqdVBaMaYppx6mQ3IwDJfX4BHSPHUzRH9w83hrjfj5V
 U5afqpJBwlpmY5haSuGAtEy0XA0CiTrUZrGMFdr0SgrjJcKOJNIHl9pq/0YyzjF84JTCt2A9AQ
 RRlwwJpphCB6WYoG6WvLe9to51rVZP+vZhDitaSedNJ1A7mvXZi7IZuEY0jLHy642i/2BXxazo
 IyiQue97xg05q+FrSbLO2rZDZUF1U5p30iDvcB/UPWA8huqNlQqBFXXzsr6Cbqu6zf+XtuMGQI
 AAA==
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
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13699;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ADQOU1F7+1NqIdtHOPLmjhZ9YZ6qm94XM8YkZXyudoE=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBo3lX2fbbOqKgq0dOd0Dx5t9MwwCEfMCu7B5AbS
 itiNfEEZteJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaN5V9gAKCRDISVd6bEV1
 MlG0EACBawGsYeayWsm9Clny/OgmvfssYAk1xVGUbvozN0cr8IzV5iIbqZkqJ+cmNvXXlxuHVUN
 ne44IlWmk8JUSTtwujs7VNNdEYlHo3k3HocFfbvL2ZS2yfmZbcgi+/CJ8K/cVK9kt5svQcj2Pwb
 Y6SigmEZCuy22xsLyWG8NjP937DZ5EPNEJTndF/MUEMnVyg/t2uY4gYDjNjr/3vIN/OexZPv+t4
 bnfAW4S8fdXi6EdoScDErjdAWv0uK/Kk2rmdEJ5cHe4COHfV6HxYyU9ihDEd46RhRTgq7F0bRAn
 ji04aCUjUenE7geSXgQfJTC9sozxGnbanm5Lqc+/fQYOon93oyBgXA2KZBfPWWKojsigLk0QzqO
 b4F6USVSgRd5ZrLVV09l5iWd9ndM2eF7JGom2U+W/Ke8BNQhvm3uE2jzoYTev1jXaVxz5nm+z+o
 Y+fj/sQOacYcMmZ5ZAJIjTnaj8ELwbIiw5c8WxO2hlQ5T9wKKYYwlfb/UrjbFOerxgeCegZc45R
 yYFrIcZ6O8scY21V0sCvMgxEZWvjvShPd8YNqxfk34wHyi6kcLHyYkneK4ILG9bsjp95syMk9MY
 AXOU+vBSH8i0U8VQAijavU+D+0eDvcB5xN0leELjWBtNBu5wt7WZ+jKSbzLUw1911wIJEs79yfy
 9ZKiEWvWwwIylAA==
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
[2] https://lore.kernel.org/linux-media/20251002-c55-v12-0-3eda2dba9554@ideasonboard.com/

---
Changes in v5:
- No series level changes.
- Link to v4: https://lore.kernel.org/r/20250714-ivc-v4-0-534ea488c738@ideasonboard.com

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
      dt-bindings: media: Add bindings for the RZ/V2H(P) IVC block
      media: platform: Add Renesas Input Video Control block driver
      MAINTAINERS: Add entry for rzv2h-ivc driver

 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 103 ++++
 MAINTAINERS                                        |   7 +
 drivers/media/platform/renesas/Kconfig             |   1 +
 drivers/media/platform/renesas/Makefile            |   1 +
 drivers/media/platform/renesas/rzv2h-ivc/Kconfig   |  18 +
 drivers/media/platform/renesas/rzv2h-ivc/Makefile  |   5 +
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-dev.c     | 238 +++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-subdev.c  | 375 +++++++++++++++
 .../platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c   | 533 +++++++++++++++++++++
 .../media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h   | 130 +++++
 10 files changed, 1411 insertions(+)
---
base-commit: 0e2ee70291e64a30fe36960c85294726d34a103e
change-id: 20250624-ivc-833d24376167
prerequisite-change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b:v5
prerequisite-patch-id: 63dcb795365bddbc4e96efc8a6953d1fe3c1c9c4
prerequisite-patch-id: a2f9f978ed00b6d6a0cf674dc74febded45cf991
prerequisite-patch-id: 002733e75605531c1f85a6b667a387ff608b0898
prerequisite-patch-id: b846f934b91bd338ae3a789c946a03665cc042e2
prerequisite-patch-id: 4f3f3e0a5b72e9226e6735caa20e97105564a999
prerequisite-patch-id: a0ba06f067cd27954bfdc2ac98909790ed250b1e
prerequisite-patch-id: 4cc969d952d5ee3eb44219360761e5cb18bcb080
prerequisite-patch-id: 0e1304715de9873b175d1df32e240ae97363d042
prerequisite-change-id: 20250624-c55-b3c36b2e1d8c:v12
prerequisite-patch-id: 1712bb33f6a2149aa4a043475384dad09bd5ea01
prerequisite-patch-id: d998a4268a5f448b99b89cb0dec30e3e0415d138
prerequisite-patch-id: 1c3002b1bff40d90c478de83701028a4cb19fb05
prerequisite-patch-id: 9f124ea9a83aba0ea6c4f2f89904049a2f6b847b
prerequisite-patch-id: e99623e5454a82e6270c2dce638413b79efba04f
prerequisite-patch-id: cfd10065ae88519560f01b1fa4045477c98bbb9f
prerequisite-patch-id: 8dcb9acfa8eb9e5c1cbcad1ac621347e7bc07055
prerequisite-patch-id: 00c4c190c8d7be30ad47e89bbd4a88fc1e4822a7
prerequisite-patch-id: d0b85b963222c4ee657bbe9a067349422b3ec4fd
prerequisite-patch-id: 9c22fe0a74722328843ed995096ee84927394d78
prerequisite-patch-id: 26da37c4c3ac964c3a738bd9a7883367bf505b88
prerequisite-patch-id: 63dcb795365bddbc4e96efc8a6953d1fe3c1c9c4
prerequisite-patch-id: a2f9f978ed00b6d6a0cf674dc74febded45cf991
prerequisite-patch-id: 002733e75605531c1f85a6b667a387ff608b0898
prerequisite-patch-id: b846f934b91bd338ae3a789c946a03665cc042e2
prerequisite-patch-id: 4f3f3e0a5b72e9226e6735caa20e97105564a999
prerequisite-patch-id: a0ba06f067cd27954bfdc2ac98909790ed250b1e
prerequisite-patch-id: 4cc969d952d5ee3eb44219360761e5cb18bcb080
prerequisite-patch-id: 0e1304715de9873b175d1df32e240ae97363d042
prerequisite-patch-id: ecc5483454fc52289c093e711d5423e1cdd8bc3b
prerequisite-patch-id: 1aea6316a2a4a7b56316dbef3ca6034de6ec1672
prerequisite-patch-id: 27543f90298d79490843673acfa4c393be987bf7
prerequisite-patch-id: d613438c66d762ac5e8820827b8961472d847227
prerequisite-patch-id: a57488257a6c96111c3b23d465929cce0131ef1e
prerequisite-patch-id: dff49267a0db686172ae90cee86ad82af985b292
prerequisite-patch-id: 8b5b0ff8043abbe1eb15c005697a91171365e272
prerequisite-patch-id: 67c6aaf1985cc437c3a82ab88e1b5fbd14bb0737
prerequisite-patch-id: d91ab2db3361217f60008ea2faf28eecc475b53a
prerequisite-patch-id: 5e25ca1deb481b36df30d0764193eea423ed1350
prerequisite-patch-id: 5f14fd5a3846dacfc02505fea4f8c5fdc43fdd39
prerequisite-patch-id: 8f4c5c8f7aca170aa951b0ce02a6720a47a231da
prerequisite-patch-id: 16f08392246503089693a4fd87e37dfb322605e7
prerequisite-patch-id: 915678ccc4886b34ae1f0d86253b60bf0d55e19a
prerequisite-patch-id: 35a6d2109bc7023c93e847a9da88b1fe284d7c8a

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


