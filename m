Return-Path: <linux-media+bounces-33623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED7AAC8939
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 09:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24D74A5506
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 07:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60295C133;
	Fri, 30 May 2025 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Jvcu5Axg"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF6A1F0E4F;
	Fri, 30 May 2025 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591154; cv=none; b=ZgIhIHYCmsAeNaJBp+BbfTspd1Ah9eqOH1MYPFVFdEu0XboYNtRvEBYeYZL4pu4QEUhIZeUc8P1e0aY8axxRLkqfzOVIN9BejS32+r2XywrY7gFRGSPGkgUI/sLjt8y4xjSpTA1uEVAAcaqDMkufJAeXd5KwT3XkYd+x02UxPkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591154; c=relaxed/simple;
	bh=ikASRT0QeP4Xa705LQ9zxm5dzUW7u5CAdIoYKbpZd9s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pcfiEPNjEFaQtBw1uBAj8HZcqXOc02jRbPFtMdbOcVOtiXtZJQkTavRfikFLLuoJZhItvHahcj74IMIHf36zyaOCk2/Jy4kjp+PQd+vN8Gl0kIxOJ01PZl2nQWwmTVbms+cXjAA4orvSeZPIoLdYRpPmH/My8XrVaMEOqI5GCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Jvcu5Axg; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 15e8144e3d2a11f082f7f7ac98dee637-20250530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tUjyCWk78nrbNtIdynsQ7wKlp/qy1AJHyD8Mcd0RHgk=;
	b=Jvcu5Axg/DO9suNIwAR4dYFqfr08qctNzixDCcZyrXFR//bLqyJQFvfLFTJIG+pDb1GYcwmgn+/mzsQkqa0azOu1eX26MgYZgEjSRILaWQA7kQpcsiYLSHROOi8ZLp0vKm/emqnFgoZhLEu/IUi2eXTHJ2MKK9Z7vtXnATHNP6Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b7021b44-d78f-47dc-acc7-e44a8e719aaa,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:46b3e547-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 15e8144e3d2a11f082f7f7ac98dee637-20250530
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 380165037; Fri, 30 May 2025 15:45:41 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 30 May 2025 15:45:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 30 May 2025 15:45:38 +0800
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
Subject: [PATCH v5 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Date: Fri, 30 May 2025 15:45:25 +0800
Message-ID: <20250530074537.26338-1-kyrie.wu@mediatek.com>
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
https://patchwork.linuxtv.org/project/linux-media/patch/20250424090824.5309-1-jianhua.lin@mediatek.com/

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
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
    compatible
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
    compatible
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
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 169 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  21 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 112 +++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 112 +++++++++++-
 6 files changed, 377 insertions(+), 53 deletions(-)

-- 
2.46.0


