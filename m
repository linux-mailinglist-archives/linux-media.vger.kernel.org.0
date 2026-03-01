Return-Path: <linux-media+bounces-53970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNbCL5Kgo2noIgUAu9opvQ
	(envelope-from <linux-media+bounces-53970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:12:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 200551CD447
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 03:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5AC333DC07D
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462BD3090C6;
	Sun,  1 Mar 2026 01:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOg/Tat1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA8B2D5937;
	Sun,  1 Mar 2026 01:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329743; cv=none; b=WKaJ8ZAosMcWuWZQqxv2aMXMIC0TEHWu109PlYYurfktGiU61875uCMVoP9rV/aQZFeOa1XBcpN8V4ApmyVfYKBglF5JqD+KDYZPEmNZT/cL4e5y9S9qhFkUY0BLVsb03VFK3dNWjk/LY4l70n5e7/k34VdlwAw9N0YInFBIZ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329743; c=relaxed/simple;
	bh=hKPfWY3C38468BnO2wo8zfAHG6X53W98fR1INJ/k2Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DmKzTBG/GeSoClUKMohq6wyzjqOpJHTOQu6GuK3k0PsuyXBQ58WgjAw9HR/SoqsQiUu2uIBevBJwEab+ILCL+ceRKQlYyNQ35f8QXiZKtFwgdFn1yMorLwE6i6CFNq3yAXc+Bi0Ym/7otqpplsKNmjIBBfkUXhLAnkQTDWCt7JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOg/Tat1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA96C19421;
	Sun,  1 Mar 2026 01:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329743;
	bh=hKPfWY3C38468BnO2wo8zfAHG6X53W98fR1INJ/k2Oo=;
	h=From:To:Cc:Subject:Date:From;
	b=XOg/Tat1xCN3KaHcB3jyRA16vqugBu/gLmGYX3Cut28m6WmfwWL24ZtYQBG4eZu61
	 2hoPxNd8fgCo5+fwPUtFTocCLHnNJUgTvuY08MeafdxQLn1VWN4L/l6K+Z+1lvhJu/
	 +cWg2J/qWs54fkTKkvlw/iJKRzKUVtQNwO6yemketHcb+qciZyZ0ufKIlhvpg4VLAz
	 +uBZATLhM3y7f2S4BAJ0rpL8WyAWUi13F4FUYvUy/vvFkxtZaFFVMiG9zhY3QqkzG3
	 uaJ6isSj+p24prlrUwJ1LP7u04AsHtQPKR8meeo8FZugiJgwyrJc+NRb47BqCWJ5bF
	 T723BCG166wFw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	haoxiang_li2024@163.com
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: FAILED: Patch "media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:49:01 -0500
Message-ID: <20260301014901.1713342-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53970-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email]
X-Rspamd-Queue-Id: 200551CD447
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From f128bab57b8018e526b7eda854ca20069863af47 Mon Sep 17 00:00:00 2001
From: Haoxiang Li <haoxiang_li2024@163.com>
Date: Wed, 8 Oct 2025 17:01:56 +0800
Subject: [PATCH] media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remove()

In mtk_mdp_probe(), vpu_get_plat_device() increases the reference
count of the returned platform device. Add platform_device_put()
to prevent reference leak.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
index f78fa30f18648..8432833814f31 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
@@ -254,6 +254,7 @@ static void mtk_mdp_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
+	platform_device_put(mdp->vpu_dev);
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
-- 
2.51.0





