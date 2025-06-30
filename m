Return-Path: <linux-media+bounces-36261-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 050C9AED81F
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 11:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D65A175B44
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2B123F43C;
	Mon, 30 Jun 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d11FmmaU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A2C11CAF
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274265; cv=none; b=YxO7YQBUtQISPXMvwEYgh1PtCEfpxXeLwq/4TvC/RQbFgEHO9zpQVsU+Z0mn/x1K0JG+lZRTrdCEJ6Vn6VCtGsTGQVyG+BGyexfrZXUZLP1XnIktGkLweGV5ZZepnGIWAn4UiJXu1zUEVWpikJYF0Q2L2q48LzY135CjycimMdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274265; c=relaxed/simple;
	bh=OKYwZx/F9xRMS5kWX/u8+RzxfsW1xmiqH4Y7KanhzF0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eEex9H+vNFWCX1vm887Crx+3aW6DTzWaPz6JBBy+mFl+MkWXEtB8706h8ICXNlK/cmhV76PuV9+ZYNBdzPRzhu5PVSn29KjmToqN6NVu7lK1t3Sw82U1dqX+dLF+qBuYCNF2KxbIYYk4P8Xxb+zT4WlOXJv5uG7f4x4X+HnQULM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d11FmmaU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751274264; x=1782810264;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OKYwZx/F9xRMS5kWX/u8+RzxfsW1xmiqH4Y7KanhzF0=;
  b=d11FmmaUo+eNxEPWq8JT81IuE9ZgBefwVlTRP5sHWTjREQjV3jkV78pT
   MDgZZkRT9a+sUlG3X672WlyzkWnebIHQpVfA62CQc0l+7Yrzo42VXsMsR
   AZZplG1t6bghOQrUrxpvBChGun4oVE96sH6ZKjMaAqh1vrxV0DciQJrr9
   Z3c2Mn2GC10RWhErzJxPyElW88tQRGceuAEBdbrv5TQjqPDjUWrT3EVN5
   9+LOqpzXJIRyQytS/eJaArgPA2PIPEwlBL8PSzr8RqUIYpN/oNN+gNdD+
   ayqb0AMVi9CQytJTh78VaQg8lVIGRFOEeuVEjrl07LdZ3UtjmMecvgic0
   g==;
X-CSE-ConnectionGUID: MKNH97BISz6KqTxql+tsMA==
X-CSE-MsgGUID: yu2JxFQmRw2z8twRWerEGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64188092"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64188092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:04:24 -0700
X-CSE-ConnectionGUID: aS46xt6YSL2jsGsXUTYmMg==
X-CSE-MsgGUID: 9dt2yBwKTOq1IFuI+oSg7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153875650"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa008.jf.intel.com with ESMTP; 30 Jun 2025 02:04:22 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH v2] media: hi556: correct the test pattern configuration
Date: Mon, 30 Jun 2025 17:04:20 +0800
Message-Id: <20250630090420.479790-1-bingbu.cao@intel.com>
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
This patch fixes it by 'BIT(pattern - 1)'. If pattern is 0, driver
will disable the test pattern generation and set the pattern to 0.

Fixes: e62138403a84 ("media: hi556: Add support for Hi-556 sensor")
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/i2c/hi556.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index aed258211b8a..dce78af444db 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -756,21 +756,23 @@ static int hi556_test_pattern(struct hi556 *hi556, u32 pattern)
 	int ret;
 	u32 val;
 
-	if (pattern) {
-		ret = hi556_read_reg(hi556, HI556_REG_ISP,
-				     HI556_REG_VALUE_08BIT, &val);
-		if (ret)
-			return ret;
+	ret = hi556_read_reg(hi556, HI556_REG_ISP,
+			     HI556_REG_VALUE_08BIT, &val);
+	if (ret)
+		return ret;
 
-		ret = hi556_write_reg(hi556, HI556_REG_ISP,
-				      HI556_REG_VALUE_08BIT,
-				      val | HI556_REG_ISP_TPG_EN);
-		if (ret)
-			return ret;
-	}
+	val = pattern ? (val | HI556_REG_ISP_TPG_EN) :
+		(val & ~HI556_REG_ISP_TPG_EN);
+
+	ret = hi556_write_reg(hi556, HI556_REG_ISP,
+			      HI556_REG_VALUE_08BIT, val);
+	if (ret)
+		return ret;
+
+	val = pattern ? BIT(pattern - 1) : 0;
 
 	return hi556_write_reg(hi556, HI556_REG_TEST_PATTERN,
-			       HI556_REG_VALUE_08BIT, pattern);
+			       HI556_REG_VALUE_08BIT, val);
 }
 
 static int hi556_set_ctrl(struct v4l2_ctrl *ctrl)
-- 
2.34.1


