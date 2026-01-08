Return-Path: <linux-media+bounces-50195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 106D0D01AA1
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 09:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CAB9313250E
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 08:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031B136657F;
	Thu,  8 Jan 2026 08:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Za8OCnVf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992773A9018
	for <linux-media@vger.kernel.org>; Thu,  8 Jan 2026 08:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860235; cv=none; b=edq1tZbMdKRWEV129/X1iYTZ0aakgLeH6brHghZlqwr3zbRMlcfIfYom2r6q7LchK9WtAbafE1P4J+77LXKtMSanWHeTJfHp3pCn7WxRFIAdrnxpAnDCl3i/yb8VFw0Z3IQRWOaZ+shABe2y1Rgg6gqeJuYnoYlVN1QstOqyW0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860235; c=relaxed/simple;
	bh=CXUWGXZWPH9THtmuceG5sOLkXgStI19vcErcsemp5YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYcZq5mfzILGmBXHpuXfJsR2MsuNVkL5X4ljU4m2D0BlbKBbVBqRF/S86/2vvCA/41+D/S3r78+WNZj8mN8r7q7hXkZByOEnJewPT2XpxpnmG/SaKIcg5oZ1kk2iyE8CpbSecqIPWtb5K1tRx/jkSQCkx1IuA8Xw6FfAaaF9cNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Za8OCnVf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767860229; x=1799396229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CXUWGXZWPH9THtmuceG5sOLkXgStI19vcErcsemp5YU=;
  b=Za8OCnVfYRFO54oGlouHgOvj8FOMPDC7ul2sxb8Ed2fe0Rim2gRIblSS
   g4vWbgvrx8M5zDiprZwUOqsRyVl9n246QqSfDsFRs5BPw/pvHrLVlWAnS
   ia/NfxmiQwHP97OJXXeyVNLf0N8VV1TTpphZVITAF+5iGHD1m1iVm4/2R
   4/WinzBXTU7qtYH94RpJppyA7QNN4NKdAL50jcXa90NDeXgrPpvQsGKQv
   4VpcsE7xDUAcxXMSEFmwoVn+p9neNGcHfVwNzFOIdDG2Fhsd6WS+Ua9mu
   lE/0EuXH1ZlixItimJhUNDfgHAdUKsczy7JH50FBXPLpd89TizMovjcrS
   A==;
X-CSE-ConnectionGUID: k6KbaZ9WRsCwe7NSf7FDPg==
X-CSE-MsgGUID: S3MFFb22Tba58oNpACa8EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72869918"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="72869918"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:02 -0800
X-CSE-ConnectionGUID: y7ZT79NZThm/gKoTZ0svlQ==
X-CSE-MsgGUID: QfuE7P8pT2q66RJKPdFXVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233842946"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.211])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 00:17:01 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 679BC121D95;
	Thu, 08 Jan 2026 10:17:13 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vdlCi-00000002HSF-0Uvx;
	Thu, 08 Jan 2026 10:17:12 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: bingbu.cao@linux.intel.com,
	tian.shu.qiu@intel.com,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com
Subject: [PATCH v4 03/14] media: ipu6: Remove redundant driver data checks
Date: Thu,  8 Jan 2026 10:17:00 +0200
Message-ID: <20260108081712.543704-4-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
References: <20260108081712.543704-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both runtime PM resume and suspend callbacks check whether the driver's
data is set for the device. This is done in probe(); drop the redundant
checks.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 226bfae21c16..ef01dcb635fa 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -857,9 +857,6 @@ static int isys_runtime_pm_resume(struct device *dev)
 	unsigned long flags;
 	int ret;
 
-	if (!isys)
-		return 0;
-
 	ret = ipu6_mmu_hw_init(adev->mmu);
 	if (ret)
 		return ret;
@@ -884,13 +881,9 @@ static int isys_runtime_pm_resume(struct device *dev)
 static int isys_runtime_pm_suspend(struct device *dev)
 {
 	struct ipu6_bus_device *adev = to_ipu6_bus_device(dev);
-	struct ipu6_isys *isys;
+	struct ipu6_isys *isys = dev_get_drvdata(dev);
 	unsigned long flags;
 
-	isys = dev_get_drvdata(dev);
-	if (!isys)
-		return 0;
-
 	spin_lock_irqsave(&isys->power_lock, flags);
 	isys->power = 0;
 	spin_unlock_irqrestore(&isys->power_lock, flags);
-- 
2.47.3


