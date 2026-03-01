Return-Path: <linux-media+bounces-53915-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAGUK2+Zo2neHgUAu9opvQ
	(envelope-from <linux-media+bounces-53915-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:42:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE071CB656
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 249B8304C7EB
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C454C13B58A;
	Sun,  1 Mar 2026 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgzVHEWT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350A626ED35;
	Sun,  1 Mar 2026 01:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328653; cv=none; b=u5Q8hTv+ZENvcGBFMv/3tJXKStuIbxPWv+jXSgAuXsczSI2BG9cTioB/8L20G669PAcAnA62Z+dmS7Savuun0wmt+1i2IsAu21kxvk8PjsR1pE74zMjyGLMYlnlZO0wjTBGCtHln5yvhxWdsj5820a4XKjz7C7Zd4e44X6cHvFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328653; c=relaxed/simple;
	bh=K1m+6FBJdr8JQKayLF3Q9xXI9VfQt/l0paMkPPxbuAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0cYuyauz6EWkaY5sJhZbLYBBBzWCu6JI8Snfphyfa/Wnm9yp3VL0uM6UuMMeI2dEY8CY2IPdTzTQbTJ1uE4qG1ETS+OCR+U4q5h1tYS/18SCfjV6A/BQlKwAh+ySRsAZEYzbNVxIx1RIfTyLRpVUMqiJ5U8dgaKf/4mUIVd700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgzVHEWT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FD2C19421;
	Sun,  1 Mar 2026 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328653;
	bh=K1m+6FBJdr8JQKayLF3Q9xXI9VfQt/l0paMkPPxbuAM=;
	h=From:To:Cc:Subject:Date:From;
	b=mgzVHEWTzpmKld2+rLelDy5q0x5XJtXafMqrWpWq0QiRDmoRif6B9FlYg5li8OD2o
	 4Ov6KiqUo4YBzlT/eDVBElnJlHqCO/fK3awzKRAwNgyB2N2R6MD0fFIY88fzKz6NrG
	 0MmnTw35IXRFLKg9tyG4Dn4YTuMyJQPl8mAyocIRw8qEkpJQ6a6u1YQ5Mrc9tFsy4w
	 6JsPkhajtqH5zBnKLdnSyVimUNPSV5/yiESn12gd+oIt/3bgg4apEQjGuKvF9nwgUw
	 0+PCjxzLM620zinmWFxSrcMzxkofjX+c7GRwE+h8AOKs9wAmIsrvLoKfnS/iosyq7J
	 8X73/MhqmHMMA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix error handling in probe function" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:30:50 -0500
Message-ID: <20260301013051.1689178-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53915-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AE071CB656
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 8a8a3232abac5b972058a5f2cb3e33199d2a8648 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <haoxiang_li2024@163.com>
Date: Wed, 8 Oct 2025 16:55:03 +0800
Subject: [PATCH] media: mtk-mdp: Fix error handling in probe function

Add mtk_mdp_unregister_m2m_device() on the error handling path to prevent
resource leak.

Add check for the return value of vpu_get_plat_device() to prevent null
pointer dereference. And vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put() to
prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/platform/mediatek/mdp/mtk_mdp_core.c   | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index 80fdc6ff57e0e..f78fa30f18648 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -194,11 +194,17 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->vpu_dev = vpu_get_plat_device(pdev);
+	if (!mdp->vpu_dev) {
+		dev_err(&pdev->dev, "Failed to get vpu device\n");
+		ret = -ENODEV;
+		goto err_vpu_get_dev;
+	}
+
 	ret = vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, mdp,
 				  VPU_RST_MDP);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register reset handler\n");
-		goto err_m2m_register;
+		goto err_reg_handler;
 	}
 
 	platform_set_drvdata(pdev, mdp);
@@ -206,7 +212,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
-		goto err_m2m_register;
+		goto err_reg_handler;
 	}
 
 	pm_runtime_enable(dev);
@@ -214,6 +220,12 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_reg_handler:
+	platform_device_put(mdp->vpu_dev);
+
+err_vpu_get_dev:
+	mtk_mdp_unregister_m2m_device(mdp);
+
 err_m2m_register:
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.51.0





