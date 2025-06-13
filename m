Return-Path: <linux-media+bounces-34778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ACDAD9172
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 227F93BC1A5
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38991F463A;
	Fri, 13 Jun 2025 15:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VEnO3me7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FVUQga1M"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061051F2BBB;
	Fri, 13 Jun 2025 15:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828927; cv=none; b=EuVWWE731Vc6zP1B+vw3cScChGTkXFGhFrsvLMXXc0WQdr+p0tGoqOBpfueky+aLbivblY2DPsgmU429C2P0G/+GFcm5xFJgjm+QAheRiyKM3561M1VVWpo3kWhU1RIq+MSHcpcrezMGZyLxrzXL/rgP79h61VA8KSP8VM1bfJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828927; c=relaxed/simple;
	bh=B1KA1CWuPmXQr7WlalnFB+ix9D3dyFYvfBRxygIGR18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dgUo+MBAO3N6pL06Azx/oH2wMEqgqPg+htFSTd+3eMD0AOwFTZxD7Swt4TzRh3/PDE4524xNXXGFImRPOETqhRFzS5+6iCZ3bCGiIzFpYUSzhH2u2cv3YQGCZ5Xzy5viQ4d7YKTUO819Uaj1Z1KPdcQY3zuhXcKysoCi8mnnCUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VEnO3me7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FVUQga1M; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 3ECB1138036F;
	Fri, 13 Jun 2025 11:35:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 13 Jun 2025 11:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828924;
	 x=1749915324; bh=chHCNzPjacXuJKr1qCisZNP8DHH6tv5domVME5ATCw4=; b=
	VEnO3me7nlmEb5nNjBlsckc15Y/R+3hueQbJLBWm/xJoq6hwYxafBuLBQqfHniT5
	2qgMf8V/TbgfIfLvaZ1V1L7QXRautaxnZkZ3+yEUQFXD4mtApjjKbffRWZQ/X4fl
	woxIou0Ex3s2cKBo1ymfuM6Bm30YHYVLWv5VgXFr2V+BbKyH+ypAxqjEl7u9aOAr
	svl+NjezV/SPLfkBthmfh378eCUI2z7dLXRegQn+80S88onUhIXI/+NSLZ9YDuTu
	pANn3NB/OaxC241dib4VnjxuH3PrtdAbjlWRGzO+C4OQGDZTD8xV9jjN0DDaE+5V
	Rd5AQL8gcYts2d06ZzVIVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828924; x=
	1749915324; bh=chHCNzPjacXuJKr1qCisZNP8DHH6tv5domVME5ATCw4=; b=F
	VUQga1M02DTFCSPP9OyesM/3ZHDNd30Radf3Sc6xHIx5omj/wTIG5CeibjMALEt1
	bhzDUWuh7NmS+PwcQsesw5/eVdrOC0KmSsPRvrpSj6gjqGFX1hsfU5w3vPXlIo5Y
	6UnwNFdp+obhVgQzd6WDP+4JtOqah1YjRbzXyQCmO/yAs3q/fkQA9BMc0cqtwlSD
	c1PY62RoMLCRFHSgLJpDS8R5DxJ+B0nXZjRZbUWxSYAiOGHMi3Ns7TtV2z05nqha
	Zd+NRjVxNTfoipOKQdJUBoN1smj3brZCnOPw94WWl/NLD37KJNoCvnEzjUEEvxzU
	ILBUSg/9FrHfzqEYQozdA==
X-ME-Sender: <xms:PEVMaCOHNdEatt_qEW8Kzv3-3U7QvQ5Inz5EnfAEzWVA2S0yb3sGug>
    <xme:PEVMaA8YbmHggH4ASihaAeurMv1LD-b8gv0NMFzERSZc_XMFDqRtrfBrizPghXsRk
    b9MDgpTv9V_S9Dc8a8>
