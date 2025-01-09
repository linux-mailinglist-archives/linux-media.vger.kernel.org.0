Return-Path: <linux-media+bounces-24513-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF32A07790
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 14:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC823A6DF7
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 13:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC8F218AA2;
	Thu,  9 Jan 2025 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OxNzW9un"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B11A83E1;
	Thu,  9 Jan 2025 13:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429736; cv=none; b=iQjqyEunhLKUg/gaINbNOYI8SY2hr5nXQsQoiSQF4kTybv2Dba9h3ttX4zITfxpmkla4JkK/UebxdcwYE7WaXr0RxQRZusAe7XgXufDanICfy//1rfHinTUjp+UPbCg6hn0vWB0b6wgz6X+KmUM4qE72Gz+8myLiQr3uX//MbiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429736; c=relaxed/simple;
	bh=9xpajja8yxYHoRUKRft3X9m1o7b+Ai2scAJrzWDOJHQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PZxEZXXDsQgyCjo082/GD0Xtus6ivyYSxpzQpq999G9yMfQ/3LPTo9T3GEqqqZhXUe06okDhay/CUkGZ4tcg23ScCDNvaw/55DDQqKNMfXzwOHHoq9Sv+eRVnAhzyCB2XD0hH4j+s6iDgfEVrhy/lJqGNy/yRAWhusNPeYPH1gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OxNzW9un; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 944a8156ce8e11ef99858b75a2457dd9-20250109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Q7IqtAzsqRyq2MV5yJRjbh9Wk4+9FAZ/gH0fjGvtH5o=;
	b=OxNzW9unI0DY2kGLvksThCOmnVwI9xxsCSzS0cTx6SCGCStgNv/hyiTfF0ZLfcNkBLdz8BSUepxenlSa9/TgXSYSFCuE4n51OVc/SQxujXuoEeXYEOVQgp3Z6J0/CllLXFp9pafY0j7Hs05g1cIHjhzkRS1OmWrY49E6JmO8XG4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:665d547c-e449-4c2e-b0a5-c830c43bf7e5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:ce02a30e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 944a8156ce8e11ef99858b75a2457dd9-20250109
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 338430475; Thu, 09 Jan 2025 21:35:24 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Jan 2025 21:35:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Jan 2025 21:35:22 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [V1,00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Date: Thu, 9 Jan 2025 21:35:00 +0800
Message-ID: <20250109133513.20151-1-kyrie.wu@mediatek.com>
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

This series adds support for mt8196 multi-hardwares jpeg enc & dec,
by first adding mt8196 jpegdec and jpegenc compatible to install
kernel driver. Add smmu setting to support smmu and iommu at the
same time.
Secondly refactor buffer and clock setting to support multi-hw jpeg
working.
Lastly, fix some bugs, including resolution change handleing, stop
streaming sw flow and others.

This series has been tested with MT8196 tast test.
Encoding and decoding worked for this chip.

Patches 1-3 Adds jpeg encoder and decoder compatible.
Patches 4 add jpeg smmu sid setting.
Patches 5 fix jpeg hw count setting to support different chips.
Patches 6 refactor jpeg buffer payload setting to handle buffer
size bug while resolution changed.
Patches 7 reconstruct jpeg dst buffer layout.
Patches 8 fix multi-core stop streaming flow
Patches 9 refactor multi-core clk suspend/resume setting
Patches 10 fix decoding buffer number setting timing issue
Patches 11 refactor decoding resolution change operation
Patches 12 fix remove buffer operation

---
This series patches dependent on:
[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20240808092555.12999-1-jianhua.lin@mediatek.com/

kyrie.wu (11):
  dt-bindings: mediatek: Add mediatek, mt8196-jpgdec compatible
  dt-bindings: mediatek: Add mediatek, mt8196-jpgenc compatible
  media: mediatek: jpeg: add jpeg compatible
  media: mediatek: jpeg: add jpeg smmu sid setting
  media: mediatek: jpeg: fix jpeg hw count setting
  media: mediatek: jpeg: refactor jpeg buffer payload setting
  media: mediatek: jpeg: refactor jpeg dst buffer layout
  media: mediatek: jpeg: fix stop streaming flow for multi-core
  media: mediatek: jpeg: refactor multi-core clk suspend and resume
    setting
  media: mediatek: jpeg: fix decoding buffer number setting timing issue
  media: mediatek: jpeg: refactor decoding resolution change operation
  media: mediatek: jpeg: fix remove buffer operation for multi-core

 ....yaml => mediatek,multi-core-jpegdec.yaml} |  10 +-
 ....yaml => mediatek,multi-core-jpegenc.yaml} |  10 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 126 ++++++++++++------
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  17 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 116 +++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |   4 +
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 113 +++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |   4 +
 8 files changed, 343 insertions(+), 57 deletions(-)
 rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegdec.yaml => mediatek,multi-core-jpegdec.yaml} (95%)
 rename Documentation/devicetree/bindings/media/{mediatek,mt8195-jpegenc.yaml => mediatek,multi-core-jpegenc.yaml} (94%)

-- 
2.46.0


