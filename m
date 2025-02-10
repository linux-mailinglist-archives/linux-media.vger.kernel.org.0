Return-Path: <linux-media+bounces-25946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB39A2F61C
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CBAF3A4DEC
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A694690;
	Mon, 10 Feb 2025 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QuBAG0EG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QGb1uRij"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38AC25B67D;
	Mon, 10 Feb 2025 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210210; cv=none; b=YmeAbfDwajGeiGMRgDT566zt5aXtXKyxyCDgEkL93uXia7KU22gni3oTdZm+aT9jUq//oENvSWvV3qUDe+VEO7kLOpDOAI6KOSsod0S3//faqs6tpKDgFUZcLHFl7id7dZOcYMLmVTB6od/KjqM0fmn+Q6UzdrUYAwGYBC9SNm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210210; c=relaxed/simple;
	bh=2zZuFSg/JcxyXGwQl3ZYPvYFSaljIbxPocAJ/rF6rVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nos4hOmoKJN+p2b0YYcHD40yxM9GpIl6mOWM5U7QUI0GC59dcA4Z35OPMjFRqzsru+koUdtfepwoqwTxUt8zUap1VgOTI3GNd5gqhi7H4E3rKspILa8MCxa+bGJvvdME3Dm4Y7aVbUPykagFgBZ3sf0a15GF7DNk4/ejUwQKTJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QuBAG0EG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QGb1uRij; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BCEB811400E2;
	Mon, 10 Feb 2025 12:56:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 10 Feb 2025 12:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739210207;
	 x=1739296607; bh=aL5vU4AQTAt1GuJKWFcWB/1PAooHMP+SRXFny0kf0zw=; b=
	QuBAG0EG0u7bfDV53xlMRnIDV2fPb8W4woEEa7k4XFzU+MRDIWTwSeZypL1ZWgGD
	tCZES5WjsTLtyf/62YZ2wcGwwhei0iBmv3/bhVlC7Mqav7n989Z0LBKZaktjg4HP
	E22g6q/PlMgG4sCtEvMhXaANdnCWxMpIpbSHHQzPPT+CP02/sntgpR+vQpunpPiX
	GyvazOQb6Eaz+SGIjGJ9uSTfNzuoLsSJuX38tSQ0qKfVlIhlEcTeWQ/HR8tuFumk
	bKjfmx+rjo01qqvQ+UqNGAFFezOwrY3rzmuSnLxuEWDNFH4CUlUUq5li7o7xP0c0
	nx+YjF/6/ZnNG43ow6QOHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739210207; x=
	1739296607; bh=aL5vU4AQTAt1GuJKWFcWB/1PAooHMP+SRXFny0kf0zw=; b=Q
	Gb1uRijz60MD6XO56aKcykzKHMbICaV9ZDRYomEMhTpaD82Xecjr/yvG3VerqoEY
	q8m3NerjYwHNx873JV7O0RkYwbHxab/zyqYiVjbrclQdPjN6edz9OSFQh3ONuU07
	ZRgzvkJdwAfLmFEQDLaHcbJwg6VJIANt7x+KSjBxDptAZ2gFVSFeZu3ruo2VICUF
	nKsw8YvcSf6MZnT8R2OgQOusscNA8nUvkIAdejDySHvI7Qbo8ESB426cXnEPfRTv
	FwN6oICJPd214ge2mfdj/jhn5CZnfLTyxTLC6aHyDmydT9bykywCyW94OqtD7xD0
	Ps13uu9GcUktfKSCwDn6Q==
X-ME-Sender: <xms:3z2qZ0koNWGCEvo8b-60kRZgERFdC2uNY_B9Nqw299GWpHY5kg9bDg>
    <xme:3z2qZz3ZFd_4G1NDc8YDaQ_dbZNLQDyit7cFmYl7swQ5qHB-ViT8U93S5gFc_qxUc
    jNUToQudtc0KSlj7lI>
X-ME-Received: <xmr:3z2qZyqlFr95F2WQ4MnQ5703e05eUA4ZY4YTK71DoYXOu2ABC0_wFcoBfJiKFJbnIEptQIFV0V_yNIlq4Mr_M_dzqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeejfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:3z2qZwl7o6gdvg3eRpKQuFE9GjMaPk3klouevIi4MKZmPJQK_AThpQ>
    <xmx:3z2qZy09tSSt7Cbra3KnHOfz7hz-sHYd5-vRkeBdD2l2kfIV77rcng>
    <xmx:3z2qZ3sWhGIENE6_qPXv4FdAH4qjNERhsid4iIuK_1MouwJZ8BM4wg>
    <xmx:3z2qZ-WlcXSFnzQYSNLmtsxpiJDS24uvq6xwlXGyMmxfjGDU2BeGlA>
    <xmx:3z2qZ8oxUWVTPJ7IpbDPwNdxTpp7pKX3L84CtOzI9NVJikc58VdECVE0>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 12:56:47 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 2/5] media: rcar-vin: Remove superfluous suspended state
Date: Mon, 10 Feb 2025 18:56:12 +0100
Message-ID: <20250210175615.1686529-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The VIN state of suspended is superfluous. The logic was that when the
device were suspended and in a RUNNING state the state was set to
SUSPENDED. And when resuming it checked if the state is SUSPENDED and if
so started the device and changed it to RUNNING.

This can be avoided by simply checking if the device is in a RUNNING
state at both suspend and resume callbacks. Remove the unneeded
complexity.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
* Changes since v2
- Update commit message.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 4 +---
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h  | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index ddfb18e6e7a4..b8e35ef4d9d8 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1085,8 +1085,6 @@ static int __maybe_unused rvin_suspend(struct device *dev)
 
 	rvin_stop_streaming(vin);
 
-	vin->state = SUSPENDED;
-
 	return 0;
 }
 
@@ -1094,7 +1092,7 @@ static int __maybe_unused rvin_resume(struct device *dev)
 {
 	struct rvin_dev *vin = dev_get_drvdata(dev);
 
-	if (vin->state != SUSPENDED)
+	if (vin->state != RUNNING)
 		return 0;
 
 	/*
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index d5763462809a..4cb25d8bbf32 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -67,14 +67,12 @@ enum rvin_isp_id {
  * @STARTING:  Capture starting up
  * @RUNNING:   Operation in progress have buffers
  * @STOPPING:  Stopping operation
- * @SUSPENDED: Capture is suspended
  */
 enum rvin_dma_state {
 	STOPPED = 0,
 	STARTING,
 	RUNNING,
 	STOPPING,
-	SUSPENDED,
 };
 
 /**
-- 
2.48.1


