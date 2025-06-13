Return-Path: <linux-media+bounces-34775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F141AD916A
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D66416B684
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B56321F237D;
	Fri, 13 Jun 2025 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eWJ+Vjpa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dIrnVyzt"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382771F0E24;
	Fri, 13 Jun 2025 15:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828921; cv=none; b=o9kZAiL7XZZlcbf8flL+l12X6XbaGBciIt20BXnZYQ39l+48WxN5yT/msjmVgXHC1Awz7ayCIiN7HovuxvrZcBpF3JVbZz7oc3y6+iRFii7bUdUaek3uy2w9H7WEUIJL26+jelF9JE2z5Ub7KvbE9z5MRYD+1ql9toRojFrnu0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828921; c=relaxed/simple;
	bh=DjbK0hx5kdiGo09mhyo5FRI+jR1TamHKVkHl2lObSiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iog+R4NzNqbsZppQuOe/Zb4k5jtfSrQj2gDvGxH2LDTZdDP65uI9EM1gf+QIHy+Z5RgeZhg2DE1PANkdUdf5sDtbAKg9ysGoCx2kXuPhdzzHbK7g/0MHFl768KiCe+JVhFztoYf6MvHJkqQgbzNfTemuBQ+PLM50P4XEPcLjDDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eWJ+Vjpa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dIrnVyzt; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 7E420138036F;
	Fri, 13 Jun 2025 11:35:18 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 13 Jun 2025 11:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828918;
	 x=1749915318; bh=YM3pHD+uDc4H70r5x/NybXG84VCSo70vnrMCbmKLsec=; b=
	eWJ+VjpaJ9otRvp6/nojv9ota410DjE9/WhpgsUacwrWJdmlSxqauQMHuhycmAu2
	d4eFo7j+GRkBCT1WiWAUq60sPqASA1pJmCY5GgKcr2j+1jCt6dzjV9YfEyUJBDv9
	6avp7BseBKXzz3NLbHIjRKTxPhe6iG9LGWzMrOaBD7GFc9eZBDRx2FAzkrkmFLH/
	biYO9zTdRnrQmP16gOycLo3QXZFKMbAB6ZmNVceorVGKrw0KYOd6O40i0xStPfQI
	SJkWfhfrfV3hK4YvmqsqknHAopAEbjjVeohbigkKLHiRNnlFfpJreZeUq9njtFyp
	K5rWWu/IqBOCFTEIMCSF9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828918; x=
	1749915318; bh=YM3pHD+uDc4H70r5x/NybXG84VCSo70vnrMCbmKLsec=; b=d
	IrnVyztD2A0bOrYUa+3fk0TjxVmxaokwZX3dca2ERinnvyYst8zr+G0jO6ThQUZ0
	5pLSVWimwNxV0bPzpbLq9uTj51+MC5aRVcb9Qr5dpzfxvQ9yB5x52wH3kstKmkTy
	qod0pMOehCpjMg5B1YCUl+ZaKywLauMLVbl52X4/GOKX4Nc7hkAwnT/YVcgZlnla
	VzsRJew4vcssHodJZn5ERizNFIpvpsgkzWkfHkYlYBaigKAgKqGzP1BltG7mdsO2
	CLqyYYzSXpbZNNTx8NFRuSn7hKvvSp8bY5Jwg/NuAwgZRPHiR1We+YBHaXNgUUwX
	Q0pxOlwKXT8lB8shuN7Dg==
X-ME-Sender: <xms:NkVMaN5LOdcsvJEdWNiZ3x9X1PwFXY2PyG4FCXtqCBafOn0wKIbQ2A>
    <xme:NkVMaK7dLNoMx6FmigwQR2HEq70zWCoDS53XCqUP1ZwLNyzS-K2XtOz3fJJIWQHI8
    umScja9a9UgkQRDfsM>
