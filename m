Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDE21C53A9
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbgEEKvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:51:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:50392 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728180AbgEEKvG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:51:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4E2EAAF8F;
        Tue,  5 May 2020 10:51:07 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     chehab@kernel.org, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] go7007: add sanity checking for endpoints
Date:   Tue,  5 May 2020 12:50:33 +0200
Message-Id: <20200505105033.15943-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A malicious USB device may lack endpoints the driver assumes to exist
Accessing them leads to NULL pointer accesses. This patch introduces
sanity checking.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Fixes: 866b8695d67e8 ("Staging: add the go7007 video driver")
Reported-and-tested-by: syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com
---
 drivers/media/usb/go7007/go7007-usb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index f889c9d740cd..dbf0455d5d50 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1132,6 +1132,10 @@ static int go7007_usb_probe(struct usb_interface *intf,
 		go->hpi_ops = &go7007_usb_onboard_hpi_ops;
 	go->hpi_context = usb;
 
+	ep = usb->usbdev->ep_in[4];
+	if (!ep)
+		return -ENODEV;
+
 	/* Allocate the URB and buffer for receiving incoming interrupts */
 	usb->intr_urb = usb_alloc_urb(0, GFP_KERNEL);
 	if (usb->intr_urb == NULL)
@@ -1141,7 +1145,6 @@ static int go7007_usb_probe(struct usb_interface *intf,
 	if (usb->intr_urb->transfer_buffer == NULL)
 		goto allocfail;
 
-	ep = usb->usbdev->ep_in[4];
 	if (usb_endpoint_type(&ep->desc) == USB_ENDPOINT_XFER_BULK)
 		usb_fill_bulk_urb(usb->intr_urb, usb->usbdev,
 			usb_rcvbulkpipe(usb->usbdev, 4),
@@ -1263,9 +1266,13 @@ static int go7007_usb_probe(struct usb_interface *intf,
 
 	/* Allocate the URBs and buffers for receiving the video stream */
 	if (board->flags & GO7007_USB_EZUSB) {
+		if (!usb->usbdev->ep_in[6])
+			goto allocfail;
 		v_urb_len = 1024;
 		video_pipe = usb_rcvbulkpipe(usb->usbdev, 6);
 	} else {
+		if (!usb->usbdev->ep_in[1])
+			goto allocfail;
 		v_urb_len = 512;
 		video_pipe = usb_rcvbulkpipe(usb->usbdev, 1);
 	}
@@ -1285,6 +1292,8 @@ static int go7007_usb_probe(struct usb_interface *intf,
 	/* Allocate the URBs and buffers for receiving the audio stream */
 	if ((board->flags & GO7007_USB_EZUSB) &&
 	    (board->main_info.flags & GO7007_BOARD_HAS_AUDIO)) {
+		if (!usb->usbdev->ep_in[8])
+			goto allocfail;
 		for (i = 0; i < 8; ++i) {
 			usb->audio_urbs[i] = usb_alloc_urb(0, GFP_KERNEL);
 			if (usb->audio_urbs[i] == NULL)
-- 
2.16.4

