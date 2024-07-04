Return-Path: <linux-media+bounces-14656-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616D927AFC
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 18:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99CA21F23A3A
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 16:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E681B3F0C;
	Thu,  4 Jul 2024 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LYoZ+V9q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f+5qSZ3v"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F1E1B373C;
	Thu,  4 Jul 2024 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720109804; cv=none; b=UtVTKdG6slAU3VOHiUbh/JyxqqfuVuGJpgvRZtORyi0x/lRfYUutM4BWgV2c7DIZHObTyK8NtU8oLVLr9BSugNiGqipUeOv2EMvfUFaKR9H2OJlp5lWq7H5mV2mzmA4ZY/qtEHKpeju89hl5lRFYksgtbOle3q+UEn2wN+shnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720109804; c=relaxed/simple;
	bh=HLqF6RXPscYgdCNOg7qm0Hy0bsUBHyPtRIuM3hYQjUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QjQ+ML3XWsnRDYIRkPKel/zARvmNvmzrzeQ5nKw9fdP8kzlcTJQ9vp9nBwnkIk9+07RQi3Dv2AXJKFOipq3ro/jot1iyijij7XmI5eoxYmA8zY+sVGSl6ROizGAR+xzhVW45ev+lfU3ARX4cRmhtfxyNQnTo+moMhObyjUpoPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LYoZ+V9q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f+5qSZ3v; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 82DFE114027F;
	Thu,  4 Jul 2024 12:16:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 04 Jul 2024 12:16:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1720109801;
	 x=1720196201; bh=CIpEg4bkVBN7ZqyKZdIeIRR/b6UXDbg6dx4JYnDd83g=; b=
	LYoZ+V9qq7ZAcbyyVkcY8n48I/AIgdQAX/E0/4sOEjPACFYxRg66YUuZlLrrwTzR
	SF+aZqWSVmkJXgUB5rKmgPLmTbccWyRzbC4XyBDp6szlcomFFb6wjRA0sk7A2PCa
	C54DfB1244QtOJB1r9lhnQTdW+jFSGTQmc9WJmntlToPntsMdYbYDFcD+p0a8kRd
	9T6F/PR4Th6SVNwcCNPSSOL1QauxUZzdVpeIXT1z+X+eEbu6QlR12/fNi3ztc9qy
	qq/Ws04T0aGPxs32RWbxfwKh9KYB9kuW4ZXODxJjui8PUl4uvu9TTna1zIQEg0H7
	p5ODaUDH1g/CZPhrKsW4qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720109801; x=
	1720196201; bh=CIpEg4bkVBN7ZqyKZdIeIRR/b6UXDbg6dx4JYnDd83g=; b=f
	+5qSZ3vdOKpO/IONjfetbuddLUHBXg49gkOHo1onDifpL+yz78EAHxEg4Mc6x+oO
	NkNRTa6LPnFcXAh/gbtqBpH59R79HoM0jFCpEVcwXmZCpTk441JLR0BATz6foTYV
	EHg9fwDboQRLz+hHFdA/3sv2NZRN/0i6FjAi5hrKkNofsMxxIQqdtrWuoTzV22F0
	gbRyGfrlOropVPtR+dL7kjVSiOiMIwm1oxTAa/P1pzzX/qYba701t/OdkS1ELLrM
	T6vdSrEBAkSn6NP4Ww/000BH3z8Yl/cG6OpLW0WlVWOCouZtv2iu2Fg4pbp6ClJu
	ytpB47yRgaqZbH6R15MLg==
X-ME-Sender: <xms:6cqGZocj170KyEkiWJQ3ge--Mjq8UzN4C3_Bhs88SAiKb7LV_ufluQ>
    <xme:6cqGZqOG7zhQ5Fi5jFHzkWn4zYDJy2KTfq8EfH98h_RKycz0hP0gABG2eRdyKBvuc
    LC9x0KcFzasUvAFbG8>
X-ME-Received: <xmr:6cqGZpgdl-DGeub8g8w5cEC0Aq33znZDePLM82MGB5aNg3jjlHMqjE15vo9lUdB8bczpkDNhkaqgaSCfz-EuKoLIfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudelgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeu
    tdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:6cqGZt-V8cEmsmuVqeHUR7SkShtWrxb1YugSmCEbAZMtBJL25Rowzg>
    <xmx:6cqGZkvuWmgSnRbfMVlTWUInS0Ej9MtCZe7xvwhy4OZ_Zn1Paf9Kvg>
    <xmx:6cqGZkF02VgrmKd1IiJ9uQna0gFh3UXaDgnXMF4KcJ97AQsrCu5biw>
    <xmx:6cqGZjN3ki91MDdReFyrOsrOQHQVkvwp2FEDrKFXJBn7-P-z4gQjnw>
    <xmx:6cqGZlmpVd-PdABmEIq9FU3jazIYcFmYYbuvY7fQ-_ae9DTJc8pDLKtF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jul 2024 12:16:40 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 4/6] media: rcar-vin: Add family compatible for R-Car Gen4 family
Date: Thu,  4 Jul 2024 18:16:18 +0200
Message-ID: <20240704161620.1425409-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240704161620.1425409-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the Gen4 family compatible. This will be used instead of a SoC
specific compatible for the new Gen4 SoC V4M. Two Gen4 boards (V3U and
V4H) have already been added prior and their bindings need to be kept
for backward compatibility.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v4
- Extend to cover V3U as well, which despite the name is the first Gen4
  board.

* Changes since v3
- Reworked to deal with a Gen4 family compatible instead of a V4M SoC
  specific one.
- Dropped review tags.

* Changes since v2
- Extend commit message to explain why SoC specific compatibles are use
  in the driver instead of adding a new Gen4 fallback to cover both V4H
  and V4M.
- Add review tags.

* Changes since v1
- Create a shared Gen4 info structure.
---
 .../platform/renesas/rcar-vin/rcar-core.c     | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 809c3a38cc4a..695d884a22d1 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1274,16 +1274,7 @@ static const struct rvin_info rcar_info_r8a77995 = {
 	.scaler = rvin_scaler_gen3,
 };
 
-static const struct rvin_info rcar_info_r8a779a0 = {
-	.model = RCAR_GEN3,
-	.use_mc = true,
-	.use_isp = true,
-	.nv12 = true,
-	.max_width = 4096,
-	.max_height = 4096,
-};
-
-static const struct rvin_info rcar_info_r8a779g0 = {
+static const struct rvin_info rcar_info_gen4 = {
 	.model = RCAR_GEN3,
 	.use_mc = true,
 	.use_isp = true,
@@ -1354,12 +1345,18 @@ static const struct of_device_id rvin_of_id_table[] = {
 		.data = &rcar_info_r8a77995,
 	},
 	{
+		/* Keep to be compatible with old DTS files. */
 		.compatible = "renesas,vin-r8a779a0",
-		.data = &rcar_info_r8a779a0,
+		.data = &rcar_info_gen4,
 	},
 	{
+		/* Keep to be compatible with old DTS files. */
 		.compatible = "renesas,vin-r8a779g0",
-		.data = &rcar_info_r8a779g0,
+		.data = &rcar_info_gen4,
+	},
+	{
+		.compatible = "renesas,rcar-gen4-vin",
+		.data = &rcar_info_gen4,
 	},
 	{ /* Sentinel */ },
 };
-- 
2.45.2


