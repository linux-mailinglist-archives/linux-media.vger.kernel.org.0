Return-Path: <linux-media+bounces-9578-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 651BF8A74EF
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FD4F2840AD
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B356413AD09;
	Tue, 16 Apr 2024 19:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZ5PkRUi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D599139585
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296047; cv=none; b=iGWpPeo3b9tShu0ht568LVO17S7sqQkR/wnOknLN3oK1ozy5VJVOmLjlRoXYsaR5X/yBStqSM4IZmj2KuPVrJfXtM2SkbI6lVV6DByL6rmCpoHKaTbscVcfQGiMtC7BRqnyAuED5M1/wPH9zTnzjdfrsAvDDHzPVQqXmDOVpfns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296047; c=relaxed/simple;
	bh=FKvST9MrhN8JK7mzfgslQ2FDmbGe/y31jpv961MggoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rqn0bKGLVbu0crZpTu8pr+T8WfhBXVKlbGlr/JL0MueYexrbO3Y+g+p/5IIP1TOT1oVdpUQpwyvWeALvy4E+4R04TAmlW12RT+rS7OljN1PVEZ7N9SKupRYcYVRZ/ud2IVUllmiUQ+mN8DN/5X1SmRyQQQT/NK8OjuC+C+byY30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZ5PkRUi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296046; x=1744832046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FKvST9MrhN8JK7mzfgslQ2FDmbGe/y31jpv961MggoQ=;
  b=eZ5PkRUibv1cc0eyKV4XFz6QWv522gGDKhbA2WFtvLZsK1cDxIpA0owj
   6rMSH41pdisiWRCLuI+cIam/jDBjqe27KtGVMVedsnN8AUsp5x+EreG+I
   w2laaEN41ocOcpDzkobQkFazpzwMcKbIyrqKtlSPm5xoBIFdMoT4KTN/l
   rSD9w5cmxLFJM0x0KuXQm3P3EM9y7Oansawp79su9JxWKauIchQoPZQgf
   PwpdRwWJn5OsNjXSFgl6W8YGYCjqJrldqa9mp2QLdN01k7S4JB+6zNL/n
   sNEzW9J2+luXqSKa8tRIIz/KF3j3fCj3wz1byWX9gfiTMOgMPySN8XgfM
   w==;
X-CSE-ConnectionGUID: oLW9M0DcQMGH0k3DXrsZAg==
X-CSE-MsgGUID: K0+QN21VS6CWAHjh3VYTrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929830"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929830"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:04 -0700
X-CSE-ConnectionGUID: Wda0N1nWRK6yxov15FShig==
X-CSE-MsgGUID: lcIaAWdZTVWahqm/ZRT/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22380210"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:01 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9B43712056F;
	Tue, 16 Apr 2024 22:33:58 +0300 (EEST)
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
Subject: [PATCH v9 27/46] media: uapi: ccs: Add media bus code for MIPI CCS embedded data
Date: Tue, 16 Apr 2024 22:33:00 +0300
Message-Id: <20240416193319.778192-28-sakari.ailus@linux.intel.com>
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

Add new MIPI CCS embedded data media bus code
(MEDIA_BUS_FMT_CCS_EMBEDDED).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
---
 .../media/v4l/subdev-formats.rst              | 32 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 ++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 0547f2733ee3..fa181ce8f48c 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -8316,6 +8316,10 @@ content is more or less device specific but the data is transmitted and received
 by multiple devices that do not process the data in any way, simply writing
 it to system memory for processing in software at the end of the pipeline.
 
+The exact format of the data generated by the device is reported on the internal
+source pad of the originating sub-device, using one of the more specific
+metadata formats such as MEDIA_BUS_FMT_CCS_EMBEDDED.
+
 "b" in an array cell signifies a byte of data, followed by the number of the bit
 and finally the bit number in subscript. "x" indicates a padding bit.
 
@@ -8562,3 +8566,31 @@ and finally the bit number in subscript. "x" indicates a padding bit.
       - x
       - x
       - x
+
+.. _MEDIA-BUS-FMT-CCS-EMBEDDED:
+
+MIPI CCS Embedded Data Formats
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+`MIPI CCS <https://www.mipi.org/specifications/camera-command-set>`_ defines a
+metadata format for sensor embedded data, which is used to store the register
+configuration used for capturing a given frame. The format is defined in the CCS
+specification. The media bus code for this format is
+``MEDIA_BUS_FMT_CCS_EMBEDDED``.
+
+The CCS embedded data format definition includes three levels:
+
+1. Padding within CSI-2 bus :ref:`Data Unit <media-glossary-data-unit>` as
+   documented in the MIPI CCS specification.
+
+2. The tagged data format as documented in the MIPI CCS specification.
+
+3. Register addresses and register documentation as documented in the MIPI CCS
+   specification.
+
+The format definition shall be used only by devices that fulfill all three
+levels above.
+
+This mbus code are only used for "2-byte simplified tagged data format" (code
+0xa) but their use may be extended further in the future, to cover other CCS
+embedded data format codes.
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index d4c1d991014b..03f7e9ab517b 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -183,4 +183,7 @@
 #define MEDIA_BUS_FMT_META_20			0x8006
 #define MEDIA_BUS_FMT_META_24			0x8007
 
+/* Specific metadata formats. Next is 0x9002. */
+#define MEDIA_BUS_FMT_CCS_EMBEDDED		0x9001
+
 #endif /* __LINUX_MEDIA_BUS_FORMAT_H */
-- 
2.39.2


