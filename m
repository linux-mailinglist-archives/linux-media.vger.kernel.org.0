Return-Path: <linux-media+bounces-23145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A54639EC331
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 04:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7052E1886D9B
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 03:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7E022913F;
	Wed, 11 Dec 2024 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kApDiNmB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA70F20C000;
	Wed, 11 Dec 2024 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733887388; cv=none; b=Hs/04aXOdd+JBBOPI+3audEeuJzO7bYHEBEm7PQjv5DGOodteP6K59Y4p4JdGtb3Muz648WdcZC/t7hKaKlAFZ/nzN8IPUoCcMN/BBC4zgahu9Mt1bu6CbSj1ePL2lp6kSIp/pWE2GoGM72lS36vok55sGRu3f0oeALP967qntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733887388; c=relaxed/simple;
	bh=MSmYHjlj6UzLNtoLb9EKbLVZf4MyQ0EgklgBomxysFY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=idHpeTu3VFtdDjrZ0NPWb6ojtspF3oX9CQZZdbHCZZo1LyXFJuue/XxM7la95UJnTCOVWBwdfhrV0z87DCjj2k+77OWn1YRJybkxoQRzaPsZgRIWbJJx+HL9kQNn/2gqWIBUpW1fAq0QvFgBWPExpCHsyN7zBCOZYiG6hoie6wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=kApDiNmB; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 38e61b3ab76f11efbd192953cf12861f-20241211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0KJPkukya59nfR1aGhl7T2oGpeA9UVjg5hfMTy1E8j0=;
	b=kApDiNmBd/kpFvYlEry3Htj7EsXzUt92K2V4SVCXWUA55Wl4bT22N9270juSlHuZWT+CGKjVSBBGCxk8sYZF1VsZEMANEprAU4FRRn+DS8pnxQVggfhsFZQrK9eUrtIZFbbrpxsmGahE/gYmefLS9KyzDgukFLm9dTvLJbWl4g0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:127a1e49-b043-4adf-986c-cdcf697e45b6,IP:0,U
	RL:0,TC:0,Content:36,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:6
X-CID-META: VersionHash:6493067,CLOUDID:e266c53b-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 38e61b3ab76f11efbd192953cf12861f-20241211
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 125515625; Wed, 11 Dec 2024 11:22:59 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Dec 2024 11:22:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Dec 2024 11:22:58 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v2 0/8] Add GCE support for MT8196
Date: Wed, 11 Dec 2024 11:22:48 +0800
Message-ID: <20241211032256.28494-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

This patch series adds support for the MediaTek MT8196 SoC in the CMDQ
driver and related subsystems. The changes include adding compatible
names and properties, updating driver data to accommodate hardware
changes, and modifying the usage of CMDQ API to support non-subsys ID
hardware.

---

Change in v2:
1. Remove the constant and fix warning in dt-bindings.
2. Remove the pa_base parameter of CMDQ APIs and related modification.
3. Move subsys checking to client drivers and use 2 alternative
   CMDQ APIs to achieve the same functionality.

---

Jason-JH.Lin (8):
  dt-bindings: mailbox: mediatek: Add GCE header file for MT8196
  dt-bindings: mailbox: mediatek: Add MT8196 support for gce-mailbox
  mailbox: mtk-cmdq: Add driver data to support for MT8196
  soc: mediatek: mtk-cmdq: Add pa_base parsing for unsupported subsys ID
    hardware
  soc: mediatek: mtk-cmdq: Add mminfra_offset compatibility for DRAM
    address
  soc: mediatek: Add programming flow for unsupported subsys ID hardware
  drm/mediatek: Add programming flow for unsupported subsys ID hardware
  media: mediatek: mdp3: Add programming flow for unsupported subsys ID
    hardware

 .../mailbox/mediatek,gce-mailbox.yaml         |    4 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   34 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |  107 +-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |   26 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |   41 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c        |   53 +-
 drivers/soc/mediatek/mtk-mmsys.c              |   16 +-
 drivers/soc/mediatek/mtk-mutex.c              |   12 +-
 .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1439 +++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |    3 +
 include/linux/soc/mediatek/mtk-cmdq.h         |    1 +
 11 files changed, 1701 insertions(+), 35 deletions(-)
 create mode 100644 include/dt-bindings/mailbox/mediatek,mt8196-gce.h

-- 
2.43.0


