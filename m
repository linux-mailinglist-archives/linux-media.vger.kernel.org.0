Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5573F899
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2019 14:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbfD3MQX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Apr 2019 08:16:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:52784 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726202AbfD3MQX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Apr 2019 08:16:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 3EC30AD85;
        Tue, 30 Apr 2019 12:16:22 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCHv3] dvb: usb: fix use after free in dvb_usb_device_exit
Date:   Tue, 30 Apr 2019 14:16:07 +0200
Message-Id: <20190430121607.4279-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dvb_usb_device_exit() frees and uses the device name in that order
Fix by storing the name in a buffer before freeing it

v2: fixed style issues
v3: strscpy used and variable names changed

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: syzbot+26ec41e9f788b3eba396@syzkaller.appspotmail.com
---
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 99951e02a880..48d17736db5d 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -287,12 +287,15 @@ EXPORT_SYMBOL(dvb_usb_device_init);
 void dvb_usb_device_exit(struct usb_interface *intf)
 {
 	struct dvb_usb_device *d = usb_get_intfdata(intf);
-	const char *name = "generic DVB-USB module";
+	const char *default_name = "generic DVB-USB module";
+	char name[40];
 
 	usb_set_intfdata(intf, NULL);
 	if (d != NULL && d->desc != NULL) {
-		name = d->desc->name;
+		strscpy(name, d->desc->name, sizeof(name));
 		dvb_usb_exit(d);
+	} else {
+		memcpy(name, default_name, sizeof(name));
 	}
 	info("%s successfully deinitialized and disconnected.", name);
 
-- 
2.16.4

