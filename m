Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5B02D972D
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394908AbgLNLDu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Dec 2020 06:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728159AbgLNLDY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:03:24 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326C1C0613CF;
        Mon, 14 Dec 2020 03:02:44 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [131.188.30.90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 42989240B54;
        Mon, 14 Dec 2020 12:02:42 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 4055B3280146; Mon, 14 Dec 2020 12:02:42 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        ij72uhux@stud.informatik.uni-erlangen.de,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@i4.cs.fau.de, gregkh@linuxfoundation.org,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH v2 01/12] media: atomisp: Convert comments to C99 initializers
Date:   Mon, 14 Dec 2020 12:01:45 +0100
Message-Id: <20201214110156.6152-2-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
References: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The struct initalizers have been changed as recommended on
https://kernelnewbies.org/KernelJanitors/Todo
Also remove all the false, 0, and NULL members.

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 .../atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 22 +++++--------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index b4f53be18e7f..834b07e2cd9b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -30,34 +30,22 @@ static struct ia_css_rmgr_vbuf_handle handle_table[NUM_HANDLES];
 /*
  * @brief VBUF resource pool - refpool
  */
-static struct ia_css_rmgr_vbuf_pool refpool = {
-	false,			/* copy_on_write */
-	false,			/* recycle */
-	0,			/* size */
-	0,			/* index */
-	NULL,			/* handles */
-};
+static struct ia_css_rmgr_vbuf_pool refpool;
 
 /*
  * @brief VBUF resource pool - writepool
  */
 static struct ia_css_rmgr_vbuf_pool writepool = {
-	true,			/* copy_on_write */
-	false,			/* recycle */
-	0,			/* size */
-	0,			/* index */
-	NULL,			/* handles */
+	.copy_on_write	= true,
 };
 
 /*
  * @brief VBUF resource pool - hmmbufferpool
  */
 static struct ia_css_rmgr_vbuf_pool hmmbufferpool = {
-	true,			/* copy_on_write */
-	true,			/* recycle */
-	32,			/* size */
-	0,			/* index */
-	NULL,			/* handles */
+	.copy_on_write	= true,
+	.recycle	= true,
+	.size		= 32,
 };
 
 struct ia_css_rmgr_vbuf_pool *vbuf_ref = &refpool;
-- 
2.20.1

