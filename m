Return-Path: <linux-media+bounces-100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0943A7E8A7E
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 12:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 956EF1F20F1C
	for <lists+linux-media@lfdr.de>; Sat, 11 Nov 2023 11:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF705134A7;
	Sat, 11 Nov 2023 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZYVp65ZK"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD2A12B78;
	Sat, 11 Nov 2023 11:16:30 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB363AA8;
	Sat, 11 Nov 2023 03:16:23 -0800 (PST)
X-UUID: bb35b3e4808311ee8051498923ad61e6-20231111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=D2tKsXiy0X+1JGV/GrDN1OLzUO3UG44bCa8GSOX5Eqc=;
	b=ZYVp65ZKL9ii//GMRU+3Tykq1kLMIacfXQ0nUO8RIrVzwDumVK/jnHAwyzRTIdCO350B7ZJCaScXLko1RgwVuKdL7aXewsLAdakY6gi0mB5K8pFqto0ZLA+RG7n66nS53yWTRj497ffjtTU2Ioy5z5VmrA+CbxLniS4hGITzO90=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:1bb9f16c-58c5-49af-bcbe-52e6832c6786,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:9e818872-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: bb35b3e4808311ee8051498923ad61e6-20231111
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 384052900; Sat, 11 Nov 2023 19:16:16 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 11 Nov 2023 19:16:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 11 Nov 2023 19:16:14 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
	<tjmercier@google.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yong Wu <yong.wu@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linaro-mm-sig@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <jianjiao.zeng@mediatek.com>,
	<kuohong.wang@mediatek.com>, Vijayanand Jitta <quic_vjitta@quicinc.com>,
	Joakim Bech <joakim.bech@linaro.org>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
	<ckoenig.leichtzumerken@gmail.com>
Subject: [PATCH v2 0/8] dma-buf: heaps: Add secure heap
Date: Sat, 11 Nov 2023 19:15:51 +0800
Message-ID: <20231111111559.8218-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This patchset adds three secure heaps:
1) secure_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video Path).
   The buffer is reserved for the secure world after bootup and it is used
   for vcodec's ES/working buffer;
2) secure_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
   dynamically reserved for the secure world and will be got when we start
   playing secure videos, Once the security video playing is complete, the
   CMA will be released. This heap is used for the vcodec's frame buffer. 
3) secure_cma: Use the kerne CMA ops as the allocation ops. 
   currently it is a draft version for Vijay and Jaskaran.

For the first two MediaTek heaps will be used v4l2[1] and drm[2], thus we
cannot put it in v4l2 or drm, and create a common heap for them. Meanwhile
We have a limited number of hardware entries to protect memory, we cannot
protect memory arbitrarily, thus the secure memory management is actually
inside OPTEE. The kernel just tells the TEE what size I want and the TEE
will return a "secure handle".

[1] https://lore.kernel.org/linux-mediatek/20231106120423.23364-1-yunfei.dong@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/20231023044549.21412-1-jason-jh.lin@mediatek.com/

Change note:
v2: 1) Move John's patches into the vcodec patchset since they use the new
       dma heap interface directly.
       https://lore.kernel.org/linux-mediatek/20231106120423.23364-1-yunfei.dong@mediatek.com/
    2) Reword the dt-binding description.
    3) Rename the heap name from mtk_svp to secure_mtk_cm.
       This means the current vcodec/DRM upstream code doesn't match this.
    4) Add a normal CMA heap. currently it should be a draft version.
    5) Regarding the UUID, I still use hard code, but put it in a private
    data which allow the others could set their own UUID. What's more, UUID
    is necessary for the session with TEE. If we don't have it, we can't
    communicate with the TEE, including the get_uuid interface, which tries
    to make uuid more generic, not working. If there is other way to make
    UUID more general, please free to tell me.
    
v1: https://lore.kernel.org/linux-mediatek/20230911023038.30649-1-yong.wu@mediatek.com/
    Base on v6.6-rc1.

Yong Wu (8):
  dma-buf: heaps: Initialize a secure heap
  dma-buf: heaps: secure_heap: Add private heap ops
  dma-buf: heaps: secure_heap: Initialize tee session
  dma-buf: heaps: secure_heap: Add tee memory service call
  dma-buf: heaps: secure_heap: Add dma_ops
  dt-bindings: reserved-memory: Add secure CMA reserved memory range
  dma_buf: heaps: secure_heap: Add a new MediaTek CMA heap
  dma-buf: heaps: secure_heap: Add normal CMA heap

 .../reserved-memory/secure_cma_region.yaml    |  44 ++
 drivers/dma-buf/heaps/Kconfig                 |   7 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/secure_heap.c           | 602 ++++++++++++++++++
 4 files changed, 654 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c

-- 
2.25.1


