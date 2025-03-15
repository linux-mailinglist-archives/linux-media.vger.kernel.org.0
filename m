Return-Path: <linux-media+bounces-28299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBADFA62F31
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEAE1188A6FE
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFB9204C10;
	Sat, 15 Mar 2025 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bKeCYBl7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="42UPdtr8"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AD6204C03;
	Sat, 15 Mar 2025 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052526; cv=none; b=KqRzj/Oek381WPudKVaeQXSMuHh9SmXwCowr3NYcOzT5pZ8B2OZwm5UR8HSe5RgfqLNdLav+zz9HZ0Tzq6oTWIw/41OlVIxP9UNb7zGiXKbF6PU6VH5C9jiP/NgGvWeZKnU6j97td/VWiH+KSOUsJFzXtpCmQod3UwOV9FVwjk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052526; c=relaxed/simple;
	bh=5rPAbg+Dl00aallLn+1DIfC56EA4Wi8O4qSU9XIzN60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJ/DFh6S0Je3d9whaWCoiI5+o9k1/QPeDXvq2XRUndQ19VTr+KpkPnsbbvddqB3ZT2UCcmsTasHd9DCbUMyABOdLDvoGPqLtSXIOtrzlBH9XNT5HPxVzhcdFTe58lJ88Tn98IFUIh3MVkah+ci1rImiY3rLuZvfV10hgVfjSc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bKeCYBl7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=42UPdtr8; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EF7032540164;
	Sat, 15 Mar 2025 11:28:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 15 Mar 2025 11:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742052523;
	 x=1742138923; bh=uD9RCxKXL1a0oow2gZ3ChPNa/orM+CaRd7KqLYNxS8I=; b=
	bKeCYBl7czYEoEjav81JmK/2FPOQG6ozEbqFVhFMxLnsDs09mGm8E0nkFDyTdP2p
	UDipx4Ot+Nna9qKtQiLhd7gJpL4JvMKges1dYRBg2IM9JHWpE5IctKJx3afeKLaX
	j6UZOYGDik7T28IQyracFuiZ3qm+aXhn21Y9/1hESLC39Z3D8YW2G8hBSavRZybj
	/FGKmawFR9f4SOr1lctllAf8ryNSlykQOsJKKyCN0rjlD3VOnX2eIWsTv8AtC7z5
	Z1z8zButl3skY2qox5ZRjl7yf+FpdEFoaOK2jpWrAqcKKhunq8cTysInfZEOztW0
	va6xRLNYJ1w3taHiqKXb8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742052523; x=
	1742138923; bh=uD9RCxKXL1a0oow2gZ3ChPNa/orM+CaRd7KqLYNxS8I=; b=4
	2UPdtr8YHndNGM5ePKJvQlRRNkYdu4/XNW6u0yKi10vHmiUCFO+5U90sgEaObUte
	hqgAISLUYx4170MXS+e91h2v4xtfVbWg3K+tcKzN6DHxt/ZIaviakHGG40ogj6oJ
	rrJ++U06vKRgIHkiV2HGh64YTat8JckPuRV5vMJWVykSCT0JhB091Zil+rl/BvgE
	8jfXPx35EBGhAxAIg4G+rfSEZvxORkKTZl154a4H7l7lGzrS5/abhFb3fqAmH51k
	WmTW63dgjNbM9YtLmFu1W9n0DX2Nxboth+rAfwrTxDO0NDBNXJlAXbw0cDGumwlN
	Wq2Ti5/R8rbNCEUiLtZgA==
X-ME-Sender: <xms:q5zVZ7PCrFChxRpnfOW5ONEqRGfk8GWodCTVuZ0LSuB_fV52NryqQA>
    <xme:q5zVZ1_UdY-MbLEuZudB0RTIP3w1Gvs4293tiKeF7FfVChQYjSAWhIzg1ystQSNws
    g3huakmhNha9WKpzm4>
X-ME-Received: <xmr:q5zVZ6Qe7RKhzagPdnM9L0sPhiGRUnjxyhorC3JXqewKeBTt4sLLqs8kafeiz9LEKQ2eOdx4PK_uznu1MuuMdUPpTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeegtdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegr
    lhhlrdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiug
    gvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:q5zVZ_vPkNRPodZh4T80uD3CdyQRZvCLfw6EouJ_Gxc_Q7-iHTmQWw>
    <xmx:q5zVZzfUKz5akpanGlaSw9BmurVBKCgTK6-3tS964r_f9HbDwx1TUQ>
    <xmx:q5zVZ71h7a7uoKGOMQddH0uYTsfzHbjI55zDSqk8dSMgo89DYCQbYg>
    <xmx:q5zVZ__8uzPfQa2Vw0dvp9KEtHpajF2i90lKtEUel_mTJewiUHA7Ig>
    <xmx:q5zVZ--0O8uFaEsMqJqJaitAOhC1d6PvJjsPkGzBgSwOZXmOOro1nE85>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Mar 2025 11:28:43 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 7/7] media: rcar-isp: Parse named cs memory region
Date: Sat, 15 Mar 2025 16:27:08 +0100
Message-ID: <20250315152708.328036-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extend the device tree parsing to optionally parse the cs memory region
by name. The change is backward compatible with the device tree model
where a single unnamed region describing only the ISP channel select
function.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp/csisp.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index a86d2a9a4915..931c8e3a22be 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -419,7 +419,17 @@ static const struct media_entity_operations risp_entity_ops = {
 static int risp_probe_resources(struct rcar_isp *isp,
 				struct platform_device *pdev)
 {
-	isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	struct resource *res;
+
+	/* For backward compatibility allow cs base to be the only reg if no
+	 * reg-names are set in DT.
+	 */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cs");
+	if (!res)
+		isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	else
+		isp->csbase = devm_ioremap_resource(&pdev->dev, res);
+
 	if (IS_ERR(isp->csbase))
 		return PTR_ERR(isp->csbase);
 
-- 
2.48.1


