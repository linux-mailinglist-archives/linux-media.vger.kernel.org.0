Return-Path: <linux-media+bounces-36231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E918AED414
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A10D3165CB4
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 05:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331641411DE;
	Mon, 30 Jun 2025 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSweGBlY"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B218C011
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 05:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751262510; cv=none; b=Quux2Mh33nKDpmUrzA48dGsDvWayndVzPdMowegeV5tO6IX3DGkZPlS0EeodW2MrN1VmpwWGmNt3MMgMyMLzIqvhip1lqJCjPMaMItaLn6TEuwi2jjYaJ9HDi5I8Yr/Y7KI3Lxi5zycZVNRSUJP1BasBn8mPCb9tJgG4br5YqCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751262510; c=relaxed/simple;
	bh=uPfJ30+khHvCcsrYciNspNKqfzyTHwcTtneVwzPX7t4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sh0C0RYX2geg2fy7+/uH+c5WcmIH0wephUH9jX0K3sPr10b+x0yE/ftnHm8w52iQkcPwEcMRpg+co1sTRQHNsJDwRFmqQeNnnTFxNyLCEMdmEA3veOjvNroRjyP6plHLdORJ4wj9JUeyYXcrqUt+UuQP8HEy0Vm3EOe3pOb/+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSweGBlY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751262508; x=1782798508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uPfJ30+khHvCcsrYciNspNKqfzyTHwcTtneVwzPX7t4=;
  b=MSweGBlYkXm7GKQkuJWiI62Dhqb+DIktF5rH2cgDPTzc3jtYYoTVPFGq
   CN7jhi5uW72CS/vkW8Y6GFf0+6UKV+U9WVGUzutOKjxgnviNGwTBJZPOd
   LAp79WpWFYUuxejDLmjhM+zl2/FjV/yV/+/IKmCtmn/kqeavyz3C/E3bL
   DIDQQG4genSRowd5mkX9hUVpqBmzGuAVE8Z562sLRW1u8uRrEpg8U2AKm
   svbJK3nTtt4P0Ga5WWGrsMEQiYuqiaAaXCsFpsfkUOgUApXWwtgmPjxJ3
   Y7DcduJRfEFRyaVMNhsj0UfRtNSajE1qZe0emuF7KM5LmGhKCfNbYx2SG
   A==;
X-CSE-ConnectionGUID: JekNOTP9TcCX5XkNLE3RZQ==
X-CSE-MsgGUID: NHzAHtpqSkO37soZ8lslpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53418617"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="53418617"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 22:48:25 -0700
X-CSE-ConnectionGUID: 7E41IuInSfWAxeR+8MZlkA==
X-CSE-MsgGUID: KA4uyOwyTaabwXvsMDeLRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="159087338"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa005.jf.intel.com with ESMTP; 29 Jun 2025 22:48:24 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH] media: hi556: correct the test pattern configuration
Date: Mon, 30 Jun 2025 13:48:22 +0800
Message-Id: <20250630054822.859782-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Hynix hi556 support 8 test pattern modes:
hi556_test_pattern_menu[] = {
{
	"Disabled",
	"Solid Colour",
	"100% Colour Bars",
	"Fade To Grey Colour Bars",
	"PN9",
	"Gradient Horizontal",
	"Gradient Vertical",
	"Check Board",
	"Slant Pattern",
}

The test pattern is set by a 8-bit register according to the
specification.
+--------+-------------------------------+
| BIT[0] |  Solid color                  |
+--------+-------------------------------+
| BIT[1] |  Color bar                    |
+--------+-------------------------------+
| BIT[2] |  Fade to grey color bar       |
+--------+-------------------------------+
| BIT[3] |  PN9                          |
+--------+-------------------------------+
| BIT[4] |  Gradient horizontal          |
+--------+-------------------------------+
| BIT[5] |  Gradient vertical            |
+--------+-------------------------------+
| BIT[6] |  Check board                  |
+--------+-------------------------------+
| BIT[7] |  Slant pattern                |
+--------+-------------------------------+
Based on function above, current test pattern programming is wrong.
This patch fixes it by '1 << (pattern - 1)'.

Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/hi556.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index aed258211b8a..fc4d63160a59 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -756,21 +756,22 @@ static int hi556_test_pattern(struct hi556 *hi556, u32 pattern)
 	int ret;
 	u32 val;
 
-	if (pattern) {
-		ret = hi556_read_reg(hi556, HI556_REG_ISP,
-				     HI556_REG_VALUE_08BIT, &val);
-		if (ret)
-			return ret;
+	if (!pattern)
+		return 0;
 
-		ret = hi556_write_reg(hi556, HI556_REG_ISP,
-				      HI556_REG_VALUE_08BIT,
-				      val | HI556_REG_ISP_TPG_EN);
-		if (ret)
-			return ret;
-	}
+	ret = hi556_read_reg(hi556, HI556_REG_ISP,
+			     HI556_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
+
+	ret = hi556_write_reg(hi556, HI556_REG_ISP,
+			      HI556_REG_VALUE_08BIT,
+			      val | HI556_REG_ISP_TPG_EN);
+	if (ret)
+		return ret;
 
 	return hi556_write_reg(hi556, HI556_REG_TEST_PATTERN,
-			       HI556_REG_VALUE_08BIT, pattern);
+			       HI556_REG_VALUE_08BIT, 1 << (pattern - 1));
 }
 
 static int hi556_set_ctrl(struct v4l2_ctrl *ctrl)
-- 
2.34.1


