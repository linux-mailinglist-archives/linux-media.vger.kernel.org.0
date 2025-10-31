Return-Path: <linux-media+bounces-46085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4895CC25FC9
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 17:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 426031A60C47
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 16:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAA52F546E;
	Fri, 31 Oct 2025 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="duhoxMid"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFAD2E8894;
	Fri, 31 Oct 2025 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926332; cv=none; b=niGqkgHPUxj0AtKeGSkYyWemTUUZIWZTeRdisW0vzjWuUsBQ6d345PWzRvX5t1ovbArUTu98yWO7EYXABUFZkB4BugIGbnL6OA1spik5mx2gzmcO+6Ue73W69j5Rl8ImVdevEseE3sKjBGKHQjiC5wPw9bH3PWfdutFtw4npa8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926332; c=relaxed/simple;
	bh=7ZocrOdZoOe8U0HbdKT4/kjrzm5YzPGNjP4XkVa5BWs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L4UHYiQrmTWXy8QdtVexeyt8foonA8+vGxBZ5YihTDvHBKrwdjiIYXa8jLqnPMJojvlTdCICxui2rGa5iXylIvJi0jTdD1igipigFs7vkUs0R7bJNa+MI0MI8Gae4FamGEas9bMnr76uY9zP9C+E2/c1/r8O4VZqaNC5FxbVZj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=duhoxMid; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 787881f4b67211f0b33aeb1e7f16c2b6-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bov98rlRxQkhC4GLJxADuB3XDxqpYat/vql3Q23B3/o=;
	b=duhoxMidtH5SSxYzqL5w5+blGJJ2NumIp1jIV4xwe3YQ75SVVWR1NbdsjTBx8+t773mbJqK+kFORVve9CW9X4kFOyN4R7F7KdNr7xfULE2Vuomeqb+dAO2ffYTZsbSTbAM4d6OzIBUcj39u901QBc1GJmc+Dnm3MoTvIFxzLXqo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:76af375b-8c22-495a-9007-4ab11db5d6a8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:4413e76a-d4bd-4ab9-8221-0049857cc502,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 787881f4b67211f0b33aeb1e7f16c2b6-20251031
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 561415047; Fri, 31 Oct 2025 23:58:41 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 31 Oct 2025 23:58:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 31 Oct 2025 23:58:39 +0800
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
Subject: [PATCH 0/9] Add GCE support for MT8196 (series 1/4)
Date: Fri, 31 Oct 2025 23:56:28 +0800
Message-ID: <20251031155838.1650833-1-jason-jh.lin@mediatek.com>
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

This series adds initial support for the MediaTek MT8196 GCE in the CMDQ
driver, including related API changes for new hardware requirements.

Series application order:
  1. [Fixes] Refine DMA address handling for the command buffer
  - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
  2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs (this series)
  3. [Series 2/4] Migrate subsystems to new CMDQ APIs
  4. [Series 3/4] Remove shift_pa from CMDQ jump functions
  5. [Series 4/4] Remove deprecated CMDQ APIs

Please apply this series after the DMA address handling Fixes patch[1],
and before the following series.

---

Jason-JH Lin (9):
  arm64: dts: mediatek: Add GCE header for MT8196
  mailbox: mtk-cmdq: Add cmdq private data to cmdq_pkt for generating
    instruction
  mailbox: mtk-cmdq: Add GCE hardware virtualization configuration
  mailbox: mtk-cmdq: Add mminfra_offset configuration for DRAM
    transaction
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add cmdq_get_mbox_priv() in cmdq_pkt_create()
  soc: mediatek: mtk-cmdq: Add pa_base parsing for hardware without
    subsys ID support
  soc: mediatek: mtk-cmdq: Extend cmdq_pkt_write API for SoCs without
    subsys ID
  soc: mediatek: mtk-cmdq: Add mminfra_offset adjustment for DRAM
    addresses

 arch/arm64/boot/dts/mediatek/mt8196-gce.h | 612 ++++++++++++++++++++++
 drivers/mailbox/mtk-cmdq-mailbox.c        |  74 ++-
 drivers/soc/mediatek/mtk-cmdq-helper.c    |  77 ++-
 include/linux/mailbox/mtk-cmdq-mailbox.h  |  19 +
 include/linux/soc/mediatek/mtk-cmdq.h     |  93 ++++
 5 files changed, 869 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h

-- 
2.43.0


