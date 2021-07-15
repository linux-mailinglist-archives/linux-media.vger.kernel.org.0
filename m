Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774AA3C9BB1
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 11:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241077AbhGOJ2h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jul 2021 05:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236202AbhGOJ2g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jul 2021 05:28:36 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5ECC06175F;
        Thu, 15 Jul 2021 02:25:42 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 37so5509113pgq.0;
        Thu, 15 Jul 2021 02:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hAPQ7MKC9CHG6U3K/a3TvqmDvmez6ZMEcoHbCxgEOYg=;
        b=P9aP8xXebYqM5eL86zMabjl81y3vJ5Hf8Luzlw1sM4prphVoBHQ9J9LwBfmc5AQErm
         47bmfMcZOjqOq/0MdKJNowvyRKiMC8xJIp4vRSKe0mwuUZMLVXTFQmPIM2FQe0XLYwX2
         92w989aQ7EKAE4KMzOfqnNjfwEguT1TqWfZTGlcdkrIJWTmzDyXInGxxp7ING0Bt4K03
         NEdc1m1cerCbX6cl5dTXsf+cFnoqUkPG4RW6bHnxH4KgkE/qJ18VdwtIFi5Qgr9RACty
         zFOPUpYpyDUU+HhfSiJvD5yBhMx9LQeduRlujeKIZQ4m/sdHE2WVOzrEIZL2MwoEBKdj
         z4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hAPQ7MKC9CHG6U3K/a3TvqmDvmez6ZMEcoHbCxgEOYg=;
        b=IDq3njBF2QUlrjop5zPi49k8jHJbeQ46s+vtbwbqJK12ZrWSyANPp5PGgBir/g4gqB
         LnLUcSXbQhuScSKQTa/BDxacwyWgMRbREIOwpzcN1t07LcaebsvPpE4ZOZp8Yxuyj7Nl
         +VfVAPBAT6yfjQ4ZBYLt5upWuWZrCfulJN95VovcbanrlO/prsEZCCEbfXZ8CkBp29jJ
         uLkmB19MLuDBPk3SbwJKA4bbPVmsjFnBoDnvm963EjBHoFKBIlEX6eokyisodWHbfU/H
         K3ev+5r570utkt6J6ZExFUH9+fNY8i12QFjVShBQ27d9KuKq0Q6aJaH22tPDSygJZutz
         XJnw==
X-Gm-Message-State: AOAM533MeroCpg6PGfTiLER3sK7EBJqQCi7LWsZTSkltnFsoVE36dDPA
        ZBJiPoiZJnkXS9IvAySAzNA=
X-Google-Smtp-Source: ABdhPJxfZg3HBz3NZSalF2W5+UNgrMbPPOljW0yieY3sK5IsSH20lECUe4fiRAka40yA/dec/ZTydg==
X-Received: by 2002:a63:5117:: with SMTP id f23mr3612640pgb.200.1626341142320;
        Thu, 15 Jul 2021 02:25:42 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id 11sm6662503pge.7.2021.07.15.02.25.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Jul 2021 02:25:42 -0700 (PDT)
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
Subject: [PATCH v2 5/9] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date:   Thu, 15 Jul 2021 17:24:24 +0800
Message-Id: <1626341068-20253-16-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
References: <1626341068-20253-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dillon Min <dillon.minfei@gmail.com>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
v2: no change

 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 8c982ae79f43..da2f80e73f43 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -132,6 +132,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4

