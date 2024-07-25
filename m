Return-Path: <linux-media+bounces-15342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E1A93C131
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 13:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5AD1F22A3F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 11:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507B71993A4;
	Thu, 25 Jul 2024 11:54:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BB5199391
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721908452; cv=none; b=i+5JNDLLJG62QTIBtYGqY2MkHH2YRZgxbghrRP5c4GmjvTcMT+Hp/WGZDdmEETu1avc3FtnIbHhRjBbrx5H2TR4fIMtK1Z96ma+W+qDj7wfpU32szxmPU9vpc+TmKHB0F6xxL0i2SExpC7+HXPHoSNhyGFOloM/vB0XIRxgVIlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721908452; c=relaxed/simple;
	bh=xcZw37ysbXCp0uIDKePEOswT4S1HWZrTvPwvWwY3YEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgxupJh9PYK53D7Q2iQh1I2yElJAiYmu2O1UrXD/HThnGzqW/2E4nHMVabpRLUc5lcrW9HVDAulTr+aMr+5M95sAw71uR+D3/rYUO5eM64uZJcFoCskhY5KAT0kvuz7qYpNoONg648HYf1S9dxE9CFXV3or6qlm66Hm7GuSDgwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6542C4AF0A;
	Thu, 25 Jul 2024 11:54:11 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] cec-compliance: add tests for CEC_MSG_FL_REPLY_VENDOR_ID
Date: Thu, 25 Jul 2024 13:52:10 +0200
Message-ID: <f670cb2142cb87816260e7fca60938d820660c2c.1721908330.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1721908330.git.hverkuil-cisco@xs4all.nl>
References: <cover.1721908330.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While some simple generic checks are possible, most of the
tests are only performed if the CEC driver is 'vivid', since
that has a well defined <Vendor Command With ID> implementation,
specifically created to regression test this flag.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/cec-compliance/cec-compliance.cpp   |  2 +
 utils/cec-compliance/cec-compliance.h     |  2 +
 utils/cec-compliance/cec-test-adapter.cpp | 90 ++++++++++++++++++++++-
 3 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/utils/cec-compliance/cec-compliance.cpp b/utils/cec-compliance/cec-compliance.cpp
index bddd57cb..aa368026 100644
--- a/utils/cec-compliance/cec-compliance.cpp
+++ b/utils/cec-compliance/cec-compliance.cpp
@@ -1072,6 +1072,7 @@ int main(int argc, char **argv)
 	doioctl(&node, CEC_ADAP_G_CAPS, &caps);
 	node.caps = caps.capabilities;
 	node.available_log_addrs = caps.available_log_addrs;
+	node.is_vivid = !strcmp(caps.driver, "vivid");
 
 	if (options[OptTestAudioRateControl])
 		test_tags |= TAG_AUDIO_RATE_CONTROL;
@@ -1169,6 +1170,7 @@ int main(int argc, char **argv)
 
 	struct cec_log_addrs laddrs = { };
 	doioctl(&node, CEC_ADAP_G_LOG_ADDRS, &laddrs);
