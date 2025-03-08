Return-Path: <linux-media+bounces-27854-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56091A578EC
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 08:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84DB87A7EF7
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 07:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE17E19C57C;
	Sat,  8 Mar 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j6WQKwLK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AD12E7E;
	Sat,  8 Mar 2025 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741420096; cv=none; b=Zg0+GCRnUWY3VCBoPX5rnVu16PfP29kLTLq3Zl4QtIDMwvOPzSTJut2xG0+hpVuIiyKk+JZXtqMt44/AMQDK4TpPAOMbRX/NyduHZbVcw2ihcfFmvr7O3pSZqwYhgkWAymoHZNPJPnq3p+BmXbq4P0qeIDRuMfPCVz+HP/cZb9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741420096; c=relaxed/simple;
	bh=BbFnqrQot3eI1tdCsSFJP42/nStify28jurl6ieonD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LPm6d0O4ufiBdUF4rmhiKGA+9D651p+yVoIadmYll+k/ftI27sPKTJ9QY7idhgzV2C8Zah6N+e746mv9NhPLuVC2d9J+VmUiJWMW8R8wLOms5rcaAXjOFdAtRH6SkHq74JbErfhkmE8y2uy+4NVylb7L+mtr3aCPEjv0qNRx3Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=j6WQKwLK; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: ad0a36c4fbf111ef8eb9c36241bbb6fb-20250308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wh8DeNqOcIX6+nJAx3o2buQIVBjHMurmDl2AULBTpp0=;
	b=j6WQKwLKPLb/l7js8ArGWbUTBeyOWshKagMNnjy1r6Y2RWFkKPXoMWTR21g/KzjwKLmrrmUu/CplIQnC2QSToOS9E8fUZlsd3UmXHRwi2UKJ8+q310UWCsw13paxSl3u2JdRktMcfkqRehCf7gz+NxtyRgTC4PsTMBvHeB9q9K4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:acc10574-43e3-4cc7-8dcc-313d3d2c2c71,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:71301c8c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ad0a36c4fbf111ef8eb9c36241bbb6fb-20250308
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1386299348; Sat, 08 Mar 2025 15:48:08 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Mar 2025 15:48:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Mar 2025 15:48:05 +0800
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
Subject: [PATCH v8 3/3] media: mediatek: vcodec: add description for vsi struct
Date: Sat, 8 Mar 2025 15:47:57 +0800
Message-ID: <20250308074802.18929-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250308074802.18929-1-yunfei.dong@mediatek.com>
References: <20250308074802.18929-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The vsi (video shared information) struct needs to be synchronized
between firmware and host, as a change that is only done in the host
version of the struct but isn't synchronized to the firmware can lead
to decoding issues with H264 bitstreams. Highlight this requirement
within the struct descriptions.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 13d14187e4f5..5b25e1679b51 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -30,6 +30,7 @@ enum vdec_h264_core_dec_err_type {
 
 /**
  * struct vdec_h264_slice_lat_dec_param  - parameters for decode current frame
+ *	(shared data between host and firmware)
  *
  * @sps:		h264 sps syntax parameters
  * @pps:		h264 pps syntax parameters
@@ -48,7 +49,7 @@ struct vdec_h264_slice_lat_dec_param {
 };
 
 /**
- * struct vdec_h264_slice_info - decode information
+ * struct vdec_h264_slice_info - decode information (shared data between host and firmware)
  *
  * @nal_info:		nal info of current picture
  * @timeout:		Decode timeout: 1 timeout, 0 no timeout
@@ -72,7 +73,7 @@ struct vdec_h264_slice_info {
 
 /**
  * struct vdec_h264_slice_vsi - shared memory for decode information exchange
- *        between SCP and Host.
+ *        between SCP and Host (shared data between host and firmware).
  *
  * @wdma_err_addr:        wdma error dma address
  * @wdma_start_addr:      wdma start dma address
-- 
2.46.0


