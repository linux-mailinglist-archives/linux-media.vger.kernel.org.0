Return-Path: <linux-media+bounces-42079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4740B4A613
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 10:54:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BE1E175C1C
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3F627FD4A;
	Tue,  9 Sep 2025 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q8HpLlqC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C4D27F73A
	for <linux-media@vger.kernel.org>; Tue,  9 Sep 2025 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408021; cv=none; b=otV74HkqfnHQGIi2CUsEtPI69qc8O1p+v/euje7xzoyi/EMoyEGsa0VNcqLe+6BE9lJ94xE6MwYaszcC3Cd8WNx8kS5MoN3vl9ioClcqpXWv+MCoUnmyU093GSoRZAI04dNMQuLYNUo1Rq3LaFM3sfVOVgH5FVHjNA4rcKahLh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408021; c=relaxed/simple;
	bh=hRXRGeFutNQqUUOqCyMEm61bP5KRZsccG3HYmDoyhIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkRmNPC9AbGSauxfSL4WW9yvkzjNS7kBOJQWDKKrpUuTgGpFbuBW6d+QF1zYog+WGTHd2GmOJsbZKtMJ4Gsze7VE08rFw+l3UQcNkkw7fqI20O29k8DkI/u4Yd13FJR59n+ZSRLFqJmKl1jZ3qYX+mtgH7EkzHkjED5HYoP9lY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q8HpLlqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF8F9C4CEF4;
	Tue,  9 Sep 2025 08:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757408021;
	bh=hRXRGeFutNQqUUOqCyMEm61bP5KRZsccG3HYmDoyhIE=;
	h=From:To:Cc:Subject:Date:From;
	b=q8HpLlqCwSt+NHirqCUCMF0lVdkJAVtpCBDsPDqxJI9yAVKVPhmj/WgaYOIuAxADo
	 Bv/dnVG76yR1g32zQ+ulVgzUrAxP+4BGYDOVoEOxXmM0d4DdPf5CLg9HJzb6AMiPOm
	 s+Cnb1Ib2OnadSldGOI5AirFVFrBCXuhomSp5m6+RhL+LlKP4FGaJjSMAdrG3XQeuq
	 Xiu/tM2lb+CdhoNSRdcJbswamMwxbfdZfVWTUC4bfLzo+IxcqEHeefB4jpd3CLr29Y
	 08WISuv+Ig/2YG/iv5l30/yFuAehujT3ax1/g4TEInz2Ki7REUp/Rftrtkg3kFH+DW
	 FTpqt68fMu9AQ==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 6.18] Please pull platform-qcom-iris-generic-fixes-updates-for-6.18-v2
