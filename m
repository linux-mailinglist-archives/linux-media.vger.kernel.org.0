Return-Path: <linux-media+bounces-23817-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8469F816C
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 18:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6189163ADF
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FD71EBFF8;
	Thu, 19 Dec 2024 17:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gybgXzGQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3184D1AA1CB;
	Thu, 19 Dec 2024 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734628107; cv=none; b=caH8P4huPzOmlWBj3pA/GuVlTSGUcB4PEiZfyHHEMuXZDsziLcaRSaL0vH+u4N+z9EUWGq09CeO94Kr48Zzc2/KnUrkugbBQy0drJPugVqO5VyZIlgMpgNyPr+pTQnos+y11a/1mh37P5LG+YzDF4zsQE0eppx73CSHQE7T+KaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734628107; c=relaxed/simple;
	bh=SWvwWBxO/fW4h3EuXtOlQmmqjrH9N25lte28UKvg+rc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i6ZLHeGbDTw32Uc/oNa8qMt/l83zmgqxs96f7wmq+jbNY64WGVlrW8rqcJ7PKBmbrNyEgsgWapUBI1AoVg0rEulnQqDSQHt/fG8fuX3bzzuh4aDkUKjYyBdcQewtPQiAXIlA6D1eMDHeaulw8eE0jtZsbzukl0rZPK+6sJBg/+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=gybgXzGQ; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cea5219ebe2b11ef99858b75a2457dd9-20241220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=r+nBjONYIuOND47X7/pY5egAoajtHsGsXRoPywWas48=;
	b=gybgXzGQ3YifSTOLFXPOCE3HUk80w5rISwC7UEiv0bxjqIcsXl8kSSpeDbNOJUgsJSBK7KZQsVtNDwt89KjRgMfBzSNqqs60zsD+WsAiD9bFD+yz0S5t53iedVr59Wn5dtHhSPD88K0/MULIQHN2cE+wIQWqz4GY64gBkRexYPE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:293eeede-ba8f-4bef-bcac-7666af7a5c0f,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:-32768,SF:-32768,FILE:0,BULK:-32768,RULE:Re
	lease_Ham,ACTION:release,TS:-30
X-CID-META: VersionHash:6493067,CLOUDID:23666813-8f5d-4ac6-9276-7b9691c7b8d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cea5219ebe2b11ef99858b75a2457dd9-20241220
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 520218229; Fri, 20 Dec 2024 01:08:03 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 01:08:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 01:08:01 +0800
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
Subject: [PATCH v3 0/7] Add GCE support for MT8196
Date: Fri, 20 Dec 2024 01:07:53 +0800
Message-ID: <20241219170800.2957-1-jason-jh.lin@mediatek.com>
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
changes, and modifying the usage of CMDQ APIs to support non-subsys ID
hardware.

---

Change in v3:
1. Merge 2 dt-bindings pathes together and add more detail commit message.
2. Change type u32 to phys_addr_t for pa_base of struct cmdq_client_reg.
3. Remove cmdq_subsys_is_valid() and subsys_num in CMDQ driver.
4. Add CMDQ_SUBSYS_INVALID to check subsys instead of using
   cmdq_subsys_is_invalid().
5. Make use of CMDQ_THR_SPR0 define to the parameter of CMDQ APIs.
6. Rebase on the new MACRO in mtk-mdp3-comp.h.

Change in v2:
1. Remove the constant and fix warning in dt-bindings.
2. Remove the pa_base parameter of CMDQ APIs and related modification.
3. Move subsys checking to client drivers and use 2 alternative
   CMDQ APIs to achieve the same functionality.

---

Jason-JH.Lin (7):
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
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |   33 +-
 drivers/mailbox/mtk-cmdq-mailbox.c            |   90 +-
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |   18 +-
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |   79 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c        |   53 +-
 drivers/soc/mediatek/mtk-mmsys.c              |   14 +-
 drivers/soc/mediatek/mtk-mutex.c              |   11 +-
 .../dt-bindings/mailbox/mediatek,mt8196-gce.h | 1415 +++++++++++++++++
 include/linux/mailbox/mtk-cmdq-mailbox.h      |    2 +
 include/linux/soc/mediatek/mtk-cmdq.h         |    3 +
 11 files changed, 1679 insertions(+), 43 deletions(-)
 create mode 100644 include/dt-bindings/mailbox/mediatek,mt8196-gce.h

-- 
2.43.0


