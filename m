Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BAA35174B
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 19:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbhDARlr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 13:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234763AbhDARjq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Apr 2021 13:39:46 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C40C0045EF;
        Thu,  1 Apr 2021 07:43:56 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id jy13so3281832ejc.2;
        Thu, 01 Apr 2021 07:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c9dnfwn3uUQXnRGTtGdPI5EXjcVR5rT5ZIvAQLeTWB0=;
        b=GDJXTN0HFj6eVKPH5TMDm6NIGcjzfywnofpIQvY30/bpMclQDTYXhbqaRs7Ct6+xEU
         arM9lX4UMRhxGi5yCMBxEeObbwH76zyTY+uTeURueKMwawjX7uS1bs+z08TTfo25mqNL
         u77h961Ii+Mq29Xzlj58mKsWMvLPpOzDc4AZTWVa36AS1/oS+L/vD7nw9mpz990Wh+ga
         4a/5Qy5s1uXhMSPvTz08ISCpkiC+8QB7ngcorzxToBFRJ4U2crSuPDDiZMdzSsNn9n1y
         8OQRxhEPiiuNFjM9G1vcuE8GMRICguqgOjbsVodi+yCBZHuHWwvNrYJwXkF5dOh8X49M
         xpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c9dnfwn3uUQXnRGTtGdPI5EXjcVR5rT5ZIvAQLeTWB0=;
        b=BcMbE8YNDA3LiKwjiBrvbtk1zmdfHE3CKtR00LlgXlITLt6IdRSSXw58EURE+kabB/
         zZAlu5QwHEzzvH9kM1GbeFotP2wqRwfZs5hi/oQcQT1wWbg6zxB+4vZqNpMqdlCnLwBg
         vsCguQOgH8/AZEbT5doxfTOr4K0YYj8XTdmOvL+qBE/+YpIzjv4WeALfZ3rNVugqmWUC
         T2yoT6H6Eqt+bytRJkpUOSk45efJfqfF9lUeOqP6rBr6qjjBRYd8TMtJ5GVTIuFCZIj1
         qe0poARiXM0gn46prEcJL9HKM/rAEIlE4py3973GNMWO9iSzwDOfyND7EWFzVYWoktNg
         CNQA==
X-Gm-Message-State: AOAM530n+XCanJKEVp+fhO5/9VsYR0EK72nr5FLfaF8j44Kh4aju+AFW
        Ije+alCt0QDyyJqNnIDLh7DU0PDQqbWAgw==
X-Google-Smtp-Source: ABdhPJwEdgYTRpOzaOCZ20hnOAYuVxYiUwWxcYARQTiQhaUcIT3j3xfkvUdqsKyHyPAV7qD+3Tda3A==
X-Received: by 2002:a17:906:aed6:: with SMTP id me22mr9618958ejb.146.1617288234968;
        Thu, 01 Apr 2021 07:43:54 -0700 (PDT)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with ESMTPSA id nd36sm2854950ejc.21.2021.04.01.07.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 07:43:54 -0700 (PDT)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     emil.l.velikov@gmail.com, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v4 9/9] ARM: dts: sama5d4: enable Hantro G1 VDEC
Date:   Thu,  1 Apr 2021 15:43:36 +0100
Message-Id: <20210401144336.2495479-10-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
References: <20210401144336.2495479-1-emil.l.velikov@gmail.com>
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

