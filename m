Return-Path: <linux-media+bounces-6968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A0187A38B
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A39281C3D
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AEB168A4;
	Wed, 13 Mar 2024 07:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drYkYq3w"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8152F225A2
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314772; cv=none; b=oMLmG1ZoubQCIUSr+HHJP2YwTB/VI+CxIjkpEJTB5RH2wmurHA2imE13KPosqC6/w6lht09pa299KDIbHf3zOaeKY/HWEq5nQyki26+uTpfHMaU0Niddhr5zkY6/2+8rjJQol4U1AKiWSJVZSgfCkjVpWqDeyqftM2gK13ewlNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314772; c=relaxed/simple;
	bh=MSfCcoqV46ipMdMEqSYXgeUZL61iVWBACrwNdaBF8J8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jnbT7GOOYOB24p/hPIfYz8S0lFNqq0uPeUnC/o8Eks6NwTwh73SB80MeKDkJ6TlSfhuQaEcVpFuF/U/y/3sZZyCxWLizuW5NmQ/HFgwn1zm5xBUzi+tCbCKAKwvQ6tZpB/ioOLx+If+XKJvP4X2AH6hirNeduOvUbLD9O+bD9Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drYkYq3w; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314771; x=1741850771;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MSfCcoqV46ipMdMEqSYXgeUZL61iVWBACrwNdaBF8J8=;
  b=drYkYq3wEnhWmpWLAluCWkwqivIDmjg8ZAmy6TKlBQ47+zXtv2XFih0J
   kk5UhOn7LbDGsHQdIW4EyfJ7ax/a1pm42hvSIAJDNShkt1WvzJ1oOCqG3
   0U+zWN4IS/zFnmEGAmrs0ONFz1v13ZBj+KA9VEJTXJhxN5ssvVXzQdzJe
   zvjAjYd3vMz2fWNmyl9DKeEDb8mTyLreiqWrpSohKo8zUKuvY9rqyAmfJ
   7/FcoL6CGlBUaDKUuYVTDKUIyZGhi1vySfxPblyQj2fA97+oQzaTpMaYz
   Mq7tRuX9Wz9sQuErB0hFzbpRdsifPxCli4e9TMX7iAIGv0csYRt8h3IEc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909318"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542363"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:08 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3CC5A11FB94;
	Wed, 13 Mar 2024 09:26:04 +0200 (EET)
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
Subject: [PATCH v8 32/38] media: uapi: Add media bus code for ov2740 embedded data
Date: Wed, 13 Mar 2024 09:25:10 +0200
Message-Id: <20240313072516.241106-33-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
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
---
 .../media/v4l/subdev-formats.rst              | 66 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 +-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index ca4da6a400ff..a875868ed951 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8594,3 +8594,69 @@ This mbus code are only used for "2-byte simplified tagged data format" (code
 embedded data format codes.
 
 Also see :ref:`CCS driver documentation <media-ccs-routes>`.
+
+Omnivision OV2740 Embedded Data Format
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Omnivision OV2740 camera sensor produces the following embedded data format.
+
+.. flat-table:: Omnivision OV2740 Embedded Data Format. Octets at indices marked
+                reserved or unused have been omitted from the table.
+    :header-rows: 1
+
+    * - Byte
+      - Concent description
+    * - 0
+      - Sensor info
+    * - 4
+      - Analogue gain (bits 10--8)
+    * - 5
+      - Analogue gain (bits 7--0)
+    * - 6
+      - Coarse integration time (bits 15--8)
+    * - 7
+      - Coarse integration time (bits 7--0)
+    * - 10
+      - Dpc correction threshold (bits 9--2)
+    * - 15
+      - Output image width (bits 15--8)
+    * - 16
+      - Output image width (bits 7--0)
+    * - 17
+      - Output image height (bits 15--8)
+    * - 18
+      - Output image height (bits 7--0)
+    * - 23
+      - MIPI header revision number
+    * - 31
+      - Vertical (bit 1) and horizontal flip (bit 0)
+    * - 32
+      - Frame duration A
+    * - 33
+      - Frame duration B
+    * - 34
+      - Context count
+    * - 35
+      - Context select
+    * - 54
+      - Data pedestal (bits 9--2)
+    * - 63
+      - Frame average (bits 9--2)
+    * - 64
+      - Digital gain red
+    * - 65
+      - Digital gain red
+    * - 66
+      - Digital gain greenr
+    * - 67
+      - Digital gain greenr
+    * - 68
+      - Digital gain blue
+    * - 69
+      - Digital gain blue
+    * - 70
+      - Digital gain greenb
+    * - 71
+      - Digital gain greenb
+    * - 89
+      - Frame counter
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


