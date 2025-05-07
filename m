Return-Path: <linux-media+bounces-31947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A33AADBA4
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58677468743
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE72209F2E;
	Wed,  7 May 2025 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JPRrYYVO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q4BJPSJH"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADEC2010EE;
	Wed,  7 May 2025 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610894; cv=none; b=TXSKv+Pvb3UKMjIMN0EjJXhzMp1BX/GgbFWMdlH6nfaZtcLmB7hCkT2IGjVC8oQ9/r5vC/jp4/EVAdzGcV0bHV5VUM1PY2FY6zpymgunI84eCGF9VPMHKYmGTQiA1HhjUUD6J1KQ468XgVywwIucfdjtsY4FVAatGmOIUi0FJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610894; c=relaxed/simple;
	bh=fM8qGtvXORs+FxEa6y3KQSrSvwHDtbCUPrcmjD2SexQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J86ZNqfZZv+T8/GHqKvMiOuT88UhjQKe27sdH0v7uLZyRNgiKJg+Y2PXaMhIGmQDx/r9JB6QHc3JJsnb97y5MRVdAa3EbCiOOexMaBBkqFBz6jvcu8R7YSBdczhPfdlxRwOwVnPLwyBaI/w/s3J1FYfH9P5gWjmEKh9SsEf7oGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JPRrYYVO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q4BJPSJH; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id CD30513800ED;
	Wed,  7 May 2025 05:41:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 07 May 2025 05:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746610890;
	 x=1746697290; bh=QnEguFPRPOt01P6SA1Ezv6Z0bnXqxDmGL13VmY0+LE8=; b=
	JPRrYYVOqmV7zTzCU7fGiH3dRQBsyc+s/j17Acw9f5UbXQLja0N0XO7JJsV/SIsj
	3JhKxJiB1JlK7wHkqW5SRcDow+4pJETJ/VLPS4NcdCWrOuu8CV2fbz/yJdqdB0dk
	ShelFIvapnuspt/8R9ceBYp5mzg74AJrF767pQY7DKRP+v1GcKyeIVPgEv3e/AAV
	T3ZyuU/iRxd+/WS2BK1PbNxu91SVDAOuSGDCoHpHr90SikZCyQBfn7a88CafF/by
	1xuhs3tO9jrGyQA2PlhZJ8qCDA9wx0qQX4hBbgdfGkcfjiL98cEVQ2UyNkd8FsmU
	pV7MlzvcPD9hkprqYMoGKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746610890; x=
	1746697290; bh=QnEguFPRPOt01P6SA1Ezv6Z0bnXqxDmGL13VmY0+LE8=; b=Q
	4BJPSJHGaAoKFoFCW7/VJGA15bc5B5u6bXoXlFNzkYskirfDOg1NXT0Nqq907poq
	nzwy8pNwUlhC+u+9ghuEoQ/xumWp9YRsek9krCSNQH1M0tBT+unjDGiJVIKO27dv
	Y07WIbi+zRnE/KLgDNrxvrWdZiucOvoD/W+LslbwUgciNpL3PGrcV48qrzKAm00F
	EchBOW9bT0oXHVF5/d1oH5thvVPB8MkT7FfKYBQPWlyNDs1Udufrusc3oRyaiEte
	9lv2TQZ67YPBsm3zKqu8AWtC2/dA7jrv61jv0sbCLJSfcHabcUVYtFhcKml8GT/I
	h8utYWIYLcNOfpRwkj4Nw==
X-ME-Sender: <xms:yiobaKNPBXeRl7FU5yIQqiVoW8khlySvonVZ64h3MZ8BxEpyShHtfA>
    <xme:yiobaI92CX96P6UGVKRi-SO32Ohq93ntEgidSJueUqhM4tZf0tHC1WDrhXuO7v5Mz
    1k03fxwju1zKUoRS3o>
X-ME-Received: <xmr:yiobaBRNwNzbL5jvpwG1NIUDAFVTT7CjlfV_KLjdUVfjpMwy2-SnFI6kYnl-r8e3Gmr_hdpp5hHg_B__R7e-Jj55>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeihedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdr
    rghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrg
    gssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruh
    hrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphht
    thhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:yiobaKs1dG7LDiaPvUqsGxN3aex2aQzQEXbpM2ki1Bw7xc1sGAEr9g>
    <xmx:yiobaCdAmm__utjBhCzFNmVngWSDAe01QSTZdndJKzGNfpmXsj9vtA>
    <xmx:yiobaO32KpEavWhXknYSwQxIEgsIrS24YJYgCDNvDUoRMSJA4uhGng>
    <xmx:yiobaG-iPQRz8O4FNsgq9HeRBDn6b9PYmy8wbC3b4wYf4JkVbTpHdQ>
    <xmx:yiobaN8WOFqJ66g56viKGQBgsuGUULLLm-ZjEVy6qz6VreAzam0-C3vc>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 05:41:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 2/6] media: rcar-vin: Change link setup argument