X-ME-Received: <xmr:PEVMaJQQsoylD3ICkwtQjIvgfy0MiVfT1h0EZMMVoQjHAU5s__GRKcL-5kccd9pu_xGINQm7Q6pf7itpdBN7a-B2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:PEVMaCtzCchRqC2jKpFRCDRaj8RWJTQRQ1G4jnFJm2y52vdkKJjcMw>
    <xmx:PEVMaKdvZltCpN-5JUcmkzc0JzgbAbmzD_Tn5Cldi_6ygIki8KuAAQ>
    <xmx:PEVMaG0wyDNktc4pftiGOOgH_svCvxG6_nQhu5ZN9jXj06Cru6cZFQ>
    <xmx:PEVMaO8d2IS3o4eG0I33mpCvW_iXXkRJWbeFUntPFJqp6DH181vSTQ>
    <xmx:PEVMaB7XuxQkUX3yxTezUhgMaP_u5QNr528UZ9-T6DZlIjmaOoGxSg2h>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:23 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 08/13] media: rcar-vin: Merge all notifiers
Date: Fri, 13 Jun 2025 17:34:29 +0200
Message-ID: <20250613153434.2001800-9-niklas.soderlund+renesas@ragnatech.se>
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

The VIN usage of v4l-async is complex and stems from organic growth of
the driver of supporting both private local subdevices (Gen2, Gen3) and
subdevices shared between all VIN instances (Gen3 and Gen4).

The driver used a separate notifier for each VIN for the private local
ones, and a shared group notifier for the shared ones. This was complex
and lead to subtle bugs when unbinding and later rebinding subdevices in
one of the notifiers having to handle different edge cases depending on
if it also had subdevices in the other notifiers etc.

To simplify this have the Gen2 devices allocate and form a VIN group
too. This way all subdevices on all models can be collect in a
single group notifier. Then there is only a single complete callback for
all where the video devices and subdevice nodes can be registered etc.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- Fix spelling in comment.

* Changes since v4
- Fix spelling in commit message and comments.
- Use mutex guard to simplify error path.
- Fix code style, add braces and blank lines.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 256 ++++++++----------
 .../platform/renesas/rcar-vin/rcar-vin.h      |   2 -
 2 files changed, 106 insertions(+), 152 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 28070ada7f60..b3558c3c44d1 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -43,6 +43,9 @@
 
 #define v4l2_dev_to_vin(d)	container_of(d, struct rvin_dev, v4l2_dev)
 
+static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
+					  struct v4l2_subdev *subdev);
+
 /* -----------------------------------------------------------------------------
  * Gen3 Group Allocator
  */
@@ -233,7 +236,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin->group);
+	if (vin->group->link_setup)
+		return vin->group->link_setup(vin->group);
+
+	return  0;
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -241,20 +247,32 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 				     struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
+	struct rvin_group *group = vin->group;
 
-	for (i = 0; i < RCAR_VIN_NUM; i++)
-		if (vin->group->vin[i])
-			rvin_v4l2_unregister(vin->group->vin[i]);
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		if (group->vin[i])
+			rvin_v4l2_unregister(group->vin[i]);
+	}
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
-		if (vin->group->remotes[i].asc != asc)
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
 			continue;
-		vin->group->remotes[i].subdev = NULL;
+
+		group->vin[i]->parallel.subdev = NULL;
+
+		vin_dbg(group->vin[i], "Unbind parallel subdev %s\n",
+			subdev->name);
+	}
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++) {
+		if (group->remotes[i].asc != asc)
+			continue;
+
+		group->remotes[i].subdev = NULL;
+
 		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
-		break;
 	}
 
 	mutex_unlock(&vin->group->lock);
@@ -267,21 +285,38 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
+	struct rvin_group *group = vin->group;
 
-	mutex_lock(&vin->group->lock);
+	guard(mutex)(&group->lock);
 
-	for (i = 0; i < ARRAY_SIZE(vin->group->remotes); i++) {
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		int ret;
+
+		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
+			continue;
+
+		ret = rvin_parallel_subdevice_attach(group->vin[i], subdev);
+		if (ret)
+			return ret;
+
+		v4l2_set_subdev_hostdata(subdev, group->vin[i]);
+
+		vin_dbg(group->vin[i], "Bound subdev %s\n", subdev->name);
+
+		return 0;
+	}
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
+
 		vin->group->remotes[i].subdev = subdev;
 		vin_dbg(vin, "Bound %s to slot %u\n", subdev->name, i);
-		break;
+
+		return 0;
 	}
 
-	mutex_unlock(&vin->group->lock);
-
-	return 0;
+	return -ENODEV;
 }
 
 static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
