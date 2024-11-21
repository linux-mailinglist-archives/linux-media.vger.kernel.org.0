Return-Path: <linux-media+bounces-21709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DC59D46AD
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 05:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 765641F22673
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 04:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E651C9B9F;
	Thu, 21 Nov 2024 04:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N9pgPn37"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FA96CDAF;
	Thu, 21 Nov 2024 04:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732163173; cv=none; b=jHnfmBjl85XiKzbmKVdbDx6pvmq13xlD4d9WTI78Fx+WLA+36O0oxt+SWlImK7SnuW6V95yQ1l99ifsmMPpsqnSBmGL+TRxw77ofBtSq7EuDG8kGyU0d+MqOeNM7rMKcQMVY7yaiuvGGjGuCbhtt47EVoXpuiaoVcA4TCOOBz8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732163173; c=relaxed/simple;
	bh=CbFkLN5U5lhpU1ZKhnsC0bTjZy+0MEPfPMKMkXTJM4U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FKGRhXSGGiKmrThVRAijeMHxVB54neQy9dqOLRb+agWKeOhfr+O6puwqdHbEcT+hc0gK++TheL0kHi0LuAb3X/im4RdVgxlfu3XdCKEnYmYijLzomVJF74DnJdFYoU2SM0sefEZREsfuSq8hdW8yYRCgJMkeb5k6/MNjKKMTqsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=N9pgPn37; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b8fe20eca7c011ef99858b75a2457dd9-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3ghlE111DUE2HnHAtWYt9SyfO1QWC8nbhrgrUa0cNfI=;
	b=N9pgPn372/aPBMUI+HOi9jPojmToV3KnashYuPGNTGcWPIa3UA+XPb7qe8w16rr9y4tbngRGOo6JsvnvQH6mOBFt+uq/Xp8NoKJwRUjwi/EOk1IzAGL6pXpGSFGU00fopDHO3qnmsfXK/8e3rSuB9IIKX5SYf4Sxjvm1Ntc5CEE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:c17f987b-b037-4069-8508-48cb68c87b11,IP:0,U
	RL:0,TC:0,Content:50,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:50
X-CID-META: VersionHash:464815b,CLOUDID:601c27b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|801,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LE
	S:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b8fe20eca7c011ef99858b75a2457dd9-20241121
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1033751027; Thu, 21 Nov 2024 12:26:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 12:26:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 12:26:03 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Moudy
 Ho <moudy.ho@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-media@vger.kernel.org>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/8] Add GCE support for MT8196
Date: Thu, 21 Nov 2024 12:25:54 +0800
Message-ID: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
driver and related subsystems. The changes include adding compatible
names and properties, updating driver data to accommodate hardware
changes, and modifying the CMDQ API to support non-subsys ID hardware.

Jason-JH.Lin (8):
  dt-bindings: mailbox: mediatek: Add GCE header file for MT8196
  dt-bindings: mailbox: mediatek: Add MT8196 support for gce-mailbox
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add unsupported subsys ID programing flow
  soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM
    address
  soc: mediatek: Add pa_base due to CMDQ API change
  drm/mediatek: Add pa_base due to CMDQ API change
  media: mediatek: mdp3: Add pa_base due to CMDQ API change

 .../mailbox/mediatek,gce-mailbox.yaml         |    4 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |    6 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |  107 +-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |    4 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |    4 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c        |  133 +-
 drivers/soc/mediatek/mtk-mmsys.c              |    1 +
 drivers/soc/mediatek/mtk-mutex.c              |    2 +-
 .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1449 +++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |    3 +
 include/linux/soc/mediatek/mtk-cmdq.h         |   22 +-
 11 files changed, 1698 insertions(+), 37 deletions(-)
 create mode 100755 include/dt-bindings/mailbox/mediatek,mt8196-gce.h

-- 
2.43.0


