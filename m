Return-Path: <linux-media+bounces-15893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B116094A193
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 09:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4A881C25294
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 07:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBF98F77;
	Wed,  7 Aug 2024 07:22:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C2F1C7B7D
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 07:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723015333; cv=none; b=Ascwpl3fZ0cP6N2ZlrlGx4augBszen/3Y9TMpVq8RLnTrsDbyGm+x2QrRGYk4Bgo6A76aOpgT8yzxBXKgqVKsjAxMk32jDU8Hacg6iIvDVB5Do1ZEApNJlNT/u5W7bqYkZYBNBg9Qtdl3qZxg9IHewfUor2/JbObnG7Zr7qM6wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723015333; c=relaxed/simple;
	bh=DE/pRojyyPMxn0P1Fez2MzyaAcJqp+gHtFi7swcXtBA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=p++rKzBiU66Qj976TXmURzUGYXD/RK4DWrOYv838jEk6ygaWKdFslLDT+m2Ro6RpkgrFkffLP/Ldkhy/pod1NEBJk/kXRQPqOz4iV0iDmhhimJT7oaFcRCrObG03jwuroPOA5qm4oXt01LPV8hq5Tvw/EYMLS0UUpcGYo1q6EV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB70C4AF0B
	for <linux-media@vger.kernel.org>; Wed,  7 Aug 2024 07:22:12 +0000 (UTC)
Message-ID: <ed196518-03a1-416d-b1c1-abced2307518@xs4all.nl>
Date: Wed, 7 Aug 2024 09:22:10 +0200
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
Subject: [PATCH] media: uapi/linux/cec.h: cec_msg_set_reply_to: zero flags
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The cec_msg_set_reply_to() helper function never zeroed the
struct cec_msg flags field, this can cause unexpected behavior
if flags was uninitialized to begin with.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 0dbacebede1e ("[media] cec: move the CEC framework out of staging and to media")
Cc: <stable@vger.kernel.org>
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


