Return-Path: <linux-media+bounces-3680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A56482D649
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 10:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0E7D281AD6
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 09:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96799DDAF;
	Mon, 15 Jan 2024 09:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lWtTUSP4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A594CF50A
	for <linux-media@vger.kernel.org>; Mon, 15 Jan 2024 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705312027; x=1736848027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YIZ886Ib94hbMXvCAUKtKsQVHkRc/eCi63yk8BK3l8s=;
  b=lWtTUSP4CrBlBPJpFq4IghXD1n8czumGp/ad59mmLLZWnlNx8l1nlPzt
   sHXzhTo8go9pDTKfAXGlEJ0GXVzyx3Ahq0RjgSahmAbxfAJrEhAZoLoCy
   OVwjOQjTvhozMEJ+NX6b0jckA2n1ZxEJVGpNfNtYvL++usuDpquVwp7/k
   6a4E493LBSF6fVBJTd4sZUA3Yn8l9083R4QJOvcgYS+3DYMbTPl7JnZ5H
   +KAvrjBitg6aJqDSkBbQxuUsO7TpSQVXVjzMC7m39ve6OLBXv9l6CbcYH
   ov4UQ+dGsPLqM6td99A541HbFJh/Z+rC+AcEdswTKxunBDFZnRcBvA7rh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6300743"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="6300743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="32081095"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 01:47:06 -0800
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1C41711FB8A;
	Mon, 15 Jan 2024 11:47:02 +0200 (EET)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] media: Documentation: Rework CCS driver documentation
Date: Mon, 15 Jan 2024 11:47:01 +0200
Message-Id: <20240115094701.249998-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop duplicated UAPI specific portions of the CCS (kernel) documentation
and fix a spelling error in UAPI documentation previously fixed in driver
documentation.

Also add references both ways.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../driver-api/media/drivers/ccs/ccs.rst      | 53 ++-----------------
 .../userspace-api/media/drivers/ccs.rst       |  6 ++-
 2 files changed, 10 insertions(+), 49 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/ccs/ccs.rst b/Documentation/driver-api/media/drivers/ccs/ccs.rst
index 776eec72bc80..5d4451339b7f 100644
--- a/Documentation/driver-api/media/drivers/ccs/ccs.rst
+++ b/Documentation/driver-api/media/drivers/ccs/ccs.rst
@@ -2,59 +2,16 @@
 
 .. include:: <isonum.txt>
 
+.. _media-ccs-driver:
+
 MIPI CCS camera sensor driver
 =============================
 
 The MIPI CCS camera sensor driver is a generic driver for `MIPI CCS
 <https://www.mipi.org/specifications/camera-command-set>`_ compliant
-camera sensors. It exposes three sub-devices representing the pixel array,
-the binner and the scaler.
-
-As the capabilities of individual devices vary, the driver exposes
-interfaces based on the capabilities that exist in hardware.
-
-Pixel Array sub-device
-----------------------
-
-The pixel array sub-device represents the camera sensor's pixel matrix, as well
-as analogue crop functionality present in many compliant devices. The analogue
-crop is configured using the ``V4L2_SEL_TGT_CROP`` on the source pad (0) of the
-entity. The size of the pixel matrix can be obtained by getting the
-``V4L2_SEL_TGT_NATIVE_SIZE`` target.
-
-Binner
-------
-
-The binner sub-device represents the binning functionality on the sensor. For
-that purpose, selection target ``V4L2_SEL_TGT_COMPOSE`` is supported on the
-sink pad (0).
-
-Additionally, if a device has no scaler or digital crop functionality, the
-source pad (1) exposes another digital crop selection rectangle that can only
-crop at the end of the lines and frames.
-
-Scaler
-------
-
-The scaler sub-device represents the digital crop and scaling functionality of
-the sensor. The V4L2 selection target ``V4L2_SEL_TGT_CROP`` is used to
-configure the digital crop on the sink pad (0) when digital crop is supported.
-Scaling is configured using selection target ``V4L2_SEL_TGT_COMPOSE`` on the
-sink pad (0) as well.
-
-Additionally, if the scaler sub-device exists, its source pad (1) exposes
-another digital crop selection rectangle that can only crop at the end of the
-lines and frames.
-
-Digital and analogue crop
--------------------------
-
-Digital crop functionality is referred to as cropping that effectively works by
-dropping some data on the floor. Analogue crop, on the other hand, means that
-the cropped information is never retrieved. In case of camera sensors, the
-analogue data is never read from the pixel matrix that are outside the
-configured selection rectangle that designates crop. The difference has an
-effect in device timing and likely also in power consumption.
+camera sensors.
+
+Also see :ref:`the CCS driver UAPI documentation <media-ccs-uapi>`.
 
 CCS static data
 ---------------
diff --git a/Documentation/userspace-api/media/drivers/ccs.rst b/Documentation/userspace-api/media/drivers/ccs.rst
index ad8615233bae..bc2804ec663b 100644
--- a/Documentation/userspace-api/media/drivers/ccs.rst
+++ b/Documentation/userspace-api/media/drivers/ccs.rst
@@ -2,6 +2,8 @@
 
 .. include:: <isonum.txt>
 
+.. _media-ccs-uapi:
+
 MIPI CCS camera sensor driver
 =============================
 
@@ -13,6 +15,8 @@ the binner and the scaler.
 As the capabilities of individual devices vary, the driver exposes
 interfaces based on the capabilities that exist in hardware.
 
+Also see :ref:`the CCS driver kernel documentation <media-ccs-driver>`.
+
 Pixel Array sub-device
 ----------------------
 
@@ -30,7 +34,7 @@ that purpose, selection target ``V4L2_SEL_TGT_COMPOSE`` is supported on the
 sink pad (0).
 
 Additionally, if a device has no scaler or digital crop functionality, the
-source pad (1) expses another digital crop selection rectangle that can only
+source pad (1) exposes another digital crop selection rectangle that can only
 crop at the end of the lines and frames.
 
 Scaler
-- 
2.39.2


