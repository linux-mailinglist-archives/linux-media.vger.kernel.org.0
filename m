Return-Path: <linux-media+bounces-28380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36BA659B6
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 18:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08C1F188820C
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40ECA1E5208;
	Mon, 17 Mar 2025 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uMmI0rcj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bQdb3yZh"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E71E1E11;
	Mon, 17 Mar 2025 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230792; cv=none; b=sjPNPjGP6p4gGiFvjpywG8aa4ZEWRmdDEwXtN47ZurfnYGJ0t9hnZsPDKJvNXonmbWHPOfUqIZ7d9zQ25BB33XLhnwGujGVhZ+mhJMM5ZoTaNeMJmrlysA2x6z4URX78nnzYfa2KWOT9MLXcOaw0E7jHSnnTLzLnsoWPdL8pY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230792; c=relaxed/simple;
	bh=V+GE6I/TSfO7wbmT38NbMoin6nvsLBuxdEvWFNFvk/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+8iHmTfuL1LnXUPOrfuMUFGdxZz4OtscPRpPkh+ixlQ4+UAbrNyqy1LDWfbBo7RPvqHx193oJWOECT5YYOzU0gliQ/e/SSWloULGEUFB2wtaR2kMWZu+TRDqSQ2235sCm6NoPoByxxm2vg3H645ekHU9ugGkCsYJodmJLuC/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uMmI0rcj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bQdb3yZh; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 7328B114008A;
	Mon, 17 Mar 2025 12:59:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 17 Mar 2025 12:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742230789;
	 x=1742317189; bh=Z3tuW86ORbBe6F3naKWmj7ux2j8k9utV5nAuGIUpi4w=; b=
	uMmI0rcjiKhf90WLZhlSW357HlPPj2Y+O/ZOSau9SJxm5DTQn++mqP9wNUib+cs0
	7Og/qqLRR6zpqpiS8WpJ66NpoUGC7MZvH0M+0b/zYCqMi6fmjvgUT1S+dpbQ+0fs
	EmWgvUsDVgREAuYqySp0bM7NOG9KeJG49LsKqXZm9y87zNj5tTVYQwjv7CNL6SK6
	9CzEYwzu7i8D5fZqrH+R4t7agtO+0OxwDXdxu4AfIiU3vGGxqBBN+7g4c5OAPy9s
	TvXo2gZs1q/PZuohXdKdgTXKU5szqpRfWBV0j3e3ghFTCMFd2Ih1GdLd+AuRA5IB
	LrPh16Q3no/wP3BLL8LngQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742230789; x=
	1742317189; bh=Z3tuW86ORbBe6F3naKWmj7ux2j8k9utV5nAuGIUpi4w=; b=b
	Qdb3yZh75uLPGZSGQdy71e/suE+knN2LgW/jisFldwDYvICNhJ3q34dw2KAy6Yx5
	RHHQEPqbxdV4RNa6nqskfQST+jkZHHNZzwFXZGrSlrlw8CAthVzYdIriZcwWZWzT
	Sf4eglaRstkGQyNovpfm+M37uGjTwLM8Sl22GDRlJjkvtX8snSg7HIfRx5lOMjqw
	5f3spW5s0IywI6mMEWDj8GR5D6TUvikgv9DgIslynGxrUuu0Jr1vMqq8A2unndhp
	3yVs/RI7YdwKYVm2HYohaBiRm0IXSJ+KiY7sFsC1JfWIq3UFl2O99lwpVREBWfr4
	Dq9I7QcU2gdfKYdOspGwQ==
X-ME-Sender: <xms:BVXYZ7qSpFYg_Rf9HdkOAC9Qy26Z7_q_sqOQOZeC8HWshHYMrTeMWA>
    <xme:BVXYZ1qxU5fHkQq0U3VO8cLITd_zHA0QZ_kGlrja24TPuLvhGNI9V7VVQLU8fS3b8
    1qZiTR2Zj_4wYwMypY>
