Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BC62DEE85
	for <lists+linux-media@lfdr.de>; Sat, 19 Dec 2020 12:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgLSL1o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Dec 2020 06:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgLSL1o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Dec 2020 06:27:44 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9519AC061282;
        Sat, 19 Dec 2020 03:27:03 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id c7so4996520edv.6;
        Sat, 19 Dec 2020 03:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dWKio+Hu+6BJFwiEu0pqQ0A1lkCqJjEmlgSWcdnhaHw=;
        b=QBAP15iG2B0sWDxIf6ZPg6D6vGmITWRKuzpw0fXAPZ3+tBsZGksDw+or4En1mvTu73
         XCpNPdWONJzOIBQwywgli8PQJlp7ONPeCgq4hHDrfHLTQvvfqbmaSc0MgXsICzH959kH
         MsBBWBXdT7RcetcaRQyp1liyXGSpzhtmNTgsZd0Hdrqr6/ngzQPzs0AbX2ahE7Whlqry
         fYV2SGR5aNpU2JA7+4jxfPXzAkgMbulNuft08iqlYuVltKroTP27bHcGWZgzGyx+SFKA
         VwY5KWnL+im9Q93QLIWWQEyvbPbCJvSfP9ibMxKauZKs/fbHUZ/1ezeRs6kpTGs4Zoev
         Mzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dWKio+Hu+6BJFwiEu0pqQ0A1lkCqJjEmlgSWcdnhaHw=;
        b=lb4sOUFv+gDtMShcu6ZaYYPPMweYB4UkesqoImHPrDd5NM+P6YNFOASiCm7WKpIXwp
         YplACfw6dWTbfx6yFoGfPCe9Yp+gRB5n79wOe2VgKR2Ce3En8Pc2f0UVSnfLA2g3Yuha
         Z4P+P82GWjiwNTTEZZ+XpBNMLnIH3QW324KnWpRKxwoZdc8CKtyKDnsZae/6dKB0OP9X
         1veXohLyqccNopx7PLrcqDggR92QK4FPJji3FTjY/d4jciKYkwrpCYWotpg7kPvYATij
         S2r0Dctpy9egQyzywN+Iidg74Q7UoPkKftTVfub7mn5QnngrmViEvQpdxNhu7GFj74Ug
         8NoQ==
X-Gm-Message-State: AOAM530vsvBxff1+9RfJP3eWanAdZiQHC0mB2tix8zpAh2KvjlbUCTNp
        DKc4G8FrC8POE0hNt5WfPfU=
X-Google-Smtp-Source: ABdhPJwx1hVRFyRILC7+TRy2vR59YpHyeP29I4+mqb9LKbQOqPBC/QkLkjmdiCHQMuq4MkSDaVdTaA==
X-Received: by 2002:aa7:c0c2:: with SMTP id j2mr8548577edp.343.1608377222442;
        Sat, 19 Dec 2020 03:27:02 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id n17sm6651785ejh.49.2020.12.19.03.27.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 19 Dec 2020 03:27:01 -0800 (PST)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, mchehab@kernel.org, jacob-chen@iotwrt.com,
        ezequiel@collabora.com, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 3/4] arm64: dts: rockchip: add rga node to rk3328.dtsi
Date:   Sat, 19 Dec 2020 12:26:52 +0100
Message-Id: <20201219112653.10705-3-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201219112653.10705-1-jbx6244@gmail.com>
References: <20201219112653.10705-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add rga node to the rk3328.dtsi file.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 1e3e1086e..c4170dc19 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -711,6 +711,16 @@
 		status = "disabled";
 	};
 
+	rga: rga@ff3900000 {
+		compatible = "rockchip,rk3328-rga", "rockchip,rk3288-rga";
+		reg = <0x0 0xff390000 0x0 0x1000>;
+		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RGA>, <&cru HCLK_RGA>, <&cru SCLK_RGA>;
+		clock-names = "aclk", "hclk", "sclk";
+		resets = <&cru SRST_RGA>, <&cru SRST_RGA_A>, <&cru SRST_RGA_H>;
+		reset-names = "core", "axi", "ahb";
+	};
+
 	hdmi: hdmi@ff3c0000 {
 		compatible = "rockchip,rk3328-dw-hdmi";
 		reg = <0x0 0xff3c0000 0x0 0x20000>;
-- 
2.11.0

