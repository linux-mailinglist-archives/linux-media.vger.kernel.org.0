Return-Path: <linux-media+bounces-34798-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198FAD9D5F
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 16:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A47B189A517
	for <lists+linux-media@lfdr.de>; Sat, 14 Jun 2025 14:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DC02DA75D;
	Sat, 14 Jun 2025 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="f/QsDmTc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X9HkQV0L"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812062741A6;
	Sat, 14 Jun 2025 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910581; cv=none; b=k7bk5vtO7Z2tW6J4ZYLkhanj4U+Ac0Xq0R74wKPegiIJ6wlCPPlg9/ObsVo+a5Zt0vuLLVSKXzSHaq8tFEwjyhy6oykPQr2p9aZyEoe7v4cvXi5CNSeTzKa0+gtZADU5A8csx2piR3ayAzX7uhVgZ4CIQgsHAaHrezjPNSZ2zWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910581; c=relaxed/simple;
	bh=DTa3l0kwmyk7N78wNwbyykF7mani9JGdtPkBxKyAh3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oaqOKS/ayuhttSnLEQzghymXVLq829x/iqikzAAtXtZquRXmJgIuI0SJDoyhf5IJvW4uHKo+FpAz0OvtFJ7TVcUY+UDuJ1W2xleV9dKDARa8gscqGBSu997q6+MmEskRQaobo4cqowoFhmDCIdKyqHJITNBRQS7gZO/J6vwUu5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=f/QsDmTc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X9HkQV0L; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 89BAF13803A4;
	Sat, 14 Jun 2025 10:16:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sat, 14 Jun 2025 10:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1749910578;
	 x=1749996978; bh=tKRllI5iYUJxtWb3aibDMssFPVfW6Nf8VxZvseykuio=; b=
	f/QsDmTcdFaRDeq/4JiiGV3tP1+UC7SCsOzEI1I3Sevl8JCZ8Fvh8sCkpT74KzOv
	q/NYo47r/mywzmeH0eqJjB3RVqUfv6myFl85vaOAZxIzr2Hz8/fXzHDm1WemMi4P
	l8FXCzPqV0zwtBo1AnQTCSki3MMuKyfLLgkmc2nbqPAo5aQ/nUfncgIt3guhQ7pC
	2J1j0mEKbcCi+4RSjpWa9B6cgR11pFBhpvX6iQVdzqrPqD+LQ6TiTLJR01DiXAPZ
	vPbDGOm1xRN6ygQvzZu55SM/QGE7aYBYdD3Tc2ymozx30eUXJ5Kdbc5v0SnTkCUO
	QBWGb2krnOaY/cIVUuiE7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749910578; x=
	1749996978; bh=tKRllI5iYUJxtWb3aibDMssFPVfW6Nf8VxZvseykuio=; b=X
	9HkQV0L3jMEp+S0fMuluvpPbP4eaXLzrTASMNVOmcfZ8XHweHsPOQaiZN9dX23u0
	QVaSisxvZRv7mdQzizZnkb/D2tHJUM9ntIoJbgvYEkCnzCl7t/Pp/L2A3Q15Bace
	Gtqq2djMJRhFszwGFjScuYAXoFmRBIzWuYUKBT20KCNUF2ttz2vIfwXlxEKGUxhH
	00BnUDZBmQw0OVfYIrMTtwXTD0qNVg2luWaFdGy2kQPpkF7HFZXvonQzENVE4gWt
	rBN0PBH4pvQ/VnN/hsRXQgcW23a0A53nrueF1BqlASI2FWjAd0fuqvgWvJnXADFA
	FaskfnqTOwJVMJUlqavhQ==
X-ME-Sender: <xms:MoRNaM4gD7SGsqi9GtFkEpixeqMMcJN4jJixLyI0aZcALdyy7VgPiw>
    <xme:MoRNaN4nyGtDgVO-pchhD-OKgk_RzLvgHn7JqCqeJTfUkdVrcvvBLo3ZF3M-c5c02
    QJeTsDCuB8DtFTFgZY>
