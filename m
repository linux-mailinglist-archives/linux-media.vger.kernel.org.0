Return-Path: <linux-media+bounces-31950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD894AADBB1
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B401E7B59C8
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7695820ADE6;
	Wed,  7 May 2025 09:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="m2J9qhec";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eDGUAtIU"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3D207A08;
	Wed,  7 May 2025 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610899; cv=none; b=dFf++HWwZHroY5Lrqmx/L7TJGQA0D25fc2uRUNSGoYO2PvZKPK73uwsFwBkAmI0wPSl4PDWOGmy7Jky4Lb5y0RITPnf5m95q3O1rjWhRBn4MeY9yoUOp1QNGJXebcoLXA3i02UDIrgvKr2FseePmfVJx9eAL0CcMOluNMs9aNnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610899; c=relaxed/simple;
	bh=CLb92h7S99kkzbi4EBEuisrOk9Lus+5OKYqNVub4etw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pjh1DKGJlm/OOWco/N2TbtvzG8z0LAMclegXSYpoamqeUfC5UTT3PwZMDwMdw+HRilwbVqazcHNWoJE2EHmalNX/OESCmLZ8N1bx0lo29IiMnYkTTxTVb+dAqoy7YEZ1JgjT6X+592k1XEfQIrbWLQTZ71XtX4KZnkaUF8GLDCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=m2J9qhec; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eDGUAtIU; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ACB821140109;
	Wed,  7 May 2025 05:41:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 May 2025 05:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746610896;
	 x=1746697296; bh=tTe31kg1OJcm/eWdo/mIKai3suS5If4lMIbNtLI6454=; b=
	m2J9qheckKChvdqCUmlr36ELL6E7LdLlYsLQBvti3RVZXMCGQjkgbLXDnclOsAw9
	jDc84IpSb01NRe5l1Gy/95QeoEWX3FkG8+p0Dy3bSQHHHcDo4Yuk/6j7hKXNxMaR
	GW5KWxNUDyPjbWwIR083pYNtWa+kyqTqtoYZvdDOAzZKjQZObZP3uog5qppLU7m6
	c9YD018zWK57sMyf4fEZ/Nf8IApGqJyV522lWA3lrF+GZxtKrj50SZXqAyxDXC5b
	iM1Gobc6u1EQQ+jYtTMvTUI+FvayEptD1gNB3dsWfD4W79aPxaD00ddkDQBBMEY/
	2+u1NSsg2ww/xJo/SY2SPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746610896; x=
	1746697296; bh=tTe31kg1OJcm/eWdo/mIKai3suS5If4lMIbNtLI6454=; b=e
	DGUAtIU5fgxESo2sQaN5PjvyuFIOwmZoCeP87KBG4VlpefzP8qj4r3doBHu0M8v/
	XwW2rfhp3jmrRywNKwlGtbg+MOeL5Y2OqfkwcpWSmID67dzYIEJRb6oZozScPD85
	HCnrqOHCyoQzCavpJL+gB8KuZHevUgBhJmAoTstutHdcVuoedHk751qcjVgCsqcu
	faucMKX/e5jn/o/1kQkFTvCifQoHF1nUPJFMB9EkqCX8Yx3a7YSzfZ5u/pJ5X9Gr
	0IwvHJY+F/Yrb6dxFCruBe2WF6tdTUNvc80Czyb8Bwi8hDGLog4mQhOtTB0DyWPh
	9kl4IRbcrp+3aBG7HpYgw==
X-ME-Sender: <xms:0CobaI0lmv858oSif0Cwo2P-GmfC33iKIqsFu-nCX8-DHAywiBPDVQ>
    <xme:0CobaDHHUH5XCH4AzuTFcoUtjxS3R2FTnWQpd388H-fjDbMQBQLnPfGvn0OLJcG6X
    jzpmmNVI_ljLRAHBfc>
X-ME-Received: <xmr:0CobaA4u53EBFcPGUFxEMw03iFGyh0-JU1PbWl2Zydu3lFR1GzqXejt4X9dH0tn03-md4NCiREUd6qK8vRrjjWUO>
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
X-ME-Proxy: <xmx:0CobaB2cmhATQYVzIgWQyOlKQxFZDHVjHjvpl7epqbK6FDH-GOghuw>
    <xmx:0CobaLFKFkdwOWTbgn0Sj9lST07ReBNIOqzbc3Kz-oeT03lc5CaSgw>
    <xmx:0CobaK9vqyXuDiJjxhGpLTCUbHRpnkmcF8oj-Uf4ogJe-yrVqMDexw>
    <xmx:0CobaAlZRzrZI8FgZLmcWEKX8kfYTld6V2PqmB7aDxZxbryNlcrhvg>
    <xmx:0CobaFE_f4ALu_2NdvU53wO-DcbaeEnWqehj28UYprHWY-Lw9m_0ypuO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 05:41:35 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 5/6] media: rcar-vin: Merge all notifiers
Date: Wed,  7 May 2025 11:40:13 +0200
Message-ID: <20250507094014.622087-6-niklas.soderlund+renesas@ragnatech.se>
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
index bff79534492e..f05a30bac608 100644
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
@@ -1446,7 +1411,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 		    rvin_group_id_to_master(vin->id) == vin->id)
 			vin->scaler = vin->info->scaler;
 	} else {
-		ret = rvin_parallel_init(vin);
+		ret = rvin_group_get(vin, NULL, NULL);
+		if (!ret)
+			ret = rvin_group_notifier_init(vin, 0, 0);
 
 		if (vin->info->scaler)
 			vin->scaler = vin->info->scaler;
@@ -1476,8 +1443,6 @@ static void rcar_vin_remove(struct platform_device *pdev)
 		rvin_isp_cleanup(vin);
 	else if (vin->info->use_mc)
 		rvin_csi2_cleanup(vin);
-	else
-		rvin_parallel_cleanup(vin);
 
 	rvin_id_put(vin);
 
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 142a39718208..26b43959b685 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -148,7 +148,6 @@ struct rvin_info {
  * @vdev:		V4L2 video device associated with VIN
  * @v4l2_dev:		V4L2 device
  * @ctrl_handler:	V4L2 control handler
- * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @parallel:		parallel input subdevice descriptor
  *
@@ -188,7 +187,6 @@ struct rvin_dev {
 	struct video_device vdev;
 	struct v4l2_device v4l2_dev;
 	struct v4l2_ctrl_handler ctrl_handler;
-	struct v4l2_async_notifier notifier;
 
 	struct rvin_parallel_entity parallel;
 
-- 
2.49.0


