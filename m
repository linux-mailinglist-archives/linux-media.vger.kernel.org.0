Return-Path: <linux-media+bounces-18978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB098D00B
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 11:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34CE61F20616
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2024 09:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D12199FC1;
	Wed,  2 Oct 2024 09:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Bi20DKfQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AyrltPeP"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC2119993F;
	Wed,  2 Oct 2024 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727861055; cv=none; b=EMngc4YLXJY3nbM7yXlqCFlTsvRHJgyr7gM0lPIsd3QCnW4Btn/t5GOXPjTawBSsDSWhuWfrupxfq5OtYBsANBKdOazj0dXzYUJOMlOgtFPRrlfktsHJMbw5H9Lr2NRJJwkIJZQzfyeNp6yojmDQ3QHPi46e6sHDHCh4fihp4r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727861055; c=relaxed/simple;
	bh=uwE9OHNlYxThlbjczUHekig0IqYW0jV1KH2+wvQVVM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0xZSxZd0zaLWjZ3k6L30csPXPnHQHODLF0VrzC2BbhccknALTgaEDsBdSEu4SHICG4+ZkJ1MWH9tdYyTKGHG5Fv/7QVcAx+c6mxSNQu93tANIpf1uwyASxEUKY8sSaD/Fh63PGyA2YW1VY5/lRo0151tWgu23Ilg3t3zmDOOp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Bi20DKfQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AyrltPeP; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CE66911401FE;
	Wed,  2 Oct 2024 05:24:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 02 Oct 2024 05:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727861052;
	 x=1727947452; bh=8cxyk2OLbPobtuJOkQl/8jYqwQNeXifeQSsKLECjKMQ=; b=
	Bi20DKfQumO16+HU3W5Z3TDBEa/bEefgzjpU1K1wtW518b8pAObhxJSNSV8FXaGD
	OVUtPXCBTEmInRJFQiHaUgOpK3RatlJwLsLbOSVe7IHx5HWdn/NF+aJZrxViv9Gz
	CdNl537jNAq12/erOmdis3x2ZnGwFH6aepIU4wrg4CKQJrsADDFlidJ6mZMqL497
	ySwo8062JtplTOuwsB+hlWQ0fZY4zBaZWRHoFgJdIu8QflNRm6pv/jN5kxNmT+s6
	dU6WgMx/5/oiwFxSFEtGejEK22K6K5c2xskkYQKnw/RyOCH4vt1qzmqQz975g4AA
	1IutrC9ZQRFfOheB22rNWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727861052; x=
	1727947452; bh=8cxyk2OLbPobtuJOkQl/8jYqwQNeXifeQSsKLECjKMQ=; b=A
	yrltPePL0j8mTesJZeHSr825PWxPvkIruRKgnlmejUyvcSvh4cyPP6oMTQdf2I/Z
	DW68gio3lhxL96KPxFJ6fbHdIjmtOhB0q9q9vKYmYqeSTDcM7m67JToaNXaJCgJS
	zRbDbMrjx2g7v+8FXo7ODVWep1/Zs81CW6L5kNtpU3qEPSsaO+d15W2rWo0woumb
	rYHOX7yzq6OnRXGjqx6mGM3r1MebiOCIcB0H7fZKuHCqPp1RdowHGDr2imV+IdHt
	77MfwLhLfAWtBw5sGNI1jKRl2Zs+Hh1ifeQ6tmYUz9NOy25ThRwudXxjUdxhleoP
	kAN9pDsuWqOSkN2LQnkFQ==
X-ME-Sender: <xms:PBH9ZhGh_tYEAyGgVJ6hUNK1YY6nE0k_BZOlgHN9bQ6VtQnuC7PQew>
    <xme:PBH9ZmX2wdCLLHukQb4yhBZ9KaWL5rVSmBrVLMzjDGz6y9-s6IstYhuSrLiWyxGmK
    roQ0pcjl5y2nBfSLBU>
X-ME-Received: <xmr:PBH9ZjL_cNjG5rN5NPNTqkOFBBttNfCgWaA__XqYZzB3wghS4YF-6cj42zAYwXqVgrPDHoQzLQxvSz1DlLi73gRq0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgkhhhsehlihhn
    uhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepshgrkhgrrhhirdgrihhluh
    hssehikhhirdhfihdprhgtphhtthhopehjuhhlihgvnhdrmhgrshhsohhtsegtohhllhgr
    sghorhgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:PBH9ZnEAX5C08-eaWaSrnK2NYu1GPHV0WtzgaXkzqeGu1e_4qDb7fw>
    <xmx:PBH9ZnV6SHXSOIxSuWlVwwXa_PP5XC_osugvFUFjcydDm0gd-4rGGg>
    <xmx:PBH9ZiPeo-j6op0n2ygQokLkJU8X1zmPuiMn-mjV7M_RcASQs4O55A>
    <xmx:PBH9Zm2YOtwe7rTSglry_g_66aaO7bPMmh9yt5BVzQM3zknpvTNwOA>
    <xmx:PBH9ZkXYbLJv-I0bA2hWxT61xJNe7WqqS5E2Em7bL5ejyZDj7-c-_AXP>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 05:24:12 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v4 4/5] media: staging: max96712: Document the DEBUG_EXTRA register
Date: Wed,  2 Oct 2024 11:23:30 +0200
Message-ID: <20241002092331.4135906-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241002092331.4135906-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241002092331.4135906-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DEBUG_EXTRA register is not part of soon to be added MAX96724
device. To make it easier to understand the differences when reading the
code prepare for the addition by creating named defines for the
register.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v3
- Fix misspelling of EXTRA in defines.

* Changes since v2
- New in v3.
---
 drivers/staging/media/max96712/max96712.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 46a6bb018fe2..0ee66022026e 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -16,6 +16,10 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
+#define DEBUG_EXTRA_REG			0x09
+#define DEBUG_EXTRA_PCLK_25MHZ		0x00
+#define DEBUG_EXTRA_PCLK_75MHZ		0x01
+
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
 	MAX96712_PATTERN_GRADIENT,
@@ -170,7 +174,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	}
 
 	/* PCLK 75MHz. */
-	max96712_write(priv, 0x0009, 0x01);
+	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRA_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
-- 
2.46.1


