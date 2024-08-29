Return-Path: <linux-media+bounces-17129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0529642C3
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8091C1F22C43
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 11:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9924190679;
	Thu, 29 Aug 2024 11:11:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F5018E020
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929879; cv=none; b=fnxoK88WNCYdl8SUPND5aKkoDzNvapawCScxp5orIQ+NVaiWssqBs8pBL7Q74+9HPjMGjjtQ2MXMcPympm6SertR7n+QlRDawpL6vJFFAJcSmY4ZcIpnhtodZXFfSzFll/XPtbPUWfaP+fMPDA18jsjEFd/xO+VpjBEO6A4cHZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929879; c=relaxed/simple;
	bh=B6BGpqIgOF5RfRKmxwxlyeKuQuqi4NJZtykyzOyRI6Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RSWvBOLxII7nEBn8jHLJ62T21NmpP9o9cKJtX5Ux6LQtkda93fSHCUavhbEe5L5ymOmZUX7ZQohVjF0jzkZcwU4SOH1Wq4HvP5eR6X4NOKpIbg7fR3mJqimfyriO1lzBDGm7r1mgz3+tLpPJ8dlA0JKmLU9uR0AV54WkiSVGzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2834AC4CEC1;
	Thu, 29 Aug 2024 11:11:17 +0000 (UTC)
Message-ID: <27ff90a4-8caa-45b3-b6f4-a53bbd732467@xs4all.nl>
Date: Thu, 29 Aug 2024 13:11:16 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Erling Ljunggren <hljunggr@cisco.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.12] media: cec: add extron-da-hd-4k-plus driver
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mauro,

This patch series adds CEC/EDID support for the Extron DA HD 4K Plus HDMI splitter.

The first three patches introduce the V4L2_CAP_EDID capability: drivers with
that capability set only support setting/getting EDIDs for inputs/outputs. There is no
video capture or output, that is all handled in the device. This is the case
for an HDMI Splitter like this, but also for EDID EEPROM drivers (which I hope to
revisit as well at some point).

The fourth patch adds a serio define for this device in the header: this will
be used by the inputattach utility (it is similar to the pulse8-cec driver, which
is also serio based).

The fifth patch moves code around so cec_get/put_device is available to the
driver. And the final patch adds the driver itself.

Note: this driver has been in use for quite some time out-of-tree.

Patches to support V4L2_CAP_EDID in v4l-utils are here:

https://patchwork.linuxtv.org/project/linux-media/list/?series=13487

Regards,

	Hans

The following changes since commit 393556c9f56ced8d9776c32ce99f34913cfd904e:

  Merge tag 'tags/next-media-videobuf-20240827' of git://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git (2024-08-28 13:11:49 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-extron

for you to fetch changes up to 6dc50ad1862903373aeaf2a73ab757e4acc2031b:

  media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver (2024-08-29 11:10:36 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Erling Ljunggren (3):
      media: videodev2.h: add V4L2_CAP_EDID
      media: v4l2-dev: handle V4L2_CAP_EDID
      media: docs: Add V4L2_CAP_EDID

Hans Verkuil (3):
      input: serio.h: add SERIO_EXTRON_DA_HD_PLUS
      media: cec: move cec_get/put_device to header
      media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver

 Documentation/admin-guide/media/cec.rst                           |   87 +++
 Documentation/userspace-api/media/v4l/biblio.rst                  |   11 +
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst         |   11 +
 Documentation/userspace-api/media/videodev2.h.rst.exceptions      |    1 +
 MAINTAINERS                                                       |    7 +
 drivers/media/cec/core/cec-api.c                                  |    4 +-
 drivers/media/cec/core/cec-core.c                                 |   29 -
 drivers/media/cec/core/cec-priv.h                                 |    2 -
 drivers/media/cec/usb/Kconfig                                     |    1 +
 drivers/media/cec/usb/Makefile                                    |    1 +
 drivers/media/cec/usb/extron-da-hd-4k-plus/Kconfig                |   14 +
 drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile               |    8 +
 drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.c         |  657 +++++++++++++++++++++++
 drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h         |   51 ++
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c | 1836 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h |  118 ++++
 drivers/media/v4l2-core/v4l2-dev.c                                |   15 +
 include/media/cec.h                                               |   31 ++
 include/uapi/linux/serio.h                                        |    1 +
 include/uapi/linux/videodev2.h                                    |    1 +
 20 files changed, 2853 insertions(+), 33 deletions(-)
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/Kconfig
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.c
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h

