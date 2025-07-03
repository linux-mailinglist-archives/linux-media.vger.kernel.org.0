Return-Path: <linux-media+bounces-36723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEE3AF823B
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858CB546EF5
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E689A2BE648;
	Thu,  3 Jul 2025 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OCYYSb7O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j/0fDztg"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE71F2BE7D9;
	Thu,  3 Jul 2025 20:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575999; cv=none; b=Eh97okBRXAg0hwaRWl8cjMP8Uflbu6k06i/OH2HuqM8Cn5kDK5EmlzgqZR9JWMXDPCIfwlm23SlTuoQIEvl5ShNABVrjJoq9tWvbJhs5ohxaWKMPZ6xHRUSaajKVvmuLVqv1F1DjbLBDmu7DpwrH33rAseg0gNIsKeQu7lgjO9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575999; c=relaxed/simple;
	bh=P/jJmgKl6pI4D8t2DYfGeKe0ziXbDE1i3rvr9wQ/vds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H9o99v73xoWFvlB0xnWIrV8qYHfY5bHuH+fG05NSF9YjVF+/xmjA0iwW5G6TFbhNChRFchgROEv4pOXdAZYpF6y8DbA7RDHvzYyDRFsOzAOj6wFRSQ7GXMb/r4LrFXUY7Mwq1XY2VtDe+yFSJaLUFrvQ2yN2bHZz2ptQgUL01oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OCYYSb7O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=j/0fDztg; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 201781400FCD;
	Thu,  3 Jul 2025 16:53:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 03 Jul 2025 16:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575997;
	 x=1751662397; bh=pRrYpehiLpejphpIJBU2gEEAB0RuPDyy776wWCs27AM=; b=
	OCYYSb7OcuRjdetc4+i7bLiCa7dTFItJ7yfbZCYOpJl08v5D13L0QLSJ1yTWP78o
	2VrHRi1AtY1QusuHTXXbWrwIb2d0O3OAV8u2V3sbIDZb1QMDZ9yG5VsxP0HWqQB1
	PBzER5t07zsK00JPxC2oQv3+nkVTJx/vJLY1DD4P74Hu9a6fEc5L46mmRkYay0yZ
	aaDg1Tp4+vrxLo00LoBMGf07t7sTnSwOxyGv6FWGkZqKLuPvDAy5I6QLC3GbDEXr
	S2y1MQNp5GzLANWJLEQAwIi6czd13s79N8R4rYgGOiWXN55zQw2mnWXpfuoJRrnO
	ZhN375YmzjKUHOf1C5SQ9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575997; x=
	1751662397; bh=pRrYpehiLpejphpIJBU2gEEAB0RuPDyy776wWCs27AM=; b=j
	/0fDztgqPK3OmKyzCTBnMUZ5CItbOafpBi7CCKrkYZwxizLtxjsa8C9N4P8E6B68
	lUapVdD1BLSkV0qmzfe1xoPcxWH2ACasd+q0XFaNjuCjNRSInttX978gsIsLs9UI
	QAfxEca9m3wWo8neIdmEkmKNMSe4BuzvUR7mVjI6tArFwBWBi+HnHr4WnAm8xIvs
	eNx/fF4N8Q7IgPRMvl4cizR58kE8QTw2asFSF6O66ITNlsPvrOQ5FHrsIa7M0YnF
	6zzfUvmwl2hLa1PB5G6QhwY/z88MwXOTiuCJ+zcUlt9/8SFuWoy3xUgUQ0mNCqFF
	46gGF1TXRALPCIgHBkPHg==
X-ME-Sender: <xms:ve1maNtKkdgt1jHS7nNW_pQnNoMjgSaQMAKp-hUTaAbY0Dvls1q6iw>
    <xme:ve1maGe99_JblDg4sIVg3mE9yFPjE4t3OIgJ-ZAlyYxiETW2jRG8ZIo1SIKxy3N2m
    pN7TJ13dutEraHjD1I>
X-ME-Received: <xmr:ve1maAyH-utSFJUBnyVRyCZUZbbsDM0d2mVPQ5NB8ZyVxJD8LVgnuxIeJIK0FFT0TxsNAzyJxETlDFXT3Y8nzTJYbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:ve1maEO087qPmK3EtR6nv5CqhuJVUlnCPNGRvlaUNyY_r2vOkBAPkQ>
    <xmx:ve1maN-2vxHzyeSQJsK1KZzjUvdfoaaMHvGV7-vF6IrpM9xcd12qgQ>
    <xmx:ve1maEXTZ0UGDrMUS41Umtrn3fu3dy50WFKLn3HQfPbCBC73ZAx8FA>
    <xmx:ve1maOeDPuFiaQyFR0vMIZsxTbVUtqauN0ebdQ6yEQp3HJJIgKHtbA>
    <xmx:ve1maFjtWuLTetGoYrzUBgyI6tXRj3I8c74unb8ESeW_W_OZO_LAbWCI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:16 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 11/11] media: adv7180: Only validate format in querystd
Date: Thu,  3 Jul 2025 22:52:23 +0200
Message-ID: <20250703205223.2810806-12-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250703205223.2810806-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The .querystd callback should not program the device with the detected
standard, it should only report the standard to user-space. User-space
may then use .s_std to set the standard, if it wants to use it.

All that is required of .querystd is to setup the auto detection of
standards and report its findings.

While at it add some documentation on why this can't happen while
streaming and improve the error handling using a scoped guard.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 122d5b08052e..a62ac39bcd00 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -388,32 +388,27 @@ static inline struct adv7180_state *to_state(struct v4l2_subdev *sd)
 static int adv7180_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 {
 	struct adv7180_state *state = to_state(sd);
-	int err = mutex_lock_interruptible(&state->mutex);
-	if (err)
-		return err;
+	int ret;
 
-	if (state->streaming) {
-		err = -EBUSY;
-		goto unlock;
-	}
+	guard(mutex)(&state->mutex);
 
-	err = adv7180_set_video_standard(state,
-			ADV7180_STD_AD_PAL_BG_NTSC_J_SECAM);
-	if (err)
-		goto unlock;
+	/*
+	 * We can't sample the standard if the device is streaming as that would
+	 * interfere with the capture session as the VID_SEL reg is touched.
+	 */
+	if (state->streaming)
+		return -EBUSY;
 
+	/* Set the standard to autodetect PAL B/G/H/I/D, NTSC J or SECAM */
+	ret = adv7180_set_video_standard(state,
+					 ADV7180_STD_AD_PAL_BG_NTSC_J_SECAM);
+	if (ret)
+		return ret;
+
+	/* Allow some time for the autodetection to run. */
 	msleep(100);
-	__adv7180_status(state, NULL, std);
 
-	err = v4l2_std_to_adv7180(state->curr_norm);
-	if (err < 0)
-		goto unlock;
-
-	err = adv7180_set_video_standard(state, err);
-
-unlock:
-	mutex_unlock(&state->mutex);
-	return err;
+	return __adv7180_status(state, NULL, std);
 }
 
 static int adv7180_s_routing(struct v4l2_subdev *sd, u32 input,
-- 
2.50.0


