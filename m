Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C413DF466
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 12:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfD3KoT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 06:44:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:55322 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726294AbfD3KoT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 06:44:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4CFCAAD7C;
        Tue, 30 Apr 2019 10:44:18 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv2] dvb: usb: fix use after free in dvb_usb_device_exit
Date:   Tue, 30 Apr 2019 12:43:58 +0200
Message-Id: <20190430104358.8526-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dvb_usb_device_exit() frees and uses the device name in that order
Fix by storing the name in a buffer before freeing it

v2: fixed style issues

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: syzbot+26ec41e9f788b3eba396@syzkaller.appspotmail.com
---
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 99951e02a880..959bbdad8f00 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -288,13 +288,18 @@ void dvb_usb_device_exit(struct usb_interface *intf)
 {
 	struct dvb_usb_device *d = usb_get_intfdata(intf);
 	const char *name = "generic DVB-USB module";
+	char identifier[40];
 
 	usb_set_intfdata(intf, NULL);
 	if (d != NULL && d->desc != NULL) {
 		name = d->desc->name;
+		memcpy(identifier, name, 39);
+		identifier[39] = 0;
 		dvb_usb_exit(d);
+	} else {
+		memcpy(identifier, name, 39);
 	}
-	info("%s successfully deinitialized and disconnected.", name);
+	info("%s successfully deinitialized and disconnected.", identifier);
 
 }
 EXPORT_SYMBOL(dvb_usb_device_exit);
-- 
2.16.4

