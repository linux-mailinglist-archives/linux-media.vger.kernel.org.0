Return-Path: <linux-media+bounces-6946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A6787A374
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 08:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C371F223A0
	for <lists+linux-media@lfdr.de>; Wed, 13 Mar 2024 07:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3B81B273;
	Wed, 13 Mar 2024 07:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mA6eMHuh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D36A17589
	for <linux-media@vger.kernel.org>; Wed, 13 Mar 2024 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710314756; cv=none; b=OHfWJCtb4ckXozuKncW0jeWPzlB+HVN0p9E90GgAYAmRTLWRVPBezOLx0C+PmDbqwMNd78RHkxZhndkQaxBw6Q9OjQ4uJh9WBg9tFviePvvWPn5KiIJMjfNJXjGuI0BCVlcY1StDWhhWE6kt/K7uX37w7qZmaaDATBQRfGSC3c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710314756; c=relaxed/simple;
	bh=Iq4ODu91c73aBY3cxFmHyTEYz/DVby4Q8Bai+Mw5tz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FG0op1ch+rozYfal2P06UhfmRjaL4okdRadxVo6hHVVBGV3xdnq8KnVFienan3uXoXntUsM701QnnlcoimGXY7zCYpUh8XEIPkMJ9WSFSyyA1FZbrLBQMMuObvLeMJem/HJjQJPqqBKstq73GDBIOyT3Nn9l5mU7WfS87o+aHgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mA6eMHuh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710314755; x=1741850755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iq4ODu91c73aBY3cxFmHyTEYz/DVby4Q8Bai+Mw5tz0=;
  b=mA6eMHuhk6KGmJlIv34oRwC2t9tbX6jlsgo0xngpHQiTHa6p9z+2CFee
   cc/9D5bv3BrGj3SoC0QgZcZduWjjGDO6WcI4EblWXM5o2PIySl5rU997O
   m9CIlZ6FhEXlZZ8EDpdQIKDtswV0MfXGw5eSjpksBfSgftV96aOcA0fKB
   N/MkRzJxFBVJNbP+EwH1y8wlCPzhdWHyCFz66h/wx1kzs3b3cN0xMs3ww
   8ZiOEynPUUxpql/gDd25fNiwCZYJGAlyZNtfaSqDeC0UkDqbOuhPx+yqY
   /yPkMnno6+1XOzNCe6E8YwR2Nh0Yb8H+38ItI5TR5dnDQrPOsq8vO1BEW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="22575570"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="22575570"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="42816393"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 00:25:36 -0700
Received: from svinhufvud.ger.corp.intel.com (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 8246411F853;
	Wed, 13 Mar 2024 09:25:33 +0200 (EET)
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
Subject: [PATCH v8 10/38] media: Documentation: Document S_ROUTING behaviour
Date: Wed, 13 Mar 2024 09:24:48 +0200
Message-Id: <20240313072516.241106-11-sakari.ailus@linux.intel.com>
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

Document S_ROUTING behaviour for different devices.

Generally in devices that produce streams the streams are static and some
can be enabled and disabled, whereas in devices that just transport them
or write them to memory, more configurability is allowed. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/dev-subdev.rst    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index 1808f40f63e3..08495cc6f4a6 100644
--- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
+++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
@@ -593,6 +593,30 @@ Any configurations of a stream within a pad, such as format or selections,
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
+routes or the configuration is fixed. If the routes can be disabled, not
+declaring the routes (or declaring them without
+``VIDIOC_SUBDEV_STREAM_FL_ACTIVE`` flag set) in ``VIDIOC_SUBDEV_S_ROUTING`` will
+disable the routes while the sub-device driver retains the streams and their
+configuration. The ``VIDIOC_SUBDEV_S_ROUTING`` will still return such routes
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


