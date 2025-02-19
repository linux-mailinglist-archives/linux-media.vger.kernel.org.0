Return-Path: <linux-media+bounces-26373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5AAA3C0A6
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B651D3B8AFA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3C971F2BA9;
	Wed, 19 Feb 2025 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SkEdFHZR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26101EFF85;
	Wed, 19 Feb 2025 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972990; cv=none; b=tH1qXLGWvz91uw7XrekOQpLwQlsKfrWVUJnppJ4NVBH44Ep9qWp4vmPTMUyYSFTqefsHpkjXf81xaWNWq5XWneYQLxtoRYOzBfM6Qj0LdFcc9TReYh/v3Z+QaMMckalwztIBvF0158PYHZpuw6Z7a2oyCUdojW+NSc+IbKk+/ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972990; c=relaxed/simple;
	bh=L3pJ41SXmj2+v2IVbke+e+gWd0rD1XayieQMn4VEF2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImOiCmkrSbmRAKNv/beaZzgW4vSAiXXnKp5CJ6+8zpfZbt6Ba4FiP3WwYjOMzQ67E9HTnY5lmJfwh+vrshKplHmEQoXLC5fAzSFeRwqqzT4IEwmREIvPyng2St5jMhOQ9NAmAsaxmdfTUsvklrUTVev4HCMQn1FHyi9AV62SlZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SkEdFHZR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C11DD6D5;
	Wed, 19 Feb 2025 14:48:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972902;
	bh=L3pJ41SXmj2+v2IVbke+e+gWd0rD1XayieQMn4VEF2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SkEdFHZRaQ/NzyvUlq9oio2MhKJR6YWzVRTNLs5UFp8t6TsKOi0h/wgP8ewcD8gKO
	 Ilcgp1KXm3d6K4KO+khOLS6vFaD8S/FurkM4bmRBR2F2Niz2Cj6AVs15iM/kKa7UYk
	 FkQT8TAXKMOsA/f+XQfJdxgStdFg3mi+0sEg3LXg=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:48:56 +0200
Subject: [PATCH 02/18] media: rcar-vin: Fix RAW8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-2-f1b93e370aab@ideasonboard.com>
References: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
In-Reply-To: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=L3pJ41SXmj2+v2IVbke+e+gWd0rD1XayieQMn4VEF2E=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFwr9bEQwqTPX5Xvs/2jnCBRmD0wAHpJhPOl
 SdYfV6Ism6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhcAAKCRD6PaqMvJYe
 9SLoEACpI7LVGZObwy1xXy/vd0WtiXTefic3dhb4UTxkvCdyzonXsQMPKbQlo3LZAP5e2G8PinF
 8Wmh8woGWBXqngbPRYLE3UegzZhsWvqzwxC5iB2dSMonZ2lMq9XcMDviDDQk+GpUr+345NXLkIz
 xZkPwUXRhqb5IyKa2doFtGZHHggIQ75Hl9DifMqxPNWW4z0pI3uw9MhA2izYJHMWWktSR8F2V56
 tHGghtBWY+WNJ4r6q5C0C+H0auMR0iJzsMc5eTloY/RJPDKiDY7jum8bvAbiwDs3LnbuqU74TYZ
 C1RH/DJKcS9VtWFG4GBHodRCLdON0Pq7O8WkC1HGK4OkaBdfMjmCVWh4ZUhD8Lpui/BWo2KdnPD
 34+mRjndJi39aU0Do2WLwKEUoYdTfCKQrtXX0KgjPJSNXHVQSnZME8T9apo14f+PGSG8YQ3pydo
 L9eOhYAKhaiECWtNACffnR2rqzLuVvDDSkqr+doLMU2vVA2CybwnzJeCLFHWbP/IR6Tn5XOsN+G
 beQj6o/1r11Bg9PmPYBpbcd+49/yvRxtuQb3zVbyn7F0r0fTiGmSYnL8GppqFnj1avFNRrHa5GH
 euV1NnVaqk9517Sht/+7rY246pqzh405D9QzCFTFgMdqyyvI3m3wYwKyDxbkOQWCDW0Rd2OB0L9
 ORjJSuoFY6dvJbA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

On Gen4 we need to set VNMC's EXINF to a different value (1) than in
Gen3 (0). Add a define for this, and set the bit for Gen4.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index f0a77199cead..bbdff7aed9e2 100644
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
@@ -809,6 +810,8 @@ static int rvin_setup(struct rvin_dev *vin)
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


