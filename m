Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DE9F6886
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 11:34:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfKJKeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 05:34:22 -0500
Received: from gofer.mess.org ([88.97.38.141]:37637 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726653AbfKJKeW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 05:34:22 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 763EFC6380; Sun, 10 Nov 2019 10:34:20 +0000 (GMT)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     syzbot+ec869945d3dde5f33b43@syzkaller.appspotmail.com
Subject: [PATCH 3/3] media: vp7045: do not read uninitialized values if usb transfer fails
Date:   Sun, 10 Nov 2019 10:34:20 +0000
Message-Id: <20191110103420.17349-3-sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110103420.17349-1-sean@mess.org>
References: <20191110103420.17349-1-sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If reading the mac address or the remote control decoder state fails,
then this is not a fatal error.

Reported-by: syzbot+ec869945d3dde5f33b43@syzkaller.appspotmail.com
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/vp7045.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/vp7045.c b/drivers/media/usb/dvb-usb/vp7045.c
index 80c1cf05384b..2baf57216d19 100644
--- a/drivers/media/usb/dvb-usb/vp7045.c
+++ b/drivers/media/usb/dvb-usb/vp7045.c
@@ -96,10 +96,14 @@ static int vp7045_power_ctrl(struct dvb_usb_device *d, int onoff)
 
 static int vp7045_rc_query(struct dvb_usb_device *d)
 {
+	int ret;
 	u8 key;
-	vp7045_usb_op(d,RC_VAL_READ,NULL,0,&key,1,20);
 
-	deb_rc("remote query key: %x %d\n",key,key);
+	ret = vp7045_usb_op(d, RC_VAL_READ, NULL, 0, &key, 1, 20);
+	if (ret)
+		return ret;
+
+	deb_rc("remote query key: %x\n", key);
 
 	if (key != 0x44) {
 		/*
@@ -115,15 +119,18 @@ static int vp7045_rc_query(struct dvb_usb_device *d)
 
 static int vp7045_read_eeprom(struct dvb_usb_device *d,u8 *buf, int len, int offset)
 {
-	int i = 0;
-	u8 v,br[2];
+	int i, ret;
+	u8 v, br[2];
 	for (i=0; i < len; i++) {
 		v = offset + i;
-		vp7045_usb_op(d,GET_EE_VALUE,&v,1,br,2,5);
+		ret = vp7045_usb_op(d, GET_EE_VALUE, &v, 1, br, 2, 5);
+		if (ret)
+			return ret;
+
 		buf[i] = br[1];
 	}
-	deb_info("VP7045 EEPROM read (offs: %d, len: %d) : ",offset, i);
-	debug_dump(buf,i,deb_info);
+	deb_info("VP7045 EEPROM read (offs: %d, len: %d) : ", offset, i);
+	debug_dump(buf, i, deb_info);
 	return 0;
 }
 
-- 
2.23.0

