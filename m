Return-Path: <linux-media+bounces-14245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40F91A782
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A92BB282600
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EC718E75C;
	Thu, 27 Jun 2024 13:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="gGyJ6tCz"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A47D187541;
	Thu, 27 Jun 2024 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493849; cv=none; b=Sd3gEVS83tzEzqa+R+LgKkDVd6+zVgiUbfSjH2Tmh4O86c5T+I5BQ3aWU5zx08eOLOsWcB/VLD0iXcwZlyn+Q0Sse3ssXHDJS9zrHIfeRY29HVhelOKJ8voHxXVBAzczALyisiIaZozz2DZ++X+TqMXzL1hJb2AQorg6ATPtn+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493849; c=relaxed/simple;
	bh=8r2RdSHt2YjQ0rTY1yZfo7ktNYhxZheXvFzleRNTY/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=pipOUNLWD+3MeBK+Wq0h1tON2iOkc6TRRuBPMn06zsJhwwotXMTPJOUu4oxTkPoGgavFUnoU/T4MvU+VRrhDfm/xxXWT7brk7iqAqGV+2XZVMKLwgfUQ9J5RgFYFRUbgvj7g7QOGBiVBmB7yhYIkWnZVMPUgir97wDbH69X0U0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=gGyJ6tCz; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAWqL117536;
	Thu, 27 Jun 2024 08:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493832;
	bh=rvjj93156JqPjji8laigDSZtIiGKXU+ePd7dmdJpi98=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=gGyJ6tCzW+Q8GGi0ZWXJ8MXd7o85NDAh93Br+DvhZi5rTuOzZrIfmKMBT53MMnv51
	 cY5r+wOeIZDL90pommvuCPMvG/aags4MenUTRX69kPOFsTgSsaY4PYxrTOJMTxy2ap
	 J7n8xyo6TEmOQg9tiGZ6ICO9Bord82m3ZTuC8IRY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAWdK029330
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:32 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:32 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAVXb072157;
	Thu, 27 Jun 2024 08:10:32 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:00 +0530
Subject: [PATCH v2 05/13] media: ti: j721e-csi2rx: allocate DMA channel
 based on context index
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-5-6ae96c54c1c3@ti.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=R9mMnP/JSopLpke8aHuxGzEhJHa0s3R5X6kvouNnMf8=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS2jEPMEc2y61Zlo+3X8LmuexbBUcb5vxcxx
 UpixU69HFGJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1ktgAKCRBD3pH5JJpx
 RdRCEADBwHMtFRzckWo9F/DwThFX3D8U9LwT7CI/bsbn12iDimB+zoCL9rupURqA49YBQ4MvKPI
 66H0OE+rPWwVeCAqhiBcUh5om3jTmDgJpTNOD5f0oQAuFMt6F65k32NWMOjVi8T7pdQG5DtGDHX
 sW4ZBAdRm7HAL6V5XzZja0dNGnPGOdAfU2Oy5DBrrzPojHnRFk4WGMAejI43ECgCJ2UrtpA3a2U
 N4p70zwh8NcqiTK+WZFf+Pf7Ugr8UzKKsXmVZhflilFgXJLHV2T2G8BhzLLB36A1A4OpHHJ4gy9
 i2cavG9Pp22QpQTNUmlQ9BzQ9TSYvcH+EcSowbNtcXKRCdQjRfkE+begaVIjKGPQop4TatcO+g8
 E/VcYH3oAlFTKCqbfokAKGga6MQY7yp2/Kml3EKtpJH0rw0FpRoUCGqqDjZxwxGJxyzaL3z8j+6
 f2VxHWf5Sgz2qQNGb4R3vffE6Hfy3B7/h0apgkhOUAUUHfCY3ey/hOFGCpiNQVBSlJoAsJ7Rq3Z
 B77OMPqSgXVNhgXQt1eZsmVw3Dud3iJD2t6ZN3QdDts8Dok98eml2qQWFuygRQFBf5aNK7mvZTP
 jiGpr4NvBy1Wjpusd1EyokKB/wNERWcr6OB2LhS3+eZYJPzYO0nsirrSXK0tqCDa/sLin3YOmpp
 rhKbPfJTmTAF1dw==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Pratyush Yadav <p.yadav@ti.com>

With multiple contexts, there needs to be a different DMA channel for
each context. Earlier, the DMA channel name was hard coded to "rx0" for
the sake of simplicity. Generate the DMA channel name based on its index
and get the channel corresponding to the context.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index bffc8165fd33..361b0ea8e0d9 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1027,6 +1027,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 	struct dma_slave_config cfg = {
 		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
 	};
+	char name[32];
 	int ret;
 
 	INIT_LIST_HEAD(&ctx->dma.queue);
@@ -1035,7 +1036,8 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
 
 	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
 
-	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
+	snprintf(name, sizeof(name), "rx%u", ctx->idx);
+	ctx->dma.chan = dma_request_chan(ctx->csi->dev, name);
 	if (IS_ERR(ctx->dma.chan))
 		return PTR_ERR(ctx->dma.chan);
 

-- 
2.43.0


