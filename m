Return-Path: <linux-media+bounces-39964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78644B27BD2
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 10:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C6B4178FBD
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 08:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675082D63E0;
	Fri, 15 Aug 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ofoG9Owt"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E282BE64F;
	Fri, 15 Aug 2025 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755247984; cv=none; b=OFh4YS0ZaJq3leuLqicqRG15AX1rDhBMgjPhjecjcw+IGH1qkTyVo7yZ2FW6p9ISx43Fxk0TSN/euTAiDdj6tCp4Qx7Ey21h3rFjnsyFQPVNQejPEl6dhBx8xoSybgcJNzfUE1WhcUbikhoK9beIgVG9p2FQLYMwnHEqdkJTySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755247984; c=relaxed/simple;
	bh=yLYc9mdIHzjvB5jXOJT+kj/pdbIAfVCIgHmjcYwvGbU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KkG7XL3neE2OtO/GnQstbEUcmqFsP4Rhtqhz7CWKp7MxMT38EKMh+WvuWoWXLA14S2xlX3QzrENlrGLNXFZGyBgCqOFk+22BntRIcRQEzyo1H3VrUWR/2by1jsKVmrIdKjqErOKdGZ+ae0DHKe1QyPzRab7y+4GMT5QUggIxi7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ofoG9Owt; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 375c3f0279b511f08729452bf625a8b4-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=m8b7ww2HModMWqJw4ufn2iUaA5FiOaPyS039PaHKMDw=;
	b=ofoG9OwtQq0eNthDpfkW5zIv/HCsJ+TAZ83ZGCCkXk45sn5qfHebWekNkFKQTFhNbX+WVx7jV8nCGoPCOiCWniz2PvSabrmH01HjYNOpsOj6FSV+8E7y1WezHiuH//FZutKTTvsKvLpfu3KwZQl/M8bFYVHOBrltWCzMU/S7YpU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:dc225ad0-a24b-456f-854e-d44aece59474,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:2a45f7f3-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 375c3f0279b511f08729452bf625a8b4-20250815
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1929980233; Fri, 15 Aug 2025 16:52:47 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 15 Aug 2025 16:52:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 15 Aug 2025 16:52:44 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 00/14] media: mediatek: vcodec: support video decoder in mt8196
Date: Fri, 15 Aug 2025 16:52:13 +0800
Message-ID: <20250815085232.30240-1-yunfei.dong@mediatek.com>
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

Using vcp micro processor to support video decoder in mt8196 platform,
need to add new firmware interface to communicate with vcp in kernel
side. Then add mt8196 compatible, codec levels/profiles and private data.
Re-write av1 driver to support extend vsi struct, then change irq table
and cdf table size.

This patch set depends on "Add VCP support for mt8196"[1]

[1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20250402092134.12293-2-xiangzhi.tang@mediatek.com/
---
Changed in v2:
- re-write the commit message for patch 1
---
Yunfei Dong (14):
  dt-bindings: media: mediatek: vcodec: add decoder dt-bindings for
    mt8196
  media: mediatek: vcodec: add decoder compatible to support mt8196
  media: mediatek: vcodec: add driver to support vcp
  media: mediatek: vcodec: add driver to support vcp encoder
  media: mediatek: vcodec: get different firmware ipi id
  media: mediatek: vcodec: get share memory address
  media: mediatek: vcodec: define MT8196 vcodec levels.
  media: mediatek: vcodec: support vcp architecture
  media: mediatek: vcodec: support 36bit iova address
  media: mediatek: vcodec: clean xpc status
  media: mediatek: vcodec: add debug information
  media: mediatek: vcodec: send share memory address to vcp
  media: mediatek: decoder: fill av1 buffer size with picinfo
  media: mediatek: decoder: support av1 extend vsi

 .../media/mediatek,vcodec-subdev-decoder.yaml |   1 +
 .../media/platform/mediatek/vcodec/Kconfig    |   4 +
 .../platform/mediatek/vcodec/common/Makefile  |   4 +
 .../mediatek/vcodec/common/mtk_vcodec_dbgfs.c |  21 +-
 .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  16 +
 .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   2 +
 .../vcodec/common/mtk_vcodec_fw_priv.h        |  12 +
 .../vcodec/common/mtk_vcodec_fw_vcp.c         | 493 ++++++++++++++++++
 .../vcodec/common/mtk_vcodec_fw_vcp.h         | 151 ++++++
 .../vcodec/decoder/mtk_vcodec_dec_drv.c       |  16 +
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   1 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        |  28 +
 .../vcodec/decoder/mtk_vcodec_dec_hw.h        |  13 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c |   6 +
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c |  85 ++-
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  10 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  11 +-
 .../vcodec/decoder/vdec/vdec_vp8_req_if.c     |   4 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |  20 +-
 .../mediatek/vcodec/decoder/vdec_ipi_msg.h    |   2 +
 .../mediatek/vcodec/decoder/vdec_vpu_if.c     |   9 +-
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |   1 -
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.h  |   2 +
 include/linux/remoteproc/mtk_vcp_public.h     |   2 +-
 24 files changed, 871 insertions(+), 43 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vcp.h

-- 
2.45.2


