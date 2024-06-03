Return-Path: <linux-media+bounces-12431-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E85F8D7D00
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 10:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF09C2811A5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 08:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FE954757;
	Mon,  3 Jun 2024 08:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zx4O0Ntq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA853E31
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 08:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717401906; cv=none; b=f1RHMhDzjgx3xX37RDQD6AIxUf/Iuq7XMnAC8X9dOJgTnJsoKzzgT1LOgEgR7aRnV3c30+zg/xOvEDQi4kKQudcj1KaXVMEeZVWfVaoRl4UorbkLX8v7KXDK45YJdmbz7PIzu4MJ/eabH/3wFjUM8OXQz2pmlvqABaxBMou7H7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717401906; c=relaxed/simple;
	bh=neHAif2hPC2f8Ib3q+9GO/k4O2BoUwh6fsZqjyoxgGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QzKGcZwI5rJP4q7zFkpTHqjj0SXiBVhHdrU4H7kyN8VgNZFbajoSmtOksBnABsXWq0CbusTpWE7BRoHPuK0aqCuenzRfxuP9o29phIxUqUDLspwEL14aRddS0t/Nc1T9kYwScUf1ZeaQVX2diDTWWe2FYwbqNriBSBJXwmrNk6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zx4O0Ntq; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717401904; x=1748937904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=neHAif2hPC2f8Ib3q+9GO/k4O2BoUwh6fsZqjyoxgGE=;
  b=Zx4O0NtqUHwY08/IzxNfHBInXBZ1vlLjTbdnYd/JfONndmmurCBNxHFP
   xFrtRV6TTfxW8ut7HG8gk+O0/zDXOCiS5GlXHRtUVAE+T3X2C2nVZDgCF
   v728SFkVLsE+p568XjazqNSPHKGRk3x9671/4DSBLB1sr13aGvPpKHKGg
   9OHI3qp9/KxQGYOM3F0u8uZ2exNur0oAtu+0wUX/CCa/ysJ6+TLtsRB1y
   ihdlUy/Rs9Qvn7R0E7thkm4T56ZaPRe2Azs2mWVlVetC7SLKHbbfVBclr
   sIGd6fv46JUFhXOUxFAAMfx6yhtHNUsuFCUTG0EQOs4qFPE7e6kwrAB+Z
   w==;
X-CSE-ConnectionGUID: 8BqHeaBuTIGoMlXpEKS/sg==
X-CSE-MsgGUID: 77V/+dbfTZCi9KsSxAQCAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="39285026"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="39285026"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:05:04 -0700
X-CSE-ConnectionGUID: HOhYa/7bQ7aHXV0Ti9T08Q==
X-CSE-MsgGUID: yb8z75mqSECKq3519uPOIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36722118"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by orviesa010.jf.intel.com with ESMTP; 03 Jun 2024 01:05:03 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: hao.yao@intel.com,
	Wentong Wu <wentong.wu@intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH 1/3] media: ivsc: csi: don't count privacy on as error
Date: Mon,  3 Jun 2024 16:26:12 +0800
Message-Id: <20240603082614.1567712-2-wentong.wu@intel.com>
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

Prior to the ongoing command privacy is on, it would return -1 to
indicate the current privacy status, and the ongoing command would
be well executed by firmware as well, so this is not error. This
patch changes its behavior to notify privacy on directly by V4L2
privacy control instead of reporting error.

Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
Reported-by: Hao Yao <hao.yao@intel.com>
Signed-off-by: Wentong Wu <wentong.wu@intel.com>
Tested-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/pci/intel/ivsc/mei_csi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 89b582a221ab..004ebab0b814 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -190,7 +190,11 @@ static int mei_csi_send(struct mei_csi *csi, u8 *buf, size_t len)
 
 	/* command response status */
 	ret = csi->cmd_response.status;
-	if (ret) {
+	if (ret == -1) {
+		/* notify privacy on instead of reporting error */
+		ret = 0;
+		v4l2_ctrl_s_ctrl(csi->privacy_ctrl, CSI_PRIVACY_ON);
+	} else if (ret) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.34.1


