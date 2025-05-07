Return-Path: <linux-media+bounces-31949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8F2AADBA8
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84D4F468765
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:42:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5889F2080C0;
	Wed,  7 May 2025 09:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GOgzLOo1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XfTmM9rX"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF96A1FBEA8;
	Wed,  7 May 2025 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610897; cv=none; b=tgPaFRl9E0uCenUEIZQgubcalNQvfDNqo2s6kLdnVxZnGHXXRV1sNhp1uq3X9I4aUN4Hi3uz6Wr4gaWF3qZ9iUFe82P1ZqKzuxeiq+f9vCGC5zyfIWHpJ60J6vPygq5s907IeWPs/ES07sFfJLfbuKxa9XDndad7RwhqTxu/bzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610897; c=relaxed/simple;
	bh=LVlJyn5i8LSvWXDPmcZpSi1jVDpaVCG59neN9Ic71yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HW6CQYM2QtT5xlwsMBDDPMFpiWymKpEDTOHJiOo5SBe81e6y4Y7J9lLl+UT80O7Ir/YcrtDE897ACWsT6bwX28bBlGgiQPVbkPhsDRToLGd1+FxPtcak0DNh+/EI9vjJWwd9LU8Sw5XwPnvs/Tnqo9hWGRFrJ6Vke2W3KnTdSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GOgzLOo1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XfTmM9rX; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A99E41140100;
	Wed,  7 May 2025 05:41:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 07 May 2025 05:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746610894;
	 x=1746697294; bh=fu3slDsZpxtaa7kwumrZTXV5eYgt3C2qLoQ6sthBBIE=; b=
	GOgzLOo1DpzcOvlUAXSVKgh9bnWQxiiVPiyA51Zd22v0eWg89L+c+cbJIw8FBNjV
	QbS5VC0JblV+juBAHthlkAj1LKR5sZXfFjSmZWqIUQUYmx6YGGo6EzXxNvM8G3da
	kghfoFbi5uMnsm7tkmp2ADQWCeELkW4uV7xu//iFGkCEw41b4D2SG8qV/ovc/sqr
	/S4aDyDCY62bSgyQMi4tuiGfKePfpOnsjaGSAgAMBm9mSUy0iAbnGUeS+uNsHVw9
	nwmjXlGz55UXeS1D67/Ach8H56FfDPjEqht0RCNfdthUuni+gFugYoCvV//TNaGT
	gv7CrKdnSQRuWNiZNYu7Uw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746610894; x=
	1746697294; bh=fu3slDsZpxtaa7kwumrZTXV5eYgt3C2qLoQ6sthBBIE=; b=X
	fTmM9rXaKAu4Z3kx+RATHc5ZorPYBgzwbPXpuXlQTwZngwYD6SnlI54N+1rZDsc6
	0ujvRlcmFlsPo5FWl8wuJxI98loFWYcmrVCDx7T/QhUbMioWl8DnLkWCSSEx5p06
	cUiYFQ90T5no9By6ScSRevxUhwoWSaJyQc6/sKCe+vPdMVoh3qgJIAX1P6IrYd1Q
	Ag7jJdrIZqrwt8fga1HDKzDXj/UGiNz2vkrvv6GLepsPu9YznQNOI01ov26JiCoX
	w8Pf6k8RfL5p863U6dtm7hXSSDX/3MsTZnoKw4ZB2/LvwQ//ede/SsJrO9vYUlKN
	6YziNLJoEyzFiHrR+340A==
X-ME-Sender: <xms:ziobaOdJIuvoVsNfT7qUmUuFlbYZnkq3fTATCVdBnBtE-Vrh9Hnadg>
    <xme:ziobaIMd6aZkeKOv8-pFV917GdSfeE3O-CArdRqdMNVynCHDvPzqgw208o4jNhfSP
    FRPK_-knnOcsvXeGu0>
