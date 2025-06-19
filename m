Return-Path: <linux-media+bounces-35318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51B6AE04F1
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 14:05:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E747C17556C
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 12:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B151C248866;
	Thu, 19 Jun 2025 11:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDeH4N8/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B632475CD
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334368; cv=none; b=G3LUoSLrOCIaMUoNb1GRWk7U9TYR5q4uPYsnRYVYc3xRH3Ome8NC4dGl54aNSnJlCvMJU32Ez9BGYPXC6Q2jT1a1Tf582Nj8pMSFRg3fuXtVwFycZABF7SAQ9vsMazggOdk9vMkS5n6ORa8oeOsvSwkIzZbcJ/piLhR/W0uXHrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334368; c=relaxed/simple;
	bh=mG560Vajpd9PHRzCn1oZnmkB6V5J9EiFREHjSmWcVAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NF7h2vOPEvWfxkiNg2Q3oT2XoZIxavA9dQ0nu69R/ZYbPHrkHrWQz9J6aIsL11a7WdBV/FjjbKkiSDlGqEYBcHvtV6SOroES8xXXHYHf/Y811BNT2wI2vSNc5bvOEp1+SfgI+EM5btkvXcOEn1LV2wOESiq9xOeTctI/SHBSCvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDeH4N8/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750334367; x=1781870367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mG560Vajpd9PHRzCn1oZnmkB6V5J9EiFREHjSmWcVAQ=;
  b=kDeH4N8/R98380EkcicJCvdVXfhoOUJazoHhWzOcMpCDSWAm47fw8hSE
   REBTeIf8qvS7QfoPQc2cKqplUxNqkSECH6s4mOF1uT5ntdLSw+WV/ttbU
   1oFKC36/OrnIHzUvHABsLCBDeykenJXU9bEQdCSWhQtlug9KmRJYg1aob
   lVFcgTwNDDpUYE5UDz5BzMoRmw+7Vnr86ZDsA7tu27Xdq+mZ1P8EZmGsK
   NvoeVfFAHon9JLkSL4aaM5shQOaHomcm9s2VKAV/YiAmCZpanZAXdbjXG
   YDb2kd++mQTkBH+B/TgAB5t3koYOuyalLO+9evxyI6KFhW/Rvppxm9GZr
   w==;
X-CSE-ConnectionGUID: i+0GpKG7SY2liW4fbAg4IA==
X-CSE-MsgGUID: gyrT23UkQ0a9aaPsHX1P3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="56386771"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="56386771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:13 -0700
X-CSE-ConnectionGUID: 5SRJdiaVRqC1cEJeNL4WGw==
X-CSE-MsgGUID: fLDfLomvRIucqEErxMiefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="154908464"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.167])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 04:59:06 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 57AB7123275;
	Thu, 19 Jun 2025 14:58:37 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uSDuf-008ALg-14;
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
Subject: [PATCH v10 51/64] media: v4l: Add V4L2_SUBDEV_ROUTE_FL_IMMUTABLE sub-device routing flag
Date: Thu, 19 Jun 2025 14:58:23 +0300
Message-Id: <20250619115836.1946016-52-sakari.ailus@linux.intel.com>
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

Add a flag to denote immutable routes, V4L2_SUBDEV_ROUTE_FL_IMMUTABLE.
Such routes cannot be changed and they're always active.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/userspace-api/media/v4l/dev-subdev.rst         | 4 +++-
 .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst      | 5 +++++
 include/uapi/linux/v4l2-subdev.h                             | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
index eccb05dbe290..edfcf1ea8eae 100644
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
 -----------------------------------------------------------
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
index 1cf795480602..b846a8b07700 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
@@ -146,6 +146,11 @@ wants to retrieve the missing routes, it can issue a new
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
index 2347e266cf75..839b1329afb2 100644
--- a/include/uapi/linux/v4l2-subdev.h
+++ b/include/uapi/linux/v4l2-subdev.h
@@ -204,6 +204,11 @@ struct v4l2_subdev_capability {
  * on a video node.
  */
 #define V4L2_SUBDEV_ROUTE_FL_ACTIVE		(1U << 0)
+/*
+ * Is the route immutable? The ACTIVE flag of an immutable route may not be
+ * unset.
+ */
+#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		(1U << 1)
 
 /**
  * struct v4l2_subdev_route - A route inside a subdev
-- 
2.39.5


