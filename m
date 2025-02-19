Return-Path: <linux-media+bounces-26386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4019EA3C0BF
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8675A17475C
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782D41FDE05;
	Wed, 19 Feb 2025 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PY5rLgbN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD31FCCE4;
	Wed, 19 Feb 2025 13:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739973010; cv=none; b=ZFyrMaRDGeJshVXkJ2CaXlO2/IJN+sEALqP4kny76q4998heXK7PPXJPVzreOq35BI06CRQAqmL7KKBiESNtVH4vQPPrTGqLhtRcIxpmM/1IzYVwfp1Txav6otNIppKG54507AOAfGPeEJJVxEVP/HZ7jqC0gkpRNbw+mfA1d5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739973010; c=relaxed/simple;
	bh=+8ateqMN21I0Gq5bsJ9NzgLNYYCHIEXxrMxyrObnok0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DO0krKtzpKZKJQA6/7ow+W97Ls1khgqiczbNgEa3z5hIS0QHRkIRVOqXgiJUqJxyP8jYncwQ9LQ0tYDekRHVfp9G9B8KDfU2aOj1a+XZTeuxBhawnTgOkpleaklFoiCezv8xZNtZGKNS7BK/GyfqT8HLYpTpuqkJoYPqSsPtbX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PY5rLgbN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6605F6D5;
	Wed, 19 Feb 2025 14:48:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972912;
	bh=+8ateqMN21I0Gq5bsJ9NzgLNYYCHIEXxrMxyrObnok0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PY5rLgbNDxFxMVXCimTIHU/ZuNg5nfXXYumYteJbV1diImLw1T3Hl8uVNfnQx1ExG
	 uvDVp/Z0hoqEh5cF12I0iXZOYn8CkkS8VQoWAfr51YarNKq1gnFaFtpJfXn6IjkftM
	 BIL9Yl1CgZig0cdzLZF4CT+M9ysq1yheMT4yqHec=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 19 Feb 2025 15:49:09 +0200
Subject: [PATCH 15/18] media: rcar-csi2: Add more stream support to
 rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-rcar-streams-v1-15-f1b93e370aab@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1250;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=+8ateqMN21I0Gq5bsJ9NzgLNYYCHIEXxrMxyrObnok0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteF1w/NKsVWrQBeuuvKI4HZ8XybS4keZqp431
 K5f3QEwHeuJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhdQAKCRD6PaqMvJYe
 9eYqD/9qdo2rAw/ovsECkeQbf/O/QOAQzR9JBSMKFuuHvaDM+yKBuWRYpONFMBz6bbVFLYT8tw5
 j11ZvdrLd2+em1CvS3kuXszOX2bba4JgAziAp/m55uGTxV2Y/btkwLXSwOTePVmwLHvrlGQarkY
 UWzXWoTYfDURqWGP4jBWmx26mZtgx4BLLEUVGW3MKK0woP8tLE9r73MynACqBjK5/K5HVCx+FC9
 jkamN9MdU18R4TXjG9rX6ro4ywiHYdr4ufwNZjZqPYWma4e5uUhbBebg2HbHOHugh/bD91nGaGd
 2iiVSRjp08G2O4+3eDTSWReB3muLnZ+XyWF807HJPjH0RXYuyOioVH7x1i+U4Ag2dDzk1CbYc8q
 8k8rSSrsgM0G3StX+oNWJ0mHTt6HGISyJxN2igdTcTe7hmRFgaJXHDOqWK9vOrg637/XZdcgqU0
 WYXEIhw3Oz2xE26sE+CFU42lBVNxFpzmP5poUUkyUWonlODVD/s/LdQhXP1ryvN7csCOOkHE83L
 X4ySbw8Md7paQ7yNmYjU+OYJE0jeVU77qdcQdsI6LYhfEc4E4SgTerMciTnpcS2pUDtOtRb6f8g
 PDSbMUjnJo+2ZK+5Kik2OaR6Xuv7fws8oPUP+PhH6YFbu//PlFHLoQUcwf/kFyc1PziiRn7FLOK
 V+77UxD9RWn5I1w==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

In the case where V4L2_CID_LINK_FREQ is not available, make sure we fail
if there are more than one stream configured, and also use the correct
stream number for that single stream.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 17ded37d5ca7..3608437b72cd 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1016,15 +1016,20 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 		bpp = 0;
 		lanes = 0;
 	} else {
+		struct v4l2_subdev_route *route = &state->routing.routes[0];
 		const struct rcar_csi2_format *format;
 		struct v4l2_mbus_framefmt *fmt;
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


