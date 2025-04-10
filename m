Return-Path: <linux-media+bounces-29848-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B8A83943
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C91BB1B63E1E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9876204697;
	Thu, 10 Apr 2025 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bKcE2V3K"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C742036F9;
	Thu, 10 Apr 2025 06:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266624; cv=none; b=Y4v1ZSIFtZcdxxzDmqmmTXMM7OOoinzdIXBf3dYiwMx7eyl4fgPoIBbZ8JHzduOI582Kmi0IExQfctX1Dti3ZG+SuKm8UXc2K8MFHmjnHOYbIP5c71EqQ+e/TtQXy40ODrHY5zHrBUaF4DtuH+pCsKwDRLo91XJHpxj1eqZVZ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266624; c=relaxed/simple;
	bh=Z6hF1SrtlgxWuml0yFb+sRiUvm6d7mVPfH6rZPSEC/4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wp0VvC6/WibxzHl3vi3Fh3K9KYya9LkbbEALWInOsK6ipoNv2qw8Yt5NtZqn9ZDIjZNTIcgRp3IjVv3hrijDFhq16ONHNvzcJg7EFforgIQYQYJxMoes/OSMe7Fezq5+DF4u9l54cpBOiOqk3Ce/UbgFSy8d5bbboHpPO9AcROk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bKcE2V3K; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 41f40efc15d511f08eb9c36241bbb6fb-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ulVM59ZeQ8rXPZCTFkVp7wxXjbIZ6rNqXUAn/FbeXy4=;
	b=bKcE2V3KK2iFZeV81s9h3aE2MP+CMK7IZW1EUn77Cra9AgLghfuL8zxksneHUgePfj9njbo8CDCL7yRkpBh23v74nlBjf8gsT7z/OykYycDGiRkwsDOGpcjKxwvgMaeNYzX0L066C3i0ffD4uLWZPF3guKUTiVyP7zXguBEpfRM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3968d3a2-77a9-419f-896d-d0810f9165df,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:3cc86f8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:2,IP:nil
	,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT
X-CID-BAS: 5,DFT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 41f40efc15d511f08eb9c36241bbb6fb-20250410
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2102496725; Thu, 10 Apr 2025 14:30:12 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:10 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Date: Thu, 10 Apr 2025 14:29:53 +0800
Message-ID: <20250410063006.5313-1-kyrie.wu@mediatek.com>
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

Changes compared with v1:
--refine jpeg dt-bindings for MT8196
--optimize software code to manage jpeg HW count
--refactor smmu sid setting function interface
--Some modifications for patch v1's review comments.

kyrie.wu (12):
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

 .../media/mediatek,mt8195-jpegdec.yaml        |   8 +-
 .../media/mediatek,mt8195-jpegenc.yaml        |   8 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 166 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  25 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 113 +++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 114 +++++++++++-
 6 files changed, 381 insertions(+), 53 deletions(-)

-- 
2.46.0


