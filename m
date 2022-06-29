Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D1055FDE5
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 12:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbiF2Kvw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 06:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbiF2Kvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 06:51:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF852AE29;
        Wed, 29 Jun 2022 03:51:49 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 248B3B90;
        Wed, 29 Jun 2022 12:51:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656499902;
        bh=9xtAjflwfRsZm3JtLlvi7xOgYHlks19nXesRmLhGUqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UvrQqfd4utrKt9Lh3k7deYtNnsaUexVWHdNWlvKbb08Ac68VbQ8tmyMCzjShv3abr
         KcYxdi9DwcoELY+SYhudkQ4yMn70jzW7Hh6+oMdw+26O7LHbEh1afwdKw342ZlmQni
         NIebWh8clAz1F29SgoIEql7hA0Fme1ckFv1f9te0=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 7/7] v4l: vsp1: debugfs: Add DLM directory
Date:   Wed, 29 Jun 2022 11:51:35 +0100
Message-Id: <20220629105135.2652773-8-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
References: <20220629105135.2652773-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Provide the ability to output a display list in use over debugfs.

In the event that the hardware has hung, it should be possible to
identify the current/most recent display list written to hardware by
viewing the DLM->active file:

 cat /debugfs/fe9a0000.vsp/DLM/active

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

--
2021-05-05:
 - Don't store dentry pointers which are not used

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/vsp1/vsp1_dl.c | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
index ad3fa1c9cc73..f75ecc5b485e 100644
--- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
+++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
@@ -17,6 +17,8 @@
 #include "vsp1.h"
 #include "vsp1_dl.h"
 
+#include "vsp1_debugfs.h"
+
 #define VSP1_DL_NUM_ENTRIES		256
 
 #define VSP1_DLH_INT_ENABLE		(1 << 1)
@@ -226,6 +228,8 @@ struct vsp1_dl_manager {
 
 	struct vsp1_dl_body_pool *pool;
 	struct vsp1_dl_cmd_pool *cmdpool;
+
+	struct dentry *dbgroot;
 };
 
 /* -----------------------------------------------------------------------------
@@ -1086,6 +1090,105 @@ struct vsp1_dl_body *vsp1_dlm_dl_body_get(struct vsp1_dl_manager *dlm)
 	return vsp1_dl_body_get(dlm->pool);
 }
 
+/* -----------------------------------------------------------------------------
+ * Debugfs internal views
+ */
+
+static void seq_print_list_body(struct seq_file *s, struct vsp1_dl_body *dlb)
+{
+	int i;
+
+	for (i = 0; i < dlb->num_entries; i++) {
+		struct vsp1_dl_entry *e = &dlb->entries[i];
+
+		seq_printf(s, "0x%08x -> %s\n", e->data,
+			   vsp1_reg_to_name(e->addr));
+	}
+}
+
+static void seq_printf_dl(struct seq_file *s, struct vsp1_dl_list *dl)
+{
+	struct vsp1_dl_body *dlb;
+	struct vsp1_dl_list *child;
+
+	if (!dl)
+		return;
+
+	seq_print_list_body(s, dl->body0);
+
+	list_for_each_entry(dlb, &dl->bodies, list)
+		seq_print_list_body(s, dlb);
+
+	if (dl->has_chain)
+		list_for_each_entry(child, &dl->chain, chain)
+			seq_print_list_body(s, child->body0);
+}
+
+static int vsp1_debugfs_dlm_active(struct seq_file *s, void *p)
+{
+	struct vsp1_dl_manager *dlm = s->private;
+
+	seq_printf_dl(s, dlm->active);
+
+	return 0;
+}
+
+DEBUGFS_RO_ATTR(vsp1_debugfs_dlm_active);
+
+static int vsp1_debugfs_dlm_pending(struct seq_file *s, void *p)
+{
+	struct vsp1_dl_manager *dlm = s->private;
+
+	seq_printf_dl(s, dlm->pending);
+
+	return 0;
+}
+
+DEBUGFS_RO_ATTR(vsp1_debugfs_dlm_pending);
+
+static int vsp1_debugfs_dlm_queued(struct seq_file *s, void *p)
+{
+	struct vsp1_dl_manager *dlm = s->private;
+
+	seq_printf_dl(s, dlm->queued);
+
+	return 0;
+}
+
+DEBUGFS_RO_ATTR(vsp1_debugfs_dlm_queued);
+
+/* Debugfs initialised after entities are created */
+static int vsp1_debugfs_init_dlm(struct vsp1_dl_manager *dlm)
+{
+	struct vsp1_device *vsp1 = dlm->vsp1;
+
+	dlm->dbgroot = debugfs_create_dir("DLM", vsp1->dbgroot);
+	if (!dlm->dbgroot)
+		return -ENOMEM;
+
+	/* dentry pointers discarded */
+	debugfs_create_file("active", 0444, dlm->dbgroot, dlm,
+			    &vsp1_debugfs_dlm_active_fops);
+
+	debugfs_create_file("pending", 0444, dlm->dbgroot, dlm,
+			    &vsp1_debugfs_dlm_pending_fops);
+
+	debugfs_create_file("queued", 0444, dlm->dbgroot, dlm,
+			    &vsp1_debugfs_dlm_queued_fops);
+
+	return 0;
+}
+
+static void vsp1_debugfs_destroy_dlm(struct vsp1_dl_manager *dlm)
+{
+	debugfs_remove(dlm->dbgroot);
+	dlm->dbgroot = NULL;
+}
+
+/* -----------------------------------------------------------------------------
+ * Object creation and destruction
+ */
+
 struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 					unsigned int index,
 					unsigned int prealloc)
@@ -1149,6 +1252,8 @@ struct vsp1_dl_manager *vsp1_dlm_create(struct vsp1_device *vsp1,
 		}
 	}
 
+	vsp1_debugfs_init_dlm(dlm);
+
 	return dlm;
 }
 
@@ -1159,6 +1264,8 @@ void vsp1_dlm_destroy(struct vsp1_dl_manager *dlm)
 	if (!dlm)
 		return;
 
+	vsp1_debugfs_destroy_dlm(dlm);
+
 	list_for_each_entry_safe(dl, next, &dlm->free, list) {
 		list_del(&dl->list);
 		vsp1_dl_list_free(dl);
-- 
2.34.1

