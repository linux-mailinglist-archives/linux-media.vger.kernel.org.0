Return-Path: <linux-media+bounces-34251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC3AD02EA
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 15:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577A21760AE
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 13:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C49A288C96;
	Fri,  6 Jun 2025 13:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oWPYnJJw"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C782874F2;
	Fri,  6 Jun 2025 13:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215671; cv=none; b=lGARRwCwNN/DPPNxDbn8bp9G+IBC2HxxohsAlmq+OHlBD4PtHqw179WmUOVXMi3+stRVRhCSemo8Fi1lQeduuZJUgDjzkB5WCE+B7QkNnIXTDKYhw6Wgo4LAk9GQPswN4qLwz/kVHwQG45QTj7RrtGhMdKm2lqK3P397r2q8ZH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215671; c=relaxed/simple;
	bh=3NJ+PTFh2Yn3x9J4tEZnxKh27qQe+KeBRZhOB8aY1vI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rf9WIh/GWZGPrzlrcjahucfDZhN6AnJMSKnNjd0kGqj8c5wTVWQovT5yQrznFVHIsZafdMpcwdtcCnPgOZUoLiHP2afiX2RcmsDo7Wmj4RXxEOD7JzFz+CyII5ji5J8f4LUBUhv+1CSxroe0GKSg26mPf0yXzM+BPbjhOygpc6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oWPYnJJw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749215667;
	bh=3NJ+PTFh2Yn3x9J4tEZnxKh27qQe+KeBRZhOB8aY1vI=;
	h=From:Date:Subject:To:Cc:From;
	b=oWPYnJJwa0UyYbR7t6WBXfzzghJ5KN4dDQf0bO7BmlrLmDt14Q5dxUpKutfdfFb6I
	 epijd68Du6aRYLqhaEL7IeBds/ozteeemEYTiMdeBjmbf7MQGOhZbO6qUQSmqi45UD
	 gEGQ4rIAtKQAjWfQ+wI2HYB+nDsqn+EFnD93PWfKbdyzDmq1nPc5nh6T54f8xIP41T
	 3i7+fdDXDMNlYNQfAOnvlma0hjWawzUf+y0NrPYs+MZjQUhkQEuxXOFTwavaiBdvCh
	 1alX+gi+SdZpxByG+xQYXGI9r5sZU8cgE7jUrUjJdGz0tNSkcqmSIcCT9Xys30slz0
	 Tqj9DcuVxKQjg==
Received: from [192.168.1.63] (unknown [IPv6:2600:4041:5b1a:9400:99d:464c:62e0:2118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34DF417E0156;
	Fri,  6 Jun 2025 15:14:25 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 06 Jun 2025 09:14:22 -0400
Subject: [PATCH] media: platform: mtk-mdp3: Add missing MT8188 compatible
 to comp_dt_ids
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-mt8188-mdp-regression-comp-compat-fix-v1-1-e68772d7a3aa@collabora.com>
X-B4-Tracking: v=1; b=H4sIAK3pQmgC/x2NSwqEMBBEryK9noZEyUevMriQpCfTi2joyDAg3
 t3opuAVvKoDKglThak7QOjHlbe1gX51EL7Lmgg5NoZe9UZZZTHvXnuPORYUSkL1NjBsuTyx7Pj
 hPzprfIjWDaPR0LaKUKufn/d8nhe7LEwbdwAAAA==
X-Change-ID: 20250606-mt8188-mdp-regression-comp-compat-fix-7658cd673951
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

Commit 4a81656c8eaa ("arm64: dts: mediatek: mt8188: Address binding
warnings for MDP3 nodes") caused a regression on the MDP functionality
when it removed the MT8195 compatibles from the MDP3 nodes, since the
MT8188 compatible was not yet listed as a possible MDP component
compatible in mdp_comp_dt_ids. This resulted in an empty output
bitstream when using the MDP from userspace, as well as the following
errors:

  mtk-mdp3 14001000.dma-controller: Uninit component inner id 4
  mtk-mdp3 14001000.dma-controller: mdp_path_ctx_init error 0
  mtk-mdp3 14001000.dma-controller: CMDQ sendtask failed: -22

Add the missing compatible to the array to restore functionality.

Fixes: 4a81656c8eaa ("arm64: dts: mediatek: mt8188: Address binding warnings for MDP3 nodes")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 683c066ed97586a187f7d30191ba0f6c99c83371..7fcb2fbdd64eea18ca0c7e4600bb1f601cf8725e 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -1530,6 +1530,9 @@ static const struct of_device_id mdp_comp_dt_ids[] __maybe_unused = {
 	}, {
 		.compatible = "mediatek,mt8195-mdp3-tcc",
 		.data = (void *)MDP_COMP_TYPE_TCC,
+	}, {
+		.compatible = "mediatek,mt8188-mdp3-rdma",
+		.data = (void *)MDP_COMP_TYPE_RDMA,
 	},
 	{}
 };

---
base-commit: 475c850a7fdd0915b856173186d5922899d65686
change-id: 20250606-mt8188-mdp-regression-comp-compat-fix-7658cd673951

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


