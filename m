Return-Path: <linux-media+bounces-15345-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062793C241
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 14:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9F9C1F21989
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 12:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47299199EA8;
	Thu, 25 Jul 2024 12:43:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649719939F
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721911414; cv=none; b=aPrWatP1quxhoLgCwTWQSbXi/Fnr66/qLJxbbkbQi95Juiry4xf3x+PAA28LQWILmCKDT6pejQ/c1prnCfAoJMcNVOaesYXfnduDVKLOWAIzczl/p7+u8LagXfnWx+lVppvHIvxpuVV70QRhRZI3mnmCNsdvm7JXoDZrZl/ObQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721911414; c=relaxed/simple;
	bh=b4C6OY9hL/g4H0gAWij4QvT90IVQUZIeuVbpea4Uj2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXkUlEBmxD1hWRzMbjfYq6TaVp1kIawTh5X2e3xWa50g+bcGLOALSif5O0IZAlWXR1cFHAleaJ+eT1y4oEwzk0PJPiIBDT4ibfDm62Kf3Txp9JGhPvkC0PX6R0a0rwVxGuDUdGYCv2rlOdyEKhM9YTTuWBEacKn3uIhrb+UWWt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB869C116B1;
	Thu, 25 Jul 2024 12:43:33 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 2/2] media: vivid: add <Vendor Command With ID> support
Date: Thu, 25 Jul 2024 14:40:39 +0200
Message-ID: <9a44bb6bd06d692a6300a6032c3310b48862098b.1721911239.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1721911239.git.hverkuil-cisco@xs4all.nl>
References: <cover.1721911239.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes it possible to test the new CEC_MSG_FL_REPLY_VENDOR_ID flag.

The vivid driver will Feature Abort any messages that do not have
exactly 1 payload byte. It ignores messages where the payload byte is
even, and where it is odd it will reply with the payload byte incremented
by 1. Basically a simple ping-pong command.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-cec.c | 48 ++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
index 941ef4263214..356a988dd6a1 100644
--- a/drivers/media/test-drivers/vivid/vivid-cec.c
+++ b/drivers/media/test-drivers/vivid/vivid-cec.c
@@ -316,15 +316,16 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
 	struct vivid_dev *dev = cec_get_drvdata(adap);
 	struct cec_msg reply;
 	u8 dest = cec_msg_destination(msg);
-	u8 disp_ctl;
-	char osd[14];
 
 	if (cec_msg_is_broadcast(msg))
 		dest = adap->log_addrs.log_addr[0];
 	cec_msg_init(&reply, dest, cec_msg_initiator(msg));
 
 	switch (cec_msg_opcode(msg)) {
-	case CEC_MSG_SET_OSD_STRING:
+	case CEC_MSG_SET_OSD_STRING: {
+		u8 disp_ctl;
+		char osd[14];
+
 		if (!cec_is_sink(adap))
 			return -ENOMSG;
 		cec_ops_set_osd_string(msg, &disp_ctl, osd);
@@ -348,6 +349,47 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
 			break;
 		}
 		break;
+	}
+	case CEC_MSG_VENDOR_COMMAND_WITH_ID: {
+		u32 vendor_id;
+		u8 size;
+		const u8 *vendor_cmd;
+
+		/*
+		 * If we receive <Vendor Command With ID> with our vendor ID
+		 * and with a payload of size 1, and the payload value is odd,
+		 * then we reply with the same message, but with the payload
+		 * byte incremented by 1.
+		 *
+		 * If the size is 1 and the payload value is even, then we
+		 * ignore the message.
+		 *
+		 * The reason we reply to odd instead of even payload values
+		 * is that it allows for testing of the corner case where the
+		 * reply value is 0 (0xff + 1 % 256).
+		 *
+		 * For other sizes we Feature Abort.
+		 *
+		 * This is added for the specific purpose of testing the
+		 * CEC_MSG_FL_REPLY_VENDOR_ID flag using vivid.
+		 */
+		cec_ops_vendor_command_with_id(msg, &vendor_id, &size, &vendor_cmd);
+		if (vendor_id != adap->log_addrs.vendor_id)
+			break;
+		if (size == 1) {
+			// Ignore even op values
+			if (!(vendor_cmd[0] & 1))
+				break;
+			reply.len = msg->len;
+			memcpy(reply.msg + 1, msg->msg + 1, msg->len - 1);
+			reply.msg[msg->len - 1]++;
+		} else {
+			cec_msg_feature_abort(&reply, cec_msg_opcode(msg),
+					      CEC_OP_ABORT_INVALID_OP);
+		}
+		cec_transmit_msg(adap, &reply, false);
+		break;
+	}
 	default:
 		return -ENOMSG;
 	}
-- 
2.43.0


