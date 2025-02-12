Return-Path: <linux-media+bounces-26039-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D69CA32055
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 08:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6D40161E37
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 07:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277B2204C26;
	Wed, 12 Feb 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSDVMUYh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F2D1E47B4
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739346799; cv=none; b=hFYIXc3sRuaQOTTDPUQpUAx2LGp78RgDzaST4/PRRpQ4eUP7G+1URXMIqgoZasvE2s059JhinsGJP6vPL5axNxHjTNg7cCwSDGtZRdmDFGdz9AYUmcoHYVOE1qWRVT0Irje8nXxoPPjB6K+GaWmGZw6lCqh5U9dOX2gV+Frd/Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739346799; c=relaxed/simple;
	bh=mJ3PEJz1hTq7SpBbhN9JVJM7UjpL8DyiHXTgYk+E1oE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Wr3pSM0yH3vJtu/OjwhwnxXXDCcGFdyit81DhjOZP3zNt4EYz43I/0ue0SQ/ZvDJBVC89SlirnNP4TfCXqYMNdtdCKEOA97BlaFt/VZ+e2NOjEZNCBIe9tr9aFLBA/KYrNz+l1bhiEpOTuuDrkgySPggeQdHmSwrY22WTNIHcN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSDVMUYh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739346798; x=1770882798;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mJ3PEJz1hTq7SpBbhN9JVJM7UjpL8DyiHXTgYk+E1oE=;
  b=HSDVMUYh+bsmB+si1QH3aBTR25DLTU3ZksIFqctCd2WVYXxM+8h8tr0i
   pYqff/90u0eIrxkEczhVAHEbB6qHxzenNKAesMnf3SJFzzxgYYwQT3Uzn
   wDoIJ1plCvbq9NEoDybiBia74+G1AJtj86/JhbxJ0y9HNSajjuAfRtYar
   VgEJQBfqVW4WUd5yASrJ0cxhteLIaLfE9ORXrdmLQjJZdY+sD02fZt1vK
   Vh5ar/ncMPFVbKSi6kKZf2RnL9pkKEuMe2V5kmqTWFWzXxRTabIG4KIav
   C7pCdfUJDcwyV4ox1U99vsXhr1vtKfE3pkPUsYTVFoViOMtTeydyEDTF+
   Q==;
X-CSE-ConnectionGUID: GL6KvCBITQGblvueLZqGlw==
X-CSE-MsgGUID: Tm7JtAVIRPe+YtS3AGFUww==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50212037"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50212037"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 23:53:17 -0800
X-CSE-ConnectionGUID: 96O6Nzc5Rai+pyh/9JHgog==
X-CSE-MsgGUID: RjBB7R0oTnqgYzxBRBvtig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113646611"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa008.jf.intel.com with ESMTP; 11 Feb 2025 23:53:15 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hidenorik@chromium.org
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH] media: intel/ipu6: set the bus_info of the v4l2_capability
Date: Wed, 12 Feb 2025 15:53:14 +0800
Message-Id: <20250212075314.2291135-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

IPU6 isys driver missed setting the bus_info of its v4l2_capability.
`v4l2-ctl --all` cannot show the bus_info. This patch copy the bus_info
from the media device to fill the v4l2_capability.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 387963529adb..3ca3f44da387 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -146,6 +146,8 @@ static int ipu6_isys_vidioc_querycap(struct file *file, void *fh,
 
 	strscpy(cap->driver, IPU6_ISYS_NAME, sizeof(cap->driver));
 	strscpy(cap->card, av->isys->media_dev.model, sizeof(cap->card));
+	strscpy(cap->bus_info, av->isys->media_dev.bus_info,
+		sizeof(cap->bus_info));
 
 	return 0;
 }
-- 
2.34.1


