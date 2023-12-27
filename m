Return-Path: <linux-media+bounces-3031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C6F81EF15
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 14:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5CDD1C22491
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 13:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C25445026;
	Wed, 27 Dec 2023 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F3gYODER"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1344C75;
	Wed, 27 Dec 2023 13:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703682502;
	bh=HmyjXOD56zgdLDRREs3MjGe7P0nir2jbpaxQCaL5xWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F3gYODER8pnUeQQ4RhLeIl6uvFvnY5Kj4qdCHil+dk8eUti5rjTBXHPwGODNyeUXB
	 b3Q7x61UzMh1jmHWbY57TCn82zA9F9jO5qq2+ulGLMBvp+nkmebVfqR0/Eo03zsXdv
	 /rVoVxh36fVTjOj9AFzL3uDEDC6FQ7qNA76WyDHQXIKKqcbF6Sz6B7SeKkd3SJcwbB
	 Z7/eqpws2ldOOcJYhXTdpjZ+6OLl+V7/Hj7gqqkPRzqIqu0FXmH6EefEoK/TmrynHd
	 AI+91XTt2WlGifOOQBrXietyLWSQ5hOG+qWbeD4630xepTpxi8M3Z4ObrcTF4yLBL3
	 ygfT9/x4Ga2uA==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B7CC137802F2;
	Wed, 27 Dec 2023 13:08:21 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Max Staudt <mstaudt@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
Date: Wed, 27 Dec 2023 15:08:12 +0200
Message-Id: <20231227130812.148914-2-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227130812.148914-1-eugen.hristev@collabora.com>
References: <20231227130812.148914-1-eugen.hristev@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Add JPEG encoder node.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Max Staudt <mstaudt@chromium.org>
Tested-by: Max Staudt <mstaudt@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
[eugen.hristev@collabora.com: minor cleanup]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index e451b6c8cd9e..ef1b269f9184 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -2054,6 +2054,19 @@ venc: video-encoder@17020000 {
 			mediatek,scp = <&scp>;
 		};
 
+		jpgenc: jpgenc@17030000 {
+			compatible = "mediatek,mt8186-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x10000>;
+			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vencsys CLK_VENC_CKE2_JPGENC>;
+			clock-names = "jpgenc";
+			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
+			iommus = <&iommu_mm IOMMU_PORT_L7_JPGENC_Y_RDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_C_RDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_Q_TABLE>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_BSDMA>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8186-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.34.1


