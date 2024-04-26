Return-Path: <linux-media+bounces-10184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6968B334D
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 10:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF23E2821D1
	for <lists+linux-media@lfdr.de>; Fri, 26 Apr 2024 08:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1360A13D89C;
	Fri, 26 Apr 2024 08:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lav0bfJ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3501513D2B2
	for <linux-media@vger.kernel.org>; Fri, 26 Apr 2024 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714121458; cv=none; b=HfT9/WyO9cQ5v+ukUwHstKg5kgF5KwK+0U6hxvSCjiSE+8VUvGltcPeZYpSR2WPUmiMC7cHHUVcSNyEDn2UMR0KCVi6NTptg+f9+TTI4o5CXudktw8fcM//pZXYMyLSYvmkpwnkvvjAYiepefc5r6J2gPbx7A9OiAZZpoye4In0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714121458; c=relaxed/simple;
	bh=jISX/u6dSeGJoondLr8S5bPfhwhM313glOQum48keW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rDAdoGxed/E2CCuSK27y5KEVucIwXjCdvrrwRsQ4Vo4seVIZOJjX/MBSgfreW/7OhUBgL6GDsTH1E3Y4uFE4oj8DAJu9e+l+fhQBnahnV1Pk1d1Qiv8KzwIMLiV0PQuf7QIFZ+6HOP5VcwpUvZ2c4AIqE8BreGh6Ha9LCRw0Scg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lav0bfJ7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714121457; x=1745657457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jISX/u6dSeGJoondLr8S5bPfhwhM313glOQum48keW0=;
  b=lav0bfJ7bXJkdWhvoRNdmISf9k5I+ry8lj2MV7WpyGBD72dtHdwJYZGQ
   I693njsEHZdZlxy5VY+oFsx4Dk1ozbTlmJmL6QkTeAhYw/ZpTAAqqlloP
   LxkFS3Wj74CFC+e0X0GQujfGWoLU63aBJ+pO0NAxF4MlYgGr5DxX9Icrl
   X9Aj428D970u0gmnVoGH7sKWbUyyL3xwlUkNTjbqqVgfuJaC0Y8/mXlCA
   kX0kkseOK/lMJ0vD96M3vm7/21iphn3AV02gxoQvA8m2QaQR6svWnbl5l
   xKJ+1yNBmWXH9RNguoD83UzIWRMUtFDyTtEG1eHEZHNmqeV8zgjATsVV0
   g==;
X-CSE-ConnectionGUID: GA4j8NKDTlqcWEYrUurrRg==
X-CSE-MsgGUID: btJK5fyxQNmjRPWVu9M85A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9683829"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9683829"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:57 -0700
X-CSE-ConnectionGUID: 678zND38QS2tbGEQSkcfsw==
X-CSE-MsgGUID: N07yxVw9ROK3T0zU/1jOkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48598531"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 01:50:54 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ECE3412067F;
	Fri, 26 Apr 2024 11:50:50 +0300 (EEST)
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
Subject: [PATCH v3 09/14] media: Documentation: Document S_ROUTING behaviour
Date: Fri, 26 Apr 2024 11:50:33 +0300
Message-Id: <20240426085038.943733-10-sakari.ailus@linux.intel.com>
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


