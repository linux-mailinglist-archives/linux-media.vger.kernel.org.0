Return-Path: <linux-media+bounces-12433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E118D7D02
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:05:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00885281768
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 08:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A961853E2B;
	Mon,  3 Jun 2024 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzHnSHMZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4019487BF
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 08:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401919; cv=none; b=CZ9eC0fdtvtZSHMlH7kX0SAR/P201aSCPQ27NndnoCH45iwsxvMbqMgCHvFygGCcoeesDVAXz+IAc3nI8G/+wzUZr/6q4l+bxqinsHivdjvYE1OF+ah1+4QC74fKAMMCOq8pIkGlUIdsxkntpNFoINGQ+TeGR1yNqyE/QpEYxyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401919; c=relaxed/simple;
	bh=2wwUnJIWa/fyiUmrNrIr2z9FqDutAh7Psex4hcpKa+k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mcuO31xve6fBBTZ76nBLkK4zHM4z3FMwUwwUVOyDPK2qiQNun/2xWuDw+N6IQpyt0GJgyqGaEhcTr4hnCbt02SLOlB75O4BNBr6m9Ru5xgGSkZHNpEXxz53SVyiq6hfL5tRkJX5VYwMgKZdX0ex5whKvcR8fQMy920jo1qj56vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzHnSHMZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717401917; x=1748937917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2wwUnJIWa/fyiUmrNrIr2z9FqDutAh7Psex4hcpKa+k=;
  b=MzHnSHMZb13ovnjIZEZtMKG5oaNzvxM03sk4M6EaAipE8Bs/9PbOyP2s
   E9AlB00gInuKzdfoMsi4Sd03nEYVueV1/r0tb40Ec1jgsff8ZmpHZou/l
   mHhAyarepZrrKhydGmId6FsPtHoBlfq5LeVa6+fczYg9V7b/fVlg35Xt6
   OohEZDg+nASSTPzvXVLrlbDuVXz8FIRq19pWze13ljZBaTIJSOPsipFNW
   EVwhk9I+RrwrSthbnHHU4Y3adc1tzEMnMG/NcbGtDihZ+U//hxo5ijhwJ
   oVPb9bpkJbf7nUsJ0p8XbgZQ98Ot6anBx3zK4+TUJzV5nEKOj7mb8CLH9
   A==;
X-CSE-ConnectionGUID: jRC5skjJQaaWXd3deq0n4A==
X-CSE-MsgGUID: n5lkZpxpSg6AO4QlKG4Q+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="39285060"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="39285060"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:05:17 -0700
X-CSE-ConnectionGUID: dRUGDVsuRSOtUgG4TAHkQA==
X-CSE-MsgGUID: yAhYo2MgRTSl4HkLPjpqPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36722285"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2024 01:05:16 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: hao.yao@intel.com,
	Wentong Wu <wentong.wu@intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH 3/3] media: ivsc: csi: remove privacy status in struct mei_csi
Date: Mon,  3 Jun 2024 16:26:14 +0800
Message-Id: <20240603082614.1567712-4-wentong.wu@intel.com>
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

The privacy status is maintained by privacy_ctrl, on which all
of the privacy status changes will go through, so there is no
point in maintaining one more element any more.

Reported-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Tested-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index d6ba0d9efca1..1d1b9181a50a 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -138,9 +138,6 @@ struct mei_csi {
 	u32 nr_of_lanes;
 	/* frequency of the CSI-2 link */
 	u64 link_freq;
-
-	/* privacy status */
-	enum ivsc_privacy_status status;
 };
 
 static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default = {
@@ -271,10 +268,8 @@ static void mei_csi_rx(struct mei_cl_device *cldev)
 
 	switch (notif.cmd_id) {
 	case CSI_PRIVACY_NOTIF:
-		if (notif.cont.cont < CSI_PRIVACY_MAX) {
-			csi->status = notif.cont.cont;
-			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, csi->status);
-		}
+		if (notif.cont.cont < CSI_PRIVACY_MAX)
+			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, notif.cont.cont);
 		break;
 	case CSI_SET_OWNER:
 	case CSI_SET_CONF:
-- 
2.34.1


