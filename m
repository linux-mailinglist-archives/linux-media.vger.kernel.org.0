Return-Path: <linux-media+bounces-30859-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEE6A9973F
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 19:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB04467861
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 17:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F855281363;
	Wed, 23 Apr 2025 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AwhrtHth"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0AD28D846
	for <linux-media@vger.kernel.org>; Wed, 23 Apr 2025 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430965; cv=none; b=jM8ZZmPeU/UPSdm2l4idF9ma17TvarM0pjwYiT/zkQNMDZ8Qd95ghonSHUH6nP9YW7Q1nInjbDnQNF3MSUPY/2u6FM82V17WnhuJEBa8LXQ6RqcHdkzVV5CcyDCHpNR8AlqsebqbYnZ74iufH9r9lrQIzA0jiI6bTeSEadhod4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430965; c=relaxed/simple;
	bh=lPA+iHjgF722Sdt12Kg/n2QfARES0yamYGUBLcLH/FM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U4X5GeCzRkUqtCESy8l4p7vSIGdj2kcbiRYr5ddvrNGnz7F0GzEPr2hQtj2KV+lsCaPC+Vh9bZWnEHU7kR/KBBz6AKSywwO0gMJh/SUs2dljYawHZ3GtIXY/+WKgcph/3mDAU6+4mH8AaTEJ7cNZYxVKNIswSlwIaLR0BEejjKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AwhrtHth; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745430964; x=1776966964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lPA+iHjgF722Sdt12Kg/n2QfARES0yamYGUBLcLH/FM=;
  b=AwhrtHthXOmv34ut0S0QnA5reKHTeYvC30ymZCCuZrY8dZKTmhhl72PV
   fgylSEQZqLgpTKTuPwAn/AGl8Pepo5UeJW9ox1JCWNbn3JMCeARitnl8h
   gSi0OQ0U2Ih788qT6jQZ+uO9A81NL92Wg36fQZ+J1wrc7yd/dvHlAbDmU
   t6w/8EIMyMRcD/U5NT70lF9cl75971yCVzaHlJxCPJMSJvq4JWUyzOUDn
   BbBna4X+xxmEpZPtYqgREsqOTK08KA4D2S3iHmXGyv/nSQR8lsoYcIjUO
   cQ3P/JS26l8vFOlm2V/V/mIGBje8k7TZPmvvry4XUm2dr01ZSPyflSRwI
   w==;
X-CSE-ConnectionGUID: it80xP4lRZ+EqUr6b84hGg==
X-CSE-MsgGUID: 5DQk0VoPRIGbVokgYf+uLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="69529329"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="69529329"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 10:56:04 -0700
X-CSE-ConnectionGUID: AcWPYq9PQGKiaNWQjHE/uQ==
X-CSE-MsgGUID: rshmhG77TqKuPStszh1Fcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137467722"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.225.65.15])
  by fmviesa004.fm.intel.com with ESMTP; 23 Apr 2025 10:56:01 -0700
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@linux.intel.com,
	jimmy.su@intel.com,
	daxing.li@intel.com,
	hao.yao@intel.com,
	qingwu.zhang@intel.com,
	arun.t@intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v8 5/6] media: ov08x40: Use v4l2_link_freq_to_bitmap helper
Date: Thu, 24 Apr 2025 01:56:35 +0800
Message-Id: <20250423175636.1338374-5-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423175636.1338374-1-jason.z.chen@intel.com>
References: <20250423175636.1338374-1-jason.z.chen@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Chen <jason.z.chen@intel.com>

Use the v4l2_link_freq_to_bitmap() helper to figure out which
driver-supported link frequencies can be used on a given system.

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 140598642845..37ce6595a7d8 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1327,6 +1327,8 @@ struct ov08x40 {
 
 	/* True if the device has been identified */
 	bool identified;
+
+	unsigned long link_freq_bitmap;
 };
 
 #define to_ov08x40(_sd)	container_of(_sd, struct ov08x40, sd)
@@ -2073,8 +2075,8 @@ static int ov08x40_init_controls(struct ov08x40 *ov08x)
 	ov08x->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
 						  &ov08x40_ctrl_ops,
 						  V4L2_CID_LINK_FREQ,
-						  max,
-						  0,
+						  __fls(ov08x->link_freq_bitmap),
+						  __ffs(ov08x->link_freq_bitmap),
 						  link_freq_menu_items);
 	if (ov08x->link_freq)
 		ov08x->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -2170,7 +2172,7 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 	};
 	struct fwnode_handle *ep;
 	struct fwnode_handle *fwnode = dev_fwnode(dev);
-	unsigned int i, j;
+	unsigned int i;
 	int ret;
 	u32 xvclk_rate;
 
@@ -2236,21 +2238,11 @@ static int ov08x40_check_hwcfg(struct ov08x40 *ov08x, struct device *dev)
 		ret = -EINVAL;
 		goto out_err;
 	}
-
-	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
-		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
-			if (link_freq_menu_items[i] ==
-				bus_cfg.link_frequencies[j])
-				break;
-		}
-
-		if (j == bus_cfg.nr_of_link_frequencies) {
-			dev_err(dev, "no link frequency %lld supported",
-				link_freq_menu_items[i]);
-			ret = -EINVAL;
-			goto out_err;
-		}
-	}
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       link_freq_menu_items,
+				       ARRAY_SIZE(link_freq_menu_items),
+				       &ov08x->link_freq_bitmap);
 
 out_err:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
-- 
2.34.1


