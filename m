Return-Path: <linux-media+bounces-48672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 576B9CB7961
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 02:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D9CE3027183
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 01:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1392F2877E6;
	Fri, 12 Dec 2025 01:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jOvFfcEi"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC692264DC;
	Fri, 12 Dec 2025 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765504519; cv=none; b=tMjOuFdP3xGNUk77mYPOI2WFHXMconcPigme3qPHBHYvEQtq/OO85xmoMdODw4P/fQDgMsC3MNnTDmbwZGVrC0ipN6kdumJZOQGQ+lXYniJSF3xvm+st5e+AhBEicTDWyjy80W9MOI0pQCSfOpiR23mgUqYVAJRb+TZqg2l4WNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765504519; c=relaxed/simple;
	bh=8ynfXCJ/CDgBq5fvw9y6fAjDQsYQiVIGLoLVtb1eb6Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=soizuVVCJenghMMj0xsYAugfZvQBF+Md73Ws7BJqJRnrAAK0a7g/UJzFqpn24Kpah2SLShf/1VbyGIboP3hZXFYPDtzD98bKV/MljGv6nytwU69AcE/uGYfncT6c3ghIHpHy2ZRdarpYqn7tPVApUIvxZPqqsM/FIVoOA6Y0srU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jOvFfcEi; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 98ec25acd6fd11f0b33aeb1e7f16c2b6-20251212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=14Z0aXIgxAgzXPRgCmolCN6WMCG7n8neHEeuTx5Y7QE=;
	b=jOvFfcEiiYjig8eGKcJn4NwA0eRxxdouhVe0V/bb9jOBJ0Xd2ynMXCTEBmIuT0p+22rDNOkXWMznIyo8uJ5ec/PY83HbHlWWmtd3TUUJhX8l1ryYA7kXPnRa3HR3Ui2vXsTp6OAcAnxJmG8fJ1JzVdsmHCErHJbdqwBcoSnALng=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:47ecc9b3-9e74-4a51-b101-a95ae47414e2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:6b106e28-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 98ec25acd6fd11f0b33aeb1e7f16c2b6-20251212
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1334044755; Fri, 12 Dec 2025 09:55:12 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 09:55:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 09:55:10 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, Jianhua Lin <jianhua.lin@mediatek.com>
Subject: [PATCH 0/4] Mediatek MT8189 JPEG support
Date: Fri, 12 Dec 2025 09:52:14 +0800
Message-ID: <20251212015218.4689-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series is based on tag: next-20251211, linux-next/master

Jianhua Lin (4):
  arm64: dts: mt8188: update JPEG encoder/decoder compatible
  dt-bindings: media: mediatek-jpeg-decoder: add MT8189 compatible
    string
  dt-bindings: media: mediatek-jpeg-encoder: add MT8189 compatible
    string
  media: mediatek: jpeg: add compatible for MT8189 SoC

 .../bindings/media/mediatek-jpeg-decoder.yaml | 46 +++++++++++++++++--
 .../bindings/media/mediatek-jpeg-encoder.yaml | 27 ++++++++---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |  9 ++--
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 44 ++++++++++++++++++
 4 files changed, 109 insertions(+), 17 deletions(-)

-- 
2.45.2


