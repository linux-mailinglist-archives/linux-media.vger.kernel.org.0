Return-Path: <linux-media+bounces-11990-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4068D06EB
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 17:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED9AF1C222C0
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F6E31649D3;
	Mon, 27 May 2024 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvtvWAsA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7815A84F;
	Mon, 27 May 2024 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825176; cv=none; b=SFfBuAfT3ABjw9Z3P6pH/0kaIR8BqT6dHjYBbG+pSM0XMLgDxwZ2Kg3On4rJ1Rm/kFUw7fxiISVKj6LDA91hebWwPBBDwOz9lbGVdEboBMToZBDsxdJ781sAxhFwAlGRcDiphlJjqERgJWkt0RHvBp8YOzw7j6qFyaVdzcYhWgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825176; c=relaxed/simple;
	bh=ublOx72acyNOeeVaCWRsyHmqdVfgbtXS0a5Hkh7LaXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJzs9Uk1HdkAVnq6I5SWVnFoada05suHPiyY+1CP6PRWSQO9vTMflzWENy3FLrO5efv8V/PHHC/jcFCDuETWIPxzA5CYYPj27D0Y3RXJ6lcQC7WDU6tiowqFI3Z+jRA7wrm6oSA4YZLYIvRol71FxJwbnh52W7TECux9veV8CLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvtvWAsA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00EEC2BBFC;
	Mon, 27 May 2024 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825176;
	bh=ublOx72acyNOeeVaCWRsyHmqdVfgbtXS0a5Hkh7LaXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XvtvWAsAu7Htom0xdcQVR8q3NVLpL1WbXUNSiEfjmSgWgRQ+0qltD6J058p4VZMnj
	 dufe7Ogf0KbX68VO2mvJriHWUJxO+ubhZfv6Lgv0ZL5Nzx6dpWUZylFXBVGe9xjWz/
	 La1Km13UILNYnfdRZhhIG7w2jGuYPo/5J75PJB3WJTFGbl5wYkQLJqXusZM1dXXOnS
	 oCcZlBOrGqVBdg2894e7jRmG8YYUruirXGXXX3OYAr7FXFXdqlBq6hW4+Tyeo67tx1
	 yXti2NxfbbDFv43zE/RXHsXDM1RlVZAAo8Wnh9A7ozwEjiD/VkKY+YJa7x08jrAQs4
	 9vR/zMrvJCscA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Fullway Wang <fullwaywang@outlook.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	colin.i.king@gmail.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.9 21/23] media: mtk-vcodec: potential null pointer deference in SCP
Date: Mon, 27 May 2024 11:50:22 -0400
Message-ID: <20240527155123.3863983-21-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155123.3863983-1-sashal@kernel.org>
References: <20240527155123.3863983-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.2
Content-Transfer-Encoding: 8bit

From: Fullway Wang <fullwaywang@outlook.com>

[ Upstream commit 53dbe08504442dc7ba4865c09b3bbf5fe849681b ]

The return value of devm_kzalloc() needs to be checked to avoid
NULL pointer deference. This is similar to CVE-2022-3113.

Link: https://lore.kernel.org/linux-media/PH7PR20MB5925094DAE3FD750C7E39E01BF712@PH7PR20MB5925.namprd20.prod.outlook.com
Signed-off-by: Fullway Wang <fullwaywang@outlook.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
index 6bbe55de6ce9a..ff23b225db705 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_scp.c
@@ -79,6 +79,8 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(void *priv, enum mtk_vcodec_fw_use
 	}
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.43.0


