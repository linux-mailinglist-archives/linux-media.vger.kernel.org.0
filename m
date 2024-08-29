Return-Path: <linux-media+bounces-17162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C7964C11
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 18:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D94E51F22D42
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA5E1B81A8;
	Thu, 29 Aug 2024 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="u0HOd+fY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lPq20trS"
X-Original-To: linux-media@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB22E1B7904;
	Thu, 29 Aug 2024 16:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950294; cv=none; b=M3Fz4H7W+Wzysyt5w36maWsysnVSWskzbDFgAWOEgHt3UHgFaI5p70dTUnJqVOMJ0nHwTuCOM37gAF+JbePqk/LiRGoix9XC1G5gKIUErVbp39j1U7YGL3Eb/HJ6WTQFSowikxR4ii+FNNhbd7wga1GJEb9wzmYgih1rX1ec+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950294; c=relaxed/simple;
	bh=e2Ul4WhNGlcZeXQdMMvVpKFIdN3eMc1T1l38qwbLHVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Siq0g67T4aNw8FDkWVoL5jVGZFHP65IJavx8g/VsoX9O1if8UWPzKSQRpFYB9Ex2Q8l+CAkQcgh/0z2F3WVbAX60Slty+yvK05Tkb6SZBRxQayMnpzZhJTFhYqiQAxs4QKA0P03pO6Oj/mVemVtaRtMhzqIwAL0C95II9vG/i3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=u0HOd+fY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lPq20trS; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.nyi.internal [10.202.2.42])
	by mailfout.nyi.internal (Postfix) with ESMTP id 50960138FFDB;
	Thu, 29 Aug 2024 12:51:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 29 Aug 2024 12:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724950292;
	 x=1725036692; bh=JxRke+RPtxCDm2emvz/ESc2BXKQW8dh7vn0rKmecTrU=; b=
	u0HOd+fY2KLbC9rCy0m9YZwodbBKswh09H2WCD6OJvac2gC3fU4VVRq4ydwz0k6/
	fENLWo0ZEViIjYDk7KHvfRtH62Yj10IE2k0j+8zW9sbv71vtV4Wa5vQ0TVFBVzbn
	hMKkFo7sITgXP6SRvJURh4lmzf2yT2IFOnnJ6/DAYQNbMgSj+Uq+Si/xtvhxeW9o
	COTl2Ndts/BXOJ8WI1I+B0GRwXO3hw35JQaFO3OVcpMduaPRxhPvVdIGQ6CZEnLl
	SeyrwUBSnAXziM/O3PzCUnXUqKgUjY6Pq5xOVKgzMfVJowYO2Mg25eHiRbPsytXy
	N6oYUcz5tASi0CxaxDBnqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724950292; x=
	1725036692; bh=JxRke+RPtxCDm2emvz/ESc2BXKQW8dh7vn0rKmecTrU=; b=l
	Pq20trS8nC3yRoqPritm9CLUhevZbmO5nkI2OJNLAfT9f6frxntgabSm84JxVDVL
	rPEy8cslwVFdDd6J0syrMl8QJ9HwUHqkwkFNqxV+IU6nMdqti3rOEqU3BcyX2tPI
	ahZHxjuYsm9Af2PgEur/bRWoO+a03apXsC33S3Mz9FvCEMNrf9XHDmzt7JWcCb45
	16JTDxnGqe+19h68FAHRe6JLPeFgfRP3SiKbTwWUQGJ4u657MLjkdn5V2rfDoMBk
	iQ6YSqZUUdnZlwVPCeLGOA80PgphOCopWtV13BLxr1RtYNINJC5kvLsmZ08rsgI/
	IWtvqGmYV/vAe/QLI++1Q==
