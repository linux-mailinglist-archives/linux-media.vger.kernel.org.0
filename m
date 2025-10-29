Return-Path: <linux-media+bounces-45915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C151AC19150
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 09:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 10F3256511C
	for <lists+linux-media@lfdr.de>; Wed, 29 Oct 2025 08:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE10F32B9BC;
	Wed, 29 Oct 2025 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tw1GG0Fc"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC62313276;
	Wed, 29 Oct 2025 08:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725853; cv=none; b=jo/c716LDTzjSysUO2qJo+4vcpvbxn1NssNMw14D/NAqJkEeV9YGal2I08pLzh2KdQfrM59WYUefz3Klk0vbyyi0g6LI5MS0N671hSO91zmzZWBJHoZ6iNdTmyt6evX62GYtBI+x4dE/GKo9WpzkVjVQkBEkG3hLjYEQ6ccUZtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725853; c=relaxed/simple;
	bh=15WqzwhSd+4v6nvFWmBhtxnTL7IyELxLkBRHnuzcB4g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQomEL8VhSf44mzLR29l6BSB7bHKFj3rqjl2bBMVaLvuOWlhmqtcu2Ugxl/FYdl3jjMHkQMD+cwljWBG5bFUPyMq8RfTh9uZjBc8rWdIKzBBfPcnLGgh/U+7z7CoqI3Nq0t5ntb2dgIbIVZN5ghSoWVHD7Nb/5x0HqkS8jUrm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Tw1GG0Fc; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b27f66bcb49f11f0b33aeb1e7f16c2b6-20251029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=EV+4RoOa1iy/DqIOmsenog49vj+D7yWRn73q8Qh39gc=;
	b=Tw1GG0Fc/VAU9+G3c4tLGg7fWB4XuZ77/C6k9C9B9MiyPMjytNnGL0y6ohQ0WrdP4El0VK4TPfRf9X6o4oZyMqJ+4z69Vv6iysjfedwUp8yK+fo2ErugPeVHFci5ntybgzUc5m3GBUyePnF2K836HfjmjeTUXnJE1VufHcsn+NM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:129ebcee-fd97-48f8-9f50-2cdfc16cc8f6,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:2b3ef258-98d8-4d0a-b903-bc96efd77f78,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:2,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b27f66bcb49f11f0b33aeb1e7f16c2b6-20251029
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 872222372; Wed, 29 Oct 2025 16:17:23 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 29 Oct 2025 16:17:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 29 Oct 2025 16:17:20 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [RESEND v10 02/12] media: mediatek: jpeg: fix jpeg buffer payload setting
Date: Wed, 29 Oct 2025 16:17:07 +0800
Message-ID: <20251029081717.29551-3-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251029081717.29551-1-kyrie.wu@mediatek.com>
References: <20251029081717.29551-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

For multi-core jpegdec, if one of hws gets the event of resolution
changing, the payload size, representing the size of Y/C data,
needed to change. But others hws are decoding at the same time and
it can not be changed immediately, which results that the payload
size is not equal to the real buffer length of the hw's, which occurred
resolution changing and a warnning call trace will print.
So the setting of payload size must less than the real buffer length
to remove the warnning logs.

Fixes: 0fa49df4222f ("media: mtk-jpegdec: support jpegdec multi-hardware")

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 030d2a75972a..37b0b4b0a557 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -702,6 +702,7 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct mtk_jpeg_q_data *q_data = NULL;
 	struct v4l2_plane_pix_format plane_fmt = {};
+	unsigned long max_size;
 	int i;
 
 	q_data = mtk_jpeg_get_q_data(ctx, vb->vb2_queue->type);
@@ -710,12 +711,20 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
+		max_size = plane_fmt.sizeimage;
+
 		if (ctx->enable_exif &&
-		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
-					      MTK_JPEG_MAX_EXIF_SIZE);
-		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
+			q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG) {
+			max_size += MTK_JPEG_MAX_EXIF_SIZE;
+
+			vb2_set_plane_payload(vb, i,
+					      MIN(vb->planes[i].length,
+						  max_size));
+		} else {
+			vb2_set_plane_payload(vb, i,
+					      MIN(plane_fmt.sizeimage,
+						  vb->planes[i].length));
+		}
 	}
 
 	return 0;
-- 
2.45.2


