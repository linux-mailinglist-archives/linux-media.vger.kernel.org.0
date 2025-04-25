Return-Path: <linux-media+bounces-30973-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A108A9BDA2
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 06:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 011319A0D57
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 04:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221A2218580;
	Fri, 25 Apr 2025 04:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hfui1G2k"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37C17BB21
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 04:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745555639; cv=none; b=l7vRgDUcORCvqw21qUZw3ZRzYre/lwW6FaXRGLDMR5oFQd+apk+k4ARDw/8BHGyja6IO9yJ9Y2qn3zk+yUPQwGq0uw0aI0u7mV2/o8Tk/sfJX0xQJdqATfIRGbYQHv4pGRXo90QvNSwQwilzSIjq537JputPlh1rgPH6TWsiff4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745555639; c=relaxed/simple;
	bh=mARV7FV2X861xXw3/2b6aFrh5zIvU3BVokvZnVzGHEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aeweh1nomOD6wQLde7EjLYxLNQ2kCNFEr75e8WyBpHl8Jz7PPWYVP7q0RKfzl/eCnBlMkGO7poQ6lUZlvCCuUZxzBjITV8r2qGVSIfUPNX9fL3yakGw49TzemcJ1GwQEd4bjVvP7pt/MnCFi+ILIQgprDqtQoXZKMeFWR3CXeTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hfui1G2k; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745555637; x=1777091637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mARV7FV2X861xXw3/2b6aFrh5zIvU3BVokvZnVzGHEc=;
  b=Hfui1G2kpnw945O83wN0dDGac+zyG7tJTW5Xnb4P+dMT53mgWdO4lw0A
   ySwA7cpGuCGh9W/8ZVzGkslTGIq6ZO4PynEQgaJYt4wLfV/+iH8qxm+nO
   STge8f6MS5kaypNFQqvE5O4wO+G3jpv+OGUnThdWCdjXg/hhRp0CV0Y8a
   Zu3hcfm5RBdUp+moyhqxad071dAFOc4nemRW0bKyG1co0XAVc8H5fvK1Q
   4equM6V7Z0iw4Y1HugS6tuFg+e4o6ErKFg5s/PT/F5Ue6NHnl/RYtOjOd
   7B/Yvk70HbwbmCofZo4rA+260rJn1xExZNp0XrO9TfB2cw7HkgF6Ldnfw
   g==;
X-CSE-ConnectionGUID: 5QktefX3RCimOwcOIH2FvQ==
X-CSE-MsgGUID: MVI9OMLERBeldNO5rxJpNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47383471"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47383471"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 21:33:57 -0700
X-CSE-ConnectionGUID: 6luCz+T7SMK2Zftg6PA25Q==
X-CSE-MsgGUID: avoci0TNS66fOqI5sCBC4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="132726582"
Received: from haoyao-desk.bj.intel.com ([10.238.232.12])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 21:33:54 -0700
From: Hao Yao <hao.yao@intel.com>
To: linux-media@vger.kernel.org
Cc: Jason Chen <jason.z.chen@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	arun.t@intel.com,
	Hao Yao <hao.yao@intel.com>
Subject: [PATCH] media: ov08x40: Fix the horizontal flip control
Date: Fri, 25 Apr 2025 12:33:25 +0800
Message-ID: <20250425043328.208804-1-hao.yao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The datasheet of ov08x40 doesn't match the hardware behavior.
0x3821[2] == 1 is the original state and 0 the horizontal flip enabled.

Signed-off-by: Hao Yao <hao.yao@intel.com>
---
 drivers/media/i2c/ov08x40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index cf0e41fc3071..17112c02408a 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1627,7 +1627,7 @@ static int ov08x40_set_ctrl_hflip(struct ov08x40 *ov08x, u32 ctrl_val)
 
 	return ov08x40_write_reg(ov08x, OV08X40_REG_MIRROR,
 				 OV08X40_REG_VALUE_08BIT,
-				 ctrl_val ? val | BIT(2) : val & ~BIT(2));
+				 ctrl_val ? val & ~BIT(2) : val | BIT(2));
 }
 
 static int ov08x40_set_ctrl_vflip(struct ov08x40 *ov08x, u32 ctrl_val)
-- 
2.43.0


