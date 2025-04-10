Return-Path: <linux-media+bounces-29853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E7A83959
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B93151B67D8B
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 06:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8290320B7FA;
	Thu, 10 Apr 2025 06:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mln0sW0f"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A475E20487D;
	Thu, 10 Apr 2025 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266627; cv=none; b=GCD9wkfAtRwMNzIUCCKD+iz6I1+vx3rMVhEf9KqSCavHSgtqep2QYp9ROamNCouionPS8+869464oUqP0pR2YdiAE08e6zizSH+6aV79sOVvpzllSXNjjpn8GRc9534Hc2lYeNi44uaZ/ZJBbuVX0FqZkoq3/XbyTY/XBapTXjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266627; c=relaxed/simple;
	bh=iEIqknBJgyt2XppC92jqbOwX/4RiG/t5gMt29kh4zSY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S47UbBmnpm+Oig7wHWHvCrnhdwmts6ENkw+c7HLznzwdW6sRFjnJQ72vo5mq6c7MifR364fdKrvEVbFivBg5sW17TAcJ4w6Db0FH71/plTB6kaGmeYqW0vTFxkW1OXWltf5qp1P9WdW847Xm7E5MvlWmj9bBsk8nt4p5WMP4rmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=mln0sW0f; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 45070ea015d511f08eb9c36241bbb6fb-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LPwlFy/7crNNuoEpI5/mPfpSQ7J+Vn14OdtyfLQUaPo=;
	b=mln0sW0fwyClBMRuN8joCEgakG7D0htXD55BjV1SXL63JR7Z8c4nk8Dp6Zbn2STmri0aNBW1Zj9Um7BqunofDFkw+Ig8RoxoM/yOVBlvl3t3+MBjS3X3fEz8oZE1qNYyso1TbMtSIJlTJyMegG7WrjPk2v9UFt/9h+DSkmnaN7Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:eadb269c-7043-40c2-8c90-4db641b287e8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:57ffe7a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT
X-CID-BAS: 5,DFT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 45070ea015d511f08eb9c36241bbb6fb-20250410
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2057896869; Thu, 10 Apr 2025 14:30:17 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:16 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2 06/12] media: mediatek: jpeg: refactor jpeg buffer payload setting
Date: Thu, 10 Apr 2025 14:29:59 +0800
Message-ID: <20250410063006.5313-7-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250410063006.5313-1-kyrie.wu@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
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

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c     | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 0ea3851e0ab1..3b386ec44b36 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -719,10 +719,22 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
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


