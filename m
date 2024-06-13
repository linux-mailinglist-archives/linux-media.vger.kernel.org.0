Return-Path: <linux-media+bounces-13175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83E9068E3
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 11:34:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9064C1C2243B
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9C713F452;
	Thu, 13 Jun 2024 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NDoSpHHB"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802913D891;
	Thu, 13 Jun 2024 09:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718271250; cv=none; b=dEOoiF+HwGQbJbGfheuRkOax/HrW097A9mX7GSJH+B4WROQYJvihGLgEVLlrQTVfxBAFGsRIB5LAJu0YOdjNOBmrSLfXzUCIM8pH1jsM72lCZonpPxcLUb5kzdILDxgks/SGZzlEgjdwJZ0bRoj+3N8pi/2MtPOXpKJ1zwJY6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718271250; c=relaxed/simple;
	bh=a+cbWQvvYbCHyU10BIV7kSt3CraTWeso0Dxz5NmyJxg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l/1XCNgd4EBfD4dn+sUdt/aPqqOiJ4J1Sfw8gXu+BTDhWau1LECU4DhjSRuSzyKNPg7Ycbj6E49lpQg7WydZv2JubAA29XIgZ6utsmbPpxFbDj++4wgr5O8ySles6YyB1uFpE2CBKZTbcR0gti91xBBYqm2iaiFZtLmTQ6h6KE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=NDoSpHHB; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 115e1d46296811efa22eafcdcd04c131-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vPX1AHD54ZweMud2CAGeNnwrJ7C9fon4sYTRXKnYsD8=;
	b=NDoSpHHBM/n23oYXmezy28QrTPQbox3OJBdQUFg7uYJqqb4IwBaU0wUd6KUXF49I+4OwaVNHKy28L3uZ1nJ9pfpLsB+I9+8SL/MBdBXnX3yvgF1SaT1sg7txWOL4cSvd+TX4DzMOQhk/qc6CBRhwMCRFVYVPlNv3yhBsADpOUmw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:71b0c558-c9a9-4369-ad16-40f3507c8c0f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:393d96e,CLOUDID:7ef28a88-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 115e1d46296811efa22eafcdcd04c131-20240613
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1758424830; Thu, 13 Jun 2024 17:34:01 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 17:34:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 17:33:59 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/3] media: mediatek: vcodec: fix vcodec smatch warning
Date: Thu, 13 Jun 2024 17:33:54 +0800
Message-ID: <20240613093357.583-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Fix below smatch static checker warning from [bug report]:

The patch 397edc703a10: "media: mediatek: vcodec: add h264 decoder
driver for mt8186" from May 12, 2022 (linux-next), leads to the
following (in development) Smatch static checker warning:

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c:351
vdec_h264_slice_decode() potential NULL container_of 'fb'

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:337
vdec_vp8_slice_decode() potential NULL container_of 'fb'

drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c:728
vdec_h264_slice_single_decode() potential NULL container_of 'fb'

---
Changed with v1:
- Change the return value from -EBUSY to -ENOMEM when the driver can't get
  frame buffer.
---
Yunfei Dong (3):
  media: mediatek: vcodec: fix h264 multi statless decoder smatch
    warning
  media: mediatek: vcodec: fix vp8 stateless decoder smatch warning
  media: mediatek: vcodec: fix h264 stateless decoder smatch warning

 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c    |  9 +++++++--
 .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c       |  9 +++++++--
 .../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c     | 10 +++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.18.0


