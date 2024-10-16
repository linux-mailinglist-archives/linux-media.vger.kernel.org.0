Return-Path: <linux-media+bounces-19714-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D944799FFAC
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 05:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 901B61F2112F
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2024 03:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9367217C210;
	Wed, 16 Oct 2024 03:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nDSVfLp2"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD8101F7;
	Wed, 16 Oct 2024 03:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729050578; cv=none; b=npzBP3Mu9aUpuuaBtWtZ7MwCxQi8Dm/yvLhqwZETISWSa67BkuC0GBTURewQb5JO/3SAuW5iW02LoWWUiM4o9mvwHxA7XB0HRFBycAvIKvziQaEoPCSodLVntQz4Dha4pD7nfzfYcu8n2fdVoLMhLdfKAleIaWlre6ZY47+eMAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729050578; c=relaxed/simple;
	bh=Zc+MM6+KdzmszBqgv4XyLevhOYq81t2SQ7Rs6PSURFU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S11jBb2MpRUb+qRRywD6hOmK+Xk91R4OWi43yMC+cd6Fcizi8B8cfLP8Z1uDJdXn7dY6oKdXUW1IK2J7VHpQL91EUCFQLdkk10JZAWQ/4gfywKgHcxoq8UEH2E5041uNQX8ixRU9DZ+VgKVFp7ARBE07IQKIWHK7C2rRnRFkvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nDSVfLp2; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: a4a070348b7111ef8b96093e013ec31c-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=UX52YhdbKgD96uWWXtuamNI4w+fkohPbaLtS/+eKN6U=;
	b=nDSVfLp2/IQ+n4FIsafpBaNO/zI7F0N8BU5mfp1zgFvoJlKGLYl/+NIZ6in+7D8W44pj0s6k3so72okIA9pk9/7ytbQ0DEFydwN+BttVpfIs1+MTnYDue5SQJ6TpDYe5ZVVCdgMIQD4Kw/efalK6p5sfjNR2rZi6R0U+XS2Rw6c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f4e82bd5-207f-413c-ba9b-133501a46715,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:f20c5165-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: a4a070348b7111ef8b96093e013ec31c-20241016
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 798193337; Wed, 16 Oct 2024 11:49:28 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 11:49:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 11:49:25 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Steve
 Cho <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/6] media: mediatek: vcodec: support h264 extend vsi
Date: Wed, 16 Oct 2024 11:49:19 +0800
Message-ID: <20241016034927.8181-1-yunfei.dong@mediatek.com>
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

The working buffer address start and end are calculated in kernel
side currently, can't calculate the address end if the driver only
getting the address file handle, not the real physical address. Need
to extend the vsi to calculate the address end in scp.

Re-construct some interface and add configuration to support extend
and non extend at the same time. Needn't to parse nal info for extend
architecture.
---
This patch series depends on:
[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20241012064333.27269-1-yunfei.dong@mediatek.com

---
compared with v1:
- combine some pathes together for patch 2
- re-write patch 4
---
Yunfei Dong (4):
  media: mediatek: vcodec: remove vsi operation in common interface
  media: mediatek: vcodec: support extend h264 video shared information
  media: mediatek: vcodec: support extend h264 driver
  media: mediatek: vcodec: remove parse nal info in kernel

 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 511 +++++++++++++++++-
 2 files changed, 486 insertions(+), 27 deletions(-)

-- 
2.46.0


