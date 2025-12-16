Return-Path: <linux-media+bounces-48900-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4FCC4069
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39953300C8DF
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3AB3502B0;
	Tue, 16 Dec 2025 15:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jv5jzw00"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BC834E777;
	Tue, 16 Dec 2025 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898362; cv=none; b=B1G1t5PzNBjRs3lPq3/LuVXY/DdhARDsRhpI6smEoZGEh2fqi4FiQ2xpgdKREPavhpwb66HDgo5XWRMFUd4856sZ14hWD0pABNF62P/tJWFA55kBQNKsM+f7dsBlT15xLk4TuSn7kXVfPxCDSFImsy8e4lKHjlGnqKBW76KcFqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898362; c=relaxed/simple;
	bh=NXxg8dc++C6T2yPC5ibNd10O+Fdr2Je6EmEHn/xWzTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mz9nmYILzzMnIfkfMq8+O8eMX/MLekokHq8th/7PSwRc04X/X6rXStiHCz74iTxpSvSEGm2n/vofobV2ZSvXzHvASzGhD5JP8nwEnPpco7qKerLcvn0DsdVW3uJQg8lM9yFa7+m6O2t8iqA6vFbzYpETmngTVOZsbDJqKyOAJBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jv5jzw00; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23D961486;
	Tue, 16 Dec 2025 16:19:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898344;
	bh=NXxg8dc++C6T2yPC5ibNd10O+Fdr2Je6EmEHn/xWzTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jv5jzw00pLSwbb6p+E/SZxNy7MWyOTp7+TepUYIZkHnhfOZEsQ2nMJOLcIbsk/wPJ
	 8WQoi/NMp7JswLhCn3j4nqf7fK84OiROBFeT5+mFeCXVEAU85rrDMnf0qfbtg3xCEi
	 7bN25gsj9cqx5TKGGQT+hBoS1x474tSZ3QJjskGw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:23 +0200
Subject: [PATCH v4 06/15] media: rcar-vin: Link VINs on Gen3 to a single
 channel on each CSI-2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-6-f28b4831cc67@ideasonboard.com>
References: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
In-Reply-To: <20251216-rcar-streams-v4-0-f28b4831cc67@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=NXxg8dc++C6T2yPC5ibNd10O+Fdr2Je6EmEHn/xWzTM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhlhArPZcgtCHRFNvwLy4RmAhl0chl5IDvzT
 d5bdu6UzueJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4ZQAKCRD6PaqMvJYe
 9VxWD/9PmtPCcIfLsBh8KAo+Of8yiHy7VVMA7y0OqUw7JuJNq0SOXE7gS4UXDZHW21z8AyfPwCt
 upbDcCZmXFydPOC6B6KGlz8wwzEk696HLQ5DQwOMteY+PGFgHMjKrirMVLxlyXpqR/LhZ1/+nLq
 MGuqmsNwk1XNG/T0Sz+saAqSlqUEaQS62HIzVpyaFsUZHhGzVClk0IneDHYGHW+Tk5g0m1oqyhh
 /N/cBYg0kMa/EFrsxwtyELQFDLV0hZWRfH23CIt63FGj6iwF6FHzwphE2/Os9GnoiLP3tZlV792
 o1pOWYtL1lLs88TWupthCjb1wcvGesXPprZzvtfrecqn7CHgSYkQnjIyHL289PSDhVTzAtC6ty5
 q0PqCWu/XaUW07fvNkuE3cphgxajofS9UUoLEkJOJx8e6FTb+NlIBcj9v+QWkrZSEE/MuBwUw2Q
 0ZbNpnZzBeWnrOZF9btqaOquowGbf0cF1VOYPQfMNRqqmDAwTAseaikMfn5e9DoFNH/tMru/vJU
 khpdrEPuZOenW0QFBIW0yfsIA3ipLhlKPpLOOTEuRlzqZjiB2FH2i78VOvo0o6mccClK3CwIsf3
 3wioF3YosT1KaGRzHjkyTvTVcPZ4sS6PkJZPEVWxMwAsxdFCoeMlUJuUDRdB7ixokJRVPjTQlUW
 fORksQO9JaLcmPQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The stream routing will be fully configurable when we add full streams
support to the rcar pipeline. Thus there is no need for the user to be
able to link VINs to different CSI-2 channels. In fact, allowing e.g.
VIN0 to be connected to CSI-2 channel 3 would be wrong, as the hardware
doesn't allow that.

Change rvin_csi2_create_link() so that it creates media links only
between matching VINs and CSI-2 channels (VIN0 - channel 0, VIN1 -
channel 1, etc.).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../media/platform/renesas/rcar-vin/rcar-core.c    | 27 ++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 100105b620e3..acaf22d1f450 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -673,23 +673,26 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
 	struct media_entity *sink = &group->vin[id]->vdev.entity;
 	struct media_pad *sink_pad = &sink->pads[0];
+	struct media_pad *source_pad;
+	unsigned int source_idx;
 	unsigned int channel;
-	int ret;
 
-	for (channel = 0; channel < 4; channel++) {
-		unsigned int source_idx = rvin_group_csi_channel_to_pad(channel);
-		struct media_pad *source_pad = &source->pads[source_idx];
+	/*
+	 * The channels from CSI-2 blocks and the VIN groups have a set of
+	 * hardcoded routing options to choose from. We only support the routing
+	 * where all VINs in a group are connected to the same CSI-2 block,
+	 * and the Nth VIN in the group is connected to the Nth CSI-2 channel.
+	 */
 
-		/* Skip if link already exists. */
-		if (media_entity_find_link(source_pad, sink_pad))
-			continue;
+	channel = id % 4;
+	source_idx = rvin_group_csi_channel_to_pad(channel);
+	source_pad = &source->pads[source_idx];
 
-		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
-		if (ret)
-			return ret;
-	}
+	/* Skip if link already exists. */
+	if (media_entity_find_link(source_pad, sink_pad))
+		return 0;
 
-	return 0;
+	return media_create_pad_link(source, source_idx, sink, 0, 0);
 }
 
 static int rvin_parallel_setup_links(struct rvin_group *group)

-- 
2.43.0


