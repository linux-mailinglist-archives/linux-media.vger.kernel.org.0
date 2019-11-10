Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72DDBF6887
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 11:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbfKJKeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 05:34:22 -0500
Received: from gofer.mess.org ([88.97.38.141]:40041 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbfKJKeW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 05:34:22 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 597DBC637C; Sun, 10 Nov 2019 10:34:20 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     syzbot+9d42b7773d2fecd983ab@syzkaller.appspotmail.com
Subject: [PATCH 2/3] media: af9005: uninitialized variable printked
Date:   Sun, 10 Nov 2019 10:34:19 +0000
Message-Id: <20191110103420.17349-2-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110103420.17349-1-sean@mess.org>
References: <20191110103420.17349-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If usb_bulk_msg() fails, actual_length can be uninitialized.

Reported-by: syzbot+9d42b7773d2fecd983ab@syzkaller.appspotmail.com
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/af9005.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/af9005.c b/drivers/media/usb/dvb-usb/af9005.c
index ac93e88d7038..89b4b5d84cdf 100644
--- a/drivers/media/usb/dvb-usb/af9005.c
+++ b/drivers/media/usb/dvb-usb/af9005.c
@@ -554,7 +554,7 @@ static int af9005_boot_packet(struct usb_device *udev, int type, u8 *reply,
 			      u8 *buf, int size)
 {
 	u16 checksum;
-	int act_len, i, ret;
+	int act_len = 0, i, ret;
 
 	memset(buf, 0, size);
 	buf[0] = (u8) (FW_BULKOUT_SIZE & 0xff);
-- 
2.23.0

