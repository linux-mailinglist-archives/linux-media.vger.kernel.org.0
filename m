Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4502CF8B9D
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2019 10:22:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfKLJWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40541 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725853AbfKLJWi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Nov 2019 04:22:38 -0500
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud9.xs4all.net with ESMTPA
        id USNYib7EmQBsYUSNbiAWst; Tue, 12 Nov 2019 10:22:32 +0100
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        syzbot+9d42b7773d2fecd983ab@syzkaller.appspotmail.com,
        Sean Young <sean@mess.org>
Subject: [PATCH 2/5] dvb-usb/af9005: initialize act_len
Date:   Tue, 12 Nov 2019 10:22:25 +0100
Message-Id: <20191112092228.15800-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
References: <20191112092228.15800-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfIGRwVFPhhlSaPazOvOLyI7sT9uJvlk1BM1fdowXPTpGHmLm01J6oG8c0hexAllNJsMx4kL8Jvh4Pvs1dnzVxz3zkTJay7X6bX79ASPhmXsRbujGA7aK
 xfmY8jpDuOWsqUzp/kfuZcAFtHCDVE2SVldcLbXfE/v7DP3SfbHkDZlrsa2RssYzMT9p0gS1lBReT/NI0Nwof/vLMpCDcCrFPhWIUReby8+JWMRqUDGrM6Kc
 CaJTYl7Sac4KOtqSC2rnkWh1V1N+JyvauRoWO3R1rdVXPCcSDB199/T1255vQhBlIkqwlJr64dqm/YNKkp3le6Rah94bIb9UWUx4lKPE/pc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The act_len variable was uninitialized, leading to a syzbot
error.

Syzbot link:

https://syzkaller.appspot.com/bug?extid=9d42b7773d2fecd983ab

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-and-tested-by: syzbot+9d42b7773d2fecd983ab@syzkaller.appspotmail.com
CC: Sean Young <sean@mess.org>
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
2.24.0

