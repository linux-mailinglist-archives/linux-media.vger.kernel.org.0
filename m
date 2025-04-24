Return-Path: <linux-media+bounces-30900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04031A9A2E6
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A56F445123
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1805C1F4188;
	Thu, 24 Apr 2025 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lGSjY4hT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA7E1F3B8C;
	Thu, 24 Apr 2025 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478397; cv=none; b=fK+WZEcIu896MAB2E0y2R5e60DNVFki7UoKibdF5U3omdbTmGyJEOlBRFCyZj9IgTKYVTGM0zRe3c4XGruo8ZYaZ1LtRVC9Y8Ayk73oPF3DObbv2iUX/N6m1CeY1GdHZ0msCtzMN9q9yDDmQCQdQTK3VhNvRFLuMlSjLF0+pQSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478397; c=relaxed/simple;
	bh=oj+fFJoHfQcRJ3PXsFuMdFCpas7geU0lbK+c1i7FPNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLkED9u+xJge5F+7+jL911tRE98Cx1GWBp18A9sVbcLla7CD1dXMkJ3zM9V18EccwlleDSLNaaX5859nvW+Umf0vrjOaBiqcqbV1EjV0FxbU0aLZnuzkCZFwWVn1Tr9y8MV8HZJ0hsy6MKwDvBINL45TU8jWCrOdx3o+QpRODuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lGSjY4hT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18BCA1440;
	Thu, 24 Apr 2025 09:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745478387;
	bh=oj+fFJoHfQcRJ3PXsFuMdFCpas7geU0lbK+c1i7FPNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lGSjY4hTPyPAQZinZULVeZI0ap1FhTN90GhwCz5l8e9swfCpdkKsO0wyl6IHUYUnY
	 8r8ImMXp6SAYOZL33584gjnkliVaoORwOf306oi/b73Qj4nuMRqs97IR4PeBhjrDGQ
	 ro11WeFsHnLdtSh03pd5EFHMwxPay9fDNZCnkmgQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Thu, 24 Apr 2025 10:05:35 +0300
Subject: [PATCH v2 3/4] media: rcar-vin: Fix RAW8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-rcar-fix-raw-v2-3-f6afca378124@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=oj+fFJoHfQcRJ3PXsFuMdFCpas7geU0lbK+c1i7FPNY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoCeLxLtIl18/sWDlYUgTt9ceDY75tV9cr1LA+b
 EtMqWN62BeJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAni8QAKCRD6PaqMvJYe
 9byGD/4j/YyQSfZsHYK4jyYazTJ8ufD8rMn/ZEq4U8YUWZmWaqjA+O/NoTVvbR2cPTGc91134zM
 wTjffBIsMnn58xnvOxRVcecxNKhtPzdCLuC7fMGCEcorgXRtv2EGlCDcwYr3SL+COf4oPuBsZO0
 8eO3cs+JGS0s6FLqTttDgXkXkrv0ZNVcK2FqKN33ZfR/UgYljZ4SRyOeJNtHa/t3UUqoQnqGOtw
 bXXFbtPjgQIUAVW9auu1INMv4NLd8um4tQgUJUaQ7IIRSMdpcbQwBR46f6B1rQJqo4+ip4wz/IP
 33077gAfXLAuCljGnp/KjSjUBJj1JKID18bqAKsZkJo2QtlyK1t4Erjl/Cq0ZU03SF2eElYQ2mA
 WjjS6p1q7LsHous5/r/n76RU6S6w8ZOMojYiwj0IYZe+MV5jwyO6ab8J6vLii7x6Wz7Y5iKDHjB
 tEY+EkxNAXt0Qs+E+3E67WveoChGbCAEQ/mIWb1JsWBTUyGpKoItbuVykD/n7HZXQ9M6kz/s0nh
 uVtp/In3sIY4xPgR6n6X4s8p4JofBAmyKc8mNTmxve93uNIc7YaceWTsqJKsw/NZrqTOJ/ffey8
 NcDlqGxgL76bf+GHu2p/cLp+24uqAwUYVkpeUXG4JcbcP+z0Pwo+CT8a3W2Vk2XDGkH6h0kWWBm
 vMjqn4lV0DtdzBQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

On Gen4 we need to set VNMC's EXINF to a different value (1) than in
Gen3 (0). Add a define for this, and set the bit for Gen4.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 0b5077e2e989..a38c7b835231 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -94,6 +94,7 @@
 #define VNMC_INF_YUV16		(5 << 16)
 #define VNMC_INF_RGB888		(6 << 16)
 #define VNMC_INF_RGB666		(7 << 16)
+#define VNMC_EXINF_RAW8		(1 << 12) /* Gen4 specific */
 #define VNMC_VUP		(1 << 10)
 #define VNMC_IM_ODD		(0 << 3)
 #define VNMC_IM_ODD_EVEN	(1 << 3)
@@ -791,6 +792,8 @@ static int rvin_setup(struct rvin_dev *vin)
 	case MEDIA_BUS_FMT_SRGGB8_1X8:
 	case MEDIA_BUS_FMT_Y8_1X8:
 		vnmc |= VNMC_INF_RAW8;
+		if (vin->info->model == RCAR_GEN4)
+			vnmc |= VNMC_EXINF_RAW8;
 		break;
 	case MEDIA_BUS_FMT_SBGGR10_1X10:
 	case MEDIA_BUS_FMT_SGBRG10_1X10:

-- 
2.43.0


