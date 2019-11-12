Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29179F8B9A
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfKLJWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:60411 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725835AbfKLJWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id USNYib7EmQBsYUSNciAWtC; Tue, 12 Nov 2019 10:22:32 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com,
        Sean Young <sean@mess.org>
Subject: [PATCH 4/5] dvb-usb/digitv: initialize key[]
Date:   Tue, 12 Nov 2019 10:22:27 +0100
Message-Id: <20191112092228.15800-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
References: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIGRwVFPhhlSaPazOvOLyI7sT9uJvlk1BM1fdowXPTpGHmLm01J6oG8c0hexAllNJsMx4kL8Jvh4Pvs1dnzVxz3zkTJay7X6bX79ASPhmXsRbujGA7aK
 xfmY8jpDuOWsqUzp/kfuZcAFtHCDVE2SVldcLbXfE/v7DP3SfbHkDZlrsa2RssYzMT9p0gS1lBReT/NI0Nwof/vLMpCDcCrFPhWIUReby8+JWMRqUDGrM6Kc
 +HEbzYdQ2cTHg8XKVbonsYDb9B14DTd960/Dy7sjEtmx3KAkykF7K04jhjsg1HowsYkFnA4lV/r023k27Kl1lvLETVbohUZQkJWuSB8OV/g=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The key array was not initialized to 0, leading to a syzbot failure.

Syzbot link:

https://syzkaller.appspot.com/bug?extid=6bf9606ee955b646c0e1

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: syzbot+6bf9606ee955b646c0e1@syzkaller.appspotmail.com
CC: Sean Young <sean@mess.org>
---
 drivers/media/usb/dvb-usb/digitv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/digitv.c b/drivers/media/usb/dvb-usb/digitv.c
index dd5bb230cec1..72b22409880a 100644
--- a/drivers/media/usb/dvb-usb/digitv.c
+++ b/drivers/media/usb/dvb-usb/digitv.c
@@ -231,7 +231,7 @@ static struct rc_map_table rc_map_digitv_table[] = {
 static int digitv_rc_query(struct dvb_usb_device *d, u32 *event, int *state)
 {
 	int i;
-	u8 key[5];
+	u8 key[5] = { 0 };
 	u8 b[4] = { 0 };
 
 	*event = 0;
-- 
2.24.0

