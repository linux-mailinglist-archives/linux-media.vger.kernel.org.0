Return-Path: <linux-media+bounces-34781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4559AD9178
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55ECA1BC4362
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92421F63CD;
	Fri, 13 Jun 2025 15:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="C4qVawAC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a6Qi9SYx"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C64F1F30A9;
	Fri, 13 Jun 2025 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828932; cv=none; b=BeLaozzmPJiI8c66njRcJIuVQu8qH0ed9uLmoKIbIaGorWBcUOLLUpRW25QuQMax6PLg9LbOgV1dnOP9qvXyjm3wyMoA/ARqO6t7njZXyfEP1kZNu3y+kVrXEL9dk7Es/m2uaGDuR4bhc6fpwUUXSpfHZDq67/WSIszKAFMnfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828932; c=relaxed/simple;
	bh=1IkJMn8xHQNNEVNgRiQ6zY+2+C4/9HuGqvEDhiCNp08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J10bTuQ9IVkEZDgZN2kkRTpBtn7imxtIFKKWHV1rVCrX89fdjB9C2/TDDBN7eo30WLkyp+aBsEMpkDOJU4DKHf4pbU3kuNVMO7X01gjkag/KKM4QNZOFck0A+LyNcN/Og0Q5dnOJl/PpRBX+9g/PTG1pWQQSUEHGnCVqzux/MYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=C4qVawAC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a6Qi9SYx; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D53C5114014E;
	Fri, 13 Jun 2025 11:35:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 13 Jun 2025 11:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828929;
	 x=1749915329; bh=9vpzY45iYKty8Ia/xki16E+ncaoM7+4m6elY8PvYwB8=; b=
	C4qVawACF0wKi140ed3+HG95mMoYWproTPvMCizJ3wSy84ot4Cc4ZsBCyOnEBESv
	gVed02audZiVW3R0mjHNnDdE2sPhr5N8ZLAKCECMDYrfdEEsq6DCDjEfRmhzpFne
	y1vf0o5/H/OT9Lw4plmmeBJMD6PX69hr0HDfW2Gj9g5egUucO64Dn438JPQHiuD3
	DfxDeCToK4ozYiCINya3+/e7KDdfIFrIvoXg66sopVB2jwk7mda5qmtzT+6vaSZx
	OmZZj+wRmBlO/2Wl885vs40WMPj1IF7rkJi6jgMCR5w2S5bqO55KwVhILG7hJuDq
	V8AdHlLr2ZNKAKCAt1Rt3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828929; x=
	1749915329; bh=9vpzY45iYKty8Ia/xki16E+ncaoM7+4m6elY8PvYwB8=; b=a
	6Qi9SYx6/vZlbfR8S4mG0nSwPmp0ZOKmHgmW0QXlnUt/tJKsTnltl4nFIISFjFcM
	whBjgFiJ52M+JiCuCeqJ8dJomBeWF41Mzt4NtAmVxJcoSKd1kPtXlRSkuTjYtf2t
	OYXrSiLqTR8Opnt70vpxXDBHJCCZqs6XP7SyvRv8BXm/Wg4/iUDawZ+t7eEcRhtA
	mNPQovtw8ds/kUaMghkkqjnYivYOZwrkJVcgzfsCxMdeYaf2mrRHkKz6LJ0ZBwBH
	TbBSN3TJDCY0LYINLDpyBeE/yIxNunsf+DdrrIN75Tf9hPS/o3OMpu6YqzSKUnkA
	50pHxSwJX8FGhTk0z3CoA==
X-ME-Sender: <xms:QUVMaJ5uT_E0KWQZ23fmfsFrz9m_5NxyfA0V_wIuwS8MBjI3-qxEig>
    <xme:QUVMaG4p0mH050-EG8gGI88K40ME6JCtKdT4qDcSb3KmErmPztmHY06eGAl_kqfKC
    riG2JBeuIrg0zLVVcg>
X-ME-Received: <xmr:QUVMaAfQfARJ8lbeidI4naXu6kuz0VriLr4PrfIg4xI_zr-KYnIIV0vjZJAq2-kWmvWREt-pn2-hw_Q4lTxrRv0N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:QUVMaCJJYilGW9FnAtlanZdI6yqwUTDKBZqOQge8GvNNvFS7yYIv6w>
    <xmx:QUVMaNJzKRAsfc9_olyuy_dStlUvOONbc84TFsJfPmk9YAJEgAj-0A>
    <xmx:QUVMaLyYM4Kb4sQ4MjTNeGbS2YCBANBzViVWo9Nnx7J2OH-THrelAg>
    <xmx:QUVMaJKBHhO6RuiWWmdZqHSteDTUmPyR9_qwHlURJcxeiMQVVUd6fg>
    <xmx:QUVMaFb5s2PKOZvt9r8WyhGFrO9GZ6Bt95CdqMqWklsY49a2DqV_J30o>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:29 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 11/13] media: rcar-vin: Only expose VIN controls
Date: Fri, 13 Jun 2025 17:34:32 +0200
Message-ID: <20250613153434.2001800-12-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Before moving Gen2 to media controller simplify the creation of controls
by not exposing the sub-device controls on the video device. This could
be done while enabling media controller but doing it separately reduces
the changes needed to do so.

