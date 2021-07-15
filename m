Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 386133C9BAB
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241044AbhGOJ2e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241041AbhGOJ2b (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:31 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47318C061762;
        Thu, 15 Jul 2021 02:25:38 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso3641249pjp.2;
        Thu, 15 Jul 2021 02:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/WxDN386m/02gF4IltuUVKKXTkTakJEWTUA4LPWTxX0=;
        b=aw4ENVWZQ1zX0VvMNM8DIFs06jP6E2MUjh9j4QMKqeZlUbZ3n5wFLj22beW4CBOIW9
         6wbvUVXLtg+1v7Bi7fw8B+YhPKRFm/3obCUjKOzCjhM5Am90MfChfk7NclX4nhXBIQ3S
         VINKW2kpgpn4dJ+6GqNByZyXIwGwr6luGqQ/KjCzBJ7OPbAck20qUuE8yoHOmrxEi7tl
         piGUUT5LY1XAEV7eaHZu73tJT+hWrl+l1dAfh9olyrt6xasy4NK3yiHRRIYY/WWhLQ3L
         2WUW9eIbXsw54KLTYuAYCn5WhLAoBBgOq3jiyF/UXEAkHEPJaBHLo/txOFaaFBQQbkHU
         WC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/WxDN386m/02gF4IltuUVKKXTkTakJEWTUA4LPWTxX0=;
        b=LPOdeJzYR88JiTyHhTDf6u0JFQUYxIBSu5cwqJdKZoAXlpzlqGD1ZJtPv7SmKDrlzV
         Ll0UkdXLQjoFDWqZD0tq5zcZQ3yZZvyFan7YFQgWY0hvvAaC7FBB9HzMECLQ5vjsnMAD
         BLCjK3AxFtPrElFVY0VMCNxTQwMwdJaXojrwTqsT8X9SBEALTvMxnTiyPXWc1YcSZ01u
         R8W2Cyqdc2z1PeIq9UwiCdtyLXWVlvm4bk3aUT69R1XI67fhIs8yr3vjVOKYwlsuKQVu
         OiUA2+sPLS5ebTf6KKgJ/KZe75gxbzb+hRn7y3OLjERDULKQ/PCTYqSPYWNEyqGO5koF
         QonQ==
X-Gm-Message-State: AOAM532xmB8lG5Ljpr6fhUsogvGvHF3IqU0/ZeqDKhiLWvQiPIvb2cfn
        UNFTzA/mFNqTgIU8TCl6FUA=
X-Google-Smtp-Source: ABdhPJzGHmcpLCFnW1tT+X1on+iZik+M4VSuDgwoUBt1NqomIQwJJCgeRxU0xl56bWUfRLSsk7elWg==
X-Received: by 2002:a17:90a:5306:: with SMTP id x6mr3383252pjh.59.1626341137920;
        Thu, 15 Jul 2021 02:25:37 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:37 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     mchehab@kernel.org, mchehab+huawei@kernel.org,
        hverkuil-cisco@xs4all.nl, ezequiel@collabora.com, gnurou@gmail.com,
        pihsun@chromium.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org
Cc:     patrice.chotard@foss.st.com, hugues.fruchet@foss.st.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Dillon Min <dillon.minfei@gmail.com>
Subject: [PATCH v2 4/9] ARM: dts: stm32: Enable DMA2D support on STM32F429 MCU
Date:   Thu, 15 Jul 2021 17:24:23 +0800
Message-Id: <1626341068-20253-15-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F429 MCU.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: no change

 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 8748d5850298..a06437f2210d 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -791,6 +791,16 @@
 			status = "disabled";
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
 		rng: rng@50060800 {
 			compatible = "st,stm32-rng";
 			reg = <0x50060800 0x400>;
-- 
2.7.4

