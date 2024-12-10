Return-Path: <linux-media+bounces-23068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCF69EB56D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 16:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 897C92824BD
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 15:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7BD22FDFC;
	Tue, 10 Dec 2024 15:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mej+orRi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fxVbKGPV"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261B619D060;
	Tue, 10 Dec 2024 15:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733846058; cv=none; b=PLWb1pIp3HW9dyjVJMUUbsT2j1UFRU2SeqOkHjz9PmMJPoZDAwcdqTLY/rf+TdjcdZJE3D8Tk+igqU67tGGH9waYhl9+Q1w7nTiR0Rz7qMbS3kMNm2m1eN3MNCu2WLei8rwF5dWfMMXXFFkCd9JUrRGxfxXfI8LF+buS5lOaNMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733846058; c=relaxed/simple;
	bh=kRYLrlZERGTJiX+XRI0SjmBb19NzgXqiGx7qBkTkgCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VTSA+BiorcBLCHPv5C8ydIekZswjF8gJc29AHZxG+Q4egwTx1YVFXxzWeNAWssABcFn4nwX88KOHWWZPglwb/Y1XIa/s37E31gj9mCPTwNA7qSUCLLd44vI1mjzptNLEgt9hUeLvdbz6N0HvocBg5vYRr0si2ugYPcVsWNQfkv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mej+orRi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fxVbKGPV; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ECC241140094;
	Tue, 10 Dec 2024 10:54:14 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 10 Dec 2024 10:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1733846054; x=1733932454; bh=gX
	z/EQp4MGmGNh0jMaQxPfDGA5G7tx+NaFxCgBbH+0k=; b=mej+orRiK++V52Xwy4
	Z/l3AwwmqC3E8WvwCUVXftiMb1zS43x30EF8qL2Zcu0Exc7akc/wlnjXsGrMBlL9
	qGIz1ZZuzB56O5QXaHTUiHuLHJWUi2HOTUxFHFx1e7txdAT/+XFncKkDdXtWYDnI
	XjOxFr4txG/Zc4h5ue5T1VdGvWWeLxX+GPUGxtTxJqBwAF5uZpsu5wQfRuVv1ln8
	UaDYAwMqaxNuL96uy+5iglozFWWRJqLZRj3WGz8bPMuAiKrW7F1y2ALao0v/1HB4
	O1kSY9Qk6Lt9V1Umvz+sbpH0+K1lDovsym5vOTmjTsErGV8l6OzDS5GmHi6hwkY2
	yBLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1733846054; x=1733932454; bh=gXz/EQp4MGmGNh0jMaQxPfDGA5G7
	tx+NaFxCgBbH+0k=; b=fxVbKGPVnDVtQbFrsr3S1GmC3JRDvYXE2hdCDXWmFzEY
	UZ7eOjp5dTCyHyX+i6Px+hwSogLIWl3ERxaSSXM3VOmjeL/bVjVHdJIL8Ip+dUa7
	lzc55QuiD/0KIPx53CBrA0np30IaHjKpJ5Xxtyx6dHkDRpPOT6MW2wuJc2gWAXK1
	xmZ2UzlzfRUvHd6BOA1CT56f2zv2K7d+hgEWsierzMV56ngiY7P+8nnIKLOpmhGq
	LXAJsbcAJp+CLB5Ein4z/zDuknFdL+Jd+ZPHBrsqj4t53O7QGLg+M8zk/g/buvMA
	OSn9e6XIpcYcveEpwiOZgBurlHe6FNSHLvMxNiXBpg==
X-ME-Sender: <xms:JmRYZyikXGGp3XSZa1ymtENa-N1ffskpXPKt-Rc7QCQp8otXtm7tAQ>
    <xme:JmRYZzDxw_wd2a-Y6EQIu8gyhEcAqw9sD8pBhC9IhsdDbc5NEPNR-ZtF_RmK8EfCH
    APlJrlXnm4l_7jdU2U>
X-ME-Received: <xmr:JmRYZ6Epv5lvbApPhFiNBAJJDFss_YfVqmZjaWpzbsPrlnJcZ2FQJTSfIa1bqPDZKWR2dsoD7s4sFIsHuqVQa9o3SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeekgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfh
    rhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlh
    hunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghr
    nhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefteegne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhl
    rghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtoh
    ephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhs
    sehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:JmRYZ7TLGnmVMfVrzX1JAsvO101i6_Vl4_5aqrT3Sr35wGk6a677_Q>
    <xmx:JmRYZ_w3oMEp3uUBg-tDMQ72rVYK43KKhYrDGnCXQ9E4pGwtQlG3DA>
    <xmx:JmRYZ57augiot53ITGPVYJxy-3c0HTP5eGb3R4C6OgyGA0_LhgmJMg>
    <xmx:JmRYZ8yaPpgxTONMMdpydD40-HdSv6x8u7NA24g3-TE57h0bo7nQ1g>
    <xmx:JmRYZ6qumtz5x8tETTxru002o2ivW8KTaFctnHbsrTenpTFr5ORx_-z9>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Dec 2024 10:54:13 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-csi2: Update D-PHY startup on V4M
Date: Tue, 10 Dec 2024 16:54:00 +0100
Message-ID: <20241210155400.3137792-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The latest datasheet (Rev.0.70) updates the D-PHY start-up sequence for
D-PHY operation. Unfortunately the datasheet do not add any additional
documentation on the magic values.

This have been tested together with the MAX96724 available on the single
board test platform and it works as expected.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 27ffdd28cbf7..5f62f26a6b6f 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1349,15 +1349,15 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
 	static const struct phtw_value step2[] = {
 		{ .data = 0x00, .code = 0x00 },
 		{ .data = 0x80, .code = 0xe0 },
-		{ .data = 0x01, .code = 0xe1 },
+		{ .data = 0x31, .code = 0xe1 },
 		{ .data = 0x06, .code = 0x00 },
-		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x11, .code = 0x11 },
 		{ .data = 0x08, .code = 0x00 },
-		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x11, .code = 0x11 },
 		{ .data = 0x0a, .code = 0x00 },
-		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x11, .code = 0x11 },
 		{ .data = 0x0c, .code = 0x00 },
-		{ .data = 0x0f, .code = 0x11 },
+		{ .data = 0x11, .code = 0x11 },
 		{ .data = 0x01, .code = 0x00 },
 		{ .data = 0x31, .code = 0xaa },
 		{ .data = 0x05, .code = 0x00 },
@@ -1370,6 +1370,11 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
 		{ .data = 0x05, .code = 0x09 },
 	};
 
+	static const struct phtw_value step3[] = {
+		{ .data = 0x01, .code = 0x00 },
+		{ .data = 0x06, .code = 0xab },
+	};
+
 	if (priv->info->hsfreqrange) {
 		ret = rcsi2_set_phypll(priv, mbps);
 		if (ret)
@@ -1400,7 +1405,7 @@ static int rcsi2_init_common_v4m(struct rcar_csi2 *priv, unsigned int mbps)
 			return ret;
 	}
 
-	return ret;
+	return rcsi2_phtw_write_array(priv, step3, ARRAY_SIZE(step3));
 }
 
 static int rcsi2_start_receiver_v4m(struct rcar_csi2 *priv,
-- 
2.47.1


