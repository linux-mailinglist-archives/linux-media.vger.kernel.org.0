Return-Path: <linux-media+bounces-2181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E8280E211
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 03:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E5681F21C8C
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 02:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14EC93D9F;
	Tue, 12 Dec 2023 02:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UVa+02L9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4411CB0;
	Mon, 11 Dec 2023 18:46:25 -0800 (PST)
X-UUID: a0b03ce2989811eea5db2bebc7c28f94-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jLDmhsPfiX/JLquACpmKBR/nE79QP3C6Hd9UyNn77cs=;
	b=UVa+02L9afdXl7xiN7cNWbe4XkcE3VJLuYbGW+zLynSvXGgQn6t7qUHio9V8p9riJiwOHr03G5/GcsMfXXkveGmbua4+xAmTARQVU3x8HnC1wit81uStrek8EkRPGmTAETZYOipJV+ja3e+ds6/lUiZF/DiF+wpT1XOTImv5eDg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:1bf28d4c-617b-41bc-81fe-f09e849c2ac0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:6f5910bd-2ac7-4da2-9f94-677a477649d9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a0b03ce2989811eea5db2bebc7c28f94-20231212
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 199006210; Tue, 12 Dec 2023 10:46:19 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 10:46:17 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 10:46:16 +0800
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
Subject: [PATCH v3 0/7] dma-buf: heaps: Add secure heap
Date: Tue, 12 Dec 2023 10:46:00 +0800
Message-ID: <20231212024607.3681-1-yong.wu@mediatek.com>
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

This patchset is for secure video playback and enables other potential
uses in the future. The 'secure dma-heap' will be used to allocate dma_buf
objects that reference memory in the secure world that is inaccessible/
unmappable by the non-secure (i.e.kernel/userspace) world.  That memory
will be used by the secure world to store secure information (i.e.
decrypted media content). The dma_bufs allocated from the kernel will be
passed to V4L2 for video decoding (as input and output). They will also be
used by the drm system for rendering of the content.

This patchset adds two secure heaps and they will be used v4l2[1] and drm[2].
1) secure_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video Path).
   The buffer is reserved for the secure world after bootup and it is used
   for vcodec's ES/working buffer;
2) secure_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
   dynamically reserved for the secure world and will be got when we start
   playing secure videos, Once the security video playing is complete, the
   CMA will be released. This heap is used for the vcodec's frame buffer.

[1] https://lore.kernel.org/linux-mediatek/20231206081538.17056-1-yunfei.dong@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/20231023044549.21412-1-jason-jh.lin@mediatek.com/

Change note:
v3: Base on v6.7-rc1.
    1) Separate the secure heap into a common file(secure_heap.c) and a mtk special file
       (secure_heap_mtk.c), and put all tee related code into our special file.
    2) About dt-binding,
       a) Add "mediatek," prefix since this is Mediatek TEE firmware definition.
       b) Mute dt-binding check waring.
    3) Remove the normal CMA heap which is a draft for qcom.

v2: https://lore.kernel.org/linux-mediatek/20231111111559.8218-1-yong.wu@mediatek.com/
    1) Move John's patches into the vcodec patchset since they use the new
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

Yong Wu (7):
  dt-bindings: reserved-memory: Add mediatek,dynamic-secure-region
  dma-buf: heaps: Initialize a secure heap
  dma-buf: heaps: secure_heap: Add private heap ops
  dma-buf: heaps: secure_heap: Add dma_ops
  dma-buf: heaps: secure_heap: Add MediaTek secure heap and heap_init
  dma-buf: heaps: secure_heap_mtk: Add tee memory service call
  dma_buf: heaps: secure_heap_mtk: Add a new CMA heap

 .../mediatek,dynamic-secure-region.yaml       |  43 +++
 drivers/dma-buf/heaps/Kconfig                 |  13 +
 drivers/dma-buf/heaps/Makefile                |   2 +
 drivers/dma-buf/heaps/secure_heap.c           | 234 +++++++++++++
 drivers/dma-buf/heaps/secure_heap.h           |  43 +++
 drivers/dma-buf/heaps/secure_heap_mtk.c       | 321 ++++++++++++++++++
 6 files changed, 656 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/mediatek,dynamic-secure-region.yaml
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c
 create mode 100644 drivers/dma-buf/heaps/secure_heap.h
 create mode 100644 drivers/dma-buf/heaps/secure_heap_mtk.c

-- 
2.18.0



