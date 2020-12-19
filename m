Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4972DEE88
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 12:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgLSL1n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 06:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgLSL1n (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 06:27:43 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5092C06138C;
        Sat, 19 Dec 2020 03:27:02 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id u19so5025645edx.2;
        Sat, 19 Dec 2020 03:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=O0BHF7zOv72+OMsiSWi5IM7QDQ0jnj2mxRk25H3az0M=;
        b=gaOG8iDkx32Hjz0NHAA1IWSgUnit8I4ja1eg/F3dwNFB/vSFVyMRruKpFc3A6ohNHf
         XhehpIQfkmJ5I+zdqZt8qMS7wuMuKIuOzIQ69so78gItjJCDyUYNsOjJhLmf0pJ2wYxq
         qTs2V66XpMefNS5JW5B+oVk+yu4+xDr+xgeEFVek8LH6bXKyUTgXeWJFkQPjMIZFrGcS
         MPY1mA8EMzXJc0r8Qg1v3LJnj2PwhBPf9VAgKov2xceqJAZJMcLnFwKV/qJHVB1uiy8n
         ZqWAwP7OiE9YEIQJqfV0ybtXd4qBKjOlFqsv6R1ymvMuIPF10XGY79qvn8XK0lEPgwn2
         RuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=O0BHF7zOv72+OMsiSWi5IM7QDQ0jnj2mxRk25H3az0M=;
        b=eZSZQe14G3JrEBfcMOlLNdK77nY31s8g3pIp77IG4WzqBq5j4lOxR17JUe328YUgIv
         uC8cdaC6nrcGu8GmOd0lV0ysfUm0ElkX0IGjm8f/Vu8Iexyl3jTbxHAE+vHqCI/tIhNR
         tlssqog65+b75r4CcZvVfSjnaJWqQvTzcN9aDo2/En5KWb7sMoUruzDUae77RgxO5fz7
         Qud4DVIp/Z2TX4LZopDJeiQ7cUEVCBdt44DbsAX/6jresofkJ+1I5/acapnCaHrpOU+8
         vN1sHPAQWHugtZLsfEbfJfLBMqYcrujurxZZ1t2w075XiarC1NzBik3gLMXlA2QeGe2i
         8U2w==
X-Gm-Message-State: AOAM5338UmNcxzkQIBwRKSBHxs1nk82Jj6O6lQTnD8dZ/+EvifkzgMEd
        fcBeCe/kskcS/PpYk840je+XJTKPHYA/7Q==
X-Google-Smtp-Source: ABdhPJx9FYJ+jxcG0dXiSajPuZQ5bbFi2zAzIcjOiLcM8ERkoBEBNlnq9wk/EvXNqFHwlc3DOGn/sQ==
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr8453714edw.52.1608377221597;
        Sat, 19 Dec 2020 03:27:01 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id n17sm6651785ejh.49.2020.12.19.03.27.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Dec 2020 03:27:01 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, mchehab@kernel.org, jacob-chen@iotwrt.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 2/4] arm64: dts: rockchip: add rga node to px30.dtsi
Date:   Sat, 19 Dec 2020 12:26:51 +0100
Message-Id: <20201219112653.10705-2-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201219112653.10705-1-jbx6244@gmail.com>
References: <20201219112653.10705-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add rga node to the px30.dtsi file.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 541785425..fac9b4120 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1106,6 +1106,17 @@
 		status = "disabled";
 	};
 
+	rga: rga@ff480000 {
+		compatible = "rockchip,px30-rga", "rockchip,rk3288-rga";
+		reg = <0x0 0xff480000 0x0 0x1000>;
+		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA_CORE>;
+		clock-names = "aclk", "hclk", "sclk";
+		power-domains = <&power PX30_PD_VO>;
+		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
+		reset-names = "core", "axi", "ahb";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "rockchip,px30-qos", "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;
-- 
2.11.0

