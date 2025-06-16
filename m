Return-Path: <linux-media+bounces-34999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A201ADB932
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 20:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4FF518882F5
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 18:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848C028A1DF;
	Mon, 16 Jun 2025 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OQYrclyu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ebtBYnb2"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2736E289E30;
	Mon, 16 Jun 2025 18:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750100317; cv=none; b=qp5NnY9KbTHFqfxOQU6fZnEeStz1b6woNmj/PwpbRC6qSkADj8drFW7FmLIdnhGyHHKhS87Q7QBNahfO8t0+1Bt4PcRb95VAHHJSxva5fD0MXEfI56t1LPdLz1Y+K853PFE0HkooQvyZAMJmaNw+IMdSBgr5Sefw/1f5MW2YZyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750100317; c=relaxed/simple;
	bh=mRhuzoLJ1Nwb0HHgXDFolRPhl8IhOwreBwkSgnDxyQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRHPJMB+Y/FuE9sWU+5tHgmOsXgtN7zqe9ZLL15JtIvwjQP/G3E5gyj/4wpdVOxCVwtbcduPrMP0MB34/cuInjezDbs/4vswAsGPfuutpfDCsmNgqqw0YK8Q7bveVAZWVitxNeyNoQBw+++qd+fU+hSdfpsUDCtL8U6C+zdmoqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OQYrclyu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ebtBYnb2; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2D1C51140191;
	Mon, 16 Jun 2025 14:58:35 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 16 Jun 2025 14:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750100315;
	 x=1750186715; bh=H4aFGpqX3H+9tW4dyyfGw1PxVE+UTMg8aY8paGovEyc=; b=
	OQYrclyumx4b+x+/mG7M8Z+MFOfjct2XmfBcmFGsFGiynRTkSBRp87B4iO8AQqQd
	koL2/HGLwdKJoCwFxe0Ubvbkc0iMLY1BqAEpF2dhy0Z7NT4sDVDJdomhZsH53Anh
	zoIw3QZmUXf7p9bXytwk6QRulT5ybVUP1ebt+EUdY3MgYI5Dmf31AcncYn2lXRB6
	ESozGIA3yrDyrrHLxHvRDLyVw5Hba07p/auOsYZTve6HfhXsyiWJqiXFltsbX6UI
	0gOdL2RGb07gZ3ZPxtoWT8WmBhcDGduMmzOkKqcvbWAsJLNNo0JBcYaVpa7/oG2C
	4sy/F47Stt19JmgxcEIN3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750100315; x=
	1750186715; bh=H4aFGpqX3H+9tW4dyyfGw1PxVE+UTMg8aY8paGovEyc=; b=e
	btBYnb2RUemhMdCH4fLCqnCVUo1Mj2tfol3V4OZIY0d9YCv913TNvN/I2Lq3+C7Q
	UJi0rgOhdVUkqtqlU/S4xpEe44W9WcHfR1vS2YI2Q7JIunuUgOfHAYfsoQeJbzln
	ocndq+0QCIiFmdjYR9MctW5YYtljqEeeZ/R0VNztmXMa5DdNjc0rcJC6egYqXdwd
	iP1qYsII7b6CBqDPXnn7Gp34dsDmIfYRAjYZX4NStBuBcR5VRvr2Ls+hs3XkZmER
	QFZn91RGzPmwA5qTiAGS3ri4dX1SyT6FrExq4ZK/qUcT0gWC/LWyIbhuaRG4GouC
	EY7jfRkH487L0bhx22TKw==
X-ME-Sender: <xms:W2lQaOGBlM6iqbjrvpE3mImqKcJibnpJQMx3ZzYJPr1FYZEL0gCYAQ>
    <xme:W2lQaPWOTYNYKq65MBbDSQtz0y5zKaOxfoPx7POKdLW_x1UE6qeSW4qW5eH5G4_QK
    rgLK0t5iUtkwwOwp2o>
