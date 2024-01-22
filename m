Return-Path: <linux-media+bounces-3956-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C8D835994
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 04:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 676CE1F23396
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 03:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0E6139E;
	Mon, 22 Jan 2024 03:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8zpwc8q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5236AD7
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 03:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705892589; cv=none; b=GHmvGVf/Na2/QbFC1IfaiwdVAFqtBZGIkOoPLiAprBGZpuff9biq6cylMg9UTu5yck8bDyUKD5bFrgABtGM+4VCBmby9zOMsPrzCMFKIR8ZwqzaP7u2RUFF8gMWLjA8z1uYFEPu6llTxFL6Y7bLEMhtC04NqVxDLg0WKFZ2z39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705892589; c=relaxed/simple;
	bh=oTAONWnfUiOJDtXZYULuS8SRBwS/9DbjAucflNEujoQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JCKJ6NjFzWI7fz/A6o4YO6CaOM7oq9M1ubspcKO2cUjoE0890l05HpnOnHSVVA1A0NPdGnKd4FdvxLi7qlKKbYdrC/vCJNqNcpVphKnGLlki5jQrERzkHxMUciZt854dWmhBLI2t+T1QnXE+nEK7+4OLREXYE3G+eo3x0ue2ZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8zpwc8q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705892589; x=1737428589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oTAONWnfUiOJDtXZYULuS8SRBwS/9DbjAucflNEujoQ=;
  b=S8zpwc8q+k3RuYjB226e1PcTe6HGFx9dfq1w+sBBSrB42nKxn+tWyX5w
   Yj6AGT0TP0Drr317Rwe85sj9w0vRylsIpE3K8G4OHRilaj2SwQfRtJBWN
   PRwaJ7OuyuvbJ9vOFEk96xRBvDKo9nRKmckVVZGYW2uJGb4rm2GiYufH9
   lG2SPlAt34Ehz+aiW5g+MXnVsukYh3OcoADHBuhT5ZRmnprzqLdCrvSaJ
   Qt2/U/Hvh5feFwYzhLdsz9/Z9gUxYLTgsvjqH2F0qsDqJv2Xkb1ZeEuIs
   S25rp1pOTgbOiFdnm3e6wGNgjv1J1P87akwdQSTOK6mHsL9LPS5a1DtCi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7768105"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7768105"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 19:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="761609263"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="761609263"
Received: from jasonz-ms-7d25.itwn.intel.com ([10.227.107.10])
  by orsmga006.jf.intel.com with ESMTP; 21 Jan 2024 19:03:05 -0800
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy.yeh@intel.com,
	kieran.bingham@ideasonboard.com,
	qingwu.zhang@intel.com,
	bingbu.cao@linux.intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: [PATCH v2] media: ov08x40: Add Signal Integration Adjustments for specific project
Date: Mon, 22 Jan 2024 11:02:20 +0800
Message-Id: <20240122030220.3009357-1-jason.z.chen@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Chen <jason.z.chen@intel.com>

Due to certain MIPI hardware designs using overly long cables, there
is a loss of signal strength, resulting in failed signal integration.
The patch includes changes to adjust the driving strength in the register
settings for a specific project.

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index 520ccd4aecf..ddcb4b6848b 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -160,6 +160,18 @@ static const struct ov08x40_reg mipi_data_rate_800mbps[] = {
 	{0x6002, 0x2e},
 };
 
+static const struct ov08x40_reg mipi_si_changed_regs[] = {
+	{0x481b, 0x2c}, /* HS Exit: Data Tx TEOT - reducing 8ns */
+	{0x4826, 0x42}, /* HS Entry: Data Tx TREOT - raising 8ns */
+	{0x4829, 0x54}, /* HS Exit: Data Tx TREOT - reducing 8ns */
+	{0x4885, 0x1f}, /* driving strength change */
+};
+
+struct ov08x40_reg_list si_regs = {
+	.regs = mipi_si_changed_regs,
+	.num_of_regs = ARRAY_SIZE(mipi_si_changed_regs),
+};
+
 static const struct ov08x40_reg mode_3856x2416_regs[] = {
 	{0x5000, 0x5d},
 	{0x5001, 0x20},
@@ -2913,6 +2925,9 @@ static int ov08x40_start_streaming(struct ov08x40 *ov08x)
 		return ret;
 	}
 
+	/* Apply SI change to current project */
+	ov08x40_write_reg_list(ov08x, &si_regs);
+
 	/* Apply default values of current mode */
 	reg_list = &ov08x->cur_mode->reg_list;
 	ret = ov08x40_write_reg_list(ov08x, reg_list);
-- 
2.34.1


