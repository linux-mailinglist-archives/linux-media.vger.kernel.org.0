Return-Path: <linux-media+bounces-50236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B677AD03400
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 15:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FBA5300922A
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 14:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B43C48AA68;
	Thu,  8 Jan 2026 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7fpzBp8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943CF480350
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880671; cv=none; b=BwF6NapmiuER8Gd/KJnVD5Zbd4FzkgCRLyN+1VrwGmmwlrpQFbzQqN6oODyoSkc/922Lv1BID+pdmPYvPVuAXSwITBtgCZFGfBYuBU0IoW2n/yMfzVLseNAruY6M8euXGPhTgWkMxTuZKMolq/gCsBoA9/8+f7unb+Ba1zod0bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880671; c=relaxed/simple;
	bh=WLDf5NmVyxqj62RE17rYNs6HGZlTYYeSUwErkCstV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LjUvsC5WeytIFGunoDn3+39bU5NqZBcGp+Qk6pPed8I4xVlVUJDtkfsIksGJteG3TgFUZ8Y3Zi5AU83EauquA9u2v5nxdmQAR7YP8bXO0c8tgV8iR7+/gUCxmYX2QNnCMWM1i0SerppzWqY6aOneIDc3aURathJ9x4AquC9ZHKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7fpzBp8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767880670; x=1799416670;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WLDf5NmVyxqj62RE17rYNs6HGZlTYYeSUwErkCstV8k=;
  b=Z7fpzBp8G+R+pTmXFs8VksDEYPPxii+M9MtQVtAJ6rUTUX8UzdZTVRmk
   7boOQVypHcx33BClC+33OGqXpZwtzNyrz6S+PPch8OP930De4zMx7Yf3r
   NQUZGgaOc7BR+HhO90FUhbXpg1EmReA+pFj7ewo+EEge4OSRPYKsTCbsG
   awCkluyxjEbbWCpsA7xqTR6uDDH/27lpvFtMGjebwEFZR7YW1pA4KgiKm
   lRJl8eW53ouIWCLTsoNMQ6b6ievwq6Jzoap/eNcxX/S1W1yS6Qipjp/Np
   csA82wHy7ZByWda9tfd74YWjrOdUdfsqyuEyoMqXCHN+NT3M2CByNxI/x
   w==;
X-CSE-ConnectionGUID: 1ueWtU2GTbqruncuQQbGwA==
X-CSE-MsgGUID: xY4FKslEQcuOpGMgck0FRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69157674"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="69157674"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 05:57:49 -0800
X-CSE-ConnectionGUID: mTWeBJX9SK+X4VrT+Z614A==
X-CSE-MsgGUID: GiaBxtukTqal84/VjeVO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203486250"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.244.47])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 05:57:47 -0800
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com,
	johannes.goede@oss.qualcomm.com
Cc: bingbu.cao@intel.com,
	linux-media@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH] media: i2c: ov01a10: Fix digital gain range
Date: Thu,  8 Jan 2026 14:57:38 +0100
Message-ID: <20260108135738.175304-1-mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital gain wraps-around at the maximum of 16838 / 0x3fff.
Fix the maximum digital gain by setting it to 0x3fff.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index a35648f29932..fb4212ae3fbb 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -63,7 +63,7 @@
 #define OV01A10_REG_DIGITAL_GAIN_GR	CCI_REG24(0x3513)
 #define OV01A10_REG_DIGITAL_GAIN_R	CCI_REG24(0x3516)
 #define OV01A10_DGTL_GAIN_MIN		0
-#define OV01A10_DGTL_GAIN_MAX		0x3ffff
+#define OV01A10_DGTL_GAIN_MAX		0x3fff
 #define OV01A10_DGTL_GAIN_STEP		1
 #define OV01A10_DGTL_GAIN_DEFAULT	1024
 
-- 
2.51.1


