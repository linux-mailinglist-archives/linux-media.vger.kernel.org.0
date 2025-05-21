Return-Path: <linux-media+bounces-33028-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 569D4ABF5EE
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 15:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7551F1BC4386
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 13:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E8D278764;
	Wed, 21 May 2025 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="oo3n5ogz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZPSqayEO"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5968E2741B7;
	Wed, 21 May 2025 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747833696; cv=none; b=pEEARUF/WxX7WiWxNVaCWSNeq8PXgeNqnJybA42UfEl0cBKdGfTSh8YOR4iKpMcO35LPEzjlPONlcKzWgawNxejIMyERxs23utzvAp/Q19vxjE1D3ShvfEh6KeP/c2fZP2ED5ie3m4BD3C2BemYalz2TYsBVTP+qliUqiAjQA18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747833696; c=relaxed/simple;
	bh=tiQq2aUR4s5BN1U9Mnutlbvtuz4JcENAJANylorh73Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6Qpo1xTEr4Hzp/1YeuBwHL3HEvREAdZf3U6E8OU3FnFLggPMc0mUjQe6Pms22+ihFnrYp9QBd/xjpwfbT9A77K/zG+LEaXpGOl1DhX5BGAWQh175cFMJxNO8/BhXW5Rji0X2sU7bsBziTnf1SgRSJyg0wiEvHaLs/QiHVVMFlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=oo3n5ogz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZPSqayEO; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 90CD71140133;
	Wed, 21 May 2025 09:21:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 21 May 2025 09:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747833693;
	 x=1747920093; bh=X9VXSZ9ohUgqAePwtJcZ1P/Spf3kFkL4rwcE7ZTuyb4=; b=
	oo3n5ogz3ju/U/S4nhjJoRQ4dKVsIxmjFgle7fGpc3A8OE43LQAa5HRpzU/XgKp6
	9l7+iRo1pOZ+MRqFuxl7XzBj9MWGvyJVzq0UuIKh12CaHk9fzuyH6NTZ7/lgGbw7
	9KiRpjaLQuwGtUunU5nGmtr3VntS4QPfhTBCZ92TFA6V21SZo0OSqt6ORoM3y2ZH
	21Nd1iIhSAc3jP8GdiR3YTUeJ4zGQB/rXtXwy4kfCmZZqRBf9LeOZrT9Ivr/Aoqs
	JYxTrG2MkIa0TLf+MdgZr5KocpNybAQOdPuWuJPIC44cCd0mc1jZtSpyXKZ7htN6
	/v6qmfPYok3tNusshuHhPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747833693; x=
	1747920093; bh=X9VXSZ9ohUgqAePwtJcZ1P/Spf3kFkL4rwcE7ZTuyb4=; b=Z
	PSqayEOzOCNaKqSp26BmEQtOvl/fU7ke/GBVxVfqLQUEKBvoosc539R/dHm5uDZc
	HpSEQXoBHCeAers0n2fgFIMPQmSOHLCY+q+KCyD60JvyvsLg1Ja4ILO/39jkZnod
	Ua31ahT0rlfaFVJETqCoSNkb2TZu169sVSYLuroNio+ohteZ2zqnGUBZEf88KfCz
	/EBJVElD4pbbGnWnbKUTKz/ToeMUhcqireXWdEUlpRY7/VDh3GyzNeEKPlslYvGh
	L24+G2qYaIL93ufHyoooeyMrF/DADNmmrg+/k5z6JOI4+OEf7llwOD9ZKNNBsWv4
	zpf46ASpe1Hb50gJhujeg==
X-ME-Sender: <xms:XdMtaIlRlcxdi1u162sVRdkZZbB4rpZimad2l-QWRhSvLgGwvHwtGg>
    <xme:XdMtaH3pFoPkKBTTeHL3l5X5KviW0MvD1h_Nh1XjKWhjn6oVJub7esP0wsndOPxme
    YT4dJX_FinFKxR9eu8>
X-ME-Received: <xmr:XdMtaGoQJANc61ASthYLL3u30LmBEDxHrOd16l2hGyZKcRv9l_X3nzA3YV6yrgekIAKwhHauT61zwvdzhQYN738->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudelucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgj
    fhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnug
    cuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeuke
    evfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
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
X-ME-Proxy: <xmx:XdMtaEmltQ_g0whTcYxN1ZnvdVIs3TCmO1foWcbI9iOfPcEOmTa72Q>
    <xmx:XdMtaG26ZswIbgRU0KsGTbt8mL8LFDavwxF1pBxQcu1X35rEVA8ZBQ>
    <xmx:XdMtaLvqnTaPH1uS0hHQoY5JW1p7Q6z7ANaqz7lvzRmUdC1MwNUhIw>
    <xmx:XdMtaCWFIiNsrlZSRfWTbInl_exRyeH61Sb_eBV_HtyskcLiJo3j7Q>
    <xmx:XdMtaH1UBSqkXQIvMrEmcRGJ-Dzy8mwESsGsZrJBBCl1YXgJQjOneapF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 09:21:32 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 4/6] media: rcar-vin: Prepare for unifying all v4l-async notifiers
Date: Wed, 21 May 2025 15:20:35 +0200
Message-ID: <20250521132037.1463746-5-niklas.soderlund+renesas@ragnatech.se>
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
index d9ad56fb2aa9..60ec57d73a12 100644
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
2.49.0


