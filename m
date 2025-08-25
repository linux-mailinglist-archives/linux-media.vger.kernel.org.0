Return-Path: <linux-media+bounces-41004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18487B33D48
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 12:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39EEF1894510
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 10:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06DC2E11D5;
	Mon, 25 Aug 2025 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwYoBUAd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F272DE1FA
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756119246; cv=none; b=ZKhKFrS7vBOLAUHjArnH6t0KX8ir8eAHtIJYF9M4KNCdbhhQoj7xCZQrebYddREn5G6TOY/0rqTuGAi6wCktuQ/ZXsL77HzoIzzzqPGrTO1UOncO3EBPJXuuPLefpmbaE8ER5wxgtmyNXeXN5jWx5LTr399+gkAxC+GSw6bA0CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756119246; c=relaxed/simple;
	bh=vyOe4dLdmg1S7+AqOwWJBKDuHbYZTgSeuAMOKJesYxw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=EY7zU/SwtnqMmQME+KM7Z6Inh0kpwq9FyBm0Hz9W+V8tyQQx8AIqrLXsq16vgk9fW6zlBLICyVTDGS7ZWD9qGcQNHLQ/El4PSDcLdxpgRoX8u/t7M91tXZeWXwVxZaPDysmbo6pQnPKjn4jzdWTGV8klDIRrOIqMV18kqjy6kPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwYoBUAd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D931C113D0
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756119245;
	bh=vyOe4dLdmg1S7+AqOwWJBKDuHbYZTgSeuAMOKJesYxw=;
	h=Date:From:Subject:To:From;
	b=RwYoBUAdqxK6P/JrmTwZaZTMvxhM2Eexx+aRzY2exPnWY4SqvbyiYnIyw68gt+9VY
	 oudSnroZnLXUigJwY2A4qCeC7z1nhmHjmn8jgWEr8tnmkKI+J9FWju2Dz+H63EVOf2
	 uOzncBn/ZEHDqZUcC33Ea6rD7LCteLEvN6ltgfN9Cf+HXMdpUjhOhekKv4siBN14p1
	 4WhgXyo+H1ZiWkL8hL4IEuy9M9suge05QvbfOgtriv7f7W73TMG4XOb2/tsxScpY66
	 LgcC4MaKu6mh6+vPj4M4gD0VKoRtr0qPVTE0X2ZaoNuzCs+LO5gxPDZMD+s+R6krG3
	 8wO8q9fw85O8A==
Message-ID: <a9ec46c0-cd54-4fb4-8e40-759f613956a6@kernel.org>
Date: Mon, 25 Aug 2025 12:54:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [GIT PULL FOR v6.18] media: update Hans Verkuil's email address
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that I switched to hverkuil@kernel.org for my patch
submissions, update all my email addresses in the code.

Eventually the old hverkuil@xs4all.nl email address will go away,
so make sure it is no longer used.

Regards,

	Hans


The following changes since commit a75b8d198c55e9eb5feb6f6e155496305caba2dc:

media: imon: Remove unused defines (2025-08-15 09:47:13 +0200)

are available in the Git repository at:

git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.18d

for you to fetch changes up to 9b18e1f8241e9df6d8f8b2286a197c25031de25b:

gpu: drm: display: drm_dp_cec: update Hans' email address (2025-08-25 08:38:24 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (8):
MAINTAINERS: update Hans Verkuil's email addresses
Documentation: media: update Hans Verkuil's email address
media: v4l2-core: update Hans Verkuil's email address
media: update Hans Verkuil's email address
Documentation: update Hans Verkuil's email address
media: include: update Hans Verkuil's email address
media: update Hans Verkuil's email address
gpu: drm: display: drm_dp_cec: update Hans' email address

