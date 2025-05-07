Return-Path: <linux-media+bounces-31948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC355AADBA6
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 11:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82E8C9840D1
	for <lists+linux-media@lfdr.de>; Wed,  7 May 2025 09:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6E8200BA1;
	Wed,  7 May 2025 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="PDvEPtpJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Mb8sUAgQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB21FCCF8;
	Wed,  7 May 2025 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610895; cv=none; b=T8c1nprwChpgdwp2mJKB564ZJp/wbTDS6QgtTlds9FD+9VUJomEgSAiezj3YqiG0fEbpXK1yA5Oey7nRiBgPKeoSbBd6oxNLf8unLWRW61kHDeEe0RD856eZv9ZMENsV87JLntzgVx2ibAFgvbpiME0YGlj9o/tGXo4U7Niwtag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610895; c=relaxed/simple;
	bh=2KEIXtW3RAEied8li8L5GahbTAhnqFaVh4NYAYJiNYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtRmuKoq/4sourrIEiAjldXocU9L8H2fjJErbtWU2jxxogW9ASbN35TXU+snEMRg0eg5izg/d+34gf1Q2v97wFy0/iWsk4972svljylu37pVc9DVxMwcLsj4ZhoVcc4y+wlM0bCq5cENcoe5m2Xfz0ESZ0gqA4hCb+qgdgL+K00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=PDvEPtpJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Mb8sUAgQ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id B95401380158;
	Wed,  7 May 2025 05:41:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 07 May 2025 05:41:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746610892;
	 x=1746697292; bh=dHiI25kV2MCybZIKt4lZNi07qoY5an/2iWbMETpsqJE=; b=
	PDvEPtpJi2AN/2yNLvWSBjnvr26lA8rGfwe43dY4QL8CBX03aWx37rS7zGoQphIz
	ob0Cfr0QX2DxRwcGEhImemolYfcNSIsq7iASoU9dokl+jSGlNxq2P7biyvM0CNP/
	p9/b2VwZsx333lmYlgA7DrtZXF1R3ZuUTy/U21V5csB3kALlwrQWb4AYQbj7RsZ4
	t0Yqgkqb6D7Kus/xqMY46XFE/yJBEmXjcWx95DCzgEGfOx9oZzAqL978OfieXmiI
	4Hy6koLYzh62FKme5HjcjeAniTSm0cD10JYmQJ3Zx9hf1a4tDZq9t/2zOk1fIjyg
	OHIhbZucyqla1nym5lCoIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746610892; x=
	1746697292; bh=dHiI25kV2MCybZIKt4lZNi07qoY5an/2iWbMETpsqJE=; b=M
	b8sUAgQtCAHgioNjd5le3CaeIRbnPfNkTq6SeMcY4iypuoIlSldnGUnFHCyMFj/w
	MuZx5pIp21MBIUXcW3bp+1WKSd6/kuxf8UHVH8jHHKvqnEvuV4a0abUmpLkCDn7H
	eSkmVJ2SvmMrf9NuNWQmAKI2uGtqgIKv0VhRAj8eT+eGJwyI4xu2x9MDder51Mos
	3Kp7aXzPOWSOYyft9PJp4N4A0hK/zUDj/e/42iozYa7HcsMHK6FRTPiEFQWsnpwv
	AvvFytnTzLHGrhweRs4A18XQjHEOf2DQWsYociGSRGRWEt4w9aAiSMoq0aMgO2nQ
	dfXk2/GNs6u8wCmeeKvaA==
X-ME-Sender: <xms:zCobaHHQZTsw0OFrvY7R_gbzC7jr5oyX-ACv9rfwPAs0W22bRcTA6w>
    <xme:zCobaEViwTGK47zZ18D12pXYXlUW9Jsr3-HCKFvhRW2r_U_LCWvPuTuyghKX2Htcp
    AEW83Ky_zz0Zl0_M3g>
X-ME-Received: <xmr:zCobaJItnVLxf-3Aqa9Y8clwGSWGOeaS5VROxlCeFhsGlBff6SQECbgpSTCjTpSOWwJJ6rVN2Keloz0-sn81fyKY>
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
X-ME-Proxy: <xmx:zCobaFH_WEejs1Vg7dV7O2kUxVZ2Qb5d7x7mdKAs9SUgUcZVPwleuQ>
    <xmx:zCobaNU_Ny9FuGSIbc6o7mc6VCW9WHtYnwHy92kESJxhGjJrredGSQ>
    <xmx:zCobaAMoIs3Q62jYL3iSmbp2H24jw38vNEd2qLoMyx_618Cf72TWWQ>
    <xmx:zCobaM1M3_Z9lZNDedglpOO-F0vY34gAoZbEU9Y-Yh3-P3LYgScvMg>
    <xmx:zCobaIX2hRG4yV0WdtsaSDoI6SS19JheCBpn6wNy1Ntwx4dhQlmcRt6T>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 05:41:32 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 3/6] media: rcar-vin: Generate a VIN group ID for Gen2
