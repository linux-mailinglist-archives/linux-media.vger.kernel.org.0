Return-Path: <linux-media+bounces-2846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2173D81B24B
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 10:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 829BFB2228B
	for <lists+linux-media@lfdr.de>; Thu, 21 Dec 2023 09:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8345E48CC4;
	Thu, 21 Dec 2023 09:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AtNvv4dn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B192C446A5
	for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d7609cb6d2so316634b3a.1
        for <linux-media@vger.kernel.org>; Thu, 21 Dec 2023 01:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703150606; x=1703755406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpgYqGOhJKgjrH+Y+gow5aHhwckMqDVFEItsLP1DgtE=;
        b=AtNvv4dnqqqoQIcnxmMRYfV3RJ3eJvizPDs1/uAi0JFwzaDNsM8EFQzMYINH9G3dG6
         hpjm4sz4XML+0gm0W6nchdSW2vBCGJNHF43yiP4U8Ku/pXWin7A24q2vSu1ArtgQEzL+
         SUci/2oiqF6PqFKK4K3SMkaX5wDCX9+TcfeYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150606; x=1703755406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpgYqGOhJKgjrH+Y+gow5aHhwckMqDVFEItsLP1DgtE=;
        b=O35qLQPdqTAIx9DIjaI8zgAWz+5i22ejlrFQudIkp65MhbPnFubu8FoHGnlMd57nlJ
         T6Xa64fvVFULn3n/SsxQ+fEawcONHYXZBRJI3zbbtX++so+gEd+mQvePrKr1Bh9cfYWf
         HKSGJSoElGSDnDow+BYeC6/jp5K0e7iIbjns3FMdrAqUKYdXfOAeiYP8vn6+X9nbvZt1
         qltJF0z8gLezuyNgRmftc16Yzyr5N+W5YLwku7pATItIEIuFCq37wgMAj2Fx5JDXP5XT
         nyXHrYbXNTaDieV27UyjkqhrjMz6y2yacRsP2DUA/oK2a3o3+HWCoZUOEZqoa5ELKoBu
         D+7Q==
X-Gm-Message-State: AOJu0YyevnLFh1CCnlXUi6bbuTNw1JhcPdQeyKN0twN+dLPV/n6Fj2p7
	F8EsSunYm0fl3m+A5Q/QnqZACQ==
X-Google-Smtp-Source: AGHT+IFnrts3BeDUhUkXV+RyB4brmj4RfCUKgv5oiPG6/u9kJt/qtACQnRiXrrJZ8XuzpZM2y2ZDHg==
X-Received: by 2002:a05:6a20:2e25:b0:188:1df7:9afe with SMTP id be37-20020a056a202e2500b001881df79afemr560527pzb.30.1703150606111;
        Thu, 21 Dec 2023 01:23:26 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:5d8a:fab1:933a:9ae9])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090add8600b00274b035246esm1001915pjv.1.2023.12.21.01.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:23:25 -0800 (PST)
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
Subject: [PATCH v2 3/4] media: mediatek: vcodec: Update mtk_vcodec_mem_free() error messages
Date: Thu, 21 Dec 2023 17:17:45 +0800
Message-ID: <20231221092226.1395427-3-fshao@chromium.org>
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

In mtk_vcodec_mem_free(), there are two cases where a NULL VA is passed:
- mem->size == 0: we are called to free no memory. This may happen when
  we call mtk_vcodec_mem_free() twice or the memory has never been
  allocated.
- mem->size > 0: we are called to free memory but without VA. This means
  that we failed to free the memory for real.

Both cases are not expected to happen, and we want to have clearer error
messages to describe which one we just encountered.
Update the error messages to include more information for that purpose.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- update the error messages based on the suggestion

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 23bea2702c9a..c60e4c193b25 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -96,8 +96,9 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	}
 
 	if (!mem->va) {
-		mtk_v4l2_err(plat_dev, "%s dma_free size=0x%zx failed!",
-			     __func__, mem->size);
+		mtk_v4l2_err(plat_dev, "%s: Tried to free a NULL VA", __func__);
+		if (mem->size)
+			mtk_v4l2_err(plat_dev, "Failed to free %zu bytes", mem->size);
 		return;
 	}
 
-- 
2.43.0.472.g3155946c3a-goog


