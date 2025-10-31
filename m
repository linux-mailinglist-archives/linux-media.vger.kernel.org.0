Return-Path: <linux-media+bounces-46096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09598C2600B
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 17:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07B0F4F0EF0
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 16:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516782F8BF0;
	Fri, 31 Oct 2025 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VsNIwrUN"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922892EB5B4;
	Fri, 31 Oct 2025 16:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926609; cv=none; b=VmsJtL1Hbw/JtEU4fiHO8HPCAwchcWJFPhyhRnRjnSpTf4flIfGpGX+6bGz//M/4JZRmVFCNsAVsLcv/tzYZXPrkxcRtQ/LeFYD4UYfB1kZZewTNCTAnrKW9miEDc/r7g6E74dLX5J9gFHqCz0BtFKkE2TY0tzBVjy4//lImdek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926609; c=relaxed/simple;
	bh=pvqtaqIokXdnhECE+YQZW07g7hktK1emosnvSGQmgBY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tfrIG1bFIGtSWLDEfO+/xIeXHYVXgEOQEud7IouIaKyJbfhSF3uqYZBpV4Gp9ewszMgLeQTcLeZ+8040pyihE4Ko3rQIUTvbZLaZnCPHav7o4ZoTIDo9mRgPiSJrkm78flsoDoOpkR8FJwpUTodpMFno3xH67iCyoTc98FJXd70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VsNIwrUN; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 1d3974dcb67311f0b33aeb1e7f16c2b6-20251101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/xzT4ObjTcgk6V1zapYFK/VlbVEu9a12rK5uSz4JmdM=;
	b=VsNIwrUNq2Kqcz3vj9aXSj48BxTNkfS6gRwFWar5oYiO3mPwlmSXASImC9sHBOEuj8VnjNc4QY84Ked2V6afTmIYG6yob+AJJAVMYclr0jVekGD0HZwESA6ytJhPePdd/xo2y6cdbvKscOolxj5eJV7si+u7d1Wccb6iUkm4O3w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:91bd68f0-3134-42c3-a744-a363ee037b96,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:3f49c818-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1d3974dcb67311f0b33aeb1e7f16c2b6-20251101
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 255215087; Sat, 01 Nov 2025 00:03:17 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 1 Nov 2025 00:03:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sat, 1 Nov 2025 00:03:09 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH 0/5] Migrate soc, drm-mediatek, mdp3 to new CMDQ APIs (series 2/4)
Date: Sat, 1 Nov 2025 00:01:55 +0800
Message-ID: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
CMDQ APIs introduced for MT8196.

Series application order:
  1. [Fixes] Refine DMA address handling for the command buffer
  - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
  2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs
  - https://lore.kernel.org/all/20251031155838.1650833-1-jason-jh.lin@mediatek.com/
  3. [Series 2/4] Migrate subsystems to new CMDQ APIs (this series)
  4. [Series 3/4] Remove shift_pa from CMDQ jump functions
  5. [Series 4/4] Remove deprecated CMDQ APIs

Please apply this series after the MT8196 GCE support series,
and before the following series.

---

Jason-JH Lin (5):
  soc: mediatek: Use pkt_write function pointer for subsys ID
    compatibility
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
    shift_pa
  drm/mediatek:Use reg_write function pointer for subsys ID
    compatibility
  media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API change
  media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
    cmdq_pkt_jump_rel_temp()

 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 12 +++++-----
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  6 ++---
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  6 ++---
 drivers/soc/mediatek/mtk-mmsys.c              |  8 ++++---
 drivers/soc/mediatek/mtk-mutex.c              |  5 ++--
 include/linux/soc/mediatek/mtk-cmdq.h         | 24 +++++++++++++++++++
 6 files changed, 44 insertions(+), 17 deletions(-)

-- 
2.43.0


