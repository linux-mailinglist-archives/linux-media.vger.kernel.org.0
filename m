Return-Path: <linux-media+bounces-15341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590693C12F
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 13:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48D3E1F22843
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2024 11:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFBF19938A;
	Thu, 25 Jul 2024 11:54:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D935E12B64
	for <linux-media@vger.kernel.org>; Thu, 25 Jul 2024 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721908451; cv=none; b=LAqZ/baW55ULfVhVS5VspA3hTbIJ64DJk0Ohjlr6i2g/KUQ06gxnA0WSzj78DihgPXXTstXfFWXzvSxEsg15DB4xOxgxISj1jDXY/u0oc5icWKoNC19+YbEB5W4NYt1M2p/hHUlIK7LzuOyAcWlNhklWzBzekJmJjUgkFchu78g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721908451; c=relaxed/simple;
	bh=uJEuoHa92m10jrhGL47/LnSb3ZrWV03MriOxrZuDArU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOsKzAX0OylNyF2YRkTQV2Ibpmre7vydEdEJBLUPiCrdm6dKuKF33Fa1AbyET44ejtDuv/6JlUtSLXUbbDK5raAR75SXofBhc7zh8Mzqt15SJ8qIDpSN+/hry5bjL/ZC2qN7YaVIjjrJkuQjnqj8al9SLV6l3PVSm74Qu/nraxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5BDCC32782;
	Thu, 25 Jul 2024 11:54:10 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/2] cec-ctl: add support for CEC_MSG_FL_REPLY_VENDOR_ID
Date: Thu, 25 Jul 2024 13:52:09 +0200
Message-ID: <5b3e6ed2ea5296e823f64a363415caba133f705f.1721908330.git.hverkuil-cisco@xs4all.nl>
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

Add support for the new CEC_MSG_FL_REPLY_VENDOR_ID flag and the
new CEC_CAP_REPLY_VENDOR_ID capability.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 utils/cec-ctl/cec-ctl.cpp      | 9 +++++++--
 utils/libcecutil/cec-info.cpp  | 2 ++
 utils/libcecutil/cec-parse.cpp | 2 +-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/utils/cec-ctl/cec-ctl.cpp b/utils/cec-ctl/cec-ctl.cpp
index f7ba7409..eec16377 100644
--- a/utils/cec-ctl/cec-ctl.cpp
+++ b/utils/cec-ctl/cec-ctl.cpp
@@ -2609,6 +2609,7 @@ int main(int argc, char **argv)
 		case OptVendorCommandWithID: {
 			static constexpr const char *arg_names[] = {
 				"vendor-id",
+				"reply",
 				"cmd",
 				nullptr
 			};
@@ -2623,6 +2624,10 @@ int main(int argc, char **argv)
 					vendor_id = strtol(value, nullptr, 0);
 					break;
 				case 1:
+					msg.reply = strtol(value, &endptr, 0L);
+					msg.flags = CEC_MSG_FL_REPLY_VENDOR_ID;
+					break;
+				case 2:
 					while (size < sizeof(bytes)) {
 						bytes[size++] = strtol(value, &endptr, 0L);
 						if (endptr == value) {
@@ -3164,9 +3169,9 @@ int main(int argc, char **argv)
 		to = msg.msg[0] & 0xf;
 		printf("\nTransmit from %s to %s (%d to %d):\n",
 		       cec_la2s(from), to == 0xf ? "all" : cec_la2s(to), from, to);
-		msg.flags = options[OptReplyToFollowers] ? CEC_MSG_FL_REPLY_TO_FOLLOWERS : 0;
+		msg.flags |= options[OptReplyToFollowers] ? CEC_MSG_FL_REPLY_TO_FOLLOWERS : 0;
 		msg.flags |= options[OptRawMsg] ? CEC_MSG_FL_RAW : 0;
-		msg.timeout = msg.reply ? timeout : 0;
+		msg.timeout = (msg.flags & CEC_MSG_FL_REPLY_VENDOR_ID) || msg.reply ? timeout : 0;
 		cec_log_msg(&msg);
 		if (doioctl(&node, CEC_TRANSMIT, &msg))
 			continue;
diff --git a/utils/libcecutil/cec-info.cpp b/utils/libcecutil/cec-info.cpp
index dce7effd..bc2a0ca6 100644
--- a/utils/libcecutil/cec-info.cpp
+++ b/utils/libcecutil/cec-info.cpp
@@ -64,6 +64,8 @@ static std::string caps2s(unsigned caps)
 		s += "\t\tMonitor Pin\n";
 	if (caps & CEC_CAP_CONNECTOR_INFO)
 		s += "\t\tConnector Info\n";
+	if (caps & CEC_CAP_REPLY_VENDOR_ID)
+		s += "\t\tReply Vendor ID\n";
 	return s;
 }
 
diff --git a/utils/libcecutil/cec-parse.cpp b/utils/libcecutil/cec-parse.cpp
index aa703136..f78a8f8a 100644
--- a/utils/libcecutil/cec-parse.cpp
+++ b/utils/libcecutil/cec-parse.cpp
@@ -208,7 +208,7 @@ static unsigned parse_latency(const char *value)
 #define VENDOR_EXTRA \
 	"  --vendor-command payload=<byte>[:<byte>]*\n" \
 	"                                  Send VENDOR_COMMAND message (" xstr(CEC_MSG_VENDOR_COMMAND) ")\n" \
-	"  --vendor-command-with-id vendor-id=<val>,cmd=<byte>[:<byte>]*\n" \
+	"  --vendor-command-with-id vendor-id=<val>,[reply=<reply>,]cmd=<byte>[:<byte>]*\n" \
 	"                                  Send VENDOR_COMMAND_WITH_ID message (" xstr(CEC_MSG_VENDOR_COMMAND_WITH_ID) ")\n" \
 	"  --vendor-remote-button-down rc-code=<byte>[:<byte>]*\n" \
 	"                                  Send VENDOR_REMOTE_BUTTON_DOWN message (" xstr(CEC_MSG_VENDOR_REMOTE_BUTTON_DOWN) ")\n"
-- 
2.43.0


