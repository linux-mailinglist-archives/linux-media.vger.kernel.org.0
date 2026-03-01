Return-Path: <linux-media+bounces-53935-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFjFMjSao2kwIAUAu9opvQ
	(envelope-from <linux-media+bounces-53935-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:45:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 131131CB928
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D38D3001A48
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045142DF13E;
	Sun,  1 Mar 2026 01:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0BDmrTL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C0C2C0F84;
	Sun,  1 Mar 2026 01:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328724; cv=none; b=AuTpcyaRwEqjPiyCaPzY6W2PbHAKDisgOoXALWft/kQxM/E3HgsXIgX6x35zvsoCUfQWDD6g6xVT2UpjzkjnczvYGEZqs9C6UMVH+7oc2V884IKUhd1XWxaae3MHhvjLOiJUW7x2DumS5iay+04Hmqon197Btyf6fINOKjz/Rgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328724; c=relaxed/simple;
	bh=pikY6puovR2wt/GxCmYs2PC5EKriRs9N2hhv+siZf9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O3wXHhAFO2D7hVBbEW7DaLf4sXfudu11W5K5JBtbSWBy/aT21T9RWEWnbNzH9WiQ8c9DuYpAI0K4GGGWwDQpaYCNP5do/safllNMpAGRnheDv47IOVn8mpL3wCKzGCjmWya7tRMf6IQQQ0k/XwRf3LWEH+a1UxYh1X/yXmZhLXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0BDmrTL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A856C19421;
	Sun,  1 Mar 2026 01:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328724;
	bh=pikY6puovR2wt/GxCmYs2PC5EKriRs9N2hhv+siZf9c=;
	h=From:To:Cc:Subject:Date:From;
	b=m0BDmrTL3rG9JgkKm3Ezkx4+uGAaXHN4JpPtDQL4z4I8LVxUlJJVvjj7dJB2ER1aO
	 j58lDbiL5bEnjuSrkXTS9eQr7WY0M+htoVX6YsCt91azDO7nHZPFRo4B7o1KNE4ENp
	 5EGqXBdUm3dsgTB2dNk5tzblX3pZwhPWLV+KSqsYTtdKn3DFYfAziz7GZJ1Pd/5kP8
	 DEE32ivfcIgXFrloobzmq9Ut97ljlRVrxwJ3z0lI0hr+GM4zR8QiGiLNUiJnvw2eIY
	 hwsTJIUzyTblWM6bzmb7VYlQH4h+RRB50VzukduKFa6xHTnPck9eIFS4E6y+64izKi
	 CdHsWdH7vu9+g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alperyasinak1@gmail.com
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:32:02 -0500
Message-ID: <20260301013202.1690800-1-sashal@kernel.org>
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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53935-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 131131CB928
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From d965919af524e68cb2ab1a685872050ad2ee933d Mon Sep 17 00:00:00 2001
From: Alper Ak <alperyasinak1@gmail.com>
Date: Mon, 29 Dec 2025 10:52:17 +0300
Subject: [PATCH] media: qcom: camss: vfe: Fix out-of-bounds access in
 vfe_isr_reg_update()

vfe_isr() iterates using MSM_VFE_IMAGE_MASTERS_NUM(7) as the loop
bound and passes the index to vfe_isr_reg_update(). However,
vfe->line[] array is defined with VFE_LINE_NUM_MAX(4):

    struct vfe_line line[VFE_LINE_NUM_MAX];

When index is 4, 5, 6, the access to vfe->line[line_id] exceeds
the array bounds and resulting in out-of-bounds memory access.

Fix this by using separate loops for output lines and write masters.

Fixes: 4edc8eae715c ("media: camss: Add initial support for VFE hardware version Titan 480")
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 4feea590a47bc..d73f733fde045 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -202,11 +202,13 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 		writel_relaxed(status, vfe->base + VFE_BUS_IRQ_CLEAR(0));
 		writel_relaxed(1, vfe->base + VFE_BUS_IRQ_CLEAR_GLOBAL);
 
-		/* Loop through all WMs IRQs */
-		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
+		for (i = 0; i < MAX_VFE_OUTPUT_LINES; i++) {
 			if (status & BUS_IRQ_MASK_0_RDI_RUP(vfe, i))
 				vfe_isr_reg_update(vfe, i);
+		}
 
+		/* Loop through all WMs IRQs */
+		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
 			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
 				vfe_buf_done(vfe, i);
 		}
-- 
2.51.0





