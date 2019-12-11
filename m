Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5057511B889
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbfLKQWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:38 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45847 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728912AbfLKQWg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:36 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbn; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=YdIJ05Du2FYI6IClHTHhw7fA74fsBxdLX7F0YsnhA70=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=hlHGYUtArYNo8WmY6Iu2nD/EZDFwNRKg8Q/R6p0woAqbzZhPBeptF3QMWBwUvR3NW
         nLwGuTD7aBGeZ7BmY8py9lOBw9at3l1EgxZAEbxCmppPcym0H1jVdoQ9r3CPbxFvp+
         CkPbznbT4aHwy+uwET9ssNk6svEFJtjxLd8B6mj7qfvv6pwE5cQERTXtqQLk1Qv8xc
         Cxkq2XQejYNq+G18WeX54bZr6x0OVrmRQVzk6CGBsaIVBCdvpMd5O9lcjnVlX74UoK
         3oFIHDH3dzShTzAT+ddRNcsbztas8iHAP2qjfR48WCysp2JN85PciZ4zI+YFsEHnCb
         wUIYl64iL+3sQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 07/10] pulse8-cec: queue received messages in an array
Date:   Wed, 11 Dec 2019 17:22:28 +0100
Message-Id: <20191211162231.99978-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191211162231.99978-1-hverkuil-cisco@xs4all.nl>
References: <20191211162231.99978-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLIuqXjK/nGb1Cb9ikFROFqZEzmt2J7yWvtecDDS5F8o0dP/p5K1rS7xn74w8YDg+F2LT4hgg+nqsiYVn6jFki0p7KwOiFZnBesw3h0xLBDnPalo5IY5
 VE+BRsUOL/dTfjcMEXZaO0UO85SHdk3joVWdbVzGvBitF0wQ/jRdl3yVeoOAHWlm/vId6aznsElobMYLfIEpn3iaJQofMu7Ff0yBVsZU13kbY/HhVOPo+iWy
 g37kMwDBkMBOeTCpyTbJCXcq6WTZP2Nx9SBniQpCoEQXnYw0jbEhMLZgFEue0gc4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It turns out that received CEC messages can arrive faster than
can be processed by the CEC framework, resulting in lost messages.

Instead of storing only one CEC message, store up to 8.

Also fix a bug where the EOM bit wasn't checked for a received
message of length 1, so POLL messages weren't properly reported.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 80 +++++++++++++++++------
 1 file changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 34dbc567dbe0..961b34dfaf6d 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -164,6 +164,8 @@ static const char *pulse8_msgname(u8 cmd)
 
 #define PING_PERIOD	(15 * HZ)
 
