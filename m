Return-Path: <linux-media+bounces-230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE07E9C2C
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E33AB20BDC
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 12:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082281DA39;
	Mon, 13 Nov 2023 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JQWnwovA"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880E71D6A5
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:32:10 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DD91722
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 04:32:08 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc0d0a0355so30935155ad.3
        for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 04:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699878728; x=1700483528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DA3vrhjtHczEnyT2vUfzyuZkQIQYPfca5IqlMdK//sY=;
        b=JQWnwovACGdnfbYKzgRVI1WrgOV3pLfRM/U3LnJUE5JopaN00HYt9HtUcgO2klz/RV
         AQd2OdB93xXlGs3ylLnwYOjM0yPr8rjOsdCua5R6MZRyapO46Ly/ddC6wkntgaOY9daz
         1elcWxByj5NdQFEkGBo+gT0WoeRiJA/Deq71g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878728; x=1700483528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DA3vrhjtHczEnyT2vUfzyuZkQIQYPfca5IqlMdK//sY=;
        b=PVM19TSWB0uweRnsey215PpMotbiW2dbZ6dP0KMr92zC7KPYZyLsNUi7kcOlw+pE/8
         IzelWsc0x1ElImaLZSOtYnhjd4g1+NlQdLyjMITB3yjkVQYk9y13gbPA7gCN8iQVkJs9
         b+3yTgad4xEAkaHnJmEGjrJGdMhCirWwxcw68b1QbJGU9LO32ILgLt4YKlDrkpSINrxs
         H2bd9bQOiYHrk4GB6TQEtSrswiwlTvnP4r+kGuk83RvsF2l7AZ8FpFtQsILLbUWXYwLv
         K1fHqgivJylVVwFLBo+nVcVxxldZg4H2/h8GiZxmUKFdb6BLU403G+rcOH0jbA6dEpUN
         oXiQ==
X-Gm-Message-State: AOJu0YwPKmCRiR638m8h67R5rZ37lNiM4pWP0LUl+vRCpPnCK4S+q2rf
	pqAXpTsYSiCCs4f1JGjPdpkG5g==
X-Google-Smtp-Source: AGHT+IEr5rZTDntYdnCbJXhkwHgXRSGpCEuLpk6rdQ6ZqC29tJK66Fgqa1UZM40bjEsYv6dxLGnGbg==
X-Received: by 2002:a17:903:1249:b0:1cc:5378:6a40 with SMTP id u9-20020a170903124900b001cc53786a40mr4502566plh.23.1699878728461;
        Mon, 13 Nov 2023 04:32:08 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:bc9:4777:173:8be3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001bde65894c8sm3924104pld.268.2023.11.13.04.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:32:08 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/4] media: mediatek: vcodec: Drop unnecessary variable
Date: Mon, 13 Nov 2023 20:26:50 +0800
Message-ID: <20231113123049.4117280-3-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231113123049.4117280-1-fshao@chromium.org>
References: <20231113123049.4117280-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's unclear why only mem->size has local copies without particular
usage in mtk_vcodec_mem_alloc() and mtk_vcodec_mem_free(), and they
seem removable.

Drop them to make the code visually consistent, and update printk format
identifier accordingly.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../mediatek/vcodec/common/mtk_vcodec_util.c  | 22 +++++++++----------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index ea8c35c0e667..23bea2702c9a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -49,7 +49,6 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
-	unsigned long size = mem->size;
 	int id;
 
 	if (inst_type == MTK_INST_ENCODER) {
@@ -64,15 +63,15 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 		id = dec_ctx->id;
 	}
 
-	mem->va = dma_alloc_coherent(&plat_dev->dev, size, &mem->dma_addr, GFP_KERNEL);
+	mem->va = dma_alloc_coherent(&plat_dev->dev, mem->size, &mem->dma_addr, GFP_KERNEL);
 	if (!mem->va) {
-		mtk_v4l2_err(plat_dev, "%s dma_alloc size=%ld failed!",
-			     __func__, size);
+		mtk_v4l2_err(plat_dev, "%s dma_alloc size=0x%zx failed!",
+			     __func__, mem->size);
 		return -ENOMEM;
 	}
 
-	mtk_v4l2_debug(plat_dev, 3, "[%d] - va = %p dma = 0x%lx size = 0x%lx", id, mem->va,
-		       (unsigned long)mem->dma_addr, size);
+	mtk_v4l2_debug(plat_dev, 3, "[%d] - va = %p dma = 0x%lx size = 0x%zx", id, mem->va,
+		       (unsigned long)mem->dma_addr, mem->size);
 
 	return 0;
 }
@@ -82,7 +81,6 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 {
 	enum mtk_instance_type inst_type = *((unsigned int *)priv);
 	struct platform_device *plat_dev;
-	unsigned long size = mem->size;
 	int id;
 
 	if (inst_type == MTK_INST_ENCODER) {
@@ -98,15 +96,15 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	}
 
 	if (!mem->va) {
-		mtk_v4l2_err(plat_dev, "%s dma_free size=%ld failed!",
-			     __func__, size);
+		mtk_v4l2_err(plat_dev, "%s dma_free size=0x%zx failed!",
+			     __func__, mem->size);
 		return;
 	}
 
-	mtk_v4l2_debug(plat_dev, 3, "[%d] - va = %p dma = 0x%lx size = 0x%lx", id, mem->va,
-		       (unsigned long)mem->dma_addr, size);
+	mtk_v4l2_debug(plat_dev, 3, "[%d] - va = %p dma = 0x%lx size = 0x%zx", id, mem->va,
+		       (unsigned long)mem->dma_addr, mem->size);
 
-	dma_free_coherent(&plat_dev->dev, size, mem->va, mem->dma_addr);
+	dma_free_coherent(&plat_dev->dev, mem->size, mem->va, mem->dma_addr);
 	mem->va = NULL;
 	mem->dma_addr = 0;
 	mem->size = 0;
-- 
2.42.0.869.gea05f2083d-goog


