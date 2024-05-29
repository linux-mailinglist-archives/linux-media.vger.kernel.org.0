Return-Path: <linux-media+bounces-12134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCB68D2B8E
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 05:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 767051F24A5C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 03:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9629315B14B;
	Wed, 29 May 2024 03:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCx8ZV6p"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45A10F4
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 03:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716954365; cv=none; b=ZWz2raF3SZPkMqZTb6pnKsVkLgalU2iBFUuqS2D0ozRKjo+PnDjkKGwzrAp6aYasMxnNMMi2v91aBt5iM6VHfYurqzFPXkOE6WYzpYQbzbQPah9/0Uxx3b2yM6cnnUIXcjhYaSuPFgBU1SqR4NeRXPdxTMBT28HfsHJl52Jwvcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716954365; c=relaxed/simple;
	bh=ApY7ZQb4ND1iJmnuu8Iiaxf0NtBi+xjAFX//Qm5jr7U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UCwxAHQeJ0ab9zOz7EdZiVDZV19hrGG7NVVytogA3txa/Ccb/5i/CTTnB6OSQ4vtMio0O39IORcqGd3gJnJE1pRpVsrJqWGFV2OisYooLk4cxHiypX/G65kfyMNmw+FAwVTqJ2a4upKCWiNhqFRqGfNZF7bLpwG9k8BumsV/moQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCx8ZV6p; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716954363; x=1748490363;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ApY7ZQb4ND1iJmnuu8Iiaxf0NtBi+xjAFX//Qm5jr7U=;
  b=eCx8ZV6pDX0gtawBv6h/bUvE9jfGZlTjWxB3Jow2tx7++Xf+mKMSO1E8
   Utjx40wIOtMERuXay6zLm3i6Gp3gQ03QK9nx2VTZAT0tdhJ0shykkUbXj
   2GNBEjAxZTwci+W3OYe3ICXj4fDjRFdrXqymJdXcBwiCWQrtL0JWvC73j
   HvinXRHr7mtR/IMgPz+5UPV0KW+wkxMHwxwDbRQTE3VGrbi95aOKP3hWX
   /S0KzuIIc3f3ZfHCI4Eogk/qgPqAzKuBiEhbWKGp6T3hOF1+bpYjqNTxG
   9woYIDfQvJRyQfU2SqztSm/Mq1UqFS1iFPZzpNLeK97RT1It+rHRerxKB
   A==;
X-CSE-ConnectionGUID: ODFWdjACTbqd2YwAQWVhRg==
X-CSE-MsgGUID: vWdDFdFWQrKzZ/tXt6vmAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11742206"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="11742206"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 20:46:03 -0700
X-CSE-ConnectionGUID: PAi0ChYVSvOXD3MuyE1vCw==
X-CSE-MsgGUID: onR3/sS3SMGIJdVuqIs+SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="39731973"
Received: from icg-hal3.bj.intel.com ([172.16.127.200])
  by fmviesa003.fm.intel.com with ESMTP; 28 May 2024 20:46:01 -0700
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: tian.shu.qiu@intel.com
Subject: [PATCH 2/2] media: intel/ipu6: add csi2 port sanity check in notifier bound
Date: Wed, 29 May 2024 11:46:00 +0800
Message-Id: <20240529034600.117803-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

Invalid csi2 port will break the isys notifier bound ops as it is
trying to access an invalid csi2 sub-device instance based on the
port. It will trigger a mc warning, and it will cause the sensor
driver to unbound an inexistent isys csi2 and crash. Adding a
csi2 port sanity check, return error to avoid such case.

Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index 5992138c7290..997fbfbf2ea5 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -676,8 +676,16 @@ static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
 		container_of(notifier, struct ipu6_isys, notifier);
 	struct sensor_async_sd *s_asd =
 		container_of(asc, struct sensor_async_sd, asc);
+	u32 nports;
 	int ret;
 
+	nports = isys->pdata->ipdata->csi2.nports;
+	if (nports <= s_asd->csi2.port) {
+		dev_err(&isys->adev->auxdev.dev, "invalid csi2 port %u\n",
+			s_asd->csi2.port);
+		return -EINVAL;
+	}
+
 	ret = ipu_bridge_instantiate_vcm(sd->dev);
 	if (ret) {
 		dev_err(&isys->adev->auxdev.dev, "instantiate vcm failed\n");
-- 
2.34.1


