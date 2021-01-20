Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9122FCE78
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387730AbhATKmj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:42:39 -0500
Received: from mx2.suse.de ([195.135.220.15]:56362 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732961AbhATKVn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 05:21:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9B356AF90;
        Wed, 20 Jan 2021 10:21:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Seyfried <seife+kernel@b1-systems.com>
Subject: [PATCH 1/2] media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
Date:   Wed, 20 Jan 2021 11:20:56 +0100
Message-Id: <20210120102057.21143-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210120102057.21143-1-tiwai@suse.de>
References: <20210120102057.21143-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dvb_usb_device_init() allocates a dvb_usb_device object, but it
doesn't release it even when returning an error.  The callers don't
seem caring it as well, hence those memories are leaked.

This patch assures releasing the memory at the error path in
dvb_usb_device_init().  Also it makes sure that USB intfdata is reset
and don't return the bogus pointer to the caller at the error path,
too.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index c1a7634e27b4..5befec87f26a 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -281,15 +281,21 @@ int dvb_usb_device_init(struct usb_interface *intf,
 
 	usb_set_intfdata(intf, d);
 
-	if (du != NULL)
+	ret = dvb_usb_init(d, adapter_nums);
+	if (ret) {
+		info("%s error while loading driver (%d)", desc->name, ret);
+		goto error;
+	}
+
+	if (du)
 		*du = d;
 
-	ret = dvb_usb_init(d, adapter_nums);
+	info("%s successfully initialized and connected.", desc->name);
+	return 0;
 
-	if (ret == 0)
-		info("%s successfully initialized and connected.", desc->name);
-	else
-		info("%s error while loading driver (%d)", desc->name, ret);
+ error:
+	usb_set_intfdata(intf, NULL);
+	kfree(d);
 	return ret;
 }
 EXPORT_SYMBOL(dvb_usb_device_init);
-- 
2.26.2

