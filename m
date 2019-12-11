Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F81E11B883
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbfLKQWf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:59027 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730106AbfLKQWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbR; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=FxRdh2a6QTokfqEvvc9OPn9VVCwjmX3Pu23sY4TvB3Y=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=cCq3f1zQrrjZ/E6K9DHQo6EYCmNB5TfmGZfWgRkqUmXZ5KnqpK62YrQ03EDrSvZZR
         6tyJo7OQtblIbGTuIrpQxae8JqwHLezQyK2ykeiUCeZ+CB991pgjSghDIDBixkqxZE
         dtGdEvl+ozqOcdg5S15ut/2Ii90zsuqJjw+faq3hxo1RQropI6eL2GnAthCB+GkXYU
         /vwG5ZgOIAKPVdmwtE6AHMuNG8Xf1OL5N9hNhW7BQkFz5XT9Zj8tHpbkJ6WU7rQIfe
         2Gfev9dvspsFOFDIWl2Ym/hEqsgrTbQaxyiE9lws376ofbucSR1x+tTsigersDZMmf
         mhRliC2ULIfVA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 01/10] pulse8-cec: improve debugging
Date:   Wed, 11 Dec 2019 17:22:22 +0100
Message-Id: <20191211162231.99978-2-hverkuil-cisco@xs4all.nl>
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

Add and use pulse8_msgname() to show the message codes as a
human readable text instead of a number.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 65 +++++++++++++++++++++--
 1 file changed, 60 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 59609556d969..ea9d42d19bfd 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -100,6 +100,61 @@ enum pulse8_msgcodes {
 	MSGCODE_FRAME_ACK = 0x40,
 };
 
+static const char * const pulse8_msgnames[] = {
+	"NOTHING",
+	"PING",
+	"TIMEOUT_ERROR",
+	"HIGH_ERROR",
+	"LOW_ERROR",
+	"FRAME_START",
+	"FRAME_DATA",
+	"RECEIVE_FAILED",
+	"COMMAND_ACCEPTED",
+	"COMMAND_REJECTED",
+	"SET_ACK_MASK",
+	"TRANSMIT",
+	"TRANSMIT_EOM",
+	"TRANSMIT_IDLETIME",
+	"TRANSMIT_ACK_POLARITY",
+	"TRANSMIT_LINE_TIMEOUT",
+	"TRANSMIT_SUCCEEDED",
+	"TRANSMIT_FAILED_LINE",
+	"TRANSMIT_FAILED_ACK",
+	"TRANSMIT_FAILED_TIMEOUT_DATA",
+	"TRANSMIT_FAILED_TIMEOUT_LINE",
+	"FIRMWARE_VERSION",
+	"START_BOOTLOADER",
+	"GET_BUILDDATE",
+	"SET_CONTROLLED",
+	"GET_AUTO_ENABLED",
+	"SET_AUTO_ENABLED",
+	"GET_DEFAULT_LOGICAL_ADDRESS",
+	"SET_DEFAULT_LOGICAL_ADDRESS",
+	"GET_LOGICAL_ADDRESS_MASK",
+	"SET_LOGICAL_ADDRESS_MASK",
+	"GET_PHYSICAL_ADDRESS",
+	"SET_PHYSICAL_ADDRESS",
+	"GET_DEVICE_TYPE",
+	"SET_DEVICE_TYPE",
+	"GET_HDMI_VERSION",
+	"SET_HDMI_VERSION",
+	"GET_OSD_NAME",
+	"SET_OSD_NAME",
+	"WRITE_EEPROM",
+	"GET_ADAPTER_TYPE",
+	"SET_ACTIVE_SOURCE",
+};
+
+static const char *pulse8_msgname(u8 cmd)
+{
+	static char unknown_msg[5];
+
+	if ((cmd & 0x3f) < ARRAY_SIZE(pulse8_msgnames))
+		return pulse8_msgnames[cmd & 0x3f];
+	snprintf(unknown_msg, sizeof(unknown_msg), "0x%02x", cmd);
+	return unknown_msg;
+}
+
 #define MSGSTART	0xff
 #define MSGEND		0xfe
 #define MSGESC		0xfd
@@ -178,8 +233,8 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 		u8 msgcode = pulse8->buf[0];
 
 		if (debug)
-			dev_info(pulse8->dev, "received: %*ph\n",
-				 pulse8->idx, pulse8->buf);
+			dev_info(pulse8->dev, "received %s: %*ph\n",
+				 pulse8_msgname(msgcode), pulse8->idx, pulse8->buf);
 		switch (msgcode & 0x3f) {
 		case MSGCODE_FRAME_START:
 			msg->len = 1;
@@ -278,7 +333,7 @@ static int pulse8_send_and_wait_once(struct pulse8 *pulse8,
 {
 	int err;
 
-	/*dev_info(pulse8->dev, "transmit: %*ph\n", cmd_len, cmd);*/
+	/* dev_info(pulse8->dev, "transmit %s: %*ph\n", pulse8_msgname(cmd[0]), cmd_len, cmd); */
 	init_completion(&pulse8->cmd_done);
 
 	err = pulse8_send(pulse8->serio, cmd, cmd_len);
@@ -294,8 +349,8 @@ static int pulse8_send_and_wait_once(struct pulse8 *pulse8,
 		return -ENOTTY;
 	if (response &&
 	    ((pulse8->data[0] & 0x3f) != response || pulse8->len < size + 1)) {
-		dev_info(pulse8->dev, "transmit: failed %02x\n",
-			 pulse8->data[0] & 0x3f);
+		dev_info(pulse8->dev, "transmit %s: failed %s\n",
+			 pulse8_msgname(cmd[0]), pulse8_msgname(pulse8->data[0]));
 		return -EIO;
 	}
 	return 0;
-- 
2.23.0

