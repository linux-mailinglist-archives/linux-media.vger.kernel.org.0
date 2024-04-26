Return-Path: <linux-media+bounces-10178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8958B3347
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DAD9B20BD5
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CD813C90F;
	Fri, 26 Apr 2024 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCrEZpEr"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7213CFBA
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121450; cv=none; b=LlzUAqSEwHhjI6OFt4aetCg2Zh/B944f0tRDGZXzXi34z9LvaLbm9SctgSyXHkVJF2U5koxGOCer+ZD2plSVUtXiy6jJ5gr2HJvY+7MVvO12TTpZIQLTEX8rISuaDhBX10iDKudq85FOwzOvG9kO2cb5vNgyXWoEdM03K/a/YsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121450; c=relaxed/simple;
	bh=kosgVd86wxg8v4UmcCQD+QSQsC4uzINuWWW/Ndr3b8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rB0Mpw1kX5wvXTmX7kPIgcVFmCS0lgwsJ7k7BD0+48hRAcOW+x+peFT0WmLUx1N9U7xXUKO4gAl3ojHU5Xnze9ivpEw9sMnX2uzJeNYK1AUrqMwO6+cUMdnVL9QdbBFF6iNhQaVj0IrDZa5mUmQ6S10Ivbolj7Xns7/TmM8aAi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCrEZpEr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121449; x=1745657449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kosgVd86wxg8v4UmcCQD+QSQsC4uzINuWWW/Ndr3b8s=;
  b=OCrEZpErhrGI8xs4Fk7w41nv/ugHqh38z5EZdgiBHFi9wN3wvzKQfbvv
   Lhrfa09ZjNNuk4NZKj6Kh1ZiqCpWqGRckBtQ20vh0/baU6GUAkRH5lbhh
   XXruFo26vdTNFzjiM81Pd0T7GaNJkL9DLjG6i6TZVSdk3Hx6oOTsnR3S1
   zlbOJkBWZziwVFHpo3P48DwaFDzlfpRboGhKQ/pdMCpYX3aTaS2/6Sgyj
   tdVKrFSdJY7NmgfmPyq6vKQwoVwBjv+gSrS2HeNyCbkkjm+4qBTDNGftC
   xUqzDW0StflD13sWQoZsQKzyVSPbxxjJE1BIkuwuAd9Fs/t3oExVCa+rk
   g==;
X-CSE-ConnectionGUID: 5TK4G8hGTx2tlOZa+VZqLw==
X-CSE-MsgGUID: TX1UANLJTQyGNOKI6xiT7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683792"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683792"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:48 -0700
X-CSE-ConnectionGUID: tS2RQ8l+R3e+fiXX+U7WXA==
X-CSE-MsgGUID: 96eCJJTsTeK9j6P4b7kFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598503"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:46 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 937201203ED;
	Fri, 26 Apr 2024 11:50:42 +0300 (EEST)
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
Subject: [PATCH v3 03/14] media: uapi: Add generic serial metadata mbus formats
Date: Fri, 26 Apr 2024 11:50:27 +0300
Message-Id: <20240426085038.943733-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
References: <20240426085038.943733-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add generic serial metadata mbus formats. These formats describe data
width and packing but not the content itself. The reason for specifying
such formats is that the formats as such are fairly device specific but
they are still handled by CSI-2 receiver drivers that should not be aware
of device specific formats. What makes generic metadata formats possible
is that these formats are parsed by software only, after capturing the
data to system memory.

Also add a definition for "Data Unit" to cover what is essentially a pixel
but is not image data.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/glossary.rst          |   7 +
 .../media/v4l/subdev-formats.rst              | 254 ++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |   9 +
 3 files changed, 270 insertions(+)

diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
index 5759f4c78398..55a9c37130ba 100644
--- a/Documentation/userspace-api/media/glossary.rst
+++ b/Documentation/userspace-api/media/glossary.rst
@@ -25,6 +25,13 @@ Glossary
 
 	See :ref:`cec`.
 
