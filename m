Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 959E24B3C63
	for <lists+linux-media@lfdr.de>; Sun, 13 Feb 2022 18:13:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237238AbiBMRNs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Feb 2022 12:13:48 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232033AbiBMRNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Feb 2022 12:13:47 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F07458E5B
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 09:13:35 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m14so4965663lfu.4
        for <linux-media@vger.kernel.org>; Sun, 13 Feb 2022 09:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6v6pgISJrHoSxFqvH7sLXG+J+EsPRkUHxiDxTl/cEOk=;
        b=QYViOVjEfwvKtkkLpqdI/eRZuDwm3iZgNMY72zeexh6HJQN6HDhXHEZcmmez81m4Ou
         8te1yYOD0Pre1Fi+zqZspc3OaTeIyxXvalhTVWtNELPeydQe6re2KIyVAlm7rhpXc/Tw
         BEx/QIxFV6oOsDVB/v6WXIeAM0tZZI5JCvM9OEuuFDr3b2gb9aRWg6h74cftM5JfhPYo
         XjsOEuRNvaYcozy9RxlnOQUwLUJNsjnMcqpZay+W3BNp9sgji0Nobmch/Hg8qcK5o8X+
         qIf55kFi460ELtFCDuyKG56YY4+fClOq7dt6j1H25k7nVqPtsRKXS/oIlpwglzedrehT
         e6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6v6pgISJrHoSxFqvH7sLXG+J+EsPRkUHxiDxTl/cEOk=;
        b=0Ur9sSn9TjgNtjojsY3wiii6Y9Sd0jNhNJy6sBb+Ll2/pGijmRNt+hSGea/9xoteWa
         CDYI+/8f81XOyGHbEDSnj1uzIs2LsJojd1+kflj8iXfxVL1jHUBwHDBmaFRptljXTrZT
         THoIPqxy2iml1d/h0fOv3bcG2BXgivcl8P4jQBIV6m4o+tuQnI+O3cojm5Xsru4eU+Fv
         kR99RaOo5GmT5+rnGDLT2InyJrawxY7HIgivBo0RxWbIscAHEWxcS4+l/0YNoKNpSaNq
         frU5WuCUpEaRevn7tG7lMu8N1xfjK0Um8R2Y7RDKp9HTPcSQjwsV1oL7lteFdhlQ4xkm
         SZkQ==
X-Gm-Message-State: AOAM53037RyQ5p1RLWiCzw5SEXD1bJorU4lPy+7Xt8S6h2fJH3Xm0jS/
        2wjSWN8gKBV3q3duTpiLTVaeBbVnMYXnQA==
X-Google-Smtp-Source: ABdhPJyDO3T25XLKPTp6ZFzTv9Mc0GzZOYNZzyIwyAfcAfEmCxptZWsQ+FwcZLrEEd0ohcIR4qXuYw==
X-Received: by 2002:ac2:456d:: with SMTP id k13mr5584022lfm.203.1644772413400;
        Sun, 13 Feb 2022 09:13:33 -0800 (PST)
Received: from localhost (31-178-191-245.dynamic.chello.pl. [31.178.191.245])
        by smtp.gmail.com with ESMTPSA id 10sm540471ljv.8.2022.02.13.09.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Feb 2022 09:13:33 -0800 (PST)
From:   Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH v1 02/03]: arm64: dts: rk356x.dtsi: Add support for Hantro G1 on RK356x
Date:   Sun, 13 Feb 2022 18:13:50 +0100
Message-Id: <20220213171349.3924782-2-piotr.oniszczuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220213171349.3924782-1-piotr.oniszczuk@gmail.com>
References: <20220213171349.3924782-1-piotr.oniszczuk@gmail.com>
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

    RK356x has Hantro G1 video decoder capable to decode MPEG2/H.264/VP9
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
 arch/arm64/boot/dts/rockchip/rk356x.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x.dtsi b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
index a68033a23975..ae5d80c5ba64 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x.dtsi
@@ -390,6 +390,28 @@ power-domain@RK3568_PD_RKVENC {
 		};
 	};
 
+	vpu: video-codec@fdea0400 {
+		compatible = "rockchip,rk3568-vpu";
+		reg = <0x0 0xfdea0000 0x0 0x800>;
+		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "vdpu";
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
+		interrupt-names = "vdpu_mmu";
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

