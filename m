Return-Path: <linux-media+bounces-10123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD78B2A6C
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 23:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 841F11F23E2D
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 21:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA4915533B;
	Thu, 25 Apr 2024 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H0Kw7F+f"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19AC15380E
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714079313; cv=none; b=gtlhD2+9MuhpMKaHsL11hvWPy18xv8IJZEGKoyu57LY66+DGZWS0qhVsYP56SJZl6Nyt2/vmYRNYNP4WNE9t3f3h9CpFaxUsSWLhaSNMeCXiU5OySbNqLuqTY1c4Vqcp1JAqioYThpxc3Tbrt7WIUT9uJ3ns+TfjUbD8YRWmLIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714079313; c=relaxed/simple;
	bh=zVyIeUMTGDBap4ADfxA4lXMqXRLyf3+6XatMYrp+3Y8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T5mpxmvirVhok6N6+zZwHD5wxcHeKvTEBMu1hcDUxaA1Fp+QAfu7LtZNm4Wzlp3IR4xd4jAmMEn30j1rd6SKcWwT0E/8tlU6oXbJb/Ttj357QlMZTbE7JE6hWFOVJVC16IjiZwEC29oMr1NIJoA0LK0hcZuwN6gVp3ZdHGPGCzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H0Kw7F+f; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714079312; x=1745615312;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zVyIeUMTGDBap4ADfxA4lXMqXRLyf3+6XatMYrp+3Y8=;
  b=H0Kw7F+fRjiLIJaMcDZBpY/KJcOydnGlJspL8TWHBpnVOl4hv2bjQl2r
   QUqF9OG2NPvbObT8ogFwvtTnM78KGip69CWTSoQT6NojifnDsU+o1Kwu4
   3XtlJBww/jxHk7/BWJk/30j6VuoF/eOSnw9toMRhReeN+KqfuUYnd5JV5
   zDOXezZYAi5SqIIAVDJZA3GT2kcqPX1qu6RuR0OHNQV3v5Y3WxzlwTvZn
   J6WomhInwlNVejcTD2jXgZmSsjb4dkPdYOfZkcgbebkOMIFOzk5FAAj4Z
   hGILw19sWhADmocEoewmHptJNwsVkFBsQ5KM0ivsR1BZWW4yIFT6Q+Brz
   g==;
X-CSE-ConnectionGUID: 5tTKoLkmR2GxnpGfYzRqCw==
X-CSE-MsgGUID: R+WDZJrCQ+WY1/yvv3aRxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27315737"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="27315737"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:08:30 -0700
X-CSE-ConnectionGUID: CJHvigRZTP6uNizINrtjAQ==
X-CSE-MsgGUID: LTbjWaWIRUmFHJ1SXoKENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="62679628"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 14:08:29 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 51C8911FC19;
	Fri, 26 Apr 2024 00:08:25 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1s06KP-007eba-11;
	Fri, 26 Apr 2024 00:08:25 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Subject: [yavta PATCH 1/1] Print V4L2 fourcc code in format enumeration
Date: Fri, 26 Apr 2024 00:08:15 +0300
Message-Id: <20240425210815.1820591-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also print the V4L2 fourcc code in format enumeration (--enum-formats).

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 yavta.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/yavta.c b/yavta.c
index b2283aed09cb..2153e8b5775f 100644
--- a/yavta.c
+++ b/yavta.c
@@ -370,6 +370,18 @@ static struct v4l2_format_info {
 	{ "GENERIC_CSI2_24", V4L2_META_FMT_GENERIC_CSI2_24, 1 },
 };
 
+void v4l2_format_fourcc(__u32 fourcc, char name[5])
+{
+	unsigned int i;
+
+	for (i = 0; i < 4; ++i) {
+		name[i] = fourcc & 0xff;
+		fourcc >>= 8;
+	}
+
+	name[4] = '\0';
+}
+
 static void list_formats(void)
 {
 	unsigned int i;
@@ -412,18 +424,13 @@ static const char *v4l2_format_name(unsigned int fourcc)
 {
 	const struct v4l2_format_info *info;
 	static char name[5];
-	unsigned int i;
 
 	info = v4l2_format_by_fourcc(fourcc);
 	if (info)
 		return info->name;
 
-	for (i = 0; i < 4; ++i) {
-		name[i] = fourcc & 0xff;
-		fourcc >>= 8;
-	}
+	v4l2_format_fourcc(fourcc, name);
 
-	name[4] = '\0';
 	return name;
 }
 
@@ -1815,6 +1822,8 @@ static void video_enum_formats(struct device *dev, enum v4l2_buf_type type)
 	int ret;
 
 	for (i = 0; ; ++i) {
+		char fourcc[5];
+
 		memset(&fmt, 0, sizeof fmt);
 		fmt.index = i;
 		fmt.type = type;
@@ -1829,8 +1838,10 @@ static void video_enum_formats(struct device *dev, enum v4l2_buf_type type)
 			printf("Warning: driver returned wrong format type "
 				"%u.\n", fmt.type);
 
-		printf("\tFormat %u: %s (%08x)\n", i,
-			v4l2_format_name(fmt.pixelformat), fmt.pixelformat);
+		v4l2_format_fourcc(fmt.pixelformat, fourcc);
+		printf("\tFormat %u: %s (%08x, \"%s\")\n", i,
+			v4l2_format_name(fmt.pixelformat), fmt.pixelformat,
+			fourcc);
 		printf("\tType: %s (%u)\n", v4l2_buf_type_name(fmt.type),
 			fmt.type);
 		printf("\tName: %.32s\n", fmt.description);
-- 
2.39.2