X-ME-Received: <xmr:W2lQaIJUss2UOpgs1PUtlaDQEFSC0enWVy19ITUNFlQEKyJPPihN_pgzZFnC8NIRDFUDJJSJFQtzi6JxBBLAMgeRgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvjeefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvg
    grshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrd
    hsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdprhgtphht
    thhopehlrghurhgvnhhtrdhpihhntghhrghrthdorhgvnhgvshgrshesihguvggrshhonh
    gsohgrrhgurdgtohhm
X-ME-Proxy: <xmx:W2lQaIEzlrWd6_ztof6eV1temjPzi2NK071IwbS0pD9e7AnPfKiaKA>
    <xmx:W2lQaEWYadjCjf3ot90AyY0xkEPM7AqEmtXqLeoiHVP_ZQl-PzpftA>
    <xmx:W2lQaLNvRrqXUudVqaZ5-yK9m1mx-Go3FsNRLN2PBemJlZ_UNTNzhg>
    <xmx:W2lQaL3y-T1I_obNEHFHa3ZmyomPU1VRESTyMEqzi_Q0OoZAlFWw3g>
    <xmx:W2lQaKhAOAuOjhlyfdgGudjRjcqOPLl5dGpO_nrSvJTwOKMO99jjvww->
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 14:58:34 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 2/3] media: rcar-vin: Check for correct capture interrupt event
Date: Mon, 16 Jun 2025 20:57:21 +0200
Message-ID: <20250616185722.980722-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616185722.980722-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250616185722.980722-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Depending on if the capture session deals with fields or whole frames
interrupts can be generated at an end of field, or end of frame event.
The interrupt mask is setup to generate an interrupt on one of the two
events depending on what is needed when the VIN is started. The end of
field bit is set in both cases so controlling the mask that generates an
interrupt have been enough to control the two use-cases.

Before extending the interrupt handler to deal with other types of
interrupt events it is needs to extended to "capture complete" check for
correct the use-case in operation. Without this the simplification in
the handler can result in corrupted frames when the mask on what type of
events can generate an interrupt generated can no longer be assumed to
only be an "capture complete" event.

Which bit is checked matches which bit is enabled at configuration time
as which event can generate an interrupt for "capture complete". There
is no functional change.

While at it switch to use the BIT() macro to describe the bit positions
for the interrupt functions.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index e1dae46b06d4..19ff190f0fb2 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -114,11 +114,12 @@
 #define VNFC_S_FRAME		(1 << 0)
 
 /* Video n Interrupt Enable Register bits */
-#define VNIE_FIE		(1 << 4)
-#define VNIE_EFE		(1 << 1)
+#define VNIE_FIE		BIT(4)
+#define VNIE_EFE		BIT(1)
 
 /* Video n Interrupt Status Register bits */
-#define VNINTS_FIS		(1 << 4)
+#define VNINTS_FIS		BIT(4)
+#define VNINTS_EFS		BIT(1)
 
 /* Video n Data Mode Register bits */
 #define VNDMR_A8BIT(n)		(((n) & 0xff) << 24)
@@ -1025,7 +1026,7 @@ static void rvin_capture_stop(struct rvin_dev *vin)
 static irqreturn_t rvin_irq(int irq, void *data)
 {
 	struct rvin_dev *vin = data;
-	u32 status, vnms;
+	u32 capture, status, vnms;
 	int slot;
 	unsigned int handled = 0;
 	unsigned long flags;
@@ -1040,7 +1041,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	handled = 1;
 
 	/* Nothing to do if nothing was captured. */
-	if (!(status & VNINTS_FIS))
+	capture = vin->format.field == V4L2_FIELD_NONE ||
+		vin->format.field == V4L2_FIELD_ALTERNATE ?
+		VNINTS_FIS : VNINTS_EFS;
+	if (!(status & capture))
 		goto done;
 
 	/* Nothing to do if not running. */
-- 
2.49.0


