Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD8911B88A
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbfLKQWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:38 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:60949 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730070AbfLKQWg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:36 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbV; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=SvWYtUz5VA/EQa7C3fttyFJjuFlGwDYDmkd+is/niV8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=a91WJCeXUtE7cL0wSMCQwkS+j2PD9K+17G4Cs2bNg7WXFqxdQcMpzyxnQjqn77PcH
         hQgrNZEzwnaRR8XEFRCOrO97kwC3523FpNlA+rCOVGvYI+T+hB6rA4rQi+c2jqjq5Y
         16AXXmTY/gIV5O/d8DvJCC067k655doE9Ipoa+6cT6peSnRCBk4ysWOh/nQ99GE2sB
         rnu5PwXtd7BDS0tGTM3KcH7CRgv8aZMOsJlLEVrdaXQyTjfASRj7D9dB3m2AvV36lp
         fRYipLQ+IlFs8Z2kxXyMKuRjdXruO8LYVRqug5cmSEQus0vuncuz+6aZQ1MdsoleJ3
         dZgKVZ6WyjJQQ==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 02/10] pulse8-cec: reorganize function order
Date:   Wed, 11 Dec 2019 17:22:23 +0100
Message-Id: <20191211162231.99978-3-hverkuil-cisco@xs4all.nl>
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

Reorganize the order of the functions in the source, going from
low-level to high-level.

No functional changes were made.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 504 +++++++++++-----------
 1 file changed, 248 insertions(+), 256 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index ea9d42d19bfd..1637141907d0 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -187,7 +187,81 @@ struct pulse8 {
 	bool autonomous;
 };
 
-static void pulse8_ping_eeprom_work_handler(struct work_struct *work);
+static int pulse8_send(struct serio *serio, const u8 *command, u8 cmd_len)
+{
+	int err = 0;
+
+	err = serio_write(serio, MSGSTART);
+	if (err)
+		return err;
+	for (; !err && cmd_len; command++, cmd_len--) {
+		if (*command >= MSGESC) {
+			err = serio_write(serio, MSGESC);
+			if (!err)
+				err = serio_write(serio, *command - MSGOFFSET);
+		} else {
+			err = serio_write(serio, *command);
+		}
+	}
+	if (!err)
+		err = serio_write(serio, MSGEND);
+
+	return err;
+}
+
+static int pulse8_send_and_wait_once(struct pulse8 *pulse8,
+				     const u8 *cmd, u8 cmd_len,
+				     u8 response, u8 size)
+{
+	int err;
+
+	/* dev_info(pulse8->dev, "transmit %s: %*ph\n", pulse8_msgname(cmd[0]), cmd_len, cmd); */
+	init_completion(&pulse8->cmd_done);
+
+	err = pulse8_send(pulse8->serio, cmd, cmd_len);
+	if (err)
+		return err;
+
+	if (!wait_for_completion_timeout(&pulse8->cmd_done, HZ))
+		return -ETIMEDOUT;
+	if ((pulse8->data[0] & 0x3f) == MSGCODE_COMMAND_REJECTED &&
+	    cmd[0] != MSGCODE_SET_CONTROLLED &&
+	    cmd[0] != MSGCODE_SET_AUTO_ENABLED &&
+	    cmd[0] != MSGCODE_GET_BUILDDATE)
+		return -ENOTTY;
+	if (response &&
+	    ((pulse8->data[0] & 0x3f) != response || pulse8->len < size + 1)) {
+		dev_info(pulse8->dev, "transmit %s: failed %s\n",
+			 pulse8_msgname(cmd[0]), pulse8_msgname(pulse8->data[0]));
+		return -EIO;
+	}
+	return 0;
+}
+
+static int pulse8_send_and_wait(struct pulse8 *pulse8,
+				const u8 *cmd, u8 cmd_len, u8 response, u8 size)
+{
+	u8 cmd_sc[2];
+	int err;
+
+	mutex_lock(&pulse8->write_lock);
+	err = pulse8_send_and_wait_once(pulse8, cmd, cmd_len, response, size);
+
+	if (err == -ENOTTY) {
+		cmd_sc[0] = MSGCODE_SET_CONTROLLED;
+		cmd_sc[1] = 1;
+		err = pulse8_send_and_wait_once(pulse8, cmd_sc, 2,
+						MSGCODE_COMMAND_ACCEPTED, 1);
+		if (err)
+			goto unlock;
+		err = pulse8_send_and_wait_once(pulse8, cmd, cmd_len,
+						response, size);
+	}
+
+unlock:
+	mutex_unlock(&pulse8->write_lock);
+	return err == -ENOTTY ? -EIO : err;
+}
 
 static void pulse8_irq_work_handler(struct work_struct *work)
 {
@@ -293,228 +367,6 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 	return IRQ_HANDLED;
 }
 
