Return-Path: <linux-media+bounces-26156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17545A35BF0
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 11:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 877E73AA761
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 10:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D4F25A64D;
	Fri, 14 Feb 2025 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwYC1A86"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1038E15198D
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739530363; cv=none; b=WA7KBoTFENhEqGKWckoOhG1G5t0zmACP9R1PtqHx37mQTwODrC//ZV7Ur0Mx9W9k80UiBGQeABcYsMDKKI11WJKGy5goUsz7BTQ2zM3qS1BdBZRd15cI+XDCgmGaJy1r0nit0jf0iWbDhonUl2NerrKTyVs39jg3z0hg4HtV0ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739530363; c=relaxed/simple;
	bh=zp+P/RH5/SUFvziYlLLCbEArQwDS5c1tZUfS6ZgVpQU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PsrCoJFan/nDeJSB2mCEdka4KB/Ggk79wwmIUlhEXW+Loq41NY+5xvINe/dDZz8qKdfG8L7f4f+Kg08jCusJLN0ynKIMtFHE+cw5dsLeFovfuzTSILtKj2q5A0vfQff/9ZFbfRuDpBYPp2NOUKlImWmjcpcgfUOODW0BDDFrddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwYC1A86; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739530362; x=1771066362;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zp+P/RH5/SUFvziYlLLCbEArQwDS5c1tZUfS6ZgVpQU=;
  b=EwYC1A86tpARle9RPegw3HvJfLaiuCZEDBwCmK6mwTURKXh1MToCDz8a
   LBc2VOt0PL8pp/phnEPSjDP64Cgi0jACd/TZH2trNpg3Mqjmiha7bFz2D
   xBiRcssUygsGeG5wPqmacJij1JMncMGXCzgP40Xb93V3ePhYEyX2q5RxC
   VFw+YTwp0OUkWg1Bnx+iPKunetHctn3UMDM1y2G9pE7ceL1Rc40IVOFfe
   VExlfZ0SxlNogrj1NIgI5h2cHmeyUh2IfBaYR9f2pGhCzb3ktIjKVjVjZ
   mA8mSH7n5ZPKfO6qwuWtcrWamtFC9GzdPtmCDmznz371S2awR3MuocvN7
   g==;
X-CSE-ConnectionGUID: EZtnC0C9SKWtgTTW5GCr4g==
X-CSE-MsgGUID: +6ndqGtMS1GucQlRkMXtSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40198037"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="40198037"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 02:52:42 -0800
X-CSE-ConnectionGUID: lPfWTV87R7K7v8Anyc0mPg==
X-CSE-MsgGUID: m5lVgSR+RteahFGG1ox2/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114328752"
Received: from vtg-chrome.bj.intel.com ([172.16.127.120])
  by orviesa008.jf.intel.com with ESMTP; 14 Feb 2025 02:52:40 -0800
From: bingbu.cao@intel.com
To: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	hidenorik@chromium.org
Cc: bingbu.cao@intel.com,
	bingbu.cao@linux.intel.com
Subject: [PATCH] media: intel/ipu6: set the dev_parent of video device to pdev
Date: Fri, 14 Feb 2025 18:52:38 +0800
Message-Id: <20250214105238.2697416-1-bingbu.cao@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bingbu Cao <bingbu.cao@intel.com>

The bus_info in v4l2_capability of IPU6 isys v4l2_dev is missing.
The driver didn't set the dev_parent of v4l2_dev, its parent is set
to its parent auxdev which is neither platform nor PCI device, thus
media_set_bus_info() will not set the bus_info of v4l2_capability, then
`v4l2-ctl --all` cannot show the bus_info.

This patch fixes it by setting the dev_parent of video_device and v4l2
framework can detect the device type and set the bus_info instead.

Fixes: 3c1dfb5a69cf ("media: intel/ipu6: input system video nodes and buffer queues")
Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
---
 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 387963529adb..959869a88556 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1296,6 +1296,7 @@ int ipu6_isys_video_init(struct ipu6_isys_video *av)
 	av->vdev.release = video_device_release_empty;
 	av->vdev.fops = &isys_fops;
 	av->vdev.v4l2_dev = &av->isys->v4l2_dev;
+	av->vdev.dev_parent = &av->isys->adev->isp->pdev->dev;
 	if (!av->vdev.ioctl_ops)
 		av->vdev.ioctl_ops = &ipu6_v4l2_ioctl_ops;
 	av->vdev.queue = &av->aq.vbq;
-- 
2.34.1


