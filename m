Return-Path: <linux-media+bounces-21095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B82949C14AD
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 04:32:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11E16B21F43
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 03:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44415149C64;
	Fri,  8 Nov 2024 03:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jXeOdRD0"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A6B1BD9FF;
	Fri,  8 Nov 2024 03:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731036753; cv=none; b=lxlRaPNohz7s7zH4pYP9WI5CNJaFAQxubJagmosSAqjemJJQ0OuHrx/8/fjsg2DStBtLw3kafkM+uwmpjvqsy3odcnv2O5rgCyy1hG+nxFMaFCmBMVtChGI4kIJYCQuF/CVVU/sclbwXq3T/j3EuyGXeBNUaSYgfEfQdlfUHlvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731036753; c=relaxed/simple;
	bh=dBlts2hBIVXlsYmteIfk2wCyPQ5WDu2SSqXCpibXMps=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P3xCBDxUWSSY8vNvWQvN1TkESgvUIK4IFl1Ilgt4MMc2qVbtAZki8CJkzoyzDCI6czlUVeP9a5aa6eyG4jDGP/vbZb7je7wHOu3D8tsuKFeNGi0X+NVK1muoQ8+bjsiouGnB+HWK/Eh7HObHAcrR3WV1CvH+661vsT7KaqSaAkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=jXeOdRD0; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 11a690569d8211efb88477ffae1fc7a5-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qHyhtnTmpzhLmiRq7vfF+OJbaKeoQyoAn074kNyuWBw=;
	b=jXeOdRD0Bizy5m7EQH782VYku94YSuGPRtjlKgD/geXEEyorwLHZwBScB1d8NaLfsLikGoIPWYg7NeCm/m1/vWZZltdg8fsKlo3k7CbI9YGEHUyoJUfliWIEV/SPyn4Vld2zzspxwZ4RYTbeLjAifNN+EPB9lnSteiA17ZvhTww=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:cc90b84a-1a83-463c-bb48-d882ec380096,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:b9bbd01b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 11a690569d8211efb88477ffae1fc7a5-20241108
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1595994137; Fri, 08 Nov 2024 11:32:23 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 11:32:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:32:20 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, "Steve
 Cho" <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 0/5] media: mediatek: vcodec: fix v4l2_ctrl_request_complete fail
Date: Fri, 8 Nov 2024 11:32:09 +0800
Message-ID: <20241108033219.19804-1-yunfei.dong@mediatek.com>
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
X-TM-AS-Result: No-10--10.532500-8.000000
X-TMASE-MatchedRID: FCK742qayD3fr/48DfD8ikKcYi5Qw/RV7yWPaQc4INTNAKQEz5hQBcbd
	nXrRbZelzEn2dr2GydgnP0+8BL2Zy/7yFV5x5lOPl1zsjZ1/6ay7nrAU9KQxUVvo8FSqar5S4Hw
	516InYmpV0K7Q26gMAtwQxExvMxeXGexLvU6j8fC+dJWHbg4ITjFcf92WG8u/J8Fns6jhn6Rm+j
	6YVbX2YOMJ4Tm/iUfkgDLqnrRlXrZ8nn9tnqel2MprJP8FBOIaD3ujOwMRm9S9tOVjL8prCBFor
	y621ptAexu2PGiWNuiJOiuqEW0sbw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.532500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	306DCF8989F9A0BE84FF8E4FB28D4A23BB4E40BD846288059C3D0E830EC48DAA2000:8
X-MTK: N

User space attach the syntaxes and bit-stream buffer to a same media
request for stateless decode, and the syntax controls are the only
v4l2 control request. The request will be marked to complete status
when the buffer is set to done, then request object will be cleaned
form media request.

When v4l2_ctrl_request_complete() is later called, the control request
detect that there is no controls in the request object. It then creates
an empty control request object, but attaching an object to a completed
request is not allowed.
---
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
  media: mediatek: vcodec: setting request complete before buffer done
  media: mediatek: vcodec: change flush decode order when stream off
  media: mediatek: vcodec: Get SRC buffer from bitstream instead of M2M
  media: mediatek: vcodec: store current vb2 buffer to decode again
  media: mediatek: vcodec: remove media request checking

 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 44 +++++++--------
 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |  4 +-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 53 ++++++++++++++-----
 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 28 ++++------
 .../decoder/vdec/vdec_h264_req_multi_if.c     |  4 +-
 .../decoder/vdec/vdec_hevc_req_multi_if.c     |  4 +-
 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 28 ++++------
 .../mediatek/vcodec/decoder/vdec_msg_queue.h  |  4 +-
 8 files changed, 92 insertions(+), 77 deletions(-)

-- 
2.46.0


