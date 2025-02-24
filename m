Return-Path: <linux-media+bounces-26860-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF0A42BBF
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 19:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1332E17A3B0
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 18:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F517266582;
	Mon, 24 Feb 2025 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="adVwtw1a";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zocTpR7U"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630A12641E6;
	Mon, 24 Feb 2025 18:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740422429; cv=none; b=At6BKRTfL86CPvAGJr0Uyktl4yQ/AcJA17utAoFKtKdMd9hwIpdUE1GQHJay10IJhcn9zKXBDH8DC4ZF0JK+yeTK6r7AicFdSpgioqvrdKLJ2Jom0svw1/TwKRm0GFBCgR92A1ZE96l5YvxsJ6LWbqJUS0pnF+05jI+a3NddmwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740422429; c=relaxed/simple;
	bh=kulgJ/8FzqilYzSkAQL7QR1ZHDmMAEUT9TpSQaFPiQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ec42lcDa+hYAxWf9MWyPU/x6FKsUKMILMBzqNKpwkot7WxW1y2VhqepevHcv+R7M9K20aQbQHmHzUOpKoTPsInf4mdaZamkosTVDp/igSCTWZZoC1uziv46eod+fuSfj5mtUQv2uaRL/5w6/N/dMrOkZHed5ZxdOsuty4ljMZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=adVwtw1a; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=zocTpR7U; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 570011381129;
	Mon, 24 Feb 2025 13:40:26 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 24 Feb 2025 13:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740422426;
	 x=1740508826; bh=1rFOoL77puI9P/jkLdgqnIEf9zSShrReWii6Vid1qsk=; b=
	adVwtw1ao0xEbX3ZTEGxq7XBYiQjFpFZXLF5o7z8XdA9fthGNKnIPhVdSsErRDoy
	lx0RfUo+n41n8xvOC4+TnGvD/k0fNDIhKqf8AtfV187n6h/obVpYyGr2RFivsG0K
	gDrSmvSI4XdIPuQHaw6wXm6QkaOGzIGxpPM15cIg22hoP5uQXJQayoCrs73LzgMG
	vIaohkwO+oT4+uYmam42287a2goGqaydqpiijQYWYisco++mdjzbY8iOgKUwFIP1
	ZA/w15JCPBGKSb/gvtOutWE8llnTZ9tgqVPmR5F3Qlgwi6RT1klkJ4I5SKWxWsM8
	9iyocT61RjleO2A4V4coTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740422426; x=
	1740508826; bh=1rFOoL77puI9P/jkLdgqnIEf9zSShrReWii6Vid1qsk=; b=z
	ocTpR7Ux6XB53DAiyuSeuN6A+7n9s0nkA75sgItvi4XlzFJPaSYuYlMBTXCUu4mT
	u7L3mLOhL3/m3TOcf1hqgdyjDtuWpowW+kK1cNHv/YxETEbPvCFqvgD0ZB1OmwO+
	QY63PgHi8ILU+mcria/heU1C+Jde/Hr8O3xzqiixSxRHxXTnZl2/TbXewcDD/qcf
	ja1GWxk4Ky1vv1VcEAgf9dBrUOudhGs4eFo/Rc3xMUeCAGqUMFYcFNsmkHdzSlAX
	2MKKE8YGICnoVPRSbHseoLcZe2AIuUbvXNuuAYphAc6YDuGe2dQPQisbeDlc0eoZ
	7CsH3gSWpvIH1EsgrMTmQ==
X-ME-Sender: <xms:Gr28Z_tGOzvyD00tuVXafyMqphdwsjLpXvFJd2NPZibMH_e9IiJu9w>
    <xme:Gr28ZwfXXNueoNtieYcmCb4bLHGIRNqmHErmy6Q4rB9XqyN4wHwahgUMP9MbNUEbX
    mukHUUsW9HfkWxPWv4>
X-ME-Received: <xmr:Gr28ZywwjBNql2D3NY2Ou6Itq0D9pVgr4iBqCzWU8sVurL0NxaQLiPc-KuHwkQcRc0dXRPdZa-qZCkh_jkgnyWLOhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleehfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Gr28Z-N2axtU6dkvDyC2f-LNdld8y8enWNe0_zkKL4ZJuhNlOXHrig>
    <xmx:Gr28Z_9UGekNkzoimihEmc11SzwArYwxcLEDLtxMYHDUBXS4gOrhtw>
    <xmx:Gr28Z-XmIAAvTiDfgNOkEMUdDAnY11bezTxSf70PeNedvl4Vdd_lvA>
    <xmx:Gr28ZwefLYHPSojGpF0CQuuMjLz5Rmuk4qRuSKi63idN87r-P5jpOg>
    <xmx:Gr28Z_xgxHWVGZ-nzyTqYbr1IvJhvstxzOP4zb-eCTZZ8NUeVmDZ3qfN>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Feb 2025 13:40:25 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/6] media: rcar-vin: Use correct count of remote subdevices
Date: Mon, 24 Feb 2025 19:39:33 +0100
Message-ID: <20250224183938.3800317-2-niklas.soderlund+renesas@ragnatech.se>
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

When extending the driver with Gen4 support the iteration of over
possible remote subdevices changed from being R-Car CSI-2 Rx only to
also cover R-Car CSISP instances. In two loops updating the bounds
variable was missed.

This had no ill effect as the count the two values have always been the
same in the past. Fix it before the two diverge.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index ddfb18e6e7a4..fcb3162f9ab6 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -262,7 +262,7 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
+	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = NULL;
@@ -284,7 +284,7 @@ static int rvin_group_notify_bound(struct v4l2_async_notifier *notifier,
 
 	mutex_lock(&vin->group->lock);
 
-	for (i = 0; i < RVIN_CSI_MAX; i++) {
+	for (i = 0; i < RVIN_REMOTES_MAX; i++) {
 		if (vin->group->remotes[i].asc != asc)
 			continue;
 		vin->group->remotes[i].subdev = subdev;
-- 
2.48.1


