Return-Path: <linux-media+bounces-15337-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC993C115
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 13:46:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6C51F21A64
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 11:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C73719922A;
	Thu, 25 Jul 2024 11:46:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366973C3C
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721907996; cv=none; b=ssIqLbry3hqwdvt56p6kZqu8Z4d06zLMKRK5rgKh8MnkLbnwYxtgUw4tEbs8NIgOeIIeSj/3+UI/ESb1XeVC1F4zPSgppEnKsk1IUID/fcZBrsq/3d3mfzUbj/bNd0aw8PIrBKxwO7/iUUQQzPejLGa2uLjP6CyULmDB6UT40no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721907996; c=relaxed/simple;
	bh=kFbgkMZ8A1JmmmDoTtKPPi5/sulHcnj21++yWBME/os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MSP05vPuW6hio4TnBM34WPLW9RUHm/Sz8JUJ+Y/RC+DFGIn5z2CDaAHgDqOY7YIMjCJqxNEs62gPo7RwIet8/lJq70f8mSku7wEubsysnLvdEKYrB0ubV8bJGSgrEoTLbnMpVFkbO8jdfBaZl8ZVQdqyC9eujLVOuKVOU+4QG/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28137C32782;
	Thu, 25 Jul 2024 11:46:34 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] media: cec: core: add new CEC_MSG_FL_REPLY_VENDOR_ID flag
Date: Thu, 25 Jul 2024 13:41:54 +0200
Message-ID: <faf577b84e3045742e96e22244b54bf5175794d8.1721907715.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1721907715.git.hverkuil-cisco@xs4all.nl>
References: <cover.1721907715.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If this flag is set, then the reply is expected to consist of
the CEC_MSG_VENDOR_COMMAND_WITH_ID opcode followed by the Vendor ID (as
used in bytes 1-4 of the message), followed by the struct cec_msg reply
field.

Note that this assumes that the byte after the Vendor ID is a
vendor-specific opcode.

This flag makes it easier to wait for replies to vendor commands,
using the same CEC framework support for waiting for regular replies.

Support for this flag is indicated by setting the new
CEC_CAP_REPLY_VENDOR_ID capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/cec/cec-ioc-adap-g-caps.rst         |  6 +++
 .../media/cec/cec-ioc-receive.rst             | 15 ++++++
 drivers/media/cec/core/cec-adap.c             | 54 +++++++++++++------
 drivers/media/cec/core/cec-core.c             |  2 +-
 include/media/cec.h                           |  2 +
 include/uapi/linux/cec.h                      |  3 ++
 6 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
index d5e014ce19b5..1d5248979a6d 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-adap-g-caps.rst
@@ -137,6 +137,12 @@ returns the information to the application. The ioctl never fails.
       - 0x00000100
       - If this capability is set, then :ref:`CEC_ADAP_G_CONNECTOR_INFO` can
         be used.
+    * .. _`CEC-CAP-REPLY-VENDOR-ID`:
+
+      - ``CEC_CAP_REPLY_VENDOR_ID``
+      - 0x00000200
+      - If this capability is set, then
+        :ref:`CEC_MSG_FL_REPLY_VENDOR_ID <cec-msg-flags>` can be used.
 
 Return Value
 ============
diff --git a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
index 364938ad34df..91df807b6e96 100644
--- a/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
+++ b/Documentation/userspace-api/media/cec/cec-ioc-receive.rst
@@ -232,6 +232,21 @@ View On' messages from initiator 0xf ('Unregistered') to destination 0 ('TV').
 	capability. If that is not set, then the ``EPERM`` error code is
 	returned.
 
+    * .. _`CEC-MSG-FL-REPLY-VENDOR-ID`:
+
+      - ``CEC_MSG_FL_REPLY_VENDOR_ID``
+      - 4
+      - This flag is only available if ``CEC_CAP_REPLY_VENDOR_ID`` capability
+	is set. If this flag is set, then the reply is expected to consist of
+	the ``CEC_MSG_VENDOR_COMMAND_WITH_ID`` opcode followed by the Vendor ID
+	(as used in bytes 1-4 of the message), followed by the
+	``struct cec_msg`` ``reply`` field.
+
+	Note that this assumes that the byte after the Vendor ID is a
+	vendor-specific opcode.
+
+	This flag makes it easier to wait for replies to vendor commands.
+
 .. tabularcolumns:: |p{5.6cm}|p{0.9cm}|p{10.8cm}|
 
 .. _cec-tx-status:
diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index da09834990b8..f1b912bcdacf 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -673,8 +673,9 @@ void cec_transmit_done_ts(struct cec_adapter *adap, u8 status,
 		/* Retry this message */
 		data->attempts -= attempts_made;
 		if (msg->timeout)
-			dprintk(2, "retransmit: %*ph (attempts: %d, wait for 0x%02x)\n",
-				msg->len, msg->msg, data->attempts, msg->reply);
+			dprintk(2, "retransmit: %*ph (attempts: %d, wait for %*ph)\n",
+				msg->len, msg->msg, data->attempts,
+				data->match_len, data->match_reply);
 		else
 			dprintk(2, "retransmit: %*ph (attempts: %d)\n",
 				msg->len, msg->msg, data->attempts);
@@ -780,6 +781,7 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 {
 	struct cec_data *data;
 	bool is_raw = msg_is_raw(msg);
+	bool reply_vendor_id = msg->flags & CEC_MSG_FL_REPLY_VENDOR_ID;
 	int err;
 
 	if (adap->devnode.unregistered)
@@ -794,12 +796,13 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	msg->tx_low_drive_cnt = 0;
 	msg->tx_error_cnt = 0;
 	msg->sequence = 0;
+	msg->flags &= CEC_MSG_FL_REPLY_TO_FOLLOWERS | CEC_MSG_FL_RAW |
+		      CEC_MSG_FL_REPLY_VENDOR_ID;
 
-	if (msg->reply && msg->timeout == 0) {
+	if ((reply_vendor_id || msg->reply) && msg->timeout == 0) {
 		/* Make sure the timeout isn't 0. */
 		msg->timeout = 1000;
 	}
-	msg->flags &= CEC_MSG_FL_REPLY_TO_FOLLOWERS | CEC_MSG_FL_RAW;
 
 	if (!msg->timeout)
 		msg->flags &= ~CEC_MSG_FL_REPLY_TO_FOLLOWERS;
@@ -809,6 +812,11 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 		dprintk(1, "%s: invalid length %d\n", __func__, msg->len);
 		return -EINVAL;
 	}
+	if (reply_vendor_id &&
+	    (msg->len < 6 || msg->msg[1] != CEC_MSG_VENDOR_COMMAND_WITH_ID)) {
+		dprintk(1, "%s: message too short or not <Vendor Command With ID>\n", __func__);
+		return -EINVAL;
+	}
 
 	memset(msg->msg + msg->len, 0, sizeof(msg->msg) - msg->len);
 
@@ -900,8 +908,9 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 				__func__);
 			return -ENONET;
 		}
-		if (msg->reply) {
-			dprintk(1, "%s: invalid msg->reply\n", __func__);
+		if (reply_vendor_id || msg->reply) {
+			dprintk(1, "%s: adapter is unconfigured so reply is not supported\n",
+				__func__);
 			return -EINVAL;
 		}
 	}
@@ -923,6 +932,14 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	data->fh = fh;
 	data->adap = adap;
 	data->blocking = block;
+	if (reply_vendor_id) {
+		memcpy(data->match_reply, msg->msg + 1, 4);
+		data->match_reply[4] = msg->reply;
+		data->match_len = 5;
+	} else if (msg->timeout) {
+		data->match_reply[0] = msg->reply;
+		data->match_len = 1;
+	}
 
 	init_completion(&data->c);
 	INIT_DELAYED_WORK(&data->work, cec_wait_timeout);
@@ -1211,13 +1228,15 @@ void cec_received_msg_ts(struct cec_adapter *adap,
 			if (!abort && dst->msg[1] == CEC_MSG_INITIATE_ARC &&
 			    (cmd == CEC_MSG_REPORT_ARC_INITIATED ||
 			     cmd == CEC_MSG_REPORT_ARC_TERMINATED) &&
-			    (dst->reply == CEC_MSG_REPORT_ARC_INITIATED ||
-			     dst->reply == CEC_MSG_REPORT_ARC_TERMINATED))
+			    (data->match_reply[0] == CEC_MSG_REPORT_ARC_INITIATED ||
+			     data->match_reply[0] == CEC_MSG_REPORT_ARC_TERMINATED)) {
 				dst->reply = cmd;
+				data->match_reply[0] = cmd;
+			}
 
 			/* Does the command match? */