X-ME-Received: <xmr:BVXYZ4O3USK6XOKS90BG9NtpzRFj0W36w9QW8NAGOIvOyyY_CSpnD6lnQ000JZLjbDCS7UCioGv0sISXKiMLt9kzkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedttdeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:BVXYZ-5AUhNgX9mxtYTUQx7L7mdhWa7_bZWbKtrzKlyPWU-1IpCN4A>
    <xmx:BVXYZ649B5zLsW_ig_Py7cfFgMz06G7JKFHSFEJc1xJmo0PAQWKYkQ>
    <xmx:BVXYZ2gzzjHAJ8BFrxOb_3T0hsMMQMtW9H3TDk2amM42zWZsmRyyDw>
    <xmx:BVXYZ87keH1pB27kqe7YWtBhhbpQNdHca_6fnRHHII0u4N8cXdlqHg>
    <xmx:BVXYZxZG1CL7vybOCB90CdHx0Wird1RXScCpjbRfV5umsTl_EusqPfNU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 12:59:48 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 5/6] media: rcar-vin: Merge all notifiers
Date: Mon, 17 Mar 2025 17:59:06 +0100
Message-ID: <20250317165907.2412377-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317165907.2412377-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250317165907.2412377-1-niklas.soderlund+renesas@ragnatech.se>
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
on of the notifiers having to handle different edge cases depending on
if it also had subdevices in the other notifiers etc.

To simplify this have the Gen2 devices allocate and form a VIN group
too. This way all subdevices on all models can be collect in a
single group notifier. Then there is only a single complete callback for
all where the video devices and subdevice nodes can be registered etc.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 263 ++++++++----------
 .../platform/renesas/rcar-vin/rcar-vin.h      |   2 -
 2 files changed, 114 insertions(+), 151 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 5b8b3cd93915..8c63c9904ec9 100644
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
@@ -232,7 +235,10 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin->group);
+	if (vin->group->link_setup)
+		return vin->group->link_setup(vin->group);
+
+	return  0;
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -240,22 +246,31 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 				     struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
+	struct rvin_group *group = vin->group;
 
-	for (i = 0; i < RCAR_VIN_NUM; i++)
-		if (vin->group->vin[i])
-			rvin_v4l2_unregister(vin->group->vin[i]);
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++)
+		if (group->vin[i])
+			rvin_v4l2_unregister(group->vin[i]);
 
 	mutex_lock(&vin->group->lock);
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		if (!group->vin[i] || group->vin[i]->parallel.asc != asc)
+			continue;
+
+		group->vin[i]->parallel.subdev = NULL;
+
+		vin_dbg(group->vin[i], "Unbind parallel subdev %s\n",
+			subdev->name);
+	}
 
-	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
-		if (vin->group->remotes[i].asc != asc)
+	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
+		if (group->remotes[i].asc != asc)
 			continue;
-		vin->group->remotes[i].subdev = NULL;
+
+		group->remotes[i].subdev = NULL;
+
 		vin_dbg(vin, "Unbind %s from slot %u\n", subdev->name, i);
-		break;
 	}
-
 	mutex_unlock(&vin->group->lock);
 
 	media_device_unregister(&vin->group->mdev);
@@ -266,21 +281,38 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asc)
 {
 	struct rvin_dev *vin = v4l2_dev_to_vin(notifier->v4l2_dev);
-	unsigned int i;
+	struct rvin_group *group = vin->group;
 
-	mutex_lock(&vin->group->lock);
+	guard(mutex)(&group->lock);
 
-	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
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
+	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
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
@@ -374,7 +406,7 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 		goto out;
 	}
 
