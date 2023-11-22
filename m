Return-Path: <linux-media+bounces-839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F4A7F4A29
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73BA41C20B53
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968114EB56;
	Wed, 22 Nov 2023 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Eov64+qh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CB4E7;
	Wed, 22 Nov 2023 07:21:55 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 932E0641;
	Wed, 22 Nov 2023 16:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700666482;
	bh=oLh+PYyvynzrtsVKhC9dRmFuGMQd356Ob1Vi0pnH3uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Eov64+qh5+l2JI/hZS6I7DOpXiFQdbP67UBBuwXV4ASAwfL5ewOKcA6UTg+pvdV4n
	 5ydILDHildwhCI5zyY256SizMFqXQYFeUvWFoteoVorJVUBlBlGsAuyX6RTzt/v7mB
	 20LmrdmF2OGZAYL6afR3XeZOuj3qstq1Dlmw9at4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 22 Nov 2023 17:21:35 +0200
Subject: [PATCH v2 2/2] media: imx-mipi-csis: Drop extra clock enable at
 probe()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-imx-csis-v2-2-e44b8dc4cb66@ideasonboard.com>
References: <20231122-imx-csis-v2-0-e44b8dc4cb66@ideasonboard.com>
In-Reply-To: <20231122-imx-csis-v2-0-e44b8dc4cb66@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oLh+PYyvynzrtsVKhC9dRmFuGMQd356Ob1Vi0pnH3uI=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlXhyO7E0e4Yi0seizlKIhwM6sPd6QWD4XXH963
 56XWdMxPb6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZV4cjgAKCRD6PaqMvJYe
 9eavD/wIeF/Msot/w6WJqthTJU/S9QIUb6BUTmAtOot7zFYQdMM3aGinlcQxnQ2LVHnZ092dP1E
 15Sg1PVzM90NdXVwZybVnUhEPFfKuAm5nM5fYX7PyFXksAQFvXv8KEItyjWJzMJpTPADUAqVH5p
 kMpFmDbyq1a4xSVpFXb5zMVdHAKNAHaFOtaI2+Ha/gYvF6EQLhn8Hl7eY8ZI3TQtBE2amTzOxaT
 1N121JJMCFk2F9sJBgCUobGenO3eg/oV92rzUOva7LudQNT/H7T78c8p7OU6AIAenW94ZVajQKC
 OXB4M4B/VP2+ZB1ApBV3CWbD68FQtjsdkDsNsNDH3Q0gnnWHQDd7iumoI+xq3ts34tn6iznTUjT
 eD0zgyFpekj/jyMpjd9s9jlvY4VuekXUjADWKLNWqx6x1ZZ+5OGAMvcFQrUfS5StgJISb7vfkM1
 5Gav39YZjF9U1HXziFt1YPKDRjskx8YUIVf6Yk4ZIu+Jj4Eous6qV1UULjxR2D0VCYr79akfNno
 PXf2VDmc/+NeSqTn8+ii9yxpq6atzVjBwZagXH+BsOtHk77hyXkMPy1xjb6L6ejrCkF8QKKJcVS
 Ej10zkGTeGIBa9cAKXFxlxspBgd8n9mOoiANcs/9znxoK8C0VD/c8Ub1VFfWCqUnF3gXk+S+hp0
 Y0Ea9XqGjyOYruw==
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

Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


