Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9CF435059C
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 19:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbhCaRf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 13:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234472AbhCaRfj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 13:35:39 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276E4C061574;
        Wed, 31 Mar 2021 10:35:39 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id m20-20020a7bcb940000b029010cab7e5a9fso1535240wmi.3;
        Wed, 31 Mar 2021 10:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c9dnfwn3uUQXnRGTtGdPI5EXjcVR5rT5ZIvAQLeTWB0=;
        b=WCzlqR6P/SJcQRG8ZJhW0JgDKZwNXWVNT0P8HMH4MCT5hPUS6PXalp4CoXzfamAgq+
         zBQ1utZxjBRsVGd23sJ9ofKZbKQxv1krZ0EHv3gDMkzrsXFSdI2bx7/JT7+YPpajylsS
         ugbM5qPu7Yzowim/m953+AXX1SK5CKZWA13mPgLMKqcyaat3wHKSNSGVL0cYtX30pNTU
         sMzFUF2J3LMfVh8kLYG17BQSa8qrryJPyvLpbqmweoAnlaIXcKpFEm4DNCONU4+X/zCT
         YQ2TE7NNoPS+AbhcKNB1j9HPw/3dLlUy8L6/Le1ESMnNKq+hd5m5c5rNr3gqMKbV3JZD
         A/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c9dnfwn3uUQXnRGTtGdPI5EXjcVR5rT5ZIvAQLeTWB0=;
        b=ArL+H66Ck5Y6w2gKPYdAux4HKZ4wEiDiY9QhUPMO2VA919CobgK5i0Z8VteJd1jQMM
         gE8VR6+yL+tLOkuU+xgnu21B3S4OrghScyZIRojs5dqaUnOTz+K4xk135QegqwrF3rVJ
         55rrTRs+xC420ee6fD8OkloB6VHF9f45v8q5Ca7LOx3xlsbPfGJU9q/a/2KA4KShfFyF
         Uh8DWE8fumupGsxdcPxYCydOSQ9FWG1meT0/MLtu5obmbIbracGu1N37ZNUM3NjPEWPh
         3krmaiXn4aiK2OcppcrfbCoYyx894stJPZYYYD+kzYWenia2tIW/VfQiJtTp86cas/he
         YHnw==
X-Gm-Message-State: AOAM533LALX+RkrFwfQalrPiV3BWTJKO2MYEtdmmnOV3978SSOp6nZOb
        5RPsVty0AN4tXNKFWQOo2tA=
X-Google-Smtp-Source: ABdhPJxVIpTnZ6aBrQGee2qYidNtRG733Qb/IoI1wVPHki4azaPWSOVPcGbgOfhdcfiXWhpV4GfaVg==
X-Received: by 2002:a1c:1f4c:: with SMTP id f73mr4183679wmf.25.1617212137932;
        Wed, 31 Mar 2021 10:35:37 -0700 (PDT)
Received: from arch-x1c3.. ([2a00:5f00:102:0:6e1d:cfb9:fb12:552d])
        by smtp.gmail.com with ESMTPSA id 12sm4714200wmw.43.2021.03.31.10.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 10:35:37 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v3 9/9] ARM: dts: sama5d4: enable Hantro G1 VDEC
Date:   Wed, 31 Mar 2021 18:35:20 +0100
Message-Id: <20210331173520.184191-10-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210331173520.184191-1-emil.l.velikov@gmail.com>
References: <20210331173520.184191-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Add the SAMA5D4 VDEC module which comprises Hantro G1 video decoder
core.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
v2
 - Split out of larger patch (Eze)
 - s/Atmel/Microchip/ (Nicolas)
 - Drop leading 0 in node name/address

v3
 - Drop the clk/irq names (RobH)
---
 arch/arm/boot/dts/sama5d4.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index 05c55875835d..e47e1ca63043 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -101,6 +101,13 @@ nfc_sram: sram@100000 {
 			ranges = <0 0x100000 0x2400>;
 		};
 
+		vdec0: vdec@300000 {
+			compatible = "microchip,sama5d4-vdec";
+			reg = <0x00300000 0x100000>;
+			interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+		};
+
 		usb0: gadget@400000 {
 			compatible = "atmel,sama5d3-udc";
 			reg = <0x00400000 0x100000
-- 
2.31.1

