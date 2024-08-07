Return-Path: <linux-media+bounces-15934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C56094A924
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 15:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E50861F29433
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 13:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047A9200125;
	Wed,  7 Aug 2024 13:56:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994331E4AF
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723038998; cv=none; b=HFUNtndE7vKxbuQxerubXHwY2n02e+nAEHdhAWTUucF07IlAIBszeAl0t28Jeg/dlhyIRH4F+friq2m1XsdQQ4gGuZD019A0WhL+WJVEXNnGnt0USx8JAkwK2o5CA70WIipGFlNiCoj/cVRBpnaxFhZpSBJ1/fxoRq0wiIApxrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723038998; c=relaxed/simple;
	bh=E8o8gYolvQ+B5NJasAyge5cGjqGXdVbERhpj9612UQY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=OfkbfseJ8RUJFttB0QxxR3H8tRnmDLP1tAH+7mEQLhGIYBmctpDNZhITObGXtMp9M9KcLYZDaofPYSB5XmrgfuVUXFnZvzFKDVKxQyoXL1mD/bLgVg8aW0TM0Ksmq3pnHJ8W1Qrb4OvFIf1AB3QoKv+zgD9cpXB7UcAopUrJkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E080EC32781
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 13:56:37 +0000 (UTC)
Message-ID: <4ecbb13d-d95d-4ea4-8580-8c9eb1d26cc0@xs4all.nl>
Date: Wed, 7 Aug 2024 15:56:36 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: uapi/linux/cec.h: cec_msg_set_reply_to: zero flags
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The cec_msg_set_reply_to() helper function never zeroed the
struct cec_msg flags field, this can cause unexpected behavior
if flags was uninitialized to begin with.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 0dbacebede1e ("[media] cec: move the CEC framework out of staging and to media")
Cc: <stable@vger.kernel.org>
---
Resending this patch to check if patchwork is up and running again.
---
 include/uapi/linux/cec.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/cec.h b/include/uapi/linux/cec.h
index 894fffc66f2c..b2af1dddd4d7 100644
--- a/include/uapi/linux/cec.h
+++ b/include/uapi/linux/cec.h
@@ -132,6 +132,8 @@ static inline void cec_msg_init(struct cec_msg *msg,
  * Set the msg destination to the orig initiator and the msg initiator to the
  * orig destination. Note that msg and orig may be the same pointer, in which
  * case the change is done in place.
+ *
+ * It also zeroes the reply, timeout and flags fields.
  */
 static inline void cec_msg_set_reply_to(struct cec_msg *msg,
 					struct cec_msg *orig)
@@ -139,7 +141,9 @@ static inline void cec_msg_set_reply_to(struct cec_msg *msg,
 	/* The destination becomes the initiator and vice versa */
 	msg->msg[0] = (cec_msg_destination(orig) << 4) |
 		      cec_msg_initiator(orig);
-	msg->reply = msg->timeout = 0;
+	msg->reply = 0;
+	msg->timeout = 0;
+	msg->flags = 0;
 }

 /**
-- 
2.43.0


