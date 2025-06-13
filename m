Return-Path: <linux-media+bounces-34777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C5FAD916D
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 17:35:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C1216CEA7
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 15:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3BC1F37D4;
	Fri, 13 Jun 2025 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Y5q0ahCa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AuxF9Xzm"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AB11F1909;
	Fri, 13 Jun 2025 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828924; cv=none; b=mMLcfE96V0QYS6iQ3weY6SK3czDV/wP26TmM73orMIh7QkgouToLMVVSFELhcztRmqpF8+JjllEddP9nd5ZcULXr4T2ceggHvXDL/g9l60j/ZDghH3L4QsMstVHHXO8EBy9M8fd98MZpt13T2KmvXD5GWOkyQWU/0bjqPH+EsKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828924; c=relaxed/simple;
	bh=LQ2IheBHszXtkhIw00jgIJjtfh4Yh71s0TbRuyheu3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jvqft77O5A2RXeQI1kiq1EM7SKfwKwzLjp30sGROvtb4I6DOku7aaXXoMR7qSZeNXRYIPeBAXzjxj6VMqOhvw1r2XgKHrrBWdzo8ssX0k4Nyne0aqk63F4xyNycA8XBDRyP4t5RX2fesrni8QzpPhhPYNMo1WroIRUrw8XAs120=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Y5q0ahCa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AuxF9Xzm; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5B63C11400D0;
	Fri, 13 Jun 2025 11:35:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 13 Jun 2025 11:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749828922;
	 x=1749915322; bh=g4jb43/82mpoFvvL1Mx/+Hv47TgNB1V6sB8OFc494qM=; b=
	Y5q0ahCaoe+KFPtmjl5/xayKeRdAQq1cpeYOugcT5hgsrDdm/7Y9JnyAvZyeQWsv
	fV1C92RHZh/c/do/koC0XFnV/Z2KoCiNQ210K80SdhbmLEhQMGW+atSbIzuCTfbH
	1+dq7cvPHz9jr3Jgm+8W2sL8yfj7RjvZtA7RPpY0aR87ZruSRD32P7sAN/suW+Xo
	YRqa6TfW5AqT3vbuTb4TMhDNYj2YmDYTr++eoYDAxDGaKqlj+NXXJWccVwsnAI11
	zA4tJVNKTX314+pJ7rCz202NcS+5V5+tWd8IMt+9O+hvp/NXZ4o0PRb53tqlZZq3
	I1KXJIY2oA1jPGO+slwuFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749828922; x=
	1749915322; bh=g4jb43/82mpoFvvL1Mx/+Hv47TgNB1V6sB8OFc494qM=; b=A
	uxF9Xzm68ce5kLrwiTyydera1VsbRyamBaAat8Wigb6Y21J3cJU2SlhI1+RSuYUQ
	1zWozXxZzwWYtswAbydJCrzuT4t6lr6+N8rajJ3086cxHMS1Vd1nDiOKWm/gsral
	ZnXaxRqjNjktVTd6+jVjBlalGfLv2Yodad1iovnb9d3bLMoE1S/NPEjeNPN5m/h9
	AlM3UhH+hiuvvv+vZo4/f4lv+O8PjnJRkJWDW829jveCJ2/JkhVyIInlUc2+/Hc6
	bXz+7bVoe6vtkMIQitvMgUXm79rw3eCGPygWyNM03MzcQCR2CsK03TbMLPJhytt/
	DwV/EWzrQUhpeDLKeIJCw==
X-ME-Sender: <xms:OkVMaPansC7ajyOpnSzU8wrUG9qLkMmxbbEx9xeksfZpRtZ8iseaVQ>
    <xme:OkVMaOaj3ArarudxBDIqgsDVsq4YbWC-vKdtGa2dcvgu0erQNTEf0uoivmRKJae0o
    h1QHLRbxMNgTYFELJc>
X-ME-Received: <xmr:OkVMaB_Fml49lCLH4ZO6Xpm2JcazgEp53H5ws84l2AIVt0RUBDGZLgmbg-xhHEs1FUeXTVF5zKb5yfbtuOFrny2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurh
    gvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthht
    oheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:OkVMaFo0dzQLeu2qqK4eewe2_VohB19JiAevmf2GnLLOt6hRCGtxSw>
    <xmx:OkVMaKrqBft7ladyFnL-qGPiaQH3J1ZtIvbCTf1KjDhYxbezxPVh_g>
    <xmx:OkVMaLRC-HNU-4HVvuU8eI_y5pRU4d9BiWLgqjXRMJNL-J-TlwMqnw>
    <xmx:OkVMaCqwL3VCQ9sSsYiVI8dFMYME4XFWbixsVRjwFaY5msjpEnsD4Q>
    <xmx:OkVMaCGNSU3oxdKXga65EWRpZ19QzAhuPdjBJpLWvvBtb8kE9KfWD9Ic>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 11:35:21 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v6 07/13] media: rcar-vin: Improve error paths for parallel devices
Date: Fri, 13 Jun 2025 17:34:28 +0200
Message-ID: <20250613153434.2001800-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v4
- New in v5, improvement suggested by Sakari and Laurent in review of v4.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 28 +++++++------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 95621c11eecc..28070ada7f60 100644
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


