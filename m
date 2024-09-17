Return-Path: <linux-media+bounces-18335-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA297B119
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 16:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC6E9B23657
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2024 14:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6D7183CB2;
	Tue, 17 Sep 2024 14:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wH5CcbYU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC1A17BB3C;
	Tue, 17 Sep 2024 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582213; cv=none; b=FjEeQywEVGuGJnnZqserVFfThoq5RXiMnWV4XeUvBxiUgRvDJSKOhLbuLsqOtMJbYiaTVXtZtp7M19jKyl0M3UsE01lFEnCu5FI3M8l1u5Ibz5yCOUYEocZE2Ex4f6Yezlij7Qg3HomWd1bxCM64bjV3kr3dBD1YR9QbnA34wWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582213; c=relaxed/simple;
	bh=56c7Mc469V5jQOz9OsJXi7Ra1pifB6dbDmhheU41ITM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpFFpFPYLY6W2OHQt6BOLRh4QYKeH4NVL2uV6/R5wzEwGmgcmZqqgQ4BjvMnxqXzFGj6Wxeeh4qLCmzMaf2Lf9a2Zr5Im63bOB4yaTjlzqYbOMUCKuvTvT+28Cz0nNBmlBMWPIhIFFCfSFc1jcUMF6RHUKpPIli2SRjHJ6hYykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wH5CcbYU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-156-87-48.elisa-laajakaista.fi [91.156.87.48])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72B7582A;
	Tue, 17 Sep 2024 16:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1726582124;
	bh=56c7Mc469V5jQOz9OsJXi7Ra1pifB6dbDmhheU41ITM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=wH5CcbYUC8GoDHS7UIXyRPvxycUUNcN0X3py8gzdZMnFQVuCeXolKNqhlhtTa0SGi
	 Sy/R4avQA7SkhfR0hGOAadJ8zTn3XSkWq6KmiOc2fEHNFq1Gg08P6Dw68pftC/+2Wl
	 wJCiQASMwS1ge8LUCFYRgQlla6NaajrKuqJ5kZuQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Sep 2024 17:09:30 +0300
Subject: [PATCH 2/4] media: v4l2-subdev: Use state cleanup macros
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-scoped-state-v1-2-b8ba3fbe5952@ideasonboard.com>
References: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
In-Reply-To: <20240917-scoped-state-v1-0-b8ba3fbe5952@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2162;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=EbcgQL+tX2nYvMWczFyWQYM06jA72gwsCC48WpBYQKs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBm6Y27pkJc8Q46tX+GK8fM6O57muJhhE2Ryndck
 /pwyPuFJP2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZumNuwAKCRD6PaqMvJYe
 9c4rD/45X/i21ZbCtXfd1aOxfLlsvz4l7A+rYU51ao+MhkcUCRDzJKLEY6tdJoa8h9VLubI7fsA
 9atbJWbsYe2znvk049Ko8GPQL4R1pG3eRfg96ugFrBs4U0mvdskrURwTcbKtMFxSw+XjFXXslrO
 R4z8nkA0QPbWS5iuEZDzxB9ViNErImV4BUB67VL6ZPMjrOe5bu97yggMv8MmlZ0X/h65aIvUq1a
 bH10ntLyrzjx/71X1p+U/BD/gEF3/X9Y5QDUUv9QqwY9GRlE/+9Jqsn+8c0VgitTTeQGXDLVnPd
 O+jeuBKpgv2GhNJUmQL3BaD8mw9a62ylPCnr7qg08PEU7Gy7747XB319IjA20Sx84PrCYycYnQa
 uyV45oIO6zET2aAeXn76HAU0cAP3i2NkclpfTTQgw1swrxWRRpe7DkCIFNnZb8hGiE/xhzMilvp
 6WD4CuXsl7Rvydtdd5dxR1+bpMjWpdNY8kHyw4069SVJumFX9mHGu2c/b8XuwYccgWcoIQQH6fs
 gHyZXv4fKFz6p3Ab2OoYeGFb8F5jLrH9oD4epvAYer4/p7xDvUKb85v7ozS5aIEWO5364B4kWXE
 4KP6yLYyf/7ZbnTD4A37JpWJvVdm+Z56KWuFDNZGGF2J117G326p/vJXQZw5ZTSKfdsTqhORYMI
 2kCT4oX0A8T4fBw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Use the new subdev state cleanup macros.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7c5812d55315..1e701c340d0b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1478,10 +1478,9 @@ bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
 {
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 	struct v4l2_subdev_krouting *routing;
-	struct v4l2_subdev_state *state;
 	unsigned int i;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
+	CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd);
 
 	routing = &state->routing;
 
@@ -1492,14 +1491,10 @@ bool v4l2_subdev_has_pad_interdep(struct media_entity *entity,
 			continue;
 
 		if ((route->sink_pad == pad0 && route->source_pad == pad1) ||
-		    (route->source_pad == pad0 && route->sink_pad == pad1)) {
-			v4l2_subdev_unlock_state(state);
+		    (route->source_pad == pad0 && route->sink_pad == pad1))
 			return true;
-		}
 	}
 
-	v4l2_subdev_unlock_state(state);
-
 	return false;
 }
 EXPORT_SYMBOL_GPL(v4l2_subdev_has_pad_interdep);
@@ -2393,7 +2388,6 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_disable_streams);
 
 int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 {
-	struct v4l2_subdev_state *state;
 	struct v4l2_subdev_route *route;
 	struct media_pad *pad;
 	u64 source_mask = 0;
@@ -2419,12 +2413,10 @@ int v4l2_subdev_s_stream_helper(struct v4l2_subdev *sd, int enable)
 		 * As there's a single source pad, just collect all the source
 		 * streams.
 		 */
-		state = v4l2_subdev_lock_and_get_active_state(sd);
+		CLASS(v4l2_subdev_lock_and_get_active_state, state)(sd);
 
 		for_each_active_route(&state->routing, route)
 			source_mask |= BIT_ULL(route->source_stream);
-
-		v4l2_subdev_unlock_state(state);
 	} else {
 		/*
 		 * For non-streams subdevices, there's a single implicit stream

-- 
2.43.0


