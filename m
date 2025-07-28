Return-Path: <linux-media+bounces-38544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F40B1384F
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C4EF173C99
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9D1255F57;
	Mon, 28 Jul 2025 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9aaioZF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550E722173F
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753696109; cv=none; b=tnEha1QPDJ5W1XgG6Z5DYjgU0bcSNfZr6GHXRktu+iKhoNkV3PvDYDwz6JbVmEjsgfnlh7F1/XhHK96nPaPuFs8bSfJ+wA5WxnvVIWq6HxmqJBPS8IUpWHYizqo39+ujA765XVLIQkF6iAqnXjJzdotfnhRtOsMtMKTvlW/zNLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753696109; c=relaxed/simple;
	bh=ANBbRhKijYwdtWzF8Bpke9rPwkPvY0QlesJRG4BpB/Y=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mRzLvxPwV6aMzwQyOFfvum8h2s/TzUQkCfPTq+JJHpU5I61UIQPupd9OgUPa39/Rk5S61GNNVSfpsKsldV+RIGk5x25VABndOPc9XwaE0ikbtyBWXGwxNQOcW5BI82B4glOGCMPr84DAw2CQ8+Ls9MMSqZvV4BYhqnhhm3gpxGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9aaioZF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD9EC4CEE7
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753696108;
	bh=ANBbRhKijYwdtWzF8Bpke9rPwkPvY0QlesJRG4BpB/Y=;
	h=From:To:Subject:Date:From;
	b=A9aaioZFzb0V3zCkPjkCh7gcv+LlcKDKlAEir1ONqWSoZnyfXtrL1onPRMs7zk6VU
	 pR1xUG9KZV7+uBEVN2fPUEhnDx2+wq7jRCKUoRUYokZKIBfF0RTP6zEPcPEOLxeKeC
	 OCB2fDDXi7N/OhhoW6A4Iwp6DKfx+18vrIi+B1sU8KPzMwcXHpbS9aaFFlftc3yIMG
	 sWlaNJwZhKF1z0KQfKxOONeX0vf92Qr2fA4zP5MKEPmzal3RNChs0x3S2pIF371ziE
	 QU0BLn9SHpwuK4qE/59B47RMOAWsQjK/Oti+/Y/SE9heyxOFklu8j89lPmgOizjdiV
	 xPSIIdkbIMQJg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 0/8] media: update Hans Verkuil's email addresses
Date: Mon, 28 Jul 2025 11:46:55 +0200
Message-ID: <cover.1753696022.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm moving to my kernel.org address, and now that the new
email is in the .mailmap file and listed in pgpkeys, switch
to the new email in MAINTAINERS, documentation and drivers.

Regards,

	Hans

v2: I sent v1 with the old Author email and with the old SoB, and
I noticed it only when it was already sent. Apologies for that.

