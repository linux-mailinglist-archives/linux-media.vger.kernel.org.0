Return-Path: <linux-media+bounces-12432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A52B8D7D01
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1780CB20C16
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 08:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E549F548F7;
	Mon,  3 Jun 2024 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNdg9J7/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C2C53365
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401908; cv=none; b=Q/FPMtuYHqRWukN5/R0bSAesa5M7aeoEiZ/Erx60dkQg3KghuwJv1xWAcWrM/DMD9JVieD2dAmUPWSQQjHnWJcV+5XHONs9PDuBt26878DjSu9pYGrGVtTN+Zm5dMnn1j34nc0kMhC+9IWh/bRIDQsquOC4yUow4OvBpXMBLdWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401908; c=relaxed/simple;
	bh=04GAPIDZe+cnPlgu5+BSVtkVJLB/UdAQ2UPvvE/dZm0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=riFXZ0uA41+7XZilhVd/944ecp0jVc37FFWRmM4QYAgbtyvowIBkkz0cauolqumTGa8BMkw9j2/mHfXqqIR50Z2MvkwWI+zIuBJT7odtiSE4Ti3M/9Tt+VJ4HGi2PMnWCHBKpKNAIbG94iAz3N5uaJ06sEEkzVJxB+Wp/JIC9T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNdg9J7/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717401907; x=1748937907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=04GAPIDZe+cnPlgu5+BSVtkVJLB/UdAQ2UPvvE/dZm0=;
  b=BNdg9J7/UcqaMdNao4EPjHDVSxWGWY7UimfveH/CZCwSEIX9//m8bfr9
   EFET1ogIkWe6V4o/2Gm+IV6AjZmHzivCU3qbeYoyvOlts7W5TpY0QTw+v
   wEADeCK6h/b8uid7Ug6FNqNs73MghoQuqVS1dnu5hDNKpNc5VxIMt3iZc
   YoVAZn3SR2PCmk0y9A9aXqd19nm1ISWy1IpFQFJKqhKjG1vnSewIF9gT2
   eBmYpo5a6vo3lcHHcHsu2WAJWdpKaASsZyINYtGNOs/ouRV53l2wrHmvN
   erlEZrs8OK/mecHYMWr1GjdIHq/tY7eOuNDuOTItZRsOE2CU7dDUqiYA3
   A==;
X-CSE-ConnectionGUID: uuPQV+ZYRoav+qa0RlJr2Q==
X-CSE-MsgGUID: 4Y9W/pKtQyGEho7XnhC+9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="39285038"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="39285038"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:05:06 -0700
X-CSE-ConnectionGUID: yFA212NyTuOxZHszkXLk7Q==
X-CSE-MsgGUID: lC+S0FDdTVejIwbXDEg5Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36722175"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2024 01:05:06 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: hao.yao@intel.com,
	Wentong Wu <wentong.wu@intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH 2/3] media: ivsc: csi: add separate lock for v4l2 control handler
Date: Mon,  3 Jun 2024 16:26:13 +0800
Message-Id: <20240603082614.1567712-3-wentong.wu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240603082614.1567712-1-wentong.wu@intel.com>
References: <20240603082614.1567712-1-wentong.wu@intel.com>
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
index 004ebab0b814..d6ba0d9efca1 100644
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


