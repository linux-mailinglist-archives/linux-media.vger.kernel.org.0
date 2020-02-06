Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF79215485B
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 16:45:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727555AbgBFPpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 10:45:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:36532 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727060AbgBFPpa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Feb 2020 10:45:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3887DAAC3;
        Thu,  6 Feb 2020 15:45:29 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?q?Josef=20M=C3=B6llers?= <josef.moellers@suse.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: go7007: Fix URB type for interrupt handling
Date:   Thu,  6 Feb 2020 16:45:27 +0100
Message-Id: <20200206154527.18171-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Josef reported that his old-and-good Plextor ConvertX M402U video
converter spews lots of WARNINGs on the recent kernels, and it turned
out that the device uses a bulk endpoint for interrupt handling just
like 2250 board.

For fixing it, generalize the check with the proper verification of
the endpoint instead of hard-coded board type check.

Fixes: 7e5219d18e93 ("[media] go7007: Fix 2250 urb type")
Reported-and-tested-by: Josef Möllers <josef.moellers@suse.com>
BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1162583
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206427
Signed-off-by: Takashi Iwai <tiwai@suse.de>

---
 drivers/media/usb/go7007/go7007-usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index ff2aa057c1fb..f889c9d740cd 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1044,6 +1044,7 @@ static int go7007_usb_probe(struct usb_interface *intf,
 	struct go7007_usb *usb;
 	const struct go7007_usb_board *board;
 	struct usb_device *usbdev = interface_to_usbdev(intf);
+	struct usb_host_endpoint *ep;
 	unsigned num_i2c_devs;
 	char *name;
 	int video_pipe, i, v_urb_len;
@@ -1140,7 +1141,8 @@ static int go7007_usb_probe(struct usb_interface *intf,
 	if (usb->intr_urb->transfer_buffer == NULL)
 		goto allocfail;
 
-	if (go->board_id == GO7007_BOARDID_SENSORAY_2250)
+	ep = usb->usbdev->ep_in[4];
+	if (usb_endpoint_type(&ep->desc) == USB_ENDPOINT_XFER_BULK)
 		usb_fill_bulk_urb(usb->intr_urb, usb->usbdev,
 			usb_rcvbulkpipe(usb->usbdev, 4),
 			usb->intr_urb->transfer_buffer, 2*sizeof(u16),
-- 
2.16.4

