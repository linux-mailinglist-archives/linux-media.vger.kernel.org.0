Return-Path: <linux-media+bounces-56280-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B3xCkNeu2knjQIAu9opvQ
	(envelope-from <linux-media+bounces-56280-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 03:24:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8132C4E4A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 03:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0941F3056B4B
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 02:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51554387569;
	Thu, 19 Mar 2026 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="igq0+RDJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969E238D685;
	Thu, 19 Mar 2026 02:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773886950; cv=none; b=BbmBca9PBDFLw4pytubv9SFU4yx11rl8PQd9z6N6jCYWkHYLtVt7EMBKYeEO6YTTmXlHahOifU1sZzqTYRrqWjmycwZyZWdvH2qiS9LnomJMb6F7B9dKzTMETB5t8MjRjbPk76avZnN5GZTY441p2vfBiqiJM+Q9Knk1Vjqe8Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773886950; c=relaxed/simple;
	bh=wD5QYDOMgQOXA8+vgOmDGUjuMg2sG+2txlV8yVvDHYo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hgR0k6qdFYyoCGs5rkHUPISvBIFoLuraxXD7jiK7LH7jfywpOn/Gne+NTrcZSa5P/E7Jlj1gdeMtGZgkZX4GpCRGM7EN5H0YkaP48bkq+ODVdzcRj7yI+I9mMKRDIxhFkJbf6dWSCs6QCZ6QuGlo9mJY9DuoO6Hzu2pIQhNsDxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=igq0+RDJ; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 66465800233a11f1a39cd589f645bc18-20260319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From; bh=G86BJwnnTtsAT5yJuPNPjOkK/Qg/QAMchdrSuHk2cwY=;
	b=igq0+RDJgetw++gVGCZBFtRiES8Sq6w1B1MT/xXUj8tgyFzWHy627ycaH7nwjRcRewG50yOZik2IWHRyC3QFzWUWc8fbaV9QUdvjVa+Ct3SqROsYyybC/SeUGT2z2F91mrCKyuorDS4rqYRwKaat2uyvGiJSutD3pmQ2PfgEDWE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e1eab08d-1104-492a-aaa1-5db2f16f643d,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:6256f693-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:5,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 66465800233a11f1a39cd589f645bc18-20260319
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1434436620; Thu, 19 Mar 2026 10:21:55 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 19 Mar 2026 10:21:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 19 Mar 2026 10:21:53 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v13 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Date: Thu, 19 Mar 2026 10:21:39 +0800
Message-ID: <20260319022152.31313-1-kyrie.wu@mediatek.com>
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
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-56280-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[xs4all.nl,kernel.org,collabora.com,gmail.com,mediatek.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kyrie.wu@mediatek.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mediatek.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.975];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 9B8132C4E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes compared with v12:
--Rebased on top of the latest media tree
--fix kernel rebot build warnings in patch 5

Changes compared with v11:
--Rebased on top of the latest media tree
--Some modifications for patch v11's review comments.
--add reviewer to commit messages

Changes compared with v10:
--Rebased on top of the latest media tree
--add reviewer to commit messages

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
  media: mediatek: jpeg: fix jpeg cores' amounts setting
  media: mediatek: jpeg: fix jpeg buffer payload size setting
  media: mediatek: jpeg: fix buffer structure size and layout
  media: mediatek: jpeg: Fix buffer completion on multi-core streaming
    stop
  media: mediatek: jpeg: Fix multi-core clk suspend and resume setting
  media: mediatek: jpeg: fix decoding buffer number setting timing issue
  media: mediatek: jpeg: fix resolution change event handling in decoder
  media: mediatek: jpeg: fix remove buffer removal timing for multi-core
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
    compatible
  media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
    compatible
  media: mediatek: jpeg: add jpeg compatible
  media: mediatek: jpeg: add jpeg smmu sid setting

 .../media/mediatek,mt8195-jpegdec.yaml        |   8 +-
 .../media/mediatek,mt8195-jpegenc.yaml        |   8 +-
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 151 +++++++++++++-----
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  19 ++-
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  |  90 ++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  |  88 +++++++++-
 6 files changed, 308 insertions(+), 56 deletions(-)

-- 
2.45.2


