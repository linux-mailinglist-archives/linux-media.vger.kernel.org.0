Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552391EC9E3
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgFCHBK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:43406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbgFCHBI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7AEA920674;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=nu65ymN+vtZkXfdeZuuH/Iw3syLNYVb4SutB1Q6Hdhg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PxsyoO2MctTa2uc3oL6Hutsa/8wXJiUEdKN44K9bDwKamIZCgz8XUJURimD/SY0t5
         i5neSCpdE/NyfjsWE9L5kvbgKSxiYmo/fiF0vZc4Ci884B54JXN/NukFSwnelI5Wjf
         Q8TCpMuPayHLkUMXgOJY08TNDm9GQ/r1HM7g6g4A=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8a-EU; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/15] media: atomisp: get rid of a detection hack for a BYT Andorid-based tablet
Date:   Wed,  3 Jun 2020 09:00:54 +0200
Message-Id: <485b5c3007f431f5cb8669040e72e4165ef62785.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a hack at the driver that selects a different table
for a BYT tablet, which sets the maximum frequency to 320 MHz,
instead of 400 MHz.

After looking at the Intel Aero Yocto's version from:

	https://download.01.org/aero/deb/pool/main/l/linux-4.4.76-aero-1.3/

It was noticed that this depends on an Android-specific modprobe parameter,
which uses a macro (INTEL_MID_BOARD) from this file:

	arch/x86/include/asm/spid.h

From the comments there, it looks like this macro parses a
variable passed at boot time:

	cmdline : androidboot.spid=vend:cust:manu:plat:prod:hard

The devices in question are identified there as:

	INTEL_BYT_TABLET_BLK_PRO = 0x0000
	INTEL_BYT_TABLET_BLK_ENG = 0x8000

Well, this is something that we don't have upstream. So,
without further details about that, we can't really parse it.

If we ever end supporting those devices with the upstream driver,
this patch can be reverted and the device can be detected
via DMI (or maybe via PCI ID?).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 83 ++++---------------
 1 file changed, 18 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 5ac63c77570a..c7f6b621ef3f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -354,60 +354,6 @@ static const struct atomisp_dfs_config dfs_config_byt = {
 	.dfs_table_size = ARRAY_SIZE(dfs_rules_byt),
 };
 
-static const struct atomisp_freq_scaling_rule dfs_rules_byt_cr[] = {
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_320MHZ,
-		.run_mode = ATOMISP_RUN_MODE_VIDEO,
-	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_320MHZ,
-		.run_mode = ATOMISP_RUN_MODE_STILL_CAPTURE,
-	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_320MHZ,
-		.run_mode = ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE,
-	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_320MHZ,
-		.run_mode = ATOMISP_RUN_MODE_PREVIEW,
-	},
-	{
-		.width = ISP_FREQ_RULE_ANY,
-		.height = ISP_FREQ_RULE_ANY,
-		.fps = ISP_FREQ_RULE_ANY,
-		.isp_freq = ISP_FREQ_320MHZ,
-		.run_mode = ATOMISP_RUN_MODE_SDV,
-	},
-};
-
-#ifdef FIXME
-/*
- * Disable this, as it is used only when this is true:
- *	INTEL_MID_BOARD(3, TABLET, BYT, BLK, PRO, CRV2) ||
- *	INTEL_MID_BOARD(3, TABLET, BYT, BLK, ENG, CRV2))
- * However, the original code is commented
- */
-static const struct atomisp_dfs_config dfs_config_byt_cr = {
-	.lowest_freq = ISP_FREQ_200MHZ,
-	.max_freq_at_vmin = ISP_FREQ_320MHZ,
-	.highest_freq = ISP_FREQ_320MHZ,
-	.dfs_table = dfs_rules_byt_cr,
-	.dfs_table_size = ARRAY_SIZE(dfs_rules_byt_cr),
-};
-#endif
-
 static const struct atomisp_freq_scaling_rule dfs_rules_cht[] = {
 	{
 		.width = ISP_FREQ_RULE_ANY,
@@ -1696,17 +1642,24 @@ static int atomisp_pci_probe(struct pci_dev *dev,
 		    (ATOMISP_HW_REVISION_ISP2400
 		     << ATOMISP_HW_REVISION_SHIFT) |
 		    ATOMISP_HW_STEPPING_B0;
-#ifdef FIXME
-		if (INTEL_MID_BOARD(3, TABLET, BYT, BLK, PRO, CRV2) ||
-		    INTEL_MID_BOARD(3, TABLET, BYT, BLK, ENG, CRV2)) {
-			isp->dfs = &dfs_config_byt_cr;
-			isp->hpll_freq = HPLL_FREQ_2000MHZ;
-		} else
-#endif
-		{
-			isp->dfs = &dfs_config_byt;
-			isp->hpll_freq = HPLL_FREQ_1600MHZ;
-		}
+
+		/*
+		 * Note: some Intel-based tablets with Android use a different
+		 * DFS table. Based on the comments at the Yocto Aero meta
+		 * version of this driver (at the ssid.h header), they're
+		 * identified via a "spid" var:
+		 *
+		 *	androidboot.spid=vend:cust:manu:plat:prod:hard
+		 *
+		 * As we don't have this upstream, nor we know enough details
+		 * to use a DMI or PCI match table, the old code was just
+		 * removed, but let's keep a note here as a reminder that,
+		 * for certain devices, we may need to limit the max DFS
+		 * frequency to be below certain values, adjusting the
+		 * resolution accordingly.
+		 */
+		isp->dfs = &dfs_config_byt;
+		isp->hpll_freq = HPLL_FREQ_1600MHZ;
 		/* HPLL frequency is known to be device-specific, but we don't
 		 * have specs yet for exactly how it varies.  Default to
 		 * BYT-CR but let provisioning set it via EFI variable */
-- 
2.26.2