+	node.vendor_id = laddrs.vendor_id;
 
 	if (node.phys_addr == CEC_PHYS_ADDR_INVALID &&
 	    !(node.caps & (CEC_CAP_PHYS_ADDR | CEC_CAP_NEEDS_HPD)) &&
diff --git a/utils/cec-compliance/cec-compliance.h b/utils/cec-compliance/cec-compliance.h
index aae72842..c291e9ac 100644
--- a/utils/cec-compliance/cec-compliance.h
+++ b/utils/cec-compliance/cec-compliance.h
@@ -151,6 +151,7 @@ struct remote {
 struct node {
 	int fd;
 	const char *device;
+	bool is_vivid;
 	bool has_cec20;
 	unsigned caps;
 	unsigned available_log_addrs;
@@ -160,6 +161,7 @@ struct node {
 	unsigned remote_la_mask;
 	struct remote remote[16];
 	__u16 phys_addr;
+	__u32 vendor_id;
 	bool in_standby;
 	__u8 prim_devtype;
 	time_t current_time;
diff --git a/utils/cec-compliance/cec-test-adapter.cpp b/utils/cec-compliance/cec-test-adapter.cpp
index f96baaf3..3f818583 100644
--- a/utils/cec-compliance/cec-test-adapter.cpp
+++ b/utils/cec-compliance/cec-test-adapter.cpp
@@ -15,7 +15,8 @@
 #include "cec-compliance.h"
 
 static constexpr __u8 tx_ok_retry_mask = CEC_TX_STATUS_OK | CEC_TX_STATUS_MAX_RETRIES;
-static constexpr __u32 msg_fl_mask = CEC_MSG_FL_REPLY_TO_FOLLOWERS | CEC_MSG_FL_RAW;
+static constexpr __u32 msg_fl_mask = CEC_MSG_FL_REPLY_TO_FOLLOWERS | CEC_MSG_FL_RAW |
+				     CEC_MSG_FL_REPLY_VENDOR_ID;
 
 // Flush any pending messages
 static int flush_pending_msgs(struct node *node)
@@ -267,6 +268,7 @@ static int testTransmit(struct node *node)
 	bool tested_self = false;
 	bool tested_valid_la = false;
 	bool tested_invalid_la = false;
+	bool has_reply_vendor_id = node->caps & CEC_CAP_REPLY_VENDOR_ID;
 
 	if (!(node->caps & CEC_CAP_TRANSMIT)) {
 		cec_msg_init(&msg, la, 0);
@@ -294,6 +296,19 @@ static int testTransmit(struct node *node)
 	msg.reply = CEC_MSG_CEC_VERSION;
 	fail_on_test(doioctl(node, CEC_TRANSMIT, &msg) != EINVAL);
 
+	if (has_reply_vendor_id) {
+		// Test that CEC_MSG_FL_REPLY_VENDOR_ID requires a message
+		// size of at least 6 by constructing a message of length 5
+		// and verifying that that fails with EINVAL.
+		cec_msg_init(&msg, la, 0);
+		__u8 cmd = 0;
+		cec_msg_vendor_command_with_id(&msg, node->vendor_id, 0, &cmd);
+		msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
+		msg.reply = cmd + 1;
+		fail_on_test(doioctl(node, CEC_TRANSMIT, &msg) != EINVAL);
+		fail_on_test(!(msg.flags & CEC_MSG_FL_REPLY_VENDOR_ID));
+	}
+
 	for (i = 0; i < 15; i++) {
 		if (tested_self && (node->adap_la_mask & (1 << i)))
 			continue;
@@ -391,6 +406,79 @@ static int testTransmit(struct node *node)
 			fail_on_test(msg.tx_arb_lost_cnt == 0xff);
 			fail_on_test(msg.tx_low_drive_cnt == 0xff);
 			fail_on_test(msg.tx_error_cnt == 0xff);
+
+			// CEC_MSG_FL_REPLY_VENDOR_ID tests, only valid for use with
+			// the vivid driver since that has support for this.
+			//
+			// The vivid driver will Feature Abort the vendor message if
+			// it has a payload size != 1.
+			//
+			// It will ignore messages with an even payload byte, and
+			// it will reply to messages with an odd payload byte with
+			// that payload byte incremented by 1.
+			if (node->is_vivid && has_reply_vendor_id) {
+				__u32 vendor_id;
+				__u8 size;
+				const __u8 *vendor_data;
+				__u8 vendor_cmd = 0x11;
+
+				// Test that an invalid vendor ID is ignored
+				cec_msg_init(&msg, la, i);
+				cec_msg_vendor_command_with_id(&msg, node->vendor_id + 1, 1, &vendor_cmd);
+				msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
+				msg.reply = vendor_cmd + 2;
+				fail_on_test(doioctl(node, CEC_TRANSMIT, &msg));
+				fail_on_test(!(msg.rx_status & CEC_RX_STATUS_TIMEOUT));
+				fail_on_test(!(msg.flags & CEC_MSG_FL_REPLY_VENDOR_ID));
+
+				// The vivid driver will reply with value vendor_cmd + 1, so
+				// waiting for different reply must time out
+				cec_msg_init(&msg, la, i);
+				cec_msg_vendor_command_with_id(&msg, node->vendor_id, 1, &vendor_cmd);
+				msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
+				msg.reply = vendor_cmd + 2;
+				fail_on_test(doioctl(node, CEC_TRANSMIT, &msg));
+				fail_on_test(!(msg.rx_status & CEC_RX_STATUS_TIMEOUT));
+				fail_on_test(!(msg.flags & CEC_MSG_FL_REPLY_VENDOR_ID));
+
+				// This should work
+				cec_msg_init(&msg, la, i);
+				cec_msg_vendor_command_with_id(&msg, node->vendor_id, 1, &vendor_cmd);
+				msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
+				msg.reply = vendor_cmd + 1;
+				fail_on_test(doioctl(node, CEC_TRANSMIT, &msg));
+				fail_on_test(!(msg.rx_status & CEC_RX_STATUS_OK));
+				fail_on_test(!(msg.flags & CEC_MSG_FL_REPLY_VENDOR_ID));
+				cec_ops_vendor_command_with_id(&msg, &vendor_id, &size, &vendor_data);
+				fail_on_test(vendor_id != node->vendor_id);
+				fail_on_test(size != 1);
+				fail_on_test(vendor_data[0] != vendor_cmd + 1);
+
+				// This too: here the reply is 0 (0xff + 1 % 256)
+				cec_msg_init(&msg, la, i);
+				vendor_cmd = 0xff;
+				cec_msg_vendor_command_with_id(&msg, node->vendor_id, 1, &vendor_cmd);
+				msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
+				msg.reply = 0;
+				fail_on_test(doioctl(node, CEC_TRANSMIT, &msg));
+				fail_on_test(!(msg.rx_status & CEC_RX_STATUS_OK));
+				fail_on_test(!(msg.flags & CEC_MSG_FL_REPLY_VENDOR_ID));
+				cec_ops_vendor_command_with_id(&msg, &vendor_id, &size, &vendor_data);
+				fail_on_test(vendor_id != node->vendor_id);
+				fail_on_test(size != 1);
+				fail_on_test(vendor_data[0]);
+
+				// A size != 1 should result in a feature abort
+				cec_msg_init(&msg, la, i);
+				vendor_cmd = 0xff;
+				cec_msg_vendor_command_with_id(&msg, node->vendor_id, 1, &vendor_cmd);
+				msg.len++;
+				msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
+				msg.reply = 0;
+				fail_on_test(doioctl(node, CEC_TRANSMIT, &msg));
+				fail_on_test(!(msg.rx_status & CEC_RX_STATUS_FEATURE_ABORT));
+				fail_on_test(msg.msg[3] != CEC_OP_ABORT_INVALID_OP);
+			}
 		} else {
 			if (tested_invalid_la)
 				continue;
-- 
2.43.0


