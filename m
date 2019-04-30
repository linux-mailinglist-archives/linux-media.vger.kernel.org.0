Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8E8F8D9
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 14:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfD3M2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 08:28:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:54884 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726015AbfD3M2a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 08:28:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D75E1AE9A;
        Tue, 30 Apr 2019 12:28:28 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] uvc: fix access to uninitialized fields on probe error
Date:   Tue, 30 Apr 2019 14:28:14 +0200
Message-Id: <20190430122814.24986-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We need to check whether this work we are canceling actually is
initialized.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: syzbot+2e1ef9188251d9cc7944@syzkaller.appspotmail.com
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 14cff91b7aea..2b510c56cf91 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2350,7 +2350,9 @@ void uvc_ctrl_cleanup_device(struct uvc_device *dev)
 	struct uvc_entity *entity;
 	unsigned int i;
 
-	cancel_work_sync(&dev->async_ctrl.work);
+	/* can be uninitialized if we are aborting on probe error */
+	if (dev->async_ctrl.work.func)
+		cancel_work_sync(&dev->async_ctrl.work);
 
 	/* Free controls and control mappings for all entities. */
 	list_for_each_entry(entity, &dev->entities, list) {
-- 
2.16.4

