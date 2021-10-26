Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D96F43ACCC
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 09:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234542AbhJZHOQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 03:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234520AbhJZHOJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 03:14:09 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F13EC061767;
        Tue, 26 Oct 2021 00:11:46 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id u12so6166875pjy.1;
        Tue, 26 Oct 2021 00:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uAZKiXpUPGIZiIsW4FDPovXA12YTx3ha3yV0CKfaMDE=;
        b=CUgE6eOteFF7HVr9n4neEhnLkgWwntU317UnwgwGQNeK8VHUJLR03gpCSopKua+RFq
         CcgGd7ON5Rlz86SdAAu5Tdnkp+dXUxFWzeUEtRdI4Y4Lcfp7V5FunND83X+0menFMsO4
         QpLl6UKxwrYGIWrKMS+XIHucfCo/0gOh3vCZGJF1g9HRB1SO61Bfr6vX0LMVEfYhpOWK
         hcX+eiFp2z1yiuf4gQFLX4Dkd6KvRHaIPqdHgRLW3PhTaPK0Qf+AFFnCYUukz5xx9PWn
         RU79vv3Wtfjz5NXA6DJUhnegYPBAqnil73V7nN/OovPr1uQ1Mg00FGVFK8GAiiDybeSh
         XDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uAZKiXpUPGIZiIsW4FDPovXA12YTx3ha3yV0CKfaMDE=;
        b=P51gO6DbEFXIqt5i1h9meT+71WLTp11C8AKFe+YrHhEe3D9lhQQNk82SnvpFa6ZTXd
         95cE5RufmHdPbxTQDFnrhWrdpH+lSFPS0VwGJVLKr4vt+UjM6aJslEbyuC1IsEUskmOo
         M7OdSg3kDRl8yXvxcbOgrt90azm3Bz5E6CeWFF142JKb729MjMkEeWK2US/z434dzI3T
         XuRBw9D5kRf+LJUXfrAQumj9Xxps3feOOX9fbJn9GE66WyjBXR++asD3qN2eBI79SE6b
         bYgWzxg38CNlbhxH2nBuiQhh55IugJFghG+1MyNjJ+cVmegccWwIQG0HNApv/fo+KnDn
         XizA==
X-Gm-Message-State: AOAM530zXvhcdAoHFi/PpFB2zbpnWjM7jAiVXuytQLFp0wp/V1Nsvc47
        qwA1kkxrCAVldxUxJ4eOj7I=
X-Google-Smtp-Source: ABdhPJzqsIsQlmS7qLGltRQKqFMpDdbkzivkAz1AEn1u3VBA1G79oSi6CKqd4i91UMbldo41UQALVA==
X-Received: by 2002:a17:902:6bc8:b0:13f:8a54:1188 with SMTP id m8-20020a1709026bc800b0013f8a541188mr20653784plt.49.1635232305690;
        Tue, 26 Oct 2021 00:11:45 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:11:45 -0700 (PDT)
From:   Dillon Min <dillon.minfei@gmail.com>
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, gabriel.fernandez@st.com,
        gabriel.fernandez@foss.st.com
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, lkp@intel.com, kbuild-all@lists.01.org,
        llvm@lists.linux.dev
Subject: [PATCH v7 03/10] ARM: dts: stm32: Add DMA2D support for STM32F429 series soc
Date:   Tue, 26 Oct 2021 15:11:15 +0800
Message-Id: <1635232282-3992-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DMA2D for STM32F429 series soc.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8748d5850298..1d8be5e7c8b8 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -743,6 +743,16 @@
 			st,mem2mem;
 		};
 
+		dma2d: dma2d@4002b000 {
+			compatible = "st,stm32-dma2d";
+			reg = <0x4002b000 0xc00>;
+			interrupts = <90>;
+			resets = <&rcc STM32F4_AHB1_RESET(DMA2D)>;
+			clocks = <&rcc 0 STM32F4_AHB1_CLOCK(DMA2D)>;
+			clock-names = "dma2d";
+			status = "disabled";
+		};
+
 		mac: ethernet@40028000 {
 			compatible = "st,stm32-dwmac", "snps,dwmac-3.50a";
 			reg = <0x40028000 0x8000>;
-- 
2.7.4

