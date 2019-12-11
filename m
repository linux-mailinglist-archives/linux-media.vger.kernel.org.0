Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F50711B885
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730457AbfLKQWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:36 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:37911 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730227AbfLKQWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbX; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=5l/1XzC59Nb8gDz9Bv5AGf31BocaRAafnzTYQVOqVx8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=URwXp9qjmAUpYdTaZ9eQ2RpYPtQ8HtolOLwfQHgiSHC+piOXB5KbOdzAG5mAYRJeq
         Os4yPX2/Y5w1ucKq9g3cjGYYNMyGAPKJDiJ/3toOgqVlpf0qEfMDl8sHZkIyC9i+5f
         jBQnAVPIXMM1frPXcN+IfMcdxx0YYA/nxx6fwhIEmWXUgnv4iUoyp6z8T//pKwlNIt
         gGWW0XxNxczguvDa9URK0pymbWCwdm6B76t35wUYw8lWYDNFO0Lpi1/FXW7P5v4utF
         VU4e7v+lpvRFGm+OCqazHhnw0W9cm9W1POctJFCLAJscIVfvA/rjQObXO8P9XgQrtu
         hkkoh6PxFiIcA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 03/10] pulse8-cec: locking improvements
Date:   Wed, 11 Dec 2019 17:22:24 +0100
Message-Id: <20191211162231.99978-4-hverkuil-cisco@xs4all.nl>
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

Drop the write_lock, rename config_lock to plain lock since this
now locks access to the adapter. Use 'lock' when transmitting
a message, ensuring that nothing interferes with the transmit.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 47 +++++++++++++----------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 1637141907d0..40880cb79f9a 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -180,8 +180,8 @@ struct pulse8 {
 	unsigned int idx;
 	bool escape;
 	bool started;
-	struct mutex config_lock;
-	struct mutex write_lock;
+	/* locks access to the adapter */
+	struct mutex lock;
 	bool config_pending;
 	bool restoring_config;
 	bool autonomous;
@@ -244,22 +244,17 @@ static int pulse8_send_and_wait(struct pulse8 *pulse8,
 	u8 cmd_sc[2];
 	int err;
 
-	mutex_lock(&pulse8->write_lock);
 	err = pulse8_send_and_wait_once(pulse8, cmd, cmd_len, response, size);
+	if (err != -ENOTTY)
+		return err;
 
-	if (err == -ENOTTY) {
-		cmd_sc[0] = MSGCODE_SET_CONTROLLED;
-		cmd_sc[1] = 1;
-		err = pulse8_send_and_wait_once(pulse8, cmd_sc, 2,
-						MSGCODE_COMMAND_ACCEPTED, 1);
-		if (err)
-			goto unlock;
+	cmd_sc[0] = MSGCODE_SET_CONTROLLED;
+	cmd_sc[1] = 1;
+	err = pulse8_send_and_wait_once(pulse8, cmd_sc, 2,
+					MSGCODE_COMMAND_ACCEPTED, 1);
+	if (!err)
 		err = pulse8_send_and_wait_once(pulse8, cmd, cmd_len,
 						response, size);
-	}
-
-unlock:
-	mutex_unlock(&pulse8->write_lock);
 	return err == -ENOTTY ? -EIO : err;
 }
 
@@ -275,15 +270,21 @@ static void pulse8_irq_work_handler(struct work_struct *work)
 		cec_received_msg(pulse8->adap, &pulse8->rx_msg);
 		break;
 	case MSGCODE_TRANSMIT_SUCCEEDED:
+		mutex_lock(&pulse8->lock);
 		cec_transmit_attempt_done(pulse8->adap, CEC_TX_STATUS_OK);
+		mutex_unlock(&pulse8->lock);
 		break;
 	case MSGCODE_TRANSMIT_FAILED_ACK:
+		mutex_lock(&pulse8->lock);
 		cec_transmit_attempt_done(pulse8->adap, CEC_TX_STATUS_NACK);
+		mutex_unlock(&pulse8->lock);
 		break;
 	case MSGCODE_TRANSMIT_FAILED_LINE:
 	case MSGCODE_TRANSMIT_FAILED_TIMEOUT_DATA:
 	case MSGCODE_TRANSMIT_FAILED_TIMEOUT_LINE:
+		mutex_lock(&pulse8->lock);
 		cec_transmit_attempt_done(pulse8->adap, CEC_TX_STATUS_ERROR);
+		mutex_unlock(&pulse8->lock);
 		break;
 	}
 }
