Return-Path: <linux-media+bounces-28281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF71A62AE3
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 11:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43F6B3BECBA
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 10:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7914A29;
	Sat, 15 Mar 2025 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="DVaCmVgb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7ED1F462A
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 10:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742034593; cv=none; b=U6IoF2CFuiUSpVc7S3gdf6hpAAd2tgFb46OF4aNSxdOtMPQIm4drWHrXCNWNoa5+bHwRYWA22LRvOE3d55ZXaAf9+j4kbloFFNNYROkuV9lWYjrPM0X4sRo71roS6ts2VIPtfxIpL7saHujbvMvfw/iJcUREXinAgcnCRpchM5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742034593; c=relaxed/simple;
	bh=3BroxUqixAB8gXUImb1vjnpxBW+vzrQRIfMr2CxrOfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=STAPCZqtBuLbW1/peWMYjdQ42AfyN1FptT83uM2ZzQxwblXBTZjcbfAzR8muCfuIvduuX10tRkGzKNl4/KoVPGYorKIa5lvGBiKsSumyDrR+C/U6Ip0DPEvi+ezOsoiaXuB6UztR2vxpSiW7oqIzSP3Hlske0ZeTwftz2RVoMNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=DVaCmVgb; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id EC5671C2438
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 13:29:37 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1742034574; x=
	1742898575; bh=3BroxUqixAB8gXUImb1vjnpxBW+vzrQRIfMr2CxrOfo=; b=D
	VaCmVgb8jMMwQ4Equ8S8ziqnQd0rOya7xfQsNGlIgbSjf+0GD9RdZ4jx20p6gLvf
	6L77hhdmEIQ6SdX80/sCUzotay7L+ELiQJ7LjZvjigUOu88Lu46skRzw4HgRG+Zr
	9sRqmAZdHuhhLWtq0W1YVFhxl7ze/kuGkOPvZw7U+M=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id x2g5BKhpXFgq for <linux-media@vger.kernel.org>;
	Sat, 15 Mar 2025 13:29:34 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id CFB551C0879;
	Sat, 15 Mar 2025 13:29:29 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lvc-project@linuxtesting.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH 6.1] media: mediatek: vcodec: Fix VP8 stateless decoder smatch warning
Date: Sat, 15 Mar 2025 10:29:01 +0000
Message-ID: <20250315102903.3634639-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunfei Dong <yunfei.dong@mediatek.com>

commit b113bc7c0e83b32f4dd2d291a2b6c4803e0a2c44 upstream.

Fix a smatch static checker warning on vdec_vp8_req_if.c.
Which leads to a kernel crash when fb is NULL.

Fixes: 7a7ae26fd458 ("media: mediatek: vcodec: support stateless VP8 decoding")
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[ Alexey Nepomnyashih: changed mtk_vdec_err() to mtk_vcodec_err. ]
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 .../platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c    | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
index e1fe2603e92e..22d8f178b04d 100644
--- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp8_req_if.c
@@ -336,14 +336,18 @@ static int vdec_vp8_slice_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 	src_buf_info = container_of(bs, struct mtk_video_dec_buf, bs_buffer);
 
 	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
-	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+	if (!fb) {
+		mtk_vcodec_err(inst, "fb buffer is NULL");
+		return -ENOMEM;
+	}
 
-	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
+	dst_buf_info = container_of(fb, struct mtk_video_dec_buf, frame_buffer);
+	y_fb_dma = fb->base_y.dma_addr;
 	if (inst->ctx->q_data[MTK_Q_DATA_DST].fmt->num_planes == 1)
 		c_fb_dma = y_fb_dma +
 			inst->ctx->picinfo.buf_w * inst->ctx->picinfo.buf_h;
 	else
-		c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
+		c_fb_dma = fb->base_c.dma_addr;
 
 	inst->vsi->dec.bs_dma = (u64)bs->dma_addr;
 	inst->vsi->dec.bs_sz = bs->size;
-- 
2.43.0