-	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
+	asc = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
 				       struct v4l2_async_connection);
 	if (IS_ERR(asc)) {
 		ret = PTR_ERR(asc);
@@ -424,6 +456,12 @@ static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 		if (!(vin_mask & BIT(i)))
 			continue;
 
+		/* Parse local subdevice. */
+		ret = rvin_parallel_parse_of(vin->group->vin[i]);
+		if (ret)
+			return ret;
+
+		/* Prase shared subdevices. */
 		for (id = 0; id < max_id; id++) {
 			if (vin->group->remotes[id].asc)
 				continue;
@@ -603,124 +641,6 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
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
@@ -895,11 +815,63 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	return 0;
 }
 
+static int rvin_parallel_setup_links(struct rvin_group *group)
+{
+	u32 flags = MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE;
+	int ret = 0;
+
+	mutex_lock(&group->lock);
+	/* If the group also have links don't enable the link. */
+	for (unsigned int i = 0; i < RVIN_REMOTES_MAX; i++) {
+		if (group->remotes[i].subdev) {
+			flags = 0;
+			break;
+		}
+	}
+
+	/* Create links */
+	for (unsigned int i = 0; i < RCAR_VIN_NUM; i++) {
+		struct rvin_dev *vin = group->vin[i];
+		struct media_entity *source;
+		struct media_entity *sink;
+
+		/* Noting to do if their is no VIN or parallel subdev. */
+		if (!vin || !vin->parallel.subdev)
+			continue;
+
+		source = &vin->parallel.subdev->entity;
+		sink = &vin->vdev.entity;
+
+		ret = media_create_pad_link(source, vin->parallel.source_pad,
+					    sink, 0, flags);
+		if (ret)
+			break;
+	}
+	mutex_unlock(&group->lock);
+
+	return ret;
+}
+
 static int rvin_csi2_setup_links(struct rvin_group *group)
 {
 	const struct rvin_group_route *routes, *route;
 	unsigned int id;
-	int ret = -EINVAL;
+	int ret;
+
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
+	ret = rvin_parallel_setup_links(group);
+	if (ret)
+		return ret;
 
 	/* Find any VIN in group to get route info. */
 	routes = NULL;
@@ -914,6 +886,7 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
 
 	/* Create all media device links between VINs and CSI-2's. */
 	mutex_lock(&group->lock);
+	ret = -EINVAL;
 	for (route = routes; route->chsel; route++) {
 		/* Check that VIN' master is part of the group. */
 		if (!group->vin[route->master])
@@ -941,7 +914,6 @@ static int rvin_csi2_setup_links(struct rvin_group *group)
 
 static void rvin_csi2_cleanup(struct rvin_dev *vin)
 {
-	rvin_parallel_cleanup(vin);
 	rvin_group_notifier_cleanup(vin);
 	rvin_group_put(vin);
 	rvin_free_controls(vin);
@@ -964,18 +936,11 @@ static int rvin_csi2_init(struct rvin_dev *vin)
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
@@ -1448,7 +1413,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		    rvin_group_id_to_master(vin->id) == vin->id)
 			vin->scaler = vin->info->scaler;
 	} else {
-		ret = rvin_parallel_init(vin);
+		ret = rvin_group_get(vin, NULL, NULL);
+		if (!ret)
+			ret = rvin_group_notifier_init(vin, 0, 0);
 
 		if (vin->info->scaler)
 			vin->scaler = vin->info->scaler;
@@ -1478,8 +1445,6 @@ static void rcar_vin_remove(struct platform_device *pdev)
 		rvin_isp_cleanup(vin);
 	else if (vin->info->use_mc)
 		rvin_csi2_cleanup(vin);
-	else
-		rvin_parallel_cleanup(vin);
 
 	rvin_id_put(vin);
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 1131d43e38e3..47253de5681c 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -181,7 +181,6 @@ struct rvin_info {
  * @vdev:		V4L2 video device associated with VIN
  * @v4l2_dev:		V4L2 device
  * @ctrl_handler:	V4L2 control handler
- * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @parallel:		parallel input subdevice descriptor
  *
@@ -221,7 +220,6 @@ struct rvin_dev {
 	struct video_device vdev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
-	struct v4l2_async_notifier notifier;
 
 	struct rvin_parallel_entity parallel;
 
-- 
2.48.1


