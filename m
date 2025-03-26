Return-Path: <linux-media+bounces-28779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB79A7157C
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 12:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EE813A355F
	for <lists+linux-media@lfdr.de>; Wed, 26 Mar 2025 11:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 216841F4177;
	Wed, 26 Mar 2025 11:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FfSj0dxf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DACD1F3D52;
	Wed, 26 Mar 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987443; cv=none; b=WpTc2obJ6fxnbJ83BXFigUV5NzCuT+zzS8XQMyqVfThAF/ziv651ndlzy69Yr9LQemGImMDxc3xTtRScdcPP6JehqCbJuc1NIpU2YHbwa3SPHAR4EbxenH/3fAr42Xm0OxM6zeRm2duNoO+XQSl5iOMwZC/EL9rRMi/po1fXthE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987443; c=relaxed/simple;
	bh=1yNv+grbVzrmbxkX3x9jX6k84if16DwukMHTWu1HlLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kYHmLbndNEZjiqFK6Qe9E8c21MvY1nznoezLN65EUnPvOC5owg+e6f/LmJqYYWVEzwrnmFOusD6TxyssGwITkxoi0Zrd6yhbTjl9ktfsMAKFDuTdsFxUzY21Yq2tprTBA3Jo8ZZCsseaZoIIORMZBX2jMil+aTXuBOEGMxpt5wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FfSj0dxf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 473701AE0;
	Wed, 26 Mar 2025 12:08:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742987314;
	bh=1yNv+grbVzrmbxkX3x9jX6k84if16DwukMHTWu1HlLs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FfSj0dxfN+i7W+LjTQge1Esvdffoo0JQgukLBSbqQEpX76YLoZvFjLeq3KU8LEPT6
	 P9eWEVwcJKyzkPp1G0R7Nw2u2bmtEX50UM5KtDoUEJDOiMsQWoAx4sr9uMlJhAdx8l
	 YN654qDseVgI6Utow22og9VFouOyiHQcFwnPYF/Q=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Wed, 26 Mar 2025 13:09:34 +0200
Subject: [PATCH v2 12/15] media: rcar-csi2: Add more stream support to
 rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-rcar-streams-v2-12-d0d7002c641f@ideasonboard.com>
References: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
In-Reply-To: <20250326-rcar-streams-v2-0-d0d7002c641f@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4+CTpkr+AeePQIy3m87F0at2iziPWv6UwMpHv
 NIZMwd7YHWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+PgkwAKCRD6PaqMvJYe
 9TZ9D/470bP+2SBUdU/iehrjicTKU2FuAklgtR/7aHaXVk1cnQJFoGcWPQ587cG/b8Y2G/i2ZPt
 FALgPtQWovPXIneNXHQwblOyGZFKIo/Q0QHq9hKJt+ASjPN4GSfSSWtw0WjgT2ImjqHx1vybNG2
 qu8bKJMYd9bPEBXS0NrJlpZW3SMRYFm5tGBAPcZOYxQBGm5mO8rpIpC7cNzIcnHfVyWWQ31zoFm
 KPts3z0fs+/5xGteRSx0gvHcpuIUS6qPtNYF6McGmuvFjowwWnI5ks76xClx2Cbj/wbDreKnqMy
 W4wHHHZix70c1fH8CMFBQgr+Y/GarfMQs6Xi3iA1hNMzFRlz14KQbUFShlZ9mOSLYZCfqdOms8p
 Izqkk9/FACRGU3oxuvNmiR/F7h8bqOy/EjWxOmZeGtNBfSSW5uf6cjiluIEJj/YDU2iA0BV7oJV
 dTL1hVuvwA8Y39G33zxtBCDP1yy+K0DiMdEPwfWmlTCuojGicsZANG2Na+dc4eJmdcarL6KTwVH
 EJqnojFtjnbtOyFemi7SK0b83M+mcTXsIGyjJw9zesgl7K7U8kcfQ1UGozzdZlNnV1dyKkF4O4K
 UJNsiAJc020TKOqy28x/gxV2O6nh85l6fS4OEuwVNUe01sjWm/Jop/XwYfgqHMIFaKCVsmoE7xT
 Tzz4+G7jZsCmRGA==
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


