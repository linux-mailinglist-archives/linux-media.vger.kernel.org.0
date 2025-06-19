Return-Path: <linux-media+bounces-35212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 272E7ADFBA5
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 05:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 011D3189FD10
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 03:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFE9238C23;
	Thu, 19 Jun 2025 03:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eZ8lGZzc"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2592B4A3C;
	Thu, 19 Jun 2025 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750302719; cv=none; b=udjZ2rxbfIvxAiHcprd6u0oVDBWqCD5T8iEiDivmeqs8eoiDfIc3iB5xkFYEUhzx0GmCggcdDFr0HfFo1kC/5OilP69Sdx7s5YDDpB4jVSr3ss7UZz0IZRA8TLZgtJWK7ctXKKoYLmBUCKNRvLDo8SxU5kydepYjKhNe3PzSjBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750302719; c=relaxed/simple;
	bh=MFAuk96MoSjlkSJYPkinU7Cnn1W/ZUDNhoAOIfyE3e0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AgsLNmAvQPy2c4ZM1f6EcRLzE9Jk+9DHxJQpTg3NxXuYyJDjIeaYjpktWTwjbRr/3q+l+R5uLSBbiAWfe1b7rz5UVqkANU/JUyYrohzE+WDzDzg2gsNYJlTXid6fDQnbjI7zbgNX19zunOTvbA7rhLIGUD/ej+3HJxqBDWWL2fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=eZ8lGZzc; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 24b8967e4cbb11f0b910cdf5d4d8066a-20250619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aHlQ29GfE7GPw0vRvmvgfDlNtf7v7UnON80MlnW7oeY=;
	b=eZ8lGZzcuy8e6m2wZHnWYrrZZwcx/xaIO/5d7bxCyTLUvWC3etdMmI+rP8Csh5wsZsZAr1+JyrvejzT8C0udgO31s9+F6OdPHCiVDW1UPVOkU96d63WQAECUsawOGq4f8xnOFmpUVOkvXsQ9AsPcKaCLmg/Nm4XgukoL3r4mUYs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:244a7a8b-5348-4d61-b289-dab4917ff57c,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:09905cf,CLOUDID:9e972377-7521-4364-b0ef-cd7d9c0ecbde,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 24b8967e4cbb11f0b910cdf5d4d8066a-20250619
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1210089391; Thu, 19 Jun 2025 11:11:50 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 19 Jun 2025 11:11:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 19 Jun 2025 11:11:47 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <srv_heupstream@mediatek.com>
Subject: [PATCH v6 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Date: Thu, 19 Jun 2025 11:11:28 +0800
Message-ID: <20250619031142.27180-1-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

This series have the follow changing:
Firstly fix some bugs, including resolution change handleing, stop
streaming sw flow, fix buffer layout and clock setting to support multi-hw
jpeg working and others.
Secondly add mt8196 jpegdec and jpegenc compatible to support MT8196
kernel driver.
Lastly, Add smmu setting to support smmu and iommu at the same time.

This series has been tested with MT8196 tast test.
Encoding and decoding worked for this chip.

Patches 1 fix jpeg hw count setting to support different chips.
Patches 2 fix jpeg buffer payload setting to handle buffer
size bug while resolution changed.
Patches 3 fix jpeg dst buffer layout.
Patches 4 fix multi-core stop streaming flow
Patches 5 fix multi-core clk suspend/resume setting
Patches 6 fix decoding buffer number setting timing issue
Patches 7 fix decoding resolution change operation
Patches 8 fix remove buffer operation
Patches 9-11 Adds jpeg encoder and decoder compatible.
Patches 12 add jpeg smmu sid setting.

---
This series patches dependent on:
[1]
https://patchwork.linuxtv.org/project/linux-media/patch/20250424090824.5309-1-jianhua.lin@mediatek.com/

Changes compared with v5:
--reorder the patches set.
--fix commit message of patch 1-8.

Changes compared with v4:
--fix kernel robot build errors for patch 4.
--add reviewer for patch 1 and patch 2.

Changes compared with v3:
--change patch subject of jpeg encoder and decoder compatible.

Changes compared with v2:
--refactor smmu sid setting function interface
--Some modifications for patch v2's review comments.

Changes compared with v1:
--refine jpeg dt-bindings for MT8196
--optimize software code to manage jpeg HW count
--refactor smmu sid setting function interface
--Some modifications for patch v1's review comments.

Kyrie Wu (12):
  media: mediatek: jpeg: fix jpeg hw count setting
  media: mediatek: jpeg: fix jpeg buffer payload setting
  media: mediatek: jpeg: fix jpeg buffer layout
  media: mediatek: jpeg: fix stop streaming flow for multi-core
  media: mediatek: jpeg: fix multi-core clk suspend and resume setting
  media: mediatek: jpeg: fix decoding buffer number setting timing issue
  media: mediatek: jpeg: fix decoding resolution change operation
  media: mediatek: jpeg: fix remove buffer operation for multi-core
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
    compatible
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
    compatible
  media: mediatek: jpeg: add jpeg compatible
  media: mediatek: jpeg: add jpeg smmu sid setting

 .../media/mediatek,mt8195-jpegdec.yaml        |   8 +-
 .../media/mediatek,mt8195-jpegenc.yaml        |   8 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 170 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  21 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 112 +++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 112 +++++++++++-
 6 files changed, 376 insertions(+), 55 deletions(-)

-- 
2.46.0


