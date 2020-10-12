Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C24228C381
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 22:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731766AbgJLU7F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 16:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731678AbgJLU65 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 16:58:57 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9236C0613D1;
        Mon, 12 Oct 2020 13:58:56 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 3CB661F44C33
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/18] media: hantro: add reset controller support
Date:   Mon, 12 Oct 2020 23:59:43 +0300
Message-Id: <20201012205957.889185-5-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012205957.889185-1-adrian.ratiu@collabora.com>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Some SoCs might have a reset controller which disables clocks
by default in reset state which then drivers need to unreset
before being able to ungate a specific clock.

In this specific case, the hantro driver needs to ensure the
peripheral clock can be properly ungated otherwise MMIO reg
values can't be accessed.

If the SoC has no reset controller or there is no "resets" DT
property defined, this new code will have no effect.

Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/hantro/hantro.h     | 1 +
 drivers/staging/media/hantro/hantro_drv.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 65f9f7ea7dcf..bb442eb1974e 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -183,6 +183,7 @@ struct hantro_dev {
 	struct platform_device *pdev;
 	struct device *dev;
 	struct clk_bulk_data *clocks;
+	struct reset_control *reset;
 	void __iomem **reg_bases;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 3cd00cc0a364..c2ea54552ce9 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -17,6 +17,7 @@
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/reset.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
@@ -747,6 +748,13 @@ static int hantro_probe(struct platform_device *pdev)
 
 	INIT_DELAYED_WORK(&vpu->watchdog_work, hantro_watchdog);
 
+	vpu->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
+							       NULL);
+	if (IS_ERR(vpu->reset))
+		vpu->reset = NULL;
+
+	reset_control_reset(vpu->reset);
+
 	vpu->clocks = devm_kcalloc(&pdev->dev, vpu->variant->num_clocks,
 				   sizeof(*vpu->clocks), GFP_KERNEL);
 	if (!vpu->clocks)
-- 
2.28.0

