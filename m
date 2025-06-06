Return-Path: <linux-media+bounces-34274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0789EAD0808
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5CD0175BD1
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F001F0E3E;
	Fri,  6 Jun 2025 18:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZYKR/FJA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bj0Frfrh"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5D1F09BF;
	Fri,  6 Jun 2025 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234423; cv=none; b=f8AoVf5bFNujNuKXoQz9DV0erTzJLo+vVdg/iFSR6tNCJ3/qMZN3A0WMAoUeQBw7QMt2JlavEJy5yeOYRvPrqCztb/APGlnjJXmkYNAM/QEo8/VQHRY/7dUwLeGsoQBlada4AIxnfMcNDcAs7xKNMyjlT3+oh9VcrNK9r6cqJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234423; c=relaxed/simple;
	bh=lE0WsS90WkPE7VQV0KC6eO9lopW+TUGJchm8rLFLw70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hCjuOW8gc/8TQIEETzrZ7NfuceIT21HGrRyVypdpW2jjkBQmIN2sr+7hzx4my5VCc+mdTW6Llkvg5m3skUMptL95GupPs8bCXBaxabp4lvIp8wLtAua16URDUOluIrfYh126rtTrP7a2DzoDCdn+6ydKbA9FDReXXr3/b9hPwII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZYKR/FJA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bj0Frfrh; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 9946811400CE;
	Fri,  6 Jun 2025 14:27:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 06 Jun 2025 14:27:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234420;
	 x=1749320820; bh=5gwtMDHfO4I9RkFyVY0X+kDMEW+Y/fFd8b9nYKmykj4=; b=
	ZYKR/FJAvlT2MsXR73zjEaleXPQvTYWjuMAYrLV9AmJVXROvVr/LmdCMGXPUJoGe
	gJ/kyggWRpa18df93y2xHX0Yb6lQ77X3etwunntApItDnUYLGbJSrwrepuBlJpYV
	jnFcuMI7BwQetys8uE3z91r1txuj1zQza9BFPy3BNKpctkATg6FQqXBXCLmibGgt
	BRVb/INtPaPDlXBiu+/lZ4HdKSu3YvYryDm7lzDKYs/4L2QlyTHLZIqBVaQICDAN
	ElsDAFqWbXAwUqsktcGa/USU9Umi2CPUmW3bko+Wo23u5/rTdJpXnFjOBpvwjeAn
	uGu1Djm45IqBiiYuI7HLBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234420; x=
	1749320820; bh=5gwtMDHfO4I9RkFyVY0X+kDMEW+Y/fFd8b9nYKmykj4=; b=B
	j0Frfrh0EgGjY+4+WnX6KWj2zaKCCia7OC2ouYOcgpO1feU0FDJe5CHubbGDpTzQ
	sPW4P+HZDghLNS2+dWAdys2QTWqW52bPKZk5y9LnNqhkUSLaKuf0TRgNFtc4SOKl
	6O4JyMfFihUFM/uezamPiOZmrT2iLmhHYMdgOwPysb04OJ6F8WN9XnF1AjBf5mpn
	n3MirquKSPfsrBErppdZUe5oYKjF174Rw90yo0oLkYbktW39JtzvWZWZhr6Y17wZ
	lVJcz5zi8ZWVgJksB5cFCu6GXAp/xonEeOJpHQLsjTJTZFNiJC48kvXdDaT591pG
	0hcxGbE2bT4fDTEtaD2ug==
X-ME-Sender: <xms:9DJDaNBIdDlbUxuDfNe1NRz2n18HMvX-HZYYEF2dmBIJNs0gSfvwrw>
    <xme:9DJDaLj8o7f26SlZFvtJPaUj80WFa36yRFIw8XJzKDYjHBg7RQP7_ul8UHOMSpb-N
    dMwPQuq8EpxnAySE7c>
X-ME-Received: <xmr:9DJDaIlC4AYyypUGzOXgkzWDoAQS6gEpnt7lQuZQ7XruozLJF4HX-l7VZhi4ABNIb9zMYjq_nl3hlHSJUh0b3hdh>
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
X-ME-Proxy: <xmx:9DJDaHzWctKGX_9CAhwszmOyenXi1g6gFSec6QnjCDWFjohna0OWbw>
    <xmx:9DJDaCR_LEZrHzI4eEuUit6WlWCOKHT8kdh5rny1dPLMm6mKl6sPwQ>
    <xmx:9DJDaKYWQ8kvsH44D8ZgSQSniqSioRuUo4p0nPAosLkfDHB7PSjyCA>
    <xmx:9DJDaDRajz8YWNjjVqO13PSNPGoW_qGwL0KupjBPJnhN0petcw61uw>
    <xmx:9DJDaJsrYjfcGNVD-Hs74wW63ZCPdMZeAGTecZnxfFpvOwIml_h_suZE>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:26:59 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 05/12] media: rcar-vin: Prepare for unifying all v4l-async notifiers
Date: Fri,  6 Jun 2025 20:25:59 +0200
Message-ID: <20250606182606.3984508-6-niklas.soderlund+renesas@ragnatech.se>
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

The R-Car VIN driver is needlessly complex and uses more then one
v4l-async notifier to attach to all its subdevices. Prepare for unifying
them by moving rvin_parallel_parse_of() to where it needs to be when
they are unified.

The function is moved verbatim and there is no change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- Fix spelling in commit message.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 106 +++++++++---------
 1 file changed, 53 insertions(+), 53 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index e50cea9c04d3..df3f15bd95a4 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -338,6 +338,59 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
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
@@ -636,59 +689,6 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
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


