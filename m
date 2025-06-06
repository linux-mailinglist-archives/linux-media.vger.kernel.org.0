Return-Path: <linux-media+bounces-34278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A3AD0811
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 277A97A971F
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538FD1F192B;
	Fri,  6 Jun 2025 18:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="J/i+bRgb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lg4b8rKZ"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCFD1F1905;
	Fri,  6 Jun 2025 18:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234432; cv=none; b=kKSahPVP0WdGVbu1bnWOH/YXG24QV3uOEinxAQKaQY+1Y83nR8E4zGcuCC8XOsE1Wq4pkomXmqjUxYJnndRNaEHVH90dREnKUz2WfxsQwu372Hg8p1i7g502q98260pUIZ7tgxBiOdKVJXPNRuk1vIGcRc3a7XKuv1hdD64vsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234432; c=relaxed/simple;
	bh=GmnnkRGkfsG7xCiKq9ictyLx85jfrR052HFwllZILeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDMqmFi2FtFDdroRnMQLloAui5G4Kn6P6FV2mWuPgW0ihS7WUHrqUTo7XQfiJxmP6k8QkkejzE9uqA8W0/n/Z0Vlih4MYScQHTY70vC1qwFJsFLlobaCmUYomRnEpNjceJvGDNYg4FahLzu+krZ6qsM/mYDw5d4noxtIXjUbpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=J/i+bRgb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lg4b8rKZ; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 1F8BD11400E2;
	Fri,  6 Jun 2025 14:27:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 06 Jun 2025 14:27:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234429;
	 x=1749320829; bh=9cTMUEWgFv30TiqVJiLhwFyuxe+dTFs0PAFnXZ2lRZE=; b=
	J/i+bRgbD4Fz4HwGZGQAOApIHbPWIlK+k1iqe2yAua6i5dJH4ofu6m5zX2YhLBbw
	QpNLZ3pnBY4xScY7DEK76Uyfu91PrMBbaSOKy71iL6oHFInBGA+s1O33VLuFylVp
	8OcIEyTMSwN4YgteI9t+LYR6TQhvB8XLEJY4vxYF7QjgZxY1CQFlXzjbQtXFU03d
	KvXhskAW9oOzbdAIpfHgT2joDxo9a0gMN6kYe/wOFr2gevom3ehcyYbbSQQR768X
	p5wycM0qIXsYVxIcGbwnHJ7kAYuuXE1lbpIKWxva4XomgSmOTQ1uXbAnPzvUc9jq
	yXRNjYqxJV/rHHbtTPr4LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234429; x=
	1749320829; bh=9cTMUEWgFv30TiqVJiLhwFyuxe+dTFs0PAFnXZ2lRZE=; b=l
	g4b8rKZ9SbVBvUIGTb7voJmDlsV8gjvvwJ91kAdjwHuWcl9S+hrkQ8LiU82uDOkT
	MrLjTgOvZxYMrZIhnzmOvTigvV7ZXN0T12WzEyk74h2Jhk3BCkWgjSw/xPVLaWK3
	uzCLUm03jKsQZuYa1ce0ffRyUHH8T/2KbZ7fBJJWIY8FJRdUQsueG6CZUtFLUQ9D
	VHZSLB2vzD0myo5lWQFVV+S4Km4gp+X8aGBZYULwG8o+ltGQwfQPVzd1azT9bihA
	04r7ucHvv1glsPo56AMN475BINwZYJlunIhMAatFiSNFamNrTImTCPJigRyZC2FO
	yiTxGe7o6pqZOoEWPZsIg==
X-ME-Sender: <xms:_TJDaBll__kQK5Ylm9alFqoH1jfqS-IfOcT_74WEPZ1887-TLI0oUw>
    <xme:_TJDaM2dlA8RWGDEHYYiYPEaCYn0Q2LcIAHje3beddUpWcMIKqNxpiWzepQjke4Hx
    f_RwiFo1kIqRYqDs08>
X-ME-Received: <xmr:_TJDaHq2aV4_mGMkx1Clc1W0LUnm5OEYOPHZqrTam72tJmeFzigSsNs9XRUXop_foxvnoneb3vGR1WMvQasCvMVl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhgruhhrvg
    hnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgv
X-ME-Proxy: <xmx:_TJDaBm6T3ZhnihMWJh_Bow5v_J9Go0Bh_0AgHazYTKIB4B4WxI7YA>
    <xmx:_TJDaP12dHo05RrRc-ZscuEIuFurBnUmPD1gvOFjns6JDfuxqsLTMg>
    <xmx:_TJDaAuUoF5AGXxFzQ-8dTt24AXROc06vtMdPghRIBQofejKpCIICA>
    <xmx:_TJDaDV8IgZ4212jeiD59OM-jL2CwkQypUdCHLbs305FXwnyFaW_ug>
    <xmx:_TJDaE25iMGootbMgu78HfuctbQwuggAOJGHT5ps6YLA_58mlaFbNPQ8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:27:09 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 09/12] media: rcar-vin: Remove NTSC workaround
Date: Fri,  6 Jun 2025 20:26:03 +0200
Message-ID: <20250606182606.3984508-10-niklas.soderlund+renesas@ragnatech.se>
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

On Gen2 where sub-devices where not exposed to user-space the filed
TB/BT ordering was controlled by a hack in the VIN driver. Before
converting it to media device model where the subdevice is exposed
remove that hack.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v4
- Broken out from larger patch.
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 5c08ee2c9807..4fb33359bb0f 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -700,9 +700,6 @@ static int rvin_setup(struct rvin_dev *vin)
 	case V4L2_FIELD_INTERLACED:
 		/* Default to TB */
 		vnmc = VNMC_IM_FULL;
-		/* Use BT if video standard can be read and is 60 Hz format */
-		if (!vin->info->use_mc && vin->std & V4L2_STD_525_60)
-			vnmc = VNMC_IM_FULL | VNMC_FOC;
 		break;
 	case V4L2_FIELD_INTERLACED_TB:
 		vnmc = VNMC_IM_FULL;
-- 
2.49.0


