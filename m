Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB5F3AA65D
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 23:52:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234155AbhFPVya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 17:54:30 -0400
Received: from gloria.sntech.de ([185.11.138.130]:60320 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234122AbhFPVy1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 17:54:27 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1ltdSH-0008QL-Ko; Wed, 16 Jun 2021 23:52:13 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH v4 01/10] media: rockchip: rkisp1: remove unused irq variable
Date:   Wed, 16 Jun 2021 23:52:02 +0200
Message-Id: <20210616215211.4002992-2-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210616215211.4002992-1-heiko@sntech.de>
References: <20210616215211.4002992-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

The irq variable in struct rkisp1 is unused as it is only used
to request the irq during probe, so remove it.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 1 -
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c    | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
index 038c303a8aed..be8a350c7527 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
@@ -352,7 +352,6 @@ struct rkisp1_debug {
  */
 struct rkisp1_device {
 	void __iomem *base_addr;
-	int irq;
 	struct device *dev;
 	unsigned int clk_size;
 	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 7474150b94ed..7afa4c123834 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -489,8 +489,6 @@ static int rkisp1_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	rkisp1->irq = irq;
-
 	for (i = 0; i < match_data->size; i++)
 		rkisp1->clks[i].id = match_data->clks[i];
 	ret = devm_clk_bulk_get(dev, match_data->size, rkisp1->clks);
-- 
2.29.2

