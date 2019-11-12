Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB51F8B9C
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfKLJWj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:22:39 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:39107 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725944AbfKLJWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id USNYib7EmQBsYUSNciAWt2; Tue, 12 Nov 2019 10:22:32 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+ec869945d3dde5f33b43@syzkaller.appspotmail.com,
        Sean Young <sean@mess.org>
Subject: [PATCH 3/5] dvb-usb/vp7045: initialize br[]
Date:   Tue, 12 Nov 2019 10:22:26 +0100
Message-Id: <20191112092228.15800-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
References: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIGRwVFPhhlSaPazOvOLyI7sT9uJvlk1BM1fdowXPTpGHmLm01J6oG8c0hexAllNJsMx4kL8Jvh4Pvs1dnzVxz3zkTJay7X6bX79ASPhmXsRbujGA7aK
 xfmY8jpDuOWsqUzp/kfuZcAFtHCDVE2SVldcLbXfE/v7DP3SfbHkDZlrsa2RssYzMT9p0gS1lBReT/NI0Nwof/vLMpCDcCrFPhWIUReby8+JWMRqUDGrM6Kc
 4242foE+Q9osVKH7N/Xn5IVySgh9XXhGRKsOoZavOEpWXMGX/q+mYI/Ot7xXMFKFarFwr0QsIi5fisRSRl1yeLAmKPLlZRHQz9zcK3Uaap0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The br[] array was uninitialized, leading to a syzbot error.

Syzbot link:

https://syzkaller.appspot.com/bug?extid=ec869945d3dde5f33b43

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: syzbot+ec869945d3dde5f33b43@syzkaller.appspotmail.com
CC: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/vp7045.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/vp7045.c b/drivers/media/usb/dvb-usb/vp7045.c
index 80c1cf05384b..3e87adca5be9 100644
--- a/drivers/media/usb/dvb-usb/vp7045.c
+++ b/drivers/media/usb/dvb-usb/vp7045.c
@@ -116,7 +116,7 @@ static int vp7045_rc_query(struct dvb_usb_device *d)
 static int vp7045_read_eeprom(struct dvb_usb_device *d,u8 *buf, int len, int offset)
 {
 	int i = 0;
-	u8 v,br[2];
+	u8 v, br[2] = { 0 };
 	for (i=0; i < len; i++) {
 		v = offset + i;
 		vp7045_usb_op(d,GET_EE_VALUE,&v,1,br,2,5);
-- 
2.24.0

