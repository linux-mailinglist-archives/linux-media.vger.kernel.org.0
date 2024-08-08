Return-Path: <linux-media+bounces-15977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 405B694B98E
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 11:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D6871C210C5
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2024 09:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646821465BF;
	Thu,  8 Aug 2024 09:17:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102B72575F
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723108675; cv=none; b=shZjuVg3iT6E3NFgODWBbwGgtzQ3+5RcgHShqJ1l4/oM8rzccYh5DS7TcdjiMumdC/AnZekA2Jnbs2Kr2b0df2rBdB+wJ0fGWqDwauWVTzF4R0E1ToEGVPR71kwTcWbrhAAFuSLuR/dgrC0ZgRV5t7AsrQiGoAG0JQuyuOKzz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723108675; c=relaxed/simple;
	bh=Aj2Yox6wS+yFsCaz6yghEH8M7zPl9j66nXSp+6hym6Q=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=jCZc15JFJzMEk49R08vyR3kH9Jx0Qlb+iCJ/s4xEQiM1+ynGDZQahx0GIwso9hleWAp4h1+kwf8lEjY5Fy1NPLMvb8KFcREbZ7aCvk49c8lcwRdgjBNdrnllmBkIebwFuWkxBCAzeWz+hS0thkUF4QF4BKdrGJfQkNrwz86nILg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4DDC32782
	for <linux-media@vger.kernel.org>; Thu,  8 Aug 2024 09:17:54 +0000 (UTC)
Message-ID: <e248db9d-cbb9-48e8-a126-9f4d27d7de08@xs4all.nl>
Date: Thu, 8 Aug 2024 11:17:52 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: cec: cec-adap.c: improve CEC_MSG_FL_REPLY_VENDOR_ID
 check
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The new CEC_MSG_FL_REPLY_VENDOR_ID flag only makes sense in combination
with CEC_MSG_VENDOR_COMMAND_WITH_ID. So rather than reporting an error
if that flag is set with another command, just clear the flag instead.

Only keep the message length check, since otherwise the flag would not
make sense.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-adap.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/media/cec/core/cec-adap.c b/drivers/media/cec/core/cec-adap.c
index c81b1ed7c08a..c7d36010c890 100644
--- a/drivers/media/cec/core/cec-adap.c
+++ b/drivers/media/cec/core/cec-adap.c
@@ -781,7 +781,8 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 {
 	struct cec_data *data;
 	bool is_raw = msg_is_raw(msg);
-	bool reply_vendor_id = msg->flags & CEC_MSG_FL_REPLY_VENDOR_ID;
+	bool reply_vendor_id = (msg->flags & CEC_MSG_FL_REPLY_VENDOR_ID) &&
+		msg->len > 1 && msg->msg[1] == CEC_MSG_VENDOR_COMMAND_WITH_ID;
 	int err;

 	if (adap->devnode.unregistered)
@@ -797,7 +798,7 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 	msg->tx_error_cnt = 0;
 	msg->sequence = 0;
 	msg->flags &= CEC_MSG_FL_REPLY_TO_FOLLOWERS | CEC_MSG_FL_RAW |
-		      CEC_MSG_FL_REPLY_VENDOR_ID;
+		      (reply_vendor_id ? CEC_MSG_FL_REPLY_VENDOR_ID : 0);

 	if ((reply_vendor_id || msg->reply) && msg->timeout == 0) {
 		/* Make sure the timeout isn't 0. */
@@ -812,9 +813,9 @@ int cec_transmit_msg_fh(struct cec_adapter *adap, struct cec_msg *msg,
 		dprintk(1, "%s: invalid length %d\n", __func__, msg->len);
 		return -EINVAL;
 	}
-	if (reply_vendor_id &&
-	    (msg->len < 6 || msg->msg[1] != CEC_MSG_VENDOR_COMMAND_WITH_ID)) {
-		dprintk(1, "%s: message too short or not <Vendor Command With ID>\n", __func__);
+	if (reply_vendor_id && msg->len < 6) {
+		dprintk(1, "%s: <Vendor Command With ID> message too short\n",
+			__func__);
 		return -EINVAL;
 	}

-- 
2.43.0


