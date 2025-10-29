Return-Path: <linux-media+bounces-45899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E7C1888B
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 07:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69BDC401852
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 06:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BDA30DEA0;
	Wed, 29 Oct 2025 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IG+ozAnr"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCC230AACC;
	Wed, 29 Oct 2025 06:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761720849; cv=none; b=YOO+L3xiUVnrm6pk0baEmnhwfiL4b01bLF+gZHPHqoYcpREnmkbB0CDTDecCfZRmZMVNylGKe1J50gvi8swd2z7xVQyPnRoWXZ1dM4QUXg2zVe9rnt+lIG3FTDUBR2isDq/WajBmQe6Yxgot1BYt1WAGhzJJVlNtEFqblhU/t9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761720849; c=relaxed/simple;
	bh=UWjg1I8loEhZ2p3rtKferQ04t5INBC31XUAKIahRIIk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OWZsgYRD9JD/eggRkzbGwPS+lOWzVz8N4qwTRqK2M4vmPK0jRS8pn0/HaA5JTVxPWrc9niSa/RlXYjobJtm1moyRlTQzBvj0oZGsdCd6xAijzAEJQC/HdiwvaXF/UEsEi0BUpadM2bOAPq9d85KTh4GQ0mb/7SvdrpSNLA4Kbnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IG+ozAnr; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0b0cb084b49411f0b33aeb1e7f16c2b6-20251029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From; bh=qDq6w3/zzkTLqs+mK/IlOfjEbX3l3XrldgIdINPoi2o=;
	b=IG+ozAnrnjIPCvw3rB+4FB1M391Q9rbmlIaotPZ6gQMtNNohV+KDeQGWCxbw4E9bx3J2tv5laeyEW1n9+ssfgjBd0ioxeRyfpI9ecZuR2Dw8f+tY7Ze37Cy30afwMkpE7GYPhWs9VIzzRFVGDecILltJElCzYxR70xBYCmida18=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:2cf4665f-8b70-443c-bc2c-4e9a7226467c,IP:0,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-20
X-CID-META: VersionHash:a9d874c,CLOUDID:dfd96c84-4124-4606-b51d-d5c9eec0e7b9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:1,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0b0cb084b49411f0b33aeb1e7f16c2b6-20251029
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 944319919; Wed, 29 Oct 2025 14:53:58 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 29 Oct 2025 14:53:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 29 Oct 2025 14:53:56 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v10 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Date: Wed, 29 Oct 2025 14:53:41 +0800
Message-ID: <20251029065354.22257-1-kyrie.wu@mediatek.com>
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
Changes compared with v9:
--Rebased on top of the latest media tree

Changes compared with v8:
--Rebased on top of the latest media tree

Changes compared with v7:
--Rebased on top of the latest media tree

Changes compared with v6:
--Rebased on top of the latest media tree

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
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 174 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  21 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 112 ++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 112 ++++++++++-
 6 files changed, 378 insertions(+), 57 deletions(-)

-- 
2.45.2


