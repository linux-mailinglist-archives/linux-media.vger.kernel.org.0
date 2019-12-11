Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D07DB11B88C
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2019 17:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730259AbfLKQWl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Dec 2019 11:22:41 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:59085 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730219AbfLKQWf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Dec 2019 11:22:35 -0500
Received: from marune.fritz.box ([IPv6:2001:983:e9a7:1:d0c4:2b08:27a4:6946])
        by smtp-cloud7.xs4all.net with ESMTPA
        id f4kxiY8tRapzpf4kziSRbb; Wed, 11 Dec 2019 17:22:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576081353; bh=W+eJqpP/1iPsUGmYey1VVBTz1YTzP7zth4vakGkbjOE=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=r+OTEuL33yeE4rrok9OVg/nyk2wDwPXACwo7Krg8vQ4IFvR4oFAE/ukaxnH2uG1S5
         HXvsHfzc/ofT7DhA9H3U98JSnjN7efzwy4A5vMdKGcKLFYprkAysHyorGUCLO52R4g
         pr1NoQAuOQ8MIMvnbwkBHNLnKimHtdYLl5DKq6USclIP5vCCo16cISCFi5PYXp5+Ll
         3Qbw0Y9RXQwPJ7sF6Wx+WV1PNLT0B3hpYJdLMn1HYEGPEeCnUmQVBZbP+/eTT+NX5t
         hfvsKPy541+tST3GgjPq82LNJdmX9KTAwjqEMAlg3iBpNKYT04BSFiInUuiLSMRGk/
         YzuZYDV1c5w5Q==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 04/10] pulse8-cec: add 2nd debug level
Date:   Wed, 11 Dec 2019 17:22:25 +0100
Message-Id: <20191211162231.99978-5-hverkuil-cisco@xs4all.nl>
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

Use debug level 2 to show the low-level Pulse-Eight commands.

Also show the message to transmit on debug level 1 and add a
debug log to show where the transmit failed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 24 ++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index 40880cb79f9a..5ac257d01243 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -49,7 +49,7 @@ static int debug;
 static int persistent_config;
 module_param(debug, int, 0644);
 module_param(persistent_config, int, 0644);
-MODULE_PARM_DESC(debug, "debug level (0-1)");
+MODULE_PARM_DESC(debug, "debug level (0-2)");
 MODULE_PARM_DESC(persistent_config, "read config from persistent memory (0-1)");
 
 enum pulse8_msgcodes {
@@ -215,7 +215,9 @@ static int pulse8_send_and_wait_once(struct pulse8 *pulse8,
 {
 	int err;
 
-	/* dev_info(pulse8->dev, "transmit %s: %*ph\n", pulse8_msgname(cmd[0]), cmd_len, cmd); */
+	if (debug > 1)
+		dev_info(pulse8->dev, "transmit %s: %*ph\n",
+			 pulse8_msgname(cmd[0]), cmd_len, cmd);
 	init_completion(&pulse8->cmd_done);
 
 	err = pulse8_send(pulse8->serio, cmd, cmd_len);
@@ -231,8 +233,9 @@ static int pulse8_send_and_wait_once(struct pulse8 *pulse8,
 		return -ENOTTY;
 	if (response &&
 	    ((pulse8->data[0] & 0x3f) != response || pulse8->len < size + 1)) {
-		dev_info(pulse8->dev, "transmit %s: failed %s\n",
-			 pulse8_msgname(cmd[0]), pulse8_msgname(pulse8->data[0]));
+		dev_info(pulse8->dev, "transmit %s failed with %s\n",
+			 pulse8_msgname(cmd[0]),
+			 pulse8_msgname(pulse8->data[0]));
 		return -EIO;
 	}
 	return 0;
@@ -307,9 +310,10 @@ static irqreturn_t pulse8_interrupt(struct serio *serio, unsigned char data,
 		struct cec_msg *msg = &pulse8->rx_msg;
 		u8 msgcode = pulse8->buf[0];
 
-		if (debug)
+		if (debug > 1)
 			dev_info(pulse8->dev, "received %s: %*ph\n",
-				 pulse8_msgname(msgcode), pulse8->idx, pulse8->buf);
+				 pulse8_msgname(msgcode),
+				 pulse8->idx, pulse8->buf);
 		switch (msgcode & 0x3f) {
 		case MSGCODE_FRAME_START:
 			msg->len = 1;
@@ -511,6 +515,9 @@ static int pulse8_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 	unsigned int i;
 	int err;
 
+	if (debug)
+		dev_info(pulse8->dev, "adap transmit %*ph\n",
+			 msg->len, msg->msg);
 	mutex_lock(&pulse8->lock);
 	cmd[0] = MSGCODE_TRANSMIT_IDLETIME;
 	cmd[1] = signal_free_time;
@@ -540,7 +547,10 @@ static int pulse8_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
 						   MSGCODE_COMMAND_ACCEPTED, 1);
 		}
 	}
-
+	if (err && debug)
+		dev_info(pulse8->dev, "%s(0x%02x) failed with error %d for msg %*ph\n",
+			 pulse8_msgname(cmd[0]), cmd[1],
+			 err, msg->len, msg->msg);
 	mutex_unlock(&pulse8->lock);
 	return err;
 }
-- 
2.23.0

