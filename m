Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF64111B886
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730455AbfLKQWg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:36 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:40419 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729267AbfLKQWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbd; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=98KjIBvYaK/7NZpqbGcyNM3qBSW1RKBZ8mdlwn3fAaA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=S41GIQVz0hfDZWin9t5BSawMffRHWMSGmb2uYc4wd+qx+2DjC8eLZq+poDQV484Lv
         gzijeLYlHqZOXdWbzlO5rvPCusE23/RAMcvWNxeOhmOO2l7G0QGwVCXu8rBsFUbSDy
         q2Ik5pbXsEdsjGkzApurCs2D5zE6ufRmNjzqdG8Zc9JhU49nk6+Wso3UGmNpFjnErV
         e3w4vDdRWvnlwQ9VTb76VflropXX+wW8o7RZwOugq5521i2jFXazPFErmjaezg4cF7
         /PVTQUTgnJlOJV2E0cggN7eOSXtjWjNVWqwXKFwRTLJF/4C20fjaU2//6quyPnXNjZ
         JRKlRHlbyfgKQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 05/10] pulse8-cec: set tx_done_status for transmit_done status
Date:   Wed, 11 Dec 2019 17:22:26 +0100
Message-Id: <20191211162231.99978-6-hverkuil-cisco@xs4all.nl>
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

Instead of translating work_result to a transmit_done status
in pulse8_irq_work_handler(), pass the CEC_TX_STATUS via a
new tx_done_status field.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 41 ++++++++++++-----------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 5ac257d01243..68bc2462c829 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -174,6 +174,7 @@ struct pulse8 {
 	u8 work_result;
 	struct delayed_work ping_eeprom_work;
 	struct cec_msg rx_msg;
+	u32 tx_done_status;
 	u8 data[DATA_SIZE];
 	unsigned int len;
 	u8 buf[DATA_SIZE];
@@ -266,30 +267,20 @@ static void pulse8_irq_work_handler(struct work_struct *work)
 	struct pulse8 *pulse8 =
 		container_of(work, struct pulse8, work);
 	u8 result = pulse8->work_result;
+	u32 status;
 
 	pulse8->work_result = 0;
 	switch (result & 0x3f) {
 	case MSGCODE_FRAME_DATA:
 		cec_received_msg(pulse8->adap, &pulse8->rx_msg);
 		break;
-	case MSGCODE_TRANSMIT_SUCCEEDED:
-		mutex_lock(&pulse8->lock);
-		cec_transmit_attempt_done(pulse8->adap, CEC_TX_STATUS_OK);
-		mutex_unlock(&pulse8->lock);
-		break;
-	case MSGCODE_TRANSMIT_FAILED_ACK:
-		mutex_lock(&pulse8->lock);
-		cec_transmit_attempt_done(pulse8->adap, CEC_TX_STATUS_NACK);
-		mutex_unlock(&pulse8->lock);
-		break;
-	case MSGCODE_TRANSMIT_FAILED_LINE:
-	case MSGCODE_TRANSMIT_FAILED_TIMEOUT_DATA:
-	case MSGCODE_TRANSMIT_FAILED_TIMEOUT_LINE:
-		mutex_lock(&pulse8->lock);
-		cec_transmit_attempt_done(pulse8->adap, CEC_TX_STATUS_ERROR);
-		mutex_unlock(&pulse8->lock);
-		break;
 	}
+	mutex_lock(&pulse8->lock);
+	status = pulse8->tx_done_status;
+	pulse8->tx_done_status = 0;
+	mutex_unlock(&pulse8->lock);
+	if (status)
+		cec_transmit_attempt_done(pulse8->adap, status);
 }
 
 static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
@@ -331,12 +322,20 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 			}
 			break;
 		case MSGCODE_TRANSMIT_SUCCEEDED:
-		case MSGCODE_TRANSMIT_FAILED_LINE:
+			WARN_ON(pulse8->tx_done_status);
+			pulse8->tx_done_status = CEC_TX_STATUS_OK;
+			schedule_work(&pulse8->work);
+			break;
 		case MSGCODE_TRANSMIT_FAILED_ACK:
+			WARN_ON(pulse8->tx_done_status);
+			pulse8->tx_done_status = CEC_TX_STATUS_NACK;
+			schedule_work(&pulse8->work);
+			break;
+		case MSGCODE_TRANSMIT_FAILED_LINE:
 		case MSGCODE_TRANSMIT_FAILED_TIMEOUT_DATA:
 		case MSGCODE_TRANSMIT_FAILED_TIMEOUT_LINE:
-			WARN_ON(pulse8->work_result);
-			pulse8->work_result = msgcode;
+			WARN_ON(pulse8->tx_done_status);
+			pulse8->tx_done_status = CEC_TX_STATUS_ERROR;
 			schedule_work(&pulse8->work);
 			break;
 		case MSGCODE_HIGH_ERROR:
@@ -383,6 +382,8 @@ static int pulse8_cec_adap_enable(struct cec_adapter *adap, bool enable)
 	cmd[1] = enable;
 	err = pulse8_send_and_wait(pulse8, cmd, 2,
 				   MSGCODE_COMMAND_ACCEPTED, 1);
+	if (!enable)
+		pulse8->tx_done_status = 0;
 	mutex_unlock(&pulse8->lock);
 	return enable ? err : 0;
 }
-- 
2.23.0

