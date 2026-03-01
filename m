Return-Path: <linux-media+bounces-53967-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMq5M9Sao2kwIAUAu9opvQ
	(envelope-from <linux-media+bounces-53967-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:48:04 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A21CBC99
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45D663040019
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB442D3EC7;
	Sun,  1 Mar 2026 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSM9FuXa"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2A81A3165;
	Sun,  1 Mar 2026 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329364; cv=none; b=IK/IYVnXcD9gcdENCw8tGY/QtfSLAw7TqNMHnEPBEq0iDltDETQgeJF47VfPLqbny94Tmzz4A9LXEQte29f7WMlh9l7Ja9LHmOYQlYRaL4OUCQJbiKn9dCjmzJbSU2dLBRETwvB+bZ7vKtnGGaJ7v2CV64pV6/eaVfQkSHq+SlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329364; c=relaxed/simple;
	bh=AWeITYXqDp7opqHtWU2Zdvjkm1c6YHRb8mlaS7wsQYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ihz42Vyk+m0BifFqSfT4z8MhHd6AvCFmfa46Y+ve4jWFmxaHmzugtysmcb1hNLvt1v04/0+1XDJyynzGumXJUSi1Eym2JdEk2XHOAhaE2x3V3s9MrV4V+tYaLIUaWxx5AixeLJ8qIBKuIQvr+CtA19cAuS2IaZDmH5pc5Q9sqHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSM9FuXa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28C2C19421;
	Sun,  1 Mar 2026 01:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329364;
	bh=AWeITYXqDp7opqHtWU2Zdvjkm1c6YHRb8mlaS7wsQYI=;
	h=From:To:Cc:Subject:Date:From;
	b=gSM9FuXa0HgTJ1/XEzne2TebJmEZ1i3xscXWe/n59QRGU4+GxqC4LadBg/0okTc/W
	 KVyCH2V2nOyZ9GYFeigIu8LV2xLo0OuKNRrILnuZ5ZxGJdKiacHWaCSYYahROu6ky/
	 eVRLOtns+aOrgWSBJZJQYtqDJ+iwjBL5NuJzuidGO275Ojrv3SdM5Qd+bXkD6kIkMA
	 UAw3KP3rRNz/z9ZkcosD879X5YmY+Hdlc/8VeFDZIoozqcwoLgS0WOShm+LRnQ1vvX
	 aZQDhpalsHrexIR9jWZuha/G20bQuuH5sJZsGx6j687O9M+XSRAMnjzK4wkjzlaYDa
	 ZUpatfsnogL1g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	renjiang.han@oss.qualcomm.com
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "media: venus: vdec: fix error state assignment for zero bytesused" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:42:42 -0500
Message-ID: <20260301014242.1704630-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53967-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 645A21CBC99
X-Rspamd-Action: no action

The patch below does not apply to the 6.1-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 93ecd6ee95c38cb533fa25f48d3c1c8cb69f410f Mon Sep 17 00:00:00 2001
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 15:20:39 +0530
Subject: [PATCH] media: venus: vdec: fix error state assignment for zero
 bytesused

When hfi_session_flush is issued, all queued buffers are returned to
the V4L2 driver. Some of these buffers are not processed and have
bytesused = 0. Currently, the driver marks such buffers as error even
during drain operations, which can incorrectly flag EOS buffers.

Only capture buffers with zero payload (and not EOS) should be marked
with VB2_BUF_STATE_ERROR. The check is performed inside the non-EOS
branch to ensure correct handling.

Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf7..d0bd2d86a31f9 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 			}
+		} else {
+			if (!bytesused)
+				state = VB2_BUF_STATE_ERROR;
 		}
-
-		if (!bytesused)
-			state = VB2_BUF_STATE_ERROR;
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}
-- 
2.51.0