X-ME-Received: <xmr:ziobaPia6UeFbC9Xdofp7oTYKVQzdhAthoOAMH98pTB6Z4OMzIfFhUr9Re_v-TiEErvOq8Z6Kqxh0JoDVsfCZjhq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeihedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhm
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
X-ME-Proxy: <xmx:ziobaL83NbFlPIfOQMaBICi5JLhXfjaLzURZACWpApZXvZZIkJS71A>
    <xmx:ziobaKsaFob5pu-nEeYQHrIa_YUwuDGqeToib0jURaHGp-IcE2x0Ag>
    <xmx:ziobaCGZ6VOJ-ADbpYIi2C8cd8pCASwhS3wOupeD17V0WZuy22Q08A>
    <xmx:ziobaJNqE9WhtxbmsWrjRgQ5XG3Q3H0gk13M5L-z3HM7SNKxgGgBag>
    <xmx:ziobaPNMq7zlVkLYVX38eToIV1k-Qqo6HdM0Byn_qU81o8D91En6Sqi0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 05:41:34 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 4/6] media: rcar-vin: Prepare for unifying all v4l-async notifiers
Date: Wed,  7 May 2025 11:40:12 +0200
Message-ID: <20250507094014.622087-5-niklas.soderlund+renesas@ragnatech.se>
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

The R-Car VIN driver is needless complex and uses more then one
v4l-async notifier to attach to all its subdevices. Prepare for unifying
them by moving rvin_parallel_parse_of() to where it needs to be when
they are unified.

The function is moved verbatim and there is no change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 106 +++++++++---------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 62e17ef5bdea..bff79534492e 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -337,6 +337,59 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
 	}
 }
 
+static int rvin_parallel_parse_of(struct rvin_dev *vin)
+{
+	struct fwnode_handle *ep, *fwnode;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_UNKNOWN,
+	};
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
+	if (!ep)
+		return 0;
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	switch (vep.bus_type) {
+	case V4L2_MBUS_PARALLEL:
+	case V4L2_MBUS_BT656:
+		vin_dbg(vin, "Found %s media bus\n",
+			vep.bus_type == V4L2_MBUS_PARALLEL ?
+			"PARALLEL" : "BT656");
+		vin->parallel.mbus_type = vep.bus_type;
+		vin->parallel.bus = vep.bus.parallel;
+		break;
+	default:
+		vin_err(vin, "Unknown media bus type\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
+				       struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		goto out;
+	}
+
+	vin->parallel.asc = asc;
+
+	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
+out:
+	fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
 static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 				    unsigned int max_id)
 {
@@ -635,59 +688,6 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
 	.complete = rvin_parallel_notify_complete,
 };
 
-static int rvin_parallel_parse_of(struct rvin_dev *vin)
-{
-	struct fwnode_handle *ep, *fwnode;
-	struct v4l2_fwnode_endpoint vep = {
-		.bus_type = V4L2_MBUS_UNKNOWN,
-	};
-	struct v4l2_async_connection *asc;
-	int ret;
-
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
-	if (!ep)
-		return 0;
-
-	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	fwnode_handle_put(ep);
-	if (ret) {
-		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
-		ret = -EINVAL;
-		goto out;
-	}
-
-	switch (vep.bus_type) {
-	case V4L2_MBUS_PARALLEL:
-	case V4L2_MBUS_BT656:
-		vin_dbg(vin, "Found %s media bus\n",
-			vep.bus_type == V4L2_MBUS_PARALLEL ?
-			"PARALLEL" : "BT656");
-		vin->parallel.mbus_type = vep.bus_type;
-		vin->parallel.bus = vep.bus.parallel;
-		break;
-	default:
-		vin_err(vin, "Unknown media bus type\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
-				       struct v4l2_async_connection);
-	if (IS_ERR(asc)) {
-		ret = PTR_ERR(asc);
-		goto out;
-	}
-
-	vin->parallel.asc = asc;
-
-	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
-out:
-	fwnode_handle_put(fwnode);
-
-	return ret;
-}
-
 static void rvin_parallel_cleanup(struct rvin_dev *vin)
 {
 	v4l2_async_nf_unregister(&vin->notifier);
-- 
2.49.0


