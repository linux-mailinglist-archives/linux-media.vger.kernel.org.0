Return-Path: <linux-media+bounces-10133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A0A8B2AB4
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E588928658F
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E4715623A;
	Thu, 25 Apr 2024 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiA8frt5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD46155723
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714080457; cv=none; b=piSRoyH45XgH01P1Tw/O77sGEV/IKtYPcx3YpAcGCiA/8lUioNWSlNXMA9TmvgHyjWF9RkxWYZsxEqt5+7vFXd3QzaajgCsR8SucsANqyyUDe3UaW4YjT8vtr23TVA1PiOMIGiGpQeUANadHMCloZzGKVY7WpSQxX7H4pqNmLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714080457; c=relaxed/simple;
	bh=jISX/u6dSeGJoondLr8S5bPfhwhM313glOQum48keW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LHLdO+aYo1w5rhTZ4QVirDn1MjYxoS+t4l8x2T5ROGoIox9BJUL9WJFnLzjz/VK5b1RBCMgKv82GS+qlKpIyxYkZrce+VZQ0tu4rsfgJCIdObtmZeSAcXtNYRHCOl5GWn3y4lrEvGiX6lGiip1GyH3t/FSyjnte2pFXQzExAVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiA8frt5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714080456; x=1745616456;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jISX/u6dSeGJoondLr8S5bPfhwhM313glOQum48keW0=;
  b=EiA8frt5w8cKPW7sTuTs+8MOjtVg8Sw5I1dyN9SVcf0kzJXIC40hKR/l
   /r0ohueUZFQPdUPMAdVKCc3ummRtcI7BTq3jP9Qo0oaVH2Fn6XIzVk7TR
   179NcAXwj7i3/64jnC3QCUDLfoaYL5w1Oh9bI+LHALwB8NV7A/OFFGMUc
   ubfzDjk1BmpvRELSwYu3GtJrjUiQU2GUwss/ayQHZgeLPJMYGCdf+mpIY
   ORhX7eIXTHrA48BWdTnC+odfJWdi41iZ2ClBL/VhGE0k4fHCSA8wcrube
   iCkZhLmyPfin9FR40G4JZlfBavaS9HNO0XREsokYEHJ354CqOO+fHyPhZ
   A==;
X-CSE-ConnectionGUID: v3p/HrYVR6SLNKvPyAAd1Q==
X-CSE-MsgGUID: 30DUKbI3Rv6gNOkwqgJtGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="10016708"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="10016708"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:34 -0700
X-CSE-ConnectionGUID: MBUR547TRxioiN9Exy2C3w==
X-CSE-MsgGUID: AHL1LUR0RH+2hkha8OHzQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25620934"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:27:32 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EB303120919;
	Fri, 26 Apr 2024 00:27:27 +0300 (EEST)
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
Subject: [PATCH v2 09/14] media: Documentation: Document S_ROUTING behaviour
Date: Fri, 26 Apr 2024 00:27:06 +0300
Message-Id: <20240425212711.928300-10-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
References: <20240425212711.928300-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document S_ROUTING behaviour for different devices.

Generally in devices that produce streams the streams are static and some
can be enabled and disabled, whereas in devices that just transport them
or write them to memory, more configurability is allowed. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index b76e02e54512..0f9eda3187f3 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -572,6 +572,29 @@ Any configurations of a stream within a pad, such as format or selections,
 are independent of similar configurations on other streams. This is
 subject to change in the future.
 
+Device types and routing setup
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Different kinds of sub-devices have differing behaviour for route activation,
+depending on the hardware. In all cases, however, only routes that have the
+``V4L2_SUBDEV_STREAM_FL_ACTIVE`` flag set are active.
+
+Devices generating the streams may allow enabling and disabling some of the
+routes or have a fixed routing configuration. If the routes can be disabled, not
+declaring the routes (or declaring them without
+``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
+disable the routes. ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
+back to the user in the routes array, with the ``V4L2_SUBDEV_STREAM_FL_ACTIVE``
+flag unset.
+
+Devices transporting the streams almost always have more configurability with
+respect to routing. Typically any route between the sub-device's sink and source
+pads is possible, and multiple routes (usually up to certain limited number) may
+be active simultaneously. For such devices, no routes are created by the driver
+and user-created routes are fully replaced when ``VIDIOC_SUBDEV_S_ROUTING`` is
+called on the sub-device. Such newly created routes have the device's default
+configuration for format and selection rectangles.
+
 Configuring streams
 ^^^^^^^^^^^^^^^^^^^
 
-- 
2.39.2


