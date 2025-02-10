Return-Path: <linux-media+bounces-25947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF63A2F613
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 18:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CB691886F14
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 17:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F01F24BD06;
	Mon, 10 Feb 2025 17:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LzJg81ZH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X+00LhNy"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EDC2566D6;
	Mon, 10 Feb 2025 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210212; cv=none; b=dV4Pa/ouw6rz7KDgayLRezYk3zIJ4lGf4em4dPkybXvtmyGHzdAlaMsqxCOYzmGHzwlYY8eUgpGjMMAaYnnCXizWwgUEUAjZI9qaMOgpLi/s1mfW6cxigvQGi49ag8/SMkhYGPFuCBqFe4KshZ9nzGJphOrpcKCHpX0d/k3zkRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210212; c=relaxed/simple;
	bh=WX8duDp9UY2AK1yL1NPEKAQIbrBRfcGMd8Mq0Ut4dAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tf+2CuqPAHghtmvzy8ISp/x7Oi2oQ06JPNDJPoAYQX/LLRk6tqW07vnFdMh6DWShcBlAqweTDdlf85WRaALSyPbqUKW05bO2nLtS1rUe7xFWcxh+wXx/jSnLzKckQYFlzzgBoFTZdfS7lWDI9tcSBlmweDt+ZbcLDT/LGPeASwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LzJg81ZH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X+00LhNy; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id AF8B31140225;
	Mon, 10 Feb 2025 12:56:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 10 Feb 2025 12:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739210209;
	 x=1739296609; bh=mArqwrKsYh/Zl4yEqXMR1NzP9ZxW1whG54O8bnLGmyM=; b=
	LzJg81ZHYqUH6FAeR+hW42RSa76DVwQyy2tuNxQ7eDNzku38+j2QiC/a5y/a8BKQ
	o8jHwVkR2BUbSgBHxDBpsww4QldoDP7mIWSzrv8YWMKqsm4CiItZ6gGSYfp922TG
	gm7fMVmTpkXPkONHZqjoDadmjk0i7ssvAahhEHXDFoxtOhJAfKqB6CjIgFsFcNMo
	NNsb/k8bRenQ+n2UuS2Qky+yXlxvnpb1zeYpUjGruzr+No97zkl9B6hSMr8xLD+w
	FMmlDtSu9jj/E+jK/KA2sv+hsdArli3tnRU3SUtFwx9ZbeaXf2xAcXgh/HrXGGbp
	lwnpHuwO7N+Ea2pLKxs1Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739210209; x=
	1739296609; bh=mArqwrKsYh/Zl4yEqXMR1NzP9ZxW1whG54O8bnLGmyM=; b=X
	+00LhNyuZ74K1dHOa91CpiHJ6JwyZcyPtd7SnUtSi7qSK5/00TYoinVEaeOa2ySZ
	mlBsbzMazCgwvMmIiydd/uXboQ7i6ptvp4DgnLqGPoqkUshwT/JMkqQSRdeaIijr
	Hjpls7b1tow2TuT2ChgbDCUwHWH4e+4np0Szv0o9NmppzkaztHjmOKzcaeIo3ko7
	QlE+hGSyVjXs3L2K7Z011V/7ws1jnpX4MIFzeRn9/PD3aSunknbBuLOqstQ4OeO+
	/2ZyqNbg0dDoB2tXnAkvMOoAhLP44ajJGF37SfkOb0NjgtNYVpffcrp58jd6dSvQ
	wjflk6q9qXxTTQXs6tEyQ==
X-ME-Sender: <xms:4T2qZ8DqCXJhS318va2pCZX_-06RmI5-zjFqSoTwgkHx7uXu2GrloQ>
    <xme:4T2qZ-iPF6hWJtrjVGCL3bWZ8pP3ZhA8AhH1kQ992R0ZF0f4cd1R-vd81PeAWZoZ5
    LkSC-VzcT93H-e04L0>
X-ME-Received: <xmr:4T2qZ_kNk46yzpoW5T4oN6HkL-NSUuUXa5fyoqjZSP4b2bEG973_5z0cz90VdKR4U3aDI63geT0So0LkqSr2VEoJUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhr
    vghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuh
    igqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggt
    hhdrshgv
X-ME-Proxy: <xmx:4T2qZywVmuf82OZ3wwf3bCdYFR5wZhPyHC5nmX9worLNCRGTEST5qA>
    <xmx:4T2qZxRQdPTwCB4LugBioedGPB4NdB-1E5tWvCw4XlxLg5eyKtHUtQ>
    <xmx:4T2qZ9aszkAz9q9BDMdue7xnC08JPoUcvP7Md02_7b3Ih7urOu9J1A>
    <xmx:4T2qZ6RsLaPOZXLiIlLY55eOsqj3Gju6DKkAVX1uuWvDzdBi-lwMBA>
    <xmx:4T2qZwGAxxIOqoUqXap8Y5U3mTtAGMmbVZslKgyCiV56WZEg-uFPy7TK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 12:56:49 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v3 3/5] media: rcar-vin: Remove superfluous starting state
Date: Mon, 10 Feb 2025 18:56:13 +0100
Message-ID: <20250210175615.1686529-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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


