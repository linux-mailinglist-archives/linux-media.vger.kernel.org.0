Return-Path: <linux-media+bounces-34277-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC23DAD080E
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 20:27:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7317417621B
	for <lists+linux-media@lfdr.de>; Fri,  6 Jun 2025 18:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DC71F17E8;
	Fri,  6 Jun 2025 18:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QCCzgEsJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PCsBi+Br"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C56D1F0995;
	Fri,  6 Jun 2025 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234430; cv=none; b=QPS6wChQMH6TcXT1XYwweKut2Qc6iFQ/vthudRrbemgjePt+rYUOi2q6TLRSLAyhCklB4juV5f/2ntRvgPhTuvA0J7dT5qewklv3SXyzdcRiN67Lx/VZ4VZEC747tKCsP5wKiP3anTe+A9VQZ9yESgSrMFvPlY/tZ5aZbc3EGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234430; c=relaxed/simple;
	bh=9KNemejMhK+nrHRCNUDxar35WXU3coQukgeB/Tdr+Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t1XA8K9N6EaWAdHRuRYbh+tyT5dj1cHrUORl4ahBCoSAr7Me8qoVL0RybBV47cXVI5P8qzf6Lq8ptEU48y1MePL8JjaNVa9XfnQqxEkk0YzaXqHBzEuG1cgCyap6PWi8WUBwdFJLf69ND1gCwf9i5sAxLwfr7FC5Vt3lcUiG98c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QCCzgEsJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PCsBi+Br; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id A0CF811400F4;
	Fri,  6 Jun 2025 14:27:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 06 Jun 2025 14:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749234427;
	 x=1749320827; bh=1V73gpdd7T7+dA6r1qhIlHMRTihOgSOKsjNn8GhwT5M=; b=
	QCCzgEsJkrWZ/aTKyRl+bDOGZaBlPRStQjqmzDe1yAxmD3wVorXOYJg5R57la41n
	30dG7xwnuS020onMvfxRqUU6nHan8on4uqiCpNdi2wQf55NjQdaUtQ0bKZaLlUYP
	N6p113YqON+cX3mcYxUSNIPXXJ/FrSHB05E9RhBFgeHZlwObqWguSi7dIywzq6Fz
	PihmwZ+cnxrvPnTf5vSFsGOWMKBOjVl/VAIUOnQWb7sf/kYtEFInrnALb/udwEgt
	JNLYj18elyvdv5dZ4zddZRcLxsuzT3I5TSGk8u8DX0wUItpNfw+6RRFWwYyTMnNn
	zlgQRr0Z2kaAqULDDB8ppw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749234427; x=
	1749320827; bh=1V73gpdd7T7+dA6r1qhIlHMRTihOgSOKsjNn8GhwT5M=; b=P
	CsBi+BrHQV/it4xjdX4jNlTJ35egnKqbjGjIgMV0IEK7fjBAxJZKhHpTLmMujbXB
	JBW1Hs2riVEkADmLS2Fga7QnhZeX9jo2AcRywlETxvl78t8YOMnNVuorcE9MAFof
	iKGeO3YZPW/V0hqc3d8gpm+E3CUIsxpXp4+CeAhPHIxlQTalIJDE4sdf6UuVyoap
	O7lGkJu+Nwd9EZe1p5VypmbwtfxOCrnNqtS/1QtbyodXLbVJu4rlcgJOSeWAeA1i
	80sHw9SckwzxkaA5xYRTSPz3zkO6uPDL67ISRZ4oPz/j1vrc3Ab8lupCQigQ26NI
	Op+EBbeK0ekwPKmP6LG5Q==
X-ME-Sender: <xms:-zJDaPG-MqfzLVR3oEX7nXCt0k0E_SP3hUdzx7RKWv1-qcq1ZnGJgg>
    <xme:-zJDaMXuSRSPMBt-phx49v8NhyjNrFqrAcvnt7kH8HOVuHpIUUCbzyVePfhvc5FqI
    Y1suLvBTskFyyPtFvA>
X-ME-Received: <xmr:-zJDaBIA_PpjWnqaw8ZJLmx3NYSrxoUMEnKs36arFUILDgw8Ejik9SAGZ96Y8XJele-f8jlJALXSzY4ih7FCJHLI>
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
X-ME-Proxy: <xmx:-zJDaNGf1zZACXdIFO9rO_2Ql1mFaw9TALcNIrz5tjVkES86BZIwKQ>
    <xmx:-zJDaFWWVOKQzNyST_IgDCHOo6mCces2kehT97V2iAsrDhqtE7Pg3Q>
    <xmx:-zJDaIP8VipUVVggX8ucn9cbcrhUjs_A3e3jzLyEJ1jgY26gjioXSQ>
    <xmx:-zJDaE3HSAMmnGdwc6qAKoGXqTVeou7j6KDohMFl9OutSSHYWNi1wA>
    <xmx:-zJDaAUX2e9l72wL7k8BylLa2BHxWNzuZImfS_mEYYO5BcqVa5aaQ8qn>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jun 2025 14:27:06 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 08/12] media: rcar-vin: Always create a media pad
Date: Fri,  6 Jun 2025 20:26:02 +0200
Message-ID: <20250606182606.3984508-9-niklas.soderlund+renesas@ragnatech.se>
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

Prepare for Gen2 media graph support by always initializing a media pad
for the VIN device.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v4
- New in v5, broken out from a larger patch in v4.
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index c5510e3b258f..8cb3d0a3520f 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -895,10 +895,6 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 {
 	int ret;
 
-	vin->pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
-	if (ret)
-		return ret;
 
 	ret = rvin_create_controls(vin, NULL);
 	if (ret < 0)
@@ -980,10 +976,6 @@ static int rvin_isp_init(struct rvin_dev *vin)
 {
 	int ret;
 
-	vin->pad.flags = MEDIA_PAD_FL_SINK;
-	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
-	if (ret)
-		return ret;
 
 	ret = rvin_create_controls(vin, NULL);
 	if (ret < 0)
@@ -1375,6 +1367,11 @@ static int rcar_vin_probe(struct platform_device *pdev)
 	if (rvin_id_get(vin))
 		return -EINVAL;
 
+	vin->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
+	if (ret)
+		return ret;
+
 	if (vin->info->use_isp) {
 		ret = rvin_isp_init(vin);
 	} else if (vin->info->use_mc) {
-- 
2.49.0


