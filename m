Return-Path: <linux-media+bounces-12730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAE890044A
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 15:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BEDA1C23210
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 13:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ABD1940AD;
	Fri,  7 Jun 2024 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhfSF8O+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A4194093
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 13:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717765446; cv=none; b=otv19ksEBYmSvTxNVdARFtqdmi5UGPBdZbnoq7eLaDAlbiZYq7TI54QrJGuObcqSmhNKQFwnsrwtIPgTIrMyPILSh6MEVp55B0RML98zZh7AzmfAAa8oTybhsMCO6c3A/1drhvI6G2e1FsAdoOQJlk2BTcBusKcyMKPUAdq8HjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717765446; c=relaxed/simple;
	bh=QDUG6/wAPAJT68+sgD4iatys55dg2O76vtEDxrInv04=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SAjGFDuiYC3IpeOsnF2HQSqMjXy2z2nd0+7QneV7DO9whZ38M8B9sylelSaCyGi9nF+wwGOaM5RT0pgnU8PpVoyZ36B7XKaLIaIw7lOrylvP3nj3NZuzQO2xRJsyGEaZskBf9mOwPbrUd0HLWoMikCIn6wC2mMj7uL+O/tTwlUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhfSF8O+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717765444; x=1749301444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QDUG6/wAPAJT68+sgD4iatys55dg2O76vtEDxrInv04=;
  b=VhfSF8O+QEyO7iG+86McSk7aLHs92RS7vTaj0kCAUUuYAZtY+Sv+oFZ6
   i2RjLE+0z8GvzzGjRvilc7NVBCfK76RM3E17v00+1GX83mu5NE0SC3Y/D
   8fXgctHWKRuM/EeIc/VE4uyusiGjD8nL+e1hA4C5GOs+ZR8XBUU6iaZoR
   2GjzWdIptfRxM6dTl0Liyue0x2BkmNtp+M85G3Cgmf9Cyin8Jk9IObUJ5
   F2bn6lTEHf+ILlKKqrLnTrBi05KgElvOLi76TpCVdDJCh8qc4lb0GY131
   XsVI4h76leW3NKhOV5fjii8t7UhtItJKF6tWO3jSVjO1gGKIL+GbCH3d4
   Q==;
X-CSE-ConnectionGUID: 8q5IWjVRTGuZmDbfArP6ag==
X-CSE-MsgGUID: L+4m61JLS1asEaOF0MhWlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18311925"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="18311925"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 06:04:04 -0700
X-CSE-ConnectionGUID: Npc5tfVyToqyFDorjuC1Gg==
X-CSE-MsgGUID: qQU1Ti/2Qkmn/j47IL+iEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="42734182"
Received: from wentongw-optiplex-8070.sh.intel.com ([10.239.154.12])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2024 06:04:02 -0700
From: Wentong Wu <wentong.wu@intel.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: hao.yao@intel.com,
	Wentong Wu <wentong.wu@intel.com>,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v2 1/3] media: ivsc: csi: don't count privacy on as error
Date: Fri,  7 Jun 2024 21:25:45 +0800
Message-Id: <20240607132547.2820515-2-wentong.wu@intel.com>
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
index 89b582a221ab..05c0acb78939 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -190,7 +190,11 @@ static int mei_csi_send(struct mei_csi *csi, u8 *buf, size_t len)
 
 	/* command response status */
 	ret = csi->cmd_response.status;
-	if (ret) {
+	if (ret == -1) {
+		/* notify privacy on instead of reporting error */
+		ret = 0;
+		v4l2_ctrl_s_ctrl(csi->privacy_ctrl, 1);
+	} else if (ret) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.34.1


