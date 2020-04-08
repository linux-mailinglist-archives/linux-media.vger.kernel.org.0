Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C98C1A265F
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 17:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729773AbgDHPxw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 11:53:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:57159 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729726AbgDHPxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 11:53:52 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MTAW9-1jjUM20lyh-00UXnC; Wed, 08 Apr 2020 17:53:29 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Helen Koike <helen.koike@collabora.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Jacob Chen <jacob2.chen@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Yichong Zhong <zyc@rock-chips.com>,
        Jacob Chen <cc@rock-chips.com>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Jeffy Chen <jeffy.chen@rock-chips.com>,
        Allon Huang <allon.huang@rock-chips.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: rkisp1: avoid unused variable warning
Date:   Wed,  8 Apr 2020 17:52:44 +0200
Message-Id: <20200408155325.2077345-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:68Z72znrNvEuHIJsN20T/ABmAB4bmydH1GC38M8EeLkViwTTCj5
 pGlc7UTVbkUzb3TX+27y7HvCoxt6g49BGBUEx+iIZG69x2Sw/ZAeDGz4YJQ/1RylPMQQTYI
 zejJf3aUKH6QMhCjW2+TZbGrVbYkE02vPqUUa6B8COUi1NZ10c+LnN9+a5YJYKVdNmBmcX6
 jwT6sd1yAggxfj72OZTEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pHcQGDHfPRM=:BGjK9PBI3Cv7HcjiPXdVRV
 veg/Iv3oEeWyZrZuc526rWsTCrXGCmYKF61vLds7WqC0HQXbd1TKawxO2hzYiYKYziH50bYsA
 HWJeIq2XxRQ9awws9JYfGBbXHNnGsQ7KdDWyzhS8A5Mm7uWj6AbkwfYxZL1TOftZoC1poIxUy
 uhZfR0Ak/D/dNWB4KixIl8CEgsNAxK5eJtnh410RtBuz8RTq6FI5/SG/fml7J1Fy7OXnmsym1
 S+7zZYcGmpmfW5v7z9h4Eq8gFSTQNCMXISk/rTGfVJmg/2mavQxyO1SZfkYm6I45IY9qBSTe/
 hr7fg6zoCfYdnChvGHrGT5N91mIa9ZI0OJUKEnenUDA7GuqdcbPnNujJ9KN/s2tlBI4TYCDd4
 Sfqit78M6BuwyoBCPn4WnP6uT6zoAp69vf6WiI7Yl3eD/YBPihOU1vabHxjTBTt7zByNdC1sz
 +ovfdYMrlRcuSz2peoUqGfRWiWrRdVjpIvf/NlXNW1kmYxcUzy3tZYIjgodl3EUd1Wpkkeixc
 YLybc3H8NNrW30aiBxp81ZGHRbSTw1za6rxFwsVPt9FPMtJzhBsnqkAp1Qdzdn1ArIKijZ6YU
 D2+gDDX5iI6bGfT2iGpk3xlNzuOvBicVbCZWP/Ga1mt/Q5BaC9Rvpb85MeUqawXvl/l8lmFKj
 SR1m14dBS2CKphtSbaBWhEnn/LR4AnE237zjX4B+QXVr4R9bYwiR9LI79zyGTCGW6NzSTMIhi
 q5LadUcKDJvXiFsfA79FVSJiRXwvkfRuEgSTU8339oKtVSgdJss1V2c6YWqGXjdXDKLJ/wknV
 XpcE4nsXJ9yRJBZpgY2faYkTbrppcROTcP+ag9ETP8jT0xI2rY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When compile-testing with CONFIG_OF disabled, we get a warning
about an unused variable, and about inconsistent Kconfig dependencies:

WARNING: unmet direct dependencies detected for PHY_ROCKCHIP_DPHY_RX0
  Depends on [n]: STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=m] && (ARCH_ROCKCHIP [=n] || COMPILE_TEST [=y]) && OF [=n]
  Selected by [m]:
  - VIDEO_ROCKCHIP_ISP1 [=m] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=m] && VIDEO_V4L2 [=m] && VIDEO_V4L2_SUBDEV_API [=y] && (ARCH_ROCKCHIP [=n] || COMPILE_TEST [=y])

drivers/staging/media/rkisp1/rkisp1-dev.c: In function 'rkisp1_probe':
drivers/staging/media/rkisp1/rkisp1-dev.c:457:22: error: unused variable 'node' [-Werror=unused-variable]
  457 |  struct device_node *node = pdev->dev.of_node;

Simply open-coding the pointer dereference in the only place
the variable is used avoids the warning in all configurations,
so we can allow compile-testing as well.

Fixes: d65dd85281fb ("media: staging: rkisp1: add Rockchip ISP1 base driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig | 2 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c           | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig b/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
index bd0147624de1..dd5d4d741bdd 100644
--- a/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
+++ b/drivers/staging/media/phy-rockchip-dphy-rx0/Kconfig
@@ -2,7 +2,7 @@
 
 config PHY_ROCKCHIP_DPHY_RX0
 	tristate "Rockchip MIPI Synopsys DPHY RX0 driver"
-	depends on (ARCH_ROCKCHIP || COMPILE_TEST) && OF
+	depends on (ARCH_ROCKCHIP && OF) || COMPILE_TEST
 	select GENERIC_PHY_MIPI_DPHY
 	select GENERIC_PHY
 	help
diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
index b1b3c058e957..5e7e797aad71 100644
--- a/drivers/staging/media/rkisp1/rkisp1-dev.c
+++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
@@ -454,7 +454,6 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 
 static int rkisp1_probe(struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	const struct rkisp1_match_data *clk_data;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
@@ -463,7 +462,7 @@ static int rkisp1_probe(struct platform_device *pdev)
 	unsigned int i;
 	int ret, irq;
 
-	match = of_match_node(rkisp1_of_match, node);
+	match = of_match_node(rkisp1_of_match, pdev->dev.of_node);
 	rkisp1 = devm_kzalloc(dev, sizeof(*rkisp1), GFP_KERNEL);
 	if (!rkisp1)
 		return -ENOMEM;
-- 
2.26.0

