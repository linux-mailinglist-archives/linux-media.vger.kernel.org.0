Return-Path: <linux-media+bounces-34272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B35AD0805
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0B723AD6F6
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F891E98F3;
	Fri,  6 Jun 2025 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iFlfTM1h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bLXd0SlA"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D2B1EFFB7;
	Fri,  6 Jun 2025 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234418; cv=none; b=Cg6S3OYlhQSQMjbaiMuuvMRuHs16VR1nQoUc6yPLvW5xGDHnYZ3ecedc1WyabFiKckJjW/VSSRTKcpn9pVG8mG0NK4z5c5y4v6nGimeSMMRsGagS0JqiKFzql/cuZBqUkjhXegJmbBC08h0tpvUtwtpWiwpUxpoeLWaD+XXShmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234418; c=relaxed/simple;
	bh=TPKKvhOdnhzmyXYM9Ciu44w/Wo4IscDWXieNQCIPzNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nYM7O4MNovSg7eNujh5w5qG57yX6COEwk/1mEIlD9WjjZDLhi8r5WMoIfQrr/wj+PzBaAkfvj7zP2teikSAxd80YlTms0yQh2416UXgqhm4y/FtF3v7XUzQ4UcImS16la9bndtYdGmYUezgRC5xdyx1Kb2YVimc9gKBPSw1VwWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iFlfTM1h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bLXd0SlA; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 6355511400BD;
	Fri,  6 Jun 2025 14:26:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 06 Jun 2025 14:26:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234415;
	 x=1749320815; bh=1k5l1tiytiLrbKYNSTkLvaJylebeAsB2YwhfnI3TvdA=; b=
	iFlfTM1hQ2+vggazI3w6sw/NG3StVEyouwsE+0OAAbJdExcUNn/2V1a9ucBusfXD
	LYslgSSsQMmBFzCfUXjdZt926So0HVYSPfATl3Iz7uvFxXeG5uKpzqbbZ7QwG6Rl
	n1H7DsQkuxglzUi+cf4XhdeKQtpBK8ec0CxB4C340Y5/rpd9IziyZ4Ayxt+6999+
	1kYXGf+8ISezFjO2GO+q6mtoMrv09L+lT8hIBlfwegfKIFWHkTVSNAR8W5BPe1DL
	3SajAjrmgTc1OlPJMx0B445ksNuOBjlEsGPxkD6gmqZEmxTncPKR6t74Z5eAGZ4P
	jo1+YsHHDc2k6LkJWqGhHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234415; x=
	1749320815; bh=1k5l1tiytiLrbKYNSTkLvaJylebeAsB2YwhfnI3TvdA=; b=b
	LXd0SlAXGQREXhWmPzJ4ifw2dDC+ggvkS0TzCwE0+zCkchmWmk6TGpHiXW9j9vgU
	KvlRL7mzzjkpiNPcIeYIxkquis9Bf4kNofTiqYsMkjqHrnrPV+dPdUXo76hx+6WM
	AkKGSUGIblu888eUAq7zSyc1fDhwuFuMRKmoLNG0Nomw9euavkZezC5lM2Iw9Qpy
	3QgCWOTJUpMoKqxEBG0Z3t7zORx8InEfSSDfBmrs80rd/dqlckh7NjeemKXjVh+A
	GS7zdDNNX7nbLx+I8v4AX4N08XJ6Qz7OyiBQZnnC/CQJrYUGWuqHGsqQgN1E9AvP
	tChcq1qiHvj/CYWf0CQuA==
X-ME-Sender: <xms:7zJDaIy5vIcEvDnma0NfRiW8omxoXAuKpd3lr68x7XA1wbV8EBa_HQ>
    <xme:7zJDaMTkFBeZHCZc8hZTAcMQmcuD7iFrpYrSI_GtmnDEhmnWh_K1EBy1_PGph0uGN
    94tTlWla1nIYmiqtfM>
X-ME-Received: <xmr:7zJDaKXXfW0lIrA6QR-7Lyf8gBK53qiPKZZSiMYSxnpuoveLZ9vtb-pGLTYinIwdnTQkzLuQvXFDYMTaomwfxi0o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:7zJDaGh7UtXyAHl2ZLrl-0B5nwmpsi0cxm3mtvAnYkxMCiaLPLBb2w>
    <xmx:7zJDaKC_IR_JTCibDJHYqcO4uZYKj5wrHQeqPU7v_ZmEKKcbLAvR4w>
    <xmx:7zJDaHLz7nvtRR7LonrATVZkhIUG_OEEawS41MlJEyhTACa89edbbg>
    <xmx:7zJDaBClKy8zzq8JmdsDa9aBYPedKTXqjti6Jv_MhaYsatNVENYprw>
    <xmx:7zJDaJzhtppEskjM7cHNrvplwR36awwD4OWIdgyG9bjZZD1cgDXL5tRL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:26:54 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 03/12] media: rcar-vin: Change link setup argument
Date: Fri,  6 Jun 2025 20:25:57 +0200
Message-ID: <20250606182606.3984508-4-niklas.soderlund+renesas@ragnatech.se>
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