X-ME-Received: <xmr:MoRNaLfFEvRLigrD4hGby0_IP8e1IHdvxWW1h8r4cV32YJXuURdRkUfE-_yIW8TBvFXfp1odlv6xmkC_Uj0vwhXB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvuddthecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:MoRNaBIFOAX6uoldJdScige3aRWVQ8cq8_mREaEsUY9tncI3qf2v3g>
    <xmx:MoRNaAIZRBJcyfjZACPNKHi6xBi7_qlpIyHEpD1vfxn-VyeUiPcjRw>
    <xmx:MoRNaCwONUCuyeP_zSwbQzLrg34Y5RDxUbAnv_MeWwAzajZX9_Zf6A>
    <xmx:MoRNaEIigKwb6YsO4rnF9Vg3PGBi0t5l4eKdJ1ZGdUrVfpprm4f1tQ>
    <xmx:MoRNaEVaYaanRc2ftpOOG8iNE7SMZskZ2pT-Ess_E88HmM3STcgiU--G>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 10:16:17 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] media: rcar-vin: Fold interrupt helpers into only callers
Date: Sat, 14 Jun 2025 16:15:43 +0200
Message-ID: <20250614141545.2860860-2-niklas.soderlund+renesas@ragnatech.se>
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

The call sites using the interrupt helper functions have all been
reworked to only one for each. Fold echo of them into the only call
sites left.

While at it rename the variable holding the current interrupt status to
make the code easier to read.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../platform/renesas/rcar-vin/rcar-dma.c      | 27 +++++--------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 5c08ee2c9807..585b8b3dcfd8 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -912,21 +912,6 @@ static int rvin_setup(struct rvin_dev *vin)
 	return 0;
 }
 
-static void rvin_disable_interrupts(struct rvin_dev *vin)
-{
-	rvin_write(vin, 0, VNIE_REG);
-}
-
-static u32 rvin_get_interrupt_status(struct rvin_dev *vin)
-{
-	return rvin_read(vin, VNINTS_REG);
-}
-
-static void rvin_ack_interrupt(struct rvin_dev *vin)
-{
-	rvin_write(vin, rvin_read(vin, VNINTS_REG), VNINTS_REG);
-}
-
 static bool rvin_capture_active(struct rvin_dev *vin)
 {
 	return rvin_read(vin, VNMS_REG) & VNMS_CA;
@@ -1049,22 +1034,22 @@ static void rvin_capture_stop(struct rvin_dev *vin)
 static irqreturn_t rvin_irq(int irq, void *data)
 {
 	struct rvin_dev *vin = data;
-	u32 int_status, vnms;
+	u32 status, vnms;
 	int slot;
 	unsigned int handled = 0;
 	unsigned long flags;
 
 	spin_lock_irqsave(&vin->qlock, flags);
 
-	int_status = rvin_get_interrupt_status(vin);
-	if (!int_status)
+	status = rvin_read(vin, VNINTS_REG);
+	if (!status)
 		goto done;
 
-	rvin_ack_interrupt(vin);
+	rvin_write(vin, status, VNINTS_REG);
 	handled = 1;
 
 	/* Nothing to do if nothing was captured. */
-	if (!(int_status & VNINTS_FIS))
+	if (!(status & VNINTS_FIS))
 		goto done;
 
 	/* Nothing to do if not running. */
@@ -1417,7 +1402,7 @@ void rvin_stop_streaming(struct rvin_dev *vin)
 	rvin_set_stream(vin, 0);
 
 	/* disable interrupts */
-	rvin_disable_interrupts(vin);
+	rvin_write(vin, 0, VNIE_REG);
 
 	/* Return unprocessed buffers from hardware. */
 	for (unsigned int i = 0; i < HW_BUFFER_NUM; i++) {
-- 
2.49.0


