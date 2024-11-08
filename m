Return-Path: <linux-media+bounces-21103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E99D9C14C8
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 04:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDD662854BA
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2024 03:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC447193418;
	Fri,  8 Nov 2024 03:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hI0+FeSo"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16790185B62;
	Fri,  8 Nov 2024 03:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731037235; cv=none; b=JIe/HT+yfW2Kqq+KFjYwEmTmzM0nlvJQKAVKgbQiVPSS7PKeaWE80MjwADYfRO+zL8CSxOMwhrMf5y/M4mGdguk4BR+jdnnYXoPLL5WUHT4UCB0Z1NrY/OmKhu4dQqD3zwfyUYaNzW70V7GuqrA8hGTi2DGxb0Gwz9L+SG7V0sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731037235; c=relaxed/simple;
	bh=pREqPZnl7emeyhp72BZQ+WOPDFhyb+XJrHNqEUHddec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LJWc5I9jGrirtUduajO/M1aZBuRAFA6eyYTu3KYVO3R6/h2JT3uHUThogv2DM+W5TCpaHl58xZnd8bladuGixApLqGlG2rGfJuHHiZ+lCuWv/rCnxJ5ldnGAfV78RC0HZr+qcb+NzkcDmrralJnNg+vgzUsDSLKeglEzjGg0Snk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=hI0+FeSo; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 31fce6f69d8311efb88477ffae1fc7a5-20241108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1ftcH+N9F+aEUhbxneOfSb5rYHmfkO21YWF7Mbk1RLs=;
	b=hI0+FeSo4S3ExhwyC0W5hsUBL0X9t707aIt1HNvWn0iAHCXpqqce/iTDtlW8LXJ0PqtT4UpSN0U03Tf2iOlsUo2gqi/2R33MU7JnQA3fNqZ8cJ4COwL61INgL6c56b8Y1b2elQTckxe/yMQ5JWV0vQySJFGJeLoXapanfD+a+SE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:f8aab5d5-88d7-4e6e-a951-feb60b8ada45,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:a27db6ca-91e6-4060-9516-6ba489b4e2dc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 31fce6f69d8311efb88477ffae1fc7a5-20241108
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1550924117; Fri, 08 Nov 2024 11:40:27 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 8 Nov 2024 11:40:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 8 Nov 2024 11:40:23 +0800
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
Subject: [PATCH v4 3/3] media: mediatek: vcodec: add description for vsi struct
Date: Fri, 8 Nov 2024 11:40:12 +0800
Message-ID: <20241108034019.20064-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108034019.20064-1-yunfei.dong@mediatek.com>
References: <20241108034019.20064-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.519500-8.000000
X-TMASE-MatchedRID: +ngMWxkROpD4Q348LKfXODTV/B1Uu+XCIfZjRfGTydh30F1387KCPeFC
	6BP4FUP+tPz1mNVqu0woX6fjWPUAloJiDh6eUBMR4RtSDjG+z7ACnYfpEgyUOJsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNZd/mwLf2BVUtX6FTdeBEpDL97e0jrsKJNgI91Ytj1EagfpknKz4xIGUTG
	VAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.519500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F4778ECA64CBFF029DEE0544CE99F8F850A81C507F4D2D16539D5C45192053932000:8
X-MTK: N

If the video shared information (vsi) is changed accidentally,
will leading to play h264 bitstream fail if the firmware won't
be changed at the same time. Marking the shared struct with
"shared interface with firmware".

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 238639a07703..eef6dd548625 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -30,6 +30,7 @@ enum vdec_h264_core_dec_err_type {
 
 /**
  * struct vdec_h264_slice_lat_dec_param  - parameters for decode current frame
+ *        (shared interface with firmware)
  *
  * @sps:		h264 sps syntax parameters
  * @pps:		h264 pps syntax parameters
@@ -48,7 +49,7 @@ struct vdec_h264_slice_lat_dec_param {
 };
 
 /**
- * struct vdec_h264_slice_info - decode information
+ * struct vdec_h264_slice_info - decode information (shared interface with firmware)
  *
  * @nal_info:		nal info of current picture
  * @timeout:		Decode timeout: 1 timeout, 0 no timeout
@@ -72,7 +73,7 @@ struct vdec_h264_slice_info {
 
 /**
  * struct vdec_h264_slice_vsi - shared memory for decode information exchange
- *        between SCP and Host.
+ *        between SCP and Host (shared interface with firmware).
  *
  * @wdma_err_addr:		wdma error dma address
  * @wdma_start_addr:		wdma start dma address
-- 
2.46.0


