Return-Path: <linux-media+bounces-24964-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F221BA16D1D
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 905A67A4885
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A921E3762;
	Mon, 20 Jan 2025 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SFr/5Buu"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A21E2843;
	Mon, 20 Jan 2025 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378701; cv=none; b=BmNhpiG5ie4ku/fhkUMvR1WRWf7z08YaFi+TCfKWGWsCf65C42wEiid5S2WHtDQPNgXU/v7eN/VaGcY2xENc5CVmM9d+p9++txfl9qEnSnkb4huLq4kKgDn9ctOmBwteWVpDEzDoZJwQf/bTQBL3stdUJ8m8Wxt2AzAoYnqPTMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378701; c=relaxed/simple;
	bh=HOC0iwOhFBcP5j1MwMPNRotFW8j1Ia86cs/Eq8KP/9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+bO2X6iqNR0K/zBuY0M9oayjBzEJ8+Wh0hDEyPH7Sr6I3KeVqL24UY/99yAdv9grIc+TIgU9oOq9TDsPGnsUK05A9c6IWiJv5ccUsE6x8jMktEc9xpVgQJbo+rwXGBFSp2v/Rf7MXH3VjSL0FKk7HacL7kQdyURy97gvqZHEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SFr/5Buu; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EEBC11A1;
	Mon, 20 Jan 2025 14:10:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378624;
	bh=HOC0iwOhFBcP5j1MwMPNRotFW8j1Ia86cs/Eq8KP/9A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SFr/5BuuVYAeHBLv3RnLVgdsxYr/XmxEn/XNcVHQtGLE5Hh6RdqdB2faCoyAYIdoX
	 gRegpOTMzlDaFKS7/lO/Od02dFmvS2ujxeoSXGUSj8BN0IP7F6xxNNob9zDN7CSm0X
	 H+e9IxTTise3PMx8mKzxYSbYoJycC+xgGZCEUJAc=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Date: Mon, 20 Jan 2025 15:10:37 +0200
Subject: [PATCH 04/10] media: rcar-csi2: Use v4l2_get_link_freq()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rcar-media-impro-v1-4-043823c3893e@ideasonboard.com>
References: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
In-Reply-To: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2175;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=HOC0iwOhFBcP5j1MwMPNRotFW8j1Ia86cs/Eq8KP/9A=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjkt56oCr0WVy8D2Pu1OpmZK4MzT2ojO0Gj0R8
 hbJP9UD6wiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LeQAKCRD6PaqMvJYe
 9Xj6D/9AVEMlaP7qNsVxHEMYI8pGvNz/7oNxkvVznpqYLB5GblBNTBltyH/t6uycQqblzt0FBFE
 WKndWD0FOFKjO6Re+or6ClpfO13W+PZMqo7DaO/7NQ+9jwvW8rhE2C8uzHqEVPoOLZmTYw0Ut1e
 SxCL6vltMD5k8dWZDrx7pUCGaPX/G17ofs26xcQ6bCcPcs0KAluywwNo3Z6+vTORvN0hyf5i1x1
 Rcg+YyvbkPrH6sufvQtspZRHNCgi06YjNa3GQY0u8iyKuVtLy0on8k8kNDgbktvJ3G5S6sD/9RK
 mrAJ9SkyVMPMOna33bfmgPGAU997nIG5jjBml6yZRy4XQRWFl2+iFFd9mjGeRwZ3WqD8h2lFoFa
 AjttBducPkBmDe3t9kbR1jdAn6zzShTTTUCmNDLOf7nZ2qndbN+uOqPDME/NM7HeU+u+s2QhJmS
 w1FxctalwPKVHH8fThbFlhqp/i/oPO6EseHC35nFn4GiM545v95yziZuJsAut7LHp2INHVWIrjs
 rVf8gwwLv2ndQ3ggvvpjTpx82CrSh7IA6hri9rx3VDXWMqo9bC9ag5g6ZYtkJxGmpE+QpMeRUqW
 dXuBsAt9SUdMWSLVKRy0UrbVbtOxCRlI7uP09hiVoHf/bgnvoXKlp8LDgiC9q+PmMgus5Lh+Ba0
 amJD+Tqh98V2NiQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Instead of directly using V4L2_CID_PIXEL_RATE and calculating the mbps
from that, use v4l2_get_link_freq(), which also supports
V4L2_CID_LINK_FREQ.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 52d4e333c735..84e6194fed6c 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -15,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/sys_soc.h>
+#include <linux/units.h>
 
 #include <media/mipi-csi2.h>
 #include <media/v4l2-ctrls.h>
@@ -953,7 +955,7 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 			   unsigned int lanes)
 {
 	struct v4l2_subdev *source;
-	struct v4l2_ctrl *ctrl;
+	s64 freq;
 	u64 mbps;
 
 	if (!priv->remote)
@@ -961,21 +963,17 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 
 	source = priv->remote;
 
-	/* Read the pixel rate control from remote. */
-	ctrl = v4l2_ctrl_find(source->ctrl_handler, V4L2_CID_PIXEL_RATE);
-	if (!ctrl) {
-		dev_err(priv->dev, "no pixel rate control in subdev %s\n",
-			source->name);
-		return -EINVAL;
+	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
+	if (freq < 0) {
+		int ret = (int)freq;
+
+		dev_err(priv->dev, "failed to get link freq for %s: %d\n",
+			source->name, ret);
+
+		return ret;
 	}
 
-	/*
-	 * Calculate the phypll in mbps.
-	 * link_freq = (pixel_rate * bits_per_sample) / (2 * nr_of_lanes)
-	 * bps = link_freq * 2
-	 */
-	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
-	do_div(mbps, lanes * 1000000);
+	mbps = div_u64(freq * 2, MEGA);
 
 	/* Adjust for C-PHY, divide by 2.8. */
 	if (priv->cphy)

-- 
2.43.0


