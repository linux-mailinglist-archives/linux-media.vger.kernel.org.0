Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8322D1987
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 20:32:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgLGTbH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 14:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgLGTbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 14:31:07 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB11DC061749;
        Mon,  7 Dec 2020 11:30:26 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [IPv6:2001:638:a000:4130:131:188:30:90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 7783E240EB5;
        Mon,  7 Dec 2020 20:30:25 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 755B13280304; Mon,  7 Dec 2020 20:30:25 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org,
        ij72uhux@stud.informatik.uni-erlangen.de, linux-kernel@i4.cs.fau.de
Subject: [PATCH 05/12] media: atomisp: Fix overlong line
Date:   Mon,  7 Dec 2020 20:26:32 +0100
Message-Id: <20201207192638.15219-6-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
References: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Line length of 105 exceeds 100 columns.

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index e4483d41ec7a..e4ce8bbacd54 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -294,7 +294,8 @@ void ia_css_rmgr_acq_vbuf(struct ia_css_rmgr_vbuf_pool *pool,
 			}
 			if ((*handle)->vptr == 0x0) {
 				/* we need to allocate */
-				(*handle)->vptr = hmm_alloc((*handle)->size, HMM_BO_PRIVATE, 0, NULL, 0);
+				(*handle)->vptr = hmm_alloc((*handle)->size,
+							     HMM_BO_PRIVATE, 0, NULL, 0);
 			} else {
 				/* we popped a buffer */
 				return;
-- 
2.20.1

