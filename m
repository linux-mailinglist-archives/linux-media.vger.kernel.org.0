Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 642D078DCE
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2019 16:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfG2O0X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jul 2019 10:26:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:40416 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726167AbfG2O0W (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jul 2019 10:26:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 699CEAE2F;
        Mon, 29 Jul 2019 14:26:21 +0000 (UTC)
Message-ID: <1564410374.25582.15.camel@suse.com>
Subject: KASAN reporting: general protection fault in flexcop_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
Cc:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org
Date:   Mon, 29 Jul 2019 16:26:14 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reacting to this:

Title:              general protection fault in flexcop_usb_probe
Last occurred:      0 days ago
Reported:           102 days ago
Branches:           Mainline (with usb-fuzzer patches)
Dashboard link:     https://syzkaller.appspot.com/bug?id=c0203bd72037d0
7493f4b7562411e4f5f4553a8f
Original thread:    https://lkml.kernel.org/lkml/00000000000010fe260586
536e86@google.com/T/#u

This bug has a C reproducer.

No one replied to the original thread for this bug.

This looks like a bug in a media USB driver.

If you fix this bug, please add the following tag to the commit:
    Reported-by: syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git usb-fuzzer-usb-testing-2019.07.11

From 5a34ecc6c75479a9f245a867e1ce37e6e28f58f8 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 29 Jul 2019 16:21:11 +0200
Subject: [PATCH] b2c2-flexcop-usb: add sanity checking

The driver needs an isochronous endpoint to be present. It will
oops in its absence. Add checking for it.

Reported-by: syzbot+d93dff37e6a89431c158@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 1826ff825c2e..1a801dc286f8 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -538,6 +538,9 @@ static int flexcop_usb_probe(struct usb_interface *intf,
 	struct flexcop_device *fc = NULL;
 	int ret;
 
+	if (intf->cur_altsetting->desc.bNumEndpoints < 1)
+		return -ENODEV;
+
 	if ((fc = flexcop_device_kmalloc(sizeof(struct flexcop_usb))) == NULL) {
 		err("out of memory\n");
 		return -ENOMEM;
-- 
2.16.4