Date: Wed,  7 May 2025 11:40:11 +0200
Message-ID: <20250507094014.622087-4-niklas.soderlund+renesas@ragnatech.se>
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

Prepare to move Gen2 and earlier models to media controller by
generating a unique VIN group id for each VIN instance. On Gen3 and Gen4
it is important to have a specific id in the group as media graph routes
depend on this. On Gen2 and earlier models all that will matter is to
have a unique id in the range.

Break out the id generation to a own function keeping the logic for Gen3
and Gen4 while generating a sequential id for Gen2 models.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Move ID allocation to probe.
- Use ida_alloc_range() instead of implementing our own schema by
  counting DT nodes.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 76 ++++++++++++++-----
 1 file changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 54b3957be705..62e17ef5bdea 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -10,6 +10,7 @@
  * Based on the soc-camera rcar_vin driver
  */
 
+#include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -55,6 +56,7 @@
  * be only one group for all instances.
  */
 
+static DEFINE_IDA(rvin_ida);
 static DEFINE_MUTEX(rvin_group_lock);
 static struct rvin_group *rvin_group_data;
 
@@ -119,23 +121,8 @@ static int rvin_group_get(struct rvin_dev *vin,
 			  const struct media_device_ops *ops)
 {
 	struct rvin_group *group;
-	u32 id;
 	int ret;
 
-	/* Make sure VIN id is present and sane */
-	ret = of_property_read_u32(vin->dev->of_node, "renesas,id", &id);
-	if (ret) {
-		vin_err(vin, "%pOF: No renesas,id property found\n",
-			vin->dev->of_node);
-		return -EINVAL;
-	}
-
-	if (id >= RCAR_VIN_NUM) {
-		vin_err(vin, "%pOF: Invalid renesas,id '%u'\n",
-			vin->dev->of_node, id);
-		return -EINVAL;
-	}
-
 	/* Join or create a VIN group */
 	mutex_lock(&rvin_group_lock);
 	if (rvin_group_data) {
@@ -164,16 +151,15 @@ static int rvin_group_get(struct rvin_dev *vin,
 	/* Add VIN to group */
 	mutex_lock(&group->lock);
 
-	if (group->vin[id]) {
-		vin_err(vin, "Duplicate renesas,id property value %u\n", id);
+	if (group->vin[vin->id]) {
+		vin_err(vin, "Duplicate renesas,id property value %u\n", vin->id);
 		mutex_unlock(&group->lock);
 		kref_put(&group->refcount, rvin_group_release);
 		return -EINVAL;
 	}
 
-	group->vin[id] = vin;
+	group->vin[vin->id] = vin;
 
-	vin->id = id;
 	vin->group = group;
 	vin->v4l2_dev.mdev = &group->mdev;
 
@@ -1375,6 +1361,52 @@ static const struct of_device_id rvin_of_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rvin_of_id_table);
 
+static int rvin_id_get(struct rvin_dev *vin)
+{
+	u32 oid;
+	int id;
+
+	switch (vin->info->model) {
+	case RCAR_GEN3:
+		if (of_property_read_u32(vin->dev->of_node, "renesas,id", &oid))
+			break;
+
+		if (oid < 0 || oid >= RCAR_VIN_NUM) {
+			vin_err(vin, "%pOF: Invalid renesas,id '%u'\n",
+				vin->dev->of_node, oid);
+			return -EINVAL;
+		}
+
+		vin->id = oid;
+
+		return 0;
+	default:
+		id = ida_alloc_range(&rvin_ida, 0, RCAR_VIN_NUM - 1,
+				     GFP_KERNEL);
+		if (id < 0)
+			break;
+
+		vin->id = id;
+
+		return 0;
+	}
+
+	vin_err(vin, "Can't figure out VIN id\n");
+
+	return -EINVAL;
+}
+
+static void rvin_id_put(struct rvin_dev *vin)
+{
+	switch (vin->info->model) {
+	case RCAR_GEN3:
+		break;
+	default:
+		ida_free(&rvin_ida, vin->id);
+		break;
+	}
+}
+
 static int rcar_vin_probe(struct platform_device *pdev)
 {
 	struct rvin_dev *vin;
@@ -1402,6 +1434,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
+	if (rvin_id_get(vin))
+		return -EINVAL;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
@@ -1419,6 +1454,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	if (ret) {
 		rvin_dma_unregister(vin);
+		rvin_id_put(vin);
 		return ret;
 	}
 
@@ -1443,6 +1479,8 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	else
 		rvin_parallel_cleanup(vin);
 
+	rvin_id_put(vin);
+
 	rvin_dma_unregister(vin);
 }
 
-- 
2.49.0


