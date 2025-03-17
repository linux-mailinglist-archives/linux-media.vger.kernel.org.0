Return-Path: <linux-media+bounces-28378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01310A65975
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 18:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE7BD7AB426
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544271E1DF6;
	Mon, 17 Mar 2025 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="eH8KbKQ5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="z4cA04nR"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2071DF97C;
	Mon, 17 Mar 2025 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230787; cv=none; b=rCa31pp38aHIgrlIjQ55sbAJAGU8uKVYL2vXdAgevkz16pL+bA6/jfY6P4feCC3VeYE7qb3d/HCPYFtokvpZlGJXT0Nhg4rXBLAlo/BMQiBcNyPZV+mDh8aC7quxDxp6wXWolasJHFjju16roOY+Ky7uFzjzCRFsN3Z9lWY/wo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230787; c=relaxed/simple;
	bh=ttS69TOM5I4/vpdJ2bhDhj5usucu9GXVpyEJAzE7GYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6MtfFazTQ+zCPUyBBcW4+pOy1fKyustrEKMDZhQqDlHsJfPfWHNhKZEGqO6+NR/5NPd7sIq3tdJK9AR+wESOltZXc0NrEujlejRF3Itb4Crj2ScK0sYUpAkW7+fXOqxN3WzYWpuY1jQcnSFTsrG8stEpASGhO25hoH2t4SRkAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=eH8KbKQ5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=z4cA04nR; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id AB9E711400A4;
	Mon, 17 Mar 2025 12:59:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 17 Mar 2025 12:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742230784;
	 x=1742317184; bh=sMP3Juj5OTy4GosmRJIZVTBtsvpQA565WTB93F1vhso=; b=
	eH8KbKQ5gzpU6PpTjCE3kNIjuOXD+kwBXqrHOwmojOfHwfit8rJUI7oTGBTkP8WE
	Y8hkdFWf7hPKq689gK78e/rcXcgmEI2Yasr40+fncCMU7arOob9RZ2ue9wWZ8K9l
	MxUy19/Hxh72WaqMCLDlE1fh8xea1uiAtT7lbpu4TEh5n4ZjDiZZYglZWIbQT/2i
	7wbDuDrXBWxafeZfgDCQPpPpt8dto9P1JE7TRuxbNzGlMjFu0z4wrVM5om/sQ35Y
	Kb2JByIaupsTsXISRU84IuTQuI14ygPVKALbmENJzGW6NI5TRAIUZw1P8hjmbg9M
	KhcI9JVuTfrAHcj83wKYZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742230784; x=
	1742317184; bh=sMP3Juj5OTy4GosmRJIZVTBtsvpQA565WTB93F1vhso=; b=z
	4cA04nRq3DeRM0qtLd/XJGI0gE3sYiRcWGjbscVBuvocMAmqby+mlS1dCskN6kGV
	lvcMk8vBWS4AgvfG7DL+aXgHhuUuX+hgd063bYdZaIsV6VZBc9ZLHYnjVnk8D5HM
	p6bXEMO1MthCQPfodz4EtIM6eJpbTitnF5TU3/MkaSoeg4nZ4R6F7Qncw9XkIxWM
	GF/6+w8k9ekeYLAXAM+cHuXPi9H5wHw+ovXGlBXUO8g5wbQsrxcBB1SnPhYbUMAj
	vsndcnIlK3PNuDyKVYfMAE4d+y5jt4CRdyiOEsNuokssqOBFOlbnPzXFe7GzPutW
	xbL+QqhFlxt7mce6bcTYQ==
X-ME-Sender: <xms:AFXYZyN51pyQaneHe6ySD4rQnmJNfx8yFmoMdJaRceOBRa7ISfENEw>
    <xme:AFXYZw8iYcahP6RKlYYKRgTb-yqHjDmBdIRKQmit4nql4oNxVO7eYD8bBpxKEqHJM
    4VZiYUv3FJXuHFGmxg>
X-ME-Received: <xmr:AFXYZ5RSKRuMsry0ZtVCnsA1Oz3ebjcGp858O72t81ANKt0oobSog7vY6o44TB22gbs99gTpc8vVeiOwxEINRpfR0g>
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
X-ME-Proxy: <xmx:AFXYZyuNHG7gmn08ctjyXKQXp2jXsJTySyeGlmSeuBnkc5ls7SKY6w>
    <xmx:AFXYZ6eB5DL4QDol1KwHvdIKGHH0SiUyhulIWckHb1nh99sc6qhcYw>
    <xmx:AFXYZ23aodB9kltXrkpSCSIsVxP9XD5GQsHuyLi8GzARIxp0AzJRWQ>
    <xmx:AFXYZ-9_QZQcbx49LsVJN_kfVfbYKtuZ2mnB2seF89Q9U5Czh77AXA>
    <xmx:AFXYZwtOIyIeUY84xaZkHOmaSfSVe5_st1pxRxy79zlkIs_zb3MTK_a2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 12:59:43 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/6] media: rcar-vin: Generate a VIN group ID for Gen2
Date: Mon, 17 Mar 2025 17:59:04 +0100
Message-ID: <20250317165907.2412377-4-niklas.soderlund+renesas@ragnatech.se>
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
index 91e871580e70..7a7cf54ae7ec 100644
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
 
@@ -1377,6 +1363,52 @@ static const struct of_device_id rvin_of_id_table[] = {
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
@@ -1404,6 +1436,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
+	if (rvin_id_get(vin))
+		return -EINVAL;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
@@ -1421,6 +1456,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	if (ret) {
 		rvin_dma_unregister(vin);
+		rvin_id_put(vin);
 		return ret;
 	}
 
@@ -1445,6 +1481,8 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	else
 		rvin_parallel_cleanup(vin);
 
+	rvin_id_put(vin);
+
 	rvin_dma_unregister(vin);
 }
 
-- 
2.48.1


