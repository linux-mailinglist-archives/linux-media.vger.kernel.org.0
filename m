Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE3D459502
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 19:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240488AbhKVSuj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 13:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240442AbhKVSu3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 13:50:29 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26279C06175D;
        Mon, 22 Nov 2021 10:47:22 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id r11so81199452edd.9;
        Mon, 22 Nov 2021 10:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OrAz2qSS0v6VrYhP03ydDVHSa28f05qdX2rEWeofBjI=;
        b=aBwbTm8os5gysOh9BjYaJ/KuTUKCj4tXn/KHFS6T5lt1KoTatn8M9t0R2mpFXh+Qzl
         AvxgkKXym1AXPSo+sKCLQ3UsO2JpJM41A8QwTZ5/EyTSXp3Y4jYQ5x05xaJZvqTO+gcM
         ifWoqay6i2F4ozO7jdpQoPMP41qsfmFfIGvmL52JNhlJLQKMejXeAM1o3C0KFxpByBgQ
         M4Mt+Fq4OhK6GkQ+TaJkGO54CRtZ9zo+Pq71HtYX/8paiwt+MogdOkxQ7o9P/c+cGvO0
         V6V3/HSuVa7Yw8+xjpHCwKbk6gwffex9wM8peWGyzt4ycSCxuanD2j68W65bFzNgNd7v
         GzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OrAz2qSS0v6VrYhP03ydDVHSa28f05qdX2rEWeofBjI=;
        b=KqTbbXd0BnC+R4GEizYHJpUea1+Ri0W+z82u+xQYXBB42Md2XQsNH90AKZ2vyNPfKX
         +dUCJQ+5rqtXgv/cEDRu5Ix6ceru3Vsy/ZW/mD+7I2vy7gsQxi7OUXoIzrSNcdTL99OO
         QEXP4u2lqtjmPWShSZmZdA0EvuI2dFkAGk/vY0BoeyuOCrZuTa60j4rl2c59KQbN4N5G
         TIfdof9eeBgvJv63QllbFkNYLmYj182q3pSxCw5gHibNs5i8zQV7uz4Qxyt2RSnvDyph
         uNVzjfBmFzGu8hCud1tJle9BTu5MWNSUIdtL93X59pLgQcbZFrbWZDU8nLUI+Jehs9lN
         bBKg==
X-Gm-Message-State: AOAM533FlQ8ahQ7T50yl1zSB6WFZDZzsc1LWV8ruc0woW0silj6jtSRz
        K+/tXRVtfYV1qNkXjFBLio9BHOYA48BaIA==
X-Google-Smtp-Source: ABdhPJzTkCP49CfK8OCN7Yj69H529JSNBRlwwEGGRuoxwaPQq1w+6+n7Bo+zSmFqF8zimlUpwdtfmg==
X-Received: by 2002:a05:6402:5194:: with SMTP id q20mr58077323edd.250.1637606840774;
        Mon, 22 Nov 2021 10:47:20 -0800 (PST)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id h10sm4512312edr.95.2021.11.22.10.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 10:47:20 -0800 (PST)
From:   Jernej Skrabec <jernej.skrabec@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     ezequiel@vanguardiasur.com.ar, nicolas.dufresne@collabora.com,
        mchehab@kernel.org, robh+dt@kernel.org, mripard@kernel.org,
        wens@csie.org, p.zabel@pengutronix.de, andrzej.p@collabora.com,
        gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 7/7] arm64: dts: allwinner: h6: Add Hantro G2 node
Date:   Mon, 22 Nov 2021 19:47:02 +0100
Message-Id: <20211122184702.768341-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122184702.768341-1-jernej.skrabec@gmail.com>
References: <20211122184702.768341-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

H6 SoC has a second VPU, dedicated to VP9 decoding. It's a slightly
older design, though.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index 4c4547f7d0c7..878061e75098 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -153,6 +153,15 @@ mixer0_out_tcon_top_mixer0: endpoint {
 			};
 		};
 
+		video-codec-g2@1c00000 {
+			compatible = "allwinner,sun50i-h6-vpu-g2";
+			reg = <0x01c00000 0x1000>;
+			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_VP9>, <&ccu CLK_VP9>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_VP9>;
+		};
+
 		video-codec@1c0e000 {
 			compatible = "allwinner,sun50i-h6-video-engine";
 			reg = <0x01c0e000 0x2000>;
-- 
2.34.0

