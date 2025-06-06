Return-Path: <linux-media+bounces-34275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B1AD080C
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B96C33AA45D
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4094F1F130A;
	Fri,  6 Jun 2025 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="FLDNKUmV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SDIYNAme"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F611F0E53;
	Fri,  6 Jun 2025 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234425; cv=none; b=YStqHzAVbIJiKE9EdyM64mJARJlIpABeiofRUzJdEOdH8OwtAlsjL3v+AiTYDHLKBVMc1HaJZKIyVQ2HOmf7/gkfBLC8UQ6F8UgJBuSrXyq6SEZwGzFnkTS09ywiZPcsed+du0+zBYEEgafp/2kV63/H2yszVD+N0xklNy0sPRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234425; c=relaxed/simple;
	bh=WqeEfXgzDhPwer/3LsL9IidT1GfF/EdlkJdneS4qrUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DxOCJ+c6RN9gmAsdvHf0HHC7A1ptonSfDgxx6hOBS2xrPswFeaWBTdPYYh0IAanm8RX474iyKb3BP8vtrFctWghmcsAR6aHdBgs0XBoE/Ofj3JtH7qZFIBzDuJ19U9zBxDHwVc2zbZooSzvksGKRS6j4Q704ILoAbT+WBpQZE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=FLDNKUmV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SDIYNAme; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E975225400BE;
	Fri,  6 Jun 2025 14:27:02 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 06 Jun 2025 14:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234422;
	 x=1749320822; bh=6FHBc/G6fB0dY50djqd9nev3/LPTB0/UCkeWG9ABMQw=; b=
	FLDNKUmVxcKPKru4+O3fANcu+SSMxfJQ423XUG9JZdGgH6jbIkKF4IbCRR4pEjwz
	QpLFVccrBwL6oDU0CfGKwpSESGkRhzakI/gss4YyCymHXR/EQH8InN/YXTXctK4G
	zvSC1kfdxRPpUWWtMcnUiGumk4NnwMqu5Qgukx6h7aNtFKPsN4/lpt0LIEn9Hx3r
	f+VNESt6uh6JAxawGcx7Zqn1gqaqA8GDeqNmXC/Dm+sht0p1Jkl6kgpE5eA4kEwW
	uDFRJm5yUW/AOk0pbhdpT98mCIiau53mbHEGeDCtZIs2Wu5/ozTWYAkIyrvpqL8T
	tPE1QDiyrpCsKnl/EVtIxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234422; x=
	1749320822; bh=6FHBc/G6fB0dY50djqd9nev3/LPTB0/UCkeWG9ABMQw=; b=S
	DIYNAmeApevM3JFIOvpH6QdlPPvdy+0Dbz82rtq6LcjUiOKMMeZl1emXGhUKAd9a
	C2AKk+ci8L/sAa9AGs84lT654/0m6sk5/QCn1sINg3HW+7Jw3ii7tbwUE23UfQey
	0VP/yLKoGapttkwIGyehKe6kKvkY9vQeleeWz+/NHTECYSTy1FP3kVgysui/k5Qv
	M4QDwV0XVZfuIymylYDATOWYrman3kd9DM6Ut3CgNh3qGpTjkE4FSVRLRb2sFm5L
	KgI9wqNFYFCHcDG3gOpsHT0mQ92RvarYL/6tYnztPOLdx1q77N38tP1rPppmcKoe
	qBO3cQwuvBlGUYSpXOxow==
X-ME-Sender: <xms:9jJDaFBKvKUdZ8iGFhWU1yUcIHDQc12w0I94fwzNngnjsxKyGsWyRA>
    <xme:9jJDaDigpeVq3Oxy1lTalJGXMjA5kX_fLF2g3evwaFDVPVzmXJk3SGCwHvJWCF8iR
    8WMTHuRbfFke-SBsFc>
X-ME-Received: <xmr:9jJDaAngd9Cnt6vUMYODNfRV3eZvSwaVM_qEn6UxaQYPCdw6nGEvMbMoM0HEQXTWXKVfIxRbfn28LRA8nwP2TZaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
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
X-ME-Proxy: <xmx:9jJDaPzlgRGR0D7Y_RrIgfEHfilwW_3abuFnX4jAG9a7BjK8eNhmLA>
    <xmx:9jJDaKQYg_FWkJH69pnT5nWpwwSJ2fQ_V8L2WlGZM1hMkkTUR2cyIA>
    <xmx:9jJDaCZyCw20KNYyrHv4P2LFQiHktSoZKqeOOOUmVNM7vmyZkDI3iw>
    <xmx:9jJDaLRPE3i3y8ZfHu_72V5fjiRvVHIYMtlehOXoSx3hgGQ6ESBu4g>
    <xmx:9jJDaDAAda56RjijOuUr1rjwH2lbEoH3w9CbYW6zZUBXlv3EwAnvpweD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:27:02 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 06/12] media: rcar-vin: Improve error paths for parallel devices
Date: Fri,  6 Jun 2025 20:26:00 +0200
Message-ID: <20250606182606.3984508-7-niklas.soderlund+renesas@ragnatech.se>
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

Use the __free(fwnode_handle) hooks to free the endpoints when the
function exits to simplify the error paths and make the intent more
clear.

While at it correct the error message when failing to parse an endpoint
to report the correct node.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v4
- New in v5, improvement suggested by Sakari and Laurent in review of v4.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 28 +++++++------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index df3f15bd95a4..100432080ad7 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -340,24 +340,20 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
 
 static int rvin_parallel_parse_of(struct rvin_dev *vin)
 {
-	struct fwnode_handle *ep, *fwnode;
+	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
+	struct fwnode_handle *ep __free(fwnode_handle) = NULL;
 	struct v4l2_fwnode_endpoint vep = {
 		.bus_type = V4L2_MBUS_UNKNOWN,
 	};
 	struct v4l2_async_connection *asc;
-	int ret;
 
 	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);
 	if (!ep)
 		return 0;
 
-	fwnode = fwnode_graph_get_remote_endpoint(ep);
-	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
-	fwnode_handle_put(ep);
-	if (ret) {
-		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
-		ret = -EINVAL;
-		goto out;
+	if (v4l2_fwnode_endpoint_parse(ep, &vep)) {
+		vin_err(vin, "Failed to parse %pOF\n", to_of_node(ep));
+		return -EINVAL;
 	}
 
 	switch (vep.bus_type) {
@@ -371,24 +367,20 @@ static int rvin_parallel_parse_of(struct rvin_dev *vin)
 		break;
 	default:
 		vin_err(vin, "Unknown media bus type\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
+	fwnode = fwnode_graph_get_remote_endpoint(ep);
 	asc = v4l2_async_nf_add_fwnode(&vin->notifier, fwnode,
 				       struct v4l2_async_connection);
-	if (IS_ERR(asc)) {
-		ret = PTR_ERR(asc);
-		goto out;
-	}
+	if (IS_ERR(asc))
+		return PTR_ERR(asc);
 
 	vin->parallel.asc = asc;
 
 	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));
-out:
-	fwnode_handle_put(fwnode);
 
-	return ret;
+	return 0;
 }
 
 static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
-- 
2.49.0


