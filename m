Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4040130A356
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 09:34:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhBAIde (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 03:33:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:57308 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232032AbhBAIdc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 03:33:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 98396ADD3;
        Mon,  1 Feb 2021 08:32:50 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Seyfried <seife+kernel@b1-systems.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sean Young <sean@mess.org>
Subject: [PATCH v2 2/2] media: dvb-usb: Fix use-after-free access
Date:   Mon,  1 Feb 2021 09:32:47 +0100
Message-Id: <20210201083247.10760-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201083247.10760-1-tiwai@suse.de>
References: <20210201083247.10760-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dvb_usb_device_init() copies the properties to the own data, so that
the callers can release the original properties later (as done in the
commit 299c7007e936 "media: dw2102: Fix memleak on sequence of
probes").  However, it also stores dev->desc pointer that is a
reference to the original properties data.  Since dev->desc is
referred later, it may result in use-after-free, in the worst case,
leading to a kernel Oops as reported.

This patch addresses the problem by allocating and copying the
properties at first, then get the desc from the copied properties.

Reported-and-tested-by: Stefan Seyfried <seife+kernel@b1-systems.com>
BugLink: http://bugzilla.opensuse.org/show_bug.cgi?id=1181104
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Only tag update

 drivers/media/usb/dvb-usb/dvb-usb-init.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index c78158d12540..12983baf6c3f 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -264,27 +264,30 @@ int dvb_usb_device_init(struct usb_interface *intf,
 	if (du != NULL)
 		*du = NULL;
 
-	if ((desc = dvb_usb_find_device(udev, props, &cold)) == NULL) {
+	d = kzalloc(sizeof(struct dvb_usb_device), GFP_KERNEL);
+	if (!d) {
+		err("no memory for 'struct dvb_usb_device'");
+		return -ENOMEM;
+	}
+
+	memcpy(&d->props, props, sizeof(struct dvb_usb_device_properties));
+
+	desc = dvb_usb_find_device(udev, &d->props, &cold);
+	if (!desc) {
 		deb_err("something went very wrong, device was not found in current device list - let's see what comes next.\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto error;
 	}
 
 	if (cold) {
 		info("found a '%s' in cold state, will try to load a firmware", desc->name);
 		ret = dvb_usb_download_firmware(udev, props);
 		if (!props->no_reconnect || ret != 0)
-			return ret;
+			goto error;
 	}
 
 	info("found a '%s' in warm state.", desc->name);
-	d = kzalloc(sizeof(struct dvb_usb_device), GFP_KERNEL);
-	if (d == NULL) {
-		err("no memory for 'struct dvb_usb_device'");
-		return -ENOMEM;
-	}
-
 	d->udev = udev;
-	memcpy(&d->props, props, sizeof(struct dvb_usb_device_properties));
 	d->desc = desc;
 	d->owner = owner;
 
-- 
2.26.2

