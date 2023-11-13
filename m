Return-Path: <linux-media+bounces-231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFB7E9C2E
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 13:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC027280D38
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 12:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40A61D6A1;
	Mon, 13 Nov 2023 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JL1Y+W16"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093E11DFC0
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 12:32:13 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CCCD55
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 04:32:12 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc3388621cso39172995ad.1
        for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 04:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699878731; x=1700483531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utq/LEPd9MWgyjAIqUwG3FJmsCfoE7UdWxPvzIdPYb8=;
        b=JL1Y+W16jEXlhhMmbJNd7oC20YSvNbYVrK34qRtP8iTfkRIw+ELdAowPXNQfWWQalH
         b4/LrcQ1tRaITLVpsEP+yfNffkDQnBOHpTbaBaeTdAFnIMJryxUS7mfdH3g5Nd94bWv1
         6be/DBqYGUvy2wFz7D9YwjbFgspHwZtkZH3y8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878731; x=1700483531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utq/LEPd9MWgyjAIqUwG3FJmsCfoE7UdWxPvzIdPYb8=;
        b=b2YPCrtQLuMDeDdXTxMlPx6KYCD66LGv0p7GlejRELREuGMnjoGP2f9ALtuJaSI4uW
         n8ad0+LgqJnLPshEC4x0NUmwAcSOemZyzWosBVXlHXsrrP0wgoA1bGtUFKQiPIucPd3u
         axZxDiLbxAYkvY4tM41dxXehbF/zxixyDEfIlI+/1EzcwBlNYc/iHCwRKb0UndjENz9g
         ZNfRWo2WYLY+oatPaDUtWeYMjwVyf219DtgrIuz8Dyo/cfrpSLJl/gr0DYdW115ZSWgD
         CkX8NQ1HLxMDlV7K+NKm941/jLPlWfOji4DA3gVTh+9C0mDj7d2IHgGVQRPzvLRtbQfv
         Z7gA==
X-Gm-Message-State: AOJu0Yx4qGWWo72UhyGq5sxg5SDcLaHK/EUDGFoTuAoghrPanM/gByFN
	uf5ipo08OLWbgMn7ogAIXqC5DQ==
X-Google-Smtp-Source: AGHT+IGG/zF/QwLP8a9jX0YqCzyCMTgh29CNbFu1TQxkbJZaAa/VU3oDqMMh5ijHm1SKJCkxOnMJZQ==
X-Received: by 2002:a17:902:dac6:b0:1cc:42d0:dbc5 with SMTP id q6-20020a170902dac600b001cc42d0dbc5mr9611281plx.13.1699878731524;
        Mon, 13 Nov 2023 04:32:11 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:bc9:4777:173:8be3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001bde65894c8sm3924104pld.268.2023.11.13.04.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:32:11 -0800 (PST)
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
Subject: [PATCH 3/4] media: mediatek: vcodec: Fix mtk_vcodec_mem_free() error log criteria
Date: Mon, 13 Nov 2023 20:26:51 +0800
Message-ID: <20231113123049.4117280-4-fshao@chromium.org>
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

mtk_vcodec_mem_free() shouldn't print error if the target DMA buffer has
never been allocated or was freed properly in the previous call. That
makes log confusing.

Update the error path to print log only when the caller attempts to free
nonzero-size buffer with VA being NULL, which indicates something indeed
went wrong.

This brings another benefit that the callers no more need to check
mem->va explicitly to avoid the error, which can make the code more
compact and neat.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 23bea2702c9a..5eb267decfb6 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -96,8 +96,9 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	}
 
 	if (!mem->va) {
-		mtk_v4l2_err(plat_dev, "%s dma_free size=0x%zx failed!",
-			     __func__, mem->size);
+		if (mem->size)
+			mtk_v4l2_err(plat_dev, "%s VA is NULL but size = 0x%zx",
+				     __func__, mem->size);
 		return;
 	}
 
-- 
2.42.0.869.gea05f2083d-goog


