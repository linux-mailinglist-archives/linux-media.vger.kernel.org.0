Return-Path: <linux-media+bounces-22304-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354C9DC1AD
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7314B163108
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 09:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2118D188915;
	Fri, 29 Nov 2024 09:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtNFdWzD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604E4160799
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 09:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873917; cv=none; b=PFP1cn5hQXPIZxdZjLBa75meueXF698WrqK5k0MFM5qkSYzjejO52rVbQk53npGO2yRW5fG3VnjZXDG5QNSgZtHjTJv+zQvfxnPRoNFouFkVPdCuMv0u8n2VJywPjjDL5OXvd3wAep7vMmgrShfKHKvE/d/w/MPLctOlbPjvlP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873917; c=relaxed/simple;
	bh=oecNkfHwyfv0sRbfhPNfS7Q1w98/iI2AvTLyE05icKM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p6L0M5RzBiG2/IORtrTzQHW2XiufcxtkBI+2UthphFGa1iEsygwjIpiC+1N+nmCCce0UByz1dyW4FYyAfx5EC/6Snh/Jy8+74+aM/o+xfn1Gye3QA+QF3oMzUpluLaJVYsXgO5osJpvR7vtWNLbO6EXmjQBVq6PDwgshM1Hm8No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtNFdWzD; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732873916; x=1764409916;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oecNkfHwyfv0sRbfhPNfS7Q1w98/iI2AvTLyE05icKM=;
  b=OtNFdWzD+I4Usf2fITaO1WtDnN3uoOe6Awjp/0PL8Zu9UtmJo7z53KNV
   LsXetuvkUa5+G2KwtZvp5PvFAsNnFy5vMx3KC6hfsNCWwSDnk0/BFbT0Q
   VqrpZJBenDLGAs6YPH+o3I35IcAbB26oges0y8iTOz8MqHJKNV4Gd8usB
   wm34U7f8w7RY55gV6noBB1v37r94H/Dng6lh8YJfbcuy9aWjHx1xURuLE
   nVBIF/s/GGA4jcMKxudItVCba2KleF57AImGUmZdhEOWWbvcJIOmb8gUd
   JyAKVjalz+dQ8GPSFcXCPi8y5DXCrHtnpeam7ZFDCyac2NaaJOOFWWJlq
   g==;
X-CSE-ConnectionGUID: +WxMG8SLSzqhGWtZkkYkUg==
X-CSE-MsgGUID: Nom692FVR662TF612pBFFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36775947"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="36775947"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:51:55 -0800
X-CSE-ConnectionGUID: zyYFbUmbTNKRcK2KChS2wQ==
X-CSE-MsgGUID: SABde1muRAuup/kj/NloOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="92258504"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 01:51:49 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 64CBF11F775;
	Fri, 29 Nov 2024 11:51:43 +0200 (EET)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [RFC v3 0/9] Sub-device configuration models
Date: Fri, 29 Nov 2024 11:51:33 +0200
Message-Id: <20241129095142.87196-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,

I've been recently working (with others) on sub-device streams support as
well as on internal pads. The two can be used to make sub-device
configuration more versatile.

At the same time, the added interfaces are much more useful if we require
specific semantics of those interfaces, so that the user space knows
exactly what e.g. a given selection target signifies. However, as the same
selection rectangle could be used for a different purpose on a non-raw
sensor device, we need a way to tell how should the user space determine
how to use a given interface.

I'm proposing to solve this problem by introducing sub-device
configuration models, and by the common raw sensor model, also present in
this patchset, in particular.

This has been (and will, for some time, continue to be) the reason why I
have reviewed few sensor driver related patches lately. As we're
introducing a new interface, it's beneficial to be able to use that
interface right from the start, rather than trying to later on offer
compatibility support, which is almost always a fair amount of work with
less than desirable results in the driver.

With this solved, I believe we can enable the use of the streams UAPI.

Comments are welcome.

RFC v2 (labelled as PATCH) is
<20241122100633.8971-1-sakari.ailus@linux.intel.com> on LMML.

RFC v1 is <20241011075535.588140-1-sakari.ailus@linux.intel.com> on LMML.

We may end up postponing merging three last patches (those adding
controls) until current control values are moved to sub-device (and video
device) state. Discussion is needed on the topic.

The compiled documentation can be found here
<URL:https://www.retiisi.eu/~sailus/v4l2/tmp/common-raw/output/userspace-api/media/v4l/dev-subdev.html#media-subdev-config-model-common-raw-sensor>.

since v2:

- Remove the CROP_BOUNDS rectangle on the image data sink pad. It's
  redundant.

- Remove scaling from the sink compose rectangle, leaving binning and
  sub-sampling.

- Introduce scaling as well as post-scaler digital crop on source pad
  (image stream). This is a new patch, preceding control changes.

- Use monospace font for selection targets.

- Improvements in referring to previous configuration steps in text
  description.

since v1:

- Rework the documentation according to the comments (spelling fixes,
  alignment mostly).
  
- Include separate patches for binning and sub-sampling controls.

- Allow binning, scaling and scaling to be configured using the compose
  rectangle. This will change to just scaling in the three last patches.

Sakari Ailus (9):
  media: Documentation: Rework embedded data documentation
  media: Documentation: Add a hyphen to list-based
  media: Documentation: Reword split of sensor driver to two classes
  media: Documentation: Add subdev configuration models, raw sensor
    model
  media: Documentation: Add scaling and post-scaler crop for common raw
  media: uapi: Add V4L2_CID_CONFIG_MODEL control
  media: uapi: Add V4L2_CID_BINNING control for binning configuration
  media: uapi: Add controls for sub-sampling configuration
  media: Documentation: Add binning and sub-sampling controls

 .../media/drivers/camera-sensor.rst           |  53 ++-
 .../media/v4l/common-raw-sensor.dia           | 441 ++++++++++++++++++
 .../media/v4l/common-raw-sensor.svg           | 134 ++++++
 .../userspace-api/media/v4l/dev-subdev.rst    |   2 +
 .../media/v4l/ext-ctrls-camera.rst            |  40 ++
 .../media/v4l/ext-ctrls-image-process.rst     |   4 +
 .../media/v4l/subdev-config-model.rst         | 228 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   9 +
 include/uapi/linux/v4l2-controls.h            |   6 +
 9 files changed, 903 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.dia
 create mode 100644 Documentation/userspace-api/media/v4l/common-raw-sensor.svg
 create mode 100644 Documentation/userspace-api/media/v4l/subdev-config-model.rst


base-commit: f188c7293d34f9ac50c1005da2613d519d97db83
-- 
2.39.5


