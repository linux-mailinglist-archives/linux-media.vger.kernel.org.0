Return-Path: <linux-media+bounces-9588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 333AD8A74F9
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 937C0B21EB9
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC3A13BAC2;
	Tue, 16 Apr 2024 19:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnIn3rxN"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211F8139CF4
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296059; cv=none; b=nmAeElHfNptBhcUCGyEHTGG0DxVrwDyESrHAd/YR4pXsDhI2YrDXu9vbolVSm8kPwuVrTX+KmDpl+666/riDwRRiw1q7w8hqEIuIH+hXc6FLwnPk77p+78612raFQcQtyV5xEWQEjJMgrYiBgXIrjPh5RUo2BzUXjKYsnPctKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296059; c=relaxed/simple;
	bh=0El9SnbozgnjdR4/omqd9AoBKLjopdpOuHyz10wpJJc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RKVnC2hpS7XbMSQNc0z6uRPwyyciZrMSY5pBLGxy7pPWrhBAipnOXJjAut5+kIrraQmY3VoX3ynIwKuXEoaJycaFdX7EQS82nqpUeMkjimHKx/akLNYO9WFPhlq9BVOHUKgKfxFIwniIiemF9FJA7H2ZLf4q9kyvN/yBXM/UShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnIn3rxN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296058; x=1744832058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0El9SnbozgnjdR4/omqd9AoBKLjopdpOuHyz10wpJJc=;
  b=FnIn3rxNMpsybY5BkzWMihYkK3DzbYz+ZRqlSQl+e9Th1ljdT9Io4bv7
   M5knf/qT3cn8vXB8CXPdasPtXS5Q7AmcKY7stFy2LiiWIbSUIf26vu2bR
   QUG6+L9TEnpIkzpyFvJvNF9DKQSo6ycUon/tVUqkZuEs8oQ++Lz0bPF0W
   cIWfW01wHH0SRzxaMAuutB1QAVYR78P0U5ci3tY02vj5CN3iSaPUyYArO
   aDDYMFxmVvTuUs2eLUwWbBrXzbDOmRtEi+ebLK9eSnvuHTdFbdRc8nE/U
   9JKDL86whaaXOuTBOiARR5NxLvdUtRscegEfinLXInCB5t7GTyf7j3FCm
   g==;
X-CSE-ConnectionGUID: 8pgyWGr7Qn2c2nMNJFtFKA==
X-CSE-MsgGUID: mQwKuccyT5aVQLA/uSdyWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929882"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929882"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:18 -0700
X-CSE-ConnectionGUID: L9s79xE8SIyRDDThEBqCjA==
X-CSE-MsgGUID: 7Vr+JP/zTtil41TEvDSOGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380261"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:15 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 95E5F12053D;
	Tue, 16 Apr 2024 22:34:11 +0300 (EEST)
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
Subject: [PATCH v9 36/46] media: uapi: Add media bus code for ov2740 embedded data
Date: Tue, 16 Apr 2024 22:33:09 +0300
Message-Id: <20240416193319.778192-37-sakari.ailus@linux.intel.com>
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

Add a media bus code for ov2740 camera sensor embedded data and document
it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 .../media/v4l/subdev-formats.rst              | 70 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 +-
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index a04756092238..c99b58cb8c7b 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8596,3 +8596,73 @@ This mbus code are only used for "2-byte simplified tagged data format" (code
 embedded data format codes.
 
 Also see :ref:`CCS driver documentation <media-ccs-routes>`.
+
+Omnivision OV2740 Embedded Data Format
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Omnivision OV2740 camera sensor produces the following embedded data format,
+indicated by mbus code MEDIA_BUS_FMT_OV2740_EMBEDDED. The format conforms to
+:ref:`CCS embedded data format <MEDIA-BUS-FMT-CCS-EMBEDDED>` up to level 1.
+
+.. flat-table:: Omnivision OV2740 Embedded Data Format. Octets at indices marked
+                reserved or unused have been omitted from the table. The values
+                are big endian byte order.
+    :header-rows: 1
+
+    * - Offset
+      - Size in bits (active bits if not the same as size)
+      - Content description
+    * - 4
+      - 16 (10--0)
+      - Analogue gain
+    * - 6
+      - 16
+      - Coarse integration time
+    * - 10
+      - 8
+      - Dpc correction threshold
+    * - 15
+      - 16
+      - Output image width
+    * - 17
+      - 16
+      - Output image height
+    * - 23
+      - 8
+      - MIPI header revision number (2)
+    * - 31
+      - 8
+      - Vertical (bit 1) and horizontal flip (bit 0)
+    * - 32
+      - 8
+      - Frame duration A
+    * - 33
+      - 8
+      - Frame duration B
+    * - 34
+      - 8
+      - Context count (2)
+    * - 35
+      - 8
+      - Context select
+    * - 54
+      - 8
+      - Data pedestal bits 9--2
+    * - 63
+      - 8
+      - Frame average bits 9--2
+    * - 64
+      - 16
+      - Digital gain red
+    * - 66
+      - 16
+      - Digital gain greenr
+    * - 68
+      - 16
+      - Digital gain blue
+    * - 70
+      - 16
+      - Digital gain greenb
+    * - 89
+      - 8
+      - Frame counter (starts at 1, wraps to 0 after 255)
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 03f7e9ab517b..13e68c2ccb61 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -183,7 +183,8 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
-/* Specific metadata formats. Next is 0x9002. */
+/* Specific metadata formats. Next is 0x9003. */
 #define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
+#define MEDIA_BUS_FMT_OV2740_EMBEDDED		0x9002
 
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.39.2


