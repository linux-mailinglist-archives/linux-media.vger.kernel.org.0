Return-Path: <linux-media+bounces-15180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB3937F9F
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 09:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D1AAB21944
	for <lists+linux-media@lfdr.de>; Sat, 20 Jul 2024 07:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D1B2B9C5;
	Sat, 20 Jul 2024 07:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iaep3hf9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297C9374DD;
	Sat, 20 Jul 2024 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721459808; cv=none; b=a1LeGQXF5R+a2vPZATZIGQobu7RxRlyakdT/AQrWLa5by4DCEmwRRQVupf0L0ktuqIXztDKTvLHUtP3xWqKKk5YI/x8vIvJ+p6zgfE50TAlWfEBxK3PABKoQzddejKy9ouLluwmEVzX+9awgIk9kzfhMNmeAR4hl7wIDA4BwJ6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721459808; c=relaxed/simple;
	bh=sV3snuKDIWlPu04LhqsqsJFyfZCu6TJ1WQqOuofhIUg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aqQ6xgIIl9/zad2nOb50SgzI0GH/4dW3H1ga8sjnmWn3XN+xs6tpS3gbZS7+rUmw2WtWtOD+KK5MgCb1jr9SLdjS17I/yL+jxz5AAslgPKYBI5/yxdqgwljYyukTRoTe4mgQC6qkitB1zKntERCjT72y+eI3KVGm5pVqwsOkjvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iaep3hf9; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 028dee6e466811efb5b96b43b535fdb4-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EwmQFjU4ryy9S0fElSKyTpDH/xgcfgw3kzSiCc5vxR0=;
	b=iaep3hf9vIwOJ1ivpgymw5KdwHUg/elMkRBs3knP24HxPyJSIWI6jx3TY5jfogTsjdY5MdyT2OGjVF3UcQiDU44CmG8JfB5ZTV5vKFZkfg048JpUuLmWKssm+rOet6hFPkmZQhlinh5mMX0Gg7/k4KhhdvB69VZtlXbNCM1ER/s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:489de8cf-0770-41eb-8831-8b4d0e53b9d4,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:ba885a6,CLOUDID:3ecaad0d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 028dee6e466811efb5b96b43b535fdb4-20240720
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1970495434; Sat, 20 Jul 2024 15:16:40 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 15:16:38 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:37 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, "Nicolas
 Dufresne" <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	"Hsin-Yi Wang" <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	"Daniel Vetter" <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	"Brian Starkey" <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T
 . J . Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 20/28] media: mediatek: vcodec: support tee decoder
Date: Sat, 20 Jul 2024 15:15:58 +0800
Message-ID: <20240720071606.27930-21-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-2.756200-8.000000
X-TMASE-MatchedRID: 4/gb/fIiI/ztAxjyNphE0new7fOv9rv4Kx5ICGp/WtF6unVYJJS8BvlY
	oV6p/cSxF8u8dQXnFzmAbmfpXu2gQqgZIrutfM9NEhGH3CRdKUUK3n1SHen81enZDXpMs2JZAy7
	Fge6wFlsmROQ/eSO/iIAy6p60ZV62fJ5/bZ6npdjKayT/BQTiGoDCVuAr32f0QOI2gk2mTGXJYI
	cPz1n6Jees1uoFqLsiMcxxI4FUPGXLrWmVntWiFLiZvhAEkid25z52j6IVFhUgr9Y0Pp1f9kGv8
	R81e9TV82Gj2QC3yG0smXVK/H8eHzG7sr7xobSASN0TZHRJmLDvdCUIFuasqw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-2.756200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F2E4D8C583A3CCCE280CA399EBB62B78D15DC7D7967079303F2D0DA07008F8032000:8
X-MTK: N

Initialize tee private data to support secure decoder.
Release tee related information for each instance when decoder
done.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index 2073781ccadb..28c97f8247a1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -312,6 +312,9 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
+	if (ctx->is_secure_playback)
+		mtk_vcodec_dec_optee_close(dev);
+
 	mtk_vcodec_dbgfs_remove(dev, ctx->id);
 	mutex_lock(&dev->dev_ctx_lock);
 	list_del_init(&ctx->list);
@@ -471,6 +474,11 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	atomic_set(&dev->dec_active_cnt, 0);
 	memset(dev->vdec_racing_info, 0, sizeof(dev->vdec_racing_info));
 	mutex_init(&dev->dec_racing_info_mutex);
+	ret = mtk_vcodec_dec_optee_private_init(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init svp private.");
+		goto err_reg_cont;
+	}
 
 	ret = video_register_device(vfd_dec, VFL_TYPE_VIDEO, -1);
 	if (ret) {
-- 
2.18.0


