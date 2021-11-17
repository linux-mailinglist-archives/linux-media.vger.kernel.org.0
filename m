Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0F045439A
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235074AbhKQJ2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 04:28:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:58784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233910AbhKQJ2k (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 04:28:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E692A6323A;
        Wed, 17 Nov 2021 09:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637141141;
        bh=URoE0WugT5RM2/xxGxPWDy0twS6w8beAyGIvIdBpXTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Oyzy877d3q4eGZBjFaYTUZnKTE07OCSopH0nXPN2foArl8wSTuWrRSGNq523NkvrI
         aU4OIhzFHsmCsLm7AVcLR4AotIalTLsXleom89wshu0vb7cNhfk9b5uY379WXE66+K
         B1sfty0wNGCD3K/plXzZ0LqZXKmJJzQ3Cn3/e63XfSLFFLD41dHQvRBSC9QT+FXfXW
         wsSe7yesUL5x3ptImSJtMwWD5rIrPW8UGlHuN8QSAjh3sk2KNEL0rg5nz3lMaQXssa
         8X32kZKXKLr+n51Gbp7N0OAVzZpAMb+qHWICehhR7qgDsDbCcSBVhwC3OOaO2jl7Hs
         Mla67TsxLJ7Yg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnHCF-00Cb64-B3; Wed, 17 Nov 2021 09:25:39 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 10/13] media: atomisp: get rid of sctbl_legacy_*
Date:   Wed, 17 Nov 2021 09:25:35 +0000
Message-Id: <57e84df252e6f462e5bf91d2dbd42249aec42aad.1637140900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637140900.git.mchehab+huawei@kernel.org>
References: <cover.1637140900.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those seem to be used only on certain ISP2401 firmwares that
aren't supported by the driver. So, get rid of them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/13] at: https://lore.kernel.org/all/cover.1637140900.git.mchehab+huawei@kernel.org/

 .../atomisp/pci/runtime/binary/interface/ia_css_binary.h  | 2 --
 .../staging/media/atomisp/pci/runtime/binary/src/binary.c | 6 ------
 drivers/staging/media/atomisp/pci/sh_css_param_shading.c  | 8 ++++----
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
index 6f110d241836..9935ac860bc2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/interface/ia_css_binary.h
@@ -130,8 +130,6 @@ struct ia_css_binary {
 	int                      sctbl_width_per_color;
 	int                      sctbl_aligned_width_per_color;
 	int                      sctbl_height;
-	int                      sctbl_legacy_width_per_color;
-	int                      sctbl_legacy_height;
 	struct ia_css_sdis_info	 dis;
 	struct ia_css_resolution dvs_envelope;
 	bool                     online;
diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index bbb93cb8c070..9af23fdb127b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -1339,18 +1339,12 @@ ia_css_binary_fill_info(const struct ia_css_binary_xinfo *xinfo,
 			binary->sctbl_width_per_color = _ISP2401_SCTBL_WIDTH_PER_COLOR(isp_internal_width, s3a_log_deci);
 			binary->sctbl_aligned_width_per_color = SH_CSS_MAX_SCTBL_ALIGNED_WIDTH_PER_COLOR;
 			binary->sctbl_height = _ISP2401_SCTBL_HEIGHT(isp_internal_height, s3a_log_deci);
-			binary->sctbl_legacy_width_per_color  = _ISP_SCTBL_LEGACY_WIDTH_PER_COLOR(sc_3a_dis_padded_width, s3a_log_deci);
-			binary->sctbl_legacy_height = _ISP_SCTBL_LEGACY_HEIGHT(sc_3a_dis_height, s3a_log_deci);
 		}
 	} else
 	{
 		binary->sctbl_width_per_color         = 0;
 		binary->sctbl_aligned_width_per_color = 0;
 		binary->sctbl_height                  = 0;
-		if (IS_ISP2401) {
-			binary->sctbl_legacy_width_per_color  = 0;
-			binary->sctbl_legacy_height	      = 0;
-		}
 	}
 	ia_css_sdis_init_info(&binary->dis,
 			      sc_3a_dis_width,
diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
index 51d83ce0d9cb..02faf5069bb8 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_shading.c
@@ -242,8 +242,8 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 
 	if (!in_table) {
 		sh_css_params_shading_id_table_generate(target_table,
-							binary->sctbl_legacy_width_per_color,
-							binary->sctbl_legacy_height);
+							binary->sctbl_width_per_color,
+							binary->sctbl_height);
 		return;
 	}
 
@@ -284,8 +284,8 @@ prepare_shading_table(const struct ia_css_shading_table *in_table,
 
 	/* This prepare_shading_table() function is called only in legacy API (not in new API).
 	   Then, the legacy shading table width and height should be used. */
-	table_width  = binary->sctbl_legacy_width_per_color;
-	table_height = binary->sctbl_legacy_height;
+	table_width  = binary->sctbl_width_per_color;
+	table_height = binary->sctbl_height;
 
 	result = ia_css_shading_table_alloc(table_width, table_height);
 	if (!result) {
-- 
2.33.1

