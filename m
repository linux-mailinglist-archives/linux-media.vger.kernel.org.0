Return-Path: <linux-media+bounces-53944-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JQABKyao2kwIAUAu9opvQ
	(envelope-from <linux-media+bounces-53944-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:47:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 983891CBB84
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B2AD3098742
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03253299A84;
	Sun,  1 Mar 2026 01:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQaV/4M2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A71D2C11DE;
	Sun,  1 Mar 2026 01:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328809; cv=none; b=m+bCeN3BReNfQE+WT1rmjHMZ0XjitCt0wDd4VnRls7g7syoeISqrc1OWbs2hWhGAX74XO9bAwkW3ZNDwrS4fokSDm9PCUeUwN0HNPLTwqdUJ13BewHJNyZoM9PhyXL4zsqrQqTmIiuyR3v9XxVJjDe8/y0rYyX1nDR3lMPkmnxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328809; c=relaxed/simple;
	bh=T60yvjC+wrrKaiJC2NzibWNn8VluSv61fFrxfxbavlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lOv1SE1ybcJGYu9dC6wHIkUcrPR6UKP8GCDm7U/9uWrl8QEyFPsBULISKscFolNnoouzC5BscTWcbmalLdyqJ/PYytYygXDY4hVCNj4zj+c/z0M1jNCCxcwfUuUitMf0T7x138xlEfj/yGwW7gIO6c7fGHcQsXrNZ9mi+PvsW6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQaV/4M2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DCE6C19421;
	Sun,  1 Mar 2026 01:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328809;
	bh=T60yvjC+wrrKaiJC2NzibWNn8VluSv61fFrxfxbavlY=;
	h=From:To:Cc:Subject:Date:From;
	b=nQaV/4M20XQjckFdvcTAFEMWiclT4wVE9xX25IPGB5ks8M5KUepKXExVgL8H0gOP8
	 TarejYlSh0el1lC55r1Rfs9Q02cvbvNYt3bQNwLx17JdF3Zfg2RaELODrqAPcJPaYr
	 5JQXgSCLmzFjfGQVKDvwKwlxsIYT5KFdjuhN/ryfv9NuKBAZz2rP4Dj7T4VNPXpjb8
	 n4AjCbaB2WT6ISVVDWJQy9wLINET7NW2L1G88hALZtr1QKNTQm6Xd5VwquVrDr47C2
	 jeBhtVpxamjyZB9Vuti84CcE9A1Cv2CDL80OR8R+jNapIUwdFJWXb8+TlzLvRBBul8
	 eNRpa44cBICAA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	renjiang.han@oss.qualcomm.com
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "media: venus: vdec: fix error state assignment for zero bytesused" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:33:27 -0500
Message-ID: <20260301013327.1692685-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53944-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 983891CBB84
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
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