-static void pulse8_disconnect(struct serio *serio)
-{
-	struct pulse8 *pulse8 = serio_get_drvdata(serio);
-
-	cec_unregister_adapter(pulse8->adap);
-	cancel_delayed_work_sync(&pulse8->ping_eeprom_work);
-	dev_info(&serio->dev, "disconnected\n");
-	serio_close(serio);
-	serio_set_drvdata(serio, NULL);
-	kfree(pulse8);
-}
-
-static int pulse8_send(struct serio *serio, const u8 *command, u8 cmd_len)
-{
-	int err = 0;
-
-	err = serio_write(serio, MSGSTART);
-	if (err)
-		return err;
-	for (; !err && cmd_len; command++, cmd_len--) {
-		if (*command >= MSGESC) {
-			err = serio_write(serio, MSGESC);
-			if (!err)
-				err = serio_write(serio, *command - MSGOFFSET);
-		} else {
-			err = serio_write(serio, *command);
-		}
-	}
-	if (!err)
-		err = serio_write(serio, MSGEND);
-
-	return err;
-}
-
-static int pulse8_send_and_wait_once(struct pulse8 *pulse8,
-				     const u8 *cmd, u8 cmd_len,
-				     u8 response, u8 size)
-{
-	int err;
-
-	/* dev_info(pulse8->dev, "transmit %s: %*ph\n", pulse8_msgname(cmd[0]), cmd_len, cmd); */
-	init_completion(&pulse8->cmd_done);
-
-	err = pulse8_send(pulse8->serio, cmd, cmd_len);
-	if (err)
-		return err;
-
-	if (!wait_for_completion_timeout(&pulse8->cmd_done, HZ))
-		return -ETIMEDOUT;
-	if ((pulse8->data[0] & 0x3f) == MSGCODE_COMMAND_REJECTED &&
-	    cmd[0] != MSGCODE_SET_CONTROLLED &&
-	    cmd[0] != MSGCODE_SET_AUTO_ENABLED &&
-	    cmd[0] != MSGCODE_GET_BUILDDATE)
-		return -ENOTTY;
-	if (response &&
-	    ((pulse8->data[0] & 0x3f) != response || pulse8->len < size + 1)) {
-		dev_info(pulse8->dev, "transmit %s: failed %s\n",
-			 pulse8_msgname(cmd[0]), pulse8_msgname(pulse8->data[0]));
-		return -EIO;
-	}
-	return 0;
-}
-
-static int pulse8_send_and_wait(struct pulse8 *pulse8,
-				const u8 *cmd, u8 cmd_len, u8 response, u8 size)
-{
-	u8 cmd_sc[2];
-	int err;
-
-	mutex_lock(&pulse8->write_lock);
-	err = pulse8_send_and_wait_once(pulse8, cmd, cmd_len, response, size);
-
-	if (err == -ENOTTY) {
-		cmd_sc[0] = MSGCODE_SET_CONTROLLED;
-		cmd_sc[1] = 1;
-		err = pulse8_send_and_wait_once(pulse8, cmd_sc, 2,
-						MSGCODE_COMMAND_ACCEPTED, 1);
-		if (err)
-			goto unlock;
-		err = pulse8_send_and_wait_once(pulse8, cmd, cmd_len,
-						response, size);
-	}
-
-unlock:
-	mutex_unlock(&pulse8->write_lock);
-	return err == -ENOTTY ? -EIO : err;
-}
-
-static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
-			struct cec_log_addrs *log_addrs, u16 *pa)
-{
-	u8 *data = pulse8->data + 1;
-	u8 cmd[2];
-	int err;
-	struct tm tm;
-	time64_t date;
-
-	pulse8->vers = 0;
-
-	cmd[0] = MSGCODE_FIRMWARE_VERSION;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 2);
-	if (err)
-		return err;
-	pulse8->vers = (data[0] << 8) | data[1];
-	dev_info(pulse8->dev, "Firmware version %04x\n", pulse8->vers);
-	if (pulse8->vers < 2) {
-		*pa = CEC_PHYS_ADDR_INVALID;
-		return 0;
-	}
-
-	cmd[0] = MSGCODE_GET_BUILDDATE;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 4);
-	if (err)
-		return err;
-	date = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
-	time64_to_tm(date, 0, &tm);
-	dev_info(pulse8->dev, "Firmware build date %04ld.%02d.%02d %02d:%02d:%02d\n",
-		 tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
-		 tm.tm_hour, tm.tm_min, tm.tm_sec);
-
-	dev_dbg(pulse8->dev, "Persistent config:\n");
-	cmd[0] = MSGCODE_GET_AUTO_ENABLED;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
-	if (err)
-		return err;
-	pulse8->autonomous = data[0];
-	dev_dbg(pulse8->dev, "Autonomous mode: %s",
-		data[0] ? "on" : "off");
-
-	cmd[0] = MSGCODE_GET_DEVICE_TYPE;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
-	if (err)
-		return err;
-	log_addrs->primary_device_type[0] = data[0];
-	dev_dbg(pulse8->dev, "Primary device type: %d\n", data[0]);
-	switch (log_addrs->primary_device_type[0]) {
-	case CEC_OP_PRIM_DEVTYPE_TV:
-		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_TV;
-		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
-		break;
-	case CEC_OP_PRIM_DEVTYPE_RECORD:
-		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_RECORD;
-		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_RECORD;
-		break;
-	case CEC_OP_PRIM_DEVTYPE_TUNER:
-		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_TUNER;
-		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_TUNER;
-		break;
-	case CEC_OP_PRIM_DEVTYPE_PLAYBACK:
-		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
-		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_PLAYBACK;
-		break;
-	case CEC_OP_PRIM_DEVTYPE_AUDIOSYSTEM:
-		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
-		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_AUDIOSYSTEM;
-		break;
-	case CEC_OP_PRIM_DEVTYPE_SWITCH:
-		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_UNREGISTERED;
-		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
-		break;
-	case CEC_OP_PRIM_DEVTYPE_PROCESSOR:
-		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_SPECIFIC;
-		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
-		break;
-	default:
-		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_UNREGISTERED;
-		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
-		dev_info(pulse8->dev, "Unknown Primary Device Type: %d\n",
-			 log_addrs->primary_device_type[0]);
-		break;
-	}
-
-	cmd[0] = MSGCODE_GET_LOGICAL_ADDRESS_MASK;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 2);
-	if (err)
-		return err;
-	log_addrs->log_addr_mask = (data[0] << 8) | data[1];
-	dev_dbg(pulse8->dev, "Logical address ACK mask: %x\n",
-		log_addrs->log_addr_mask);
-	if (log_addrs->log_addr_mask)
-		log_addrs->num_log_addrs = 1;
-
-	cmd[0] = MSGCODE_GET_PHYSICAL_ADDRESS;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
-	if (err)
-		return err;
-	*pa = (data[0] << 8) | data[1];
-	dev_dbg(pulse8->dev, "Physical address: %x.%x.%x.%x\n",
-		cec_phys_addr_exp(*pa));
-
-	cmd[0] = MSGCODE_GET_HDMI_VERSION;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
-	if (err)
-		return err;
-	log_addrs->cec_version = data[0];
-	dev_dbg(pulse8->dev, "CEC version: %d\n", log_addrs->cec_version);
-
-	cmd[0] = MSGCODE_GET_OSD_NAME;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 0);
-	if (err)
-		return err;
-	strscpy(log_addrs->osd_name, data, sizeof(log_addrs->osd_name));
-	dev_dbg(pulse8->dev, "OSD name: %s\n", log_addrs->osd_name);
-
-	return 0;
-}
-
-static int pulse8_apply_persistent_config(struct pulse8 *pulse8,
-					  struct cec_log_addrs *log_addrs,
-					  u16 pa)
-{
-	int err;
-
-	err = cec_s_log_addrs(pulse8->adap, log_addrs, false);
-	if (err)
-		return err;
-
-	cec_s_phys_addr(pulse8->adap, pa, false);
-
-	return 0;
-}
-
 static int pulse8_cec_adap_enable(struct cec_adapter *adap, bool enable)
 {
 	struct pulse8 *pulse8 = cec_get_drvdata(adap);
@@ -688,18 +540,185 @@ static int pulse8_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	return err;
 }
 
