Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656771E96A2
	for <lists+linux-media@lfdr.de>; Sun, 31 May 2020 11:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbgEaJkv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 31 May 2020 05:40:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:38152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726020AbgEaJkq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 31 May 2020 05:40:46 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E4042076B;
        Sun, 31 May 2020 09:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590918045;
        bh=U75lywJFpwnpkKniRWfAJBcFImcYZiEx8hWiOyjPfHQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y+tXzfQwJNVdHvNvckj5l5b1fGQnixQgGZWvq5fQ6OiG+ya5LRV0RLDUOCcVhGpF5
         YCaEr2LqDvDDCGpSxg2kLaWHS/PZwj0eyMcTewcQOmO6ETfw7D9Y4r4Wm2kUAtHcy1
         WSEsTeE5dSjt5FGJQB8+KNh+Q5n1TRHl3yP0sUI0=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jfKSQ-003TMZ-D8; Sun, 31 May 2020 11:40:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH 2/2] media: atomisp comment an unused code
Date:   Sun, 31 May 2020 11:40:41 +0200
Message-Id: <2c7e69c6503ceef7a7d686d9eacf6dcff4b62d79.1590918032.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <1e056919536d65daf06091345a62523f827fde7a.1590918032.git.mchehab+huawei@kernel.org>
References: <1e056919536d65daf06091345a62523f827fde7a.1590918032.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a different table for some BYT variants that depend
on something inside a FIXME ifdef.

Place this also inside it, just to shut up a clang-11 warning.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 094a2886bd62..5ac63c77570a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -392,6 +392,13 @@ static const struct atomisp_freq_scaling_rule dfs_rules_byt_cr[] = {
 	},
 };
 
+#ifdef FIXME
+/*
+ * Disable this, as it is used only when this is true:
+ *	INTEL_MID_BOARD(3, TABLET, BYT, BLK, PRO, CRV2) ||
+ *	INTEL_MID_BOARD(3, TABLET, BYT, BLK, ENG, CRV2))
+ * However, the original code is commented
+ */
 static const struct atomisp_dfs_config dfs_config_byt_cr = {
 	.lowest_freq = ISP_FREQ_200MHZ,
 	.max_freq_at_vmin = ISP_FREQ_320MHZ,
@@ -399,6 +406,7 @@ static const struct atomisp_dfs_config dfs_config_byt_cr = {
 	.dfs_table = dfs_rules_byt_cr,
 	.dfs_table_size = ARRAY_SIZE(dfs_rules_byt_cr),
 };
+#endif
 
 static const struct atomisp_freq_scaling_rule dfs_rules_cht[] = {
 	{
-- 
2.26.2

