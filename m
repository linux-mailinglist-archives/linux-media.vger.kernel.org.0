Return-Path: <linux-media+bounces-33027-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 144F7ABF5ED
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A94B14E6CA1
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91C527A47F;
	Wed, 21 May 2025 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="GpUbPfmK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iqnn5V+U"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2FC26FA4D;
	Wed, 21 May 2025 13:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833694; cv=none; b=JoLjZRUI+8QJ3hVkfarUJxS76pPhnoR1+Axtr7iasmz6Isp0j+8Zan+cWD0KHJuQASI0KuyrhWmXIHHnwanVmfkjaEX8uxZjwHhK648UNDgNyXQ+7bcx7QfOnF7cGWihp8rXrId+66JtARA5SbX0qFD1X2rOItEYlBPl7TrePFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833694; c=relaxed/simple;
	bh=SRGhkB8L2SIIzcO+EheVBy/d9WQCmrT8QC7/nNrKL/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DChez6OezO/PQvZRzXpgzJQW6vQ/NlnSZxgP3RNCx1IFXYBVLCdt0m/nCbq4gewSnL+/wPmt71fCUmpVXF6bPUMbKKc7YjPzgnWQxPjYAD0pJzRXDzvf3EPkDx7LPkL/AHVmrXCWMUhcWqnf8/0dPvL9NXTFXX/e2JTlLj8Awmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=GpUbPfmK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iqnn5V+U; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3C8AE254015A;
	Wed, 21 May 2025 09:21:31 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 21 May 2025 09:21:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747833691;
	 x=1747920091; bh=l6AGJv4XfRk3YXLHGOwoXmBG5ASC9ljWbmBfx9958vQ=; b=
	GpUbPfmKNdzZ3wjrKbCggHA68zg8LA98+7gB26UqtgJ+MSgH8ikOmGGWffMarHFJ
	Mj11LliNfEGAEwOfyCTqY0Zrzd2YyQXgj45pgB8O4N1Ehp6m8tkP5y+4yn3Opw3O
	cjKDZ54ocM9r96IhC5fLpU8gY8emxDZKhekg7sxv50XHL5Bn+uvI+vWOmQlFErL2
	oGHfhpea+/aWtfuTuOw4riVmV9Qn0ZDnhMjwTXKIqEZRZhVM/0F5u6AuBtgcSPDa
	eqJWo3J7TOLNQm8hb0dYNv5eN41Tqq+llrAFTldCpHSSAy+xDCVuNEWGQI5tNdrm
	dy40ygWGDX/yISzmAPQPcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747833691; x=
	1747920091; bh=l6AGJv4XfRk3YXLHGOwoXmBG5ASC9ljWbmBfx9958vQ=; b=i
	qnn5V+UeeAAF0Dt8J7iU3Jiw/Fhanf43+f6UoNE8LzpquNVxYYfTgRSBFAYm1TtE
	TSfKyXaZK787rwhg+3NGLirCWvpt2B1my3wXrcxt7mlRMCaIEl7ktIo4m7DZ4yQs
	4w4/f60MPmz/7hBI2uawbMpQzS44MyQzpHVeSj3sEOCYmR7N4EvQf/P8JpdnQoDz
	pQ/LAG7juMBuokX4Z+4zKGep0i+VLquVJcmSbaO6Q6YHlokikWLamZL8K99mzlhH
	nNItcOYfrZbjubK88TQXA4+4gN8YrEfAa7GzKTvCCh2XqmZJwTcikjQ5tjZxMHAS
	hvqbBCVaFTpKB/Dx1WX1w==
X-ME-Sender: <xms:WtMtaDHr6vgTBr0suRg9cH4lt4WMWQWKZ2v9iliJ1cfO1lGGJAt0QQ>
    <xme:WtMtaAVGdqJzTrbTitAQm72SJFP3qswY03kaSFM9Os3dYpwt-vwB1yC694K3-LBoi
    eaCDT8an0Zv4tfte1Y>
X-ME-Received: <xmr:WtMtaFKmQEkk-0wYy--FSWLuSD-9jlfSWqrezpkO6jpZGt5jJfrbxdD3lViyVoONqxhKMOoHXpwC-DzMNKMBW80M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudekucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgj
    fhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnug
    cuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeuke
    evfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtph
    htthhopehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdr
    vhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnug
    dorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:WtMtaBHpb_pmI4YuIRJ_BPz2YwYmxUhON_SKLrrbBdOVErJgBvBBbg>
    <xmx:WtMtaJVG-wKSQ-JyOMQiRkyx109dJg0yFVmjnHVaMMuXIGn3NNJkwQ>
    <xmx:WtMtaMOHqc4uruVheVinvSx2ICD-m-aCK5MqBWCPwZnQObUKjQD-xQ>
    <xmx:WtMtaI2RiQLWHpIjaI_bCD2oxvkV8EfWnjZTlKmS_DDKneJGw3tk3w>
    <xmx:W9MtaEWg_DbDlLxSo2PH7bCcIY21x1glyVasEQIOUu5PLAlzZ_SHRqrs>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 09:21:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 3/6] media: rcar-vin: Generate a VIN group ID for Gen2
Date: Wed, 21 May 2025 15:20:34 +0200
Message-ID: <20250521132037.1463746-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250521132037.1463746-1-niklas.soderlund+renesas@ragnatech.se>
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
 .../platform/renesas/rcar-vin/rcar-core.c     | 78 ++++++++++++++-----
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 1be408d6c508..d9ad56fb2aa9 100644
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
 
@@ -1375,6 +1361,54 @@ static const struct of_device_id rvin_of_id_table[] = {
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
@@ -1402,6 +1436,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
+	if (rvin_id_get(vin))
+		return -EINVAL;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
@@ -1419,6 +1456,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	if (ret) {
 		rvin_dma_unregister(vin);
+		rvin_id_put(vin);
 		return ret;
 	}
 
@@ -1443,6 +1481,8 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	else
 		rvin_parallel_cleanup(vin);
 
+	rvin_id_put(vin);
+
 	rvin_dma_unregister(vin);
 }
 
-- 
2.49.0


