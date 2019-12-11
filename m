Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60FA211B88B
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730206AbfLKQWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:41 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:60729 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730240AbfLKQWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbj; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=Tep795VkceEl2SNsAhlw6leYFbFUl63GRSvt8vGRMX0=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=IvyznEo7YKPrrWTKqGoq/g5GmVHvx+hDLnz2NGpNwideWj7VrIZEtYRFlUI+02pcW
         wlVEFbcb4y4eH/D2NkmJRiQE5buAipm76XD1UOGRHTkEAbfGu8xxEtChBkbVo00QyF
         hxASJxskG3zxMWrlq56XSM+fQ+nAM1pFGHWTiFqbObd89g+kidSh1OVmPbcwg5e5J5
         713wCCI2DpxC/91WJc3x+DCR2XY+7aZpws/1cPcjP89mndrB2IwnL8qZ5Dc4067KKR
         VGnY8zAySm5NMB7KZ9F7inpuBEDnJefCw62el8xnM9sHbVfcEZY9Tv71aWM4PVOsTT
         2FWJjWbf0nQSg==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 06/10] pulse8-cec: move the transmit to a workqueue
Date:   Wed, 11 Dec 2019 17:22:27 +0100
Message-Id: <20191211162231.99978-7-hverkuil-cisco@xs4all.nl>
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

Instead of adap_transmit waiting until the full message
is transmitted (and thus hoarding the adap->lock mutex), have it
kick off a transmit workqueue. This prevents adap->lock from
being locked for a very long time.

