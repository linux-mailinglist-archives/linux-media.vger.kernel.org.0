Return-Path: <linux-media+bounces-28377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 272CDA659AA
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 18:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051C4887978
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569BF1DFE12;
	Mon, 17 Mar 2025 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BWHQNqOm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZkbVyYy0"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A41E1DEC;
	Mon, 17 Mar 2025 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230785; cv=none; b=Azq9RvRgJZbjb9EmfeRCMSImQyb9OGtjaZ2mZ1KTGI7V0TfEigMt1igQxiC6yfB1DxRzg1Y5HXQaDeYR1Jv2aabcropzjFtq5iyYVunI0J1fjFslnZEFmm8V7vO/QsLyV+txDWbiRf6mlSBUsecZjOO2p3Bmzn5qtFBkLAguVe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230785; c=relaxed/simple;
	bh=BK9DSjiwh1/KPwMnNT+dNR1Cl4/OQ574rA92JhXRGho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g36Kd3vLrPLV7GtrdJeJKhJGIO7TR/7q2Wf1QVDWKqvofTGMNcRPWxnSv3l4SNkULWz71gLSJZWUarafYTP6DSK1oRwWpGEcSiGB3ZAjIdX8gpB5zzghQ/d6KiTrZ7/aH/G2KjrVG/Wv86E0GIKmmbmaW3kcc7fGE1jRmHRV/GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BWHQNqOm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZkbVyYy0; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 5A9C81140086;
	Mon, 17 Mar 2025 12:59:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 17 Mar 2025 12:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742230782;
	 x=1742317182; bh=jns65N7Mh8OrAzqzfQeXmVS4VxVjbDQZB013QFFMEHg=; b=
	BWHQNqOmedmdOZkzTI2CSulSTpTRAXKRBPkxnfQuW8OGzfcgsi40v6vjd0B/0yN7
	o5dgjLel7DT5SrHRAmzU8TwdoyK1B7w7S/VwNMTbGK8oIeb79Hx3tA9ycCuplF+V
	MOB/Y0CiZmIriKnV/q5Vw81s2XHNzif27nGHkt86T59eKlyY/Hx9j4/DDU9laU+d
	zKoV+kyVudPvnfvPf63O9qjEg7Z7+rLPDYWDimf5rqtcFvCdCy1jD8xG/4s0lMSH
	7Tb8mQXm3LREB6OZRiA5OjHITZPxmTvNSM1R2RhCMv5Ay/+ZXfLSviGNAZBcxrMV
	jvptLen3b+PlDhQUUitfjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742230782; x=
	1742317182; bh=jns65N7Mh8OrAzqzfQeXmVS4VxVjbDQZB013QFFMEHg=; b=Z
	kbVyYy0pBNVU1E0TWkdzIydVoGWhIoaSHL2eV1Sdw/QRi8+rGSrrp3KGKt7iixlZ
	R8fs+fXUnKqcE4Yc5WBtgqTs8IlOKldFB6rcJJlKLbLo/4uIHaTe/Y01mRFu7LVq
	+uJBBM05eSvHusnLRv4akQzwzoXbivEqVxpkcdcX4boQm96Ogle6+DbcKHvRNWOW
	hfISjcQN7USJ9C7MU/bu8XC8dBavF1Uuyqd0Ji/rIQdjFt3Crd8Kc6/EFQDCuonK
	lQhvmtTvu0CWXDEPFkJ8nFHSSFjxEfut02/+EK9JzFAYshxfm9/R1YmsUR5wSgOl
	v991rcHnv9fOh550p137w==
X-ME-Sender: <xms:_lTYZ62xlfszqMeRyJcMW_7-buJT9NtzusnGaDCpIi8es6mcEHe4Wg>
    <xme:_lTYZ9Ew0LVa6TG2EF28CRn5OdJ3aH-iiqzAiMDwklpegozrX86GttRwwjNA-kFyr
    m0iVeluLH4HUE1M474>
X-ME-Received: <xmr:_lTYZy7njKt7RRdPNj5X0vtZtd2-kTt6NKJzugOTUkqHkXK1cagiu57hqNJE9i4qv6gDSp6PTKYPvwPEMVYp_O89GQ>
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
X-ME-Proxy: <xmx:_lTYZ70u_emtN_Jpy3JUI2lcv_bHlycKeYdGtDmoSAvxYa71nVG0RQ>
    <xmx:_lTYZ9F4SlEoCtL_TJYlf0GcT4sDfYYEq8G6aPiUy0QRjxIU-52z5w>
    <xmx:_lTYZ0_T06St2mWAeMve4K6y-RtuvuyHBcH9k0tsmhrkVML2dlPjWg>
    <xmx:_lTYZymEez8P3Vc49JRcRXOs9M_GCjvFpHwsctOUn0p3GYvzgXn-Ng>
    <xmx:_lTYZ02RWzuqHgamwRcqD134lT64d2R-sPO8ScOIAUGl5lFQf6SNkvA4>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 12:59:41 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/6] media: rcar-vin: Change link setup argument
Date: Mon, 17 Mar 2025 17:59:03 +0100
Message-ID: <20250317165907.2412377-3-niklas.soderlund+renesas@ragnatech.se>
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
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 52 ++++++++++++-------
 .../platform/renesas/rcar-vin/rcar-vin.h      |  2 +-
 2 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index fcb3162f9ab6..91e871580e70 100644
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
@@ -246,7 +246,7 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
 		}
 	}
 
-	return vin->group->link_setup(vin);
+	return vin->group->link_setup(vin->group);
 }
 
 static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
@@ -909,35 +909,46 @@ static int rvin_csi2_create_link(struct rvin_group *group, unsigned int id,
 	return 0;
 }
 
-static int rvin_csi2_setup_links(struct rvin_dev *vin)
+static int rvin_csi2_setup_links(struct rvin_group *group)
 {
-	const struct rvin_group_route *route;
+	const struct rvin_group_route *routes, *route;
 	unsigned int id;
 	int ret = -EINVAL;
 
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
 	/* Create all media device links between VINs and CSI-2's. */
-	mutex_lock(&vin->group->lock);
-	for (route = vin->info->routes; route->chsel; route++) {
+	mutex_lock(&group->lock);
+	for (route = routes; route->chsel; route++) {
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
@@ -991,30 +1002,33 @@ static int rvin_csi2_init(struct rvin_dev *vin)
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
+		struct rvin_dev *vin;
 
-		if (!vin->group->vin[i])
+		vin = group->vin[i];
+
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
@@ -1030,7 +1044,7 @@ static int rvin_isp_setup_links(struct rvin_dev *vin)
 			break;
 		}
 	}
-	mutex_unlock(&vin->group->lock);
+	mutex_unlock(&group->lock);
 
 	return ret;
 }
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index f87d4bc9e53e..1131d43e38e3 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -290,7 +290,7 @@ struct rvin_group {
 	struct v4l2_async_notifier notifier;
 	struct rvin_dev *vin[RCAR_VIN_NUM];
 
-	int (*link_setup)(struct rvin_dev *vin);
+	int (*link_setup)(struct rvin_group *group);
 
 	struct {
 		struct v4l2_async_connection *asc;
-- 
2.48.1


