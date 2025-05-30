Return-Path: <linux-media+bounces-33624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E288AC893D
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 09:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 909561BA7106
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 07:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04844218593;
	Fri, 30 May 2025 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tWWUViUT"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493F41F5425;
	Fri, 30 May 2025 07:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748591156; cv=none; b=PFOBirr7l4dtVQGUFvSWLhUIPgAOAtxnw0FxKg+ZWqdysBSSrE2SBc3GEuJLknoPTB0BB60pz8vvGVboDp69FEMkT+QQIO/nBmvZ9oP3O0DH8+gb4wQMoIr3bQmlruSYUPKRmEWCW3FpcQ/A2cvA6pczUcldP4ApE0+5FQVTwM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748591156; c=relaxed/simple;
	bh=pWzwjgQ2f/53kmF5n7c7UlKrqztnmqHU0+OyfCWG1ss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NzOP2NQq6Q8UJZf/ieyNGgXY7UGKrXPVBszjEdMwd++JrP0VJMnHwWZVQAeqTSZjSlAnW6ZlMVQk60HFhDnWQANtNZyrEdQJWOci5uQxN7mNZJbQAbcvL03UGVQXFq1PJKNzT/uEIziOQ0QkWTKuiKpAvd4B6uTuMRQsGzR00lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=tWWUViUT; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 19084a363d2a11f082f7f7ac98dee637-20250530
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MafHlrK67o/d3FGCy1u+Y7qasnBcS5mIW6WlhV/wvWA=;
	b=tWWUViUT+dqLhysXSwyRQcUw5YbwiYp6R0L6MEwguOvS/mKYznMtC9hPT/lN4e6MPy4LAxnQtoZoF/l30DEw9oEaxF5Edih6VGNGdIOG+GKhbb8gb+2pY+Mt1CUAmvciBBbqvvSnet2F4zWyC8gpUnuX8VA6kaGEUijGG7nZrq8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b6f2e4b3-63d0-4d85-b9b3-81b4e29eaa48,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:33cf2458-abad-4ac2-9923-3af0a8a9a079,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 19084a363d2a11f082f7f7ac98dee637-20250530
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 441385511; Fri, 30 May 2025 15:45:46 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 30 May 2025 15:45:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 30 May 2025 15:45:44 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <srv_heupstream@mediatek.com>
Subject: [PATCH v5 06/12] media: mediatek: jpeg: refactor jpeg buffer payload setting
Date: Fri, 30 May 2025 15:45:31 +0800
Message-ID: <20250530074537.26338-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250530074537.26338-1-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

1. for multi-core jpegdec:
   core0: |<-------- decoding buffer0 and resolution changed to smaller
   core1:  |<-------- decoding buffer1
   core0:   |<- handling resolution changing
   core0:    |<- vb2_set_plane_payload
2. the payload size is changed on the step of set format. Because core1
is running and streaming has not been stopped, the format cannot be
set again, resulting in no change in the payload size.
3. at this time, the payload size is bigger than buffer length,
it will print a warnning call trace
4. set payload size must less than buffer length

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c     | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 0074d1edb534..52d59bb5c9ad 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -720,10 +720,22 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 		plane_fmt = q_data->pix_mp.plane_fmt[i];
 		if (ctx->enable_exif &&
 		    q_data->fmt->fourcc == V4L2_PIX_FMT_JPEG)
-			vb2_set_plane_payload(vb, i, plane_fmt.sizeimage +
-					      MTK_JPEG_MAX_EXIF_SIZE);
+			if (vb->planes[i].length > (plane_fmt.sizeimage +
+			    MTK_JPEG_MAX_EXIF_SIZE))
+				vb2_set_plane_payload(vb, i,
+						      plane_fmt.sizeimage +
+						      MTK_JPEG_MAX_EXIF_SIZE);
+			else
+				vb2_set_plane_payload(vb, i,
+						      vb->planes[i].length);
+
 		else
-			vb2_set_plane_payload(vb, i,  plane_fmt.sizeimage);
+			if (vb->planes[i].length > plane_fmt.sizeimage)
+				vb2_set_plane_payload(vb, i,
+						      plane_fmt.sizeimage);
+			else
+				vb2_set_plane_payload(vb, i,
+						      vb->planes[i].length);
 	}
 
 	return 0;
-- 
2.46.0


