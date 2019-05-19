Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91BFC2289C
	for <lists+linux-media@lfdr.de>; Sun, 19 May 2019 21:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729987AbfESTtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 May 2019 15:49:01 -0400
Received: from gofer.mess.org ([88.97.38.141]:44355 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728287AbfESTtB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 May 2019 15:49:01 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 7519460E1A; Sun, 19 May 2019 20:48:58 +0100 (BST)
Date:   Sun, 19 May 2019 20:48:58 +0100
From:   Sean Young <sean@mess.org>
To:     syzbot <syzbot+357d86bcb4cca1a2f572@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: au0828: fix null dereference in error path
Message-ID: <20190519194858.2bojwep7monfytk2@gofer.mess.org>
References: <000000000000faf6000588ef7a11@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000faf6000588ef7a11@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

au0828_usb_disconnect() gets the au0828_dev struct via usb_get_intfdata,
so it needs to set up for the error paths.

Reported-by: syzbot+357d86bcb4cca1a2f572@syzkaller.appspotmail.com
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/au0828/au0828-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-core.c b/drivers/media/usb/au0828/au0828-core.c
index 925a80437822..e306d5d5bebb 100644
--- a/drivers/media/usb/au0828/au0828-core.c
+++ b/drivers/media/usb/au0828/au0828-core.c
@@ -729,6 +729,12 @@ static int au0828_usb_probe(struct usb_interface *interface,
 	/* Setup */
 	au0828_card_setup(dev);
 
+	/*
+	 * Store the pointer to the au0828_dev so it can be accessed in
+	 * au0828_usb_disconnect
+	 */
+	usb_set_intfdata(interface, dev);
+
 	/* Analog TV */
 	retval = au0828_analog_register(dev, interface);
 	if (retval) {
@@ -747,12 +753,6 @@ static int au0828_usb_probe(struct usb_interface *interface,
 	/* Remote controller */
 	au0828_rc_register(dev);
 
-	/*
-	 * Store the pointer to the au0828_dev so it can be accessed in
-	 * au0828_usb_disconnect
-	 */
-	usb_set_intfdata(interface, dev);
-
 	pr_info("Registered device AU0828 [%s]\n",
 		dev->board.name == NULL ? "Unset" : dev->board.name);
 
-- 
2.20.1

