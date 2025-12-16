Return-Path: <linux-media+bounces-48909-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D893FCC3EE8
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0ACE8300BAFC
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF7735A942;
	Tue, 16 Dec 2025 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TBjQBq+4"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE083557FE;
	Tue, 16 Dec 2025 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898376; cv=none; b=DYelev38fiZ7ChAa5OQks0aTDzIVHk87CH7JDKjhgBiHfxkD2Tp49RUMCNkF7Pc5/2raJjRVJ/FgBXDvb909sgzL6TaOSBF6No87FcUrgmUG4eGu75XsNRqyk7P41SzZNlb7KReLZj8HRn72g2EkvjbGQjq4O6oU01aPUs6YRik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898376; c=relaxed/simple;
	bh=embxSZM+qI3VcYvBtFLYUs5JuQl17I6GNG7H3/7KSKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTpb+y328F0cyg61Eby8PCUf6XbjytAxgal9YrnBIeFUaS4WSNHlVRc6AwQcS7jScMN7Zn6BOlzM1fsfuocxOLOIExum7mZtE4MyxN9OfXzI9gk1TJjrU7ENr0ONKoraVImqQHXTkiF2Zkdg/Qc5JNEIE7Z5QV/6eVi1fnZrGcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TBjQBq+4; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F40F1039;
	Tue, 16 Dec 2025 16:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1765898351;
	bh=embxSZM+qI3VcYvBtFLYUs5JuQl17I6GNG7H3/7KSKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TBjQBq+4or6n/nSO+jEVj7LwZ9ksYdZgSJ2KN6f9tHO+ItDgpYPcjuHArsv1/Lovc
	 DCdh5NfJ7aSLg9WUc+L3dq92u5K7rzd9y/KlL8dvW2NsO6M8My7SogHzTw1jI2xKi8
	 3Q58UttrH1sA8RozF6Jt5HpRQbjjfpwmkFOTRxLY=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Tue, 16 Dec 2025 17:18:32 +0200
Subject: [PATCH v4 15/15] media: rcar-isp: Add full streams support
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-rcar-streams-v4-15-f28b4831cc67@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3025;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=embxSZM+qI3VcYvBtFLYUs5JuQl17I6GNG7H3/7KSKk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQXhoFnYlyJ+7FEPa75Ugjmyncb5cxJh5ELs0+
 MEZyVbUzruJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUF4aAAKCRD6PaqMvJYe
 9cFPD/9wUvpNXft/YhboOyMy4dYdGX9ZLDab+34wpK+O5Ym0V1vywbTd+0hqIj+VLFI1gwukb3l
 /1T1O7QN92UstdTBduQmDyomxZgveYD8bsue7nYtxIfqhirGOk8KMqDCe8v2VU6Ets7GNQdhGiJ
 PSCMfOvnszQtCE/fkv0HrAJmfgwI+ofm6AbyEFyx5mJ9D+3s15r7ASkmzXfTesd2A4djkD2UwJF
 i876y7VwBtmx6Gvp0xty4/G6BROp47B18YiZwSaiEEjc5URX2xCEWUw7ZCSR0Sa3qnKc2WaNMhJ
 lSFX633FnuQ0k6lctGmSxHH8XMN1Orp8Knwgohx8g7Wl958WLaqwQZhSLHgGeDMXFBuM2VuGiC0
 dvSuwDk61DMFE3QZHJWdz6PVIIph692C+6p2P0cqJu/NR66dpoT8zl00M8LWyVRCozJAQMABS7L
 zZFqZD+WFJvOmZqZz7TicJTBva8xE9FXBfG5quZUhpPN3xLy9HblclycqlUk3kVT69UWAPZNOIa
 fViUayiJ57ne9qta2aboqFQm3uej153tis0zTYh/XrWcaPCc9hbtUiEQiTtV2iGz7GKZHEF+W1g
 RBJaPJYy1mvMMfdoNR7GnjbCDNZPx2Z7D54BtMWFqurZ3QHyoWQTQQ2LvO1xxTrFQB7tTY14Ydj
 Oq0gnttRacVv0xA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add the missing pieces to enable full streams support:

- Add set_routing
- Drop the explicit uses of a single stream, and instead use the streams
  mask.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 39 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 18d63731b6c0..e4b9a6204815 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -340,6 +340,7 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			       u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 	int ret;
 
 	if (source_streams_mask != 1)
@@ -354,8 +355,13 @@ static int risp_enable_streams(struct v4l2_subdev *sd,
 			return ret;
 	}
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
 	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
-					 BIT_ULL(0));
+					 sink_streams);
 	if (ret) {
 		if (isp->stream_count == 0)
 			risp_stop(isp);
@@ -372,6 +378,7 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 				u64 source_streams_mask)
 {
 	struct rcar_isp *isp = sd_to_isp(sd);
+	u64 sink_streams;
 	int ret;
 
 	if (source_streams_mask != 1)
@@ -380,8 +387,12 @@ static int risp_disable_streams(struct v4l2_subdev *sd,
 	if (!isp->remote)
 		return -ENODEV;
 
-	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad,
-					  BIT_ULL(0));
+	sink_streams = v4l2_subdev_state_xlate_streams(state,
+						       source_pad,
+						       RCAR_ISP_SINK,
+						       &source_streams_mask);
+
+	ret = v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, sink_streams);
 	if (ret)
 		return ret;
 
@@ -423,12 +434,34 @@ static int risp_set_pad_format(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int risp_set_routing(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    enum v4l2_subdev_format_whence which,
+			    struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
+					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &risp_default_fmt);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops risp_pad_ops = {
 	.enable_streams = risp_enable_streams,
 	.disable_streams = risp_disable_streams,
 	.set_fmt = risp_set_pad_format,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.link_validate = v4l2_subdev_link_validate_default,
+	.set_routing = risp_set_routing,
 };
 
 static const struct v4l2_subdev_ops rcar_isp_subdev_ops = {

-- 
2.43.0


