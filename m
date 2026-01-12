Return-Path: <linux-media+bounces-50408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB52D11B30
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85574307C72A
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 09:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2037727E06C;
	Mon, 12 Jan 2026 09:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnTV79BJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB84277035
	for <linux-media@vger.kernel.org>; Mon, 12 Jan 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211998; cv=none; b=S+5IzVoWmihuo+jbM/xzd6XEwDS13Iof4UdjfZXlZetzfR0xa+kjQnxFkW24iuxedNR9aDwQDrV0rng6AjiOCctOqTaHYepx4q5oqv5VlTdnI1fAja3ER2N34cWoAzVOvAoafMiSqWA0kcJoZcXsttmSIl+s5ULF9NnbDU6EKXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211998; c=relaxed/simple;
	bh=k+IK/iUQ2EgupulLvjLz2Liwgkq9/vaURPpnQuA5+ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlFDwJcbywJfDrlQJoL4TjadoIJG/r7qmWjcdM5TGGyLsULR8aE21nWkIyIEFJ4Q3r2v/fXAb9P9g6MT3BMwalVuV6thXGJGLJk1S+rfdBjmSGbpZU2M6ramTSvTiabLdbWG255n8ZFRfxnMkBAOEoTfIDzeCEvOGZXbxvZtnE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnTV79BJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768211998; x=1799747998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k+IK/iUQ2EgupulLvjLz2Liwgkq9/vaURPpnQuA5+ac=;
  b=MnTV79BJUMalPfh93wrAW0hq1pGFAtIHk0+oDXtuhXrhO5/WTTSqZ/rU
   Wy56dJhi22EqK3XFk8N0BPJkFhVLXSrm/PuO4JUhK15mj+5MzJmK8MTXR
   cFy3zVDppJQclettdPGpYi9bCCzKYbN2fI0adOjHKghFLbEWmKffQcKib
   WcEOjN1DWqbuuP3UlFFnbK0vOtjOryzYQwSgrBVrnGDoF/euJZ8mkedxD
   A9YR4MJOjML9NtIJt7CFq97DRVeYJYfwM6Ztm0TOpRctiSpFvJhvT4gYK
   bzXcMEwUp7cbbXpWxYX0JcSMWe/Nm1UF50QbRGOgaF3WntidL/ZDhLQa7
   w==;
X-CSE-ConnectionGUID: Mty5D6CWQKusqVGDaAv2fw==
X-CSE-MsgGUID: dw3fPDmbSiiQbZ8RYEGKYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69218776"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69218776"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:54 -0800
X-CSE-ConnectionGUID: 5bJYlWq8RsOOZVA2mdpQkA==
X-CSE-MsgGUID: q2qZOyUDSt6rGvkzIl8Mzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234743091"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:59:52 -0800
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 29AE6121F6E;
	Mon, 12 Jan 2026 11:59:50 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vfEiE-0000000011I-05fe;
	Mon, 12 Jan 2026 11:59:50 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	mehdi.djait@intel.com
Subject: [PATCH v2 04/23] media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() calls
Date: Mon, 12 Jan 2026 11:59:30 +0200
Message-ID: <20260112095949.3851-5-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
References: <20260112095949.3851-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hansg@kernel.org>

Add missing v4l2_subdev_cleanup() calls to cleanup after
v4l2_subdev_init_finalize().

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/i2c/ov01a10.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 834ca46acb75..1e22df12989a 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -864,6 +864,7 @@ static void ov01a10_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
@@ -934,6 +935,7 @@ static int ov01a10_probe(struct i2c_client *client)
 err_pm_disable:
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(&client->dev);
+	v4l2_subdev_cleanup(&ov01a10->sd);
 
 err_media_entity_cleanup:
 	media_entity_cleanup(&ov01a10->sd.entity);
-- 
2.47.3