X-ME-Received: <xmr:NkVMaEcPDWygZ4jzUaDlFqlDq698-IbD-ZfMdi0PvnXMvT38E0bn-VxNBDhiPdP0IGvf8K1xyZPLUGiXRhGmEtwl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:NkVMaGK3oKnAZU1UproisKOfr8t60rOT232povrZq8KOb8MzbVPtxw>
    <xmx:NkVMaBLly-QT87R3SK-ir7bjvGe4gU11HtB0rwmHQuwHIBTANUIDJg>
    <xmx:NkVMaPxQHeS7EBTFbXgUDYd5NZ-IPdalFU_ILu7_VdsR3ZCtbNGfrA>
    <xmx:NkVMaNJ0KxovgtR05ifOuXtuevNZfW_rg35z7JLtsqih5qyNN91zWQ>
    <xmx:NkVMaIkv9IkWY458FrQcRWi7-7oI-5R6x64VLy-Q1adBDK0NlQA0uaID>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:17 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 05/13] media: rcar-vin: Generate a VIN group ID for Gen2
Date: Fri, 13 Jun 2025 17:34:26 +0200
Message-ID: <20250613153434.2001800-6-niklas.soderlund+renesas@ragnatech.se>
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

Prepare to move Gen2 and earlier models to media controller by
generating a unique VIN group id for each VIN instance. On Gen3 and Gen4
it is important to have a specific id in the group as media graph routes
depend on this. On Gen2 and earlier models all that will matter is to
have a unique id in the range.

Break out the id generation to a own function keeping the logic for Gen3
and Gen4 while generating a sequential id for Gen2 models.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- Add explicit error messages for error cases getting a group ID.

* Changes since v1
- Move ID allocation to probe.
- Use ida_alloc_range() instead of implementing our own schema by
  counting DT nodes.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 85 ++++++++++++++-----
 1 file changed, 65 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 59751ec23a15..55957dd95576 100644
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
@@ -165,16 +152,15 @@ static int rvin_group_get(struct rvin_dev *vin,
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
 
@@ -1363,6 +1349,56 @@ static const struct of_device_id rvin_of_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rvin_of_id_table);
 
+static int rvin_id_get(struct rvin_dev *vin)
+{
+	u32 oid;
+	int id;
+
+	switch (vin->info->model) {
+	case RCAR_GEN3:
+	case RCAR_GEN4:
+		if (of_property_read_u32(vin->dev->of_node, "renesas,id", &oid)) {
+			vin_err(vin, "%pOF: No renesas,id property found\n",
+				vin->dev->of_node);
+			return -EINVAL;
+		}
+
+		if (oid < 0 || oid >= RCAR_VIN_NUM) {
+			vin_err(vin, "%pOF: Invalid renesas,id '%u'\n",
+				vin->dev->of_node, oid);
+			return -EINVAL;
+		}
+
+		vin->id = oid;
+		break;
+	default:
+		id = ida_alloc_range(&rvin_ida, 0, RCAR_VIN_NUM - 1,
+				     GFP_KERNEL);
+		if (id < 0) {
+			vin_err(vin, "%pOF: Failed to allocate VIN group ID\n",
+				vin->dev->of_node);
+			return -EINVAL;
+		}
+
+		vin->id = id;
+		break;
+	}
+
+	return 0;
+}
+
+static void rvin_id_put(struct rvin_dev *vin)
+{
+	switch (vin->info->model) {
+	case RCAR_GEN3:
+	case RCAR_GEN4:
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
@@ -1390,6 +1426,11 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
+	if (rvin_id_get(vin)) {
+		ret = -EINVAL;
+		goto err_dma;
+	}
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
@@ -1406,13 +1447,15 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	}
 
 	if (ret)
-		goto err_dma;
+		goto err_id;
 
 	pm_suspend_ignore_children(&pdev->dev, true);
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
 
+err_id:
+	rvin_id_put(vin);
 err_dma:
 	rvin_dma_unregister(vin);
 
@@ -1434,6 +1477,8 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	else
 		rvin_parallel_cleanup(vin);
 
+	rvin_id_put(vin);
+
 	rvin_dma_unregister(vin);
 }
 
-- 
2.49.0


