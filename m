Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B7939054C
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 17:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbhEYPZ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 11:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbhEYPYk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 11:24:40 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC8FC06134B;
        Tue, 25 May 2021 08:23:02 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id w12so28942837edx.1;
        Tue, 25 May 2021 08:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Q58oNfdPoNizxHxGHMRtWsl8A7XLb0YSPcOPFqG+RU=;
        b=Z3B7VRrHXX2mPOIGKlrTfuADjdkWuDL93jq4HIGaHP5DTpqDuGHhRikQHgdzS6pWIQ
         km7HQMDDDA9DPk4ihKVcJ21N501vok9fkw+XU4fvZa7Mo4mnZjPoTlYGgWMygeK7W1/E
         vkGVV1/rneQ7S14fybK2Ce5HtK1oD7v8KDyC8H8pOSqZUolYWSHdQ7jhZV/sVw3RNdGy
         b/AgQqWij6rMVptGIYTehULp8sxawF68dJyNk9AGdfWHkVkgaV3ZI3V2eA4BTLE6TDgj
         gqcFscCMHvR8xDv1jJc6iwMfiu3EITI/K6VRDhWa5pNQPW+cG09wAHRMbb4yJ+q8s3KJ
         FOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Q58oNfdPoNizxHxGHMRtWsl8A7XLb0YSPcOPFqG+RU=;
        b=hwnIT2KxxUWnGVeOmBAzGYw7SEBznj1XHesFLQpgcCoJ5527JKxCW5n01MwuN+YZWa
         3HpyOPxonYA++xgtwDy68qHlVq31Y/dTs3WJjEBnlmxlWHaM1oI78ornWBRQwHONRsUU
         8CR+Si0gW3FKFWGqPiFy/5X+3tY56VXq8vxt6Kvdneqa/C9WXSmAEO7JE25mAzl5NjYp
         i3TAndQ4BXMFWwXc2b6OKAQmyMmzGVFlYq0ZLikvYAe+Pf50QSB5VkTZbQM+x4Yq9Hnp
         lPueR9vJvGr4tR+LGI7VUR7Ony0zUQSNZj6Za9UPSyfrYsKcUr7bbp/MSgzC4u+cQRxx
         a2zw==
X-Gm-Message-State: AOAM531zxDNIAJNyFHWv/rj/G4tHdVL+pTP1J7x4olc/WNiuHqFJErTt
        w5XAe/U60IlyMKhWHZ2S0g==
X-Google-Smtp-Source: ABdhPJxZWLnVQUmpO6P76M2RNI2+XO5GK4VruLUNs1Rnt//H4UHP+sfpl8w/hcaCbSZKi2vZ5B35xA==
X-Received: by 2002:a05:6402:176b:: with SMTP id da11mr32119743edb.234.1621956180881;
        Tue, 25 May 2021 08:23:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810b:f40:e00:b55:da44:4fe2:2760])
        by smtp.googlemail.com with ESMTPSA id e23sm11212945eds.2.2021.05.25.08.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 08:23:00 -0700 (PDT)
From:   Alex Bee <knaerzche@gmail.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     Alex Bee <knaerzche@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 09/10] ARM: dts: rockchip: add vdec node for RK322x
Date:   Tue, 25 May 2021 17:22:24 +0200
Message-Id: <20210525152225.154302-10-knaerzche@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525152225.154302-1-knaerzche@gmail.com>
References: <20210525152225.154302-1-knaerzche@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The vdec IP block of RK322x is the same as RK3399 has and the driver can
be used as-is.

Add the respective node to the device tree.

Note: core and cabac clock need to be set to a specific rate which is
done by using "assigned-clocks" / "assigned-clock-rates" properties
(axi clock rate is currently set in the driver).

Signed-off-by: Alex Bee <knaerzche@gmail.com>
---
 arch/arm/boot/dts/rk322x.dtsi | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index 62d1113b7804..13c2f92ac013 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -633,6 +633,19 @@ vpu_mmu: iommu@20020800 {
 		#iommu-cells = <0>;
 	};
 
+	vdec: video-codec@20030000 {
+		compatible = "rockchip,rk3228-vdec", "rockchip,rk3399-vdec";
+		reg = <0x20030000 0x480>;
+		interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_RKVDEC>, <&cru HCLK_RKVDEC>,
+			 <&cru SCLK_VDEC_CABAC>, <&cru SCLK_VDEC_CORE>;
+		clock-names = "axi", "ahb", "cabac", "core";
+		assigned-clocks = <&cru SCLK_VDEC_CABAC>, <&cru SCLK_VDEC_CORE>;
+		assigned-clock-rates = <300000000>, <300000000>;
+		power-domains = <&power RK3228_PD_RKVDEC>;
+		iommus = <&vdec_mmu>;
+	};
+
 	vdec_mmu: iommu@20030480 {
 		compatible = "rockchip,iommu";
 		reg = <0x20030480 0x40>, <0x200304c0 0x40>;
@@ -641,7 +654,6 @@ vdec_mmu: iommu@20030480 {
 		clock-names = "aclk", "iface";
 		power-domains = <&power RK3228_PD_RKVDEC>;
 		#iommu-cells = <0>;
-		status = "disabled";
 	};
 
 	vop: vop@20050000 {
-- 
2.27.0

