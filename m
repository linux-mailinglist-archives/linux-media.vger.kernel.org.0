Return-Path: <linux-media+bounces-2844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAEB81B246
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 10:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A820128871A
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 09:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB623AC16;
	Thu, 21 Dec 2023 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="axiHFoLp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0C030335
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-28659348677so420110a91.0
        for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 01:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703150600; x=1703755400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lCEYEMR3ZdMjHY32Gwj2vmlAOglAWDLVN2PPmHFWNo=;
        b=axiHFoLpP1uLHeHBt18NeiX+NxeOrqpvOQjypTCJ3vbwl5A4kZh1wEnlSS6jCQfLw3
         WEhy8ewogCyZPXuzrrTfcjCNJ2e4MdTqD0cy5b32YIV/6gZpzj3eSfkyQn4xJ61LRa/v
         uA52QVlADhODyDe9VMH3a2nc27W4HQsh8QDh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150600; x=1703755400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lCEYEMR3ZdMjHY32Gwj2vmlAOglAWDLVN2PPmHFWNo=;
        b=GQpxlULJSXAgHmtpKsdGxtbp719jMPwDfJDsF8FiHhahFun7Qt2qOYGjGkxU16Nx8i
         vopEUbJ7188ucCUY/G3io++QI/oqbiTraqaCCORQlbl4VjD1ULiBnAXyF34OInRSuW6F
         PW+7NFrQRh2ykYbPrIUqEK3UqbrTRJUcubOxgBh1hgdE1YugCnMfbQhDU5mUJi4K0oLp
         YsD7umQ1e/55RaI0Ky6hI3pshU3kNw2ylw+tVWi4kjUyq3B1IIKvJUpjdYYogxzATp/Z
         yJ3TsgCqZI8j7Tv+3ayk/S3I2DtWIKzS6EgHHSmCbEal0MxHZ1f6kP4lS2TAdaDhp6YC
         3TIw==
X-Gm-Message-State: AOJu0Yx7XpMFPO1VidKe0fV/BECXlrJTog2ef2dFzGRzYLk/RC0xf6N6
	lz4K40abao7m4x69kg/FY4CsCQ==
X-Google-Smtp-Source: AGHT+IGJaFa3W8ttJ0cxva573B0FW+Tv1L0wT9eD1Gl2S44RAoKQalXdgX9vfptXkKSVuDVY4wht4g==
X-Received: by 2002:a17:90a:fa96:b0:28b:e0cd:64a3 with SMTP id cu22-20020a17090afa9600b0028be0cd64a3mr481792pjb.26.1703150600225;
        Thu, 21 Dec 2023 01:23:20 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:5d8a:fab1:933a:9ae9])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090add8600b00274b035246esm1001915pjv.1.2023.12.21.01.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:23:19 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fei Shao <fshao@chromium.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/4] media: mediatek: vcodec: Replace dev_name in error string
Date: Thu, 21 Dec 2023 17:17:43 +0800
Message-ID: <20231221171727.v2.1.I69223f1e438b93fe02f12ab9ef0a26f8c21f6ae7@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231221092226.1395427-1-fshao@chromium.org>
References: <20231221092226.1395427-1-fshao@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mtk_v4l2_err() already uses dev_err(), so don't print the device name
again. Print function name instead.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v2:
- rebased on top of next-20231219

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 9ce34a3b5ee6..ea8c35c0e667 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -67,7 +67,7 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 	mem->va = dma_alloc_coherent(&plat_dev->dev, size, &mem->dma_addr, GFP_KERNEL);
 	if (!mem->va) {
 		mtk_v4l2_err(plat_dev, "%s dma_alloc size=%ld failed!",
-			     dev_name(&plat_dev->dev), size);
+			     __func__, size);
 		return -ENOMEM;
 	}
 
@@ -99,7 +99,7 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 
 	if (!mem->va) {
 		mtk_v4l2_err(plat_dev, "%s dma_free size=%ld failed!",
-			     dev_name(&plat_dev->dev), size);
+			     __func__, size);
 		return;
 	}
 
-- 
2.43.0.472.g3155946c3a-goog


