Return-Path: <linux-media+bounces-16038-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FEB94CBE8
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 10:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FDC5B23246
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2024 08:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C65718CBEB;
	Fri,  9 Aug 2024 08:13:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4282C8D1;
	Fri,  9 Aug 2024 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723191192; cv=none; b=eb0tmZg1AOsxQFzyd5YAV3cbJGrSaZLsynbwI34n0RFMX9+ajjpG7cHpARSQRtUCLLklT95lSYENFs5k7WpgSWb8a3OOkVnXl9wOb4Na/e5SaJW12dnUe+hdXt+4TsLjv8ND+LyVc4Zw9ojzS9gy5SUTJigt4V75RfKOxkxlijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723191192; c=relaxed/simple;
	bh=vh6hDXEv9oqiDFzEaGvURSPirELff669pvuKgritvyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CDVFYWeUczg0k+bFPCVL+zXy6Lhm3ixtgUUrAss0n/yScJ3qXyzqdImG/B0odlBimOuHpLVMRNmI0sPBJetWvfW/ogRoAYgFezgWJng40S6FdbWJJ9nJELX1etx0baZD9AUh9lzuKjEFQSYhkpSoEDcFdRMrzWTn2iVW41oan14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7ADFC32782;
	Fri,  9 Aug 2024 08:13:11 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: linux-input@vger.kernel.org
Subject: [PATCH 0/6] media: cec: add support for the Extron DA HD 4K Plus HDMI Splitter
Date: Fri,  9 Aug 2024 09:57:32 +0200
Message-ID: <cover.1723190258.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Extron DA HD 4K Plus HDMI Splitter:

https://www.extron.com/product/dahd4kplusseries

This HDMI Splitter supports CEC and reading (HDMI outputs) and writing
(HDMI input) of EDIDs.

This driver adds support for this device, allowing full control of the
CEC functionality (each HDMI input or output has its own /dev/cecX device)
and EDIDs (each HDMI input or output has its own /dev/videoX device).

By using module options you can configure the driver to be fully transparent,
i.e. it will pass on CEC messages between input and outputs and automatically
configure EDIDs based on the detected displays, or leave it in manual mode,
requiring userspace to configure everything manually.

Since the V4L2 API is only used to read/write the EDID and no video streaming
takes place (that's all handled by the HDMI Splitter), a new capability
CAP_EDID is added (first three patches). Next SERIO_EXTRON_DA_HD_PLUS is
added to serio.h (this driver uses the USB serial port of the Extron device
to control it). Then a small patch for the cec framework is applied that
makes it possible for the extron driver to use the cec_get/put_device()
functions. And finally the driver itself is added.

Note: this requires an update to the inputattach utility as well, once the
SERIO_EXTRON_DA_HD_PLUS is added. There will also be a v4l2-compliance patch
to test the new capability. I hope to post that in 1-2 weeks (it needs a
bit more testing).

Note that I placed most of the generic CEC handling in cec-splitter.c.
While this is currently part of this driver, it can be moved to media/cec/core
if support for other HDMI Splitters is ever added, so it can be reused.

Regards,

	Hans

Erling Ljunggren (3):
  media: videodev2.h: add V4L2_CAP_EDID
  media: v4l2-dev: handle V4L2_CAP_EDID
  media: docs: Add V4L2_CAP_EDID

Hans Verkuil (3):
  input: serio.h: add SERIO_EXTRON_DA_HD_PLUS
  media: cec: move cec_get/put_device to header
  media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC
    driver

 Documentation/admin-guide/media/cec.rst       |   87 +
 .../userspace-api/media/v4l/biblio.rst        |   11 +
 .../media/v4l/vidioc-querycap.rst             |   11 +
 .../media/videodev2.h.rst.exceptions          |    1 +
 MAINTAINERS                                   |    7 +
 drivers/media/cec/core/cec-api.c              |    4 +-
 drivers/media/cec/core/cec-core.c             |   29 -
 drivers/media/cec/core/cec-priv.h             |    2 -
 drivers/media/cec/usb/Kconfig                 |    1 +
 drivers/media/cec/usb/Makefile                |    1 +
 .../cec/usb/extron-da-hd-4k-plus/Kconfig      |   14 +
 .../cec/usb/extron-da-hd-4k-plus/Makefile     |    8 +
 .../usb/extron-da-hd-4k-plus/cec-splitter.c   |  657 ++++++
 .../usb/extron-da-hd-4k-plus/cec-splitter.h   |   51 +
 .../extron-da-hd-4k-plus.c                    | 1836 +++++++++++++++++
 .../extron-da-hd-4k-plus.h                    |  118 ++
 drivers/media/v4l2-core/v4l2-dev.c            |   15 +
 include/media/cec.h                           |   31 +
 include/uapi/linux/serio.h                    |    1 +
 include/uapi/linux/videodev2.h                |    1 +
 20 files changed, 2853 insertions(+), 33 deletions(-)
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/Kconfig
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/Makefile
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.c
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
 create mode 100644 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h

-- 
2.43.0


