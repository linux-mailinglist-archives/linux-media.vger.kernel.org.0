Return-Path: <linux-media+bounces-34279-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A5AD0813
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 451611759D7
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E281F09A1;
	Fri,  6 Jun 2025 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XZRdbbSa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VC69m+4f"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ABF1F2C44;
	Fri,  6 Jun 2025 18:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234435; cv=none; b=pg/V0sX55iMbTQN19luoI5CDMGZYMxHzTKjPUUVtFqxJZ81b+xMtjIda++toFuOWqN/LvH3M9aTdBYxOAz8BfIu0MX46OnKx31MAM/+77auDQ8FXysmeZBbjIdrmDa+9Zsm9DZojbBTiUCoE9tkHq3SM8FbVxjcHug5om2socVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234435; c=relaxed/simple;
	bh=F3ZwSfKskbfr5t++DcyX+iYqAOv5QO6LtqxaIy55WMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i9KVHAj9MW3A5f8YLBtYifCxhV11o1mPQnHoVzO9GiXmUlZjvaspBRINOgUKhBrVvSDrX7TyyqOiwpCjWeLQOcFnrxJBvu4tGYQrZr0RjfY/sOtvbxT8bFVIEO+zofO3CpnB2m8eRlaEw5Qf+ucgOjPE1E2wST9i4gvUAeasBug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XZRdbbSa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VC69m+4f; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8FE3B25400EE;
	Fri,  6 Jun 2025 14:27:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 06 Jun 2025 14:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234432;
	 x=1749320832; bh=+wuaC8cBym/8UVB6Hh+N9LB8xaX1jAcBN9R2vyA9Omc=; b=
	XZRdbbSa3VrB7ThA0b2u8plt+6k/dpzR5VKwYJOZJzOgqVnt+Z9Uea426OZp/b3c
	QKoz20OrND9wm6Zo5SnT7wpqSimFCVeq8KC6pXCG7cwL7Vv6Auh27MncNrfp5zae
	dRpiHNDgI7d9FJ2/waNUKdYszTRKKv6QlV7JArNYainGFu1XYVSl50Ukpcd0Czwc
	t40/OFo/gTYR4PcMv+jmFTbxV0rsRSv6usrEPA7MIClv5oLw9K6amCoZM10gK64z
	djhAv04E25R6kJOOnsE3DIRKkN7NZdT/Ta6p7iZo64Wr2piZv/zzxP6SpNq2v3x4
	xiWt9hlXSDKQH4E8WjR8qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234432; x=
	1749320832; bh=+wuaC8cBym/8UVB6Hh+N9LB8xaX1jAcBN9R2vyA9Omc=; b=V
	C69m+4fCX48pcr6mz92vcdiGF2D7WloFWWAd5BhlkLtrFWzDIcknUaFHbikYvObZ
	dMf6vZwmYLyEDgZaenkPm/KpFXvAPla8NITqjm7Z9XI3R3yVLbYHO5kNBcrCZesX
	plnif7KCQBwaKWjccTapvUxus+lj+lynNsY1XNoeyi9HeIiW+DhGrS0LMx6Q8F66
	MS+3C4q4CnuD4HR2MSvQUybHPSiM4ZZsBfNhFWa7JwKRLV5rgel18QqMCikOrk/k
	kDADW2zw0wZfcA4I7AeziNQxux5K1OcC443JGPSBQSOM/kmkjYt+ZRliaN2oj2gX
	etmf5frFZmOtyzuJFCbTw==
X-ME-Sender: <xms:ADNDaCw89eG4E_DWwoQcxBoRf2tzHNfBnjOBJl8R3ilIPE5_UsW9AQ>
    <xme:ADNDaORCAHLolQaeZ8jPSX1OPI9yt35x4KctBPaZsvbtAbRhPrfUVZKZWk4VDeAOR
    byp5XNBGrDTAcveKg0>
X-ME-Received: <xmr:ADNDaEWrxR8kr2xZeAzcnj2HoDw6pRdbHD7Vxl--hDs5cQ9KoP8-OvPudiJfWjUyPyNkzab175P3EWoZ9ZxnYG-b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:ADNDaIhWiR3de1KtGpsuW_fFIzFhGFWJDIeD-dL8c-71BgB03cgNkg>
    <xmx:ADNDaEDM2-hFP-_1CPXIvFFZdEF0Yh5oMU_5E-y1hXu7RxZWHK0OMA>
    <xmx:ADNDaJIT_uoQih7oyrIlhB83F7MaYlALMZpOvw5Ls-heGflij7wt9Q>
    <xmx:ADNDaLAS-WwxINpOnbxJO-pm3Efk-IYiPkjYwAtPZDzNgktGNgoimA>
    <xmx:ADNDaLzcjbwXvU47Y_oOXr_Aps3P1ZwIqnkuaWq66nrtWYT7Xh2KH02H>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:27:11 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 10/12] media: rcar-vin: Only expose VIN controls
Date: Fri,  6 Jun 2025 20:26:04 +0200
Message-ID: <20250606182606.3984508-11-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
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
* Changes since v4
- Broken out from a larger patch.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 84 ++++---------------
 1 file changed, 18 insertions(+), 66 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 8cb3d0a3520f..597e868a6bc5 100644
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
@@ -510,7 +502,7 @@ static void rvin_free_controls(struct rvin_dev *vin)
 	vin->vdev.ctrl_handler = NULL;
 }
 
-static int rvin_create_controls(struct rvin_dev *vin, struct v4l2_subdev *subdev)
+static int rvin_create_controls(struct rvin_dev *vin)
 {
 	int ret;
 
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
@@ -1372,6 +1315,10 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = rvin_create_controls(vin);
+	if (ret < 0)
+		return ret;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
@@ -1390,6 +1337,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	}
 
 	if (ret) {
+		rvin_free_controls(vin);
 		rvin_dma_unregister(vin);
 		rvin_id_put(vin);
 		return ret;
@@ -1409,13 +1357,17 @@ static void rcar_vin_remove(struct platform_device *pdev)
 
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


