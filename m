Return-Path: <linux-media+bounces-35307-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B45EAE04E1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0504D4A32D8
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC41259CAE;
	Thu, 19 Jun 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9cqSQ69"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D3258CE5
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334360; cv=none; b=GJ6pQPisUIBEYmBGbX8AkoVrDepxJh6eAoOtUSCDNLm1M+vRZ1yuF+FPEu7pz2BS7ACayjBqQkWP82uQJ2o2jbHk+OfbR46QDCCEZr9ZlQTyPNV14YUbtqjZaM2K5fRfxuF7NuDh0JznfsMouB9mnr+dgItwbUQ9koMHWHgCxUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334360; c=relaxed/simple;
	bh=oLnIlyKVD8OKCosMBd+8nKDVOFm9dWPn4A3KHDfXKVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U9u9uN4PbB2Ap8TjYHOi9oaXFR4JANHrZKM+1dUKf30Kp5exHRGbfQzq9lz+fK8NiOTZNdyUPIGeeHKQ2QzQyZqfLOqRwxeQnKqBupmmc8qzLodBHxGppGKIjCGJMkbhkeG3/ZMvmz91yTBY4Psvqb/VzLT2H/qvMuH/s7R7ViM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9cqSQ69; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334360; x=1781870360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oLnIlyKVD8OKCosMBd+8nKDVOFm9dWPn4A3KHDfXKVI=;
  b=B9cqSQ69lI0l78MasYW4enRTQAKUlNFpBh+lp1ci7a2mJaoOuxp3QYYD
   tI9BE/pH/yTExR2pOVlVt9xXhb1BsVJ2jWXCySktbOXbsLJrboP4Z8dky
   DoicVJvK/iYnooKhXwOfrjQvhKdetpwu1Wv/5yrpezAmA27qPh4MHUftP
   jGGIxn8bbPMpbN2f+q7eCvdK9BRhaOsI/FciUg6mec0aZh8daY2E//J7u
   CoH6FFwTCqGo5M2PFtHG6boe0CUBKVW2apO2Do3WyoQamqciWMR1IXplM
   2mukm7cbSmkrtMpBnL/u7ojlXJbdKDrWnFHk7PcTSLeqQYFWuEhnvVaQU
   w==;
X-CSE-ConnectionGUID: t1nocecaSAmhvJsXug2maQ==
X-CSE-MsgGUID: SJaEkSxkQ8KW19LDz09nIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386652"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386652"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:12 -0700
X-CSE-ConnectionGUID: gW3f6zllTyus6phHsYI+VQ==
X-CSE-MsgGUID: WZmfaaBASCSk3TOyWQSUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908434"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 39DD012321E;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008AKx-0g;
	Thu, 19 Jun 2025 14:58:37 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
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
	Hans de Goede <hdegoede@redhat.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 42/64] media: uapi: Add MIPI CCS configuration model
Date: Thu, 19 Jun 2025 14:58:14 +0300
Message-Id: <20250619115836.1946016-43-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration model for MIPI CCS sensors and refer to the CCS driver
documentation from it. If more drivers start implementing the CCS model
the documentation should be split into two but that appears to be unlikely
at the moment.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../userspace-api/media/v4l/subdev-config-model.rst         | 6 ++++++
 include/uapi/linux/v4l2-controls.h                          | 1 +
 2 files changed, 7 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index c1b9b74cbcef..ee59bf3c5761 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -242,3 +242,9 @@ space may obtain the size of the embedded data once the image data size on the
 source pad has been configured.
 
 Also see :ref:`media_using_camera_sensor_drivers_embedded_data`.
+
+MIPI Camera Command Set (CCS) model
+-----------------------------------
+
+The MIPI Camera Command Set configuration model is implemented by the :ref:`CCS
+driver <media-ccs-uapi>`.
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 23112f256da1..762751588439 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1249,6 +1249,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_CONFIG_MODEL			(V4L2_CID_IMAGE_PROC_CLASS_BASE + 6)
 
 #define V4L2_CONFIG_MODEL_COMMON_RAW_SENSOR	(1U << 0)
+#define V4L2_CONFIG_MODEL_MIPI_CCS		(1U << 1)
 
 /*  DV-class control IDs defined by V4L2 */
 #define V4L2_CID_DV_CLASS_BASE			(V4L2_CTRL_CLASS_DV | 0x900)
-- 
2.39.5


