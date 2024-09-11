Return-Path: <linux-media+bounces-18161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2499A9754C7
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 15:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 556011C21A00
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 13:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09B019E970;
	Wed, 11 Sep 2024 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="W0hTDX/6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EAD184559;
	Wed, 11 Sep 2024 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726062766; cv=none; b=sXGyPWU4q26fztY+WffP8bZDk7TIJ0BStDNDAFW1nrJeWawUYcMAQC30b89x0foAo3QP6mRuFzIpL+0aZyeIZdHOivv1RWbtTA4qgEYxgEyu9in+B0L44jQuXXC9tcOjO81qFlNoI7O1pEz/UpHPRGqPcRVenI++UbDekmn+5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726062766; c=relaxed/simple;
	bh=9a+r1QhU384OiYxfZOMtoDimOlvR9dzSCJtmmsOcydU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qETnAaK8XfVvCv1Sf64SX997+tiJVsauEVvcmV7VPRey/P3htVS1E/tWcIMYG25WOpQhriJe6AWC8M0JTMvihz+lPSW0q33IxRu0nezZSBbXWVqfQZM/UToKVTqayGlGL9hSCkdr/51wfv4/ny7W6iYLZkdtg63mNAtciJibTOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=W0hTDX/6; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BALUbe005722;
	Wed, 11 Sep 2024 15:52:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	A8c+AY+qNssnoCfN0gZ6jZd2oPaxif5QtDT69HbwCEA=; b=W0hTDX/67HYbz70c
	mUJAZJltZcRY4co1wK6bvrv0Ar8Qnbq5kf+q/MYrXzQ9Zn3k6lq7nIaSEewkZWlp
	IUKXR8Jb3mKD6NpBbElGV/2Qctsu2DYs8J8YgjRsij03N/phG3tWkpQPEq0dqyB/
	Pb30tJsfKZjLT5TCovpjg6ma2NmvQAcn9GNxDM196GUpejB15rGaAF/erJX+z73H
	6/rphJyfJxRvY/nAy2pRgOAYAxhi5lTe8tvnfmAHGUDWpSgXBP4QEuOE9LFiq2/H
	OHfHDQFB/9f8wFnu8N6NQw31E8Mf3VPKvnW8uFtkcGwxfTJP0R39YOGs9cEWxV2a
	aLhCGQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41gy7sfgr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 15:52:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A50944005B;
	Wed, 11 Sep 2024 15:51:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 460C6231537;
	Wed, 11 Sep 2024 15:50:15 +0200 (CEST)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 11 Sep
 2024 15:50:14 +0200
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans
 Verkuil <hverkuil-cisco@xs4all.nl>,
        Fritz Koenig <frkoenig@chromium.org>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Daniel Almeida
	<daniel.almeida@collabora.com>,
        Andrzej Pietrasiewicz
	<andrzej.p@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>
Subject: [PATCH 2/2] media: verisilicon: add WebP decoding support
Date: Wed, 11 Sep 2024 15:50:11 +0200
Message-ID: <20240911135011.161217-3-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
References: <20240911135011.161217-1-hugues.fruchet@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Add WebP picture decoding support to VP8 stateless decoder.

Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
---
 drivers/media/platform/verisilicon/hantro_g1_regs.h    | 1 +
 drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g1_regs.h b/drivers/media/platform/verisilicon/hantro_g1_regs.h
index c623b3b0be18..e7d4db788e57 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_regs.h
+++ b/drivers/media/platform/verisilicon/hantro_g1_regs.h
@@ -232,6 +232,7 @@
 #define     G1_REG_DEC_CTRL7_DCT7_START_BIT(x)		(((x) & 0x3f) << 0)
 #define G1_REG_ADDR_STR					0x030
 #define G1_REG_ADDR_DST					0x034
+#define G1_REG_ADDR_DST_CHROMA				0x038
 #define G1_REG_ADDR_REF(i)				(0x038 + ((i) * 0x4))
 #define     G1_REG_ADDR_REF_FIELD_E			BIT(1)
 #define     G1_REG_ADDR_REF_TOPC_E			BIT(0)
diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
index 851eb67f19f5..c6a7584b716a 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
@@ -427,6 +427,11 @@ static void cfg_buffers(struct hantro_ctx *ctx,
 
 	dst_dma = hantro_get_dec_buf_addr(ctx, &vb2_dst->vb2_buf);
 	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
+
+	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
+		vdpu_write_relaxed(vpu, dst_dma +
+				   ctx->dst_fmt.height * ctx->dst_fmt.width,
+				   G1_REG_ADDR_DST_CHROMA);
 }
 
 int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
@@ -471,6 +476,8 @@ int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx)
 		reg |= G1_REG_DEC_CTRL0_SKIP_MODE;
 	if (hdr->lf.level == 0)
 		reg |= G1_REG_DEC_CTRL0_FILTERING_DIS;
+	if (hdr->flags & V4L2_VP8_FRAME_FLAG_WEBP)
+		reg |= G1_REG_DEC_CTRL0_WEBP_E;
 	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
 
 	/* Frame dimensions */
-- 
2.25.1


