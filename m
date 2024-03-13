Return-Path: <linux-media+bounces-6972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 845DA87A38F
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7E4C1C21291
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1022374D;
	Wed, 13 Mar 2024 07:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sj3RUh/Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B91117585
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314776; cv=none; b=mb866FViklva4TkpcX3qjlQ2unjA0OGeZVxiAXwDVvWwKIu3VK09iaX3fumwX4Rl6pByuf0RrWOQCYFn+nRRrJZ2pQvttbFdq1fyX+uVUuMkUsaZv9qG3wHKgTUQUR7/NTAEhamRHVQvzI9pCbaVaBDQEcpQLGN45SaLzlN6lSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314776; c=relaxed/simple;
	bh=VaZTtx+bEhtq/pAbpdbVLBgvwfP46AHFTGNrZFgdFho=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PId4VjQZ+tBQtjzKU4Hx9i2TAz6HaO25UsKov/VHD0QFPcdWLhdA0eCvztMQ1wtLuW7o5pZT1cCauqRjPj2weaEL5K4Vo5zo9Z2hepOyfwFTMf1eZNKJ/Wf7vWR3sLOjyq3iiiTfdjsNCnUiN0/0NzdQfwa7hibqqlnCSrVo2nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sj3RUh/Z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314775; x=1741850775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VaZTtx+bEhtq/pAbpdbVLBgvwfP46AHFTGNrZFgdFho=;
  b=Sj3RUh/Z2v+pmXv7AAOgOdCPgjfQTCfQzxHha+MrR6GnnWn2VIgTiYvd
   B/Tok13HaScKQLcw+FG2tZyjFUdy0nMS5TXrL8smGAaQBJDv7mgw1U7Bu
   w9WNobG/GQoJvwy1FFSQerTEuh2qrw+R7xDd1LLLPg3wH1VwOg7vc3S5i
   Q8SxpfR7wubU26Dp7Vi23vIjZuxN5FElyCWhxshjsxJAcpF7sCVU8+ryX
   LSR8nekoZeHugCE5+XdubVHeikxIKBrwkqE7l3K3JAonTKmZCZvtUWvql
   h3zggx09bgjZyeo1/FNtO3j/HQ3FNB+ReKKma2w7A3DVk8SQX/wnugxaj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="4909350"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="4909350"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16542403"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:26:13 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 693FF1201C3;
	Wed, 13 Mar 2024 09:26:09 +0200 (EET)
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
Subject: [PATCH v8 36/38] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
Date: Wed, 13 Mar 2024 09:25:14 +0200
Message-Id: <20240313072516.241106-37-sakari.ailus@linux.intel.com>
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

Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
Such routes cannot be changed and they're always active.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst         | 3 ++-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
 include/uapi/linux/v4l2-subdev.h                             | 5 +++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 08495cc6f4a6..2f2423f676cf 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -572,7 +572,8 @@ internal pad always has a single stream only (0).
 Routes from an internal source pad to an external source pad are typically not
 modifiable but they can be activated and deactivated using the
 :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
-on driver capabilities.
+on driver capabilities. This capatibility is indicated by the
+:ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE <v4l2-subdev-routing-flags>` flag.
 
 Interaction between routes, streams, formats and selections
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 08b8d17cef3f..cd7735f9104e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -139,6 +139,11 @@ Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
     * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - 0x0001
       - The route is enabled. Set by applications.
+    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
+      - 0x0002
+      - The route is immutable. Set by the driver. The
+	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
+	changed.
 
 Return Value
 ============
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index ca543982460c..7e501cb45e4e 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -200,6 +200,11 @@ struct v4l2_subdev_capability {
  * on a video node.
  */
 #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
+/*
+ * Is the route immutable. The ACTIVE flag of an immutable route may not be
+ * changed.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
 
 /**
  * struct v4l2_subdev_route - A route inside a subdev
-- 
2.39.2