-			if ((abort && cmd != dst->msg[1]) ||
-			    (!abort && cmd != dst->reply))
+			if ((abort && cmd != data->match_reply[0]) ||
+			    (!abort && memcmp(data->match_reply, msg->msg + 1, data->match_len)))
 				continue;
 
 			/* Does the addressing match? */
@@ -2318,18 +2337,21 @@ int cec_adap_status(struct seq_file *file, void *priv)
 	}
 	data = adap->transmitting;
 	if (data)
-		seq_printf(file, "transmitting message: %*ph (reply: %02x, timeout: %ums)\n",
-			   data->msg.len, data->msg.msg, data->msg.reply,
+		seq_printf(file, "transmitting message: %*ph (reply: %*ph, timeout: %ums)\n",
+			   data->msg.len, data->msg.msg,
+			   data->match_len, data->match_reply,
 			   data->msg.timeout);
 	seq_printf(file, "pending transmits: %u\n", adap->transmit_queue_sz);
 	list_for_each_entry(data, &adap->transmit_queue, list) {
-		seq_printf(file, "queued tx message: %*ph (reply: %02x, timeout: %ums)\n",
-			   data->msg.len, data->msg.msg, data->msg.reply,
+		seq_printf(file, "queued tx message: %*ph (reply: %*ph, timeout: %ums)\n",
+			   data->msg.len, data->msg.msg,
+			   data->match_len, data->match_reply,
 			   data->msg.timeout);
 	}
 	list_for_each_entry(data, &adap->wait_queue, list) {
-		seq_printf(file, "message waiting for reply: %*ph (reply: %02x, timeout: %ums)\n",
-			   data->msg.len, data->msg.msg, data->msg.reply,
+		seq_printf(file, "message waiting for reply: %*ph (reply: %*ph, timeout: %ums)\n",
+			   data->msg.len, data->msg.msg,
+			   data->match_len, data->match_reply,
 			   data->msg.timeout);
 	}
 
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 6f940df0230c..e0756826d629 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -273,7 +273,7 @@ struct cec_adapter *cec_allocate_adapter(const struct cec_adap_ops *ops,
 	adap->cec_pin_is_high = true;
 	adap->log_addrs.cec_version = CEC_OP_CEC_VERSION_2_0;
 	adap->log_addrs.vendor_id = CEC_VENDOR_ID_NONE;
-	adap->capabilities = caps;
+	adap->capabilities = caps | CEC_CAP_REPLY_VENDOR_ID;
 	if (debug_phys_addr)
 		adap->capabilities |= CEC_CAP_PHYS_ADDR;
 	adap->needs_hpd = caps & CEC_CAP_NEEDS_HPD;
diff --git a/include/media/cec.h b/include/media/cec.h
index d131514032f2..07d2ee8a3904 100644
--- a/include/media/cec.h
+++ b/include/media/cec.h
@@ -66,6 +66,8 @@ struct cec_data {
 	struct list_head xfer_list;
 	struct cec_adapter *adap;
 	struct cec_msg msg;
+	u8 match_len;
+	u8 match_reply[5];
 	struct cec_fh *fh;
 	struct delayed_work work;
 	struct completion c;
diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index b8e071abaea5..894fffc66f2c 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -165,6 +165,7 @@ static inline int cec_msg_recv_is_rx_result(const struct cec_msg *msg)
 /* cec_msg flags field */
 #define CEC_MSG_FL_REPLY_TO_FOLLOWERS	(1 << 0)
 #define CEC_MSG_FL_RAW			(1 << 1)
+#define CEC_MSG_FL_REPLY_VENDOR_ID	(1 << 2)
 
 /* cec_msg tx/rx_status field */
 #define CEC_TX_STATUS_OK		(1 << 0)
@@ -339,6 +340,8 @@ static inline int cec_is_unconfigured(__u16 log_addr_mask)
 #define CEC_CAP_MONITOR_PIN	(1 << 7)
 /* CEC_ADAP_G_CONNECTOR_INFO is available */
 #define CEC_CAP_CONNECTOR_INFO	(1 << 8)
+/* CEC_MSG_FL_REPLY_VENDOR_ID is available */
+#define CEC_CAP_REPLY_VENDOR_ID	(1 << 9)
 
 /**
  * struct cec_caps - CEC capabilities structure.
-- 
2.43.0


