Return-Path: <linux-media+bounces-9580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D151F8A74F1
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86DCE1F22A4D
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A1F2D60A;
	Tue, 16 Apr 2024 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzHy8x+y"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998B813AD04
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296049; cv=none; b=WbKe1qeNagAFGTfWOUAC0w+OBIFsimQvNuHd/Ma5+xKf8GLUm1CDML7HAl3VNmjo9W/eO3sAPFFeR2ZacKxPMtA+prCvowvG4S0jWYdk0WtGEh3W1uGTwf0N3fLD+TdLgpiu46WyRzSOLc+uR55mPJTopOud12xHsbA+AMngvxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296049; c=relaxed/simple;
	bh=WmZ77LjwUfJAaGbhbawY2FKnE8T0KsAU3VEShN0/j9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FdjqK6U3P5qPuIjJlMRoTo9jfSz5u6uqWITqA+S7qhyGxEjDmb1vThPV2E8MEkNaCB/dVJK/xfbN9mX2flkQ0ieD7t3Oc5jLjPg0eYpEFKbdeUU5VGPITywmkGlZb04nGHqfXgS9Y/zUJZlQlPJV1UqwLSBS19KfvGrch6Xn3lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzHy8x+y; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296048; x=1744832048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WmZ77LjwUfJAaGbhbawY2FKnE8T0KsAU3VEShN0/j9A=;
  b=fzHy8x+ySDsfoFBAmsIovek9W4j1rIo0lsYxOLNt1b5uxU0y1XO9yGWe
   B6Z6F5iJ7nUM6iqRjQoCNBWkpsjKA9QKKHt0Harz9nqR2mfkcGcmZPChw
   AkVyTMtOOdDRAWe+wudyJh/JlvRd8RpH+YYrhtCqfuFYMSdqPinDxClVA
   XI0h2PIovrdMltr8RRezc+Yz9dtwztz38Bi5Za1QrN3XfCciYQQQWTwJ8
   4JWUhA4WQDz3gNVUPM/uTBUfiaZMD4JEnL1GJ+L/kGsgkpZnjUtSzBWxE
   gVPue1c5uxURHYAd9elZTQaVkd5J5RtNl4rA6+lmPgKyWJt+iaeEYr4Yr
   Q==;
X-CSE-ConnectionGUID: QgLXV11sR9eRRb1Qqe21PQ==
X-CSE-MsgGUID: QNjkLTSXR4+4DWG8Kew0MQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929842"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929842"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:07 -0700
X-CSE-ConnectionGUID: XgpaSmrqTr2DgpOUCJoapA==
X-CSE-MsgGUID: S3F9+w4DQRqQsiqhh2Ow/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380226"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:04 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 27DA311F879;
	Tue, 16 Apr 2024 22:34:01 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com,
	hongju.wang@intel.com,
	hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH v9 29/46] media: Documentation: ccs: Document routing
Date: Tue, 16 Apr 2024 22:33:02 +0300
Message-Id: <20240416193319.778192-30-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document which routes are available for the CCS driver (source) sub-device
and what configuration are possible.

Also update copyright.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/drivers/ccs.rst       | 38 ++++++++++++++++++-
 .../media/v4l/subdev-formats.rst              |  2 +
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index 03015b33d5ab..53890ac54dab 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -111,4 +111,40 @@ than in the centre.
 Shading correction needs to be enabled for luminance correction level to have an
 effect.
 
-**Copyright** |copy| 2020 Intel Corporation
+.. _media-ccs-routes:
+
+Routes
+------
+
+The CCS driver implements one or two :ref:`routes <subdev-routing>` in
+its source sub-device (scaler sub-device if exists for the device, otherwise
+binner) depending on whether the sensor supports embedded data. (All CCS
+compliant sensors do but the CCS driver supports preceding standards that did
+not require embedded data support, too.)
+
+The first route of the CCS source sub-device is for pixel data (sink pad
+0/stream 0 -> source pad 1/stream 0) and the second one is for embedded data
+(internal sink pad 2/stream 0 -> source pad 1/stream 1).
+
+Embedded data
+~~~~~~~~~~~~~
+
+MIPI CCS supports generation of camera sensor embedded data. The media bus code
+used for this format on the internal sink pad is
+:ref:`MEDIA_BUS_FMT_CCS_EMBEDDDED <MEDIA-BUS-FMT-CCS-EMBEDDED>`.
+
+The bit depth of the CCS pixel data affects how the sensor will output the
+embedded data, adding padding to align with CSI-2 bus :ref:`Data Units
+<media-glossary-data-unit>` for that particular bit depth. This is indicated by
+the generic metadata format on the sensor's source sub-device's source pad.
+
+Devices supporting embedded data for bit depths greater than or equal to 16 may
+support more dense packing or legacy single metadata byte per data unit, or both
+of these. The supported embedded data formats can be enumerated and configured
+on stream 1 of the source pad (1) of the CCS source sub-device.
+
+The use of the denser packing results in embedded data lines being longer than
+the pixel data in data units since the data units are smaller. In bytes the
+embedded data lines are still not longer than the image data lines.
+
+**Copyright** |copy| 2020, 2023 Intel Corporation
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index fa181ce8f48c..a04756092238 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8594,3 +8594,5 @@ levels above.
 This mbus code are only used for "2-byte simplified tagged data format" (code
 0xa) but their use may be extended further in the future, to cover other CCS
 embedded data format codes.
+
+Also see :ref:`CCS driver documentation <media-ccs-routes>`.
-- 
2.39.2


