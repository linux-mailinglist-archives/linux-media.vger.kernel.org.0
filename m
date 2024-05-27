Return-Path: <linux-media+bounces-11993-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B80DB8D073A
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 18:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 557791F224A5
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F9416A363;
	Mon, 27 May 2024 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIWyOp2+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B86160785;
	Mon, 27 May 2024 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825301; cv=none; b=EKnhDYZD1ZrF2D4K1wmqSsqcTIJx8ZWmRq+/ftOmck4Fz/CE+tmLcVjFeO6UvCMUiqWYOWoM4lOuGnI3qqNZ0GB423WikkWlnXJ3SRqkt2wHP3ZX2P+7GpLqEEwMiv57mIitTHeRtWd1vbVm/MYUDvL5GN3cG397OgASn8t15SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825301; c=relaxed/simple;
	bh=ublOx72acyNOeeVaCWRsyHmqdVfgbtXS0a5Hkh7LaXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyoRdWD0FhS89/rcGtKLMn0Ii0rSx6XmM4NVDFdI6e19IHstpbLTFYb7kTmhAe6KM6FVUqLM5AD/oqUJ5pox2qdATzXN9v9JBHnfGyY1JhLUmHyjdY5Ath5nDgYcsHutaqtCzgs78RdeSO62xxdhakJ0a5PCeZFj4WYYq9ROrdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIWyOp2+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45BE4C32781;
	Mon, 27 May 2024 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825301;
	bh=ublOx72acyNOeeVaCWRsyHmqdVfgbtXS0a5Hkh7LaXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIWyOp2+M4MG//fbP9kWF6rtL5hIZvgOtSCWMlxn0+6ZtehgMUWTh+I7fRxR2sn3n
	 jQTOK2uH14bFX8VcF8Za8zvPs3uBfD+qwwR4fc5hjFze995dIkr2BgsAN8hwIgvVxY
	 07JlakurpdvuJd2FMrcFAdyTKg6k/pXMdQmCI8Knh79mmpxqKdJYWeWGL3mH0ZRSQw
	 GXpDX/yOJNjqmn9EB/0p1YIKSNSVzyXG0aQ3y+8KzvaWsHY6QuPb195WCefqdsLlam
	 KCzejA3nID3JoPFp6dCOeh4FQMd6cXFaX+GItSzX5nYwtAWCn3+xn+KYc2vu6B/HXv
	 L7mkHCEB4AhLg==
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
Subject: [PATCH AUTOSEL 6.8 18/20] media: mtk-vcodec: potential null pointer deference in SCP
Date: Mon, 27 May 2024 11:53:01 -0400
Message-ID: <20240527155349.3864778-18-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155349.3864778-1-sashal@kernel.org>
References: <20240527155349.3864778-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.11
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


