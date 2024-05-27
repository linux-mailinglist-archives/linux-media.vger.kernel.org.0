Return-Path: <linux-media+bounces-11996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAAB8D076C
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADD011C2089A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E325916D4C1;
	Mon, 27 May 2024 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdQtXAk7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7621667F4;
	Mon, 27 May 2024 15:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825403; cv=none; b=eEnxQb/c5ElFG21AYjRiYudZle8VPxf3cVRkwiCT+KCdviqZmXi1YkTAoXfcup+CaO4yJ9EGz8FVe5guKwVQ49oy0UNQ+Ep38UquUSy/FY4fCPY2qWx0KhNdS4cxMpUeG1yFXRjwuSXQhSaJtZAmgEmBG3Emoilat0JAmQTrRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825403; c=relaxed/simple;
	bh=xEyPTSI0oKT2ayAwMUNoeOnhWhpd3XcNCE5o6c/wOUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWz1P2qsksnrcq582FOr5Ajg18+M4vt1GeFwAGmMHdf9+jwDs6dU7M7/XsHh3gS7Pya7Q6s+iMn2i3rhsWjFo6FIwJ6G5sVvA1wjrmCmlBnGEDQjg0tT/Y8l9zwIbIEGATiE/yXoD3dmkZ+MDW7rN5mhGq9RgiC4L1aS9TtQrB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdQtXAk7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66F7FC32781;
	Mon, 27 May 2024 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825403;
	bh=xEyPTSI0oKT2ayAwMUNoeOnhWhpd3XcNCE5o6c/wOUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QdQtXAk7d8iwA3CwVsQrSJ+zmaLAGI+TfDKCazrZuLCf2jQ/O2NuQGUvTJ/HOR+0J
	 BwtdGCD9ujO39u0vFRhVrBiACT8ZuZJvqfnHNNTNbTQlYSKqQfIvN4qOmJ5/er6emL
	 U2bJkiBvLGvmXH9EhBQ7AgYqQcCJMblKOEseRhpbvLtIp9kcDpeOFiF5bcaz0wfGvL
	 XCVgz8VCo6H+Av1p6gNcia7/8hMMD6U7HS+TDJnQUJqJ5mB1/hMoKDG4LTA6W2zsUN
	 CqRwkCBz/YXYAPwXV35QAb/SsMMgdzW6IgTlO3uHIn3zqn/IX272Z/GSIx61bU6Ekg
	 XKputXYsncmjg==
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
Subject: [PATCH AUTOSEL 6.6 14/16] media: mtk-vcodec: potential null pointer deference in SCP
Date: Mon, 27 May 2024 11:55:05 -0400
Message-ID: <20240527155541.3865428-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155541.3865428-1-sashal@kernel.org>
References: <20240527155541.3865428-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.32
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
index 9e744d07a1e8e..774487fb72a31 100644
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


