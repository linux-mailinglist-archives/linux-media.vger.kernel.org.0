Return-Path: <linux-media+bounces-19535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FA799C15F
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8CA61C2236E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A441494DE;
	Mon, 14 Oct 2024 07:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H22dOdLm"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF7114373F;
	Mon, 14 Oct 2024 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891200; cv=none; b=jxmKq155KBYZunwVtbFSl2NKXFcgYYrjZV3M+Y8XerbnF6wmgWV5sqXY11gIniThOCRUbG7dY/CPFDCCPjKqQ6aSDB48K6pOc1RqFZwDJTQ/vqt555Ms/B4RReFlqyCawjt1Y9/ZhqbZDeMdVc49TaiW1G7OS9sh6/a9GCP1/t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891200; c=relaxed/simple;
	bh=3kMsJqU2vFObyJn3KXp+d82yG/GUzn1cufdm/AqjBj8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hB4+Vx2eky3wCltG721ffIjE/i4lKD2KNocSPjzELNmO0Lf/9wKYX2Tv+PnYlkpDg7uy9XIb7URaJu0z8DZwhgcIRnh08aa7IivuM5fExy9TzzirLgO0723nFczvtlDfgPEXwFwgxeEgTwJBkJc/9X9a/ofI70ap7fgpp7qzdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=H22dOdLm; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 919ad27889fe11ef88ecadb115cee93b-20241014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+ccPUlxoWYb2N/Xj1O6fXBzFxm62ZRQMc5csPYeqYmk=;
	b=H22dOdLm0WQci99chqRDyPI8Mi/HPfHD3n2kcLzuCrg4wIjFyGcgAqzIY9n7uf+m7ChJE1bix94vBiJ3qacA+UUYRV90Wpq8EjtFT0HwRKe2pJT2msAcU3qdUDlKfrVghiY5/r629I05iqjlg1x1X/LSbCUMI+0fZjhTHOfqZaw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5817445b-234e-4067-864d-1a6c7e063218,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:7d913641-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 919ad27889fe11ef88ecadb115cee93b-20241014
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1721229125; Mon, 14 Oct 2024 15:33:12 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Oct 2024 15:33:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 14 Oct 2024 15:33:10 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/6] media: mediatek: vcodec: support h264 extend vsi
Date: Mon, 14 Oct 2024 15:33:04 +0800
Message-ID: <20241014073314.18409-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.660900-8.000000
X-TMASE-MatchedRID: AIneCDrHljUEQqIqKFLtTmf5YFI3LLMhmX+W7bzPOQFcKZwALwMGs0cW
	Drfntjxwc6aye5Pnub+uVX99ICt6ji6NsFOtZ8f6EhGH3CRdKUVWOQQSa4vbHQfxTM57BPHD12F
	2GovFrSOVMlcqqHWd7aBVvEjzNBpCHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgW4g49Ra2QKgvDfU
	E7T1eqLdVCaGNhZgZBCDiARPE8nvNojKASPn5iew==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.660900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 86686F6C60E70B8125DCE2D6446E57279E7D83F3E49091D6548527FC217E89402000:8
X-MTK: N

The working buffer address start and end are calculated in kernel
side currently, can't calculate the address end if the driver only
getting the address file handle, not the real physical address. Need
to extend the vsi to calculate the address end in scp.

Re-construct some interface and add config to support extend and non
extend at the same time.
---
This patch series depends on:
[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20241012064333.27269-1-yunfei.dong@mediatek.com
---
Yunfei Dong (6):
  media: mediatek: vcodec: extend h264 video share information
  media: mediatek: vcodec: remove parse nal info in kernel
  media: mediatek: vcodec: remove vsi operation in common interface
  media: mediatek: vcodec: rename vsi to extend vsi
  media: mediatek: vcodec: adding non extend struct
  media: mediatek: vcodec: support extend h264 driver

 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 516 +++++++++++++++++-
 2 files changed, 493 insertions(+), 25 deletions(-)

-- 
2.46.0