Date: Tue,  9 Sep 2025 09:53:33 +0100
Message-ID: <20250909085336.33976-1-bod@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit 04f08db52b3f892c85bd92ebbc3a7ca32e4f60f3:

  media: i2c: tc358743: add support for more infoframe types (2025-09-07 10:29:19 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-iris-generic-fixes-updates-for-6.18-v2

for you to fetch changes up to 5be8379a5f6e1b28edfc231ea89331e7dec6ea22:

  media: iris: Fix firmware reference leak and unmap memory after load (2025-09-09 09:47:45 +0100)

----------------------------------------------------------------
This PR contains:

- MAINTAINERS updates for Dikshita, Vikash, Bryan
- dt-bindings additions for x1e80100 and sm8750
- dt-bindings fix from Krzysztof
- Fixes: from the community
  A number of memory leak and power-sequencing
  fixes.
- v2 mailmap update for Dikshita missed in my
  queue in v1.
- v2 adds a patch from Krzysztof which is RB since v1
  media: iris: Add support for SM8750 (VPU v3.5)

----------------------------------------------------------------
Bryan O'Donoghue (1):
      MAINTAINERS: Add a media/platform/qcom MAINTAINERS entry

Dikshita Agarwal (4):
      MAINTAINERS: update Dikshita Agarwal's email addresses
      dt-bindings: media: qcom,sm8550-iris: Update Dikshita Agarwal's email address
      mailmap: update Dikshita Agarwal's email addresses
      media: iris: vpu3x: Add MNoC low power handshake during hardware power-off

Hans Verkuil (8):
      MAINTAINERS: update Hans Verkuil's email addresses
      Documentation: media: update Hans Verkuil's email address
      media: v4l2-core: update Hans Verkuil's email address
      media: update Hans Verkuil's email address
      Documentation: update Hans Verkuil's email address
      media: include: update Hans Verkuil's email address
      media: update Hans Verkuil's email address
      gpu: drm: display: drm_dp_cec: update Hans' email address

Jorge Ramirez-Ortiz (6):
      media: dt-bindings: venus: Add qcm2290 dt schema
      media: venus: Define minimum valid firmware version
      media: venus: Add framework support for AR50_LITE video core
      media: venus: hfi_plat_v4: Add capabilities for the 4XX lite core
      media: venus: core: Sort dt_match alphabetically.
      media: venus: core: Add qcm2290 DT compatible and resource data

Krzysztof Kozlowski (5):
      dt-bindings: media: qcom,sm8550-iris: Add SM8750 video codec
      dt-bindings: media: qcom,sm8550-iris: Do not reference legacy venus properties
      media: iris: Call correct power off callback in cleanup path
      media: iris: Split power on per variants
      media: iris: Add support for SM8750 (VPU v3.5)

Neil Armstrong (1):
      media: iris: fix module removal if firmware download failed

Stephan Gerhold (3):
      media: venus: firmware: Use correct reset sequence for IRIS2
      dt-bindings: media: qcom,sm8550-iris: Add X1E80100 compatible
      media: iris: Fix firmware reference leak and unmap memory after load

Vikash Garodia (1):
      MAINTAINERS: Update Vikash Garodia's email address

 .mailmap                                           |   6 +-
 Documentation/ABI/testing/debugfs-cec-error-inj    |   2 +-
 Documentation/admin-guide/bug-hunting.rst          |   2 +-
 Documentation/admin-guide/media/ivtv.rst           |   2 +-
 .../devicetree/bindings/media/cec/cec-common.yaml  |   2 +-
 .../devicetree/bindings/media/cec/cec-gpio.yaml    |   2 +-
 .../bindings/media/cec/nvidia,tegra114-cec.yaml    |   2 +-
 .../devicetree/bindings/media/i2c/adi,adv7604.yaml |   2 +-
 .../bindings/media/qcom,qcm2290-venus.yaml         | 130 +++++++++++++
 .../bindings/media/qcom,sm8550-iris.yaml           |  16 +-
 .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++
 .../devicetree/bindings/media/silabs,si470x.yaml   |   2 +-
 .../driver-api/media/maintainer-entry-profile.rst  |   4 +-
 .../translations/zh_CN/admin-guide/bug-hunting.rst |   2 +-
 .../translations/zh_TW/admin-guide/bug-hunting.rst |   2 +-
 Documentation/userspace-api/media/cec/cec-api.rst  |   2 +-
 .../userspace-api/media/drivers/cx2341x-uapi.rst   |   2 +-
 Documentation/userspace-api/media/v4l/v4l2.rst     |   2 +-
 MAINTAINERS                                        | 103 ++++++-----
 drivers/gpu/drm/display/drm_dp_cec.c               |   2 +-
 drivers/media/cec/core/cec-core.c                  |   2 +-
 drivers/media/cec/platform/cec-gpio/cec-gpio.c     |   2 +-
 .../extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |   2 +-
 drivers/media/cec/usb/pulse8/pulse8-cec.c          |   4 +-
 drivers/media/cec/usb/rainshadow/rainshadow-cec.c  |   4 +-
 drivers/media/common/cx2341x.c                     |   2 +-
 drivers/media/i2c/adv7604.c                        |   2 +-
 drivers/media/i2c/adv7842.c                        |   2 +-
 drivers/media/i2c/cx25840/cx25840-core.c           |   4 +-
 drivers/media/i2c/saa6752hs.c                      |   2 +-
 drivers/media/i2c/saa7115.c                        |   2 +-
 drivers/media/i2c/saa7127.c                        |   2 +-
 drivers/media/i2c/saa717x.c                        |   2 +-
 drivers/media/i2c/tda9840.c                        |   2 +-
 drivers/media/i2c/tea6415c.c                       |   2 +-
 drivers/media/i2c/tea6420.c                        |   2 +-
 drivers/media/i2c/ths7303.c                        |   2 +-
 drivers/media/i2c/tlv320aic23b.c                   |   2 +-
 drivers/media/i2c/upd64031a.c                      |   2 +-
 drivers/media/i2c/upd64083.c                       |   2 +-
 drivers/media/i2c/vp27smpx.c                       |   2 +-
 drivers/media/i2c/wm8739.c                         |   2 +-
 drivers/media/i2c/wm8775.c                         |   2 +-
 drivers/media/mc/mc-request.c                      |   2 +-
 drivers/media/pci/cobalt/cobalt-driver.c           |   2 +-
 drivers/media/pci/cx18/cx18-audio.c                |   2 +-
 drivers/media/pci/cx18/cx18-audio.h                |   2 +-
 drivers/media/pci/cx18/cx18-av-audio.c             |   2 +-
 drivers/media/pci/cx18/cx18-av-core.c              |   2 +-
 drivers/media/pci/cx18/cx18-av-core.h              |   2 +-
 drivers/media/pci/cx18/cx18-av-firmware.c          |   2 +-
 drivers/media/pci/cx18/cx18-av-vbi.c               |   2 +-
 drivers/media/pci/cx18/cx18-cards.c                |   2 +-
 drivers/media/pci/cx18/cx18-cards.h                |   2 +-
 drivers/media/pci/cx18/cx18-controls.c             |   2 +-
 drivers/media/pci/cx18/cx18-controls.h             |   2 +-
 drivers/media/pci/cx18/cx18-driver.c               |   2 +-
 drivers/media/pci/cx18/cx18-driver.h               |   2 +-
 drivers/media/pci/cx18/cx18-fileops.c              |   2 +-
 drivers/media/pci/cx18/cx18-fileops.h              |   2 +-
 drivers/media/pci/cx18/cx18-firmware.c             |   2 +-
 drivers/media/pci/cx18/cx18-firmware.h             |   2 +-
 drivers/media/pci/cx18/cx18-gpio.c                 |   2 +-
 drivers/media/pci/cx18/cx18-gpio.h                 |   2 +-
 drivers/media/pci/cx18/cx18-i2c.c                  |   2 +-
 drivers/media/pci/cx18/cx18-i2c.h                  |   2 +-
 drivers/media/pci/cx18/cx18-io.c                   |   2 +-
 drivers/media/pci/cx18/cx18-io.h                   |   2 +-
 drivers/media/pci/cx18/cx18-ioctl.c                |   2 +-
 drivers/media/pci/cx18/cx18-ioctl.h                |   2 +-
 drivers/media/pci/cx18/cx18-irq.c                  |   2 +-
 drivers/media/pci/cx18/cx18-irq.h                  |   2 +-
 drivers/media/pci/cx18/cx18-mailbox.c              |   2 +-
 drivers/media/pci/cx18/cx18-mailbox.h              |   2 +-
 drivers/media/pci/cx18/cx18-queue.c                |   2 +-
 drivers/media/pci/cx18/cx18-queue.h                |   2 +-
 drivers/media/pci/cx18/cx18-scb.c                  |   2 +-
 drivers/media/pci/cx18/cx18-scb.h                  |   2 +-
 drivers/media/pci/cx18/cx18-streams.c              |   2 +-
 drivers/media/pci/cx18/cx18-streams.h              |   2 +-
 drivers/media/pci/cx18/cx18-vbi.c                  |   2 +-
 drivers/media/pci/cx18/cx18-vbi.h                  |   2 +-
 drivers/media/pci/cx18/cx18-version.h              |   2 +-
 drivers/media/pci/cx18/cx18-video.c                |   2 +-
 drivers/media/pci/cx18/cx18-video.h                |   2 +-
 drivers/media/pci/cx18/cx23418.h                   |   2 +-
 drivers/media/pci/ivtv/ivtv-cards.c                |   2 +-
 drivers/media/pci/ivtv/ivtv-cards.h                |   2 +-
 drivers/media/pci/ivtv/ivtv-controls.c             |   2 +-
 drivers/media/pci/ivtv/ivtv-controls.h             |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.c               |   2 +-
 drivers/media/pci/ivtv/ivtv-driver.h               |   2 +-
 drivers/media/pci/ivtv/ivtv-fileops.c              |   2 +-
 drivers/media/pci/ivtv/ivtv-fileops.h              |   2 +-
 drivers/media/pci/ivtv/ivtv-firmware.c             |   2 +-
 drivers/media/pci/ivtv/ivtv-firmware.h             |   2 +-
 drivers/media/pci/ivtv/ivtv-gpio.c                 |   2 +-
 drivers/media/pci/ivtv/ivtv-gpio.h                 |   2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c                  |   2 +-
 drivers/media/pci/ivtv/ivtv-i2c.h                  |   2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c                |   2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.h                |   2 +-
 drivers/media/pci/ivtv/ivtv-irq.c                  |   2 +-
 drivers/media/pci/ivtv/ivtv-irq.h                  |   2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.c              |   2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.h              |   2 +-
 drivers/media/pci/ivtv/ivtv-queue.c                |   2 +-
 drivers/media/pci/ivtv/ivtv-queue.h                |   2 +-
 drivers/media/pci/ivtv/ivtv-routing.c              |   2 +-
 drivers/media/pci/ivtv/ivtv-routing.h              |   2 +-
 drivers/media/pci/ivtv/ivtv-streams.c              |   2 +-
 drivers/media/pci/ivtv/ivtv-streams.h              |   2 +-
 drivers/media/pci/ivtv/ivtv-udma.c                 |   2 +-
 drivers/media/pci/ivtv/ivtv-udma.h                 |   2 +-
 drivers/media/pci/ivtv/ivtv-vbi.c                  |   2 +-
 drivers/media/pci/ivtv/ivtv-vbi.h                  |   2 +-
 drivers/media/pci/ivtv/ivtv-version.h              |   2 +-
 drivers/media/pci/tw68/tw68-core.c                 |   4 +-
 drivers/media/pci/tw68/tw68-reg.h                  |   2 +-
 drivers/media/pci/tw68/tw68-risc.c                 |   2 +-
 drivers/media/pci/tw68/tw68-video.c                |   2 +-
 drivers/media/pci/tw68/tw68.h                      |   2 +-
 drivers/media/platform/marvell/cafe-driver.c       |   2 +-
 drivers/media/platform/qcom/iris/iris_core.c       |  10 +-
 drivers/media/platform/qcom/iris/iris_firmware.c   |  15 +-
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  68 +++++++
 .../platform/qcom/iris/iris_platform_sm8750.h      |  22 +++
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |   2 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 202 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  14 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   6 +
 drivers/media/platform/qcom/venus/core.c           | 109 ++++++++---
 drivers/media/platform/qcom/venus/core.h           |  18 +-
 drivers/media/platform/qcom/venus/firmware.c       |  38 +++-
 drivers/media/platform/qcom/venus/firmware.h       |   2 +
 drivers/media/platform/qcom/venus/helpers.c        |  12 +-
 drivers/media/platform/qcom/venus/hfi_msgs.c       |  11 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |   2 +-
 drivers/media/platform/qcom/venus/hfi_platform.c   |  23 ++-
 drivers/media/platform/qcom/venus/hfi_platform.h   |  34 ++--
 .../media/platform/qcom/venus/hfi_platform_v4.c    | 188 +++++++++++++++++--
 .../media/platform/qcom/venus/hfi_platform_v6.c    |  33 +++-
 drivers/media/platform/qcom/venus/hfi_venus.c      |  25 ++-
 drivers/media/platform/qcom/venus/hfi_venus_io.h   |   4 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |   2 +-
 drivers/media/radio/radio-aimslab.c                |   2 +-
 drivers/media/radio/radio-aztech.c                 |   2 +-
 drivers/media/radio/radio-gemtek.c                 |   2 +-
 drivers/media/radio/radio-isa.c                    |   2 +-
 drivers/media/radio/radio-isa.h                    |   2 +-
 drivers/media/radio/radio-keene.c                  |   4 +-
 drivers/media/radio/radio-miropcm20.c              |   2 +-
 drivers/media/radio/radio-raremono.c               |   4 +-
 drivers/media/radio/radio-rtrack2.c                |   2 +-
 drivers/media/radio/radio-terratec.c               |   2 +-
 drivers/media/radio/radio-zoltrix.c                |   2 +-
 drivers/media/test-drivers/vicodec/vicodec-core.c  |   2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c      |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h          |   2 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c       |   2 +-
 drivers/media/v4l2-core/v4l2-device.c              |   2 +-
 include/dt-bindings/media/tvp5150.h                |   2 +-
 include/linux/videodev2.h                          |   2 +-
 include/media/drv-intf/cx25840.h                   |   2 +-
 include/media/drv-intf/msp3400.h                   |   2 +-
 include/media/i2c/bt819.h                          |   2 +-
 include/media/i2c/cs5345.h                         |   2 +-
 include/media/i2c/cs53l32a.h                       |   2 +-
 include/media/i2c/m52790.h                         |   2 +-
 include/media/i2c/mt9v011.h                        |   2 +-
 include/media/i2c/saa7115.h                        |   2 +-
 include/media/i2c/saa7127.h                        |   2 +-
 include/media/i2c/ths7303.h                        |   2 +-
 include/media/i2c/tvaudio.h                        |   2 +-
 include/media/i2c/upd64031a.h                      |   2 +-
 include/media/i2c/upd64083.h                       |   2 +-
 include/media/i2c/wm8775.h                         |   2 +-
 include/media/media-request.h                      |   2 +-
 include/media/v4l2-common.h                        |   2 +-
 include/media/v4l2-ctrls.h                         |   2 +-
 include/media/v4l2-device.h                        |   2 +-
 include/media/v4l2-subdev.h                        |   2 +-
 include/uapi/linux/ivtv.h                          |   2 +-
 include/uapi/linux/v4l2-dv-timings.h               |   2 +-
 include/uapi/linux/videodev2.h                     |   2 +-
 190 files changed, 1293 insertions(+), 334 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
 create mode 100644 drivers/media/platform/qcom/iris/iris_platform_sm8750.h