Date: Wed,  7 May 2025 11:40:10 +0200
Message-ID: <20250507094014.622087-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250507094014.622087-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The link setup callback once acted on each VIN instance, and expected to
be called once for each VIN instance. This have changed as the driver
grew support for later hardware generations and the callback is now
expected to setup links for all VIN in the group.

The argument to the callback have however remained a pointer to a single
VIN instance. This pointer was then used to get the group structure. Fix
this and pass the group as the single argument to the link setup
callback making the expectation of the function clear.

There is no intentional change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 52 ++++++++++++-------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  2 +-
 2 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 9856a7a70026..54b3957be705 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -65,7 +65,7 @@ static void rvin_group_cleanup(struct rvin_group *group)
 }
 
 static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
-			   int (*link_setup)(struct rvin_dev *),
+			   int (*link_setup)(struct rvin_group *),
 			   const struct media_device_ops *ops)
 {
 	struct media_device *mdev = &group->mdev;
@@ -115,7 +115,7 @@ static void rvin_group_release(struct kref *kref)
 }
 
 static int rvin_group_get(struct rvin_dev *vin,
-			  int (*link_setup)(struct rvin_dev *),
+			  int (*link_setup)(struct rvin_group *),
 			  const struct media_device_ops *ops)
 {
 	struct rvin_group *group;
@@ -246,7 +246,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin);
+	return vin->group->link_setup(vin->group);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -909,35 +909,46 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	return 0;
 }
 
-static int rvin_csi2_setup_links(struct rvin_dev *vin)
+static int rvin_csi2_setup_links(struct rvin_group *group)
 {
-	const struct rvin_group_route *route;
+	const struct rvin_group_route *routes, *route;
 	unsigned int id;
 	int ret = -EINVAL;
 
+	/* Find any VIN in group to get route info. */
+	routes = NULL;
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		if (group->vin[i]) {
+			routes = group->vin[i]->info->routes;
+			break;
+		}
+	}
+	if (!routes)
+		return -ENODEV;
+
 	/* Create all media device links between VINs and CSI-2's. */
-	mutex_lock(&vin->group->lock);
-	for (route = vin->info->routes; route->chsel; route++) {
+	mutex_lock(&group->lock);
+	for (route = routes; route->chsel; route++) {
 		/* Check that VIN' master is part of the group. */
-		if (!vin->group->vin[route->master])
+		if (!group->vin[route->master])
 			continue;
 
 		/* Check that CSI-2 is part of the group. */
-		if (!vin->group->remotes[route->csi].subdev)
+		if (!group->remotes[route->csi].subdev)
 			continue;
 
 		for (id = route->master; id < route->master + 4; id++) {
 			/* Check that VIN is part of the group. */
-			if (!vin->group->vin[id])
+			if (!group->vin[id])
 				continue;
 
-			ret = rvin_csi2_create_link(vin->group, id, route);
+			ret = rvin_csi2_create_link(group, id, route);
 			if (ret)
 				goto out;
 		}
 	}
 out:
-	mutex_unlock(&vin->group->lock);
+	mutex_unlock(&group->lock);
 
 	return ret;
 }
@@ -991,30 +1002,33 @@ static int rvin_csi2_init(struct rvin_dev *vin)
  * ISP
  */
 
-static int rvin_isp_setup_links(struct rvin_dev *vin)
+static int rvin_isp_setup_links(struct rvin_group *group)
 {
 	unsigned int i;
 	int ret = -EINVAL;
 
 	/* Create all media device links between VINs and ISP's. */
-	mutex_lock(&vin->group->lock);
+	mutex_lock(&group->lock);
 	for (i = 0; i < RCAR_VIN_NUM; i++) {
 		struct media_pad *source_pad, *sink_pad;
 		struct media_entity *source, *sink;
 		unsigned int source_slot = i / 8;
 		unsigned int source_idx = i % 8 + 1;
+		struct rvin_dev *vin;
 
-		if (!vin->group->vin[i])
+		vin = group->vin[i];
+
+		if (!vin)
 			continue;
 
 		/* Check that ISP is part of the group. */
-		if (!vin->group->remotes[source_slot].subdev)
+		if (!group->remotes[source_slot].subdev)
 			continue;
 
-		source = &vin->group->remotes[source_slot].subdev->entity;
+		source = &group->remotes[source_slot].subdev->entity;
 		source_pad = &source->pads[source_idx];
 
-		sink = &vin->group->vin[i]->vdev.entity;
+		sink = &vin->vdev.entity;
 		sink_pad = &sink->pads[0];
 
 		/* Skip if link already exists. */
@@ -1030,7 +1044,7 @@ static int rvin_isp_setup_links(struct rvin_dev *vin)
 			break;
 		}
 	}
-	mutex_unlock(&vin->group->lock);
+	mutex_unlock(&group->lock);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 934474d2334a..142a39718208 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -256,7 +256,7 @@ struct rvin_group {
 	struct v4l2_async_notifier notifier;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
-	int (*link_setup)(struct rvin_dev *vin);
+	int (*link_setup)(struct rvin_group *group);
 
 	struct {
 		struct v4l2_async_connection *asc;
-- 
2.49.0


