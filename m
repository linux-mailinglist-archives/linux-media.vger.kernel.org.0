Return-Path: <linux-media+bounces-9596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC308A7502
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 21:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F38BB22F80
	for <lists+linux-media@lfdr.de>; Tue, 16 Apr 2024 19:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4E013BC3E;
	Tue, 16 Apr 2024 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjdQo9kH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71667139D1A
	for <linux-media@vger.kernel.org>; Tue, 16 Apr 2024 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713296071; cv=none; b=LAibgv87XXWr045fL8a6tkIs6MgEKwMH8tb4LgFbEiKlo7Q4+zgvuMOmMsVSX9khyHCG/enMUW/AE59FyRwfMijOkLD/8xCParROvEY4PMps4owGjAk0UHgbIGnUr2dqKLoqTWegT2fl4s/cHDlFE7FL9NamQuv4Yfs8es80smM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713296071; c=relaxed/simple;
	bh=KF12zUFL4m8JlsH4O6dM657+op9z1vQ1HyC4fnTfROo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VPMgVO7cS7w2VmDEOIsFJTZLnoISXMImnulyuNUuilVkQJs5Ukf/FnVW3Qy0NARuaQh31E97/CUuaQ48I5w8RYqRg00E3FiP1x3cHS0sfqmFJzMDt5Lk1Vj4sFHSWb2CgtNeiLrQ8KKhJlllllwsZwMYZetl1Qpl2B/yUgsUgDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjdQo9kH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713296070; x=1744832070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KF12zUFL4m8JlsH4O6dM657+op9z1vQ1HyC4fnTfROo=;
  b=bjdQo9kHU36yZjZUb74H22mF+o1y9yPwB4XRNNtDPdH2CyS5Ox/4N3KI
   M0Z57h+M9akN6loVTx37MiO1cWDplGK7370MQV7LTR02PghSCCQatL5n0
   dpAj4l0VFn/xr/SqAdDIbW8/vtscil4NBQu24s0SyKDZh+eRPUvYM6AL5
   pybeQTeG+mrG4ZsLocmYz7Lc3ZkGoN0mdF2+R8sEceiTIIcc2m47uZf30
   utA3Ok0LLOSntQGlEd2DVXeLU5As/19mnF4OVdnkh410vxBbxwYFEFj2r
   PFrZuGl4tJflIXs2CTIN/ga+knxSIVEMNChGPUOTDhNlc35kBftL6+6qc
   g==;
X-CSE-ConnectionGUID: v+2i9XleR2OzBOojw37VGA==
X-CSE-MsgGUID: MCXjAK3uR4Om+5SRaJTsdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8929930"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8929930"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:30 -0700
X-CSE-ConnectionGUID: a9c4t4OhTyWmqpb1EieIGQ==
X-CSE-MsgGUID: 8M9WdTjCRaawB5grXFMhFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="22244797"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 12:34:27 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0324D1204F9;
	Tue, 16 Apr 2024 22:34:23 +0300 (EEST)
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
Subject: [PATCH v9 44/46] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
Date: Tue, 16 Apr 2024 22:33:17 +0300
Message-Id: <20240416193319.778192-45-sakari.ailus@linux.intel.com>
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

Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
Such routes cannot be changed and they're always active.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst         | 4 +++-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
 include/uapi/linux/v4l2-subdev.h                             | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index de8dfd4f11a5..5c63c8c24108 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -572,7 +572,9 @@ internal pad always has a single stream only (0).
 Routes from an internal sink pad to an external source pad are typically not
 modifiable but they can be activated and deactivated using the
 :ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
-on driver capabilities.
+on driver capabilities. The :ref:`V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
+<v4l2-subdev-routing-flags>` flag indicates that the
+``V4L2_SUBDEV_ROUTE_FLAG_ACTIVE`` of the route may not be unset.
 
 Interaction between routes, streams, formats and selections
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 88df7bf80b00..c0f6d49cac6d 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -150,6 +150,11 @@ Also ``VIDIOC_SUBDEV_S_ROUTING`` may return more route than the user provided in
     * - V4L2_SUBDEV_ROUTE_FL_ACTIVE
       - 0x0001
       - The route is enabled. Set by applications.
+    * - V4L2_SUBDEV_ROUTE_FL_IMMUTABLE
+      - 0x0002
+      - The route is immutable. Set by the driver. Indicates that the
+	``V4L2_SUBDEV_ROUTE_FL_ACTIVE`` flag of an immutable route may not be
+	unset.
 
 Return Value
 ============
diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
index 6a39128d0606..c6f1228d43b1 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -204,6 +204,11 @@ struct v4l2_subdev_capability {
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


