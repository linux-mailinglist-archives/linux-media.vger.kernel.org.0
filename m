Return-Path: <linux-media+bounces-13156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 406D59065C9
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 09:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E98471F26550
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 07:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42A413C9D5;
	Thu, 13 Jun 2024 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hk2ucAmF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C524D13C902;
	Thu, 13 Jun 2024 07:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718265355; cv=none; b=hp8b7PcZ0qzuLJ8PjNyh7lXF9OL1P7rxWW4pUdKdRay+YOD/5RIsRC1BCgH0fYQE8+DbvXI+1gNWKvuHPFP6XJWSQL+CshZKmQL5tYI7hrLBlfxY48Tdz1NK2DLtov2p5Xo7fkuAfGPxPGMpRwHpOOzBZl+6HNxEn+y4FlLleDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718265355; c=relaxed/simple;
	bh=FqVEJgSnNNwmjR23vP+xW2rempYJsJcSnuTqB3mNp1A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k1fgQKLMwDIZU2vlvO063vrLhqWHRRGcI2V/ErsUALERqzBxNo7zrE+a3PrCokWZgJuclQKuNtmzM5PYTp5IPeyQNf7qXa5XnNtP2m3b2LonK6N2SxS/uEx0uRxa0fTtlrp5lxuk4XIfbfqLn/Iu5WKj4z7Fut0kEa0OSxrIpv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hk2ucAmF; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 58310304295a11efa22eafcdcd04c131-20240613
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sB3TQ1hsgFFVf1bnMvCxYjBr6NFgk3dyfi1svtfepEQ=;
	b=hk2ucAmFmOhz4yvnIJdx3aecMSJi8DIoPhEud71nfjdJ6U3de6/+5o2ksYHVHrHmuB79M902lMnhK9sDiZqUqFyc7Qq/jun7ckxkeyieS8AHeHvYTe+ldafUyhGMSKv073BXOsLQApoKRGWPizO/x1lMyBvGkhljGhZuMf1MpXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:576efb56-9924-4aef-aa15-9c006b88b048,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:d8ac8988-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 58310304295a11efa22eafcdcd04c131-20240613
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 113585200; Thu, 13 Jun 2024 15:55:47 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Jun 2024 15:55:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 13 Jun 2024 15:55:45 +0800
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
Subject: [PATCH v3 0/7] media: mediatek: vcodec: fix v4l2_ctrl_request_complete fail
Date: Thu, 13 Jun 2024 15:55:25 +0800
Message-ID: <20240613075532.32128-1-yunfei.dong@mediatek.com>
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

v4l2_m2m_buf_done is called in lat work queue, v4l2_ctrl_request_complete
is called in core queue. The request status of output queue will be set to
MEDIA_REQUEST_STATE_COMPLETE when v4l2_m2m_buf_done is called, leading to
output queue request complete fail. Must move v4l2_ctrl_request_complete
in front of v4l2_m2m_buf_done.

Patch 1 setting request complete before buffer done
Patch 2 change flush decode from capture to output when stream off
Patch 3 flush decoder before remove all source buffer
Patch 4 using input information to get vb2 buffer
Patch 5 store source vb2 buffer
Patch 6 replace v4l2_m2m_next_src_buf with v4l2_m2m_src_buf_remove
Patch 7 remove media request checking

---
compared with v2:
- add patch 5/6/7 to fix decode again issue
- add fluster test result with mt8195 platform(same with no changed):
  1> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0 -j1 -t 90
     VP8-TEST-VECTORS 59/61
  2> ./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0 -j1 -t 90
     VP9-TEST-VECTORS 276/305
  3> ./fluster.py run -d GStreamer-AV1-V4L2SL-Gst1.0 -j1 -t 90
     AV1-TEST-VECTORS 237/239
  4> ./fluster.py run -d GStreamer-H.264-V4L2SL-Gst1.0 -j1 -t 90
     JVT-AVC_V1       95/135
  5> ./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -j1 -t 90
     JCT-VC-HEVC_V1   142/147

compared with v1:
- add patch 2/3/4 to fix timing issue.
---
Yunfei Dong (7):
  media: mediatek: vcodec: setting request complete before buffer done
  media: mediatek: vcodec: change flush decode from capture to output
    when stream off
  media: mediatek: vcodec: flush decoder before remove all source buffer
  media: mediatek: vcodec: using input information to get vb2 buffer
  media: mediatek: vcodec: store source vb2 buffer
  media: mediatek: vcodec: replace v4l2_m2m_next_src_buf with
    v4l2_m2m_src_buf_remove
  media: mediatek: vcodec: remove media request checking

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 52 +++++++++----------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  4 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 48 ++++++++++++-----
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 18 ++++---
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  4 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  4 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 19 ++++---
 .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  4 +-
 8 files changed, 89 insertions(+), 64 deletions(-)

-- 
2.18.0


