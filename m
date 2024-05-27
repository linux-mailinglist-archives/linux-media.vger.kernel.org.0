Return-Path: <linux-media+bounces-11938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF50A8D0159
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 681851F21329
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419C515ECF1;
	Mon, 27 May 2024 13:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="awOwOS0D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RzoihDbD"
X-Original-To: linux-media@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17F15EFD0;
	Mon, 27 May 2024 13:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816288; cv=none; b=QWQsHRUtk7Q2/x2khSh+t6e21Y0uJKXFiukZZZaVwhfCe8O9RiTJiAcpiYvHiaBcOrJ6jkkMPC8VbkdD7jUHIxwizdIKH4u5Vwx3h5zYAHCeEuykfJxxwwQlGoEsx90qcNcAMq/nX4BsvsvRKxlQFzQgcuBBqUFijO/IVRvM3HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816288; c=relaxed/simple;
	bh=U+d7bWN76OEXg3kt96eg0UZbq2ZOuozmla2DXyv1Hc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XEUlh8JkI/R9h0KjiPWZ2yalkgpx0WMYrEIhHvonWjHDKj5VBaAESVaqeamx8JwFAyQ/XGSF7NIm1K2KKGPPiv2cjnmye/Wbbwzt8wTdpKYsICa5wSSu1aicK2RJhVik2zOphzyTnOX0ky17Uv12EKp45E49i3IT8Y442LBVclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=awOwOS0D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RzoihDbD; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 216E01C000CD;
	Mon, 27 May 2024 09:24:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 May 2024 09:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1716816285; x=1716902685; bh=hQ
	XlxeJOVRH2Xvp6Fdd6MwDnDUPxCopdvORT6ddHbZs=; b=awOwOS0DQsjEyiGvbz
	jr9S7ELmDHDKmSGGU7i0eNnbRUtejbR6Ean/DHTvNdI7xHuT1oaTk3PQV6dyuWPo
	V7TKv7+SCVyBoG2dH10lVraKFFhpJGqoxZaYpvmlLjEWTlk69/7Ouiu3qskxjj0P
	uPP8h6JKMEUr1o8mbYTSYpVErqwMEd6gZtgkod5RRLNR+WHe5hJWhG4k8M/TELzL
	eK6wajFW4nhBZ8gMpja/pvVEWYkMnP1/JOSu6E5ikTlc6muOx/BfmQTp+y1J8HpF
	YqquVdSr9MYD4H58pi4bMLg44eccnrUE9AEh+Z4Hv0IvYgRizx1AfZlVNjGfbstm
	E98g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1716816285; x=1716902685; bh=hQXlxeJOVRH2X
	vp6Fdd6MwDnDUPxCopdvORT6ddHbZs=; b=RzoihDbDu7DEcY3z3LVHLGqv4dn5K
	b0w1PIV4847KXJ5Sx9AC0OVGDd/sw6UpKbIpDbODObxi2Fhxoult6toEOvnpEf+/
	x7fHNh3DP3KD3Xexc7RjTjVK68RPnriWbjvx++LYGWWICy7Pj7pbALspOwAlJh2c
	6sn85VQTu4JLSG/DpEXz9W8iPd24Rg3Hs2j9g4BtvWTMj9RhRW/xLSc66iOHey02
	ek45PQPD8+Da4xsv3edp7L7ODKRk6qxHh64Uo415IcW0r9Mtg0wJR2qNLuco2+Tn
	suiHrGT6K4qBu7K/EjsBm8RRZP8LJu5klPulfFHBhptishDog7ZDF4wNQ==
X-ME-Sender: <xms:nYlUZhcjmakcPFGde5bgvjyO9PjnUwhh-fnC_OwzU3IkS3lAEy4iHA>
    <xme:nYlUZvO25F7APRiTcPhUEXtgSLhJq_5S1kIKD4y1d8ZwqpRIGcVz-imTOA716LlmJ
    GvMkGdc_dNpqhgzruE>
X-ME-Received: <xmr:nYlUZqiPJD33ObMoqD71_LhcPjl2pKq59Cx6DP3ifcawq0iavZujQH8Ylfh9_i3ey2Zp6IaotBBQgqV_e4f0PjLW1z8L66mLaIz9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehudelteetkefg
    ffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:nYlUZq-GZUVifMCtC8bICRNaRd7rzDPzKPza7qWr1tuhkfPeQ6nTfA>
    <xmx:nYlUZttW0-rhlwhBZtvCNilX3n7VMhlitsq1ugltW-jl3ewW2Aj27Q>
    <xmx:nYlUZpFZz1gxVP62CFm3nQZkgOzs79mVDz2r9GOXswWNZCZopq46hw>
    <xmx:nYlUZkP6Ct3pbczXVB2oYmx4wlZa8eNmlSrD1aS77pA7zi4BriDxMQ>
    <xmx:nYlUZrVovH0ObRsBMvgmspQ45Z5_fsB0DqV-PlVCHvHykcrxJffTK-EX>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:24:44 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Add support for R-Car V4M
Date: Mon, 27 May 2024 15:24:29 +0200
Message-ID: <20240527132429.1683547-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for R-Car V4M. The V4M uses the ISP Channel Selector as its
only possible video input source. Even tho V4M is not a Gen3 board the
VIN interface is very close to the one found on the V3U, for this reason
mark it as a Gen3 model internally.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 809c3a38cc4a..a7a36cfaae81 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1292,6 +1292,15 @@ static const struct rvin_info rcar_info_r8a779g0 = {
 	.max_height = 4096,
 };
 
+static const struct rvin_info rcar_info_r8a779h0 = {
+	.model = RCAR_GEN3,
+	.use_mc = true,
+	.use_isp = true,
+	.nv12 = true,
+	.max_width = 4096,
+	.max_height = 4096,
+};
+
 static const struct of_device_id rvin_of_id_table[] = {
 	{
 		.compatible = "renesas,vin-r8a774a1",
@@ -1361,6 +1370,10 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.compatible = "renesas,vin-r8a779g0",
 		.data = &rcar_info_r8a779g0,
 	},
+	{
+		.compatible = "renesas,vin-r8a779h0",
+		.data = &rcar_info_r8a779h0,
+	},
 	{ /* Sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rvin_of_id_table);
-- 
2.45.1


