Return-Path: <linux-media+bounces-14250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FC191A78A
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 15:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23D7F1F24E0F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 13:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB32918F2E5;
	Thu, 27 Jun 2024 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mcWVv1gv"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C818F2D4;
	Thu, 27 Jun 2024 13:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493853; cv=none; b=Z6dS31BvsNDbzGJrt//erCCDDff6BYWYdPPZMacYuR6lsONBIviX1Zkw6qWtHoJgeg1iRGfaz7ZSvR4WDPIdHgxzTn6FDs7caGLtBD3OfJLKDzEiO2hK1mnsmhyHFNfH4LjQUlko64s8qGYxhUzxZdE4DvbLpyZ4zG03fvAL7xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493853; c=relaxed/simple;
	bh=5yUEdo0G8hpZub9m+y1PoqKCC1LAzx0pO2pfWf4gvxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fMl/iEPUD/IbgKaEeuw/TJ6wPwNCqvArT3T6vHly14xaqR1Bfp/c8I5K2uUdIkZG9L/LC5RNCxu3Um0dsUcA04tbdP5rlJV7LG6bvffCLAQzb+fekTZrNGT6YKoE5jopwklRdyvNNPwuBpmoMjAmfgMBSFDLcijWgYW4BXCq9+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mcWVv1gv; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAccZ117639;
	Thu, 27 Jun 2024 08:10:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719493838;
	bh=kLUfBBB3ygNK3Vcq73Ko/V1h89L0/lK2Pi+iSHcgALs=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=mcWVv1gvkT4y10qvR1HX8nZ9egjSrN4ZM3CFVe2k121kkG2DnWKF/oCqwayoYovs6
	 rMohF96bN3R3lUaL/3lMPAAPPBnyq2LVyjij6zGdvInAH6O4/fNhKKUcPOLM4ERkkX
	 3SZ+I0khlUeRWUZkgj/hadt/YV5QxIqqDwDXoOh8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45RDAc8m095764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 08:10:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 08:10:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 08:10:38 -0500
Received: from localhost (jluthra.dhcp.ti.com [172.24.227.116])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45RDAbQS072373;
	Thu, 27 Jun 2024 08:10:38 -0500
From: Jai Luthra <j-luthra@ti.com>
Date: Thu, 27 Jun 2024 18:40:04 +0530
Subject: [PATCH v2 09/13] media: ti: j721e-csi2rx: add support for
 processing virtual channels
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240627-multistream-v2-9-6ae96c54c1c3@ti.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=5yUEdo0G8hpZub9m+y1PoqKCC1LAzx0pO2pfWf4gvxA=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBmfWS64FV3r2sgKcInLAAU3yEoopI2g8C5+URLz
 05Ik4+pyJWJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZn1kugAKCRBD3pH5JJpx
 RVBvEACNCKEYzC9bkE9HfEXc4RlY9S7JLwFAShNyoV8BEwWAQWqjCKrqgmD8sxWBi8ySrkAy9N8
 N0sen8FPJQdhCIpCexLzsMClvmPX8rIWLUOnnhHSZIhFbc1PXgmoNckN/eQYtQFgnzk9FbWAhCV
 oj3pom2vB+N3ecq35r7mFLdqHqMhACh2bcsTkjJnmGyVxrZm9kmhIMYIQAyanR2cKJFG+bGT/NZ
 1xXzWqiX/mLMC860FBY/YdNMvUpLP/Vse2hgJf/o5916RyAqhfHuI7voRY9pAsxTlhA/c1legTH
 s7Y0XrRO/maCfWtVNeHX0SRl3kYpBh0z+vQwMyt5XVNG8tjLyQHNYG/uMy/Q+s1PLWEoMAMfLug
 iyZ95du3b68udRCJl/BQcmC0vK2wmSBmlOY504TC5aDhP3MXpXRliPZ+o0zmHsILmNWa0kUwsKB
 m/+IqMvSWdX6GbRR0oBo9lIhTTNpZArWUhJs5HlWr2BK4VRNqX0gTxBEphjhTWxdhbjWu9vluke
 pjqFg85EekBAeFqni1zfQH0FIdLKS7Ff4aggLqS32DzLOliNCWN2KQIDcvaBvaYpZFxDTbMJdV+
 wB3PTZK7NPS/Gpbe7vIqbAtRQV+prUGJHBGMHygs7axHcJaIweqnq8W9xLW/7mWrJN9t0lslga2
 5uN9+czawhQ2x3g==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Use get_frame_desc() to get the frame desc from the connected source,
and use the provided virtual channel instead of hardcoded one.

get_frame_desc() works per stream, but as we don't support multiple
streams yet, we will just always use stream 0. If the source doesn't
support get_frame_desc(), fall back to the previous method of always
capturing virtual channel 0.

Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b4b4bb69c88a..c0916ca1a6f8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -29,6 +29,7 @@
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
+#define SHIM_DMACNTX_VC			GENMASK(9, 6)
 #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
 #define SHIM_DMACNTX_YUV422_MODE_11	3
 #define SHIM_DMACNTX_SIZE_8		0
@@ -105,6 +106,8 @@ struct ti_csi2rx_ctx {
 	struct media_pad		pad;
 	u32				sequence;
 	u32				idx;
+	u32				vc;
+	u32				stream;
 };
 
 struct ti_csi2rx_dev {
@@ -571,6 +574,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 	}
 
 	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
+	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
 
 	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
@@ -844,6 +848,33 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	}
 }
 
+static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dev *csi = ctx->csi;
+	struct v4l2_mbus_frame_desc fd;
+	struct media_pad *pad;
+	int ret, i;
+
+	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
+	if (!pad)
+		return -ENODEV;
+
+	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index,
+			       &fd);
+	if (ret)
+		return ret;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
+		return -EINVAL;
+
+	for (i = 0; i < fd.num_entries; i++) {
+		if (ctx->stream == fd.entry[i].stream)
+			return fd.entry[i].bus.csi2.vc;
+	}
+
+	return -ENODEV;
+}
+
 static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
@@ -864,6 +895,14 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (ret)
 		goto err;
 
+	ret = ti_csi2rx_get_vc(ctx);
+	if (ret == -ENOIOCTLCMD)
+		ctx->vc = 0;
+	else if (ret < 0)
+		goto err;
+	else
+		ctx->vc = ret;
+
 	ti_csi2rx_setup_shim(ctx);
 
 	ctx->sequence = 0;

-- 
2.43.0


