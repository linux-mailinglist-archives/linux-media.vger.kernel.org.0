Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D64392C65AD
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 13:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgK0MWW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 07:22:22 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:51413 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726992AbgK0MWV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 07:22:21 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id iclSkPsuGDuFjiclWkqkCe; Fri, 27 Nov 2020 13:22:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606479739; bh=gLKVO4B9hk3ur9g9OPAp2QxtlQEayrDgQFfRtpygLIg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=pVSk9gZoGDRnGQGxGa/eChMCBwEICU5SG+M4lml0TlJAJpyZD+Ct5MW8t3TM0aM3g
         Sp+coHF8PsffS6aOykSURIMBT4oMdqRvnkCoyzUYkrc39Vku1SmLVnEZDfixhIEvZt
         nNdZ92qjU4mVruvQXpcSTVrdCxL8ZOz1jW8kHtbDt7P22rOw8VmhRzGokvtRbSWkxh
         9Z9TTx2ReUu2jBs3eKNblXm2h9+F0aUx5v60dlBUCIoSUI2GD71r/nahHhj1OhdtP5
         OGhtklD0j6PI0mXcS0Ff2zDhHfeoskaRTew0DLb+yTcWq5i7R/8kZqDdM6XPpdL+Ac
         OAWP2KqI+YOgA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH for v5.10 2/2] pulse8-cec: add support for FW v10 and up
Date:   Fri, 27 Nov 2020 13:22:14 +0100
Message-Id: <20201127122214.126701-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127122214.126701-1-hverkuil-cisco@xs4all.nl>
References: <20201127122214.126701-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAa9HXBdlWeMZpsKv7QNEw7D5kVgwmdeHzO5f283XC8VwLA+uWA4sHTbkiRDpBuTFbSlYflV/0CCnpEP0Ikj5pv7pqDLCgHwBDN0idw1DlGlrx2guEAB
 GlgJWCiStvdJBptQmreb2Az8B+N0Q3mYY9d/a4EWVKaFSipsxlq6PELBnkL+A3EzPU0PTprh65V7jLxtSIavWna/hXMzXSyT9u/3eVFEUN0pyauCwQ65+Fth
 kLJg5dWbk/3K8GmeC6qK838pAmdZprEtRKGm2/s2L/8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

Starting with firmware version 10 the GET/SET_HDMI_VERSION message
was removed and GET/SET_AUTO_POWER_ON was added.

The removal of GET/SET_HDMI_VERSION caused the probe of the
Pulse-Eight to fail. Add a version check to handle this gracefully.

Also show (but do not set) the Auto Power On value.

Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Reported-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/media/cec/usb/pulse8/pulse8-cec.c | 43 ++++++++++++++++-------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/media/cec/usb/pulse8/pulse8-cec.c b/drivers/media/cec/usb/pulse8/pulse8-cec.c
index 5d3a3f775bc8..04b13cdc38d2 100644
--- a/drivers/media/cec/usb/pulse8/pulse8-cec.c
+++ b/drivers/media/cec/usb/pulse8/pulse8-cec.c
@@ -88,13 +88,15 @@ enum pulse8_msgcodes {
 	MSGCODE_SET_PHYSICAL_ADDRESS,	/* 0x20 */
 	MSGCODE_GET_DEVICE_TYPE,
 	MSGCODE_SET_DEVICE_TYPE,
-	MSGCODE_GET_HDMI_VERSION,
+	MSGCODE_GET_HDMI_VERSION,	/* Removed in FW >= 10 */
 	MSGCODE_SET_HDMI_VERSION,
 	MSGCODE_GET_OSD_NAME,
 	MSGCODE_SET_OSD_NAME,
 	MSGCODE_WRITE_EEPROM,
 	MSGCODE_GET_ADAPTER_TYPE,	/* 0x28 */
 	MSGCODE_SET_ACTIVE_SOURCE,
+	MSGCODE_GET_AUTO_POWER_ON,	/* New for FW >= 10 */
+	MSGCODE_SET_AUTO_POWER_ON,
 
 	MSGCODE_FRAME_EOM = 0x80,
 	MSGCODE_FRAME_ACK = 0x40,
@@ -143,6 +145,8 @@ static const char * const pulse8_msgnames[] = {
 	"WRITE_EEPROM",
 	"GET_ADAPTER_TYPE",
 	"SET_ACTIVE_SOURCE",
+	"GET_AUTO_POWER_ON",
+	"SET_AUTO_POWER_ON",
 };
 
 static const char *pulse8_msgname(u8 cmd)
@@ -579,12 +583,14 @@ static int pulse8_cec_adap_log_addr(struct cec_adapter *adap, u8 log_addr)
 	if (err)
 		goto unlock;
 
-	cmd[0] = MSGCODE_SET_HDMI_VERSION;
-	cmd[1] = adap->log_addrs.cec_version;
-	err = pulse8_send_and_wait(pulse8, cmd, 2,
-				   MSGCODE_COMMAND_ACCEPTED, 0);
-	if (err)
-		goto unlock;
+	if (pulse8->vers < 10) {
+		cmd[0] = MSGCODE_SET_HDMI_VERSION;
+		cmd[1] = adap->log_addrs.cec_version;
+		err = pulse8_send_and_wait(pulse8, cmd, 2,
+					   MSGCODE_COMMAND_ACCEPTED, 0);
+		if (err)
+			goto unlock;
+	}
 
 	if (adap->log_addrs.osd_name[0]) {
 		size_t osd_len = strlen(adap->log_addrs.osd_name);
@@ -691,6 +697,14 @@ static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
 	dev_dbg(pulse8->dev, "Autonomous mode: %s",
 		data[0] ? "on" : "off");
 
+	if (pulse8->vers >= 10) {
+		cmd[0] = MSGCODE_GET_AUTO_POWER_ON;
+		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
+		if (!err)
+			dev_dbg(pulse8->dev, "Auto Power On: %s",
+				data[0] ? "on" : "off");
+	}
+
 	cmd[0] = MSGCODE_GET_DEVICE_TYPE;
 	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
 	if (err)
@@ -752,12 +766,15 @@ static int pulse8_setup(struct pulse8 *pulse8, struct serio *serio,
 	dev_dbg(pulse8->dev, "Physical address: %x.%x.%x.%x\n",
 		cec_phys_addr_exp(*pa));
 
-	cmd[0] = MSGCODE_GET_HDMI_VERSION;
-	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
-	if (err)
-		return err;
-	log_addrs->cec_version = data[0];
-	dev_dbg(pulse8->dev, "CEC version: %d\n", log_addrs->cec_version);
+	log_addrs->cec_version = CEC_OP_CEC_VERSION_1_4;
+	if (pulse8->vers < 10) {
+		cmd[0] = MSGCODE_GET_HDMI_VERSION;
+		err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 1);
+		if (err)
+			return err;
+		log_addrs->cec_version = data[0];
+		dev_dbg(pulse8->dev, "CEC version: %d\n", log_addrs->cec_version);
+	}
 
 	cmd[0] = MSGCODE_GET_OSD_NAME;
 	err = pulse8_send_and_wait(pulse8, cmd, 1, cmd[0], 0);
-- 
2.29.2

