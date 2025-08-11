Return-Path: <linux-media+bounces-39386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B5B1FE26
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 05:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04456176D2D
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 03:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1330729B8D9;
	Mon, 11 Aug 2025 03:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="a+oPAorS"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8962777EA;
	Mon, 11 Aug 2025 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754882796; cv=none; b=RHKvCvowQaw9E8Y9c9osqPaEV87acj2BE6yhsXGYdWkaEZ7Ef715tM1UodVFz3K8lXR9MJVG7SI+Yqa/PNAyZoYOmhAqEmKzw3iFdBqEsVzSifOR1q2QmKXXIX9Hd3VSSca+yt3C69kLjSifwVWXZVaBZ6C/iFzfefdALymz96U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754882796; c=relaxed/simple;
	bh=MdDGfX1KjjBzoRrdgWzcFuWpv9h848RsFWTvzt+2Pz4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ebodiXkTqR+yS05nbJntCerFBuWggK0Xr0ABKz0W0YYNPsXK5v0aVdy1PEc7wd0xl6ZDX+11WQ4+bp+kRyGfMmf5ekrKjzilnqnFtVTeH2sz0nnIWaQWe0dpFyDnXQiI7spRoVJ236YAQ/85UgzfshM+02Wk/XjAJHYRCDj4Ac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=a+oPAorS; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f8ed2ab0766211f0b33aeb1e7f16c2b6-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sImni/6N+T5NOHRu/8SX7ThFct7Brb6go8aahtLYgJk=;
	b=a+oPAorS1Wk/zVIdFY28DuAjTx29dQT3TcUXJKunJ6H4NHXvrMldSqZzMCvZKg3ZMHnmk+NhbPT+jdl7eCNwx3tdwp6Hp0z543fiMHuzi84IVoxmufZkQljDCs5tx9S4RKSuBTzOgcDWuFu09BVeqetnYbaKWwFyNOjfDL8C7uQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:3b937128-ad94-49a8-888d-c1b41e24d4cb,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:f1326cf,CLOUDID:e4dc4aa1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f8ed2ab0766211f0b33aeb1e7f16c2b6-20250811
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 925361080; Mon, 11 Aug 2025 11:26:30 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 11:26:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 11:26:22 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v2 5/8] media: mediatek: vcodec: fix vp9 4096x2176 fail for profile2
Date: Mon, 11 Aug 2025 11:26:12 +0800
Message-ID: <20250811032616.1385-6-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250811032616.1385-1-kyrie.wu@mediatek.com>
References: <20250811032616.1385-1-kyrie.wu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

The dram addr of vp9 decoder tile number, which use dram mode
to set tile information, may reach to 36bits for 4096x2176.
It needs to get the highest 4bit of tile buffer address to
set tile buffer address.

Fixes: 5d418351ca8f1 ("media: mediatek: vcodec: support stateless VP9 decoding")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 04197164fb82..416d8c0c04ce 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -1140,7 +1140,10 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
 			tiles->size[i][j] = size;
 			if (tiles->mi_rows[i]) {
 				*tb++ = (size << 3) + ((offset << 3) & 0x7f);
-				*tb++ = pa & ~0xf;
+				*tb = pa & ~0xf;
+				if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
+					*tb |= (pa >> 32) & 0xf;
+				tb++;
 				*tb++ = (pa << 3) & 0x7f;
 				mi_row = (tiles->mi_rows[i] - 1) & 0x1ff;
 				mi_col = (tiles->mi_cols[j] - 1) & 0x3f;
-- 
2.46.0


