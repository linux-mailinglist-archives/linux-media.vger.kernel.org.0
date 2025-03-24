Return-Path: <linux-media+bounces-28626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE25A6D953
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7292016B6B8
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 11:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD3925E83D;
	Mon, 24 Mar 2025 11:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T3WApZ0/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B77025E808;
	Mon, 24 Mar 2025 11:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742816966; cv=none; b=diiLJ59lx6BUY86YbPjguh6sk+R2ajw8Tnj6CteJudYHk5sq1aaOy9a3t3xxPhqYvn8unSP5Jn8pMFqtSu5Xj00kp6bwiUGauDKSedEQG19rRSbLdzJhcGiNsRq0c1gV+elHtMjl01je1DkkHP2tzx7QtvBCu7+PqVDCCh4xDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742816966; c=relaxed/simple;
	bh=RrSA67qwssqhfifxPYWRTyJwoPe3eh1BW4LfV0QWXHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jvQuqOcvKpDrJZ1irZcw1JgY2QObeDWrhkWMtzCyanfBAKT0dD/5OL40IbUv5corSQReM6EyJg/oq3XJsemUxtu+lyf2uGW8qxU/xJS6b7EmAUiFsl9t1ljLsmwGh+jv+cB97rr45Fg74SRXx55DcyuPhRwVmvpnn8dXkdqRWN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T3WApZ0/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E4BD1059;
	Mon, 24 Mar 2025 12:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742816854;
	bh=RrSA67qwssqhfifxPYWRTyJwoPe3eh1BW4LfV0QWXHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T3WApZ0/gfyv7JM7+MHwGK6AJFPmFV522j+T7hwapW+fxVKlrd+qB/hDGKJeu5MPy
	 YD71f6R6GsnvPjSqvpIr5MLWJaifQW0Wqyf06v43z+tCIa8cD7hqObxCNKSCzkcXm6
	 77whqCfjh/GEsxnKslbaIc5iQ8CAN4Kz4OY8ziyQ=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 13:48:53 +0200
Subject: [PATCH 2/3] media: rcar-vin: Fix RAW8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-rcar-fix-raw-v1-2-ae56c1c7a2f6@ideasonboard.com>
References: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
In-Reply-To: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1189;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=RrSA67qwssqhfifxPYWRTyJwoPe3eh1BW4LfV0QWXHs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4Ua+po76ao1/MbJy17NIE3XWkhEqpiKs2kEZ/
 i89Bsh5sgiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+FGvgAKCRD6PaqMvJYe
 9SvFEACmyI/fjlnjn0PO9T/JrKtx7gYe5fQnxOirywlNza1WoGjedoQkh3dj/30oOjgRilFXa+u
 jQVzuGYFvaAc2nTje3HdFeaHeTeXze8cxxqzYfLBis6/oc1Z8xi6Ovk74vg3C9aVoPQ2+UkLWmP
 ZzIKLW0p22U/RWmMKs+rywzvdf/yPxLSCDXPjVJrZxHqLMZK3jewj5/fYOZQfm0GJVE+zJpkYNA
 yZddB+3i6oAybbH466IiUCgnDPW9dEOl64wqfy4s1LrCxdYiYd9RmdhUdpUUm25V6ig3S8a1EPu
 sT25xGBuPfLE7HSBgll6FONqtRNEiw8Rfo+m8qOYjbs5fH1q1lzo1LlgZYFmGL0+dAA/euAEC5X
 VKXkOhPMXLl1hjbgEZ6jcleoAL+jnv3dirp/q41ZWk7TZGxLKeCaSMp+clr+5NLxFPct1qAGDfy
 /HjuaZcGUTQvY40irbT+lDwrBaJCV50fW7RXgFTIHuWPJrobhL6hDv/xB0wJy1L/DY7vlESXSbM
 eMMXnKzGNPTNRDGCkobqGLw53lwSa9LziZSHZ8eDNr1LLqBSknlIvDjxbjDyd801I7C73WrSsjZ
 DJZniZLYkqF1e/sBmTnLa0jlmOUK09cUIbij/ockEOr1M+GNG64qs8+JFtr4QUh8TTNRBG3i/gX
 RKIbgsA0xQXXHcw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

On Gen4 we need to set VNMC's EXINF to a different value (1) than in
Gen3 (0). Add a define for this, and set the bit for Gen4.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 972ae2cb3314..53046614f7a1 100644
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


