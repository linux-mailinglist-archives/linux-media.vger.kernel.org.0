Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30F112D198D
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 20:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgLGTbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 14:31:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgLGTbW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 14:31:22 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4DC7C0617B0;
        Mon,  7 Dec 2020 11:30:41 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [131.188.30.90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 52A9B240DFC;
        Mon,  7 Dec 2020 20:29:59 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 508553280304; Mon,  7 Dec 2020 20:29:59 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org,
        ij72uhux@stud.informatik.uni-erlangen.de, linux-kernel@i4.cs.fau.de
Subject: [PATCH 03/12] media: atomisp: Fix EMBEDDED_FUNCTION_NAME warning
Date:   Mon,  7 Dec 2020 20:26:30 +0100
Message-Id: <20201207192638.15219-4-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
References: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the automatically defined __func__ macro instead of the function name,
so it stays correct when the function is renamed.

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 .../media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c        | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 4ba5b8f88a7d..3fb3c8c48f0b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -119,8 +119,7 @@ void ia_css_rmgr_refcount_retain_vbuf(struct ia_css_rmgr_vbuf_handle **handle)
 void ia_css_rmgr_refcount_release_vbuf(struct ia_css_rmgr_vbuf_handle **handle)
 {
 	if ((!handle) || ((*handle) == NULL) || (((*handle)->count) == 0)) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
-				    "ia_css_rmgr_refcount_release_vbuf() invalid arguments!\n");
+		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR, "%s invalid arguments!\n", __func__);
 		return;
 	}
 	/* decrease reference count */
@@ -175,10 +174,9 @@ void ia_css_rmgr_uninit_vbuf(struct ia_css_rmgr_vbuf_pool *pool)
 {
 	u32 i;
 
-	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_rmgr_uninit_vbuf()\n");
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "%s\n", __func__);
 	if (!pool) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
-				    "ia_css_rmgr_uninit_vbuf(): NULL argument\n");
+		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR, "%s NULL argument\n", __func__);
 		return;
 	}
 	if (pool->handles) {
-- 
2.20.1

