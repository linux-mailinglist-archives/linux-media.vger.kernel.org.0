Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8478D3FBB77
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 20:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238411AbhH3SJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 14:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238469AbhH3SJT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 14:09:19 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170B6C061760;
        Mon, 30 Aug 2021 11:08:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id l2so24882571lfp.2;
        Mon, 30 Aug 2021 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tNH9p1ySBp4UZ8l/t50r11EkpzeUvSvC0XpafPg6xs0=;
        b=CLXnwhdy6MXOOs8SpSpXTbPLfWqbua6tNBBcKMjLuz7YVXiC+rV5E1AskEoFwqy/lN
         KP6W0T7UEpHHgWRXeBIrkzMRgryNt4IPSHo9U5QRFLi1boBUIljgImhpaciXL3bo6yzb
         Rsr2pN144ecPzwBy5yD6tJqEbHN5SJJPsGn2k/6eUrkJuz6OWgg3jbublEV8KjUGyW9U
         UUzzKckWEhRMhB6FFrUt2aukzQ3Ny+FJqmeC1htOq9olg4giDoAT2bTPhoKTr+5ZOc1X
         9LD42iEuP/dEq+cY8t3iDKapUdIVN4DVUpFq02KsOMX8Vu8Z6gGIS9Vx8C4wW9nT5vBe
         sHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNH9p1ySBp4UZ8l/t50r11EkpzeUvSvC0XpafPg6xs0=;
        b=JP098Bu5Eik2oZKY2OTtbuBnchNBEOlheAe7gGpCRlOQ0APO2vxCMJfgkhUCtLODfW
         kB7E/FjvbWDMDaqKKpJVx02LBXHuZMJiS/M2ZVhy3Euts2EoSWW9WdZwj/GqrHtipI1S
         Ii/kqizJpdwov7PxhNi5QgoNzoNFbYJ0Mwx7VE0C1eHwyeScaa3V5ikpSmLgvvVpqMux
         KZT69ymZyrl1HxC6sofQDbaGAjRXbED5HsFTOTtZTU+fuqNvWhl4fXQd/kutPkfPm67Z
         D8JBt1GBx2qHmTZGCbWMfzAUeajRzNcK4oVZ3R64hn6i5alyhA5KINLqFYhxoguFhyxU
         /VjQ==
X-Gm-Message-State: AOAM530ooLw8uvIkEDzAWrIljFuh/Fpq7/oLRlgZnjRsCmRg5zdodOmk
        H+9W01xMD2F7o9jgfpUSwcw=
X-Google-Smtp-Source: ABdhPJwTZpqAdQiLuqh/W2bvYOZGd89ApOpWRv3Rc3552s1pAqdwg4dWbJ1Wln0Ax5lv0G8GDWFORQ==
X-Received: by 2002:ac2:58ce:: with SMTP id u14mr18518005lfo.59.1630346903521;
        Mon, 30 Aug 2021 11:08:23 -0700 (PDT)
Received: from localhost (37-145-211-218.broadband.corbina.ru. [37.145.211.218])
        by smtp.gmail.com with ESMTPSA id q189sm1859345ljb.68.2021.08.30.11.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:08:23 -0700 (PDT)
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] arm64: dts: rockchip: add mipi-dphy-tx1rx1 for rk3399
Date:   Mon, 30 Aug 2021 21:07:54 +0300
Message-Id: <20210830180758.251390-6-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830180758.251390-1-mike.rudenko@gmail.com>
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add DT node for RX mode of RK3399 TX1RX1 D-PHY.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 3871c7fd83b0..2e4513275a87 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -1902,6 +1902,21 @@ mipi1_in_vopl: endpoint@1 {
 		};
 	};
 
+	mipi_dphy_tx1rx1: mipi-dphy-tx1rx1@ff968000 {
+		compatible = "rockchip,rk3399-mipi-dphy-tx1rx1";
+		reg = <0x0 0xff968000 0x0 0x8000>;
+		clocks = <&cru SCLK_MIPIDPHY_REF>,
+			<&cru SCLK_DPHY_TX1RX1_CFG>,
+			<&cru PCLK_VIO_GRF>,
+			<&cru PCLK_MIPI_DSI1>;
+		clock-names = "dphy-ref", "dphy-cfg",
+			"grf", "dsi";
+		rockchip,grf = <&grf>;
+		power-domains = <&power RK3399_PD_VIO>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	edp: edp@ff970000 {
 		compatible = "rockchip,rk3399-edp";
 		reg = <0x0 0xff970000 0x0 0x8000>;
-- 
2.33.0