-static int pulse8_received(struct cec_adapter *adap, struct cec_msg *msg)
-{
-	return -ENOMSG;
-}
-
 static const struct cec_adap_ops pulse8_cec_adap_ops = {
 	.adap_enable = pulse8_cec_adap_enable,
 	.adap_log_addr = pulse8_cec_adap_log_addr,
 	.adap_transmit = pulse8_cec_adap_transmit,
-	.received = pulse8_received,
 };
 
+static void pulse8_disconnect(struct serio *serio)
+{
+	struct pulse8 *pulse8 = serio_get_drvdata(serio);
+
+	cec_unregister_adapter(pulse8->adap);
+	cancel_delayed_work_sync(&pulse8->ping_eeprom_work);
+	dev_info(&serio->dev, "disconnected\n");
+	serio_close(serio);
+	serio_set_drvdata(serio, NULL);
+	kfree(pulse8);
+}
+
+static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
+			struct cec_log_addrs *log_addrs, u16 *pa)
+{
+	u8 *data = pulse8->data + 1;
+	u8 cmd[2];
+	int err;
+	struct tm tm;
+	time64_t date;
+
+	pulse8->vers = 0;
+
+	cmd[0] = MSGCODE_FIRMWARE_VERSION;
+	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 2);
+	if (err)
+		return err;
+	pulse8->vers = (data[0] << 8) | data[1];
+	dev_info(pulse8->dev, "Firmware version %04x\n", pulse8->vers);
+	if (pulse8->vers < 2) {
+		*pa = CEC_PHYS_ADDR_INVALID;
+		return 0;
+	}
+
+	cmd[0] = MSGCODE_GET_BUILDDATE;
+	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 4);
+	if (err)
+		return err;
+	date = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
+	time64_to_tm(date, 0, &tm);
+	dev_info(pulse8->dev, "Firmware build date %04ld.%02d.%02d %02d:%02d:%02d\n",
+		 tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
+		 tm.tm_hour, tm.tm_min, tm.tm_sec);
+
+	dev_dbg(pulse8->dev, "Persistent config:\n");
+	cmd[0] = MSGCODE_GET_AUTO_ENABLED;
+	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
+	if (err)
+		return err;
+	pulse8->autonomous = data[0];
+	dev_dbg(pulse8->dev, "Autonomous mode: %s",
+		data[0] ? "on" : "off");
+
+	cmd[0] = MSGCODE_GET_DEVICE_TYPE;
+	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
+	if (err)
+		return err;
+	log_addrs->primary_device_type[0] = data[0];
+	dev_dbg(pulse8->dev, "Primary device type: %d\n", data[0]);
+	switch (log_addrs->primary_device_type[0]) {
+	case CEC_OP_PRIM_DEVTYPE_TV:
+		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_TV;
+		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
+		break;
+	case CEC_OP_PRIM_DEVTYPE_RECORD:
+		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_RECORD;
+		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_RECORD;
+		break;
+	case CEC_OP_PRIM_DEVTYPE_TUNER:
+		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_TUNER;
+		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_TUNER;
+		break;
+	case CEC_OP_PRIM_DEVTYPE_PLAYBACK:
+		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
+		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_PLAYBACK;
+		break;
+	case CEC_OP_PRIM_DEVTYPE_AUDIOSYSTEM:
+		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
+		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_AUDIOSYSTEM;
+		break;
+	case CEC_OP_PRIM_DEVTYPE_SWITCH:
+		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_UNREGISTERED;
+		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
+		break;
+	case CEC_OP_PRIM_DEVTYPE_PROCESSOR:
+		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_SPECIFIC;
+		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
+		break;
+	default:
+		log_addrs->log_addr_type[0] = CEC_LOG_ADDR_TYPE_UNREGISTERED;
+		log_addrs->all_device_types[0] = CEC_OP_ALL_DEVTYPE_SWITCH;
+		dev_info(pulse8->dev, "Unknown Primary Device Type: %d\n",
+			 log_addrs->primary_device_type[0]);
+		break;
+	}
+
+	cmd[0] = MSGCODE_GET_LOGICAL_ADDRESS_MASK;
+	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 2);
+	if (err)
+		return err;
+	log_addrs->log_addr_mask = (data[0] << 8) | data[1];
+	dev_dbg(pulse8->dev, "Logical address ACK mask: %x\n",
+		log_addrs->log_addr_mask);
+	if (log_addrs->log_addr_mask)
+		log_addrs->num_log_addrs = 1;
+
+	cmd[0] = MSGCODE_GET_PHYSICAL_ADDRESS;
+	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
+	if (err)
+		return err;
+	*pa = (data[0] << 8) | data[1];
+	dev_dbg(pulse8->dev, "Physical address: %x.%x.%x.%x\n",
+		cec_phys_addr_exp(*pa));
+
+	cmd[0] = MSGCODE_GET_HDMI_VERSION;
+	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
+	if (err)
+		return err;
+	log_addrs->cec_version = data[0];
+	dev_dbg(pulse8->dev, "CEC version: %d\n", log_addrs->cec_version);
+
+	cmd[0] = MSGCODE_GET_OSD_NAME;
+	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 0);
+	if (err)
+		return err;
+	strscpy(log_addrs->osd_name, data, sizeof(log_addrs->osd_name));
+	dev_dbg(pulse8->dev, "OSD name: %s\n", log_addrs->osd_name);
+
+	return 0;
+}
+
+static int pulse8_apply_persistent_config(struct pulse8 *pulse8,
+					  struct cec_log_addrs *log_addrs,
+					  u16 pa)
+{
+	int err;
+
+	err = cec_s_log_addrs(pulse8->adap, log_addrs, false);
+	if (err)
+		return err;
+
+	cec_s_phys_addr(pulse8->adap, pa, false);
+
+	return 0;
+}
+
+static void pulse8_ping_eeprom_work_handler(struct work_struct *work)
+{
+	struct pulse8 *pulse8 =
+		container_of(work, struct pulse8, ping_eeprom_work.work);
+	u8 cmd;
+
+	schedule_delayed_work(&pulse8->ping_eeprom_work, PING_PERIOD);
+	cmd = MSGCODE_PING;
+	pulse8_send_and_wait(pulse8, &cmd, 1,
+			     MSGCODE_COMMAND_ACCEPTED, 0);
+
+	if (pulse8->vers < 2)
+		return;
+
+	mutex_lock(&pulse8->config_lock);
+	if (pulse8->config_pending && persistent_config) {
+		dev_dbg(pulse8->dev, "writing pending config to EEPROM\n");
+		cmd = MSGCODE_WRITE_EEPROM;
+		if (pulse8_send_and_wait(pulse8, &cmd, 1,
+					 MSGCODE_COMMAND_ACCEPTED, 0))
+			dev_info(pulse8->dev, "failed to write pending config to EEPROM\n");
+		else
+			pulse8->config_pending = false;
+	}
+	mutex_unlock(&pulse8->config_lock);
+}
+
 static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 {
 	u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_PHYS_ADDR | CEC_CAP_MONITOR_ALL;
@@ -764,33 +783,6 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 	return err;
 }
 
