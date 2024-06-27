Return-Path: <linux-media+bounces-14248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A25EB91A785
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C65E71C21288
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2074B18F2C7;
	Thu, 27 Jun 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QySt7jfI"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E2318C342;
	Thu, 27 Jun 2024 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493850; cv=none; b=jAu9xe5hzE5HTyzRccm2ZXm96xYe9F/g35QsUqXXsc/oX8+dQP5yyYKGVFYwrY7Qx0fRMYdgKhCLYrL3ZMrHfsoi+2IUOT+qxramjzDySZaKArdV43nJtwU9iWbEQAFLj5u/DXJK7099XkQ7Uiu7G/MTkQAU2O9LHap/gqwxq2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493850; c=relaxed/simple;
	bh=2vFuVo+bGPPecHogl/3Txdtb7wk2+AmyvjLdF8g5D1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZdIb0QpE3HG+82rVg0rDwi67SqgwBe0w6QpAzw2FSdlVm9KgmETmnNsW6KZwYNMGexWrQILe98BYoRK9ae5zI1fgvI40IbxTw2Hkfet0E5Ftt0UQE5WbIBcHqR+xN4l8Jc4jvhz9JWe986dRwsDTQKC5FeQn1hTy1uaWog8NaVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QySt7jfI; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAb2A110243;
	Thu, 27 Jun 2024 08:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493837;
	bh=d1NREPANpw432CzvUECzmUTRPruFVZvBjGhgyeTjW2M=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=QySt7jfIxo2KqCQDBzoEh5kkg3hZoAYQr5JNjyw3toQr1Q3E2oU+yYFVBGNoVfpe2
	 kDrEMsrp64as06RHMz4Qe5Zert2xxYEQ8iuCN5cWy2Ig5pRk/CedOL/1VpWt/ppuCw
	 uZSkvzgMIgxKzQYjx/8d2x3prWidkr+/04Kerhsc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAbN4029355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:37 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:36 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAaZB038665;
	Thu, 27 Jun 2024 08:10:36 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:03 +0530
Subject: [PATCH v2 08/13] media: cadence: csi2rx: add get_frame_desc
 wrapper
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-8-6ae96c54c1c3@ti.com>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
In-Reply-To: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh
 Thakkar <devarsht@ti.com>,
        Changhuang Liang
	<changhuang.liang@starfivetech.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Julien Massot <julien.massot@collabora.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2073; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=JtptYl9pWQyib/AWqwA187Qcdcnrfn7aG9FAK3/vGqA=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS527ImTZLiFEOQ5Xg8bvJcnev8SegdmIezz
 8SgaEGPt16JAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kuQAKCRBD3pH5JJpx
 RSigEACd6lCD+0c0Z5dyQqGiA+nfMwiSLo02Hjiw9r5Tu9glT3XdX19bkkLuTtCz4bmPzDA1TT9
 7NO0JCk9N6ZIhOloJQQXadcooxoYUOMY5GPAizVWDA9kOvcgNjTuocb3Lr05SHfxqsNSocft2E0
 hb2eTCeC5CcVAfC5LG8RCODjiVzYswxwvR5V4L9lkSDy24hoVPoRl01sQVle9rFSUWn9Nzt0lXi
 chhcR+zCDO/0im0iOnzdoV/P5ntRuPq5+q4N3l+yjUMkaj5qPXA8cAdeXzmyRPFLEPh7zKOwOfv
 e5WHZz9N0IlziAf6OKFx9+bsjpsVUw8qA+95m19fI85g9tlGiJOPPnP1oHGhJM1QiM+1u5Syth/
 kRpr3lBaDv48ecJ6Ly/kvLIILKy7Tou9vCu+jL/u+bJ++jU42bVok/ASI5K9ZhxgHIa5FyUfNwU
 hEBdUvHExU31W1fGJfLLZqH85JsROIb6+KOfLAA33BzpUOjlfJSCUU+LRXsV79QaLNXRa+z6Nyb
 H1LbM4TjTrG/SYNfg3qt6c/T94kl2iwFbpAhk6c6DHNQnv7tuQvstLmz0g5QCtugnk1vOQAO8Bd
 wDQ3YVcn4GOM+RVA16BnMcX8KByUfBHdZMrnXh7L5/zrBgBBWQ4T3j0yGCEJrdANMpa0B1frigL
 7YeY12kJWOnbi+g==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Pratyush Yadav <p.yadav@ti.com>

J721E wrapper CSI2RX driver needs to get the frame descriptor from the
source to find out info about virtual channel. This driver itself does
not touch the routing or virtual channels in any way. So simply pass the
descriptor through from the source.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 751eadbe61ef..b6054d62c799 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -135,6 +135,21 @@ static const struct csi2rx_fmt *csi2rx_get_fmt_by_code(u32 code)
 	return NULL;
 }
 
+static int csi2rx_get_frame_desc_from_source(struct csi2rx_priv *csi2rx,
+					     struct v4l2_mbus_frame_desc *fd)
+{
+	struct media_pad *remote_pad;
+
+	remote_pad = media_entity_remote_source_pad_unique(&csi2rx->subdev.entity);
+	if (!remote_pad) {
+		dev_err(csi2rx->dev, "No remote pad found for sink\n");
+		return -ENODEV;
+	}
+
+	return v4l2_subdev_call(csi2rx->source_subdev, pad, get_frame_desc,
+				remote_pad->index, fd);
+}
+
 static inline
 struct csi2rx_priv *v4l2_subdev_to_csi2rx(struct v4l2_subdev *subdev)
 {
@@ -466,10 +481,19 @@ static int csi2rx_init_state(struct v4l2_subdev *subdev,
 	return csi2rx_set_fmt(subdev, state, &format);
 }
 
+static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
+				 struct v4l2_mbus_frame_desc *fd)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+
+	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
+}
+
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
 	.enum_mbus_code	= csi2rx_enum_mbus_code,
 	.get_fmt	= v4l2_subdev_get_fmt,
 	.set_fmt	= csi2rx_set_fmt,
+	.get_frame_desc = csi2rx_get_frame_desc,
 };
 
 static const struct v4l2_subdev_video_ops csi2rx_video_ops = {

-- 
2.43.0


