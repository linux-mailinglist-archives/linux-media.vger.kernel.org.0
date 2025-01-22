Return-Path: <linux-media+bounces-25163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE46A196F1
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 165C916B41B
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5727921507C;
	Wed, 22 Jan 2025 16:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="YOJPP/8j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qFCsr/XT"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11681215172;
	Wed, 22 Jan 2025 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564876; cv=none; b=t5VDc5XxUphyCZazJKsBiG0GmophqideOgSGY/g7w94HAVr4v2fJ4iB3qtQ2VrnYvfLKHORLbLtN/F4gko/auMsMUCAZoNAKGCIpbvjMl9SvsSnV3UJo0eJigxR+A0VODZKA8hPMjq6m0Nyc0mRZ2YMGnSBdiMbJ0M2VYKDk9Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564876; c=relaxed/simple;
	bh=DYCm1zJzYo5NcMshAqHzkLg+VVPAeVP+9FF2Ul7oDSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KpU0bMP79ndOvB/1cPzTMOO2WY2uAxpnHM0YbTq5I3Px4j5d8iaA5TtBMLJVEsYHB6IK1+GN/uaM7F5kZ7ZjAmvdeTSDVy+Cw409cbqPH1Lua09d3LUq6wHM72VNsgFpL1Q4r82myb6yGu7FoehKorh6NYB2gG1jXChXAh5Z75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=YOJPP/8j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qFCsr/XT; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F08502540148;
	Wed, 22 Jan 2025 11:54:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jan 2025 11:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737564873;
	 x=1737651273; bh=PTZRoiIjD4yD4KVMlEgtRaAcraBCJAvziTqQxn5Asac=; b=
	YOJPP/8jGqb6ajuKcMMGoTiZIUElXDFhrxq6I1MZiY65JU5TmikNHd68iUSX3Cal
	b4+6iNLjWnpfA4Dou83ThW+k6OxM1jv7lCdvyPNTbqerP1zDFvvNTOyq1V733dOu
	YAhd7tOWy7AM9zBKAmdF84gxhzh5YeNDwSCG5KtJWRvJBa2BwYHNgx/UHg0YfS2n
	0Vp+hCLoyBHUWLvOfYxqBRG3Uv/Mg/ftRiV9nFGBUn4WbIwcYvqAKsR59n+5M1on
	d1LKloJMn+WG3c4TcbBUiKNIXXaFwn9W+7vBxaAmlNTZ4NeERXNyK5ej9TKmuY0/
	gsp09O8H7wntTgoACYIDEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737564873; x=
	1737651273; bh=PTZRoiIjD4yD4KVMlEgtRaAcraBCJAvziTqQxn5Asac=; b=q
	FCsr/XTKhWL1bKcjWYVWI98YimTim1bjqj+TkAqU7FN+fji4BkU8JGK8LqPOS0b4
	AOOpqPrhqD3pjKaRt4NRJNblBYY54I4pU+rl3pEja7PqLn0cMRp5ovJFKauZEVMa
	ocrFifpWgqMt4BLKlBSBjn/RznQCN5fv0TOtzASwZhCQuit3a08olycSV5Ttbo7i
	6ytOTkDi4gDFWQ95mmHRaba9O0Us78F4iMfldfFjGDk59a75Kj+J11O8YarA8Yt0
	Y6B16ZWZWRz5QDqEpSizIwglc+9F3ujgyFIHgMOD23/h2f1wyjGz79rlty3E+lT/
	iMyRqkFDTLmi5bXLHvXcA==
X-ME-Sender: <xms:ySKRZzGBTKfWfGYjo7GHu8OKDdzqLpYYwgwuXjXXLgd6PY6RAI1fiA>
    <xme:ySKRZwUkx9bKm-8iU1s0_LHY5hNtjB0aUunFYmhbidZ9Ke9HTnn768b8eDl7HBVej
    OyyTRkE9wXGRiIv9wY>
X-ME-Received: <xmr:ySKRZ1IsI9-6z1U1OGSqd5MKDZPEcNqYLVQmQXV1Jl73j9svACUq5p7JlL0opFArMpH9-BbrUP5lMeHq9OohRDn_gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejfedgvddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:ySKRZxH3RtgYEPoJJFrTkavicagysj7MN1L7aGvC3WPW_8M2SoNroQ>
    <xmx:ySKRZ5U8IJZ1qMoY2YFHD8vjlhdTLWumcyot8qdf2rQvrIoE2J6PVQ>
    <xmx:ySKRZ8NFanInCIkEzjN4DaUajdT-pu2hC4RF-gMZgVl571PLnGZySA>
    <xmx:ySKRZ413Tg7p_fTXke79Phx8t6fMJ6RnCjfil6mW1RHAmbh0z1WC_g>
    <xmx:ySKRZ7KUEKkPhxPpAOLp5X76ZNVhBuvHMXx3a_Ot9y5DJMz1JGTLGOM7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 11:54:33 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/5] media: rcar-vin: Remove superfluous starting state
Date: Wed, 22 Jan 2025 17:53:51 +0100
Message-ID: <20250122165353.1273739-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250122165353.1273739-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The STARTING state is superfluous and can be replaced with a check of
the sequence counter. The design idea is that the first buffer returned
from the driver have to come from the first hardware buffer slot.
Failing this the first 3 buffers queued to the device can be returned
out-of-order.

But it's much clearer to check the sequence counter to only return the
first buffer if it comes from hardware slot 0 then it is to carry around
an extra state just for this. Remove the unneeded state and replace it
with a simpler check.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 5 ++---
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index a16adc6fd4dc..ba55ccf648de 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1064,7 +1064,7 @@ static int rvin_capture_start(struct rvin_dev *vin)
 	/* Continuous Frame Capture Mode */
 	rvin_write(vin, VNFC_C_FRAME, VNFC_REG);
 
-	vin->state = STARTING;
+	vin->state = RUNNING;
 
 	return 0;
 }
@@ -1120,14 +1120,13 @@ static irqreturn_t rvin_irq(int irq, void *data)
 	 * To hand buffers back in a known order to userspace start
 	 * to capture first from slot 0.
 	 */
-	if (vin->state == STARTING) {
+	if (!vin->sequence) {
 		if (slot != 0) {
 			vin_dbg(vin, "Starting sync slot: %d\n", slot);
 			goto done;
 		}
 
 		vin_dbg(vin, "Capture start synced!\n");
-		vin->state = RUNNING;
 	}
 
 	/* Capture frame */
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index 4cb25d8bbf32..f13ef379d095 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -64,13 +64,11 @@ enum rvin_isp_id {
 /**
  * enum rvin_dma_state - DMA states
  * @STOPPED:   No operation in progress
- * @STARTING:  Capture starting up
  * @RUNNING:   Operation in progress have buffers
  * @STOPPING:  Stopping operation
  */
 enum rvin_dma_state {
 	STOPPED = 0,
-	STARTING,
 	RUNNING,
 	STOPPING,
 };
-- 
2.48.1