The link setup callback once acted on each VIN instance, and expected to
be called once for each VIN instance. This have changed as the driver
grew support for later hardware generations and the callback is now
expected to setup links for all VIN in the group.

The argument to the callback have however remained a pointer to a single
VIN instance. This pointer was then used to get the group structure. Fix
this and pass the group as the single argument to the link setup
callback making the expectation of the function clear.

There is no intentional change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
* Changes since v4
- Use the group->info structure added in previous patch instead of
  iterating over all VIN to find one that is instantiated to get the
  same information.
- Condense variable declaration in rvin_isp_setup_links().
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 37 ++++++++++---------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  2 +-
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 66efe075adae..73d713868391 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -65,7 +65,7 @@ static void rvin_group_cleanup(struct rvin_group *group)
 }
 
 static int rvin_group_init(struct rvin_group *group, struct rvin_dev *vin,
-			   int (*link_setup)(struct rvin_dev *),
+			   int (*link_setup)(struct rvin_group *),
 			   const struct media_device_ops *ops)
 {
 	struct media_device *mdev = &group->mdev;
@@ -115,7 +115,7 @@ static void rvin_group_release(struct kref *kref)
 }
 
 static int rvin_group_get(struct rvin_dev *vin,
-			  int (*link_setup)(struct rvin_dev *),
+			  int (*link_setup)(struct rvin_group *),
 			  const struct media_device_ops *ops)
 {
 	struct rvin_group *group;
@@ -247,7 +247,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin);
+	return vin->group->link_setup(vin->group);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -910,35 +910,35 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	return 0;
 }
 
-static int rvin_csi2_setup_links(struct rvin_dev *vin)
+static int rvin_csi2_setup_links(struct rvin_group *group)
 {
 	const struct rvin_group_route *route;
 	unsigned int id;
 	int ret = -EINVAL;
 
 	/* Create all media device links between VINs and CSI-2's. */
-	mutex_lock(&vin->group->lock);
-	for (route = vin->info->routes; route->chsel; route++) {
+	mutex_lock(&group->lock);
+	for (route = group->info->routes; route->chsel; route++) {
 		/* Check that VIN' master is part of the group. */
-		if (!vin->group->vin[route->master])
+		if (!group->vin[route->master])
 			continue;
 
 		/* Check that CSI-2 is part of the group. */
-		if (!vin->group->remotes[route->csi].subdev)
+		if (!group->remotes[route->csi].subdev)
 			continue;
 
 		for (id = route->master; id < route->master + 4; id++) {
 			/* Check that VIN is part of the group. */
-			if (!vin->group->vin[id])
+			if (!group->vin[id])
 				continue;
 
-			ret = rvin_csi2_create_link(vin->group, id, route);
+			ret = rvin_csi2_create_link(group, id, route);
 			if (ret)
 				goto out;
 		}
 	}
 out:
-	mutex_unlock(&vin->group->lock);
+	mutex_unlock(&group->lock);
 
 	return ret;
 }
@@ -992,30 +992,31 @@ static int rvin_csi2_init(struct rvin_dev *vin)
  * ISP
  */
 
-static int rvin_isp_setup_links(struct rvin_dev *vin)
+static int rvin_isp_setup_links(struct rvin_group *group)
 {
 	unsigned int i;
 	int ret = -EINVAL;
 
 	/* Create all media device links between VINs and ISP's. */
-	mutex_lock(&vin->group->lock);
+	mutex_lock(&group->lock);
 	for (i = 0; i < RCAR_VIN_NUM; i++) {
 		struct media_pad *source_pad, *sink_pad;
 		struct media_entity *source, *sink;
 		unsigned int source_slot = i / 8;
 		unsigned int source_idx = i % 8 + 1;
+		struct rvin_dev *vin = group->vin[i];
 
-		if (!vin->group->vin[i])
+		if (!vin)
 			continue;
 
 		/* Check that ISP is part of the group. */
-		if (!vin->group->remotes[source_slot].subdev)
+		if (!group->remotes[source_slot].subdev)
 			continue;
 
-		source = &vin->group->remotes[source_slot].subdev->entity;
+		source = &group->remotes[source_slot].subdev->entity;
 		source_pad = &source->pads[source_idx];
 
-		sink = &vin->group->vin[i]->vdev.entity;
+		sink = &vin->vdev.entity;
 		sink_pad = &sink->pads[0];
 
 		/* Skip if link already exists. */
@@ -1031,7 +1032,7 @@ static int rvin_isp_setup_links(struct rvin_dev *vin)
 			break;
 		}
 	}
-	mutex_unlock(&vin->group->lock);
+	mutex_unlock(&group->lock);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 313703cd1103..cb8e8fa54f96 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -259,7 +259,7 @@ struct rvin_group {
 	const struct rvin_info *info;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
-	int (*link_setup)(struct rvin_dev *vin);
+	int (*link_setup)(struct rvin_group *group);
 
 	struct {
 		struct v4l2_async_connection *asc;
-- 
2.49.0


