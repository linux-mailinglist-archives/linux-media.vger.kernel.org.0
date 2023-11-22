Return-Path: <linux-media+bounces-838-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F337F4A28
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 16:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E96D2810B7
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7314EB42;
	Wed, 22 Nov 2023 15:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wIgzJjSf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E5A2109;
	Wed, 22 Nov 2023 07:21:54 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BFE529A;
	Wed, 22 Nov 2023 16:21:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700666481;
	bh=a5vaX6GZvtlfsAJNQBP0qAAJygXfjxV7faNEkvKdK9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wIgzJjSfWQ/kP8yC8CEoH2R9L9SOleWmnXyPCuqzZaeqVR6Lgd/2/rcRNG+chaYbi
	 IVIJGZar0WWFOA0Ys5uFHR+YFnZEmlfCAfE+DNSsY8Qqq5vfipWuiLY0Qq4+1jO23O
	 3/prCLB2LmnzDJwVOVx897QIqgCnzhMtV/Wz0rUQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 22 Nov 2023 17:21:34 +0200
Subject: [PATCH v2 1/2] media: imx-mipi-csis: Fix clock handling in
 remove()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-imx-csis-v2-1-e44b8dc4cb66@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=a5vaX6GZvtlfsAJNQBP0qAAJygXfjxV7faNEkvKdK9o=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlXhyNxfbxyP5pZgrruxd6JZbUxZTPsCrogRzmE
 YfMDSZT4t2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZV4cjQAKCRD6PaqMvJYe
 9fOTD/0bQ/m+qas+P6A2bvwFTA9FVHi6b1pk2wZNrbMFhwjOFDiTRQSfKsR8sOKfoWBuXR7YQ9p
 0DahtKNW5EmY1OBIgnapXcjvWnZ/pFq10bhbWs/ocsggSRacLTCit9yN9y/GevVxFM8pDDEBoca
 YxpJE3VUBlBY8TbOGksntlttUj93EdwjoDju2+zSFVLxENApox4jDvuotlgHxHI/5HZzJthT/Fk
 wODTbbq/EMqsD7lJkTDyzvfxzf1zDJ+X1bgMkVQPyq5EsSl2YKv5k+dE/a8Mr9UmFdroNLvWiGB
 qi8jA8qyDYqsXc10QfJTCwj7s/+NQbgliO0jGkuXgtKK4h4evfaeO8KXREkYzxRwAcbyl5rcnHz
 n+BvqCDb5AhUbJXqDvNKrthoJD4L9hlJICLRXWlNyeO9XHhxfb/FuchG3M0U2rXQ4F7BxtvhYGP
 UlsKx7opxlWlEmSROo6Sa3il5PtvWRz0ZgFkF3TiFGiKGdsKMW+5lwITUtu0mRw+fOt9LKSixPI
 JPIjlkdOo4OJTqmz7GHMHGNjPN+57s8QYWMbANpeQj3rSupQyAhCJyR4Hg3exPAbZ2aZA9AyAlT
 5Oo8YUO4GQ3lSvVl7XA9xhHTgSr6DvTGWluI6pNfkbB8uNvA2y01kAyGgCy00cALlCOHZNhUPod
 nvdkjvcWVSiQx8A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver always calls mipi_csis_runtime_suspend() and
mipi_csis_clk_disable() in remove(). This causes multiple WARNs from the
kernel, as the clocks get disabled too many times.

Fix the remove() to call mipi_csis_runtime_suspend() and
mipi_csis_clk_disable() in a way that reverses what is done in probe().

Fixes: 7807063b862b ("media: staging/imx7: add MIPI CSI-2 receiver subdev for i.MX7")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 6cb20b45e0a1..b39d7aeba750 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1502,8 +1502,10 @@ static void mipi_csis_remove(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&csis->notifier);
 	v4l2_async_unregister_subdev(&csis->sd);
 
+	if (!pm_runtime_enabled(&pdev->dev))
+		mipi_csis_runtime_suspend(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
-	mipi_csis_runtime_suspend(&pdev->dev);
 	mipi_csis_clk_disable(csis);
 	v4l2_subdev_cleanup(&csis->sd);
 	media_entity_cleanup(&csis->sd.entity);

-- 
2.34.1