Hans Verkuil (8):
  MAINTAINERS: update Hans Verkuil's email addresses
  Documentation: media: update Hans Verkuil's email address
  media: v4l2-core: update Hans Verkuil's email address
  media: update Hans Verkuil's email address
  Documentation: update Hans Verkuil's email address
  media: include: update Hans Verkuil's email address
  media: update Hans Verkuil's email address
  gpu: drm: display: drm_dp_cec: update Hans' email address

 .../ABI/testing/debugfs-cec-error-inj         |  2 +-
 Documentation/admin-guide/bug-hunting.rst     |  2 +-
 Documentation/admin-guide/media/ivtv.rst      |  2 +-
 .../bindings/media/cec/cec-common.yaml        |  2 +-
 .../bindings/media/cec/cec-gpio.yaml          |  2 +-
 .../media/cec/nvidia,tegra114-cec.yaml        |  2 +-
 .../bindings/media/i2c/adi,adv7604.yaml       |  2 +-
 .../bindings/media/silabs,si470x.yaml         |  2 +-
 .../media/maintainer-entry-profile.rst        |  4 +-
 .../zh_CN/admin-guide/bug-hunting.rst         |  2 +-
 .../zh_TW/admin-guide/bug-hunting.rst         |  2 +-
 .../userspace-api/media/cec/cec-api.rst       |  2 +-
 .../media/drivers/cx2341x-uapi.rst            |  2 +-
 .../userspace-api/media/v4l/v4l2.rst          |  2 +-
 MAINTAINERS                                   | 82 +++++++++----------
 drivers/gpu/drm/display/drm_dp_cec.c          |  2 +-
 drivers/media/cec/core/cec-core.c             |  2 +-
 .../media/cec/platform/cec-gpio/cec-gpio.c    |  2 +-
 .../extron-da-hd-4k-plus.c                    |  2 +-
 drivers/media/cec/usb/pulse8/pulse8-cec.c     |  4 +-
 .../media/cec/usb/rainshadow/rainshadow-cec.c |  4 +-
 drivers/media/common/cx2341x.c                |  2 +-
 drivers/media/i2c/adv7604.c                   |  2 +-
 drivers/media/i2c/adv7842.c                   |  2 +-
 drivers/media/i2c/cx25840/cx25840-core.c      |  4 +-
 drivers/media/i2c/saa6752hs.c                 |  2 +-
 drivers/media/i2c/saa7115.c                   |  2 +-
 drivers/media/i2c/saa7127.c                   |  2 +-
 drivers/media/i2c/saa717x.c                   |  2 +-
 drivers/media/i2c/tda9840.c                   |  2 +-
 drivers/media/i2c/tea6415c.c                  |  2 +-
 drivers/media/i2c/tea6420.c                   |  2 +-
 drivers/media/i2c/ths7303.c                   |  2 +-
 drivers/media/i2c/tlv320aic23b.c              |  2 +-
 drivers/media/i2c/upd64031a.c                 |  2 +-
 drivers/media/i2c/upd64083.c                  |  2 +-
 drivers/media/i2c/vp27smpx.c                  |  2 +-
 drivers/media/i2c/wm8739.c                    |  2 +-
 drivers/media/i2c/wm8775.c                    |  2 +-
 drivers/media/mc/mc-request.c                 |  2 +-
 drivers/media/pci/cobalt/cobalt-driver.c      |  2 +-
 drivers/media/pci/cx18/cx18-audio.c           |  2 +-
 drivers/media/pci/cx18/cx18-audio.h           |  2 +-
 drivers/media/pci/cx18/cx18-av-audio.c        |  2 +-
 drivers/media/pci/cx18/cx18-av-core.c         |  2 +-
 drivers/media/pci/cx18/cx18-av-core.h         |  2 +-
 drivers/media/pci/cx18/cx18-av-firmware.c     |  2 +-
 drivers/media/pci/cx18/cx18-av-vbi.c          |  2 +-
 drivers/media/pci/cx18/cx18-cards.c           |  2 +-
 drivers/media/pci/cx18/cx18-cards.h           |  2 +-
 drivers/media/pci/cx18/cx18-controls.c        |  2 +-
 drivers/media/pci/cx18/cx18-controls.h        |  2 +-
 drivers/media/pci/cx18/cx18-driver.c          |  2 +-
 drivers/media/pci/cx18/cx18-driver.h          |  2 +-
 drivers/media/pci/cx18/cx18-fileops.c         |  2 +-
 drivers/media/pci/cx18/cx18-fileops.h         |  2 +-
 drivers/media/pci/cx18/cx18-firmware.c        |  2 +-
 drivers/media/pci/cx18/cx18-firmware.h        |  2 +-
 drivers/media/pci/cx18/cx18-gpio.c            |  2 +-
 drivers/media/pci/cx18/cx18-gpio.h            |  2 +-
 drivers/media/pci/cx18/cx18-i2c.c             |  2 +-
 drivers/media/pci/cx18/cx18-i2c.h             |  2 +-
 drivers/media/pci/cx18/cx18-io.c              |  2 +-
 drivers/media/pci/cx18/cx18-io.h              |  2 +-
 drivers/media/pci/cx18/cx18-ioctl.c           |  2 +-
 drivers/media/pci/cx18/cx18-ioctl.h           |  2 +-
 drivers/media/pci/cx18/cx18-irq.c             |  2 +-
 drivers/media/pci/cx18/cx18-irq.h             |  2 +-
 drivers/media/pci/cx18/cx18-mailbox.c         |  2 +-
 drivers/media/pci/cx18/cx18-mailbox.h         |  2 +-
 drivers/media/pci/cx18/cx18-queue.c           |  2 +-
 drivers/media/pci/cx18/cx18-queue.h           |  2 +-
 drivers/media/pci/cx18/cx18-scb.c             |  2 +-
 drivers/media/pci/cx18/cx18-scb.h             |  2 +-
 drivers/media/pci/cx18/cx18-streams.c         |  2 +-
 drivers/media/pci/cx18/cx18-streams.h         |  2 +-
 drivers/media/pci/cx18/cx18-vbi.c             |  2 +-
 drivers/media/pci/cx18/cx18-vbi.h             |  2 +-
 drivers/media/pci/cx18/cx18-version.h         |  2 +-
 drivers/media/pci/cx18/cx18-video.c           |  2 +-
 drivers/media/pci/cx18/cx18-video.h           |  2 +-
 drivers/media/pci/cx18/cx23418.h              |  2 +-
 drivers/media/pci/ivtv/ivtv-cards.c           |  2 +-
 drivers/media/pci/ivtv/ivtv-cards.h           |  2 +-
 drivers/media/pci/ivtv/ivtv-controls.c        |  2 +-
 drivers/media/pci/ivtv/ivtv-controls.h        |  2 +-
 drivers/media/pci/ivtv/ivtv-driver.c          |  2 +-
 drivers/media/pci/ivtv/ivtv-driver.h          |  2 +-
 drivers/media/pci/ivtv/ivtv-fileops.c         |  2 +-
 drivers/media/pci/ivtv/ivtv-fileops.h         |  2 +-
 drivers/media/pci/ivtv/ivtv-firmware.c        |  2 +-
 drivers/media/pci/ivtv/ivtv-firmware.h        |  2 +-
 drivers/media/pci/ivtv/ivtv-gpio.c            |  2 +-
 drivers/media/pci/ivtv/ivtv-gpio.h            |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.c             |  2 +-
 drivers/media/pci/ivtv/ivtv-i2c.h             |  2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  2 +-
 drivers/media/pci/ivtv/ivtv-ioctl.h           |  2 +-
 drivers/media/pci/ivtv/ivtv-irq.c             |  2 +-
 drivers/media/pci/ivtv/ivtv-irq.h             |  2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.c         |  2 +-
 drivers/media/pci/ivtv/ivtv-mailbox.h         |  2 +-
 drivers/media/pci/ivtv/ivtv-queue.c           |  2 +-
 drivers/media/pci/ivtv/ivtv-queue.h           |  2 +-
 drivers/media/pci/ivtv/ivtv-routing.c         |  2 +-
 drivers/media/pci/ivtv/ivtv-routing.h         |  2 +-
 drivers/media/pci/ivtv/ivtv-streams.c         |  2 +-
 drivers/media/pci/ivtv/ivtv-streams.h         |  2 +-
 drivers/media/pci/ivtv/ivtv-udma.c            |  2 +-
 drivers/media/pci/ivtv/ivtv-udma.h            |  2 +-
 drivers/media/pci/ivtv/ivtv-vbi.c             |  2 +-
 drivers/media/pci/ivtv/ivtv-vbi.h             |  2 +-
 drivers/media/pci/ivtv/ivtv-version.h         |  2 +-
 drivers/media/pci/tw68/tw68-core.c            |  4 +-
 drivers/media/pci/tw68/tw68-reg.h             |  2 +-
 drivers/media/pci/tw68/tw68-risc.c            |  2 +-
 drivers/media/pci/tw68/tw68-video.c           |  2 +-
 drivers/media/pci/tw68/tw68.h                 |  2 +-
 drivers/media/platform/marvell/cafe-driver.c  |  2 +-
 drivers/media/radio/radio-aimslab.c           |  2 +-
 drivers/media/radio/radio-aztech.c            |  2 +-
 drivers/media/radio/radio-gemtek.c            |  2 +-
 drivers/media/radio/radio-isa.c               |  2 +-
 drivers/media/radio/radio-isa.h               |  2 +-
 drivers/media/radio/radio-keene.c             |  4 +-
 drivers/media/radio/radio-miropcm20.c         |  2 +-
 drivers/media/radio/radio-raremono.c          |  4 +-
 drivers/media/radio/radio-rtrack2.c           |  2 +-
 drivers/media/radio/radio-terratec.c          |  2 +-
 drivers/media/radio/radio-zoltrix.c           |  2 +-
 .../media/test-drivers/vicodec/vicodec-core.c |  2 +-
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-priv.h     |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c  |  2 +-
 drivers/media/v4l2-core/v4l2-device.c         |  2 +-
 include/dt-bindings/media/tvp5150.h           |  2 +-
 include/linux/videodev2.h                     |  2 +-
 include/media/drv-intf/cx25840.h              |  2 +-
 include/media/drv-intf/msp3400.h              |  2 +-
 include/media/i2c/bt819.h                     |  2 +-
 include/media/i2c/cs5345.h                    |  2 +-
 include/media/i2c/cs53l32a.h                  |  2 +-
 include/media/i2c/m52790.h                    |  2 +-
 include/media/i2c/mt9v011.h                   |  2 +-
 include/media/i2c/saa7115.h                   |  2 +-
 include/media/i2c/saa7127.h                   |  2 +-
 include/media/i2c/ths7303.h                   |  2 +-
 include/media/i2c/tvaudio.h                   |  2 +-
 include/media/i2c/upd64031a.h                 |  2 +-
 include/media/i2c/upd64083.h                  |  2 +-
 include/media/i2c/wm8775.h                    |  2 +-
 include/media/media-request.h                 |  2 +-
 include/media/v4l2-common.h                   |  2 +-
 include/media/v4l2-ctrls.h                    |  2 +-
 include/media/v4l2-device.h                   |  2 +-
 include/media/v4l2-subdev.h                   |  2 +-
 include/uapi/linux/ivtv.h                     |  2 +-
 include/uapi/linux/v4l2-dv-timings.h          |  2 +-
 include/uapi/linux/videodev2.h                |  2 +-
 162 files changed, 209 insertions(+), 209 deletions(-)

-- 
2.47.2


