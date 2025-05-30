Return-Path: <linux-media+bounces-33674-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA2CAC90A7
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 15:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 828A7A40A67
	for <lists+linux-media@lfdr.de>; Fri, 30 May 2025 13:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3542309B9;
	Fri, 30 May 2025 13:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y397xb9k"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0C22F767;
	Fri, 30 May 2025 13:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748613104; cv=none; b=Cf6kVi1GS00w3TfzIbH08kKyoWsVuUafwWV6dNIWw462ERdjydfOTxJrmpIJplfVNJ49Ym0kFdktsNSFd2DzjkfFxo6wh1n5GxPBQtwiuq+y5JpKP5CXK0Cdmu4+zabBLVBCojidKOEgqUt+VP3rhdgV6YHfssT9Uq7mV/CCNBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748613104; c=relaxed/simple;
	bh=wX8xnb5JJonq7MBfmlA0sa10fSG4A6We7UuS2Jc3MDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTA/rBXey6oSaoy9aW8Ljss+Mg0wxa7H3t55XjA7AGRJ07jeAjH3D3rkmY08gCWRlE4/SOu1ndx8Z8yJI2WA2srel1+dvrVEAGVcsKpV1mlL4DE9BnuRamrpledZboxae2q7Oj8Bp2GehTcAkRrZLd5dbjXlpgj+AVuYiobpCzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y397xb9k; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FE2589A;
	Fri, 30 May 2025 15:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748613066;
	bh=wX8xnb5JJonq7MBfmlA0sa10fSG4A6We7UuS2Jc3MDg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y397xb9kVZZ4hbXaxYJ0CYV6ghuiU6cqtM9UDY43zqBr8eexTQsEOjCg0EFgiPG40
	 leAtdO2uTvGOWzwH//uywTams3bMDFFyOF9lb9xPlzYYJrrFbiqbEdffB7MwUCj/gQ
	 FyUj7u4M2HDSVVejqy+lV9RjXOVkHzgoTraxB+DY=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Fri, 30 May 2025 16:50:36 +0300
Subject: [PATCH v3 07/15] media: rcar-csi2: Optimize rcsi2_calc_mbps()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-rcar-streams-v3-7-026655df7138@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2872;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=wX8xnb5JJonq7MBfmlA0sa10fSG4A6We7UuS2Jc3MDg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoObfdPNzj7O5PEW82QBfQqHRnYiQcWxHb1M9Mu
 xBZUd1kWEKJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaDm33QAKCRD6PaqMvJYe
 9ZZ0D/oCKBmnAKOizGNZNQKisy+BkYrjeiMNEckVR3NxS2SfdEYYkKfvl2c86QnY7rTAteKJv7E
 sZB0nzH8440dRjpBpEjIE8i4VRuHS6+j8V3yFkzoMQYnI7YxUq2IistO2vHnPfwqqNUB5WD88Gy
 98FSKmwEAfl3FeRYzQOUPo3wdXLMW2L7ZZ/wJS56jz2g2BdCMiEhZTE9/o7YqkjwTndYDYUmMBq
 2AnQGGpj3Y00h3YZ83B/UFlQB+5jZgN9DkEYnJII+dxsBvMTY9l5HgngMKrj2W8COxCsPj91gYI
 Km9ZdqEDoQCGvGt7K9k9C+3Hjpm+qM9IBPTwB3yA+OUG1jr+akCyvNVtH77Bgwi0wS7tKxHJMqu
 gKvo1yXXxgdpWpy8lKjUBw1b8VpwJJJlp+smNyPJ7+dRfGo4c1gQ/epMY9mVwvN47cTuTOijWSM
 ec8p5MhksgTwT/CjO6jbOnFhOISHF9KcqdxIdHQat5xQs3cKRkQ0UyUBHwEgUZneMkLs9SDhxpP
 A0iETO0WUyY79nVnPO3givwDkws+wriIHTnVbHQaI2vb2s13vZdBKojgw5M1AvSN7a4MWxjb3HX
 2PdYa0Tg5xeAs9uJ6Sw9p7HU5+X2YEfknivvsa5tzyE2FTi9R55PN7/sMXhBfLvB1WB6zcVv6Xl
 HyV/YX7A/wxmUtA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

With modern drivers supporting link-freq, we don't need to do any
calculations based on the bpp and number of lanes when figuring out the
link frequency. However, the code currently always runs code to get the
bpp and number of lanes.

Optimize the rcsi2_calc_mbps() so that we only do that when needed, i.e.
when querying the link-freq is not supported by the upstream subdevice.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 50 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 90973f3cba38..e0a0fd96459b 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1001,15 +1001,10 @@ static int rcsi2_get_active_lanes(struct rcar_csi2 *priv,
 static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 			   struct v4l2_subdev_state *state)
 {
-	const struct rcar_csi2_format *format;
-	struct v4l2_mbus_framefmt *fmt;
 	struct media_pad *remote_pad;
 	struct v4l2_subdev *source;
-	unsigned int lanes;
-	unsigned int bpp;
 	s64 freq;
 	u64 mbps;
-	int ret;
 
 	if (!priv->remote)
 		return -ENODEV;
@@ -1017,28 +1012,41 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv,
 	source = priv->remote;
 	remote_pad = &source->entity.pads[priv->remote_pad];
 
-	ret = rcsi2_get_active_lanes(priv, &lanes);
-	if (ret)
-		return ret;
+	/*
+	 * First try to get the real link freq. If that fails, try the heuristic
+	 * method with bpp and lanes (but that only works for one route).
+	 */
+	freq = v4l2_get_link_freq(remote_pad, 0, 0);
+	if (freq < 0) {
+		const struct rcar_csi2_format *format;
+		struct v4l2_mbus_framefmt *fmt;
+		unsigned int lanes;
+		unsigned int bpp;
+		int ret;
 
-	fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
-	if (!fmt)
-		return -EINVAL;
+		ret = rcsi2_get_active_lanes(priv, &lanes);
+		if (ret)
+			return ret;
 
-	format = rcsi2_code_to_fmt(fmt->code);
-	if (!format)
-		return -EINVAL;
+		fmt = v4l2_subdev_state_get_format(state, RCAR_CSI2_SINK);
+		if (!fmt)
+			return -EINVAL;
 
-	bpp = format->bpp;
+		format = rcsi2_code_to_fmt(fmt->code);
+		if (!format)
+			return -EINVAL;
 
-	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
-	if (freq < 0) {
-		int ret = (int)freq;
+		bpp = format->bpp;
 
-		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
-			source->name, ret);
+		freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
+		if (freq < 0) {
+			int ret = (int)freq;
 
-		return ret;
+			dev_err(priv->dev, "failed to get link freq for %s: %d\n",
+				source->name, ret);
+
+			return ret;
+		}
 	}
 
 	mbps = div_u64(freq * 2, MEGA);

-- 
2.43.0


