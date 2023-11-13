Return-Path: <linux-media+bounces-229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 971EE7E9C27
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:32:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EBF61F20F50
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 12:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5F31CABD;
	Mon, 13 Nov 2023 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aNqurdmg"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F41D6A7
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:32:07 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C861718
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 04:32:06 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cc3c51f830so31020455ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 04:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699878726; x=1700483526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmCcZKWWwZWAAIdygGTS4bHPElBN0IgCDYBXIzaN8Rc=;
        b=aNqurdmgkmGfuTxNJqmnOfJzRGVyYlqIYJzI3BT9KeFCTY/OXqpWPtO7wNXec5Owqe
         S65pP9bTUWWCs3E25V/7nY7x426+S/fXBwhZ/RiTXAo58SemfLLTbz8Q7qmq9cWfIo0n
         2zGVAkaCUSuYFITm2nvbrgNMvNxcZqJIPtwTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878726; x=1700483526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmCcZKWWwZWAAIdygGTS4bHPElBN0IgCDYBXIzaN8Rc=;
        b=PiGTujbTwQqJ9UazVNP3HNfGWBfAhLLkaZjPxQBa4Z5uYP1iL9MjUGxabZanSbIT6j
         7/PITE2q7y5ZcpS93PBCCY5neqHOGhaVLKeawCb4SJhvW5Aio3E/0a/hENY0dBb9pPwG
         Cfxev/KA2OBCj/aCC6qmcbH0Ry0MMf53uBdJhYhiCuXWNE9JgmEP1Y/Yv9GXj1tPeidJ
         pF4n7yZ7vCbQjZpZhmK1SVjG4JNBYS/E9QuEQwF1zYi63WNgOEtzTW6/JFkyeoviRnbh
         YJPE4SlZ0LdS09jFbRXKsN7g9Ki/KKzhk9BzndGmFN7OzApYuk4o6dZlOYcNNOUjQcCl
         +0/A==
X-Gm-Message-State: AOJu0YwaXwSM1D72dC8qE+/5wgDSdKPZ+nhSOSdh74u8Su9XU0hekK5p
	vcWsFcW5c9C6Kza2yLiuXDWlH2Jac7SFELn+DV8=
X-Google-Smtp-Source: AGHT+IExf7ObUmbvOTrAkJwVf7MguRRwDwFguon7N78CqrwPhBqwig/xn/knQ10TaWNK8GigQiHqwA==
X-Received: by 2002:a17:903:1c4:b0:1cc:3fc9:1802 with SMTP id e4-20020a17090301c400b001cc3fc91802mr4826133plh.61.1699878725604;
        Mon, 13 Nov 2023 04:32:05 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:bc9:4777:173:8be3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001bde65894c8sm3924104pld.268.2023.11.13.04.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:32:05 -0800 (PST)
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
Subject: [PATCH 1/4] media: mediatek: vcodec: Replace dev_name in error string
Date: Mon, 13 Nov 2023 20:26:49 +0800
Message-ID: <20231113123049.4117280-2-fshao@chromium.org>
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

mtk_v4l2_err() already uses dev_err(), so don't print the device name
again. Print function name instead.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

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
2.42.0.869.gea05f2083d-goog