+#define NUM_MSGS 8
+
 struct pulse8 {
 	struct device *dev;
 	struct serio *serio;
@@ -173,8 +175,12 @@ struct pulse8 {
 	struct delayed_work ping_eeprom_work;
 
 	struct work_struct irq_work;
-	u8 irq_work_result;
-	struct cec_msg rx_msg;
+	struct cec_msg rx_msg[NUM_MSGS];
+	unsigned int rx_msg_cur_idx, rx_msg_num;
+	/* protect rx_msg_cur_idx and rx_msg_num */
+	spinlock_t msg_lock;
+	u8 new_rx_msg[CEC_MAX_MSG_SIZE];
+	u8 new_rx_msg_len;
 
 	struct work_struct tx_work;
 	u32 tx_done_status;
@@ -321,15 +327,22 @@ static void pulse8_irq_work_handler(struct work_struct *work)
 {
 	struct pulse8 *pulse8 =
 		container_of(work, struct pulse8, irq_work);
-	u8 result = pulse8->irq_work_result;
+	unsigned long flags;
 	u32 status;
 
-	pulse8->irq_work_result = 0;
-	switch (result & 0x3f) {
-	case MSGCODE_FRAME_DATA:
-		cec_received_msg(pulse8->adap, &pulse8->rx_msg);
-		break;
+	spin_lock_irqsave(&pulse8->msg_lock, flags);
+	while (pulse8->rx_msg_num) {
+		spin_unlock_irqrestore(&pulse8->msg_lock, flags);
+		cec_received_msg(pulse8->adap,
+				 &pulse8->rx_msg[pulse8->rx_msg_cur_idx]);
+		spin_lock_irqsave(&pulse8->msg_lock, flags);
+		if (pulse8->rx_msg_num)
+			pulse8->rx_msg_num--;
+		pulse8->rx_msg_cur_idx =
+			(pulse8->rx_msg_cur_idx + 1) % NUM_MSGS;
 	}
+	spin_unlock_irqrestore(&pulse8->msg_lock, flags);
+
 	mutex_lock(&pulse8->lock);
 	status = pulse8->tx_done_status;
 	pulse8->tx_done_status = 0;
@@ -342,6 +355,8 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 				    unsigned int flags)
 {
 	struct pulse8 *pulse8 = serio_get_drvdata(serio);
+	unsigned long irq_flags;
+	unsigned int idx;
 
 	if (!pulse8->started && data != MSGSTART)
 		return IRQ_HANDLED;
@@ -353,7 +368,6 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 		data += MSGOFFSET;
 		pulse8->escape = false;
 	} else if (data == MSGEND) {
-		struct cec_msg *msg = &pulse8->rx_msg;
 		u8 msgcode = pulse8->buf[0];
 
 		if (debug > 1)
@@ -362,19 +376,43 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 				 pulse8->idx, pulse8->buf);
 		switch (msgcode & 0x3f) {
 		case MSGCODE_FRAME_START:
-			msg->len = 1;
-			msg->msg[0] = pulse8->buf[1];
-			break;
+			/*
+			 * Test if we are receiving a new msg when a previous
+			 * message is still pending.
+			 */
+			if (!(msgcode & MSGCODE_FRAME_EOM)) {
+				pulse8->new_rx_msg_len = 1;
+				pulse8->new_rx_msg[0] = pulse8->buf[1];
+				break;
+			}
+			/* fall through */
 		case MSGCODE_FRAME_DATA:
-			if (msg->len == CEC_MAX_MSG_SIZE)
+			if (pulse8->new_rx_msg_len < CEC_MAX_MSG_SIZE)
+				pulse8->new_rx_msg[pulse8->new_rx_msg_len++] =
+					pulse8->buf[1];
+			if (!(msgcode & MSGCODE_FRAME_EOM))
 				break;
-			msg->msg[msg->len++] = pulse8->buf[1];
-			if (msgcode & MSGCODE_FRAME_EOM) {
-				WARN_ON(pulse8->irq_work_result);
-				pulse8->irq_work_result = msgcode;
-				schedule_work(&pulse8->irq_work);
+
+			spin_lock_irqsave(&pulse8->msg_lock, irq_flags);
+			idx = (pulse8->rx_msg_cur_idx + pulse8->rx_msg_num) %
+				NUM_MSGS;
+			if (pulse8->rx_msg_num == NUM_MSGS) {
+				dev_warn(pulse8->dev,
+					 "message queue is full, dropping %*ph\n",
+					 pulse8->new_rx_msg_len,
+					 pulse8->new_rx_msg);
+				spin_unlock_irqrestore(&pulse8->msg_lock,
+						       irq_flags);
+				pulse8->new_rx_msg_len = 0;
 				break;
 			}
+			pulse8->rx_msg_num++;
+			memcpy(pulse8->rx_msg[idx].msg, pulse8->new_rx_msg,
+			       pulse8->new_rx_msg_len);
+			pulse8->rx_msg[idx].len = pulse8->new_rx_msg_len;
+			spin_unlock_irqrestore(&pulse8->msg_lock, irq_flags);
+			schedule_work(&pulse8->irq_work);
+			pulse8->new_rx_msg_len = 0;
 			break;
 		case MSGCODE_TRANSMIT_SUCCEEDED:
 			WARN_ON(pulse8->tx_done_status);
@@ -403,6 +441,7 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 		case MSGCODE_LOW_ERROR:
 		case MSGCODE_RECEIVE_FAILED:
 		case MSGCODE_TIMEOUT_ERROR:
+			pulse8->new_rx_msg_len = 0;
 			break;
 		case MSGCODE_COMMAND_ACCEPTED:
 		case MSGCODE_COMMAND_REJECTED:
@@ -443,8 +482,10 @@ static int pulse8_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	cmd[1] = enable;
 	err = pulse8_send_and_wait(pulse8, cmd, 2,
 				   MSGCODE_COMMAND_ACCEPTED, 1);
-	if (!enable)
+	if (!enable) {
+		pulse8->rx_msg_num = 0;
 		pulse8->tx_done_status = 0;
+	}
 	mutex_unlock(&pulse8->lock);
 	return enable ? err : 0;
 }
@@ -790,6 +831,7 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 	INIT_WORK(&pulse8->irq_work, pulse8_irq_work_handler);
 	INIT_WORK(&pulse8->tx_work, pulse8_tx_work_handler);
 	mutex_init(&pulse8->lock);
+	spin_lock_init(&pulse8->msg_lock);
 	pulse8->config_pending = false;
 
 	err = serio_open(serio, drv);
-- 
2.23.0

