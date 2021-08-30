Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5AE3FBB79
	for <lists+linux-media@lfdr.de>; Mon, 30 Aug 2021 20:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238476AbhH3SJT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Aug 2021 14:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238457AbhH3SJQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Aug 2021 14:09:16 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217B4C061760;
        Mon, 30 Aug 2021 11:08:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id w4so27349594ljh.13;
        Mon, 30 Aug 2021 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ve+0gBjNVwOFf/fLKtwq/poncp3FUSoE3lXd6aqpTvU=;
        b=Qy7MCutd9aL5mcCwuccur+Y2YFmcJCH6xuQv1iijjB52l6zX8k/qDnaQJ4942qPtl6
         x0BNdVVJDEc3WUdJTFuiy9aMtyktQDT3PnL3xtW1nXNlQn0/ndW64HOwEYLVi7DrlJKE
         C84UDq6b0Cg62s0it9AQf1GbIbVH14Np/xpMRSXXJ02JsuQzZql2rmkn+eAbPrvLuwOE
         Fw9xrp6Q5t6eF6RJiVSbYc9y/sUlEO5gVKIAu5myGw4DenUsAFxSo8no0yjqZARIpYGe
         3W94QgniK7yMq6gKpbpfWJTGvxzjg8+NrrnfjD6FfxZaJS+gJWqWLqfWNnqPmpojoTFC
         5rlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ve+0gBjNVwOFf/fLKtwq/poncp3FUSoE3lXd6aqpTvU=;
        b=deZ5x9WZFKNra9tIXk+wij5OXrj/BYgSevxoenrFWIHJG4/wJKPDdLufQGFGD3Tllu
         paxgLi4A6/t1lj42eQ6qAL/MCC1+iLngL8yyKqa6kZsBRHBYQigAvNjfJ6veGoteRPlv
         Q4vPxsFNDRVdwVomMr5/Ronk+xXKRhKiK9YiV0wn30KtTFLXj5QOSAFJfx2jQqI/+6uY
         NSI/srq5EqwXjnk5eld0HnGAY2ZIVf7mHdJU2vgv+81vuS44tpF3PRY78dwIL+tDlQZS
         U3XDcx8rPz0N+rKB5I4RZEh+NcdiT9Fr37u+OCAdqcP+xqUZtz1qek4aXU0X0r9IsCGw
         u/Pw==
X-Gm-Message-State: AOAM533o4LJ9nGqFSvhXfJpe7FHjONpIRwffHs/ZUuyaZsSGBkLP48wR
        aydLxb/MvDaKv5N/jTujjKc=
X-Google-Smtp-Source: ABdhPJyi9Z0B4DtcTWjRYh0YUpm1T75Z70yBsa/F4dMafSBCnsjW/j/dKCFGLng9t4mE/UlS1eTIBg==
X-Received: by 2002:a05:651c:2c6:: with SMTP id f6mr21743389ljo.7.1630346900444;
        Mon, 30 Aug 2021 11:08:20 -0700 (PDT)
Received: from localhost (37-145-211-218.broadband.corbina.ru. [37.145.211.218])
        by smtp.gmail.com with ESMTPSA id j1sm1108503lja.108.2021.08.30.11.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:08:20 -0700 (PDT)
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-phy@lists.infradead.org
Cc:     linux-media@vger.kernel.org,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] phy: rename phy-rockchip-dphy-rx0 to phy-rockchip-dphy-rx
Date:   Mon, 30 Aug 2021 21:07:52 +0300
Message-Id: <20210830180758.251390-4-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830180758.251390-1-mike.rudenko@gmail.com>
References: <20210830180758.251390-1-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since the driver now supports both rx0 and tx1rx1 phys, rename module
and Kconfig option to phy-rockchip-dphy-rx and PHY_ROCKCHIP_DPHY_RX
respectively.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/phy/rockchip/Kconfig                              | 8 ++++----
 drivers/phy/rockchip/Makefile                             | 2 +-
 .../{phy-rockchip-dphy-rx0.c => phy-rockchip-dphy-rx.c}   | 0
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/phy/rockchip/{phy-rockchip-dphy-rx0.c => phy-rockchip-dphy-rx.c} (100%)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index e812adad7242..6096ca9a07f9 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -9,17 +9,17 @@ config PHY_ROCKCHIP_DP
 	help
 	  Enable this to support the Rockchip Display Port PHY.
 
-config PHY_ROCKCHIP_DPHY_RX0
+config PHY_ROCKCHIP_DPHY_RX
 	tristate "Rockchip MIPI Synopsys DPHY RX0 driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select GENERIC_PHY_MIPI_DPHY
 	select GENERIC_PHY
 	help
-	  Enable this to support the Rockchip MIPI Synopsys DPHY RX0
-	  associated to the Rockchip ISP module present in RK3399 SoCs.
+	  Enable this to support the Rockchip MIPI Synopsys DPHY RX
+	  associated to the Rockchip ISP modules present in RK3399 SoCs.
 
 	  To compile this driver as a module, choose M here: the module
-	  will be called phy-rockchip-dphy-rx0.
+	  will be called phy-rockchip-dphy-rx.
 
 config PHY_ROCKCHIP_EMMC
 	tristate "Rockchip EMMC PHY Driver"
diff --git a/drivers/phy/rockchip/Makefile b/drivers/phy/rockchip/Makefile
index f0eec212b2aa..2d28526808a6 100644
--- a/drivers/phy/rockchip/Makefile
+++ b/drivers/phy/rockchip/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PHY_ROCKCHIP_DP)		+= phy-rockchip-dp.o
-obj-$(CONFIG_PHY_ROCKCHIP_DPHY_RX0)     += phy-rockchip-dphy-rx0.o
+obj-$(CONFIG_PHY_ROCKCHIP_DPHY_RX)     += phy-rockchip-dphy-rx.o
 obj-$(CONFIG_PHY_ROCKCHIP_EMMC)		+= phy-rockchip-emmc.o
 obj-$(CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY)	+= phy-rockchip-inno-csidphy.o
 obj-$(CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY)	+= phy-rockchip-inno-dsidphy.o
diff --git a/drivers/phy/rockchip/phy-rockchip-dphy-rx0.c b/drivers/phy/rockchip/phy-rockchip-dphy-rx.c
similarity index 100%
rename from drivers/phy/rockchip/phy-rockchip-dphy-rx0.c
rename to drivers/phy/rockchip/phy-rockchip-dphy-rx.c
-- 
2.33.0

