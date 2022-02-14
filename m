Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABB54B5CD5
	for <lists+linux-media@lfdr.de>; Mon, 14 Feb 2022 22:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiBNV3g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Feb 2022 16:29:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231324AbiBNV31 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Feb 2022 16:29:27 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B1B14865D
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 13:29:13 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id d2so1745305ljl.1
        for <linux-media@vger.kernel.org>; Mon, 14 Feb 2022 13:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KAsCtIlfmp+m7ShyllLFJYAj9FEeo8wO2Fz9dFrEzUk=;
        b=oviBn1dwswIq6zXepxKju+gVEouA9bnn6Bd2iFa/bIWH0fkx9MbgJMD2YGwR7k8K7o
         byLrXrGvwcgWvYOqHvjd44h/zB43zde4T5mYQEr1hamdbDkFHDHuxc9euFmgpaJ+Pojg
         LlIRGRlCkMjOXdMs2I5V4M/CMtzvg2Mo6Hpi3QbUrd6lBR0cUfcEz2NhENMfzTo+mmYR
         1yXhc2Wk6WFU/1jusIHPk+ADc35oOOH6xP1PZZ/XECUyVWjnlDNzJcadeRnH2HTZO6l5
         eBwhe+BcMAmZIFBdmlwC/uF/Ng+DINUUuiLPbGRvfRtnYzQ51QhtGeMlQh8Ua+gxhZje
         lkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KAsCtIlfmp+m7ShyllLFJYAj9FEeo8wO2Fz9dFrEzUk=;
        b=NlqWgN3z6WA9a88bJ/h0p/rt9hkWZ6cLdUgQ40IDadRi01ace26hpO6FAv4UrXDCqU
         a4V/7pluPWdwEKKgrkmNrlmGPPrmWR/RW0/nQvpPgBY+XxUT7CFqO4T6fmGM5KpPdIBZ
         HfDdvnyQvhhQ6tNyJ3ujghGiyi3VV4S/DCESsr0mysesplnD+uudWd2i3e5GIwlGZnc+
         L96utQNNpWL8iQiujBLKMxmHElkl9m3iG3UepiISVtqahRR8iWL/sD+x2qRUG9rGgCzU
         X9f1FaXJ6WlT/iK4DKWGQx8efrKIsa5DWwH1MLcdF9VetooEDiyGrLK0RGWUmPOL4sYv
         n7jw==
X-Gm-Message-State: AOAM530v0r5g4h8mQ9LySAXQhqEbND/mcLA89tHf6EpjXU89XTbYsvCx
        VhtidBCzB1rz8hCfQziaPMfIXYocP6EMOA==
X-Google-Smtp-Source: ABdhPJygCRUKcXYRREzCPhlgnMRY/xJ2BV/jbHvhY0MtRmH/g5VjCExQ76VosAuSlDwk9Q67S2g3kw==
X-Received: by 2002:a05:651c:1054:: with SMTP id x20mr415144ljm.349.1644874151550;
        Mon, 14 Feb 2022 13:29:11 -0800 (PST)
Received: from localhost (31-178-191-245.dynamic.chello.pl. [31.178.191.245])
        by smtp.gmail.com with ESMTPSA id a22sm491184lfr.24.2022.02.14.13.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 13:29:11 -0800 (PST)
From:   Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
To:     linux-media@vger.kernel.org, Linux-rockchip@lists.infradead.org
Cc:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: rockchip: Add VPU support for RK3568/RK3566
Date:   Mon, 14 Feb 2022 22:29:54 +0100
Message-Id: <20220214212955.1178947-2-piotr.oniszczuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
References: <20220214212955.1178947-1-piotr.oniszczuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>

RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP8
video formats.

This patch enables RK356x video decoder in RK356x device-tree
include.

Tested on [1] with FFmpeg v4l2_request code taken from [2]
with MPEG2, H.642 and VP8 samples with results [3].

[1] https://github.com/warpme/minimyth2
[2] https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/multimedia/ffmpeg/patches/v4l2-request/ffmpeg-001-v4l2-request.patch
[3] https://github.com/warpme/minimyth2/blob/master/video-test-summary.txt

Signed-off-by: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index a68033a23975..33ecaafa8cb7 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -390,6 +390,26 @@ power-domain@RK3568_PD_RKVENC {
 		};
 	};
 
+	vpu: video-codec@fdea0400 {
+		compatible = "rockchip,rk3568-vpu";
+		reg = <0x0 0xfdea0000 0x0 0x800>;
+		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		clock-names = "aclk", "hclk";
+		iommus = <&vdpu_mmu>;
+		power-domains = <&power RK3568_PD_VPU>;
+	};
+
+	vdpu_mmu: iommu@fdea0800 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfdea0800 0x0 0x40>;
+		interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+		clock-names = "aclk", "iface";
+		clocks = <&cru ACLK_VPU>, <&cru HCLK_VPU>;
+		power-domains = <&power RK3568_PD_VPU>;
+		#iommu-cells = <0>;
+	};
+
 	sdmmc2: mmc@fe000000 {
 		compatible = "rockchip,rk3568-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x0 0xfe000000 0x0 0x4000>;
-- 
2.29.2

