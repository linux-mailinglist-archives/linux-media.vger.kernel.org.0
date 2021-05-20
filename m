Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9246938ADE4
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 14:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238655AbhETMTB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 08:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbhETMSv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 08:18:51 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA8CC07A830;
        Thu, 20 May 2021 04:05:51 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ep16-20020a17090ae650b029015d00f578a8so5084520pjb.2;
        Thu, 20 May 2021 04:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GLGGQfl2zXFsccd/mr0oP139J15xn0Blxr/cx91Xd1M=;
        b=sep2NJZySqc16Z7h0JLim1OgBCyiF/Kd5UGwhx4Dy8Paia3Q0KZAXin+ZWoZysY/6X
         CI04pPq2AhXoLSJB1+RyKHmObdy81S4BfwyuYXwJLEyAk+yQlj9DtrzB5YRgbWBrNGqD
         auIWeQ+Y1a7LEcrmG3S+Ts226SoQgVJPbr1OFl+aPyz21jKcvA2EERzTgN7I/nLK1lT4
         wB7OF6RLpJz4EKH8C7amR1sbtShKUy79MB+Jev++evuf6NnZm7GsgYzZuzePn6BJRQro
         deLMuyQGp9rNzx6CJTAYt1yQwpH3yNleOnIKDchlco8pjCWGZ3RLvsu6hc3GJv+5FHrz
         6riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GLGGQfl2zXFsccd/mr0oP139J15xn0Blxr/cx91Xd1M=;
        b=gtMhDWPpXGylsPZsqkQELR5SD38oWBZu4G9U/gNv+LuqvhB/46SGqZUH17PseeJ7l7
         pE7N+tU5sErYwC0Zv3q2pp37vJVKphHvr6GbTeC7+2MrVWQv55E14leKCuDVlZ8l4H+i
         00tKaUwQ2u3GHUX2vLOFLgas9lKvkPGvjDqZtUCguOhKjGrMgqc0X5S8QcTaNk1HlEUs
         XEgS4DMnUVy6upitg9GM5bdoZW7o14iLx2QZCwzgzqEganR30dmBaA0/6MLL1xDxvRoU
         5Fg1aJtNP1XeIDEIeYhotXCcCm0Gar5EEd9hmMgz9NzaJAMw81haPpn6Yt6Zkjx1TvwZ
         Iv5A==
X-Gm-Message-State: AOAM5336mtl2McTD+yiOxnsCPNA2CmRyQpDTUzj9Oar4HNP8p9osPHCo
        zVVJu1iJpE9si5UjPZsLjDM=
X-Google-Smtp-Source: ABdhPJx8T9pnitbWBnKS183vbEq4rXMFbi8xW6C3PzRCVZBkhv2ideHXgWVdIntE4IGSl5tUaxK6Bw==
X-Received: by 2002:a17:902:f704:b029:f4:228d:4dca with SMTP id h4-20020a170902f704b02900f4228d4dcamr5327214plo.26.1621508751436;
        Thu, 20 May 2021 04:05:51 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id hk15sm5839121pjb.53.2021.05.20.04.05.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 May 2021 04:05:51 -0700 (PDT)
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
Subject: [PATCH 4/7] ARM: dts: stm32: Enable DMA2D support on STM32F429 MCU
Date:   Thu, 20 May 2021 19:05:24 +0800
Message-Id: <1621508727-24486-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F429 MCU.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index f6530d724d00..2cd1506027b3 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -799,6 +799,16 @@
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

