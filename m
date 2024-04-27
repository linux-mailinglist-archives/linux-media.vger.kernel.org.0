Return-Path: <linux-media+bounces-10275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1FC8B4854
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 23:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0204F1F2214E
	for <lists+linux-media@lfdr.de>; Sat, 27 Apr 2024 21:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34557145FE5;
	Sat, 27 Apr 2024 21:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="g3dcQoq5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF324E1BE;
	Sat, 27 Apr 2024 21:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714253125; cv=none; b=cF+0Zy70xBv9F3nGrVXqQo36iIvNiQZa3fgDUp6QCIBZV3ohpKEGGY+GlZmsYePIqvrF44dO/Z47IvSWh/n8S8CC4sYfkZephn17ohvaqLcMjOMs4AdvF+ks56UcLm8qBwHs/ZQ0/tg2Sd1D2tyUZyY76ueTRBSnfQYF89YZK8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714253125; c=relaxed/simple;
	bh=C0p/SNU52ri6L9cyTJa/QISkysU2jRs+/DU1GpsGbHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kqtb0Rxa0N/VHObTHEyyLuIRz2y91/igdQP8ckgLzdLfESU0xaCAGz/KkiBilqAFMclAxFpdRsvoO+Vco3NB7v9OXf3wpUZNk0lJ9ckGptHPf7ka1Iy1Pq3LWzvKkGD4JB6XInNwwa7SfC8Q7Tu6YwUygjZPWUf3dPU+j+gOhbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=g3dcQoq5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DB6F2B3;
	Sat, 27 Apr 2024 23:24:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1714253062;
	bh=C0p/SNU52ri6L9cyTJa/QISkysU2jRs+/DU1GpsGbHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3dcQoq5LTgD3E4o08n4Z+dNlnRQadYX8dsFwH3btkFS5OBKjbjtcWR/8n9HNXNuD
	 T+jjvEydQiv/kv2CMy54SggeKfb+s1jsEkYLX/svcQDWVbLOXbOsODLB6wzS+zL4kY
	 KqeF0X/Vkbu4aO+derUhbiWe2DY39AepRsMJeQHw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v11.1 6/5] media: bcm2835-unicam: Return error code when DT parsing fails
Date: Sun, 28 Apr 2024 00:25:09 +0300
Message-ID: <20240427212509.20750-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240426133432.13266-1-laurent.pinchart@ideasonboard.com>
References: <20240426133432.13266-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three of the error paths in unicam_async_nf_init() when DT parsing fails
are not setting the ret variable, resulting in the function returning 0
on error. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v11:

- Address a third error path
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index e91d02a64770..bd2bbb53070e 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -2519,6 +2519,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 		    num_data_lanes != 4) {
 			dev_err(unicam->dev, "%u data lanes not supported\n",
 				num_data_lanes);
+			ret = -EINVAL;
 			goto error;
 		}
 
@@ -2526,6 +2527,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 			dev_err(unicam->dev,
 				"Endpoint uses %u data lanes when %u are supported\n",
 				num_data_lanes, unicam->max_data_lanes);
+			ret = -EINVAL;
 			goto error;
 		}
 
@@ -2542,6 +2544,7 @@ static int unicam_async_nf_init(struct unicam_device *unicam)
 	default:
 		/* Unsupported bus type */
 		dev_err(unicam->dev, "Unsupported bus type %u\n", ep.bus_type);
+		ret = -EINVAL;
 		goto error;
 	}
 

base-commit: ddf6839f6b00b8c8f5f460452476a894417db4f2
-- 
Regards,

Laurent Pinchart


