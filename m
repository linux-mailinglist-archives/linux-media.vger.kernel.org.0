Return-Path: <linux-media+bounces-28607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E4CA6D5B0
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8752216A3C6
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6046A25D542;
	Mon, 24 Mar 2025 08:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Dwy3OQLl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2CC25D215;
	Mon, 24 Mar 2025 08:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803255; cv=none; b=TXU1bJaHuyy7vXSPcdGxvC4EBNbLtsOEAGY/Khz4Q/pbSSQPwus2dmt6h6xM+eX4eukTHnVN65ydDsiByaiQaMMJhg18QT29fLTGTt5T/f8k9GT1Hz9kUWnKjgzT4tM1oMx3SdvBlewMe/0UR8xtZsABxjPD8mOI8uKSgURK0KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803255; c=relaxed/simple;
	bh=JbU2I9+F2hIlDKUzpAmb/hFxmNDhbr1vBxG3CX9EwkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mcgw5oIr9iAfujkEFK7t9cNdcPUqJQX7tN36xQlFMBRUJvk62ucImPgO/lxjZ8Hf9za5nnKROKj8MD7cmO3oUr+Q8mGSO4dtgksmmdYERMZjpjRH4uuwhYfInfoHAEpDYGOkZC5E4B0Grr36ERCfuQ9DgT1Nlg20ab4D6fOTBRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Dwy3OQLl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E36B10DD;
	Mon, 24 Mar 2025 08:58:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742803137;
	bh=JbU2I9+F2hIlDKUzpAmb/hFxmNDhbr1vBxG3CX9EwkQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dwy3OQLlMfyFh3bOeerphYvlVjLjKhZ3iCq/PcflslOCYTuWed15h4Td160iVg+jX
	 C5A84JP+hugaSK3cyCQP7mtjAbUYSQxOCgZEup1g2qI+ZiakoE/6W/W2ooZLMNxDUG
	 WFzwjySWHo6fUAQBV6cdb2BOFndkMkUq4vZdbbpM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 24 Mar 2025 10:00:13 +0200
Subject: [PATCH v3 3/3] media: i2c: ds90ub913: Use
 v4l2_get_frame_desc_passthrough
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-frame-desc-passthrough-v3-3-993839a1f9b3@ideasonboard.com>
References: <20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com>
In-Reply-To: <20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=JbU2I9+F2hIlDKUzpAmb/hFxmNDhbr1vBxG3CX9EwkQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4REp1TYbyiosfkipAcMUhAwQae1DAuiVMEj66
 edRnblzPV+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+ERKQAKCRD6PaqMvJYe
 9cXPEACxSLh/Dy3+V4LUykTsmYFjrMvSj48fpNaektnnEHvf0X4ws4sPluCa2GjHFWodrgSlXFY
 mZIMN1zMQ4uLNtUssygGPFgCUPB1sPGZoZdKf8g2/qwAhMA1Ba4RjMwBfZOL2VbkieKy3P7U5Pa
 bYmGP7awjqTfKhcgZIXeZB8s44v6SM3f6H1+SAbEsKuu+Tuu/sqviRkjQOkT4Y2ejovTO3MxObM
 B7hrfBJStYL0mucwb/AdulGoxlwIuZpGRaT70Zx1ImvfJJfF9T5zFhDdEpLNdTkdFk4yGs12egR
 DV0JZI0zzlj2eRuQOgpzIwo6GGCxebtS38p15OCJB9InZcvQEwjZGdE9yVtjWSx/BsL4IkcuP4G
 wp9fmiSLSpw3q2JoJsB7wxn88Q+guJS499Zz1LZm+WuktJsrGSVc3zbymgVsHZeYZ5LUxJ9TEzY
 nkpHwUaujqWbPasFZxFQValsvKcYReJ+JiR8GKuIubwiAaIM4YR+N5ikJtw0KGuAkiTxoA8Jy2g
 3p2+foM1cYa9MhDGGZdYzLfAlEFU2Oto/b1qARM6KL661ffZgyHYeTdIisnInnAEnPK9PPmM08H
 pKs5/zaQyC/kavEvV91e7P3brQ/mDcUk91PpZ9HwkidsVLWK8p9BWA/T8JSXU/iitRXMf+7d/pt
 jpB7rX1UtKyoZuw==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Use the new v4l2_get_frame_desc_passthrough helper for .get_frame_desc.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 59 +------------------------------------------
 1 file changed, 1 insertion(+), 58 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index fd2d2d5272bf..f3b9d2a84bad 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -358,63 +358,6 @@ static int ub913_set_routing(struct v4l2_subdev *sd,
 	return _ub913_set_routing(sd, state, routing);
 }
 
-static int ub913_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-				struct v4l2_mbus_frame_desc *fd)
-{
-	struct ub913_data *priv = sd_to_ub913(sd);
-	const struct v4l2_subdev_krouting *routing;
-	struct v4l2_mbus_frame_desc source_fd;
-	struct v4l2_subdev_route *route;
-	struct v4l2_subdev_state *state;
-	int ret;
-
-	if (pad != UB913_PAD_SOURCE)
-		return -EINVAL;
-
-	ret = v4l2_subdev_call(priv->source_sd, pad, get_frame_desc,
-			       priv->source_sd_pad, &source_fd);
-	if (ret)
-		return ret;
-
-	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	routing = &state->routing;
-
-	for_each_active_route(routing, route) {
-		unsigned int i;
-
-		if (route->source_pad != pad)
-			continue;
-
-		for (i = 0; i < source_fd.num_entries; i++) {
-			if (source_fd.entry[i].stream == route->sink_stream)
-				break;
-		}
-
-		if (i == source_fd.num_entries) {
-			dev_err(&priv->client->dev,
-				"Failed to find stream from source frame desc\n");
-			ret = -EPIPE;
-			goto out_unlock;
-		}
-
-		fd->entry[fd->num_entries].stream = route->source_stream;
-		fd->entry[fd->num_entries].flags = source_fd.entry[i].flags;
-		fd->entry[fd->num_entries].length = source_fd.entry[i].length;
-		fd->entry[fd->num_entries].pixelcode =
-			source_fd.entry[i].pixelcode;
-
-		fd->num_entries++;
-	}
-
-out_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
-
 static int ub913_set_fmt(struct v4l2_subdev *sd,
 			 struct v4l2_subdev_state *state,
 			 struct v4l2_subdev_format *format)
@@ -514,7 +457,7 @@ static const struct v4l2_subdev_pad_ops ub913_pad_ops = {
 	.enable_streams = ub913_enable_streams,
 	.disable_streams = ub913_disable_streams,
 	.set_routing = ub913_set_routing,
-	.get_frame_desc = ub913_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = ub913_set_fmt,
 };

-- 
2.43.0