@@ -373,10 +374,12 @@ static int pulse8_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	u8 cmd[16];
 	int err;
 
+	mutex_lock(&pulse8->lock);
 	cmd[0] = MSGCODE_SET_CONTROLLED;
 	cmd[1] = enable;
 	err = pulse8_send_and_wait(pulse8, cmd, 2,
 				   MSGCODE_COMMAND_ACCEPTED, 1);
+	mutex_unlock(&pulse8->lock);
 	return enable ? err : 0;
 }
 
@@ -388,7 +391,7 @@ static int pulse8_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	u8 cmd[16];
 	int err = 0;
 
-	mutex_lock(&pulse8->config_lock);
+	mutex_lock(&pulse8->lock);
 	if (log_addr != CEC_LOG_ADDR_INVALID)
 		mask = 1 << log_addr;
 	cmd[0] = MSGCODE_SET_ACK_MASK;
@@ -496,7 +499,7 @@ static int pulse8_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 		pulse8->restoring_config = false;
 	else
 		pulse8->config_pending = true;
-	mutex_unlock(&pulse8->config_lock);
+	mutex_unlock(&pulse8->lock);
 	return log_addr == CEC_LOG_ADDR_INVALID ? 0 : err;
 }
 
@@ -508,6 +511,7 @@ static int pulse8_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	unsigned int i;
 	int err;
 
+	mutex_lock(&pulse8->lock);
 	cmd[0] = MSGCODE_TRANSMIT_IDLETIME;
 	cmd[1] = signal_free_time;
 	err = pulse8_send_and_wait(pulse8, cmd, 2,
@@ -537,6 +541,7 @@ static int pulse8_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 		}
 	}
 
+	mutex_unlock(&pulse8->lock);
 	return err;
 }
 
@@ -699,14 +704,14 @@ static void pulse8_ping_eeprom_work_handler(struct work_struct *work)
 	u8 cmd;
 
 	schedule_delayed_work(&pulse8->ping_eeprom_work, PING_PERIOD);
+	mutex_lock(&pulse8->lock);
 	cmd = MSGCODE_PING;
 	pulse8_send_and_wait(pulse8, &cmd, 1,
 			     MSGCODE_COMMAND_ACCEPTED, 0);
 
 	if (pulse8->vers < 2)
-		return;
+		goto unlock;
 
-	mutex_lock(&pulse8->config_lock);
 	if (pulse8->config_pending && persistent_config) {
 		dev_dbg(pulse8->dev, "writing pending config to EEPROM\n");
 		cmd = MSGCODE_WRITE_EEPROM;
@@ -716,7 +721,8 @@ static void pulse8_ping_eeprom_work_handler(struct work_struct *work)
 		else
 			pulse8->config_pending = false;
 	}
-	mutex_unlock(&pulse8->config_lock);
+unlock:
+	mutex_unlock(&pulse8->lock);
 }
 
 static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
@@ -742,8 +748,7 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 	pulse8->dev = &serio->dev;
 	serio_set_drvdata(serio, pulse8);
 	INIT_WORK(&pulse8->work, pulse8_irq_work_handler);
-	mutex_init(&pulse8->write_lock);
-	mutex_init(&pulse8->config_lock);
+	mutex_init(&pulse8->lock);
 	pulse8->config_pending = false;
 
 	err = serio_open(serio, drv);
-- 
2.23.0

