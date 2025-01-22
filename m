Return-Path: <linux-media+bounces-25162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B108A196F0
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF2B1882FAF
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E38E215171;
	Wed, 22 Jan 2025 16:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="M3B/r38O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AzyXiqJv"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3F1215163;
	Wed, 22 Jan 2025 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564874; cv=none; b=QislxWVIeMQfNC6YpsMcWc5e64PEf5FQs6r1G9nWp6d8xgF+KysgpU8ngpUVtW1Z1NSOfVzIv5U8BAEiOq4Kpea0/Rz4awC31xuqwDe4k1ZjQf00Cvr3G53koJuTe1fgS7Ndht6ruA7/TmMMAsnvnrl4M2RfrzUrTZRXnuemhU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564874; c=relaxed/simple;
	bh=aF1mL2XHHmlB7bhN+x9apPMzNbcAF5Qy+lk57KduSNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bP6+Ub4/SzAk9PvVymjEizUmGXVlYCoBOg9GAaPdBtI4yya7mMx/M5S2ZqS/Sh3Fj3PCsUUMUhdOxX/T4vy8mYKvUrivEDZAIICefYOW2HNSWDYSmRgyJBG6bkzuLqJdvU7z4v5vBWAwR3bwFLqsAt3x7BijY+gw7AHpXOdwz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=M3B/r38O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AzyXiqJv; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9D4BE254019C;
	Wed, 22 Jan 2025 11:54:31 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Wed, 22 Jan 2025 11:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737564871;
	 x=1737651271; bh=0Xr04tPJq2w+/SEDdxIwdzftvSReT8VpOF04I4JH4fY=; b=
	M3B/r38OMxQv2rTJ3s7xd7j8XpmYR/DgtG4EYS49bOxZX1brOpVUI6Of4Tzp7Y9z
	0BU8pq5amOg81m0EWD3NrSkzc6LHKQbx38QhdF1fOFU9DqScMDQ+QGz4AX5/qKUq
	PLweQpbogOYkobbD7gUAhG5bQ45UDAoBg7vgeh7N0EUUDhM2P6Rr81D2VaOlxCV/
	Y3DIpHkm3z4JhmefDIe8RXRmagEF91490idK1z25PeYxiS/43LI0BxAVXuybxtCD
	fbzYZtysUhpMnh9x9H+GX/7mLU3ZCuWw3PsK6+h5WU/tepAwpW4geQ2sxIAGrPet
	8we8i5PLfwURbmWSq2A1vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1737564871; x=
	1737651271; bh=0Xr04tPJq2w+/SEDdxIwdzftvSReT8VpOF04I4JH4fY=; b=A
	zyXiqJvB6LrwJsVzcXZ7epnCSffbVyg22t1f+y6AK0p1NDPeQ3g+1zZw1Q3MypjB
	Ltl9EODQYUYqqGr98mVH6DVCNEbMkkl4hRaj/AHtypBZETL7djrbAwdzZYNq9QHt
	Xpb9tSm0T1tbJ+Aw6iZfbTw7gdrFjJqqVk65lMPc2IdzvLnY84cqzcdBMjtSnm0u
	Wu38dwSmekNoA4AFjzwcS0lETNQi0lqWHTTUh/xfS1uex0VjDg0TnUcXDzLY39fi
	hQYNW0BYjX3dbHJsmGxBCuh74DJChcOfVR7WWs4nf3pOLThPZtlL0VL4WmjFQdRN
	eNN6w0DSvd2TFyNDG83bA==
X-ME-Sender: <xms:xyKRZ66M2XOKZS-bRYZSQtkLwV6kofq8qDZLw3005ATRwW7q9K4fMw>
    <xme:xyKRZz5WY6Rh7bnQcDqaShZQNszRJ2az49YeocHKkNUZZxZm8M26LSFiqvNRlurEb
    Qnf9q3TaxCIXdoAGKY>
X-ME-Received: <xmr:xyKRZ5fET3pG1Aw7lnAzp1oh2QicmfeSut02ixFRuJTnxbloeI8d-hHxZr-IVAL9z_DlR40t8M33Jy_8kTFU3OQIrA>
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
X-ME-Proxy: <xmx:xyKRZ3LKrTDAfjt05byNhqE8LPbcwv5mUKlvdgvKtIECTC7RQuye0w>
    <xmx:xyKRZ-JiPZeA4vhZlLEE5-ykICXueapXugbJTC5ymWTEARIWL4ezVw>
    <xmx:xyKRZ4zCODHCIjUiyOvtpOdJsr6NEyr9ZyXq-tDPZb_YDBOSX-66rg>
    <xmx:xyKRZyIvoifpUWQ7AmBSnUruUCLGC2-Fdv2vb7sab1oZVjoSUNz07A>
    <xmx:xyKRZ295m8c1syqc-03u2tMtjZUjr9B4E8cqHFUR2cowA6aCSZanYlb_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jan 2025 11:54:30 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/5] media: rcar-vin: Remove superfluous suspended state
Date: Wed, 22 Jan 2025 17:53:50 +0100
Message-ID: <20250122165353.1273739-3-niklas.soderlund+renesas@ragnatech.se>
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

The VIN state of suspended is superfluous. The logic was that when the
device where suspended and in a RUNNING state the state was set to
SUSPENDED. And when resuming it checked if the state is SUSPENDED and if
so started the device and changed it to RUNNING.

This can be avoided by simply checking if the device is in a RUNNING
state at both suspend and resume callbacks. Remove the unneeded
complexity.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-vin/rcar-core.c | 4 +---
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h  | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index ddfb18e6e7a4..b8e35ef4d9d8 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -1085,8 +1085,6 @@ static int __maybe_unused rvin_suspend(struct device *dev)
 
 	rvin_stop_streaming(vin);
 
-	vin->state = SUSPENDED;
-
 	return 0;
 }
 
@@ -1094,7 +1092,7 @@ static int __maybe_unused rvin_resume(struct device *dev)
 {
 	struct rvin_dev *vin = dev_get_drvdata(dev);
 
-	if (vin->state != SUSPENDED)
+	if (vin->state != RUNNING)
 		return 0;
 
 	/*
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
index d5763462809a..4cb25d8bbf32 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-vin.h
@@ -67,14 +67,12 @@ enum rvin_isp_id {
  * @STARTING:  Capture starting up
  * @RUNNING:   Operation in progress have buffers
  * @STOPPING:  Stopping operation
- * @SUSPENDED: Capture is suspended
  */
 enum rvin_dma_state {
 	STOPPED = 0,
 	STARTING,
 	RUNNING,
 	STOPPING,
-	SUSPENDED,
 };
 
 /**
-- 
2.48.1


