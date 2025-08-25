Return-Path: <linux-media+bounces-40958-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58A4B33BD0
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 11:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E372163C15
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 09:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8F32D94A7;
	Mon, 25 Aug 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1IUta+N"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666BB2D94B6
	for <linux-media@vger.kernel.org>; Mon, 25 Aug 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756115507; cv=none; b=dziXYIamQD7tU0I0f1bzlOwQn+rs8Zlu4+6S83y6MjmOGqVAN9J19BgmuKibmhdUrIshfbuLHH1DPMQi3Y68uzyf+HB6FIgmATj+jenUOjpxKg5OdARiCPfkwK8p08fTmda7l/UImf5r9fItw7Wy1FIhPt2rLKwo2pDRF4RiFkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756115507; c=relaxed/simple;
	bh=aLcGrTAQhguxVPqFKs7FOlK6KApo4xeddWeRuJBOP3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jT5f0vTbhYfH5S1oJbLnZMARS6bG1wP7GnR6li5lE4MIvIFst/0WBwe3btr8t+1lCqyh+qbNBNUCjf+0HshU9+HIA7f7yNa+HZs5IOzp8t/MwdiXzv2cHijQ1T7Gd80jzHZ+wq1itSk6obXxJOYkf5tNvWmdYx3A4bux9dpwv/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1IUta+N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756115506; x=1787651506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aLcGrTAQhguxVPqFKs7FOlK6KApo4xeddWeRuJBOP3Y=;
  b=f1IUta+NV8JLzPgOnHQleOOSJ/FNkYOdfdOJv5BNKDcnVOv278KIgl5D
   DoUH0xRpxm7uDQta4Wi/jOKpu/KFf9AvrjZg22cZqQUqYUD5hVj/ObN59
   PlYBKT+syCrUcrAFz4DVTzvE6sXX9PV8gzsR3Sct3g5b85iuRPzn3si4w
   8i8FmWN9RnL/vha/RXz47+fWFOKJBNJYJNaYpHf+wsXEqsqla3YRorGhy
   /mXXB1sagsPU+JTUIOmJd9wWPHMDPQ3Ka8yjm2W4kXMAi+DMwasjNsLwJ
   5xbQhDD+C6yhsKDIEIWDwhSdNrPrb2qK6Ulv9oaQ6V0uclGEBy40o2XU1
   g==;
X-CSE-ConnectionGUID: x3sgo3iYTAOvmBL2QdrshQ==
X-CSE-MsgGUID: 2ZhEPNwdSfSyuJHaRclGyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58032165"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58032165"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:44 -0700
X-CSE-ConnectionGUID: yKdBkBe+Qpi2sjEjs4k+LA==
X-CSE-MsgGUID: VYP0tZd3S5a8BkCpGVFf9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173431062"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.7])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:51:38 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ABC67121FF2;
	Mon, 25 Aug 2025 12:51:08 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqTr2-00000005agV-2nSi;
	Mon, 25 Aug 2025 12:51:08 +0300
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
Subject: [PATCH v11 41/66] media: Documentation: Add scaling and post-scaler crop for common raw
Date: Mon, 25 Aug 2025 12:50:42 +0300
Message-ID: <20250825095107.1332313-42-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
References: <20250825095107.1332313-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document scaling and post-scaler digital crop operations for the common
raw sensor model.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../media/v4l/subdev-config-model.rst         | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-config-model.rst b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
index 1e6c58931ea0..c1b9b74cbcef 100644
--- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
@@ -139,11 +139,18 @@ sub-sampling to achieve the desired size.
 
 The digital crop operation takes place after binning and sub-sampling. It is
 configured by setting the ``V4L2_SEL_TGT_CROP`` rectangle on (pad, stream) pair
-0/0. The resulting image size is further output by the sensor.
+0/0.
+
+The scaling operation is performed after the digital crop. It is configured by
+setting the ``V4L2_SEL_TGT_COMPOSE`` rectangle on (pad, stream) pair 0/0,
+relative to the digital crop.
 
 The sensor's output mbus code is configured by setting the format on the (pad,
-stream) pair 0/0. When setting the format, always use the same width and height
-as for the digital crop setting.
+stream) pair 0/0. The width and height fields are used to configure post-scaler
+digital crop if supported by the driver, affecting the right and bottom edges of
+the frame. If post-scaler digital crop is not supported, the width and height
+fields of the format will match the compose rectangle sizes applied on the same
+0/0 (pad, stream) pair.
 
 Drivers may only support some or even none of these configurations, in which
 case they do not expose the corresponding selection rectangles. If any selection
@@ -201,12 +208,19 @@ Also refer to :ref:`Selection targets <v4l2-selection-targets-table>`.
       - X
       - Digital crop. This rectangle is relative to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 1/0.
+    * - 0/0
+      - ``V4L2_SEL_TGT_COMPOSE``
+      - \-
+      - X
+      - Scaling. This rectangle is relative to the ``V4L2_SEL_TGT_CROP``
+        rectangle on (pad, stream) pair 0/0.
     * - 0/0
       - Format
       - X
       - X
-      - Image data source format. Always assign the width and height fields of
-        the format to the same values than for the ``V4L2_SEL_TGT_CROP``
+      - Image data source format and post-scaler crop. The width and height
+        fields of the format, used to configure post-scaler crop on the right
+        and bottom edges of the image, are related to the ``V4L2_SEL_TGT_COMPOSE``
         rectangle on (pad, stream) pair 0/0. The media bus code reflects the
         pixel data output of the sensor.
     * - 0/1
-- 
2.47.2


