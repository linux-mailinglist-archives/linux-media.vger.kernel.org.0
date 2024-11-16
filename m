Return-Path: <linux-media+bounces-21472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865AA9CFC87
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 04:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D400B28992
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 03:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811BF192B6D;
	Sat, 16 Nov 2024 03:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OfdQrJwx"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4A31917D7;
	Sat, 16 Nov 2024 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731727055; cv=none; b=cdtqhHN7yYOl4rnG4FNgThDY8HRU0H4Hlf/Pvzyw9E9zt+MXVSHff+2rsFkekmLzVmaxefv0LuNAnCAYVRcSm1/gy9ldVQe7AtW+Pq6OWVzECknnxgL/WC8Z3LiKSe4G746YX7BH2gEXglldJfiYyzY6vWenYJqf8Z6ymfnHHm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731727055; c=relaxed/simple;
	bh=1oRf4xfxqP4Fmmv3xgyZJKH3inkDIRnHsnoX117+NMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bOwnMBZja0Fqus+t9KMpr2F4yRbxUXfAvAkiEdpNARTyOhb9hJ8vWVLkejWyzwS1XDRVWtZ4P1nU/j1rtlXupxM7VgdZQ3LMtMSqo4Qlg7U46thM/FlRNxn7cptgjvO198eIB785XAq0ljoCsPuJzjpuxwnGRat55k3e4DZutgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OfdQrJwx; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4e4cfed0a3c911efbd192953cf12861f-20241116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+9ZnJdqr79k+Y/T3mTs8BQS5odlDph9aBEoH/UgRHOg=;
	b=OfdQrJwxrQWPLraRh3CvJ7CJtqTfJkH1fuSSlEZiIVyY2RkeonPFI0fVBDtYOTwmzjWwcq0nJEEtc/wjeFEBAFlYOyxwaO6orCrmnGFtuzM9mhbUP/dmMD/iFC11abUjp9C/kYsXt0RQcbQBSXWsay7jnU5gWgAX8NjEWiYJxRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.43,REQID:40ac1d20-3be3-453f-bc1b-629e765b81e3,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:ce19b8a,CLOUDID:3f182a07-6ce0-4172-9755-bd2287e50583,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 4e4cfed0a3c911efbd192953cf12861f-20241116
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1564287710; Sat, 16 Nov 2024 11:17:26 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 16 Nov 2024 11:17:25 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 16 Nov 2024 11:17:24 +0800
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
Subject: [PATCH v7 0/5] media: mediatek: vcodec: fix v4l2_ctrl_request_complete fail
Date: Sat, 16 Nov 2024 11:17:14 +0800
Message-ID: <20241116031724.15694-1-yunfei.dong@mediatek.com>
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

User space attach the syntaxes and bit-stream buffer to a same media
request for stateless decode, and the syntax controls are the only
v4l2 control request. The request will be marked to complete status
when the buffer is set to done, then request object will be cleaned
form media request.

When v4l2_ctrl_request_complete() is later called, the control request
detect that there is no controls in the request object. It then creates
an empty control request object, but attaching an object to a completed
request is not allowed. Using manual request completion to handle the
request complete event.
---
depends on manual request completion patch:
[1] https://patchwork.linuxtv.org/project/linux-media/cover/cover.1724928939.git.hverkuil-cisco@xs4all.nl/
---
compared with v6:
- Using manual request completion for patch 1
- rebase on latest driver for patches 2/3/4/5

compared with v5:
- fix comments for patch 3
- fix smatch error for patch 1

compared with v4:
- re-write the commit message for cover-letter
- change patch 2/3/4/5 commit message

compared with v3:
- fix flush decoder issue when userspace stream off capture queue firstly
- fluster test result same with v3

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
Yunfei Dong (5):
  media: mediatek: vcodec: support manual request completion
  media: mediatek: vcodec: change flush decode order when stream off
  media: mediatek: vcodec: remove media request checking
  media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M
  media: mediatek: vcodec: store current vb2 buffer to decode again

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 43 ++++++++--------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  2 +
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 51 ++++++++++++-------
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 14 ++---
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 15 +++---
 5 files changed, 72 insertions(+), 53 deletions(-)

-- 
2.46.0


