Return-Path: <linux-media+bounces-28379-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D2EA659B2
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 18:09:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CEFC18869E9
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2751E1E08;
	Mon, 17 Mar 2025 16:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ohWAZtls";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K/3WOFUz"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3AD1E1E07;
	Mon, 17 Mar 2025 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230790; cv=none; b=tCPj0ugVr4V+BvFx7O2V0Fo4Yhj5izqM/bu2C77qraT3gi6IiXL3bPlqAYbCm4t2/VFzPNN+IWb/ABtALx2W2KRjtesphq5hDfOYHSlDolnvUaFmM2q4Gp8eM1Mq0wHBMcehIcTBoH8JobSHXfoSFzh6POsnKFuGLFWQd2MDnjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230790; c=relaxed/simple;
	bh=+9koEqHsrALoo/BpV++A27eF+aoECu5xLcEJS5E/8LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G10XlF2oQM7gMoyB505L56Oq+Z90RfDJzcJC+jZQ6riu8ZMM+SJ4XYg1hMS7YlziGN/OvTFRJoMGCwsQ/2OvFhdnhsmz3cSwoXDhX1LKEv2SePTlPTb4kvKqx64AUfj+wEnzkB0wxrQoKB1eup7Qm0MFAbVOp7fxjTN597I5UTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ohWAZtls; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K/3WOFUz; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 221EF2540208;
	Mon, 17 Mar 2025 12:59:47 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 17 Mar 2025 12:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742230786;
	 x=1742317186; bh=9qaswB/BM+jXyhY2tq1K588wgIkiTOuKBH2wJxz7DCs=; b=
	ohWAZtlsrChyax4c6dPHK7DeA6ZrdtSSvmsU8RF1FoGAJA29Y3cdPmuGRcYMJ6xj
	RpLX7wytbY29XC/QUZCVjVK1pjjSEr5s+fUEa+ZxIzLFgx805Kog7HXLcgayfSXE
	eAEKH9upCoIbZZf0R+hcGdMlfceo/IUJDcB0b7IfYALIfpwpcC+Zff6foF2hWrlQ
	LLLTUGM+W0YywbXGqG33KtE+PEjEyqDPU+rGrB5aaHs/Nches+2V9qfBDdImBtSE
	/Z082d76Tv8B7aBzS54aSZ7XXVW6e1gVdIV80Q2MXM27GP/IimWkIngff8wTVcq9
	ZHxZoqvVDjYiABMAJqpaBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742230786; x=
	1742317186; bh=9qaswB/BM+jXyhY2tq1K588wgIkiTOuKBH2wJxz7DCs=; b=K
	/3WOFUzvMJG27bBMArvZF4FXTQ0BvIu9pLmSQcVeZj4d4fk4tO2IQR8KCEX3vYaF
	48Y79U1tDwFDF3Mbr2sJ56boFGdNrHD28vRR6HEH4tD/2jWPqp5aI4qxeIQe6JYD
	YqC1Gxgsm2+qg0et8mx5KODghLvvuaRcDk3MBiyQ8htetzj8SSdOje9G/BE9Zc24
	lcSEFBPHLZnpvOKfEKn2sE87gPKh8qojik+XxyXMZPUHDfnP43+BR+dGxZAxvd43
	2RGrb+dFDW/S/GIj251/Tq+Ue8Tpo1eBD9TMhhQmh2VnR6aQdGIbdaHxaetWtcpp
	FcmaEFbWtU1dQaaMxlgHg==
X-ME-Sender: <xms:AlXYZ9f6XWZTPmtYmgJCwhA76rzklnlWEHv7t-ROYpDBbQXqP9v4YQ>
    <xme:AlXYZ7MTi_1CHR5Q_U17iSU6ke-4lP-fc7UcBCzdypuDmqsfn6pCJFcpnAyeLdCZt
    -T2639TPRw--lmsitg>
