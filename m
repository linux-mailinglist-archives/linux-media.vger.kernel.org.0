Return-Path: <linux-media+bounces-41952-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF57B4846C
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 08:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBAC93BA772
	for <lists+linux-media@lfdr.de>; Mon,  8 Sep 2025 06:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E318F2DF714;
	Mon,  8 Sep 2025 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZxfv0p4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA821E1E1E
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757314185; cv=none; b=fHKhYOfTTnMLQVfRuFUoU6hG9oQBOd0yrwySKKuys+Mk5eS6qXBl3pC1UUPs58c8JKWbrqn+Q6vKAPFCedwFP2CGuyCKh9xwrx+dT2sU39D32Zjk6/XwKBiPL+Ry/5M1QR89IAYBMMc1/Gg0jLzgbiAtRqO2vrkv0NqomP5ULDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757314185; c=relaxed/simple;
	bh=LM7VxyGsLs5M2XOXjO8TDmvLxI0rWqpYvtsTN2iDKno=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=fYjqn9irrezN9VtrF1G8QpJdqL9wfqhKobIkLM5S9eDuemfF+RiNNceGbSlBm7XJofX6Li9ZkhwNLW57hwyS/ByYYRtshN9X/lYFKdFj/74PDquLGXgiH6EFkvCdCgcFlg5ns6Wf6gvv2tx0eUrgj4EGeeqfLwVDQmyo8s6i9/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZxfv0p4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8FDC4CEF5
	for <linux-media@vger.kernel.org>; Mon,  8 Sep 2025 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757314184;
	bh=LM7VxyGsLs5M2XOXjO8TDmvLxI0rWqpYvtsTN2iDKno=;
	h=Date:From:Subject:To:From;
	b=PZxfv0p4v5MT0cNiRZbeuTKgEpYBjQM3jOk704ACa8izZc7Bauuh5LaPuRjUzCMOc
	 JxyO/Jq9TOmREQeN8wpxDcrEW015FBytdfqNRJKyJyb68ARLuH4ovgRNww0UpkoVNF
	 vrC7rzRWyuxSgbHeJ9kczp+WCOVrEXZssHmHTgejsRZQqkIpVJDrW4eqKEq0W9VqUH
	 RGjDZN57ETulH/wEeII8YQZqPSzzZI0e8CZ/IamOtPjl7qfzGlQ4O209/+9RBuKkGe
	 ALJz4OgbEV+X7AYJYIapYH1qW1GDvjfmudPKQIDa9ZmpLHBjN2Q3ZL2fXlxjGNvzJ1
	 UQfAsu1QHUkTA==
Message-ID: <5b0cbda3-0c70-4022-9d88-de9fd372d27d@kernel.org>
Date: Mon, 8 Sep 2025 08:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH] media: vivid: fix disappearing <Vendor Command With ID>
 messages
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The vivid driver supports the <Vendor Command With ID> message,
but if the Vendor ID of the received message didn't match the Vendor ID
of the CEC Adapter, then it ignores it (good) and returns 0 (bad).

It should return -ENOMSG to indicate that other followers should be
asked to handle it. Return code 0 means that the driver handled it,
which is wrong in this case.

As a result, userspace followers never get the chance to process such a
message.

Refactor the code a bit to have the function return -ENOMSG at the end,
drop the default case, and ensure that the message handlers return 0.

That way 0 is only returned if the message is actually handled in the
vivid_received() function.

Fixes: 812765cd6954 ("media: vivid: add <Vendor Command With ID> support")
Cc: stable@vger.kernel.org
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/test-drivers/vivid/vivid-cec.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-cec.c b/drivers/media/test-drivers/vivid/vivid-cec.c
index 356a988dd6a1..2d15fdd5d999 100644
--- a/drivers/media/test-drivers/vivid/vivid-cec.c
+++ b/drivers/media/test-drivers/vivid/vivid-cec.c
@@ -327,7 +327,7 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
 		char osd[14];

 		if (!cec_is_sink(adap))
-			return -ENOMSG;
+			break;
 		cec_ops_set_osd_string(msg, &disp_ctl, osd);
 		switch (disp_ctl) {
 		case CEC_OP_DISP_CTL_DEFAULT:
@@ -348,7 +348,7 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
 			cec_transmit_msg(adap, &reply, false);
 			break;
 		}
-		break;
+		return 0;
 	}
 	case CEC_MSG_VENDOR_COMMAND_WITH_ID: {
 		u32 vendor_id;
@@ -379,7 +379,7 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
 		if (size == 1) {
 			// Ignore even op values
 			if (!(vendor_cmd[0] & 1))
-				break;
+				return 0;
 			reply.len = msg->len;
 			memcpy(reply.msg + 1, msg->msg + 1, msg->len - 1);
 			reply.msg[msg->len - 1]++;
@@ -388,12 +388,10 @@ static int vivid_received(struct cec_adapter *adap, struct cec_msg *msg)
 					      CEC_OP_ABORT_INVALID_OP);
 		}
 		cec_transmit_msg(adap, &reply, false);
-		break;
+		return 0;
 	}
-	default:
-		return -ENOMSG;
 	}
-	return 0;
+	return -ENOMSG;
 }

 static const struct cec_adap_ops vivid_cec_adap_ops = {
-- 
2.47.2



