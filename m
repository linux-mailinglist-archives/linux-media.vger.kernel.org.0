Return-Path: <linux-media+bounces-34281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B916AD0817
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEC4F1899AC8
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5836B1F3BB5;
	Fri,  6 Jun 2025 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cHYgZ8Ua";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nM/hfywV"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123711EF09D;
	Fri,  6 Jun 2025 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234439; cv=none; b=YorJYB7w7fFWXNJfABIrjfIm9KnNGy0ld9I4a5vgDr5Yxi9QqKs1pMogXxjzikC1YIpyit7LCDTqp1iSTq/RRR8kt1+fIuied6+IRD89+zxlsMJ7NDOZgzMv7+TzF0mSuzku5D3jjuINDHKa/BJyDHHF8f7H/AGyyfx4F5CUNgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234439; c=relaxed/simple;
	bh=Vd39D/Vb8gGnVpdP+YYe3E6HAfdWb87u6A+MRDAN24Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kEBsHDIM8hJn+Hk/UWsOtnObN4XkQr5tUZ9tGIiseA+N8ZKEW9uYHAqLP0RexT3qBjA7KoL0Q92d0ySbumFIuqm6lnNiZ9ZSwMjLwwbY50ylbDgs/wqAG+gr0flsUfMhxqG2wFr9QQHIagQ3qwHU2vIAAxj1zWuDkEAXR8fctEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cHYgZ8Ua; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nM/hfywV; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 541B811400F4;
	Fri,  6 Jun 2025 14:27:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 06 Jun 2025 14:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234437;
	 x=1749320837; bh=W+1QkO62eDyayzhLmoEPQMW6rtRT1XgWlcxugw+o0vc=; b=
	cHYgZ8Ua/ueQbcrpXHfEyccAuAYXP+EPGUA8v9AvrhxAmZyY5itFkewag3F/lUaL
	8gc6F5RIAtHMSWneWbxInZe8z5Ar58v7YkBXcrnpuQlPEvjgUSjvfDdsBTc06W3x
	4t0nuyvnssJPdyiK8BW+Le7MLQnCnWqR94Q7A2+v0QeoMVZdFm92M/zgHDW55r6Y
	BP+dAR/uWvZpgW3vzLx+w9XwPBc81GUb1UMrW1M0008swR2NqVAavat8ZnrfAvQi
	n57OXNhqsD+rakOSDJQ00Dkqw8zKBusLnEzfro+JsA9fz+r49awT8xqTgGCs+9xU
	L2Z92t3NP1ctHgTjNudhPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234437; x=
	1749320837; bh=W+1QkO62eDyayzhLmoEPQMW6rtRT1XgWlcxugw+o0vc=; b=n
	M/hfywV2KyF2aohf5T4EDXKbF3OMmiskuFkdn3VJXcU5GcNYoLzthdWu9EDQkL/J
	rwKvdut/9McvM5pXhhhphTmY9DpsGwEPsBq5IzD7dLn7d2jRcEiewTgD35CAm671
	CTqT4dHoah8EEcgJCquifutubBhSsf8Qcju/AKNPS9zEKwOkbeTO86mQvfDZh5qG
	8esjAkSSA2HCjNJyhbr0Lozy0zqxCRGGWMX12FKkRXIpZwZXVdz3aqeoEWqaKM63
	jAs7kntmwCDnXIDV3GMhuViScmsQrim52CM8TnTE/VtxTO8CoSUeEzIn2iL7J9uX
	dT6r4jWpi/pTpxuh1zWgA==
X-ME-Sender: <xms:BTNDaOrcKjSNCvOP-1_apbXfVU4hFHY1uvvxNxFAgUpXDg0blE1TiQ>
    <xme:BTNDaMpnaJSTyTpBBtJ_OsjHOCkQl98wgi3GYQkwvdAqL2EeneyTDlQBTreAvXcGH
    SCOYZeBuon_jYDPO0o>
X-ME-Received: <xmr:BTNDaDMFTM8_6nuT5BHwqSUiH6IpunNWgSgNUN1AuB8b6IdWTM_M3XwwIemtcFCqw4ibo3lC2XOgLfdB1yapNgqG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdehgeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
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
X-ME-Proxy: <xmx:BTNDaN508dl7Mypv8T5kB1Fqr4yoE3CM7uNzHgAyVeBoT6JoYiFspg>
    <xmx:BTNDaN76uTdS7NOY9zsWDpE5ihjxgk0x3aoWq6rI1G3zWylZODWByA>
    <xmx:BTNDaNjgIRuhzalqYO_hNgrg46kIyZtKaiL7MHauFQfo6AmK77Pe_A>
    <xmx:BTNDaH5dLAcAosICzzJBe1duBIrtUhQ9Z1pzw5SziemNhMcb3yOtJg>
    <xmx:BTNDaBJBuyP1p_NCgqVJB86sH1eqv_fcwpLfPnnZm7CNWglHxBPvRb1j>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:27:16 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 12/12] media: rcar-vin: Fold event notifier into only user
Date: Fri,  6 Jun 2025 20:26:06 +0200
Message-ID: <20250606182606.3984508-13-niklas.soderlund+renesas@ragnatech.se>
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

With Gen2 converted to use the common media device there is only one
caller left for the helper to notify a video device of an event, fold it
in.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v4
- Broken out from larger patch.
---
 .../platform/renesas/rcar-vin/rcar-v4l2.c     | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
index 2bf94bd77c24..59b01cb0628a 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c
@@ -656,18 +656,6 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
 	video_unregister_device(&vin->vdev);
 }
 
-static void rvin_notify_video_device(struct rvin_dev *vin,
-				     unsigned int notification, void *arg)
-{
-	switch (notification) {
-	case V4L2_DEVICE_NOTIFY_EVENT:
-		v4l2_event_queue(&vin->vdev, arg);
-		break;
-	default:
-		break;
-	}
-}
-
 static void rvin_notify(struct v4l2_subdev *sd,
 			unsigned int notification, void *arg)
 {
@@ -693,7 +681,13 @@ static void rvin_notify(struct v4l2_subdev *sd,
 		if (remote != sd)
 			continue;
 
-		rvin_notify_video_device(vin, notification, arg);
+		switch (notification) {
+		case V4L2_DEVICE_NOTIFY_EVENT:
+			v4l2_event_queue(&vin->vdev, arg);
+			break;
+		default:
+			break;
+		}
 	}
 }
 
-- 
2.49.0


