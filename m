Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0978E31F729
	for <lists+linux-media@lfdr.de>; Fri, 19 Feb 2021 11:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhBSKND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Feb 2021 05:13:03 -0500
Received: from mx2.suse.de ([195.135.220.15]:52382 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230162AbhBSKM6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Feb 2021 05:12:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3FA1DACBF;
        Fri, 19 Feb 2021 10:12:17 +0000 (UTC)
From:   Jiri Slaby <jslaby@suse.cz>
To:     mchehab+huawei@kernel.org
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH] media: atomisp: do not free kmalloc memory by vfree
Date:   Fri, 19 Feb 2021 11:12:16 +0100
Message-Id: <20210219101216.28406-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fw_minibuffer[i].buffer is allocated by kmalloc in sh_css_load_blob_info
and by vmalloc in setup_binary. So use kvfree to decide which of those
allocators to use for freeing.

Also remove the useless cast.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index db25e39bea88..f4ce8ace9d50 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -366,7 +366,7 @@ void sh_css_unload_firmware(void)
 			if (fw_minibuffer[i].name)
 				kfree((void *)fw_minibuffer[i].name);
 			if (fw_minibuffer[i].buffer)
-				vfree((void *)fw_minibuffer[i].buffer);
+				kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
 		fw_minibuffer = NULL;
-- 
2.30.1

