Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93EEF337820
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 16:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234339AbhCKPl3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 10:41:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbhCKPlM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 10:41:12 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F0BC061574;
        Thu, 11 Mar 2021 07:41:12 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l11so2386712wrp.7;
        Thu, 11 Mar 2021 07:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2LSJdNzI10Uzadt8Nfbff+p/pjnmY6eCoDYVHbZS0BI=;
        b=jk4TUDGTRQb0WrtAIBIrDEGB+N+EHoOx/CWb1rrpdeCt9/+QQflENTvHgSGb4cCidG
         45D5yr7yxWIDSvPnNksRdGovpxpIpXyzJBazRLXF9y0xZBdLdYWYTNOP/ER07fgNJl4z
         a70DcFB+R6uwCyEMM6QDo4iXZ348n63WaDmx2A9ZwutNi1ScGXomGHen+GJSEJv836jC
         WzzjuiM2UL2ZbxW9ZIOw275PCQsofz5BKkcW15plxb9F3mNi6jXYruO34wM47Am8VJMZ
         pC86kmi/7jj0Thw76590R6mByJ1KSwR+nwqCHtbQO9tRS1KYQGq1jzlHl/kDn7vbLusw
         qKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2LSJdNzI10Uzadt8Nfbff+p/pjnmY6eCoDYVHbZS0BI=;
        b=fREJO2kEj2h3THTU0KtOAQG8+Zt7ovvOAOV7HaGj22z21QFo3SaLeUl3WItVc72IJj
         lB1EMI6Mfz3qPpzJoC5uigxEQ3jHc+XSnIgvlCuOsCw4O+YTDVtiVg0exlCYN+boraTZ
         6wXoqYdqgMkbRswBaEFZ0TAC6R9+Je+pnVMBLX9KqNPa2rgqrTynatrh0ZphuD2URY04
         99bvj7WXXwiI5nT9/iiYkfTMh8OSVwBqEa5pg32EWfk7YcT/XAWQmFtoIYBhewT+slml
         oMnSY5ERoePmK6dtbnPTKkpe1jGEr/PRDzr1Y7CWgqN6ZVn/fJAZW0iHr1yE07Vy59yM
         s/Lg==
X-Gm-Message-State: AOAM532M1xnq4N+aV4UsbgIqqhpYEfF+MrTNNdYohCde0gP69Zh4z9mM
        y32eCzRsFa/JhFsEIgJRJ64=
X-Google-Smtp-Source: ABdhPJx85w5D5mT/Nq0DQGWDwzHjyIlxwrp8M2xgn2lGZFx7xp6QayXKc3+tZBKXpfRtukgCNlNfrQ==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr9570311wrr.30.1615477270720;
        Thu, 11 Mar 2021 07:41:10 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:b16d:9752:8f38:7d6b])
        by smtp.gmail.com with ESMTPSA id a17sm4008547wmj.9.2021.03.11.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:41:10 -0800 (PST)
From:   Emil Velikov <emil.l.velikov@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>
Cc:     emil.l.velikov@gmail.com, devicetree@vger.kernel.org
Subject: [PATCH v2 08/10] ARM: dts: sama5d4: enable Hantro G1 VDEC
Date:   Thu, 11 Mar 2021 15:40:53 +0000
Message-Id: <20210311154055.3496076-9-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Emil Velikov <emil.velikov@collabora.com>

Add the SAMA5D4 VDEC module which comprises Hantro G1 video decoder
core.

Cc: Rob Herring <robh+dt@kernel.org
Cc: Frank Rowand <frowand.list@gmail.com
Cc: devicetree@vger.kernel.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
v2
 - Split out of larger patch (Eze)
 - s/Atmel/Microchip/ (Nicolas)
 - Drop leading 0 in node name/address
---
 arch/arm/boot/dts/sama5d4.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sama5d4.dtsi b/arch/arm/boot/dts/sama5d4.dtsi
index 05c55875835d..88284f60feb1 100644
--- a/arch/arm/boot/dts/sama5d4.dtsi
+++ b/arch/arm/boot/dts/sama5d4.dtsi
@@ -101,6 +101,15 @@ nfc_sram: sram@100000 {
 			ranges = <0 0x100000 0x2400>;
 		};
 
+		vdec0: vdec@300000 {
+			compatible = "microchip,sama5d4-vdec";
+			reg = <0x00300000 0x100000>;
+			interrupts = <19 IRQ_TYPE_LEVEL_HIGH 4>;
+			interrupt-names = "vdec";
+			clocks = <&pmc PMC_TYPE_PERIPHERAL 19>;
+			clock-names = "vdec_clk";
+		};
+
 		usb0: gadget@400000 {
 			compatible = "atmel,sama5d3-udc";
 			reg = <0x00400000 0x100000
-- 
2.30.1

