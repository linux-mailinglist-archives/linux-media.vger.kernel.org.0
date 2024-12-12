Return-Path: <linux-media+bounces-23324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C14C9EE7EA
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 14:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1962C18892F0
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2AC5213E9C;
	Thu, 12 Dec 2024 13:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkA8s3NT"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9C6215783
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734010819; cv=none; b=GZaQ6zkN7jBuUPhrT7oloIL3QFUxoRN7b4AaDZYCCq7ltAhbtDM3bgZ8cn5By0/hDyxr7sW9BegvyORqvSR2bnMuL9c3LK9iI5jfYjz2xIQUeUtR82xl0rU/tc0bgj4avJ6CVkj4gEta0Tg+cod+2b2+JhCSvyrLa02JSegiCCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734010819; c=relaxed/simple;
	bh=sSxAAUBdMDTPYDbxrQbFDlNR6FhW8ed0WM9guv9gkbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcPm1z5GrhnC36G5iRMw4VhrGHtCDCdlmuIafX3ZO8hkGGxNCwnwclHwXmseuGPHV3u1AiVrwUt65R1NmpKJHIhLVG4aoP3AyXORYxFS4C6T+XtN03aZwDAQxc6Wsfyw5MDt52qHmj2BXzS8b/vBEYBcKCLZPJR2L29sBgDUXKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkA8s3NT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734010818; x=1765546818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sSxAAUBdMDTPYDbxrQbFDlNR6FhW8ed0WM9guv9gkbE=;
  b=BkA8s3NTHXMB/JejTdFnuRIrWDDl3paSF9pPPDQw38LCveiJdr70z3N4
   6Q6C/Kwc78Tnm2lfIaqUOCjy3+5jfmjD0Sg6K1HYEJwiuDl8af7gmWCcW
   avnseSEb1QSftX9P9IVxw/aUmzDIF8AqO/h5ltjzU4t5hQ7REr0nozCtR
   XaG05qhqx6QNlvz3rzhTbKvVpDxE+jfnUEEmtmqrjLsSIpS35uQHkF2WP
   F8QduKXFDXxlfAmJxFhsuMk+9hrtnw9sFhzKDUoLeYjj5dxu2M01gyDmi
   UlZ5xlNpUe8boKbHk5n45CjD0VzsdAxXTzq0YbkLEEvIGbjcVt7kODW/l
   A==;
X-CSE-ConnectionGUID: YPKW9gWlQHiWOVqKgPSjiA==
X-CSE-MsgGUID: PrczxbCoQWSbrV5vLjVeTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38210287"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="38210287"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 05:40:18 -0800
X-CSE-ConnectionGUID: ofOteAnSRfSU2DA6x3ozYw==
X-CSE-MsgGUID: fs38XaZ5S9uRZgxzGMliQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="101250113"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mdjait-mobl.intel.com) ([10.245.245.124])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 05:40:16 -0800
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: [PATCH v2 2/2] media: ccs: Fail the probe on CCS static data parser failure
Date: Thu, 12 Dec 2024 14:40:04 +0100
Message-ID: <453d8e099752c5216c465dfd71429e9e0e53d1fd.1734010609.git.mehdi.djait@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <dbbf14a0003016c7fd4529918d0e9e8f0c828a7e.1734010609.git.mehdi.djait@linux.intel.com>
References: <dbbf14a0003016c7fd4529918d0e9e8f0c828a7e.1734010609.git.mehdi.djait@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to continue probing when the CCS static data parser fails. Improve this
by checking the return value and correctly exiting on failure.

Signed-off-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
v1 -> v2:
- no changes: this patch is introduced in the v2

 drivers/media/i2c/ccs/ccs-core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index f3af8aed1485..b3fd7f75bf62 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3756,9 +3756,11 @@ static int ccs_probe(struct i2c_client *client)
 
 	rval = request_firmware(&fw, filename, &client->dev);
 	if (!rval) {
-		ccs_data_parse(&sensor->sdata, fw->data, fw->size, &client->dev,
-			       true);
+		rval = ccs_data_parse(&sensor->sdata, fw->data, fw->size,
+				      &client->dev, true);
 		release_firmware(fw);
+		if (rval)
+			goto out_power_off;
 	}
 
 	if (!(ccsdev->flags & CCS_DEVICE_FLAG_IS_SMIA) ||
@@ -3772,9 +3774,11 @@ static int ccs_probe(struct i2c_client *client)
 
 		rval = request_firmware(&fw, filename, &client->dev);
 		if (!rval) {
-			ccs_data_parse(&sensor->mdata, fw->data, fw->size,
-				       &client->dev, true);
+			rval = ccs_data_parse(&sensor->mdata, fw->data,
+					      fw->size, &client->dev, true);
 			release_firmware(fw);
+			if (rval)
+				goto out_release_sdata;
 		}
 	}
 
-- 
2.47.1