Documentation/ABI/testing/debugfs-cec-error-inj                      |  2 +-
Documentation/admin-guide/bug-hunting.rst                            |  2 +-
Documentation/admin-guide/media/ivtv.rst                             |  2 +-
Documentation/devicetree/bindings/media/cec/cec-common.yaml          |  2 +-
Documentation/devicetree/bindings/media/cec/cec-gpio.yaml            |  2 +-
Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml |  2 +-
Documentation/devicetree/bindings/media/i2c/adi,adv7604.yaml         |  2 +-
Documentation/devicetree/bindings/media/silabs,si470x.yaml           |  2 +-
Documentation/driver-api/media/maintainer-entry-profile.rst          |  4 +--
Documentation/translations/zh_CN/admin-guide/bug-hunting.rst         |  2 +-
Documentation/translations/zh_TW/admin-guide/bug-hunting.rst         |  2 +-
Documentation/userspace-api/media/cec/cec-api.rst                    |  2 +-
Documentation/userspace-api/media/drivers/cx2341x-uapi.rst           |  2 +-
Documentation/userspace-api/media/v4l/v4l2.rst                       |  2 +-
MAINTAINERS                                                          | 82 +++++++++++++++++++++++++-------------------------
drivers/gpu/drm/display/drm_dp_cec.c                                 |  2 +-
drivers/media/cec/core/cec-core.c                                    |  2 +-
drivers/media/cec/platform/cec-gpio/cec-gpio.c                       |  2 +-
drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    |  2 +-
drivers/media/cec/usb/pulse8/pulse8-cec.c                            |  4 +--
drivers/media/cec/usb/rainshadow/rainshadow-cec.c                    |  4 +--
drivers/media/common/cx2341x.c                                       |  2 +-
drivers/media/i2c/adv7604.c                                          |  2 +-
drivers/media/i2c/adv7842.c                                          |  2 +-
drivers/media/i2c/cx25840/cx25840-core.c                             |  4 +--
drivers/media/i2c/saa6752hs.c                                        |  2 +-
drivers/media/i2c/saa7115.c                                          |  2 +-
drivers/media/i2c/saa7127.c                                          |  2 +-
drivers/media/i2c/saa717x.c                                          |  2 +-
drivers/media/i2c/tda9840.c                                          |  2 +-
drivers/media/i2c/tea6415c.c                                         |  2 +-
drivers/media/i2c/tea6420.c                                          |  2 +-
drivers/media/i2c/ths7303.c                                          |  2 +-
drivers/media/i2c/tlv320aic23b.c                                     |  2 +-
drivers/media/i2c/upd64031a.c                                        |  2 +-
drivers/media/i2c/upd64083.c                                         |  2 +-
drivers/media/i2c/vp27smpx.c                                         |  2 +-
drivers/media/i2c/wm8739.c                                           |  2 +-
drivers/media/i2c/wm8775.c                                           |  2 +-
drivers/media/mc/mc-request.c                                        |  2 +-
drivers/media/pci/cobalt/cobalt-driver.c                             |  2 +-
drivers/media/pci/cx18/cx18-audio.c                                  |  2 +-
drivers/media/pci/cx18/cx18-audio.h                                  |  2 +-
drivers/media/pci/cx18/cx18-av-audio.c                               |  2 +-
drivers/media/pci/cx18/cx18-av-core.c                                |  2 +-
drivers/media/pci/cx18/cx18-av-core.h                                |  2 +-
drivers/media/pci/cx18/cx18-av-firmware.c                            |  2 +-
drivers/media/pci/cx18/cx18-av-vbi.c                                 |  2 +-
drivers/media/pci/cx18/cx18-cards.c                                  |  2 +-
drivers/media/pci/cx18/cx18-cards.h                                  |  2 +-
drivers/media/pci/cx18/cx18-controls.c                               |  2 +-
drivers/media/pci/cx18/cx18-controls.h                               |  2 +-
drivers/media/pci/cx18/cx18-driver.c                                 |  2 +-
drivers/media/pci/cx18/cx18-driver.h                                 |  2 +-
drivers/media/pci/cx18/cx18-fileops.c                                |  2 +-
drivers/media/pci/cx18/cx18-fileops.h                                |  2 +-
drivers/media/pci/cx18/cx18-firmware.c                               |  2 +-
drivers/media/pci/cx18/cx18-firmware.h                               |  2 +-
drivers/media/pci/cx18/cx18-gpio.c                                   |  2 +-
drivers/media/pci/cx18/cx18-gpio.h                                   |  2 +-
drivers/media/pci/cx18/cx18-i2c.c                                    |  2 +-
drivers/media/pci/cx18/cx18-i2c.h                                    |  2 +-
drivers/media/pci/cx18/cx18-io.c                                     |  2 +-
drivers/media/pci/cx18/cx18-io.h                                     |  2 +-
drivers/media/pci/cx18/cx18-ioctl.c                                  |  2 +-
drivers/media/pci/cx18/cx18-ioctl.h                                  |  2 +-
drivers/media/pci/cx18/cx18-irq.c                                    |  2 +-
drivers/media/pci/cx18/cx18-irq.h                                    |  2 +-
drivers/media/pci/cx18/cx18-mailbox.c                                |  2 +-
drivers/media/pci/cx18/cx18-mailbox.h                                |  2 +-
drivers/media/pci/cx18/cx18-queue.c                                  |  2 +-
drivers/media/pci/cx18/cx18-queue.h                                  |  2 +-
drivers/media/pci/cx18/cx18-scb.c                                    |  2 +-
drivers/media/pci/cx18/cx18-scb.h                                    |  2 +-
drivers/media/pci/cx18/cx18-streams.c                                |  2 +-
drivers/media/pci/cx18/cx18-streams.h                                |  2 +-
drivers/media/pci/cx18/cx18-vbi.c                                    |  2 +-
drivers/media/pci/cx18/cx18-vbi.h                                    |  2 +-
drivers/media/pci/cx18/cx18-version.h                                |  2 +-
drivers/media/pci/cx18/cx18-video.c                                  |  2 +-
drivers/media/pci/cx18/cx18-video.h                                  |  2 +-
drivers/media/pci/cx18/cx23418.h                                     |  2 +-
drivers/media/pci/ivtv/ivtv-cards.c                                  |  2 +-
drivers/media/pci/ivtv/ivtv-cards.h                                  |  2 +-
drivers/media/pci/ivtv/ivtv-controls.c                               |  2 +-
drivers/media/pci/ivtv/ivtv-controls.h                               |  2 +-
drivers/media/pci/ivtv/ivtv-driver.c                                 |  2 +-
drivers/media/pci/ivtv/ivtv-driver.h                                 |  2 +-
drivers/media/pci/ivtv/ivtv-fileops.c                                |  2 +-
drivers/media/pci/ivtv/ivtv-fileops.h                                |  2 +-
drivers/media/pci/ivtv/ivtv-firmware.c                               |  2 +-
drivers/media/pci/ivtv/ivtv-firmware.h                               |  2 +-
drivers/media/pci/ivtv/ivtv-gpio.c                                   |  2 +-
drivers/media/pci/ivtv/ivtv-gpio.h                                   |  2 +-
drivers/media/pci/ivtv/ivtv-i2c.c                                    |  2 +-
drivers/media/pci/ivtv/ivtv-i2c.h                                    |  2 +-
drivers/media/pci/ivtv/ivtv-ioctl.c                                  |  2 +-
drivers/media/pci/ivtv/ivtv-ioctl.h                                  |  2 +-
drivers/media/pci/ivtv/ivtv-irq.c                                    |  2 +-
drivers/media/pci/ivtv/ivtv-irq.h                                    |  2 +-
drivers/media/pci/ivtv/ivtv-mailbox.c                                |  2 +-
drivers/media/pci/ivtv/ivtv-mailbox.h                                |  2 +-
drivers/media/pci/ivtv/ivtv-queue.c                                  |  2 +-
drivers/media/pci/ivtv/ivtv-queue.h                                  |  2 +-
drivers/media/pci/ivtv/ivtv-routing.c                                |  2 +-
drivers/media/pci/ivtv/ivtv-routing.h                                |  2 +-
drivers/media/pci/ivtv/ivtv-streams.c                                |  2 +-
drivers/media/pci/ivtv/ivtv-streams.h                                |  2 +-
drivers/media/pci/ivtv/ivtv-udma.c                                   |  2 +-
drivers/media/pci/ivtv/ivtv-udma.h                                   |  2 +-
drivers/media/pci/ivtv/ivtv-vbi.c                                    |  2 +-
drivers/media/pci/ivtv/ivtv-vbi.h                                    |  2 +-
drivers/media/pci/ivtv/ivtv-version.h                                |  2 +-
drivers/media/pci/tw68/tw68-core.c                                   |  4 +--
drivers/media/pci/tw68/tw68-reg.h                                    |  2 +-
drivers/media/pci/tw68/tw68-risc.c                                   |  2 +-
drivers/media/pci/tw68/tw68-video.c                                  |  2 +-
drivers/media/pci/tw68/tw68.h                                        |  2 +-
drivers/media/platform/marvell/cafe-driver.c                         |  2 +-
drivers/media/radio/radio-aimslab.c                                  |  2 +-
drivers/media/radio/radio-aztech.c                                   |  2 +-
drivers/media/radio/radio-gemtek.c                                   |  2 +-
drivers/media/radio/radio-isa.c                                      |  2 +-
drivers/media/radio/radio-isa.h                                      |  2 +-
drivers/media/radio/radio-keene.c                                    |  4 +--
drivers/media/radio/radio-miropcm20.c                                |  2 +-
drivers/media/radio/radio-raremono.c                                 |  4 +--
drivers/media/radio/radio-rtrack2.c                                  |  2 +-
drivers/media/radio/radio-terratec.c                                 |  2 +-
drivers/media/radio/radio-zoltrix.c                                  |  2 +-
drivers/media/test-drivers/vicodec/vicodec-core.c                    |  2 +-
drivers/media/v4l2-core/v4l2-compat-ioctl32.c                        |  2 +-
drivers/media/v4l2-core/v4l2-ctrls-api.c                             |  2 +-
drivers/media/v4l2-core/v4l2-ctrls-core.c                            |  2 +-
drivers/media/v4l2-core/v4l2-ctrls-defs.c                            |  2 +-
drivers/media/v4l2-core/v4l2-ctrls-priv.h                            |  2 +-
drivers/media/v4l2-core/v4l2-ctrls-request.c                         |  2 +-
drivers/media/v4l2-core/v4l2-device.c                                |  2 +-
include/dt-bindings/media/tvp5150.h                                  |  2 +-
include/linux/videodev2.h                                            |  2 +-
include/media/drv-intf/cx25840.h                                     |  2 +-
include/media/drv-intf/msp3400.h                                     |  2 +-
include/media/i2c/bt819.h                                            |  2 +-
include/media/i2c/cs5345.h                                           |  2 +-
include/media/i2c/cs53l32a.h                                         |  2 +-
include/media/i2c/m52790.h                                           |  2 +-
include/media/i2c/mt9v011.h                                          |  2 +-
include/media/i2c/saa7115.h                                          |  2 +-
include/media/i2c/saa7127.h                                          |  2 +-
include/media/i2c/ths7303.h                                          |  2 +-
include/media/i2c/tvaudio.h                                          |  2 +-
include/media/i2c/upd64031a.h                                        |  2 +-
include/media/i2c/upd64083.h                                         |  2 +-
include/media/i2c/wm8775.h                                           |  2 +-
include/media/media-request.h                                        |  2 +-
include/media/v4l2-common.h                                          |  2 +-
include/media/v4l2-ctrls.h                                           |  2 +-
include/media/v4l2-device.h                                          |  2 +-
include/media/v4l2-subdev.h                                          |  2 +-
include/uapi/linux/ivtv.h                                            |  2 +-
include/uapi/linux/v4l2-dv-timings.h                                 |  2 +-
include/uapi/linux/videodev2.h                                       |  2 +-
162 files changed, 209 insertions(+), 209 deletions(-)

