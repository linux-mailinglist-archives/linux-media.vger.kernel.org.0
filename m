Return-Path: <linux-media+bounces-804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 577917F4770
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A3F52811BD
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AA251015;
	Wed, 22 Nov 2023 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jjQAnthg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A29191;
	Wed, 22 Nov 2023 05:14:16 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D1EC6EF;
	Wed, 22 Nov 2023 14:13:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700658822;
	bh=grxjc5oPfkc4yi8C+sR2kDM81apJg3ELEbrGiy+KFM0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jjQAnthgxn697I6YpYq0XmJj7SdfyCi69X8jm9bc82FxI506m7dUHWO5mM5RPCwwY
	 9zEZaqo0gmCbZ+gn7OtwptjWQqpFPMRDTuhYr8O85fkAXcaJWV2sirPpVyx8PYfVzf
	 3C1ydHpkVGZCW3Msl5TJjeuZvu3+wVziP62Eu2kc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 22 Nov 2023 15:13:49 +0200
Subject: [PATCH 2/2] media: imx-mipi-csis: Drop extra clock enable at
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-imx-csis-v1-2-0617368eb996@ideasonboard.com>
References: <20231122-imx-csis-v1-0-0617368eb996@ideasonboard.com>
In-Reply-To: <20231122-imx-csis-v1-0-0617368eb996@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2282;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=grxjc5oPfkc4yi8C+sR2kDM81apJg3ELEbrGiy+KFM0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlXf6ixWjeF0HRbIjAcZmWDEdLJA0x39UzpL+dN
 knosF/zzH2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZV3+ogAKCRD6PaqMvJYe
 9em+D/91Yj9X6HpvONi/OwvSPfSqgLbmZ4TlEQXnG25MJEds11sjNcKvQQS/TnppGbgnE295I0p
 dMJDjjrn9uqMxEQzJBme0qn3+13vBh7bxpEqr9i7Psr0Zb80KO48Vk051lWSarMw851beZT5y0Z
 tf1ItS/9MNxVg3CdXsIvy1wW9XMWCoZHIZIA8kD7xBA4JvJYoR1Odbq/80QZz0KcB09cE6nsT6f
 yMQ8PZgm8IB4/pYrN5EceOqFpbvyDScIEv8aCVL23dd/Oh2Lb7LHvXiBMf0ASgXydoErHoEYjm1
 WB9HntxOiYpMa2yfu+lsdFT4gTtM3dQhJ4oSSmdOknlDsgOg+e+5gkw8OLLzoMUv4M1RwNZLOtk
 KzbQQm2o2mlPkXHxa5Sw3WmTTw/uSH2WE5rBYuW5OuY/1qmD/QvPOy5tKtVzlOkEJtVVB4jpQnM
 T/Kr6WqOXAR2A/3sTOvGD7CBY0nszOvkC0DTXLzZHbXa1912R78h/06yDliBj5i6FwzEqE0sCgy
 ChhVFPi/rIQtkO8y/vz/cO429l1zzprFjDKwYYOcf94Cw3b2MkImKX5UIhOiElz5sKhjgGqiTcI
 N1SFkJbF5JxP/tmtP7WnqoiKJ/nvmZlRpQigzoPNpiI69PNqLND2L7jtyY5353T9DpkjFUlpHji
 kyIaf9QL0Ft2trQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver always enables the clocks at probe() and disables them only
at remove(). It is not clear why the driver does this, as it supports
runtime PM, and enables and disables the clocks in the runtime resume
and suspend callbacks. Also, in the case runtime PM is not available,
the driver calls the resume and suspend callbacks manually from probe()
and remove().

Drop the unnecessary clock enable, thus enabling the clocks only when
actually needed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index b39d7aeba750..b08f6d2e7516 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1435,24 +1435,18 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	/* Reset PHY and enable the clocks. */
 	mipi_csis_phy_reset(csis);
 
-	ret = mipi_csis_clk_enable(csis);
-	if (ret < 0) {
-		dev_err(csis->dev, "failed to enable clocks: %d\n", ret);
-		return ret;
-	}
-
 	/* Now that the hardware is initialized, request the interrupt. */
 	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
 			       dev_name(dev), csis);
 	if (ret) {
 		dev_err(dev, "Interrupt request failed\n");
-		goto err_disable_clock;
+		return ret;
 	}
 
 	/* Initialize and register the subdev. */
 	ret = mipi_csis_subdev_init(csis);
 	if (ret < 0)
-		goto err_disable_clock;
+		return ret;
 
 	platform_set_drvdata(pdev, &csis->sd);
 
@@ -1486,8 +1480,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&csis->notifier);
 	v4l2_async_nf_cleanup(&csis->notifier);
 	v4l2_async_unregister_subdev(&csis->sd);
-err_disable_clock:
-	mipi_csis_clk_disable(csis);
 
 	return ret;
 }
@@ -1506,7 +1498,6 @@ static void mipi_csis_remove(struct platform_device *pdev)
 		mipi_csis_runtime_suspend(&pdev->dev);
 
 	pm_runtime_disable(&pdev->dev);
-	mipi_csis_clk_disable(csis);
 	v4l2_subdev_cleanup(&csis->sd);
 	media_entity_cleanup(&csis->sd.entity);
 	pm_runtime_set_suspended(&pdev->dev);

-- 
2.34.1


