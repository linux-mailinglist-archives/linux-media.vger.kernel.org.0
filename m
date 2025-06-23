Return-Path: <linux-media+bounces-35633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B08AE4038
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65B421883318
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4020242D97;
	Mon, 23 Jun 2025 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZjAh7Cl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74701F09B3
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681405; cv=none; b=bqACZ34gzUPzM5fFA/udsqxodEizC2hkE/LQTX+MxIwO7awLNYdkA2Xu3IH7EXsWPw4comfrojRIO2pFh0/YO83IFPYZHBMkETBEOGuryCR7YRkIXzojX8WW2XMIdIn+yaetXEUtIlih9wyPD11Mttj8yunUAao2JB563WoBLoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681405; c=relaxed/simple;
	bh=60oZ/RfTl7HN89oNdzIJY4BGCDgk/LmNuYCWdflReO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PddUTYwSp/K+PRXReOkJUPI/vr6xO2KzG9uAAA6MRRI8VWka7Vq8WsK1zbFSqZ4tZjY9n3OkGKmg/g3jdIVPeaVq/3Q7+/0UFN/1+q82EccYgRW4A+Xodza1rojrzuIEog/MKMFWhMYIJDfhfFMeiB27Lp3I83SehNqrP3wLo2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZjAh7Cl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750681404; x=1782217404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=60oZ/RfTl7HN89oNdzIJY4BGCDgk/LmNuYCWdflReO4=;
  b=IZjAh7Cl24WxI+hIULTiAJ3g/cg69P2zpLdlUMHtSZCAB5F8O685KwDx
   EdNgETHnqMZiLgfksNzjjRASOTVhKk5YCBwO2R7knp+NVjmBHqu4t+cAe
   +VKIMEKWYtxblqHnG7Q7+Y63Wjp/xQlfxkAsYk2YNcQeCtViqMEwqSS8F
   SpOUw9DT4Y8EzegIj1n/UcZvmsJNCHdEohe69rsgL8hWAL/KloAHOTeC2
   LZ0vrkMFwzr6JZiLopaN3SaSTxkMHH4njK0CCcYQrt/qty8FgqePB1xwe
   TDbqg1N0i/GaCuFeC6Qa2FNLiMlMd+sb9/wwCwWTH5wX5C3gNhFpq15NZ
   A==;
X-CSE-ConnectionGUID: AtoZGk1KTmuNszFc2U7iEw==
X-CSE-MsgGUID: 0BRA1hAOTCCF3mzAgzg7qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52956848"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52956848"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:23:19 -0700
X-CSE-ConnectionGUID: PH3XfNfgSCeqghM3JnPr9Q==
X-CSE-MsgGUID: MMtCEXLMQtiK8k4Gv+r03w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151055934"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:23:18 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5BD201203EB;
	Mon, 23 Jun 2025 15:23:15 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTgCh-009qTQ-17;
	Mon, 23 Jun 2025 15:23:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v4 3/3] media: Documentation: Document new v4l2_ctrl_handler_free() behaviour
Date: Mon, 23 Jun 2025 15:23:14 +0300
Message-Id: <20250623122314.2346635-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
References: <20250623122314.2346635-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_ctrl_handler_free() no longer resets the handler's error code.
Document it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/driver-api/media/v4l2-controls.rst | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/media/v4l2-controls.rst b/Documentation/driver-api/media/v4l2-controls.rst
index b2e91804829b..fc04907589ab 100644
--- a/Documentation/driver-api/media/v4l2-controls.rst
+++ b/Documentation/driver-api/media/v4l2-controls.rst
@@ -110,6 +110,7 @@ For sub-device drivers:
 
 	v4l2_ctrl_handler_free(&foo->ctrl_handler);
 
+:c:func:`v4l2_ctrl_handler_free` does not touch the handler's ``error`` field.
 
 2) Add controls:
 
@@ -191,12 +192,8 @@ These functions are typically called right after the
 			V4L2_CID_TEST_PATTERN, ARRAY_SIZE(test_pattern) - 1, 0,
 			0, test_pattern);
 	...
-	if (foo->ctrl_handler.error) {
-		int err = foo->ctrl_handler.error;
-
-		v4l2_ctrl_handler_free(&foo->ctrl_handler);
-		return err;
-	}
+	if (foo->ctrl_handler.error)
+		return v4l2_ctrl_handler_free(&foo->ctrl_handler);
 
 The :c:func:`v4l2_ctrl_new_std` function returns the v4l2_ctrl pointer to
 the new control, but if you do not need to access the pointer outside the
-- 
2.39.5


