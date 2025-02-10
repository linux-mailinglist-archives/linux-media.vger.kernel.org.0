Return-Path: <linux-media+bounces-25949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0841EA2F615
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A55C1887415
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A55257440;
	Mon, 10 Feb 2025 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="O6WtvWV7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FZHz04bQ"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BEC25B66E;
	Mon, 10 Feb 2025 17:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210216; cv=none; b=lbpMUjug94q0M4ySPk0bxhqOrKoNW+0Y/bye1CPOt72F0aAr97k2MmgimY/fEH+XVxQBHb9xnlFaFBCNgQugjxg1mYIhE0g1IqLp7o8hyMKoweGVCRytMcXYqKOVtZ3xStb1Jezj9FR2Pn0i3w2CalM6ayxR/cnKdRgB5oJvS5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210216; c=relaxed/simple;
	bh=H4IDeRAmX7Y4WnQ+uVNW07kZp2AdoCg6R147e9SL34c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrZBePAYTS+Q0QbY0wA2H1LiSBrAFZT+0xqMmo95YFoAeOvwaTEEJp+/VN36DIGXqURpgggx2qDlBIc0rHpAA+T9xcIfYVx48ybbOwtVa/+ZtWywjfJGsyuM5Kex/mwSI+BbOy4xdrA8BR3kXs6KVyrQd42bBaTnqEfrKILmgng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=O6WtvWV7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FZHz04bQ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id A55E213809B5;
	Mon, 10 Feb 2025 12:56:53 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 10 Feb 2025 12:56:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739210213;
	 x=1739296613; bh=OS5OapSvaFpjT9JRLG5DYp9nzVMqDiBRyUF9duh/Pbs=; b=
	O6WtvWV7MRT7WxItCGJtME1Sd7Vldo6hqF5hzHGl9vcgjINuOu41Gu4A0YV22+FX
	TjHFUTCpL5hAXsIIdJamq001vbnMzK1PhTAoVX/xiH3uznx+Uo/RtUw4KoXc33S9
	iG5MzCRY89KzNd2z/GcuV+A3cd+UAGgWf61cPnRVBPSgp747aVzlnT/XJQvgY7p3
	F4Za9ysoN2G6oyAgbUHv8cb84Ke5xPbgSPt3OMgP3uSFABpfup/iLf9dk/Dup9yT
	hVluVR36wwUMou7sEUCY1f24rVzuxRONq/p8yvHbRdjI6HiNkCfryaTnhvTdiVkT
	wRL9Mjc+zpH6DdIqBaIfQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739210213; x=
	1739296613; bh=OS5OapSvaFpjT9JRLG5DYp9nzVMqDiBRyUF9duh/Pbs=; b=F
	ZHz04bQst5qFZlBfWLr5ZevqYVsxl/ipwfUNQiXAQww23TjG71uPROGGzpiRrJps
	XcMBCWmpqjQDFtNwMrNJA1xacAZ3ZJw3sZHzyaqng5SvxLlLxBTWj0GTI5fLJ7VK
	7EN+8px77VMGEL3Gxe1+zRDPGHzXP/O4Bh+zaFqpaQbUf7yLTXLEKlG7zO3FKkOw
	VuFuRoWV/VKJM8eDwHinuEQvothVK6XcLdgBe8IJ/6uyoInkLSnpjwx1V4bF6jde
	1d6CYFcrnFifqhs3XPUAxHCURuNDDLA8ZZVnXorLpFKd10p388aDfiLnrSQD2eYs
	ousW62MI6tjLGkj38ZmnA==
X-ME-Sender: <xms:5T2qZ6rNwrb6wGfTEesqcxxNAZIVmj_kBvPQlggHvB05Qyt252uJcA>
    <xme:5T2qZ4ppZiIQ1RSCPXgd0Wy1QA-cddKi2Bn0QyldX_oqDrFhJ-J6CIiym-mEB9SYx
    CGvXWHLYcYq8mcA5Oo>
X-ME-Received: <xmr:5T2qZ_NDBZd02X9X7xugEeJY7Af1wGErf6qAurxTeoBuPyZOpa05SDcs1L9dN0km5lpCatGIeFuF69SOAsP_J6l4QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:5T2qZ56sMavxW7DiZm7-QNhSBeZQ4xdxOLR8fk0KZkIXAVfg_gi0RQ>
    <xmx:5T2qZ543KOfzXdJskQVsOhtJWAtcOD83w8PZN8OdxNDVEBEt-z6V5A>
    <xmx:5T2qZ5g-plhMONqXJ56KCBgRUR25gJlqi9bw8lMz_xx2a904afM9lQ>
    <xmx:5T2qZz7IwhGnnkG4NLEiAfJvIoDCW9VSq18iXIuqzX76Z3_wLhxx0g>
    <xmx:5T2qZ2vxhokzSMzsFHh2cw2-uW91OdKI0MXfqHHUAPDPmN6hSwR4BB7i>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 12:56:53 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 5/5] media: rcar-csi2: Remove hack to detect NTSC content
Date: Mon, 10 Feb 2025 18:56:15 +0100
Message-ID: <20250210175615.1686529-6-niklas.soderlund+renesas@ragnatech.se>
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

In an effort to emulate support for SEQ_{TB,BT} in the R-Car VIN driver
on data captured from a CVBS input a hack was added to detect NTSC vs
PAL. This is ugly and as support for emulated SEQ_{TB,BT} have been
removed from the VIN driver remove the ugly hack.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-csi2.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 0a53dd47d7bf..7dfa2729209d 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1045,16 +1045,10 @@ static int rcsi2_start_receiver_gen3(struct rcar_csi2 *priv,
 			vcdt2 |= vcdt_part << ((i % 2) * 16);
 	}
 
-	if (fmt->field == V4L2_FIELD_ALTERNATE) {
+	if (fmt->field == V4L2_FIELD_ALTERNATE)
 		fld = FLD_DET_SEL(1) | FLD_FLD_EN4 | FLD_FLD_EN3 | FLD_FLD_EN2
 			| FLD_FLD_EN;
 
-		if (fmt->height == 240)
-			fld |= FLD_FLD_NUM(0);
-		else
-			fld |= FLD_FLD_NUM(1);
-	}
-
 	/*
 	 * Get the number of active data lanes inspecting the remote mbus
 	 * configuration.
-- 
2.48.1


