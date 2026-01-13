Return-Path: <linux-media+bounces-50508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E03D17458
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60E04300A526
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 08:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9F437FF6A;
	Tue, 13 Jan 2026 08:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nvIb93aV"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C337FF67
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768292718; cv=none; b=G0I2OTUuxl1EXckux0JpWDDy6Cm6RXqBap5rwUDWLcgC37ONzw1Ya/vqWvNYMk2ZxIKgT04NR8sZW+rcq1qTUwIUuclcAKxP2QrkK6cCZFyjXtjmvPpFogXw/18spRwH8N1Qlet9l7UEc8VwwqvVMSGqcvM8ZbtQyi2dXMUjtEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768292718; c=relaxed/simple;
	bh=tbxxkOxSpaPzfkJTN6J143TEw0bSwwTaPkH6fCClvFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SyowC4zDYkv1VsWXak96HBzjUj2kmQ1B0GeLXBO4d0asHD/J2INy3wFsCHH/dhz9iCKpijOzxifas52tMVXHLf9zq08vyvVwcdlVFSLU2Ov90ZU9FmTOovc7COypxjvtye7POj+kI5xqF1ZF8Q1nsnWxXQcuIp/s6totuF+XNvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nvIb93aV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768292717; x=1799828717;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tbxxkOxSpaPzfkJTN6J143TEw0bSwwTaPkH6fCClvFQ=;
  b=nvIb93aVN7wwNnbqN+yWkd1FGa5B/xu9hDvIHT75XTp3P49MxZoARGv/
   7tbkZNtNSo3gaMsrWHegm/kNi3lNR1LpFPuRZAbd7+lw4lmsGRZaG85K9
   J2Pyxs1/h1j+00msWZzvgLDFLM9xkvWvEgDO6URp7Pf3e8NX1Jdr7PTsE
   v4NS3yf1OxABUF8IYWmXEXjnOIsmgAJguckTgdufv9ogMI0SF6x5E3Kpi
   ga8v3tyhjLsDcTTsvHfHahB9SnCTTBwSkwcg0l7I5OmnxMM4caHjN2Y5m
   Y2cfMuuM4apndd7Uxb6+Jpt5tCazNzEaRFqyd6lL2fGfwerzqdZ4sr20x
   A==;
X-CSE-ConnectionGUID: VFgTV5liQUKtCGTFS+J89A==
X-CSE-MsgGUID: MpDEm+ZAROK85fXLj7YQRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="86988130"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="86988130"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:25:16 -0800
X-CSE-ConnectionGUID: FYcZlDa+QfSx3cyDFPhONA==
X-CSE-MsgGUID: d/iZCJsFQ3aRJiu1Jbz0yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235034268"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 00:25:15 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DEB2911FC37;
	Tue, 13 Jan 2026 10:25:12 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfZiC-00000000Qjv-2nOR;
	Tue, 13 Jan 2026 10:25:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH 1/1] media: ov01a10: Fix test pattern assignment
Date: Tue, 13 Jan 2026 10:25:12 +0200
Message-ID: <20260113082512.102779-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test patterns of the test pattern menu control start from 1 whereas
register values start from 0. Fix this.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
This goes on top of my recent ov01a10 series.

 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 3dbc77430e0e..0a66d8974974 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -319,7 +319,7 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
 static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 {
 	if (pattern)
-		pattern |= OV01A10_TEST_PATTERN_ENABLE;
+		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
 
 	return cci_write(ov01a10->regmap, OV01A10_REG_TEST_PATTERN, pattern,
 			 NULL);
-- 
2.47.3