@@ -371,7 +406,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 	}
 
 	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
+	asc = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
 				       struct v4l2_async_connection);
 	if (IS_ERR(asc))
 		return PTR_ERR(asc);
@@ -417,6 +452,12 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 		if (!(vin_mask & BIT(i)))
 			continue;
 
+		/* Parse local subdevice. */
+		ret = rvin_parallel_parse_of(vin->group->vin[i]);
+		if (ret)
+			return ret;
+
+		/* Parse shared subdevices. */
 		for (id = 0; id < max_id; id++) {
 			if (vin->group->remotes[id].asc)
 				continue;
@@ -596,124 +637,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
 	return 0;
 }
 
-static void rvin_parallel_subdevice_detach(struct rvin_dev *vin)
-{
-	rvin_v4l2_unregister(vin);
-	vin->parallel.subdev = NULL;
-
-	if (!vin->info->use_mc)
-		rvin_free_controls(vin);
-}
-
-static int rvin_parallel_notify_complete(struct v4l2_async_notifier *notifier)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	struct media_entity *source;
-	struct media_entity *sink;
-	int ret;
-
-	ret = v4l2_device_register_subdev_nodes(&vin->v4l2_dev);
-	if (ret < 0) {
-		vin_err(vin, "Failed to register subdev nodes\n");
-		return ret;
-	}
-
-	if (!video_is_registered(&vin->vdev)) {
-		ret = rvin_v4l2_register(vin);
-		if (ret < 0)
-			return ret;
-	}
-
-	if (!vin->info->use_mc)
-		return 0;
-
-	/* If we're running with media-controller, link the subdevs. */
-	source = &vin->parallel.subdev->entity;
-	sink = &vin->vdev.entity;
-
-	ret = media_create_pad_link(source, vin->parallel.source_pad,
-				    sink, vin->parallel.sink_pad, 0);
-	if (ret)
-		vin_err(vin, "Error adding link from %s to %s: %d\n",
-			source->name, sink->name, ret);
-
-	return ret;
-}
-
-static void rvin_parallel_notify_unbind(struct v4l2_async_notifier *notifier,
-					struct v4l2_subdev *subdev,
-					struct v4l2_async_connection *asc)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-
-	vin_dbg(vin, "unbind parallel subdev %s\n", subdev->name);
-
-	mutex_lock(&vin->lock);
-	rvin_parallel_subdevice_detach(vin);
-	mutex_unlock(&vin->lock);
-}
-
-static int rvin_parallel_notify_bound(struct v4l2_async_notifier *notifier,
-				      struct v4l2_subdev *subdev,
-				      struct v4l2_async_connection *asc)
-{
-	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	int ret;
-
-	mutex_lock(&vin->lock);
-	ret = rvin_parallel_subdevice_attach(vin, subdev);
-	mutex_unlock(&vin->lock);
-	if (ret)
-		return ret;
-
-	v4l2_set_subdev_hostdata(subdev, vin);
-
-	vin_dbg(vin, "bound subdev %s source pad: %u sink pad: %u\n",
-		subdev->name, vin->parallel.source_pad,
-		vin->parallel.sink_pad);
-
-	return 0;
-}
-
-static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
-	.bound = rvin_parallel_notify_bound,
-	.unbind = rvin_parallel_notify_unbind,
-	.complete = rvin_parallel_notify_complete,
-};
-
-static void rvin_parallel_cleanup(struct rvin_dev *vin)
-{
-	v4l2_async_nf_unregister(&vin->notifier);
-	v4l2_async_nf_cleanup(&vin->notifier);
-}
-
-static int rvin_parallel_init(struct rvin_dev *vin)
-{
-	int ret;
-
-	v4l2_async_nf_init(&vin->notifier, &vin->v4l2_dev);
-
-	ret = rvin_parallel_parse_of(vin);
-	if (ret)
-		return ret;
-
-	if (!vin->parallel.asc)
-		return -ENODEV;
-
-	vin_dbg(vin, "Found parallel subdevice %pOF\n",
-		to_of_node(vin->parallel.asc->match.fwnode));
-
-	vin->notifier.ops = &rvin_parallel_notify_ops;
-	ret = v4l2_async_nf_register(&vin->notifier);
-	if (ret < 0) {
-		vin_err(vin, "Notifier registration failed\n");
-		v4l2_async_nf_cleanup(&vin->notifier);
-		return ret;
-	}
-
-	return 0;
-}
-
 /* -----------------------------------------------------------------------------
  * CSI-2
  */
