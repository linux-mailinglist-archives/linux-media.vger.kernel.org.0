Return-Path: <linux-media+bounces-10035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 424FF8B0E09
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8587CB2490D
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A8B15FA93;
	Wed, 24 Apr 2024 15:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oXBUAQMs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D5715F411
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713972161; cv=none; b=D80342qcVqUhIFDhinVCh5boJcGkPWr3ZQ3CcPQzYY8MZjmVv3WvoBcFK251TD4mjgRcopZ8SipsJ8ogEUvwDFfmGf69ZWVHCcXzy+u6CGXRUOtKNiiorWJM98GHFf1fXZSc4yWN4mA0BI7dMdBiWgDBREMWX2ZWgaidBdrUurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713972161; c=relaxed/simple;
	bh=wdISsSfV0sjzdixWu5MN7+M4hfoDvP7mi1NogrtY0JQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vb1JbTgaa3Rv2ln8qJOqxX2H3E9yvvugEO7KF8Lg0QMih51lCwx3cu7uGNhVOszoN/wVQRe/Ysj6g3D1zQatPDHI4UIqVcxurlrpYOa10UA7+6G0XbrQRirNofT0mo4rZSNJ98UOI2C1yYnUEfjv2TazcekYoY5QcvNhYmIWiaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oXBUAQMs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9CDB0674;
	Wed, 24 Apr 2024 17:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713972105;
	bh=wdISsSfV0sjzdixWu5MN7+M4hfoDvP7mi1NogrtY0JQ=;
	h=From:To:Cc:Subject:Date:From;
	b=oXBUAQMsjp9N5MO0z2u9K5FiMknCn7F3PQuVZXUsaPOgbDHL2fDCu7FWL9/XfdRf1
	 Ij1v4RltRfVn52KLVy83kYVB4MQzip+aMZUkykiXZTCpYH84fsYZ5bRZbuId1ZpYh/
	 gY9FpyflqPtBfRHGLhervz+lbk9LV6+NL97anRCo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gregor Jasny <gjasny@googlemail.com>
Subject: [v4l-utils] [PATCH v2 0/7] Support for the generic line-based metadata support
Date: Wed, 24 Apr 2024 18:22:23 +0300
Message-ID: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This patch series adds support for the generic line-based metadata
support API. The API is currently under development, with the latest
version posted to the linux-media mailing list in [1].

The series by pulling in the kernel header changes for the generic
line-based metadata support (1/7). This patch is not meant to be merged
as-is, but should be replaced with a kernel header sync with the stage
tree once the kernel side gets merged.

The next three patches (2/7 to 4/7) update media-ctl and v4l2-compliance
to use the changed routing API, and test the
V4L2_FMT_FLAG_META_LINE_BASED flag.

The remaining patches then extend support in media-ctl and
v4l2-compliance for the MEDIA_PAD_FL_INTERNAL and
V4L2_SUBDEV_ROUTE_FL_IMMUTABLE flags. They depend on further API
extensions that are not ready yet, and are thus not meant to be merged
at this point. They are needed to support further development related to
sensor embedded data, used with Unicam and the IMX219 sensor driver.

This has been tested on a Raspberry Pi 4 with an IMX219 sensor, and the
in-progress work to upstream the Raspberry Pi Unicam driver. The kernel
code can be found in [2].

[1] https://lore.kernel.org/linux-media/20240424122237.875000-1-sakari.ailus@linux.intel.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=rpi/v6.9/merge

Laurent Pinchart (5):
  v4l-utils: sync-with-kernel
  v4l2-compliance: Support the changed routing API
  v4l2-compliance: Add tests for V4L2_FMT_FLAG_META_LINE_BASED flag
  v4l-utils: sync-with-kernel
  v4l2-compliance: Test IMMUTABLE route flag

Sakari Ailus (2):
  utils: media-ctl: Support changed routing API
  utils: media-ctl: Print the INTERNAL pad flag

 contrib/freebsd/include/linux/videodev2.h   | 26 ++++++++++++++++++++-
 contrib/test/ioctl_32.h                     |  4 ++--
 contrib/test/ioctl_64.h                     |  4 ++--
 include/linux/dvb/frontend.h                |  2 +-
 include/linux/media-bus-format.h            |  9 +++++++
 include/linux/media.h                       |  1 +
 include/linux/v4l2-mediabus.h               | 18 +++++++++-----
 include/linux/v4l2-subdev.h                 | 18 +++++++++++---
 include/linux/videodev2.h                   | 26 ++++++++++++++++++++-
 lib/include/libdvbv5/dvb-frontend.h         |  2 +-
 utils/common/v4l2-pix-formats.h             |  9 +++++++
 utils/media-ctl/libv4l2subdev.c             |  4 +++-
 utils/media-ctl/media-ctl.c                 |  1 +
 utils/v4l2-compliance/v4l2-compliance.cpp   | 12 ++++++----
 utils/v4l2-compliance/v4l2-test-formats.cpp | 17 +++++++++++++-
 utils/v4l2-compliance/v4l2-test-subdevs.cpp | 24 ++++++++++++-------
 utils/v4l2-tracer/retrace-gen.cpp           | 14 ++++++++++-
 utils/v4l2-tracer/trace-gen.cpp             |  5 +++-
 utils/v4l2-tracer/v4l2-tracer-info-gen.h    |  4 ++++
 19 files changed, 165 insertions(+), 35 deletions(-)

-- 
Regards,

Laurent Pinchart


