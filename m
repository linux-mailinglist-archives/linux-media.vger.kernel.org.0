Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE9D2EB140
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 18:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730520AbhAERVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 12:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728044AbhAERVI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 12:21:08 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C54C061574
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 09:19:22 -0800 (PST)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id B7DB3634C87;
        Tue,  5 Jan 2021 19:19:06 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH v2 1/1] ccs: Make (non-)use of uninitialised variables more robust
Date:   Tue,  5 Jan 2021 19:12:28 +0200
Message-Id: <20210105171228.5011-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

GCC with W=2 level of kernel compiler warnings warns about the use of
uninitialised variables in a few locations. While these uninitialised
variables were not used in reality, this still produced compiler warnings.

Address this by assigning the variables to NULL and checking for NULL in
places it is not expected, returning -EPROTO in that case. This provides
at least some sanity checking at runtime as the compiler appears unable to
do that at compile time.

Reported-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
since v1:

- Use -EIO instead as -EPROTO is already in use.

 drivers/media/i2c/ccs/ccs-data.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-data.c b/drivers/media/i2c/ccs/ccs-data.c
index 59338a6704af..8444be7247b2 100644
--- a/drivers/media/i2c/ccs/ccs-data.c
+++ b/drivers/media/i2c/ccs/ccs-data.c
@@ -214,7 +214,7 @@ static int ccs_data_parse_regs(struct bin_container *bin,
 			       size_t *__num_regs, const void *payload,
 			       const void *endp, struct device *dev)
 {
-	struct ccs_reg *regs_base, *regs;
+	struct ccs_reg *regs_base = NULL, *regs = NULL;
 	size_t num_regs = 0;
 	u16 addr = 0;
 
@@ -285,6 +285,9 @@ static int ccs_data_parse_regs(struct bin_container *bin,
 		if (!bin->base) {
 			bin_reserve(bin, len);
 		} else if (__regs) {
+			if (!regs)
+				return -EIO;
+
 			regs->addr = addr;
 			regs->len = len;
 			regs->value = bin_alloc(bin, len);
@@ -305,8 +308,12 @@ static int ccs_data_parse_regs(struct bin_container *bin,
 	if (__num_regs)
 		*__num_regs = num_regs;
 
-	if (bin->base && __regs)
+	if (bin->base && __regs) {
+		if (!regs_base)
+			return -EIO;
+
 		*__regs = regs_base;
+	}
 
 	return 0;
 }
@@ -425,7 +432,7 @@ static int ccs_data_parse_rules(struct bin_container *bin,
 				size_t *__num_rules, const void *payload,
 				const void *endp, struct device *dev)
 {
-	struct ccs_rule *rules_base, *rules = NULL, *next_rule;
+	struct ccs_rule *rules_base = NULL, *rules = NULL, *next_rule = NULL;
 	size_t num_rules = 0;
 	const void *__next_rule = payload;
 	int rval;
@@ -483,6 +490,9 @@ static int ccs_data_parse_rules(struct bin_container *bin,
 			} else {
 				unsigned int i;
 
+				if (!next_rule)
+					return -EIO;
+
 				rules = next_rule;
 				next_rule++;
 
@@ -555,6 +565,9 @@ static int ccs_data_parse_rules(struct bin_container *bin,
 		bin_reserve(bin, sizeof(*rules) * num_rules);
 		*__num_rules = num_rules;
 	} else {
+		if (!rules_base)
+			return -EIO;
+
 		*__rules = rules_base;
 	}
 
@@ -690,7 +703,7 @@ static int ccs_data_parse_pdaf(struct bin_container *bin, struct ccs_pdaf_pix_lo
 	}
 
 	for (i = 0; i < max_block_type_id; i++) {
-		struct ccs_pdaf_pix_loc_pixel_desc_group *pdgroup;
+		struct ccs_pdaf_pix_loc_pixel_desc_group *pdgroup = NULL;
 		unsigned int j;
 
 		if (!is_contained(__num_pixel_descs, endp))
@@ -721,6 +734,9 @@ static int ccs_data_parse_pdaf(struct bin_container *bin, struct ccs_pdaf_pix_lo
 			if (!bin->base)
 				continue;
 
+			if (!pdgroup)
+				return -EIO;
+
 			pdesc = &pdgroup->descs[j];
 			pdesc->pixel_type = __pixel_desc->pixel_type;
 			pdesc->small_offset_x = __pixel_desc->small_offset_x;
-- 
2.29.2