X-ME-Received: <xmr:AlXYZ2iNTkKqzR_0-ES3T2vP8dwfM7VSxeQtNBBKZCaTrN-ixAfbt3reTpgneQxQ1yQo2CESW4NLAYM8rfq-5XFBog>
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
X-ME-Proxy: <xmx:AlXYZ28RQZ9U3kx8sDjaFuH10r1c3vpdIflNPyMc66pBDfAGX0w2EQ>
    <xmx:AlXYZ5vq9dQTA_liCFrWv7KRnEQYVZLKIz0UTMcoNVwbRrvwhiKrNA>
    <xmx:AlXYZ1HCRs_gp7IOa7X4kj_8h3zAWD_NHnQZYpczB1arFzHLGbxlMA>
    <xmx:AlXYZwMU_6ZJeHIayAwXtQ50i_kq7Ek1en6lkC1yrC8--_QqjDGWnA>
    <xmx:AlXYZ6_w_HUIE09HUxwdkm-NNPD6Us1BnG1V6eRyLT5iwbNgvwGwFx-n>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 12:59:46 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 4/6] media: rcar-vin: Prepare for unifying all v4l-async notifiers
Date: Mon, 17 Mar 2025 17:59:05 +0100
Message-ID: <20250317165907.2412377-5-niklas.soderlund+renesas@ragnatech.se>
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

The R-Car VIN driver is needless complex and uses more then one
v4l-async notifier to attach to all its subdevices. Prepare for unifying
them by moving rvin_parallel_parse_of() to where it needs to be when
they are unified.

The function is moved verbatim and there is no change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 106 +++++++++---------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 7a7cf54ae7ec..5b8b3cd93915 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -337,6 +337,59 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
 	}
 }
 
+static int rvin_parallel_parse_of(struct rvin_dev *vin)
+{
+	struct fwnode_handle *ep, *fwnode;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_UNKNOWN,
+	};
+	struct v4l2_async_connection *asc;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
+	if (!ep)
+		return 0;
+
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
+	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
+	fwnode_handle_put(ep);
+	if (ret) {
+		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
+		ret = -EINVAL;
+		goto out;
+	}
+
+	switch (vep.bus_type) {
+	case V4L2_MBUS_PARALLEL:
+	case V4L2_MBUS_BT656:
+		vin_dbg(vin, "Found %s media bus\n",
+			vep.bus_type == V4L2_MBUS_PARALLEL ?
+			"PARALLEL" : "BT656");
+		vin->parallel.mbus_type = vep.bus_type;
+		vin->parallel.bus = vep.bus.parallel;
+		break;
+	default:
+		vin_err(vin, "Unknown media bus type\n");
+		ret = -EINVAL;
+		goto out;
+	}
+
+	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
+				       struct v4l2_async_connection);
+	if (IS_ERR(asc)) {
+		ret = PTR_ERR(asc);
+		goto out;
+	}
+
+	vin->parallel.asc = asc;
+
+	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
+out:
+	fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
 static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
 				    unsigned int max_id)
 {
@@ -635,59 +688,6 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
 	.complete = rvin_parallel_notify_complete,
 };
 
-static int rvin_parallel_parse_of(struct rvin_dev *vin)
-{
-	struct fwnode_handle *ep, *fwnode;
-	struct v4l2_fwnode_endpoint vep = {
-		.bus_type = V4L2_MBUS_UNKNOWN,
-	};
-	struct v4l2_async_connection *asc;
-	int ret;
-
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
-	if (!ep)
-		return 0;
-
-	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	fwnode_handle_put(ep);
-	if (ret) {
-		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
-		ret = -EINVAL;
-		goto out;
-	}
-
-	switch (vep.bus_type) {
-	case V4L2_MBUS_PARALLEL:
-	case V4L2_MBUS_BT656:
-		vin_dbg(vin, "Found %s media bus\n",
-			vep.bus_type == V4L2_MBUS_PARALLEL ?
-			"PARALLEL" : "BT656");
-		vin->parallel.mbus_type = vep.bus_type;
-		vin->parallel.bus = vep.bus.parallel;
-		break;
-	default:
-		vin_err(vin, "Unknown media bus type\n");
-		ret = -EINVAL;
-		goto out;
-	}
-
-	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
-				       struct v4l2_async_connection);
-	if (IS_ERR(asc)) {
-		ret = PTR_ERR(asc);
-		goto out;
-	}
-
-	vin->parallel.asc = asc;
-
-	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
-out:
-	fwnode_handle_put(fwnode);
-
-	return ret;
-}
-
 static void rvin_parallel_cleanup(struct rvin_dev *vin)
 {
 	v4l2_async_nf_unregister(&vin->notifier);
-- 
2.48.1


