Return-Path: <linux-media+bounces-34799-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C959AD9D64
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 16:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7C3B3A5413
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 14:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868822E1747;
	Sat, 14 Jun 2025 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="M437Zfkt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VMsjd2ZO"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76942D9EF9;
	Sat, 14 Jun 2025 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910583; cv=none; b=lHfuVX2Prl032T+LuGI3W9KLOmCki0T5m4BorocjvTXAtnAVDCj3a6o6jK3l3YX2TeS9U72UZ98VesUcSpyTV8GRxYI9sYbCxH65lGW9ciCsabjpPMvnhYcKr8ZdDM0zZyzRAGdkalU+h3HDMsa/j1GY/qt9NyaaIEB5XCvp6Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910583; c=relaxed/simple;
	bh=BldEuytxszT6LQKIo0RKEfQejpLe0DeGBghC01c2Qzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8AlKAkIJ5F+5aiEeoK4CnOfqjrRtrANOd5285sNLbIsm37wASacAgDMJf2NHDEviKGG9U3SjjmwbbSoUG6f8DQRlQ7rzGPenMbnfV+bKBQYjZrsrMdzabFLBaM67AlgKW+8L7UiI8GumveY+gpfF/qm3nKgOENWzJ41oT6PoHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=M437Zfkt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VMsjd2ZO; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 0E934138039F;
	Sat, 14 Jun 2025 10:16:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 14 Jun 2025 10:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749910581;
	 x=1749996981; bh=EccDRHfC1owa9BxBFhyftHnzmhde0tP0Z21NX7L5gEQ=; b=
	M437ZfktzQ4f3ye0RI7F1DcgCOG69S45VWLrFOg2uYVLJbab7oWPeEnfLdIWe0rP
	qqtLuA8jz4zxHQezi/Qvy9wOLmsEIVZIwK3bxPUQTaAIbywhSLE8EItfjQ8cCvlu
	qlUNsBVbHTdotq3FB8TKyPi9jRF11OaqxFxDisax9fZK4uewl8Se0VOFnwtMyblg
	azeWns5S49eokI8TZa6gt4GPyxOD3hQgDvJCoCMOIStpNohcv5nwTWLufrtWBtqy
	OC7qykfiW70d93ruWj7do44uf+AO+f83czTk/ag1b/x9IIwqduOORs0kyyfTqo/3
	Vn/qY73iWCzh52DlK83Qdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749910581; x=
	1749996981; bh=EccDRHfC1owa9BxBFhyftHnzmhde0tP0Z21NX7L5gEQ=; b=V
	Msjd2ZOY7iVTW3d4kDA8V4XKTkrtwgJr6yCxbAS9DKlV/qvy+pOzfbb4AfIfMcHk
	DohVce24s/NvC3ekNEcvX9TjhlrD168cOyoe6AsCMSc4VL/pkHvgPDZw1Jx5qKBE
	ICWIzbr+PbFcMspEKHZaRL1llapG72mSaaGI+UV8+S2T65+aAlZGOFx6sYHuTzq3
	QqxkDyBMVhkMffwTGdUP0i80t3yK6vIWVqkwLQGy/R0v1J5SMGIYWePnUEaGz2qD
	jfvbg4yBpXOrzJSbjJlXfnO8dV4oer010bUb8vIpDkWFGeY0FqNn81VtM/2ngTp5
	FZrIfon8QyvblXetbnGkg==
X-ME-Sender: <xms:NIRNaLMiSwWy3NmmqECQ--xNPHGfjK7iU97dlnSyLKKppBhEFkyhoQ>
    <xme:NIRNaF-0JEGDpQyzaOWW_ML4zwUkVFTahQX0jpn6xjzaHXAUjDjjherbthzdiaifS
    0OYEHWd1S2gj3odpCA>
X-ME-Received: <xmr:NIRNaKR-olcHaQAD3f4jEtZ2fwFghds0I7G106dzYXzwgDSSuF9uWPOsu3qqKNutAedSt3Mf6umJ6eNUvBYD3i5b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgrsges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlih
    guvghrrdgsvgdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvg
    grshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrd
    hsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:NIRNaPuvCoouhVDUaJ56imvZ845uIvyKYjtpdJHztwzb60nLMs0LVA>
    <xmx:NIRNaDc0UIImVf7cOv_EmnjR3jmDaq94ukbRjoLMsEmH-LvZd0iPRQ>
    <xmx:NIRNaL1BquBvjiyjerQK4-waTr7xop734lOr1OAamIgn-osXVGP6zQ>
    <xmx:NIRNaP9cZ5J1tOE39dcPF-0SFv57LJ-TWdY56C05L0CeHmOE1SpQhQ>
    <xmx:NYRNaLqpFq6m431NDMgqCqbZPKduXWq-wd36xSMrw9UVPhRrUeG23EmM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 10:16:20 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] media: rcar-vin: Check for correct capture interrupt event
Date: Sat, 14 Jun 2025 16:15:44 +0200
Message-ID: <20250614141545.2860860-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250614141545.2860860-1-niklas.soderlund+renesas@ragnatech.se>
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
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 585b8b3dcfd8..85e44a00e0fc 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -115,11 +115,12 @@
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
@@ -1034,7 +1035,7 @@ static void rvin_capture_stop(struct rvin_dev *vin)
 static irqreturn_t rvin_irq(int irq, void *data)
 {
 	struct rvin_dev *vin = data;
-	u32 status, vnms;
+	u32 capture, status, vnms;
 	int slot;
 	unsigned int handled = 0;
 	unsigned long flags;
@@ -1049,7 +1050,10 @@ static irqreturn_t rvin_irq(int irq, void *data)
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


