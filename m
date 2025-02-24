Return-Path: <linux-media+bounces-26862-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFA9A42BDA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CDB93B7CE8
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768E126658F;
	Mon, 24 Feb 2025 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QdQszZSv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="o5RCGPFs"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A768266193;
	Mon, 24 Feb 2025 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422433; cv=none; b=k+Iauu/oiTG2XdP04YtHmBxDDgsf19R3n4BeddjmF9v8hDkS53pq/5NBp0abaqwUf0/DX1j2spnI1QXiy2UisiDmjvw2AuUqU9dpZab0Od+/O0rieYAC61jlMu2VRBWOJmTDiRxERoD0Lr/eKoFJaomUi8gE5jIof+9B/sqDlno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422433; c=relaxed/simple;
	bh=2g38MCrpmzB34JcWLXawXDCUhTZNUOi6ZtRepE55UAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RozR3Grqy9d8QRam5cCD0872Qo59g/FSEGdG+38ohp1Um2DEPjCrGQ9gaHwfSGWjjMOtde3ZrEe7c+qV3B1/VwzGLsy+APKMOCkM5EgaTkWUnuBxE4Y4ioUgWnvFoG59//K/CfIC7L6CuhMO3x+4+grdXLpaWIpr1/UHF/5Na2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QdQszZSv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=o5RCGPFs; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 9BD4F138112F;
	Mon, 24 Feb 2025 13:40:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 24 Feb 2025 13:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740422430;
	 x=1740508830; bh=hUZ2p54m/jXGisevLZ6PNuRmYDXRnpfhCHP8JYMDM8U=; b=
	QdQszZSvrm1Dp6SPaDKuygSGW7vyRMnwTh9itiIKI7y3nW19/dlkZIKXXeP/sSZm
	IqgiUDerlU0daeW+AjA05rCv3JQIlF9RvxdpWGecI/qYizJY+nqsahve6kiKWKUi
	aLn+QoaM3JW9RPTDTWZ08eg8xtJ0Qszlahu8AgR7GO1LMk1r2Lz4cRRe2SoPdFi5
	SAlw/7Sy1NAFPM2VBRed+L+1QPeEMDptGulOkOAfO1SP6HsqMirF9iH/hmaR4nmg
	Cv6vJlwSzg5d09ikn/ZFx3lT2JhNe2EamjkBAKZ7arYMbPwjPEetHPrZ37JG3Mr9
	kIFZLaT8rCpCmCFUFQxZ9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740422430; x=
	1740508830; bh=hUZ2p54m/jXGisevLZ6PNuRmYDXRnpfhCHP8JYMDM8U=; b=o
	5RCGPFs7oUSs1zaAtxTPHgowSrnbjThkjgq1WCNkFv17fRASMf+/4gZWp7tUDnQ4
	R6BYNnUKjftBcbINGApxslg3LD5nTdULzr+Cy5uYA6hjsJG7oqOOYWvzbcwXj3hQ
	Qq5OOvT+GZG7xloUQEoujEIQ1dHhajCrZeUR0kHflvVZCFGq0xl6as1PwW/ID1Ba
	QteW/xhjicP/oosIGIIGI5reXiiomMpktRa9hs/mlZi9wkJrcVSFnaTsY1PCtWcm
	SJxYv1Tcl0MnB3WhGA21yuZSsdI2ida7Tq10GpCWHsyVOpRhkvDjoeDWEuDIy///
	6W4yMPo9WhgBH14kEn10g==
X-ME-Sender: <xms:Hr28Z7O4Dp4RlTpGyidYBk2LjjbWMk6mnzJr0tGZqLaosthBsmkVgg>
    <xme:Hr28Z1-SL00p-kSMnHyuiNaD2lqYuNQgaSpBhjFp8T5daoSOy2rjs8pb_QkR93Sh-
    u2Z8eeiXo-UXhjnJ54>
X-ME-Received: <xmr:Hr28Z6QEt-PVgwlSRXroQ_YwdPU1DkQCeHLBCFE6A4atTtsNeeBF3RVkuNdk0g1G4yB_oKsAdjKp9ct52Ap-EjRQCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:Hr28Z_u9KycNU8l2EqwB3jMg6r_yVsNj8MkPbNyLsjsf6whcmi1o-A>
    <xmx:Hr28Zzcq9wPjn0LxMKCwUp0mvyf2nXZlRc4DuXjV_RrK6vCMBH-KlQ>
    <xmx:Hr28Z73_xN1rm27572g6W_ciH-aD4U0l3Zf_4Rgnghj36sqHgACdZg>
    <xmx:Hr28Z_9CfoVxZn6MfSXmzTm8_Cqw_pjgZp1WlSDskugnrzU0jPijIA>
    <xmx:Hr28Z7Swt7v2aND2EvyTNCEE50HPBNNxT6DdpSJ2SQgXPR3rSS1dxLwh>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 13:40:30 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/6] media: rcar-vin: Generate a VIN group ID for Gen2
Date: Mon, 24 Feb 2025 19:39:35 +0100
Message-ID: <20250224183938.3800317-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224183938.3800317-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250224183938.3800317-1-niklas.soderlund+renesas@ragnatech.se>
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
 .../platform/renesas/rcar-vin/rcar-core.c     | 40 ++++++++++++++-----
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 91e871580e70..e3d2df6cd54b 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -114,23 +114,41 @@ static void rvin_group_release(struct kref *kref)
 	mutex_unlock(&rvin_group_lock);
 }
 
+static int rvin_group_get_id(struct rvin_dev *vin)
+{
+	struct device_node *np;
+	unsigned int count;
+	u32 id;
+
+	switch (vin->info->model) {
+	case RCAR_GEN3:
+		if (!of_property_read_u32(vin->dev->of_node, "renesas,id", &id))
+			return id;
+		break;
+	default:
+		count = 0;
+		for_each_matching_node(np, vin->dev->driver->of_match_table) {
+			if (np == vin->dev->of_node)
+				return count;
+			count++;
+		}
+		break;
+	}
+
+	vin_err(vin, "Can't figure out group id\n");
+
+	return -EINVAL;
+}
+
 static int rvin_group_get(struct rvin_dev *vin,
 			  int (*link_setup)(struct rvin_group *),
 			  const struct media_device_ops *ops)
 {
 	struct rvin_group *group;
-	u32 id;
-	int ret;
+	int id, ret;
 
-	/* Make sure VIN id is present and sane */
-	ret = of_property_read_u32(vin->dev->of_node, "renesas,id", &id);
-	if (ret) {
-		vin_err(vin, "%pOF: No renesas,id property found\n",
-			vin->dev->of_node);
-		return -EINVAL;
-	}
-
-	if (id >= RCAR_VIN_NUM) {
+	id = rvin_group_get_id(vin);
+	if (id < 0 || id >= RCAR_VIN_NUM) {
 		vin_err(vin, "%pOF: Invalid renesas,id '%u'\n",
 			vin->dev->of_node, id);
 		return -EINVAL;
-- 
2.48.1