The rework also allows the cleanup and remove paths to be simplified by
folding all special cases into the only remaining call site.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v5
- Reduce number of control buckets to 1.

* Changes since v4
- Broken out from a larger patch.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 89 +++++--------------
 1 file changed, 21 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 7367b5c993cd..74fc90cf5800 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -365,14 +365,6 @@ static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
 	return ret;
 }
 
-static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
-{
-	if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
-		v4l2_async_nf_unregister(&vin->group->notifier);
-		v4l2_async_nf_cleanup(&vin->group->notifier);
-	}
-}
-
 static int rvin_parallel_parse_of(struct rvin_dev *vin)
 {
 	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
@@ -510,11 +502,11 @@ static void rvin_free_controls(struct rvin_dev *vin)
 	vin->vdev.ctrl_handler = NULL;
 }
 
-static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
+static int rvin_create_controls(struct rvin_dev *vin)
 {
 	int ret;
 
-	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 16);
+	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
 	if (ret < 0)
 		return ret;
 
@@ -528,16 +520,6 @@ static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev
 		return ret;
 	}
 
-	/* For the non-MC mode add controls from the subdevice. */
-	if (subdev) {
-		ret = v4l2_ctrl_add_handler(&vin->ctrl_handler,
-					    subdev->ctrl_handler, NULL, true);
-		if (ret < 0) {
-			rvin_free_controls(vin);
-			return ret;
-		}
-	}
-
 	vin->vdev.ctrl_handler = &vin->ctrl_handler;
 
 	return 0;
@@ -627,11 +609,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 	if (ret < 0 && ret != -ENOIOCTLCMD)
 		return ret;
 
-	/* Add the controls */
-	ret = rvin_create_controls(vin, subdev);
-	if (ret < 0)
-		return ret;
-
 	vin->parallel.subdev = subdev;
 
 	return 0;
@@ -885,34 +862,17 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
 	return ret;
 }
 
-static void rvin_csi2_cleanup(struct rvin_dev *vin)
-{
-	rvin_group_notifier_cleanup(vin);
-	rvin_free_controls(vin);
-}
-
 static int rvin_csi2_init(struct rvin_dev *vin)
 {
 	int ret;
 
-
-	ret = rvin_create_controls(vin, NULL);
-	if (ret < 0)
-		return ret;
-
 	ret = rvin_group_get(vin, rvin_csi2_setup_links, &rvin_csi2_media_ops);
 	if (ret)
-		goto err_controls;
+		return ret;
 
 	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
 	if (ret)
-		goto err_group;
-
-	return 0;
-err_group:
-	rvin_group_put(vin);
-err_controls:
-	rvin_free_controls(vin);
+		rvin_group_put(vin);
 
 	return ret;
 }
@@ -966,34 +926,17 @@ static int rvin_isp_setup_links(struct rvin_group *group)
 	return ret;
 }
 
-static void rvin_isp_cleanup(struct rvin_dev *vin)
-{
-	rvin_group_notifier_cleanup(vin);
-	rvin_free_controls(vin);
-}
-
 static int rvin_isp_init(struct rvin_dev *vin)
 {
 	int ret;
 
-
-	ret = rvin_create_controls(vin, NULL);
-	if (ret < 0)
-		return ret;
-
 	ret = rvin_group_get(vin, rvin_isp_setup_links, NULL);
 	if (ret)
-		goto err_controls;
+		return ret;
 
 	ret = rvin_group_notifier_init(vin, 2, RVIN_ISP_MAX);
 	if (ret)
-		goto err_group;
-
-	return 0;
-err_group:
-	rvin_group_put(vin);
-err_controls:
-	rvin_free_controls(vin);
+		rvin_group_put(vin);
 
 	return ret;
 }
@@ -1374,6 +1317,10 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_id;
 
+	ret = rvin_create_controls(vin);
+	if (ret < 0)
+		goto err_id;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
@@ -1392,13 +1339,15 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	}
 
 	if (ret)
-		goto err_id;
+		goto err_ctrl;
 
 	pm_suspend_ignore_children(&pdev->dev, true);
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 
+err_ctrl:
+	rvin_free_controls(vin);
 err_id:
 	rvin_id_put(vin);
 err_dma:
@@ -1415,13 +1364,17 @@ static void rcar_vin_remove(struct platform_device *pdev)
 
 	rvin_v4l2_unregister(vin);
 
-	if (vin->info->use_isp)
-		rvin_isp_cleanup(vin);
-	else if (vin->info->use_mc)
-		rvin_csi2_cleanup(vin);
+	if (vin->info->use_isp || vin->info->use_mc) {
+		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
+			v4l2_async_nf_unregister(&vin->group->notifier);
+			v4l2_async_nf_cleanup(&vin->group->notifier);
+		}
+	}
 
 	rvin_group_put(vin);
 
+	rvin_free_controls(vin);
+
 	rvin_id_put(vin);
 
 	rvin_dma_unregister(vin);
-- 
2.49.0


