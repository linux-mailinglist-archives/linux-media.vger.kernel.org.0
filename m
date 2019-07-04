Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2F835F809
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2019 14:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfGDMZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jul 2019 08:25:15 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:35710 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727860AbfGDMZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jul 2019 08:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=SDyZBgVgpBivHCPF+m1x0S7wJ18YA/zEjKyDZhRXAu0=; b=tUY6QW89WxBv
        crMBIl0VnT5UzMboWJVQGLGTzokl+Ex5oJFmVgkojHpOmUOjj5ypKN9vYKwwksHbr82fM72wz8tKC
        dGQeo2KVgV574zsDKNBIJnhdkaNEUfiqbwK3oqWPfxxc/PfplVHvqQVBYtahogPM4221Y894i89Qr
        nKKPs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hj0nM-0000jI-9w; Thu, 04 Jul 2019 12:25:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id CC975274388A; Thu,  4 Jul 2019 13:24:59 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     akinobu.mita@gmail.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, Hulk Robot <hulkci@huawei.com>,
        jacopo@jmondi.org, khoroshilov@ispras.ru,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Mark Brown <broonie@kernel.org>, mchehab+samsung@kernel.org,
        rafael@kernel.org, sakari.ailus@linux.intel.com,
        wsa+renesas@sang-engineering.com
Subject: Applied "regmap: select CONFIG_REGMAP while REGMAP_SCCB is set" to the regmap tree
In-Reply-To: <20190704093553.49904-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190704122459.CC975274388A@ypsilon.sirena.org.uk>
Date:   Thu,  4 Jul 2019 13:24:59 +0100 (BST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The patch

   regmap: select CONFIG_REGMAP while REGMAP_SCCB is set

has been applied to the regmap tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From eff5a850017193ae879948944be05cc814c29621 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 4 Jul 2019 17:35:53 +0800
Subject: [PATCH] regmap: select CONFIG_REGMAP while REGMAP_SCCB is set

REGMAP_SCCB is selected by ov772x and ov9650 drivers,
but CONFIG_REGMAP may not, so building will fails:

rivers/media/i2c/ov772x.c: In function ov772x_probe:
drivers/media/i2c/ov772x.c:1360:22: error: variable ov772x_regmap_config has initializer but incomplete type
  static const struct regmap_config ov772x_regmap_config = {
                      ^~~~~~~~~~~~~
drivers/media/i2c/ov772x.c:1361:4: error: const struct regmap_config has no member named reg_bits

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 5bbf32217bf9 ("media: ov772x: use SCCB regmap")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190704093553.49904-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index c8bbf5322720..a4984136c19d 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -4,7 +4,7 @@
 # subsystems should select the appropriate symbols.
 
 config REGMAP
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_I3C)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SCCB || REGMAP_I3C)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	bool
 
-- 
2.20.1

