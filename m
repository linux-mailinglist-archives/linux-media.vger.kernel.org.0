Return-Path: <linux-media+bounces-14244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E552F91A77E
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21BD7B25DBA
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D451718C333;
	Thu, 27 Jun 2024 13:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jar8vWOi"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F1B18A939;
	Thu, 27 Jun 2024 13:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493848; cv=none; b=Q722P1LXUADmzn75TQtPR5Gxt7zIVIEVIhNNabefu/vpUBdEvP4ud9tMrp5+VsQTEckzUGDuMmdbc+KObWTIPO2o7enfe66gJLQIkCh7q9o6ZgDge6MBYb0nrxnyDrfUIyi7P3s3+rX+y1aQMlowrmP+LZTaFiswHZF05gmrnGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493848; c=relaxed/simple;
	bh=v3gEkPdG9b7eYy0/FF4jb8UhEm5GRijCHvs7LwoGo2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IlhWeFJR2aOoqLzdEoQgIox/2Ds1p3Z3mpqbFP03c3nJCbrzCrdsA54AbwS9ek515l5UrbHW88WfOtvWCRBOfx3wcsqjh/uodd2zmfVnZIfplBcsFMcI7fKRyvxAVZotEZPF5f68NEx1lOW2wmHIpoRIc6AS1670xT55Ru+TKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jar8vWOi; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAVN4117473;
	Thu, 27 Jun 2024 08:10:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493831;
	bh=HB+flKInIVpcWdRlTa6Zzhif0gbdAzt/xBNWPP/eYRM=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=jar8vWOiLrruK8MMulrKuxWAapYVqAqdQKV5XAFY97S0vHht1PFk55v2hHvNcccpx
	 0WdmUbIyismcQy6O1Qw4VK+Q0NHnUnBV3WgX89fShkMgULkwd+oufhlzhTTgs29iBa
	 LUGA+ijSYITLE+/cmUGpulP5CvtgeGaOnLxVOgvE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAV9f095648
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:31 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:30 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAURw038539;
	Thu, 27 Jun 2024 08:10:30 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:39:59 +0530
Subject: [PATCH v2 04/13] media: ti: j721e-csi2rx: prepare SHIM code for
 multiple contexts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-4-6ae96c54c1c3@ti.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=LpLlB+YmYVSUi0YgNLhdccCiz/SToDm+eRN4FDifDXY=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS1ploOz/OFRtwmZ4wW5tZGbQtitE0Iek7JG
 WFkFRE9kcCJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1ktQAKCRBD3pH5JJpx
 RQTTD/9/W9Pi0VpvwdtJW2kwsoUWw/RQl4maIOR1WULpe7FZmEepcywqdvv95i/t0ILfXqFHZOF
 CSSPVSVHUW3m4tx96o2g5C2W+OoTaisnfMoR9tu2we/2Gk5BrlyWApY02TYeYTg1883cLzfVcmo
 fa8lIokLUDouFd1LJDxn0l6f3gx3fgHNymZzzS3UdpWP2QvAWJaBeEC+0CyDEO1FumsTHHF0xAA
 yc8FfCNZQd7g6XxPy6eiPXltn6e3WmrSkf02woxJ5JBrT2m6BZB5KcAK4eDuDhKdt7g1wBPodQX
 8N0CS0cGbwUR87oXePZVfj7/I9lBupFibxjfTEMYhbo7uyUNfIsZER0qLuTIyhoALGXfIJjGICN
 4qwqdL+2GhivLaUTkUAhKbT8ZWVYcNvrmgJgAMLPzWuEfwX1b0e7kQT36M1gLxde2Id8m+3i1Cc
 Sjusf+iC+KguFSCmCMmrNSMFDkXB956veWJ9L1NFk556/pGm6K9Xbi+V3eTYHgIG+MVcBwFvr7Z
 MEVqOERM7olWVnK9eOjOpEzDta/B5Tk+kpsZCA9WAs5+Oi7gw7wV6bMccKne1JYhdQdnrdRVKyJ
 CZdbvLgyWTBPSG4pZXTPH3eIk0MgiTtBIKJEeX5eDkoj4lmt8KNsYfkQ0dW8+7tNSZOjJ5wZxKC
 cnvuc68MpmAsQDw==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

From: Pratyush Yadav <p.yadav@ti.com>

Currently the SHIM code to configure the context only touches the first
context. Add support for writing to the context's registers based on the
context index.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index d8dfe0002b72..bffc8165fd33 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -25,7 +25,7 @@
 #define SHIM_CNTL			0x10
 #define SHIM_CNTL_PIX_RST		BIT(0)
 
-#define SHIM_DMACNTX			0x20
+#define SHIM_DMACNTX(i)			(0x20 + ((i) * 0x20))
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
@@ -35,7 +35,7 @@
 #define SHIM_DMACNTX_SIZE_16		1
 #define SHIM_DMACNTX_SIZE_32		2
 
-#define SHIM_PSI_CFG0			0x24
+#define SHIM_PSI_CFG0(i)		(0x24 + ((i) * 0x20))
 #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
@@ -549,11 +549,11 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
 
-	writel(reg, csi->shim + SHIM_DMACNTX);
+	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
 	      FIELD_PREP(SHIM_PSI_CFG0_DST_TAG, 0);
-	writel(reg, csi->shim + SHIM_PSI_CFG0);
+	writel(reg, csi->shim + SHIM_PSI_CFG0(ctx->idx));
 }
 
 static void ti_csi2rx_drain_callback(void *param)
@@ -870,7 +870,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -885,7 +885,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	video_device_pipeline_stop(&ctx->vdev);
 
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
 	if (ret)

-- 
2.43.0


