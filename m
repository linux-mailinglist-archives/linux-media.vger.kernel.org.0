Return-Path: <linux-media+bounces-39399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A5B20098
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 09:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AACCD174DDF
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 07:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C780285078;
	Mon, 11 Aug 2025 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D7gy0hIM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n17P2/fi"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306B21F582B;
	Mon, 11 Aug 2025 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898416; cv=none; b=MRIJU1yfZZlfIfdxpBM7ETeTCMJDs5MNyvzce/UU0QHLZIUvwjGc7F5i/ak0BxXM5iAv+JTF26or7Xuv/4VV3numPyZbCP2Yl/uapcOkwyCmtZ1tLNgqPo/hIggTmvpLaYzdJ4nrx9seZ6+ibd9O0hSiCpVzAvs8Y+OpYG6ekn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898416; c=relaxed/simple;
	bh=4MMgbTyUJWGMqEvl8cpxSSQkajFSIFS92Abs4DfMrsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f0ncEKyANLtP0bX4Ybcv8mGQUZ+WmBLRq433dk8NjAGCLQgSOY7PkGOHa11eQIyLDa8iI8NMueNIsGiSuo2/PyeEoYSulUJl99dQ0Dvx+n7/B56fkL/GOVy3PwQXWssxNM5iwjhxkAFKXCJyP31QBmSGZ3aOWMOeTrvC3tF3AsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D7gy0hIM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n17P2/fi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754898413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oW6XItzS3RhCClczZNyaDVU2qBVnd8oWUKJM2XLF3U0=;
	b=D7gy0hIMV9tB4JSDXb0uCHwL5gaG18Lk2pQOD3YSLW9as31Yhw8YmISxYfvU/IrfrXqUBS
	nbowDfp+MVLNNbrDnUscxWIriOdjpSNq2kMtL5hOe5SS2x/a6g1OXqR427CkC5Vco7VUkC
	DUvD8KxL92ZZOsaaIwe6OIEVO5Bws2AtoSOL6M9y0xUmGBMXpX/2Uppaec1aCcHNXDa2mm
	IlF/VcvhuWWtGM46hC0WJEy+zwW7WoXgk3tK2PJAtu8UxDc0Vhj08+hGRxNAz5k08BBeWo
	MNlVAI6Xzt0yzSHEUTm+1b3g7ozNaExmDWolCJh2FXtZHosV3XCVR1Lc4WvV9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754898413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oW6XItzS3RhCClczZNyaDVU2qBVnd8oWUKJM2XLF3U0=;
	b=n17P2/fiJG53D5pwyp7NZbW+XMU+NFAGp5OpB3RNIwEkGKA2z6sAG7oYV/2nMctIN1W1Dl
	zIlYq2zkB4+4Q/Dg==
Date: Mon, 11 Aug 2025 09:46:49 +0200
Subject: [PATCH v2] media: platform: mtk-mdp3: don't use %pK through printk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250811-restricted-pointers-mtk-mdp3-v2-1-d76e5e6d5299@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAOifmWgC/43NQQ6CMBCF4auQWTumrSLEFfcwLJp2lInSkmklG
 MLdrZzA5f8W31shkTAluFYrCM2cOIYS5lCBG2x4ELIvDUaZWjW6RaGUhV0mj1PkkEkSjvmJo59
 O2Li2tladlW4dFGISuvOy87e+9MApR/nsb7P+rX/Cs0aNrvG+6BdtyHYvDu8sMfBy9AT9tm1fi
 r5llMwAAAA=
X-Change-ID: 20250718-restricted-pointers-mtk-mdp3-7c85aa04018c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754898413; l=2558;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4MMgbTyUJWGMqEvl8cpxSSQkajFSIFS92Abs4DfMrsg=;
 b=n1Jerr5rl9LAlwvxTZyKzlziPXqsX797vW1petW8HJJp/SY8O5gNi275PdXyjN02ZDrVitc4K
 Oa9s5IvBC2wBP6nLh/xuazfOJdCXOC8hU58Av291JSfTAqT8CfuBUc0
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

In the past %pK was preferable to %p as it would not leak raw pointer
values into the kernel log.
Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
the regular %p has been improved to avoid this issue.
Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping locks in atomic contexts.

Switch to the regular pointer formatting which is safer and
easier to reason about.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase on v6.17-rc1
- Link to v1: https://lore.kernel.org/r/20250718-restricted-pointers-mtk-mdp3-v1-1-c7ddaa0612ea@linutronix.de
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 +-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8de2c8e4d333a8f92684f1590a3dd0d13bdadcc6..6559d72d5d4278071bcec0c5c9be398d1639ba5c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -282,7 +282,7 @@ static int mdp_probe(struct platform_device *pdev)
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-	dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
+	dev_dbg(&pdev->dev, "MDP rproc_handle: %p", mdp->rproc_handle);
 
 	mutex_init(&mdp->vpu_lock);
 	mutex_init(&mdp->m2m_lock);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index da3a892ad867eedb4898509da8790981475e9a62..fae3e1ad2df758a50bd175479dbaf7a9eb859222 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -221,7 +221,7 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 	}
 
 	dev_dbg(&mdp->pdev->dev,
-		"VPU param:%pK pa:%pad sz:%zx, work:%pK pa:%pad sz:%zx, config:%pK pa:%pad sz:%zx",
+		"VPU param:%p pa:%pad sz:%zx, work:%p pa:%pad sz:%zx, config:%p pa:%pad sz:%zx",
 		vpu->param, &vpu->param_addr, vpu->param_size,
 		vpu->work, &vpu->work_addr, vpu->work_size,
 		vpu->config, &vpu->config_addr, vpu->config_size);

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250718-restricted-pointers-mtk-mdp3-7c85aa04018c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


