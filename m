Return-Path: <linux-media+bounces-55431-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFAMAPulsWn4EAAAu9opvQ
	(envelope-from <linux-media+bounces-55431-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 18:27:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C423268039
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 18:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B643830576DD
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2026 17:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF04B3E3C4F;
	Wed, 11 Mar 2026 17:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b="GZUObFxH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mjAnFcnh"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EFF31960A;
	Wed, 11 Mar 2026 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249988; cv=none; b=gkkIAZ2IfJvmKMeh2sfYFX8aKS6Zf98ySTDql5evCHEELYGspgVVn1dbUV+5DCgpO2wIeaMem29JkN7//+NhXQ2GRzdsHrl5PmA5KOCW7LFhNHNeGnIfH8sJihyx09U8RPqIQEdl6+PFB2XD7BhMnT5Vxj+SkaiQXyT53XkHrhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249988; c=relaxed/simple;
	bh=y+KKZaoBKzrNz1o+jJF6trYgtzm7fNHFfD7SXXDA9UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AWWtAXWm+e3OAXEw0H+grasXeHUL8Up23UeDoUFF1MWroUhf8qe9u9WMegtzFrd8AaRd0UGfKoqRk6Kj9WPC+N+lv7gcjwmkUzGvQAm/enMU33rtYk+NE7qNOmgo8oXIjpuN8mhoepuBK7tPbQReLBP/D4aeQ71CeNR7cNx0Xco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu; spf=pass smtp.mailfrom=schnwalter.eu; dkim=pass (2048-bit key) header.d=schnwalter.eu header.i=@schnwalter.eu header.b=GZUObFxH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mjAnFcnh; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=schnwalter.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=schnwalter.eu
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id BFDC4EC0642;
	Wed, 11 Mar 2026 13:26:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 11 Mar 2026 13:26:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1773249985; x=
	1773336385; bh=YkPQERX+T6reisC78/iLKEw2FXnOBZz8ocwVFwvGVXU=; b=G
	ZUObFxHpg/SMW9vOWdRjeIfo8t0glT5t47vvtNLUT+4kW0cBdt4/VHpphTVxFTc2
	cgzsHR+mrQmjqmGnVtsCfqA7o7YhSvA0M8rky1CrNexxzMO6oItme/oGV367P0QI
	ZrEBxrgUKTfA952kd3QiJ2h314FC74CZTyOCp9nbx/rxBrlqOM/9yx4ShvCGdjh5
	IaSn2dKCk4orsfHaaPZTATSjBtVM5fkni9yNmLdqHLj4c+z8pwNkjYrWQEa/Vioy
	T0iSkQyasYAr7sksVwqrUGhqtKIgyaXis507RCQIyA6guiHnaZvpj6OHE3felqQQ
	MbPxClXIxvQ79vwSMEYJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773249985; x=1773336385; bh=YkPQERX+T6reisC78/iLKEw2FXnO
	BZz8ocwVFwvGVXU=; b=mjAnFcnhU4vaEtTOp9avek22E91rC4+9XAbG8vj/W3nw
	EPTZOwRY05FpifPvibTj429cLMo6+WBLxk9j1IrAUo/JZ2fgPL+tDgeHl6SZYOIC
	OWcVqS30EDN4H7JqNGxwravxl/EPzHvNAV7zF4l2zvi3KqzkjmlbCZut5ioWbXr8
	fBGa48mR+EIKnPkTMBlusNzNPOmDrewVJijGet9o71BnuRO0cJ4VbFC7ROZsUUdV
	W3fJrtFCzZwOE7D39WRO52JuIZr/+gy0c3WHUCe0muP5W1hcRgMZiG5AifNs2yvM
	ajo30Dj71bfYPe6lF6L9L2cPo7/NW0/6cVgPpf24gg==
X-ME-Sender: <xms:waWxaQVWA00PA3cfilTkqfmpEIwtFMn7Id1ExzlVU44Q0TDv6Xufew>
    <xme:waWxacwuwi5dq5xIBPFZIXCeiqkp0xNH8VPcLpTyAjvKKtlorTh4CE5Olmue_1xud
    kGtnTkiHigioHrvafOgPBYLr90BqYlxIAJnWvc2mK6L9PZNnedaww>
X-ME-Received: <xmr:waWxaf_2Q_R0Rib72tHW9wjKFXnaa_bQ1WaH826RfGQfw2muvxbSI2glotlz7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvkeeggeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeghrghlthgvrhcu
    hggvrhhnvghrucfutghhnhgvihguvghruceotghonhhtrggtthesshgthhhnfigrlhhtvg
    hrrdgvuheqnecuggftrfgrthhtvghrnhepvefhheduuefggffhgfeuudefvdelieffiedu
    uddvleeludevgfetfeegiefgfefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgr
    tghtsehstghhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegtohhnthgrtghtsehstghhnhifrghlthgvrhdrvghupdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhn
    sghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:waWxaZ_KZUiiG6ePfzflo2qEKXm0Y8z5AT4-dwzy0jgPLRIL1iRnXA>
    <xmx:waWxaWVjROsHmeX2lcn71SoMYqkd6bVQUXr80R0ZHTahb7KZNdr3aA>
    <xmx:waWxaefia8uNBPqHU3o8GIaI8ExbDoMoK6ckAJLjPzi5aJjfzypRgg>
    <xmx:waWxaXZBitn-7L-86WC6KS4LYLM0NsD1gKvSQAoLGlxWRT-kAHbu-g>
    <xmx:waWxacDFfx8t-csDch28JVCYeh0Uds3LdLeQATUi1F25r1EgIRsZP0tK>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 Mar 2026 13:26:23 -0400 (EDT)
From: Walter Werner Schneider <contact@schnwalter.eu>
Date: Wed, 11 Mar 2026 19:26:20 +0200
Subject: [PATCH] media: i2c: Add ov2732 image sensor driver cleanup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-ov2732-driver-cleanup-v1-1-234f334c1e4b@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIALylsWkC/x3MMQqAMAxA0atIZgM2gqJXEYfaRg1IlRSLIL27x
 fEN/78QWYUjjNULykminKHA1BW43YaNUXwxUENd0xqDZ6K+JfQqiRXdwTbcF9rOLesyDGR7D6W
 9lFd5/u805/wBHip/U2cAAAA=
X-Change-ID: 20260311-ov2732-driver-cleanup-a6cbfb992a7d
To: linux-media@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Walter Werner Schneider <contact@schnwalter.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773249983; l=2436;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=y+KKZaoBKzrNz1o+jJF6trYgtzm7fNHFfD7SXXDA9UY=;
 b=/In7nVa0lrn41L9LsRhcs3MEv/mgFtLhvODpQeMu1fZmGm4cQqGzMBI/thtQiH3lzkHzccpN8
 u4ufb2ifG21A9H2yY0IybxXNYvXGDX486VqWRmz74TjH11QyCXZQAme
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[schnwalter.eu,quarantine];
	R_DKIM_ALLOW(-0.20)[schnwalter.eu:s=fm2,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[schnwalter.eu:+,messagingengine.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55431-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@schnwalter.eu,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[schnwalter.eu:dkim,schnwalter.eu:email,schnwalter.eu:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 6C423268039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A small set of changes:
- Updated copyright year.
- Removed redundant parentheses.
- Removed endpoint check, see Dependencies for required patch set.

Dependencies:
- media: i2c: Add ov2732 image sensor driver
  https://lore.kernel.org/r/20260105-ov2732-driver-v6-0-95c1b0b0ba7b@schnwalter.eu
- media: v4l2-fwnode: Return -EPROBE_DEFER on parsing NULL endpoints
  https://lore.kernel.org/linux-media/20260310141157.1186325-1-sakari.ailus@linux.intel.com/

Signed-off-by: Walter Werner Schneider <contact@schnwalter.eu>
---
A patch to be applied on the v6 version of the ov2732 driver.

P.S. Sorry for the misunderstanding, it wasn't clear to me that I should
just send a diff on top of v6 instead of sending a v7.
---
 drivers/media/i2c/ov2732.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/ov2732.c b/drivers/media/i2c/ov2732.c
index d33e7b6e3762f0e93e199f36dc2d77f95ec5b414..40035320fec631c098f77c433360599905805d2d 100644
--- a/drivers/media/i2c/ov2732.c
+++ b/drivers/media/i2c/ov2732.c
@@ -3,7 +3,7 @@
  * ov2732 driver
  *
  * Copyright (C) 2017 Fuzhou Rockchip Electronics Co., Ltd.
- * Copyright (C) 2025 Walter Werner Schneider <contact@schnwalter.eu>
+ * Copyright (C) 2025-2026 Walter Werner Schneider <contact@schnwalter.eu>
  */
 
 #include <linux/clk.h>
@@ -491,11 +491,11 @@ static int ov2732_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_EXPOSURE:
 		/* Lowest 4 bits are fraction bits. */
 		cci_write(ov2732->regmap, OV2732_REG_EXPOSURE,
-			  ((u32)ctrl->val) << 4, &ret);
+			  (u32)ctrl->val << 4, &ret);
 		break;
 	case V4L2_CID_VBLANK:
 		cci_write(ov2732->regmap, OV2732_REG_VTS,
-			  (format->height + ctrl->val), &ret);
+			  format->height + ctrl->val, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		cci_write(ov2732->regmap, OV2732_REG_TEST_PATTERN,
@@ -608,10 +608,6 @@ static int ov2632_probe_dt(struct ov2732 *ov2732)
 	int ret;
 
 	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
-	if (!ep)
-		return dev_err_probe(ov2732->dev, -EPROBE_DEFER,
-				     "waiting for fwnode graph endpoint\n");
-
 	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
 	fwnode_handle_put(ep);
 	if (ret) {

---
base-commit: bb1048a0531ffda0c6e871c341d388735cfcc807
change-id: 20260311-ov2732-driver-cleanup-a6cbfb992a7d

Best regards,
-- 
Walter Werner Schneider <contact@schnwalter.eu>


