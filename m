Return-Path: <linux-media+bounces-26863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3325A42BDB
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:43:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 808B63B0124
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91DF266567;
	Mon, 24 Feb 2025 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="tAFCjOAu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FKmY+lRq"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804861C700D;
	Mon, 24 Feb 2025 18:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422435; cv=none; b=RMeGl54qz8GTiGOyBapCZjzIsKlP2B2VXfZ1AlNCSMNGm3NIMgvf/0/Dm7JZnCCEuVOys83SWZWH9vYskaMCMvDF3gThrn9erUREq/hLHzTrHYUkmE3IFNT31m/4j6pksRvnF9z5I+0VC64UnIFnj9WPPJWh0tbgIdmMv7k13ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422435; c=relaxed/simple;
	bh=NMd+MDAuaXHUgUMwR+V/e6nRnV+1DE4ufcNjE0fUBmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rM2jR2AAdaF02elzpLX2NZLGsdGbpayCJJAF3jF/JHHYHr1qtRxTl8eMs6hvVwYq9tRq6W1X8aJWHHiiIXLslfRosaY/VIbqPBos3sRKtFvusdXbboOERO1P7Npor1xCqQdIHA6uk5GjXwIO92Ua7aFTW27NusMC24PqwCHDVOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=tAFCjOAu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FKmY+lRq; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 8FFB61381130;
	Mon, 24 Feb 2025 13:40:32 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 24 Feb 2025 13:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740422432;
	 x=1740508832; bh=R9+wguIb+Re8+rA9V83sw+2FK5C0ZJJOpRDrjZyD8PE=; b=
	tAFCjOAu463+i70LQmuqQEBe6eg5BavhKFrDaCn7T9n+wZkA06XqGNg9ePhHR7ox
	6awWFuk8uI2wg59qzrNUWY+m+yoFuquRAG0FY7rx8Vg2S6h7p/xe4VkYtwooB8I7
	ZRDpAw+1V5hgNzitd0hrRGuDZArSzKibq0wCMqIZevcUUqvLmXttj7Rwlg8NGGhX
	PdO/9RGQC3VYAD/iqR27mBlklAvNj18O6J8kvVLtd9szR0jkXzbZljZabfNBQ71F
	MT4wu5fRhCtj+Bm2PdzwAUPFshdImmEVAExpJUUIP+EA8h/s35/IpJNx13f7Qf4a
	zqpbRo2GRUM8lmDVTVXwWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740422432; x=
	1740508832; bh=R9+wguIb+Re8+rA9V83sw+2FK5C0ZJJOpRDrjZyD8PE=; b=F
	KmY+lRqCFOOsoYOFrKSjhA+RIeYhJGSxAl7oEdHQUKhtObk639iCxkPJXEdPgbpl
	RIwEkTeNnKYj/EDkjf4qIDKXjsTZU4dhqcuCs+cI5LaOZQE3a07L2RI0Bnvs1rRY
	UG30vQLrRCL/Q0tasSTGuOwbyvHkhQ6ipRFE1q9TMFSxD0e57OEzJgbEiYAn7Nbt
	jLsqgin+JPITTFGTwBXk+/9+R6CPdENwONxJVzFoN5aWrvUSYu3lSM+3yIZgwdQ2
	kAzZeGtkKkGQSECnFeHvMK5Jjb34QSm1+z6LsOkyIeXLpmSc+33Y4RTWFHWsT53k
	ZiB8aUxU6AQBnEEOTnpDA==
X-ME-Sender: <xms:IL28ZzE2NBNuW5p5kVjuRB9mKoV9W_-_IuQHC8j8oJ9tW7W5IL0VtQ>
    <xme:IL28ZwU1DdHJZsjZf6Umu4BDxgGcm9i5gvsaD73fguKa_X7f5ndiGesIGsQFHYXjT
    rG8Y5iZJI89zIndn-I>
X-ME-Received: <xmr:IL28Z1JpPg58_RKIhun3OYGSLbbsDbkBQw_XZr0axkKF0HzUkunpCT-O87SyPKillIEskgByufsnz3krVO1C4Qzm0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:IL28ZxHwrZu9BTzPr5ALzHDYGPUUaetjErrzmtdryGWbaMSAuO43cw>
    <xmx:IL28Z5VBrtgjcF2Egy8vtRWiNYklnqLplYmEFxy6h9NfnHrifZAWvA>
    <xmx:IL28Z8NmYP3A7-bow9dMGg5nKTPVK7WWI_1r3AasnV3ycB0M_h3tAg>
    <xmx:IL28Z42EwMbKMIT2x5RrcXmLY9To4Ko1KPE6Q652vYfUsvE0vh_z_g>
    <xmx:IL28Z7KJT-Is0QQ9Ccxp0Wffmqdyb-vBbdnYRbMgUQ_YgsIvnF54I90d>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 13:40:31 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 4/6] media: rcar-vin: Prepare for unifying all v4l-async notifiers
Date: Mon, 24 Feb 2025 19:39:36 +0100
Message-ID: <20250224183938.3800317-5-niklas.soderlund+renesas@ragnatech.se>
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
index e3d2df6cd54b..3821863d8d5c 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -369,6 +369,59 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
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
@@ -667,59 +720,6 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
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