Also skip FAILED_ACK reports for broadcast messages: this makes
no sense, and it seems a spurious message coming from the
Pulse-Eight, since some time later I see the SUCCEEDED message.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 132 +++++++++++++---------
 1 file changed, 81 insertions(+), 51 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 68bc2462c829..34dbc567dbe0 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -169,18 +169,27 @@ struct pulse8 {
 	struct serio *serio;
 	struct cec_adapter *adap;
 	unsigned int vers;
-	struct completion cmd_done;
-	struct work_struct work;
-	u8 work_result;
+
 	struct delayed_work ping_eeprom_work;
+
+	struct work_struct irq_work;
+	u8 irq_work_result;
 	struct cec_msg rx_msg;
+
+	struct work_struct tx_work;
 	u32 tx_done_status;
+	u32 tx_signal_free_time;
+	struct cec_msg tx_msg;
+	bool tx_msg_is_bcast;
+
+	struct completion cmd_done;
 	u8 data[DATA_SIZE];
 	unsigned int len;
 	u8 buf[DATA_SIZE];
 	unsigned int idx;
 	bool escape;
 	bool started;
+
 	/* locks access to the adapter */
 	struct mutex lock;
 	bool config_pending;
@@ -262,14 +271,60 @@ static int pulse8_send_and_wait(struct pulse8 *pulse8,
 	return err == -ENOTTY ? -EIO : err;
 }
 
+static void pulse8_tx_work_handler(struct work_struct *work)
+{
+	struct pulse8 *pulse8 = container_of(work, struct pulse8, tx_work);
+	struct cec_msg *msg = &pulse8->tx_msg;
+	unsigned int i;
+	u8 cmd[2];
+	int err;
+
+	if (msg->len == 0)
+		return;
+
+	mutex_lock(&pulse8->lock);
+	cmd[0] = MSGCODE_TRANSMIT_IDLETIME;
+	cmd[1] = pulse8->tx_signal_free_time;
+	err = pulse8_send_and_wait(pulse8, cmd, 2,
+				   MSGCODE_COMMAND_ACCEPTED, 1);
+	cmd[0] = MSGCODE_TRANSMIT_ACK_POLARITY;
+	cmd[1] = cec_msg_is_broadcast(msg);
+	pulse8->tx_msg_is_bcast = cec_msg_is_broadcast(msg);
+	if (!err)
+		err = pulse8_send_and_wait(pulse8, cmd, 2,
+					   MSGCODE_COMMAND_ACCEPTED, 1);
+	cmd[0] = msg->len == 1 ? MSGCODE_TRANSMIT_EOM : MSGCODE_TRANSMIT;
+	cmd[1] = msg->msg[0];
+	if (!err)
+		err = pulse8_send_and_wait(pulse8, cmd, 2,
+					   MSGCODE_COMMAND_ACCEPTED, 1);
+	if (!err && msg->len > 1) {
+		for (i = 1; !err && i < msg->len; i++) {
+			cmd[0] = ((i == msg->len - 1)) ?
+				MSGCODE_TRANSMIT_EOM : MSGCODE_TRANSMIT;
+			cmd[1] = msg->msg[i];
+			err = pulse8_send_and_wait(pulse8, cmd, 2,
+						   MSGCODE_COMMAND_ACCEPTED, 1);
+		}
+	}
+	if (err && debug)
+		dev_info(pulse8->dev, "%s(0x%02x) failed with error %d for msg %*ph\n",
+			 pulse8_msgname(cmd[0]), cmd[1],
+			 err, msg->len, msg->msg);
+	msg->len = 0;
+	mutex_unlock(&pulse8->lock);
+	if (err)
+		cec_transmit_attempt_done(pulse8->adap, CEC_TX_STATUS_ERROR);
+}
+
 static void pulse8_irq_work_handler(struct work_struct *work)
 {
 	struct pulse8 *pulse8 =
-		container_of(work, struct pulse8, work);
-	u8 result = pulse8->work_result;
+		container_of(work, struct pulse8, irq_work);
+	u8 result = pulse8->irq_work_result;
 	u32 status;
 
-	pulse8->work_result = 0;
+	pulse8->irq_work_result = 0;
 	switch (result & 0x3f) {
 	case MSGCODE_FRAME_DATA:
 		cec_received_msg(pulse8->adap, &pulse8->rx_msg);
@@ -315,28 +370,34 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 				break;
 			msg->msg[msg->len++] = pulse8->buf[1];
 			if (msgcode & MSGCODE_FRAME_EOM) {
-				WARN_ON(pulse8->work_result);
-				pulse8->work_result = msgcode;
-				schedule_work(&pulse8->work);
+				WARN_ON(pulse8->irq_work_result);
+				pulse8->irq_work_result = msgcode;
+				schedule_work(&pulse8->irq_work);
 				break;
 			}
 			break;
 		case MSGCODE_TRANSMIT_SUCCEEDED:
 			WARN_ON(pulse8->tx_done_status);
 			pulse8->tx_done_status = CEC_TX_STATUS_OK;
-			schedule_work(&pulse8->work);
+			schedule_work(&pulse8->irq_work);
 			break;
 		case MSGCODE_TRANSMIT_FAILED_ACK:
+			/*
+			 * A NACK for a broadcast message makes no sense, these
+			 * seem to be spurious messages and are skipped.
+			 */
+			if (pulse8->tx_msg_is_bcast)
+				break;
 			WARN_ON(pulse8->tx_done_status);
 			pulse8->tx_done_status = CEC_TX_STATUS_NACK;
-			schedule_work(&pulse8->work);
+			schedule_work(&pulse8->irq_work);
 			break;
 		case MSGCODE_TRANSMIT_FAILED_LINE:
 		case MSGCODE_TRANSMIT_FAILED_TIMEOUT_DATA:
 		case MSGCODE_TRANSMIT_FAILED_TIMEOUT_LINE:
 			WARN_ON(pulse8->tx_done_status);
 			pulse8->tx_done_status = CEC_TX_STATUS_ERROR;
-			schedule_work(&pulse8->work);
+			schedule_work(&pulse8->irq_work);
 			break;
 		case MSGCODE_HIGH_ERROR:
 		case MSGCODE_LOW_ERROR:
@@ -512,48 +573,14 @@ static int pulse8_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 				    u32 signal_free_time, struct cec_msg *msg)
 {
 	struct pulse8 *pulse8 = cec_get_drvdata(adap);
-	u8 cmd[2];
-	unsigned int i;
-	int err;
 
+	pulse8->tx_msg = *msg;
 	if (debug)
 		dev_info(pulse8->dev, "adap transmit %*ph\n",
 			 msg->len, msg->msg);
-	mutex_lock(&pulse8->lock);
-	cmd[0] = MSGCODE_TRANSMIT_IDLETIME;
-	cmd[1] = signal_free_time;
-	err = pulse8_send_and_wait(pulse8, cmd, 2,
-				   MSGCODE_COMMAND_ACCEPTED, 1);
-	cmd[0] = MSGCODE_TRANSMIT_ACK_POLARITY;
-	cmd[1] = cec_msg_is_broadcast(msg);
-	if (!err)
-		err = pulse8_send_and_wait(pulse8, cmd, 2,
-					   MSGCODE_COMMAND_ACCEPTED, 1);
-	cmd[0] = msg->len == 1 ? MSGCODE_TRANSMIT_EOM : MSGCODE_TRANSMIT;
-	cmd[1] = msg->msg[0];
-	if (!err)
-		err = pulse8_send_and_wait(pulse8, cmd, 2,
-					   MSGCODE_COMMAND_ACCEPTED, 1);
-	if (!err && msg->len > 1) {
-		cmd[0] = msg->len == 2 ? MSGCODE_TRANSMIT_EOM :
-					 MSGCODE_TRANSMIT;
-		cmd[1] = msg->msg[1];
-		err = pulse8_send_and_wait(pulse8, cmd, 2,
-					   MSGCODE_COMMAND_ACCEPTED, 1);
-		for (i = 0; !err && i + 2 < msg->len; i++) {
-			cmd[0] = (i + 2 == msg->len - 1) ?
-				MSGCODE_TRANSMIT_EOM : MSGCODE_TRANSMIT;
-			cmd[1] = msg->msg[i + 2];
-			err = pulse8_send_and_wait(pulse8, cmd, 2,
-						   MSGCODE_COMMAND_ACCEPTED, 1);
-		}
-	}
-	if (err && debug)
-		dev_info(pulse8->dev, "%s(0x%02x) failed with error %d for msg %*ph\n",
-			 pulse8_msgname(cmd[0]), cmd[1],
-			 err, msg->len, msg->msg);
-	mutex_unlock(&pulse8->lock);
-	return err;
+	pulse8->tx_signal_free_time = signal_free_time;
+	schedule_work(&pulse8->tx_work);
+	return 0;
 }
 
 static const struct cec_adap_ops pulse8_cec_adap_ops = {
@@ -568,6 +595,8 @@ static void pulse8_disconnect(struct serio *serio)
 
 	cec_unregister_adapter(pulse8->adap);
 	cancel_delayed_work_sync(&pulse8->ping_eeprom_work);
+	cancel_work_sync(&pulse8->irq_work);
+	cancel_work_sync(&pulse8->tx_work);
 	dev_info(&serio->dev, "disconnected\n");
 	serio_close(serio);
 	serio_set_drvdata(serio, NULL);
@@ -758,7 +787,8 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 
 	pulse8->dev = &serio->dev;
 	serio_set_drvdata(serio, pulse8);
-	INIT_WORK(&pulse8->work, pulse8_irq_work_handler);
+	INIT_WORK(&pulse8->irq_work, pulse8_irq_work_handler);
+	INIT_WORK(&pulse8->tx_work, pulse8_tx_work_handler);
 	mutex_init(&pulse8->lock);
 	pulse8->config_pending = false;
 
-- 
2.23.0

