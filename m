Return-Path: <linux-media+bounces-9873-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D39378AD30A
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 19:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EB881F221D6
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 17:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40AE15383D;
	Mon, 22 Apr 2024 17:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PevJ4Nul"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0010B1514E2
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 17:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713805516; cv=none; b=RVhHgYO28zPq2Nc99k3jAdArfwUjbheopq7F0YZ4wJOr44fGHkhuTjOLoJ4xmIwz5XkOxjnImM99E3uuL8mWXrTUNgXnwuwa0ngIfpMlsZRDFhc/BWvorrreDzvefyK9WgzZMkHZCQTuuS+PdWD7qHztjo1dvL7lHg2cc9KaQpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713805516; c=relaxed/simple;
	bh=AHu9d6uPryR7QNpvwYORlSRuVIiALc6iKXvSYf0HmQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pilQEK84CxX+yPrNq/Y686/ukPgBzDTHfSBNiKMJp3sC22nWr3oWQ8NPv2PYQTqQwyMeuiJmMXhoJpULEWLR6OgyBzYFV99bM4dzteXkzpLk8de3ZFrBb7lOqp/u5yKyCR3aL+/wG0NhMFOCVB3MLmXIkGsOA1JXHe4TXtFkVgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PevJ4Nul; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f30f69a958so644904b3a.1
        for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 10:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713805514; x=1714410314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSkyOzxUcdbMqzp03KnrhjrfOdlW3TL2PUxe3CYy+uU=;
        b=PevJ4NulAiOYVbA8mciWxEHev11PduHd/oYest7x9tK2CVHr6/B7olAHtulLtr8epI
         04OFtpL3lbl3Fh7ZoIN4grRWoFEAVj05sXGWIapK5oFVTAZjhx4V4QJG44ThmLGpg5sm
         4mCQbmQ6Ra1wVfu4OaUA4puUk0w13NswduPik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713805514; x=1714410314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSkyOzxUcdbMqzp03KnrhjrfOdlW3TL2PUxe3CYy+uU=;
        b=TW8vJyI0erFOCqUWwOJTqh4OFS79xCQQBe2hZ/z+NxCOQVVTwW++iB/0YUKX39Vr7v
         m0sWUeDdI54gArVehZQt9W3M+j3gjS08mSOY8dKfgzxeZCZdg57Q6OD9vKQKrWWQNXDp
         CSvT9s9Rf9SCuXtxfiYCzeZhbDbT3vl2r/xWyaOIGhoyxUaAGlJA7vXzcxi/sm1TWllf
         pjgH2vAWrmEKc232e90dMHOjut6cln0+hMyxMTgfKy7BfxrwOMaxCiFrPrWjLluGFGOx
         qC56Ma6kxNS7xt9YuzIW6A2B7DM1QTno+KBGlabs2ug40WUL8aMt27nsA/UwOEzaCzzy
         BPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSAE+1jKXK/t6OQw6d8vFWHgM/4jQ6f/rxCfm1wRNFUV/a8fFXiUCDZYa9lmeZmZbvZkdt1jXulWuyHdrE1MuuHc9KdykznEWN9XE=
X-Gm-Message-State: AOJu0Yym4SzfJ9Z4HBiSLzVpjtukz4hWlKztCG1jdiL2actfNaS5oJKH
	aAl3YXd/pLA5dmaSQuqmlLtZiQuUburQjTcnOcOAkE3KwIMlApSb6Is9jTXdmQ==
X-Google-Smtp-Source: AGHT+IFxJFeMPcL8ytCxc2u5zPDcX0TiDfN/BOFVsXaXujFuR9MAhpYnZXK32l63JffeuOssUsOYXw==
X-Received: by 2002:a05:6a00:1407:b0:6ed:2f2:a8e with SMTP id l7-20020a056a00140700b006ed02f20a8emr11839710pfu.30.1713805514163;
        Mon, 22 Apr 2024 10:05:14 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:843d:b423:30f9:2b2])
        by smtp.gmail.com with ESMTPSA id fa34-20020a056a002d2200b006e5571be110sm7997617pfb.214.2024.04.22.10.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 10:05:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei-Shun Chang <weishunc@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES
Date: Mon, 22 Apr 2024 10:03:59 -0700
Message-ID: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As talked about in commit 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc"), it doesn't
really make sense to try to allocate contiguous chunks of memory for
video encoding/decoding. Let's switch the Mediatek vcodec driver to
pass DMA_ATTR_ALLOC_SINGLE_PAGES and take some of the stress off the
memory subsystem.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
NOTE: I haven't personally done massive amounts of testing with this
change, but I originally added the DMA_ATTR_ALLOC_SINGLE_PAGES flag
specifically for the video encoding / decoding cases and I know it
helped avoid memory problems in the past on other systems. Colleagues
of mine have told me that with this change memory problems are harder
to reproduce, so it seems like we should consider doing it.

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 9ce34a3b5ee6..3fb1d48c3e15 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -64,7 +64,8 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 		id = dec_ctx->id;
 	}
 
-	mem->va = dma_alloc_coherent(&plat_dev->dev, size, &mem->dma_addr, GFP_KERNEL);
+	mem->va = dma_alloc_attrs(&plat_dev->dev, size, &mem->dma_addr,
+				  GFP_KERNEL, DMA_ATTR_ALLOC_SINGLE_PAGES);
 	if (!mem->va) {
 		mtk_v4l2_err(plat_dev, "%s dma_alloc size=%ld failed!",
 			     dev_name(&plat_dev->dev), size);
-- 
2.44.0.769.g3c40516874-goog


