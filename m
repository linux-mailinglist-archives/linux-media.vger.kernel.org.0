Return-Path: <linux-media+bounces-30899-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F9A9A2E2
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9457C5A1B3F
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECA21F3BAA;
	Thu, 24 Apr 2025 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fvOxOkJt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB351F1936;
	Thu, 24 Apr 2025 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478395; cv=none; b=PLHxoiAgaLD2qro2LrejWDNSEnznMrp2ZPAEs6957o38IJ8CgiV1BHV8yp+6L5ibwzZArlohpzolUVsuwTNMh+ODmnXEJtIS2ABPr6wE6UR6ntXPSxrBRn5gGOr3k8GoeOPkgN3/Aeap4ZdF7tf1jb+u0P/U/JoQ7R9hj0uZ3TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478395; c=relaxed/simple;
	bh=qYMYY+/CA6mjieYZOTxpEgY4O+FfFxTZ+5yHgBlYdik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F9RDgAqL3osGdDR7LUEsUQOJ1qCLys9fwYjd/LFSAeohPE0+oJ5QYfLT7TP1aknKUachzghlO4pFEokYcwbtVipsJvlX6oDbciC7npyF9zwLlGWIbTacCM23argTzebXA4w1YeCYQYj44U36yOlrGM9PJ3seHghXNT4JySCei+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fvOxOkJt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 756781230;
	Thu, 24 Apr 2025 09:06:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745478386;
	bh=qYMYY+/CA6mjieYZOTxpEgY4O+FfFxTZ+5yHgBlYdik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fvOxOkJtGiIS/ARY3wxV8RW2Zhtf1uvFEnLaGAsCr9lREMt/tRVZT8scKYsZMBIhA
	 ER4pqi1xBwYojq/XzIriSwyKQO6PSKN/+EBaIMvQJVB4i5g8dZu8zddD/ZqLtRf/XI
	 q3gEoeYdqVmNURUAXUX38sKnhPqLxpZrv9WDBgVY=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 24 Apr 2025 10:05:34 +0300
Subject: [PATCH v2 2/4] media: rcar-vin: Remove unnecessary checks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rcar-fix-raw-v2-2-f6afca378124@ideasonboard.com>
References: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
In-Reply-To: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=qYMYY+/CA6mjieYZOTxpEgY4O+FfFxTZ+5yHgBlYdik=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoCeLxq+CJ+RS089HeuBDqpegcfd8hXMczKt/eD
 5Dxii9oTAeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAni8QAKCRD6PaqMvJYe
 9SK0EACaHJQ6jyKxBKppL19IiB6fPzWGD5UQyz4nb87TU6BIdJXafC0O+hRzsI1Z58c+MstOzCj
 9oAII7RVCi3TMY7GwMrsGO3FxHypkzq0HViRhTkd0CyA1GhyzGwoYZ5wHz0q2ogTRjOIwEgEdQ0
 wHWyr8w6H1f5lEkA3TE3owtZW35z4aAvEAIy2A9ZEmLu8pLqmb1gU4ZI1uNm5qnMIRUQXaqQRol
 LJXYLJ8rCCGQhnYUWmV/DIm3tEb8fE9VkhVB/DROWfzKi3cvdENpVzypq5u+UNErF4tphEkvgS2
 xy9QFPq3khr6NwI6Uf0KD1E5kBFvBk4VhOOTrj/BrdguTov+1cu/WLjSO8uFpqm+5jP5EpRWfO3
 131iQnIn855t4CGuVGXCIydi/bVLRBaZQwUte+idc2yli5vYpUirHNX+zmKU+iAmOuTAcW1gesl
 Mf/xTZd0IUjV4nz6yza7z41+g8SPvgyaJjsJJZS0McjcSPwCEA9wMfyqRGnSSIsWksPzFKZ7UCD
 1PG0oCIwNu81f7wR2IrAn6s7qbgNWGt+lBCCuwGkZcGt5ZBiKiMyy/8Jzw0R18Xs0rpfMHw+HdZ
 1zBrIGDWBB7/9P/ajZHf/ZRyK3nkgIZ42rLuB12q3hZgu5ZCkOKyiNtG4JS1JmBh2OILIFKbP9Y
 KWURx8I8933pQnw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Remove unnecessary checks wrt. formats and interfaces in rvin_setup().
The validity of the formats has already been checked earlier.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 23 ----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 972ae2cb3314..0b5077e2e989 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -802,29 +802,6 @@ static int rvin_setup(struct rvin_dev *vin)
 		break;
 	}
 
-	/* Make sure input interface and input format is valid. */
-	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4) {
-		switch (vnmc & VNMC_INF_MASK) {
-		case VNMC_INF_YUV8_BT656:
-		case VNMC_INF_YUV10_BT656:
-		case VNMC_INF_YUV16:
-		case VNMC_INF_RGB666:
-			if (vin->is_csi) {
-				vin_err(vin, "Invalid setting in MIPI CSI2\n");
-				return -EINVAL;
-			}
-			break;
-		case VNMC_INF_RAW8:
-			if (!vin->is_csi) {
-				vin_err(vin, "Invalid setting in Digital Pins\n");
-				return -EINVAL;
-			}
-			break;
-		default:
-			break;
-		}
-	}
-
 	/* Enable VSYNC Field Toggle mode after one VSYNC input */
 	if (vin->info->model == RCAR_GEN3 || vin->info->model == RCAR_GEN4)
 		dmr2 = VNDMR2_FTEV;

-- 
2.43.0


