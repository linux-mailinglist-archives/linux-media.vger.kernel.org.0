Return-Path: <linux-media+bounces-12731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFA490044B
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C7381C23B38
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA8C1940B5;
	Fri,  7 Jun 2024 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxaVoM9I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7568A18732D
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717765449; cv=none; b=Z+A8V3ylEi1+T0z13LAvniWLJuh6uQnnVQGyEeoouFzd90WOQSUhAaHxxoy8JGXTcReGq5uZD+wbp+kEjOVhtB7ReN7+vAcLWb6r9Mib4aSTWIoAnI0TB3I83XiM+T6w0/DVW6oC9wx7WKm9fu/aMF9T7pS4qgGIhRcZVF3QULE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717765449; c=relaxed/simple;
	bh=SWUBLicWCoe659rktqHrfB3VErb9y/ffAhDsr1AcIxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G/KdJWr27M6kULdrLRi21HUsGyfvgeYFXC19NqIN0pCzJVWQVcvmetDR5UakCRQfT0cTUNIT8G4S9dMEANE+py93XgblybxsJG7Hg9prdz5DW9epvx7fHjQhVkZOS5X7RM6LRMfjxCfeiQYi1zjgkVn2IkME1+psomrrQ/QJpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxaVoM9I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717765447; x=1749301447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SWUBLicWCoe659rktqHrfB3VErb9y/ffAhDsr1AcIxw=;
  b=OxaVoM9IafIQC8AMVYdO6XLzB0aSd+EtZdiuvhmgEYws/MPNYsmfcbcV
   OrEaiq2MirnOLnXJHD4swgRiSQPY9B2sC9YzzygxGBeZUq+19V4IijDAI
   lRCPspGHiQLnuFaXZ7r3hFjTu2NuwWo5t61Dp3ANoDwqwVhzXC38Hvmgf
   08m98iDPvXeQeqgO27PD+Ewrpp7Ic4vL8Qimk3FywEMPFhoSktCPUR6XK
   Ci4HNbn1x7TmVJNkHdvLaiHhLmyNlaVsB+0jmvQbmEBRRn1XCxsTZH0Fn
   lzXyW7/uZhsn8PNzBYi67KgOrwcGr9AOOUoWPwdC/2OA0MkIc7fyvG9uP
   A==;
X-CSE-ConnectionGUID: hNERS0XqTXCj6NtW3IYzFQ==
X-CSE-MsgGUID: g0XReb3QTBemhICSB+OJUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18311929"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="18311929"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:04:07 -0700
X-CSE-ConnectionGUID: UtnhCg0ISASI5xhpVb5UCA==
X-CSE-MsgGUID: 7o0eNtnKQhqQ2bUST4pHxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="42734243"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2024 06:04:05 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: hao.yao@intel.com,
	Wentong Wu <wentong.wu@intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v2 2/3] media: ivsc: csi: add separate lock for v4l2 control handler
Date: Fri,  7 Jun 2024 21:25:46 +0800
Message-Id: <20240607132547.2820515-3-wentong.wu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607132547.2820515-1-wentong.wu@intel.com>
References: <20240607132547.2820515-1-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There're possibilities that privacy status change notification happens
in the middle of the ongoing mei command which already takes the command
lock, but v4l2_ctrl_s_ctrl() would also need the same lock prior to this
patch, so this may results in circular locking problem. This patch adds
one dedicated lock for v4l2 control handler to avoid described issue.

Reported-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Tested-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 05c0acb78939..a46a012b301f 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -126,6 +126,8 @@ struct mei_csi {
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct v4l2_ctrl *freq_ctrl;
 	struct v4l2_ctrl *privacy_ctrl;
+	/* lock for v4l2 controls */
+	struct mutex ctrl_lock;
 	unsigned int remote_pad;
 	/* start streaming or not */
 	int streaming;
@@ -563,11 +565,13 @@ static int mei_csi_init_controls(struct mei_csi *csi)
 	u32 max;
 	int ret;
 
+	mutex_init(&csi->ctrl_lock);
+
 	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
 	if (ret)
 		return ret;
 
-	csi->ctrl_handler.lock = &csi->lock;
+	csi->ctrl_handler.lock = &csi->ctrl_lock;
 
 	max = ARRAY_SIZE(link_freq_menu_items) - 1;
 	csi->freq_ctrl = v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
@@ -756,6 +760,7 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
 
 err_ctrl_handler:
 	v4l2_ctrl_handler_free(&csi->ctrl_handler);
+	mutex_destroy(&csi->ctrl_lock);
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
 
@@ -775,6 +780,7 @@ static void mei_csi_remove(struct mei_cl_device *cldev)
 	v4l2_async_nf_unregister(&csi->notifier);
 	v4l2_async_nf_cleanup(&csi->notifier);
 	v4l2_ctrl_handler_free(&csi->ctrl_handler);
+	mutex_destroy(&csi->ctrl_lock);
 	v4l2_async_unregister_subdev(&csi->subdev);
 	v4l2_subdev_cleanup(&csi->subdev);
 	media_entity_cleanup(&csi->subdev.entity);
-- 
2.34.1


