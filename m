Return-Path: <linux-media+bounces-35567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA06AE35AE
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E4E816FB19
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 06:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57E71E231D;
	Mon, 23 Jun 2025 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqorGkb3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94791DED4A
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660083; cv=none; b=boDPeVnBm5NJsvPC6lPSw0mbXjAmHsaSJ535Vdcp7YC/IAfR0ytvBm9kG+60Dn92oSYba3I08WrYGOGLeosHp3qRUJWei8C05P+r7URrbVY119BD63Qftybg9K4TRHLmz4zlm4F4PKPFXUt3TsjKQ4F8HKm203rCz5L8gBqxSDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660083; c=relaxed/simple;
	bh=60oZ/RfTl7HN89oNdzIJY4BGCDgk/LmNuYCWdflReO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qHT3suYu2fVWBbnzA8nwyU/7EBAoCkKFg+OmVcK6723o9vReW9Zstkmn/yAIV86vtH12r6kvZwdLjRnyPu5Zvtxl2Gu+SUaYmqDCKU2mUznRLwTndpu7OGSc8cZ/ySV6bKCusE7R16eKDJmJxpO7GREn1qDbSYQUYWy1C/sp7zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqorGkb3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750660082; x=1782196082;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=60oZ/RfTl7HN89oNdzIJY4BGCDgk/LmNuYCWdflReO4=;
  b=AqorGkb3oteKbooXeLWZmsmyII4zPXD+44Mw0hPI5nWFDD0/B/sZlO0n
   PUcp1jB2mm3vlCOfYs7xG9cE3sImeVPqcm9hkHGYDz3Lqcx7cw1VHdulq
   JU3mvjMmAKlfd8mABIpIHT7fXgRrAesqC+0KRW2wrWn1FchsDnIJzBFMr
   rY0IZeCyoWrvuPdMyk/IIgVjAn5znC/694qEHGs+/nQynsoty5eIjFGYf
   4FTN+hfckdS8IKMytsUUSBzEWCTdTC9TE/7FEdOHV9+qqt6y6LGiD+P7H
   vJ9TZZ7h6gk/h/de3cBhbElbjcSr7O+dmuDW7E7qyxB4j2HZd81z2oqzS
   g==;
X-CSE-ConnectionGUID: dgZZwfwuTgC0E/m5iQ4ONw==
X-CSE-MsgGUID: /gYt+qPNR8yQKh6Ux/xihA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52985212"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52985212"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:27:59 -0700
X-CSE-ConnectionGUID: rmJT2tYhRmqKNuL6Yu3wwg==
X-CSE-MsgGUID: IHJ3jAluT/eUnItbL6wTtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="175106229"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:27:57 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E895312068E;
	Mon, 23 Jun 2025 09:27:54 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uTaeo-009Zob-2z;
	Mon, 23 Jun 2025 09:27:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 3/3] media: Documentation: Document new v4l2_ctrl_handler_free() behaviour
Date: Mon, 23 Jun 2025 09:27:54 +0300
Message-Id: <20250623062754.2282598-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623062754.2282598-1-sakari.ailus@linux.intel.com>
References: <20250623062754.2282598-1-sakari.ailus@linux.intel.com>
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