X-ME-Sender: <xms:FKfQZqRqFlJCCa5-UkuwIWUkmCXzlEvEMmd-vBfY1O3hYG0uuKzNMw>
    <xme:FKfQZvzbgOZpoE5Wg8iNmmq3pY5qJuXQTTrShdi8nG4CudvCdHEwhN1h460p0dzTD
    kqWQBf0s-2TMtFPciw>
X-ME-Received: <xmr:FKfQZn1qMjbiH_csr-K6b-8NJEU510S3fRRNRqb50pGs9pMxM4VctUaW6LOYHSRWKzWQ2MbUH6ZwrxJf_a7jt9gK-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinh
    hugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhu
    shesihhkihdrfhhipdhrtghpthhtohepjhhulhhivghnrdhmrghsshhothestgholhhlrg
    gsohhrrgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:FKfQZmARQzW65FDcVVV0ry2iHT1WcoODutrj1-HCsiz1yypKXNscqQ>
    <xmx:FKfQZjhq7m_7V02tM0HUJuuHjr6me0at-4YH6cKqVowZVDl7Rdi0Gg>
    <xmx:FKfQZiomeNidkC9xIbdy-bHhZ9EkxZnJSpX-oI2sTuI14ptNcjkNvA>
    <xmx:FKfQZmiNxyrlv7teGO1OLQ9WBucPgzU-XM-NFrrm2gb2gKt36ro5ww>
    <xmx:FKfQZsa3kSVxwRuqX6_FkHGup2RHixAB9GG-dNh5TbsfnbU_ur-6u6Wo>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Aug 2024 12:51:31 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: [PATCH v3 5/5] media: staging: max96712: Add support for MAX96724
Date: Thu, 29 Aug 2024 18:50:51 +0200
Message-ID: <20240829165051.2498867-6-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96724 is almost identical to the MAX96712 and can be supported by
the same driver, add support for it.

For the staging driver which only supports patter generation the big
difference is that the datasheet (rev 4) for MAX96724 do not describe
the DEBUG_EXTRA register, which is at offset 0x0009 on MAX96712. It's
not clear if this register is removed or moved to a different offset.
What is known is writing to register 0x0009 have no effect on MAX96724.

This makes it impossible to increase the test pattern clock frequency
from 25 MHz to 75Mhz on MAX96724. To be able to get a stable test
pattern the DPLL frequency have to be increase instead to compensate for
this. The frequency selected is found by experimentation as the MAX96724
datasheet is much sparser then what's available for MAX96712.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v2
- Use device information instead of if and switches statements to
  differentiate between to two devices.

* Changes since v1
- Group in series together with binding.
---
 drivers/staging/media/max96712/max96712.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 5c15346c05dd..63ef7eb206e8 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -27,6 +27,7 @@ enum max96712_pattern {
 
 struct max96712_info {
 	unsigned int dpllfreq;
+	bool have_debug_extra;
 };
 
 struct max96712_priv {
@@ -173,8 +174,9 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 		return;
 	}
 
-	/* PCLK 75MHz. */
-	max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRE_PCLK_75MHZ);
+	/* Set PCLK to 75MHz if device have DEBUG_EXTRA register. */
+	if (priv->info->have_debug_extra)
+		max96712_write(priv, DEBUG_EXTRA_REG, DEBUG_EXTRE_PCLK_75MHZ);
 
 	/* Configure Video Timing Generator for 1920x1080 @ 30 fps. */
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
@@ -455,10 +457,16 @@ static void max96712_remove(struct i2c_client *client)
 
 static const struct max96712_info max96712_info_max96712 = {
 	.dpllfreq = 1000,
+	.have_debug_extra = true,
+};
+
+static const struct max96712_info max96712_info_max96724 = {
+	.dpllfreq = 1200,
 };
 
 static const struct of_device_id max96712_of_table[] = {
 	{ .compatible = "maxim,max96712", .data = &max96712_info_max96712 },
+	{ .compatible = "maxim,max96724", .data = &max96712_info_max96724 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, max96712_of_table);
-- 
2.46.0


