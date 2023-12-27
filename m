Return-Path: <linux-media+bounces-3035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB1181F104
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 18:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73DE91F22FF4
	for <lists+linux-media@lfdr.de>; Wed, 27 Dec 2023 17:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467E84776D;
	Wed, 27 Dec 2023 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5afg97h"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D4B46542
	for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-28c7c422ad9so1125011a91.3
        for <linux-media@vger.kernel.org>; Wed, 27 Dec 2023 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703698826; x=1704303626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eiz0fylx3s+eC9GIkVjZ8U5D1rTDiaiV9DlEcXV1OkM=;
        b=T5afg97hDfNo3WIREmw1HncS/bvNyNVueKx207pTD1F7jL8k3w/mdhzy8D6Uef80xc
         jOKlZCZ2bW4Dzm6hqpO6rbrZaco01Wa+CeHcmsnnCPcpiyDjWU9PBYwVuzMHq51V0I+n
         MxLQMBBwKM5RbRIWt+29aL1Es7wNjae91/QZZ8U28JZlSEjMtNyPqWW112gfIRtIe27p
         w3Z9VfD8CeQGNAgiZCWHZgpGt3Nys+PL4tIXEV/4B2J6Ibc5iaEWI3ACKflm9J+7fCfy
         XboHaL54SQgOqAJjhrJQ/aEPy9gH8kpxxzhpqsLRsZ/ekUJJZiz6SoA3BCGAvE3XgXHv
         IGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703698826; x=1704303626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eiz0fylx3s+eC9GIkVjZ8U5D1rTDiaiV9DlEcXV1OkM=;
        b=ALO7MTgQDoLuKGQK3LJosKBFDYT6spzwjPjoUX+XKH3/1FlyJoNuddpZMrGxjf3eeY
         jR7UJqcFK7zAdqNiJFTQpzi3jXbvp5/VMKHI3EWXl+TWd/JYyfRg8bytD79TFXOvN0zY
         0VtAtZ0G30iqEl0XPc1mMsfgwCBjYbDI7IRZbXCvzEADtxEs6YaM1t0NPo5rYs4gHkIq
         +scKPCwBrALogQWO0k2k7HpyaGWaHIJa2SAy7ONPO5g0xdwOzxLlre148mAM46NYyvyW
         fUlbeL8SSJKYR6Wokmg8yc0REebQEzTP9C9P5VeGQkyYZ2H6g4W/Z9wlKQUA3IAbyDef
         XIOg==
X-Gm-Message-State: AOJu0Yz4RrixraypD8xUQbVupkI252GrKt/lrBWuGHn3+g4Lns8WyQcu
	dmLIXhC8LJvUSkcTpYfR019oqyRbWLvdspJFNuG2jw==
X-Google-Smtp-Source: AGHT+IFKmm9teGcP+8Tna2sHM7S2jEdgKLyhWGg1bBDaANSKgJHF9IGW9NXOMBQug9eUS3RxNhK9UA==
X-Received: by 2002:a17:90a:d3c8:b0:28b:b995:c886 with SMTP id d8-20020a17090ad3c800b0028bb995c886mr4477592pjw.82.1703698825952;
        Wed, 27 Dec 2023 09:40:25 -0800 (PST)
Received: from localhost.localdomain ([2408:8207:2540:8c00:3708:559:ea20:9883])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm17240262pjb.3.2023.12.27.09.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 09:40:25 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: liujianfeng1994@gmail.com
Subject: [PATCH 2/3] arm64: dts: rockchip: Add Hantro G1 VPU support for RK3588
Date: Thu, 28 Dec 2023 01:39:10 +0800
Message-Id: <20231227173911.3295410-3-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227173911.3295410-1-liujianfeng1994@gmail.com>
References: <20231227173911.3295410-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch enables Hantro G1 video decoder in RK3588's
device-tree

Tested with FFmpeg v4l2_request code taken from [1]
with MPEG2, H.264 and VP8 samples.

[1] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 5fb0baf8a..b3536e097 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -708,6 +708,26 @@ vop_mmu: iommu@fdd97e00 {
 		status = "disabled";
 	};

+	vpu: video-codec@fdb50400 {
+		compatible = "rockchip,rk3588-vpu";
+		reg = <0x0 0xfdb50000 0x0 0x800>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vdpu_mmu>;
+		power-domains = <&power RK3588_PD_VDPU>;
+	};
+
+	vdpu_mmu: iommu@fdb50800 {
+		compatible = "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdb50800 0x0 0x40>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH 0>;
+		clock-names = "aclk", "iface";
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		power-domains = <&power RK3588_PD_VDPU>;
+		#iommu-cells = <0>;
+	};
+
 	uart0: serial@fd890000 {
 		compatible = "rockchip,rk3588-uart", "snps,dw-apb-uart";
 		reg = <0x0 0xfd890000 0x0 0x100>;
--
2.34.1


