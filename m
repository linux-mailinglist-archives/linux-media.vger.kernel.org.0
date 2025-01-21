Return-Path: <linux-media+bounces-25079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE695A18849
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F7441889A4F
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 23:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801BA1F8F1C;
	Tue, 21 Jan 2025 23:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Upc3MyLl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PVi0sXeZ"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244011AA791;
	Tue, 21 Jan 2025 23:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501638; cv=none; b=WLaqQBb7IkCGhovPwHK1+fGINsLZVeMjzQvMMCBmLbvwrnTnTA6ctTRYsE4HHNGm12V9nlNXGlmgqlkD3FOe+kutsa4jTarWcVModwtHIgi8i4+28iyboAo/25T4bjuDh7d6AidxLlmhgOdKYyttRUl9BHymgbZyFBxvmqhBvqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501638; c=relaxed/simple;
	bh=aF1mL2XHHmlB7bhN+x9apPMzNbcAF5Qy+lk57KduSNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PGFkhySUUH5OUJfr9zQW52kZAwMtRleSnoXsVWXwRT6cn7ls7MoWiUzFTPbu2WMp5vaAn/97QnVmrNI/7SpWc4SFoKBCl9RHfrHmXPpp0Gz24xJHOt5XZLA3PaToL4yBUL/2rf7gD6bh24g4ls7CnWvTd/s1K4ljYCspD1aGhmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Upc3MyLl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PVi0sXeZ; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2987A2540208;
	Tue, 21 Jan 2025 18:20:36 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 21 Jan 2025 18:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737501636;
	 x=1737588036; bh=0Xr04tPJq2w+/SEDdxIwdzftvSReT8VpOF04I4JH4fY=; b=
	Upc3MyLl8LqLZwaXoMvDQAopeTEY0f5o6tO6OWDF2n5aPf446adYWrkpR6GVfMF9
	PPbH/RW8oCt+/4CUjEwOnqyiU1ZqEvi8oOVAdD8cqrckv8I1yRq2LMDAX9G09F9j
	7pi5hiBk9NKdrzS34YJ031b/j6LOAApP48eMoP5dSqKMiIX2jqUMHmzuyguvoh0P
	5b2X9pstQnYdrt4K3P8X2TLnJC9jVb22La4XBH92i3aie5B5csNqRtmbqcm0eL9p
	q08hMlzoA4TE1JyeyEfJVMzHiudbDai1fKCZrW+HMhuaCykUzdPwDH5F/dtaaiOE
	l57M8GNuoQhhwbGJZkd2ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737501636; x=
	1737588036; bh=0Xr04tPJq2w+/SEDdxIwdzftvSReT8VpOF04I4JH4fY=; b=P
	Vi0sXeZ7ssbyXC0CtztLZogz8N+wzwO68AHwNUG1GsYOU2hCHdMdyHB1bl3AcH5z
	2RSOPnxmd3TxoMAJfkS4zHMZl4qRaBKRe2rS/DZgSwhiQu6rz9apAGEqJE+zGYaA
	f07vk+Yl5i3N7+COJw34UxgECnNqnm7ZDToa/quLNI5ftA11NVlBpx+T6nHAWnxD
	wa7YPAmP5M5tnv1q5IS/R8LoX0vF161Hts/UAX7YNA0FD5nICGTyo4osz3636GsL
	Rilv2Kmd5MWbLvq+gJxb45ZJW2K0A+PTZ4JhtZdhVJGx62ll8Z5ZY43ecVcCZRPz
	fzR74DBFqcNP0GH3IPPKQ==
X-ME-Sender: <xms:wyuQZ-giiaYxCIQVB5j9k2_GicteirRGrNPc3CZb4A9cNDNPBrzRYA>
    <xme:wyuQZ_BolsNOZ-JL64QT51yXp1lj42bz_lHg7xIDjTei1ylyQjkEved7VXWpTbFlE
    T8zXBVLdljKvKcQ5fw>
X-ME-Received: <xmr:wyuQZ2Gm8j1xcgnpNWNIf0IS0q241DDlh2mirOcU59_atTICDNf6wW8BvQBsBSfwhl26hib-ctInAJtF0Exr4ANZdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmihdrvhgrlhhkvghinhgvnhdorhgv
    nhgvshgrshesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugi
    dqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghh
    rdhsvg
X-ME-Proxy: <xmx:wyuQZ3RpGyYRbGZMBbudKDJYVO3dvufX3lRnSGaQEx7eObsx-aoQ1A>
    <xmx:wyuQZ7zineUgz3zprD4Jjq3L9_3ynpwi5vHFTiinDJzcAUpbWmFs3A>
    <xmx:wyuQZ14OJSwhBBh_tLgaINKKgO71olBrzHf-usRndxgfUXQWWLU-og>
    <xmx:wyuQZ4wj9UtiVHcMtdy7yvvlo1OJLX36dGsBsdq0wy1WfpXdwx6r9Q>
    <xmx:wyuQZykSpdew3LwejBYprG_oeqJtx9uetzJrxbP5hxZOvhu10DLOvq6F>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 18:20:35 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/5] media: rcar-vin: Remove superfluous suspended state
Date: Wed, 22 Jan 2025 00:19:24 +0100
Message-ID: <20250121231927.187463-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121231927.187463-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250121231927.187463-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The VIN state of suspended is superfluous. The logic was that when the
device where suspended and in a RUNNING state the state was set to
SUSPENDED. And when resuming it checked if the state is SUSPENDED and if
so started the device and changed it to RUNNING.

This can be avoided by simply checking if the device is in a RUNNING
state at both suspend and resume callbacks. Remove the unneeded
complexity.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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


