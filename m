Return-Path: <linux-media+bounces-25543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83512A25532
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 10:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0552C16669B
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD6620765F;
	Mon,  3 Feb 2025 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxnDl+zZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1462066EA
	for <linux-media@vger.kernel.org>; Mon,  3 Feb 2025 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573172; cv=none; b=RoiLs13P1KFSE9yjq35Jt0xS8ekKTeR9V62ac7nTqSUVPXOEvfGX1wBkzFYIS3pvZ3JPOzHlA7ahanGpmsj1kBnDs475v1Gp/4sj3G55yJVWYPiN6rcfDhBAsDRFmKvBSjMo+LZEfj8DD89J5K1OjHsMEi8qFMZKO9tk2eHnqO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573172; c=relaxed/simple;
	bh=r9zqIRw6f+8FmkHtzsQ40XEEK1zoMIrS6/e9TGsu/wQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IJ8B1KXQMWCPCn0iXypchKOZAXHYtPhUu9YRPTYICRAkD1xMCQKgb/n+2oYJQn7bTX4xNlJc79Z+c1Qs+5F4OMYHL/eoHFYPNdKJOxXz8fnANYBT5HthnDD/JlXPxVSadhk0271tRZZc87DkhW7xqlchArB6p+T2MLav2/p6wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxnDl+zZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573171; x=1770109171;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r9zqIRw6f+8FmkHtzsQ40XEEK1zoMIrS6/e9TGsu/wQ=;
  b=WxnDl+zZzPZNlb2vG1b6vxLT7y/xegpFKSrcWwNEBkZ1YvnPiJM1mxTC
   PuBDhC28Utft5V/rIVdswJRtgDYbq0LnTbzkttnDZFZ6lOz9zth0U1H/3
   QOsmJ9QL0mQ2cyxuHOpjcgeM1syMHzQFin9JTZ/ruMgnmj0FoZWGEC3U0
   W4y0c3vqqKlmf0+/8A9oTZxrRteETFJpf/akjSZ4K/9FKPT30DnQmfSAa
   sBqGYhvikQhAROBCzdQP+4iCQ62DpY69CNOmtsweyjyE0hQR5S4j3KB6f
   2OwmV7RZLyMH+ODMr/jbRsJ54+I114rrNwlhOpWJeR/R0hPBeUCbXNQUY
   A==;
X-CSE-ConnectionGUID: zUYXIezMQnSYYPIUzreCVg==
X-CSE-MsgGUID: qQD7fx95SwS5uRP55HWZnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50472683"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50472683"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:31 -0800
X-CSE-ConnectionGUID: yI+Yb3DHTJqAu/m41qqVIw==
X-CSE-MsgGUID: SXgGQ6vxS3OzKYwnfsmLWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110382968"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 00:59:24 -0800
Received: from svinhufvud.intel.com (maa-artisokka.localdomain [192.168.240.50])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 01FEF11FC22;
	Mon,  3 Feb 2025 10:59:18 +0200 (EET)
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
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [RFC v5 06/15] media: uapi: Add V4L2_CID_CONFIG_MODEL control
Date: Mon,  3 Feb 2025 10:58:44 +0200
Message-Id: <20250203085853.1361401-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the V4L2_CID_CONFIG_MODEL control for the configuration model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/ext-ctrls-image-process.rst      | 4 ++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                    | 5 +++++
 include/uapi/linux/v4l2-controls.h                           | 3 +++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
index 27803dca8d3e..2ae17ed99729 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
@@ -55,3 +55,7 @@ Image Process Control IDs
     control value divided by e.g. 0x100, meaning that to get no
     digital gain the control value needs to be 0x100. The no-gain
     configuration is also typically the default.
+
+``V4L2_CID_CONFIG_MODEL (bitmask)``
+    Which configuration models the sub-device supports. Please see
+    :ref:`media_subdev_config_model`. This is a read-only control.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..24c9c25e20d1 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1164,6 +1164,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_TEST_PATTERN:		return "Test Pattern";
 	case V4L2_CID_DEINTERLACING_MODE:	return "Deinterlacing Mode";
 	case V4L2_CID_DIGITAL_GAIN:		return "Digital Gain";
+	case V4L2_CID_CONFIG_MODEL:		return "Sub-device configuration model";
 
 	/* DV controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1481,6 +1482,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_DV_RX_POWER_PRESENT:
 		*type = V4L2_CTRL_TYPE_BITMASK;
 		break;
+	case V4L2_CID_CONFIG_MODEL:
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		*type = V4L2_CTRL_TYPE_BITMASK;
+		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
 		*type = V4L2_CTRL_TYPE_INTEGER;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..731add75d9ee 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1225,6 +1225,9 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 3)
 #define V4L2_CID_DEINTERLACING_MODE		(V4L2_CID_IMAGE_PROC_CLASS_BASE + 4)
 #define V4L2_CID_DIGITAL_GAIN			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 5)
+#define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
+
+#define V4L2_CID_CONFIG_MODEL_COMMON_RAW	(1U << 0)
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
2.39.5


