Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6176D11B7FA
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730798AbfLKQLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:11:38 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:51583 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729941AbfLKQLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:11:37 -0500
Received: from [IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946]
 ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4aMiY3vRapzpf4aNiSLes; Wed, 11 Dec 2019 17:11:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576080695; bh=0cLYbm7/E1jA6Ms/bRxLpWmkEHbdPJoThGeSLhAvwQw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=e75lpRZhAhUMtKW1yQwiAPBP+utNYdC8FYXrKVFg0Qzd0q50kZjdjWmiUF31LfTdE
         LRtp6/NkOV71xyQXAJy9WKZ4msYX06h+3iIJbFHsAkIBZe8vTpPOuHmKfRJ50SEzgr
         NUnWe9hSqQRNzQZVso27LRTGe+QVaKyJQtirK5PHrAzEBAAfrWI0QLApyEL6N14TIm
         m6C0A7Z8pW+TeGThFOgmIvvej7B9TsjIKYmGgaPh6fWXerOqBaaocobVOiWgdnvU5z
         /TL5DJnCCKRCMqNNT9qYwuYQ+p1JAW/G2SlIFrRfLchMqYEvNthk8DC++nZprcEmGg
         kLkTjwPz0mpkg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH for v5.5] pulse8-cec: fix lost cec_transmit_attempt_done()
 call
Message-ID: <08cd3c10-d160-225f-0d42-f831f5c1b032@xs4all.nl>
Date:   Wed, 11 Dec 2019 17:11:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPpyzo7f5Keks/zDxNWr11JZwgCtohOr0rmsKKo+n80MP4YeJmKEnHr9NLW35EON6Qg7yOK8Z3evtZVShT+TLiLgGA5QU86lXrvSrILCsd+Ppn2TXUDm
 MUtGrbTaQJnbxLR210QsE98ouPizScibdGBOuM9DE5ZlIESGsJ4y2TYdtMqCMD0J5AGjVJXDpnKoMmVJX2RcW+9WW4+w7XJR9QcTCTPw+84LSAjKMR4Vt4ur
 Lm+tW3wg2ZZjEQ+ErRe3SRqWv9kkqePrPed9uHYCcc0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From be15796dc20ceb83e76de319b6382f6f7945c595 Mon Sep 17 00:00:00 2001
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Date: Sat, 7 Dec 2019 23:43:23 +0100
Subject: [PATCH 04/14] pulse8-cec: fix lost cec_transmit_attempt_done() call

The periodic PING command could interfere with the result of
a CEC transmit, causing a lost cec_transmit_attempt_done()
call. This messed up the CEC framework state, leaving it unresponsive.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: <stable@vger.kernel.org>      # for v4.10 and up
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index ac88ade94cda..59609556d969 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -116,6 +116,7 @@ struct pulse8 {
 	unsigned int vers;
 	struct completion cmd_done;
 	struct work_struct work;
+	u8 work_result;
 	struct delayed_work ping_eeprom_work;
 	struct cec_msg rx_msg;
 	u8 data[DATA_SIZE];
@@ -137,8 +138,10 @@ static void pulse8_irq_work_handler(struct work_struct *work)
 {
 	struct pulse8 *pulse8 =
 		container_of(work, struct pulse8, work);
+	u8 result = pulse8->work_result;

-	switch (pulse8->data[0] & 0x3f) {
+	pulse8->work_result = 0;
+	switch (result & 0x3f) {
 	case MSGCODE_FRAME_DATA:
 		cec_received_msg(pulse8->adap, &pulse8->rx_msg);
 		break;
@@ -172,12 +175,12 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 		pulse8->escape = false;
 	} else if (data == MSGEND) {
 		struct cec_msg *msg = &pulse8->rx_msg;
+		u8 msgcode = pulse8->buf[0];

 		if (debug)
 			dev_info(pulse8->dev, "received: %*ph\n",
 				 pulse8->idx, pulse8->buf);
-		pulse8->data[0] = pulse8->buf[0];
-		switch (pulse8->buf[0] & 0x3f) {
+		switch (msgcode & 0x3f) {
 		case MSGCODE_FRAME_START:
 			msg->len = 1;
 			msg->msg[0] = pulse8->buf[1];
@@ -186,14 +189,20 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 			if (msg->len == CEC_MAX_MSG_SIZE)
 				break;
 			msg->msg[msg->len++] = pulse8->buf[1];
-			if (pulse8->buf[0] & MSGCODE_FRAME_EOM)
+			if (msgcode & MSGCODE_FRAME_EOM) {
+				WARN_ON(pulse8->work_result);
+				pulse8->work_result = msgcode;
 				schedule_work(&pulse8->work);
+				break;
+			}
 			break;
 		case MSGCODE_TRANSMIT_SUCCEEDED:
 		case MSGCODE_TRANSMIT_FAILED_LINE:
 		case MSGCODE_TRANSMIT_FAILED_ACK:
 		case MSGCODE_TRANSMIT_FAILED_TIMEOUT_DATA:
 		case MSGCODE_TRANSMIT_FAILED_TIMEOUT_LINE:
+			WARN_ON(pulse8->work_result);
+			pulse8->work_result = msgcode;
 			schedule_work(&pulse8->work);
 			break;
 		case MSGCODE_HIGH_ERROR:
-- 
2.23.0

