Return-Path: <linux-media+bounces-38063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1432DB0A551
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 15:38:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54484563EA6
	for <lists+linux-media@lfdr.de>; Fri, 18 Jul 2025 13:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A854413C8E8;
	Fri, 18 Jul 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PgW/SjyE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1V6YYmrG"
X-Original-To: linux-media@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE5B2AD2F;
	Fri, 18 Jul 2025 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752845923; cv=none; b=BJ9evuA7yR69sXDz4eqqVyf5pfiOcTBBmkRpu/TARSord4v6fSnh/WbtvhrJhwz5Dyy/KsKaecDAhjoADbpFMbYtTLq/132ZtHx4gTplEMtVgcBpLfHA5nrbRT5GRaOuIQLR8ccSxmqHVPyZuAUcYSHzYyk3+iUu3rnep7LMtsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752845923; c=relaxed/simple;
	bh=9210zyTPxXhk1SZc/Ce11Ssu8IbxLLufUcb2Hm7DMQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VsAkp8bDkS8Od6HGvekG8lWkewyw8LT425Q8ASdRG/f1ezESczJ43viJxyN+feMAx+INSetmFEK42z+fSte7/7nPfJHLeVqiJ1AvvGH3UoT+tUCkKMkqrnOh4yPq3MEV5U7Sf0bHPw0HtIPCfiBO4nWB9EZPYiAUweZyuGv/IyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PgW/SjyE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1V6YYmrG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752845920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bFb9hgKzTMP601cCw3goVXhMY7NWgY0C8KJIgbPa3E0=;
	b=PgW/SjyEIHljhqgsyaqAg20rXZB3bu5FCgMDMYc/5+Dhol1HbKAmEWbJC49TmF12Dhmez3
	J2QNTIVOqMWt9j0sjDLxjT/DIHeuf/46fCR4BoO9mNmEoWqzd2zhzz6s/3AaXLblJ+VlJO
	EFNvLbXoqYrJivq7wFCKDCNcSBr5JdtwSSqMcgDanQeD/wb86zIvwiTJGmi7XPd1fpYPTj
	RaZBhFeVxdCSLp+sgEdr9C2Iq/ePpRv5X8MEZg1hLTv9a1IJQ1H9r9eTeD6xwvUSB/Nj2s
	80c6JvRpP/q9v/uYV98uy2gMddEeG0zVd7IG7NOq53B/rTpELa8jAIZLneXbvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752845920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bFb9hgKzTMP601cCw3goVXhMY7NWgY0C8KJIgbPa3E0=;
	b=1V6YYmrGrpjidrZWbbohdQbIxZk7qe2w6+tTBuOuB+/FIshO6L9SHJV9TZbfF1Boc9fWN/
	siNJv7ve9UJQYnBQ==
Date: Fri, 18 Jul 2025 15:38:29 +0200
Subject: [PATCH] media: platform: mtk-mdp3: don't use %pK through printk
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250718-restricted-pointers-mtk-mdp3-v1-1-c7ddaa0612ea@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAFROemgC/x3MSwqEMAwA0KtI1gZaP1jmKoOL0kYNYi1JGQbEu
 1tcvs27QEmYFD7NBUI/Vj5ThW0bCJtPKyHHauhMN5rJOhTSIhwKRcwnp0KieJQdj5h7nIIbvTe
 DsS5ALbLQwv+3/873/QAfkq38bgAAAA==
X-Change-ID: 20250718-restricted-pointers-mtk-mdp3-7c85aa04018c
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752845919; l=2403;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9210zyTPxXhk1SZc/Ce11Ssu8IbxLLufUcb2Hm7DMQk=;
 b=e9H2sK0SBL5qA1YNFt8iM1tqKdDRhaPu0etUU6rVdENmEVlojk7ZR+ekDb4uWuTWQM8M0CHSI
 s6LLqFlZ/C0DC7kflJZrqwklQ3M18JzQlPMefePkzRdpHWji2u6/bED
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
base-commit: d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
change-id: 20250718-restricted-pointers-mtk-mdp3-7c85aa04018c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


