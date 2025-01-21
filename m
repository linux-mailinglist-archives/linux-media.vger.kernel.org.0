Return-Path: <linux-media+bounces-25082-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36878A1884E
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 00:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD80167EAA
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2025 23:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F8A1F8F0C;
	Tue, 21 Jan 2025 23:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kwV4T2yy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wi8aAL2E"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118BE1F8F01;
	Tue, 21 Jan 2025 23:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501645; cv=none; b=aUW7jhkoFTVPrUlBc0GVAiEkrLSDi0OuwqKE4+fYRVh9npjr8Fnz1aRCFir2k5/H6kT7HH7FRFE74heIPecPZibjOJHRZgSmb14TYToOiv0FFwjaJBMWw+9G1WhbNS8sZ+ne2N7nM67Nig3QQMfpdCpOZpDt2wHD4oegNG518d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501645; c=relaxed/simple;
	bh=OtFtjgDLLYZ1ZVjfW7PIj075KJ/m254pyU9vTHLYHGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+IF5StekGA6MUYU75bUQ8zjxPhGN5fUKiDR9Zkc3r2EbZh7ZyJfDibucX5LzikXEcEl3/7svQiHCZNUlszmO3x9CYwjLP4QekyINs87AWmP2EjRiYwhqd1ycKfJLcQ8UxaRlI3hpgbYXK5vQ1eyvmQlsMNCi4TzXfnWiw/2ccw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kwV4T2yy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Wi8aAL2E; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1AA2D25401D1;
	Tue, 21 Jan 2025 18:20:43 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 21 Jan 2025 18:20:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737501642;
	 x=1737588042; bh=U/QiFlEfQsIFW5Mkqt1H/B5V7hpE0iV7gdonwO0q4jg=; b=
	kwV4T2yyYCUx9gRs4Bvs/QSg14qJZWywjnIqkM+LqTb2AlNzf3P/RQY4urbV940X
	zZ7JSQp1ZHmZlwziBrlZGg4fp7R9ZNsdyy4Hm9/0hXVj/20n8kyVUOXT2xn0q+/0
	841kwQjsQmqXhsC7oIoNTuV8RRGt8NSSbBDBaVkilywrsNbZX2qXYKxZ50Ju2bXr
	IfZPSDYZ44vmqJvCNyaO2ArKvhpr1TfvWLYoUxVsE7f0eT+POCD2u6plgVsmkQGb
	xpLr58OA3cabr5XYMq9wTiGWwhQPmodB9yyDHToaJGSsK6co7VVGX0ZhfGVEH4tw
	829Y79EFx42R2ETeU8Z3CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737501642; x=
	1737588042; bh=U/QiFlEfQsIFW5Mkqt1H/B5V7hpE0iV7gdonwO0q4jg=; b=W
	i8aAL2E2W425HN44EvhPeEACoeJ2J0rX3kB14kjZV1q4HQaR3lOvmRUonAddcIrY
	3LJjQ4vx5tzfEXFpwu2FqF4DIZHQYdMDyhTf3Ofj6zetG1EQLUYAUf0SFwtzyqku
	9A3D0qX01a52xdP34MasabJqdbRepeO++clihmnbtNqG7wREYUjOv1npslem9KXo
	wmKiXCfUaJZmgGwpif1J7AmL4S/r3f3Z/omBuRxV364+bmtw0ts/h6hcLpZDYjz0
	4brTfL5PXo21y7uoOIvEcGe8G+t9c1U2kf6jJvE11URfW+GmzZKfN72zxhYLVE3z
	5Nmwuf1t0iCaWar1P6oaQ==
X-ME-Sender: <xms:yiuQZxN6CmO9RpMQQsUOXCs6VC_a9seHx6uQqCzTMlFFSNlcX44twA>
    <xme:yiuQZz8oneAqcOVzyqNCYIIci0gEiLzIGiEAJcxYk_VMWhhFaUNdAM6P9rw5cRx3B
    UoSwvCQL5KptpIMURU>
X-ME-Received: <xmr:yiuQZwQVh4jQ1S8L6EVCiZs4N4mt1bM22sAwoMgZb_KKnrf9C8d50Ve0TNuqmu5kQBAlrp06c0UR2IBtvJFQoBudnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgtdekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:yiuQZ9v2-JpGdNI8y24pLxjU7sCb2McrrAmG8SImiwW5cMyKOQD_3w>
    <xmx:yiuQZ5eh8WHjd7xtbGJbR86N32RXaqzkgjnd-fZHMMeonN5lnI5RZQ>
    <xmx:yiuQZ50TKjXVNwFxny5UcMvR7CwZaw1ATjDHBC9B5c-2Aj--SfGWEg>
    <xmx:yiuQZ1_54h33jxOQ_9DKBnj-B1xs5otZfWb2-7Xko8gM9h8SGYr5cg>
    <xmx:yiuQZxSKplaa5jaLi_ZS-b6g_kZ25KbmVljd9hh2LXSt3qhWiWu_CCJ8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 18:20:42 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 5/5] media: rcar-csi2: Remove hack to detect NTSC content
Date: Wed, 22 Jan 2025 00:19:27 +0100
Message-ID: <20250121231927.187463-6-niklas.soderlund+renesas@ragnatech.se>
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

In an effort to emulate support for SEQ_{TB,BT} in the R-Car VIN driver
on data captured from a CVBS input a hack was added to detect NTSC vs
PAL. This is ugly and as support for emulated SEQ_{TB,BT} have been
removed from the VIN driver remove the ugly hack.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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


