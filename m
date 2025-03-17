Return-Path: <linux-media+bounces-28376-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D19A65973
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 18:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33A5C7A6B5F
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 17:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F7D1DF97E;
	Mon, 17 Mar 2025 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="seDB55nw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="exTvthlm"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F781DE4E1;
	Mon, 17 Mar 2025 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230782; cv=none; b=e4IZNI4ajUFP8X9LFFI86wi9a7PDedBc98MKWSH4jA1Fz4jTTBVdomb/ghf9vszFXhMSuEvRNp2k3tOHLs0OHCnn+l9oVFHOYWlPBx21T56Z3iZ0D0TdO89Vt8aOKAxTq6DGbhBw1PLtcrZLzQyHinpDIA+MaFBg7MPvMn3nZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230782; c=relaxed/simple;
	bh=kulgJ/8FzqilYzSkAQL7QR1ZHDmMAEUT9TpSQaFPiQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DKG1mK2p+GOUbArAHXL/53pmpeWmiWswqskYdMHmL8B7evA5PSekbpXX0R/6Yq3gMw/i5ZzbbJp/Q9ywlN2DbcPObjO8PMFtCEjhwmlewvF4wETOm90rLGM2n4OY48Bq8sXNJOTgmVoRG49GyMj7gnJ+bqKA8QDXGG8KOIroIgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=seDB55nw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=exTvthlm; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 55DF12540225;
	Mon, 17 Mar 2025 12:59:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 17 Mar 2025 12:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742230779;
	 x=1742317179; bh=1rFOoL77puI9P/jkLdgqnIEf9zSShrReWii6Vid1qsk=; b=
	seDB55nwjeaMKdSbFpPnxGsw1PYQDb7blC6OBRw3dVPdowkEZqqACRGq9Ncagbv6
	1wTHYrVewNSBpCwL7KejeH5tW5PmEPSAUZilw2cJoL46aTYVexho7rcvtGWD05EZ
	oRxd1xJW9jgRT2LMEV2Ach3KJNRYhBoyPuR81ZRtocxw+9LKHut4tIQfTZAZt/en
	EILxmFuiOtVmQxOhBOX3A8+vIpQQ4Lxup3YVeFf7yLPlMCAHDEL4VdKpfgY1qD7B
	AXJMmM3QtUAR0LTEKo3P3eAutitSM3EdulIrQheMDdAvO06bZGXL/iygMOQARgb3
	9djxnJQMmKanvQ0FG9668w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742230779; x=
	1742317179; bh=1rFOoL77puI9P/jkLdgqnIEf9zSShrReWii6Vid1qsk=; b=e
	xTvthlmqMXSgfZKX/S4AWF1ct5TpoXMue/ZShq0YYW9mo++Q2vyi3ugnUP0Yxh+A
	1muxAAlzs5StdvKFfscXbusM8ZSEBghf/s4urStqYv0DHss6FqcbyANK7FPVzkZ8
	sTrZTHjLOjJpLXsgeei5QdUdBLbSLjqcd0+Dr2cwPRMuK2cB/VL1flNkRrd0kAoD
	hzrgDQClBNskTIlatIk4Ybfy46fUMgfF2437/KvQ/cJ2HS/L990nKWw9efEEZS8d
	Pj7sL0zCK2fTzYJH2i99pZtdWpfsem/FmQtbvhXY1EzgI6So1v6b1IVAXKeEmAK5
	R6ZYF/WGhI7RukK8bX/zw==
X-ME-Sender: <xms:-lTYZ6L4XE8ebu4wE07sGT-8dW77AIC1EJHCTlX9dG3S9MExV6fGBw>
    <xme:-lTYZyKFRUs1RbYQ7SZ2Ff9oP6MdnN_zVP5LTxD5BJESiBm08trPU2gEsTFwwAEma
    k-D4tHBqjW6P4DxDvE>
X-ME-Received: <xmr:-lTYZ6uT7rDWiB2NDovo-eidFgOAaSbM0T4u6WDSgnoONXyzYfArNFy9Mf_a-k0fO2xMt7U0OwThHDfAIbdr0KR9rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedttdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdr
    rghilhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrg
    gssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdo
    rhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruh
    hrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphht
    thhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrh
    grghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:-lTYZ_btx17iUXmG6QgZtVlknk8bm8-dKtk-jWUTWt3nNMwVJtmZhw>
    <xmx:-lTYZxYa9-mK7cY5YoCxZar6ooJl5QwE3gPWBRfnffGPfy0xDsWi_w>
    <xmx:-lTYZ7B71ED171Dpvm_9SiixoqLlcwPriTcKoodHx7LqwiNQ1puXNg>
    <xmx:-lTYZ3ZbdpqDMAKJIkUlGnODtpKSh4pGduceOnCJEvVBZgf_6ZFQcg>
    <xmx:-1TYZ_O85QoFppAM0i8pU4ReeqoskhOBRyrvxRJdmJ0k425cc3YYjpFy>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Mar 2025 12:59:38 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/6] media: rcar-vin: Use correct count of remote subdevices
Date: Mon, 17 Mar 2025 17:59:02 +0100
Message-ID: <20250317165907.2412377-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317165907.2412377-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250317165907.2412377-1-niklas.soderlund+renesas@ragnatech.se>
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