@@ -888,11 +811,52 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	return 0;
 }
 
+static int rvin_parallel_setup_links(struct rvin_group *group)
+{
+	u32 flags = MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
+
+	guard(mutex)(&group->lock);
+
+	/* If the group also has links don't enable the link. */
+	for (unsigned int i = 0; i < ARRAY_SIZE(group->remotes); i++) {
+		if (group->remotes[i].subdev) {
+			flags = 0;
+			break;
+		}
+	}
+
+	/* Create links. */
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		struct rvin_dev *vin = group->vin[i];
+		struct media_entity *source;
+		struct media_entity *sink;
+		int ret;
+
+		/* Nothing to do if there is no VIN or parallel subdev. */
+		if (!vin || !vin->parallel.subdev)
+			continue;
+
+		source = &vin->parallel.subdev->entity;
+		sink = &vin->vdev.entity;
+
+		ret = media_create_pad_link(source, vin->parallel.source_pad,
+					    sink, 0, flags);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rvin_csi2_setup_links(struct rvin_group *group)
 {
 	const struct rvin_group_route *route;
 	unsigned int id;
-	int ret = -EINVAL;
+	int ret;
+
+	ret = rvin_parallel_setup_links(group);
+	if (ret)
+		return ret;
 
 	/* Create all media device links between VINs and CSI-2's. */
 	mutex_lock(&group->lock);
@@ -923,9 +887,7 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
 
 static void rvin_csi2_cleanup(struct rvin_dev *vin)
 {
-	rvin_parallel_cleanup(vin);
 	rvin_group_notifier_cleanup(vin);
-	rvin_group_put(vin);
 	rvin_free_controls(vin);
 }
 
@@ -946,18 +908,11 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret)
 		goto err_controls;
 
-	/* It's OK to not have a parallel subdevice. */
-	ret = rvin_parallel_init(vin);
-	if (ret && ret != -ENODEV)
-		goto err_group;
-
 	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
 	if (ret)
-		goto err_parallel;
+		goto err_group;
 
 	return 0;
-err_parallel:
-	rvin_parallel_cleanup(vin);
 err_group:
 	rvin_group_put(vin);
 err_controls:
@@ -1018,7 +973,6 @@ static int rvin_isp_setup_links(struct rvin_group *group)
 static void rvin_isp_cleanup(struct rvin_dev *vin)
 {
 	rvin_group_notifier_cleanup(vin);
-	rvin_group_put(vin);
 	rvin_free_controls(vin);
 }
 
@@ -1432,7 +1386,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		    rvin_group_id_to_master(vin->id) == vin->id)
 			vin->scaler = vin->info->scaler;
 	} else {
-		ret = rvin_parallel_init(vin);
+		ret = rvin_group_get(vin, NULL, NULL);
+		if (!ret)
+			ret = rvin_group_notifier_init(vin, 0, 0);
 
 		if (vin->info->scaler)
 			vin->scaler = vin->info->scaler;
@@ -1466,8 +1422,8 @@ static void rcar_vin_remove(struct platform_device *pdev)
 		rvin_isp_cleanup(vin);
 	else if (vin->info->use_mc)
 		rvin_csi2_cleanup(vin);
-	else
-		rvin_parallel_cleanup(vin);
+
+	rvin_group_put(vin);
 
 	rvin_id_put(vin);
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index cb8e8fa54f96..38ae2bd20b72 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -149,7 +149,6 @@ struct rvin_info {
  * @vdev:		V4L2 video device associated with VIN
  * @v4l2_dev:		V4L2 device
  * @ctrl_handler:	V4L2 control handler
- * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @parallel:		parallel input subdevice descriptor
  *
@@ -189,7 +188,6 @@ struct rvin_dev {
 	struct video_device vdev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
-	struct v4l2_async_notifier notifier;
 
 	struct rvin_parallel_entity parallel;
 
-- 
2.49.0