-static void pulse8_ping_eeprom_work_handler(struct work_struct *work)
-{
-	struct pulse8 *pulse8 =
-		container_of(work, struct pulse8, ping_eeprom_work.work);
-	u8 cmd;
-
-	schedule_delayed_work(&pulse8->ping_eeprom_work, PING_PERIOD);
-	cmd = MSGCODE_PING;
-	pulse8_send_and_wait(pulse8, &cmd, 1,
-			     MSGCODE_COMMAND_ACCEPTED, 0);
-
-	if (pulse8->vers < 2)
-		return;
-
-	mutex_lock(&pulse8->config_lock);
-	if (pulse8->config_pending && persistent_config) {
-		dev_dbg(pulse8->dev, "writing pending config to EEPROM\n");
-		cmd = MSGCODE_WRITE_EEPROM;
-		if (pulse8_send_and_wait(pulse8, &cmd, 1,
-					 MSGCODE_COMMAND_ACCEPTED, 0))
-			dev_info(pulse8->dev, "failed to write pending config to EEPROM\n");
-		else
-			pulse8->config_pending = false;
-	}
-	mutex_unlock(&pulse8->config_lock);
-}
-
 static const struct serio_device_id pulse8_serio_ids[] = {
 	{
 		.type	= SERIO_RS232,
-- 
2.23.0