+    Data Unit
+
+	Unit of data transported by a bus. On parallel buses, the data unit
+	consists of one or more related samples while on serial buses the data
+	unit is logical. If the data unit is image data, it may also be called a
+	pixel.
+
     Device Driver
 	Part of the Linux Kernel that implements support for a hardware
 	component.
diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index eb3cd20b0cf2..c2cebf61d528 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8306,3 +8306,257 @@ The following table lists the existing metadata formats.
 	both sides of the link and the bus format is a fixed
 	metadata format that is not configurable from userspace.
 	Width and height will be set to 0 for this format.
+
+Generic Serial Metadata Formats
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Generic serial metadata formats are used on serial buses where the actual data
+content is more or less device specific but the data is transmitted and received
+by multiple devices that do not process the data in any way, simply writing
+it to system memory for processing in software at the end of the pipeline.
+
+"b" in an array cell signifies a byte of data, followed by the number of the bit
+and finally the bit number in subscript. "x" indicates a padding bit.
+
+.. _media-bus-format-generic-meta:
+
+.. cssclass: longtable
+
+.. flat-table:: Generic Serial Metadata Formats
+    :header-rows:  2
+    :stub-columns: 0
+
+    * - Identifier
+      - Code
+      -
+      - :cspan:`23` Data organization within bus :term:`Data Unit`
+    * -
+      -
+      - Bit
+      - 23
+      - 22
+      - 21
+      - 20
+      - 19
+      - 18
+      - 17
+      - 16
+      - 15
+      - 14
+      - 13
+      - 12
+      - 11
+      - 10
+      - 9
+      - 8
+      - 7
+      - 6
+      - 5
+      - 4
+      - 3
+      - 2
+      - 1
+      - 0
+    * .. _MEDIA-BUS-FMT-META-8:
+
+      - MEDIA_BUS_FMT_META_8
+      - 0x8001
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-META-10:
+
+      - MEDIA_BUS_FMT_META_10
+      - 0x8002
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - x
+      - x
+    * .. _MEDIA-BUS-FMT-META-12:
+
+      - MEDIA_BUS_FMT_META_12
+      - 0x8003
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - x
+      - x
+      - x
+      - x
+    * .. _MEDIA-BUS-FMT-META-14:
+
+      - MEDIA_BUS_FMT_META_14
+      - 0x8004
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+    * .. _MEDIA-BUS-FMT-META-16:
+
+      - MEDIA_BUS_FMT_META_16
+      - 0x8005
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+    * .. _MEDIA-BUS-FMT-META-20:
+
+      - MEDIA_BUS_FMT_META_20
+      - 0x8006
+      -
+      -
+      -
+      -
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+    * .. _MEDIA-BUS-FMT-META-24:
+
+      - MEDIA_BUS_FMT_META_24
+      - 0x8007
+      -
+      - b0\ :sub:`7`
+      - b0\ :sub:`6`
+      - b0\ :sub:`5`
+      - b0\ :sub:`4`
+      - b0\ :sub:`3`
+      - b0\ :sub:`2`
+      - b0\ :sub:`1`
+      - b0\ :sub:`0`
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
+      - x
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index f05f747e444d..d4c1d991014b 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -174,4 +174,13 @@
  */
 #define MEDIA_BUS_FMT_METADATA_FIXED		0x7001
 
+/* Generic line based metadata formats for serial buses. Next is 0x8008. */
+#define MEDIA_BUS_FMT_META_8			0x8001
+#define MEDIA_BUS_FMT_META_10			0x8002
+#define MEDIA_BUS_FMT_META_12			0x8003
+#define MEDIA_BUS_FMT_META_14			0x8004
+#define MEDIA_BUS_FMT_META_16			0x8005
+#define MEDIA_BUS_FMT_META_20			0x8006
+#define MEDIA_BUS_FMT_META_24			0x8007
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.39.2


