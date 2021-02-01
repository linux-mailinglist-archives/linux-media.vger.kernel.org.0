Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB14D30A357
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 09:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhBAIde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 03:33:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:57302 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231915AbhBAIdd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 03:33:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8587EAD19;
        Mon,  1 Feb 2021 08:32:50 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Seyfried <seife+kernel@b1-systems.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sean Young <sean@mess.org>
Subject: [PATCH v2 1/2] media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
Date:   Mon,  1 Feb 2021 09:32:46 +0100
Message-Id: <20210201083247.10760-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201083247.10760-1-tiwai@suse.de>
References: <20210201083247.10760-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dvb_usb_device_init() allocates a dvb_usb_device object, but it
doesn't release the object by itself even at errors.  The object is
released in the callee side (dvb_usb_init()) in some error cases via
dvb_usb_exit() call, but it also missed the object free in other error
paths.  And, the caller (it's only dvb_usb_device_init()) doesn't seem
caring the resource management as well, hence those memories are
leaked.

This patch assures releasing the memory at the error path in
dvb_usb_device_init().  Now dvb_usb_init() frees the resources it
allocated but leaves the passed dvb_usb_device object intact.  In
turn, the dvb_usb_device object is released in dvb_usb_device_init()
instead.
We could use dvb_usb_exit() function for releasing everything in the
callee (as it was used for some error cases in the original code), but
releasing the passed object in the callee is non-intuitive and
error-prone.  So I took this approach (which is more standard in Linus
kernel code) although it ended with a bit more open codes.

Along with the change, the patch makes sure that USB intfdata is reset
and don't return the bogus pointer to the caller of
dvb_usb_device_init() at the error path, too.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Fix double-free and reorganize the code

 drivers/media/usb/dvb-usb/dvb-usb-init.c | 47 ++++++++++++++++--------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index c1a7634e27b4..c78158d12540 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -158,22 +158,20 @@ static int dvb_usb_init(struct dvb_usb_device *d, short *adapter_nums)
 
 		if (d->props.priv_init != NULL) {
 			ret = d->props.priv_init(d);
-			if (ret != 0) {
-				kfree(d->priv);
-				d->priv = NULL;
-				return ret;
-			}
+			if (ret != 0)
+				goto err_priv_init;
 		}
 	}
 
 	/* check the capabilities and set appropriate variables */
 	dvb_usb_device_power_ctrl(d, 1);
 
-	if ((ret = dvb_usb_i2c_init(d)) ||
-		(ret = dvb_usb_adapter_init(d, adapter_nums))) {
-		dvb_usb_exit(d);
-		return ret;
-	}
+	ret = dvb_usb_i2c_init(d);
+	if (ret)
+		goto err_i2c_init;
+	ret = dvb_usb_adapter_init(d, adapter_nums);
+	if (ret)
+		goto err_adapter_init;
 
 	if ((ret = dvb_usb_remote_init(d)))
 		err("could not initialize remote control.");
@@ -181,6 +179,17 @@ static int dvb_usb_init(struct dvb_usb_device *d, short *adapter_nums)
 	dvb_usb_device_power_ctrl(d, 0);
 
 	return 0;
+
+err_adapter_init:
+	dvb_usb_adapter_exit(d);
+err_i2c_init:
+	dvb_usb_i2c_exit(d);
+	if (d->priv && d->props.priv_destroy)
+		d->props.priv_destroy(d);
+err_priv_init:
+	kfree(d->priv);
+	d->priv = NULL;
+	return ret;
 }
 
 /* determine the name and the state of the just found USB device */
@@ -281,15 +290,21 @@ int dvb_usb_device_init(struct usb_interface *intf,
 
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

