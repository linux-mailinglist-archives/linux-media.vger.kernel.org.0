Return-Path: <linux-media+bounces-53898-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DtqBJqUo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53898-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B2B1CA424
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7249130217CA
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECBC27FD76;
	Sun,  1 Mar 2026 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgmM0EMT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCDE13B7AE;
	Sun,  1 Mar 2026 01:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328026; cv=none; b=YdTo0EVhfhKlfIHiZK+bEFb7SddO7rp47t8XaMsmH8GTzsm34DNmO2fQIGaWqB4xNzQp1mFgsm+Y6a2E3HEaXcBoJrvdAA5Yc/oPvbh/tBJ50nci4nTj+PdD/QGmg4GwjHqp0spg9fcZLt5d9Kj72SZ699MNP/FAwML4uj64A/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328026; c=relaxed/simple;
	bh=yKeu7jjKreibOu2e/GYMYT8WtLaNhKAhPL1K/ng8tQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PiwTF3+dT+yLKdc0DTA7Zpwvk8WstdbeYyebz5e0k2WzhDIroVyF6wFt379le/OCLqAO66Qdml+EeJ/KTe0AL2l20AIfVkxcrQNfMt/I/7Auq0SmiH4m/dd5LCrZvhXkICVveGHM2wJ92YYJR7La6NC7U6THXev/+nQAtwEh9oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgmM0EMT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4B1C19421;
	Sun,  1 Mar 2026 01:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328026;
	bh=yKeu7jjKreibOu2e/GYMYT8WtLaNhKAhPL1K/ng8tQw=;
	h=From:To:Cc:Subject:Date:From;
	b=pgmM0EMTEq+RAC5ROpGrS26R1tNyPQGrQXvSUgyU5rftR/BDjfyEkKm9EiAIiOd/y
	 XHsmfprRqsHS1pYJo0G+9rtKx3uwiIbwIwXU218gp4WAfNOg0YhdMCfBQpc/BdzGtW
	 scz9O0TLzA5zheWFWQoQsnwQmS1xuzr7HntarUNjpubiy2+lYlfH3wku3YJiMIBaHg
	 FIulxEegS6zx32pLmv4FYdhKpMJEj/QPeHrStxAqZ0+eS3uJxk4jRcAhVlIzqoVNWU
	 j2SnWeia8Rcp8cHvoCIpQZ/DUT/wDHYFfb1nvSDFDHOUO/K0M8YnJPHLc66u2+cNYw
	 wIDz3fEE2F0hw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alperyasinak1@gmail.com
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "media: qcom: camss: vfe: Fix out-of-bounds access in vfe_isr_reg_update()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:24 -0500
Message-ID: <20260301012024.1675946-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53898-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.983];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4B2B1CA424
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
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





