Return-Path: <linux-media+bounces-34273-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF100AD0807
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 156CC3A9A44
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F1C1F0E2F;
	Fri,  6 Jun 2025 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="E+WCnb7c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dCEjtCAc"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F911F09A1;
	Fri,  6 Jun 2025 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234420; cv=none; b=ne1tLt3TOljM5ZhSOxpX6X+a9Bmj3WfNwa9Cp8lL5KbZc6Y8cT2kPzOzaI3mVItVT3UHykkWofTkJNleIhsTwJ5ctx149BxbqjKHiqbwR3B8XTTnuQumijZV0V9XDe2XxNTlG35+MW29XLdMCsezvq3cxMGpf0csTqmqNWO3B6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234420; c=relaxed/simple;
	bh=vWnzzImi9bV7YWgbKgeQKoV7Y6YVGR2NHFJ4K5UdXw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iI6ZnaKOj5CEWNCdM7AxHklZ62yLXqCq+t5j11KClF6HbGRiJaJmZpCO2B1LxZbglEHALwoZx3hDOExP620Vs9Zg8BfCei1K9qDkOGX1vMPlaApXR/0fUJn0EL9RjVwORDyb+8TKFMssY9/C+vvCfxKPFMeN4oq6IqYt45XU7j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=E+WCnb7c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dCEjtCAc; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 1D92F11400DE;
	Fri,  6 Jun 2025 14:26:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 06 Jun 2025 14:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234417;
	 x=1749320817; bh=DYxKVSzGeB90W2W3S8c5JaacAWaQPTIw8zA5POpNYoQ=; b=
	E+WCnb7cQFKWYiMv9bOotKFdYsA3ShBpWp6qlr6Aov1MMTrt6lGjFA4QOxy/wd6d
	8S5OjCae/QB4OeMzqleUo/1vbXbi7u73A1I1m/6FhrxgIVzGpV67yRqbAjrpGiNV
	zows/ZSsV8BHewlLIAOyZUTunCP5zEFkxH8xNbWOEX5FcYaEuKH7Jxp7zIjVgjz0
	ArTUWJx/qtYIx4shXlpjVaugmn8K97Is2Zd5hK96KBx8nLNfChVO6e3Lqg93leyJ
	Nw1eaCZ1kKm5rAkxwqMwa//vPiz36yosmSmkJNAB1CGWjOx+bWxQ3srfZYd4wnpL
	tMCHA1bqv3C8trbbGc3okQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234417; x=
	1749320817; bh=DYxKVSzGeB90W2W3S8c5JaacAWaQPTIw8zA5POpNYoQ=; b=d
	CEjtCAcS6KasLmOWxtopaLy3LhzCaARiuZhTaMyFSUIcwiQBKLomjj3bf/yOB+Vi
	ULgAigmSUcw3E1iDXWpPrMJX6KpKi0RJEXeWV87NQfo4HyMJzTB7oU4vv5BGDyYR
	28RqOeIWYINH+b0KxHK04+bw0KiPVW6wIe/HG2Q+4C9etbJuRcxm/oYRlMcDLO6P
	eSuH5u3zx4XB0/qEu/8leMnJhxj9zOkIt0emKRCaSYMeb1rmPZGjPmKZpu5gZnB8
	8us2S0ZP8XvJ48nPjpBk7ay9eI3T3KUnmmTMOjr8VSnRQVL8TS0evNEkXb6ImAEN
	kw3mFqQZ37ov+ErBFHQMA==
X-ME-Sender: <xms:8TJDaOyQMcK_0uNINEqgiPAKNCopasDSZP8t1xBWtkFO0Gw3mzLSFg>
    <xme:8TJDaKTY1MDly_KzVy-PXaSwXzNttIdi-RF39Re_UBARqbR_n0gUP7mlLfZ7Cjg5v
    r0pdXth8vld54zSHNE>
X-ME-Received: <xmr:8TJDaAXu0zum0xyf5nB1KRM7Gs3_3llCWiMeEwdzQ6dVap1kPk3GWy2_dVv9L0Nalx08PL6scM1xHOhXkfhiZL4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:8TJDaEhClOhgKFo6zPP1ZobL0fAs9jC0e2cXDdCRflROYrvDTHiN7w>
    <xmx:8TJDaACtUAEFB11lrIjV23dID26ee2HVtkqATsf_IgbeML0GB9whwA>
    <xmx:8TJDaFJFrgddx0qIOH6LDME7QIL2zI-pa5I7dEaC_FNxOpptg5706A>
    <xmx:8TJDaHDBsE20JFv5t0xI_9vnMOXw9cdkSE3Onixm04Fh_q5x939KmA>
    <xmx:8TJDaHeVnatllJDlrmAknObAX4CTJGKWnfM1G_31aw8gT4_j5qjBs9f9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:26:56 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 04/12] media: rcar-vin: Generate a VIN group ID for Gen2
Date: Fri,  6 Jun 2025 20:25:58 +0200
Message-ID: <20250606182606.3984508-5-niklas.soderlund+renesas@ragnatech.se>
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
 .../platform/renesas/rcar-vin/rcar-core.c     | 80 ++++++++++++++-----
 1 file changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 73d713868391..e50cea9c04d3 100644
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
@@ -1390,6 +1426,9 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vin);
 
+	if (rvin_id_get(vin))
+		return -EINVAL;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
@@ -1407,6 +1446,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
 
 	if (ret) {
 		rvin_dma_unregister(vin);
+		rvin_id_put(vin);
 		return ret;
 	}
 
@@ -1431,6 +1471,8 @@ static void rcar_vin_remove(struct platform_device *pdev)
 	else
 		rvin_parallel_cleanup(vin);
 
+	rvin_id_put(vin);
+
 	rvin_dma_unregister(vin);
 }
 
-- 
2.49.0


