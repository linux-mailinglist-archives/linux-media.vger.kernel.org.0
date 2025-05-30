Return-Path: <linux-media+bounces-33679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF53AC90BA
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88BC9A25CE9
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BEA234964;
	Fri, 30 May 2025 13:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CdcjJftx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933B023370F;
	Fri, 30 May 2025 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613113; cv=none; b=URZVN7o/+wLp4E0yrPhNyHwC3cHB3lb/pHVjUbD0Tq4JzN7QdmwLkEI/towNhqafDHW+dC4sjAhBM7UhUIyPQe4eCPzKZSkj4HRmfpZYSE5AQtmi8OqW6k8H/zcm9eKgqcs5dtrLuEJFFpzflde5EqOcbgYZUUMPCa0klZkvFvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613113; c=relaxed/simple;
	bh=1yNv+grbVzrmbxkX3x9jX6k84if16DwukMHTWu1HlLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQh3S7pS/2AjKbYiMBt4gSRozY1PP3yaQpL58vcVCwxGg/9P9BvVVY4htFKmJl5jxdX4V379c6RT+e9mLnTAKww8lSnGJ0h8DeAydN7Z4tZ+UfOBA2GPrQLDFLs/YBqs16ujNspZ2qWfChAzip0AP/sRXrcUkTn90JPuL6ML+MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CdcjJftx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF79BAD0;
	Fri, 30 May 2025 15:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613070;
	bh=1yNv+grbVzrmbxkX3x9jX6k84if16DwukMHTWu1HlLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CdcjJftxHEO8sdiD1imO7rYSaheRqKz8UJHaA+jn/U87z4Y/vzz67fNkq1NEPUlx1
	 zuz3n8pFv1roADFFGdZfncuRz+dziaSkXWIEVHAJh/GOR8U+A2wHNOm4gpeBvmIXxk
	 cMFb/TrlQ9SfWmeqt7CQ3D3XujWhzPvfof2O198g=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:41 +0300
Subject: [PATCH v3 12/15] media: rcar-csi2: Add more stream support to
 rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-12-026655df7138@ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
In-Reply-To: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=1yNv+grbVzrmbxkX3x9jX6k84if16DwukMHTWu1HlLs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfeuXHccfbsjuIWRROfcMiehFMC2cM/AVvzn
 MlFLThscYaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33gAKCRD6PaqMvJYe
 9dJwD/4+hOsFBCA5PaxKiO2K/4GhS94QHGihlmEzGtdVy7AqtByXd4jMEcgBAZKGJFrwD0cKWXG
 Dw4aRNcX6zgLUyJa23zsMTN2qhzYTwM+fH7THanCvuq0uo2HbMX2lvT9fO6jJtQuaEuOBEZ8Kic
 3UtxgPHu+mtAfKI4aSZBxN1hDKIAQ3WDDzdmVkLIpyAtync5jmfM7NqHMXYGlHn8zvrfDlQvHqk
 jKMIg8Ox6HDWpKaEQhmqoWozGSir0Z1JG4Kwhcmg/yR9+G0JizYmUmLPUGzNpNHE9+VWwSNtZn4
 UZFDX4MAwgI/HrNnm10hTKhfIKl9Iuyw9IFUHH9bP90JebJNJoC2+16YCfMHF0Bn4vBcpQ7IJO2
 iMf+dcJw7Qi1S1XAYBQcVkfxeFI4Ka1nSe7mhiaQ8rIeIjzkpvYhHYvrnU0Xfz75PNwZQz7jRX/
 dIxr6cC+U8+OqV3QEUDObz3zHjRByGkYUss2Y1iLpO4JJO4SYVFYN8boVP91/WHrK2VOzpiWO9R
 rxTCQJtyLGDbCVVyODezaGLquzqJEEPV1YSzunLR6ym1nlIiEMtQ4YnZlguHQ/+d8eIaGaUe0LO
 i0utipfSf++Fzj8bxLOU05A+UI2zwYi1yILSWU77qYS96aRYSZtJKuvgXUx4L3xETn/FTUmtfOy
 /0c/6B0pOUzWeAw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

In the case where link-freq is not available, make sure we fail if there
are more than one stream configured, and also use the correct stream
number for that single stream.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 65c7f3040696..b9f83aae725a 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1018,17 +1018,22 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 	 */
 	freq = v4l2_get_link_freq(remote_pad, 0, 0);
 	if (freq < 0) {
+		struct v4l2_subdev_route *route = &state->routing.routes[0];
 		const struct rcar_csi2_format *format;
 		struct v4l2_mbus_framefmt *fmt;
 		unsigned int lanes;
 		unsigned int bpp;
 		int ret;
 
+		if (state->routing.num_routes > 1)
+			return -EINVAL;
+
 		ret = rcsi2_get_active_lanes(priv, &lanes);
 		if (ret)
 			return ret;
 
-		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK, 0);
+		fmt = v4l2_subdev_state_get_format(state, route->sink_pad,
+						   route->sink_stream);
 		if (!fmt)
 			return -EINVAL;
 

-- 
2.43.0


