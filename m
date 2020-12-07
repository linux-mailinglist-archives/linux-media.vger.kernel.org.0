Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B602D1989
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 20:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgLGTbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 14:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgLGTbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Dec 2020 14:31:07 -0500
Received: from faui03.informatik.uni-erlangen.de (faui03.informatik.uni-erlangen.de [IPv6:2001:638:a000:4130:131:188:30:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E5AC061793;
        Mon,  7 Dec 2020 11:30:27 -0800 (PST)
Received: from cipterm0.informatik.uni-erlangen.de (cipterm0.cip.cs.fau.de [IPv6:2001:638:a000:4130:131:188:30:90])
        by faui03.informatik.uni-erlangen.de (Postfix) with ESMTP id 3EE84240EBB;
        Mon,  7 Dec 2020 20:30:26 +0100 (CET)
Received: by cipterm0.informatik.uni-erlangen.de (Postfix, from userid 67858)
        id 3CDCC3280304; Mon,  7 Dec 2020 20:30:26 +0100 (CET)
From:   Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
To:     linux-kernel@vger.kernel.org
Cc:     Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        mchehab@kernel.org, sakari.ailus@linux.intel.com,
        gregkh@linuxfoundation.org,
        ij72uhux@stud.informatik.uni-erlangen.de, linux-kernel@i4.cs.fau.de
Subject: [PATCH 06/12] media: atomisp: Add parentheses
Date:   Mon,  7 Dec 2020 20:26:33 +0100
Message-Id: <20201207192638.15219-7-Philipp.Gerlesberger@fau.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
References: <20201207192638.15219-1-Philipp.Gerlesberger@fau.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ERROR:COMPLEX_MACRO: Macros with complex values should be
enclosed in parentheses

Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
---
 .../media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
index 9cd3d92b34c9..2c02dd1cf27a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/interface/ia_css_rmgr.h
@@ -22,8 +22,8 @@
 #define STORAGE_CLASS_RMGR_H extern
 #define STORAGE_CLASS_RMGR_C
 #else				/* __INLINE_RMGR__ */
-#define STORAGE_CLASS_RMGR_H static inline
-#define STORAGE_CLASS_RMGR_C static inline
+#define STORAGE_CLASS_RMGR_H (static inline)
+#define STORAGE_CLASS_RMGR_C (static inline)
 #endif				/* __INLINE_RMGR__ */
 
 /**
-- 
2.20.1

