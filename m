Return-Path: <linux-media+bounces-36722-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C92AF8239
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 22:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61053546C78
	for <lists+linux-media@lfdr.de>; Thu,  3 Jul 2025 20:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279242BE640;
	Thu,  3 Jul 2025 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="P57nnW3h";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lscm12aJ"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14C72BE63F;
	Thu,  3 Jul 2025 20:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751575998; cv=none; b=Sz5XOYK9+4Z6M0FfeWIqAOg1Z1MnauWhS2l42dMywid8qZWcsZi8FeU7ClPq49SRCFx9SkzfOQxGdSwdhuBg4AIu+k7flIzcUyeKjk68z3Ub1pNILaaj/1OfMHdg3/0vVy4N1mDzOiSCTaIw3URty4VsusdAETtatWqd/MJ2xtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751575998; c=relaxed/simple;
	bh=3yPaZzU7r1X8+pYv6NFBEhen0P4hsERuKZm/gtKHir4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FpYgVcgaexZlZgWBfYkEmxH7+uGQ9RRmOSWYd5e8CUyDjHKp6N+hEZSK+TuxXAoKNLG4b3O1/Cv1pVX9/vkYZz68Z5ZolcqB1YOdEL0rAGrDkbZ81RJaulNO0Fgex5bjSiat97kXD0ed9o5KoXTVphhHufKbFYxlZZX6z26M4E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=P57nnW3h; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lscm12aJ; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3627A1400FA3;
	Thu,  3 Jul 2025 16:53:15 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 03 Jul 2025 16:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751575995;
	 x=1751662395; bh=HQ57IaklvE78hYBRaaB9qXcL0LG3bKRpa9k8oXKpX5A=; b=
	P57nnW3hmvUoC56WdXg2/irI75Iza2e8+BUG3dzhFpeQz2KSx7jDfMHyu3qGU9Y4
	taOS8EyRtjQY8JDI0z1FIKNOou1kB8xd317Sk/CadV4PUI8DIZJ5cDcHtK1v3K7a
	rM1VftStTj0oPyOqTXHR+RiYNz72pelmtjsRggiwKzeRHzBddS8kLYME/pfZV0ni
	y8M0paSnTslAwJZNcDfZx0Me8h8viL3xDAELuMzxyz4QICEoFgTtPzfGyCwLOyB0
	7a6NmL1rivd1YofebWxp2WLJOicCB2miHFmItKQjq/fBx3nDcs1Pv0Pqe3gbdwJT
	D1iBxNkdMStMMmITL8UVTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751575995; x=
	1751662395; bh=HQ57IaklvE78hYBRaaB9qXcL0LG3bKRpa9k8oXKpX5A=; b=L
	scm12aJGn8jY5WjbiK3j5VX75/N+RDsBVhS7JGGOXYX8BtQRI6y2FEqVOsLs8QTo
	Wh/GZvpNUlUtKvChXZCKmuvCuOHnpIH0GkSSrQQSRxdJraDrM4VHiF93tZnJZwhD
	J2LVlQVRl2drCOuNweysNb5SHusU4rRgWAZvgvKPO1G9z28yzCChVZcXgGtymF1B
	k+7pe1Xgq6Qq0Kzum8penZkZiMIhDxnjKIgkaWWjQrLMuEjCLavRmCE5re08yXQs
	YFyx2qQJDCWBlvgA+QGsPS42JdJP+aKJvpqurj2yo/aB3nng2adS8XE3wxkhf9QT
	k6Usj4pE1T7lWfgFJGrUw==
X-ME-Sender: <xms:u-1maPGlv5XWPZY4wVTY7EfLsl2h-GgT473_EJw_GOtDl_PlwdY4OA>
    <xme:u-1maMVJ0jH70TzQz7QfLdqgFQX8tOCRKfmA73cq_39dvmqkU1z5K7ub7d1pp3aMO
    nnhzi7txQH7h2jLvhM>
X-ME-Received: <xmr:u-1maBK_zPNsyI2mc3csMtulE8GJxzZfHUOO8RJAKu1dBNdSiFXz8EA9e2_GwqTyNxhgbSjeH3Dp67alwSga0nLmjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvuddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgepudenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheplhgrrhhssehmvghtrghfohhordguvgdprhgtphhtthho
    pehmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvhgvrhhkuhhilh
    esgihsgegrlhhlrdhnlhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghs
    rghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrg
    hsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:u-1maNHyUsfSXUfUBjSvAHP74abHUL9HmwQDUePQDjqd146DIuQc1w>
    <xmx:u-1maFXtaLerQ1-3UkC2FvZXij0dQ3II8i0P8KVbHOoiCTvu-q2glw>
    <xmx:u-1maIMHKl5Ek10nqMqzQ1FScmSzjuiBA9BugVxJQC2pAd97oi-1LQ>
    <xmx:u-1maE12BtSMdwC6pCwZoATwqdOfh4xxSkc8FdwUNj5g5u-nUe8ufA>
    <xmx:u-1maCOyDw3kyhravzQE8v1mng0ygaQt8aYuuDpeSqJY97yFGBTGfxbI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Jul 2025 16:53:14 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 10/11] media: adv7180: Only validate format in s_std
Date: Thu,  3 Jul 2025 22:52:22 +0200
Message-ID: <20250703205223.2810806-11-niklas.soderlund+renesas@ragnatech.se>
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

The .s_std callback should not write the new format directly do the
device, it should only store it and have it applied by .s_stream.

As .s_stream already calls adv7180_program_std() all that is needed
is to check the standard is valid, and store it for .s_stream to
program.

While at it add a scoped guard to simplify the error handling.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 8ebb72b2bb61..122d5b08052e 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -468,22 +468,18 @@ static int adv7180_program_std(struct adv7180_state *state)
 static int adv7180_s_std(struct v4l2_subdev *sd, v4l2_std_id std)
 {
 	struct adv7180_state *state = to_state(sd);
-	int ret = mutex_lock_interruptible(&state->mutex);
+	int ret;
 
-	if (ret)
-		return ret;
+	guard(mutex)(&state->mutex);
 
 	/* Make sure we can support this std */
 	ret = v4l2_std_to_adv7180(std);
 	if (ret < 0)
-		goto out;
+		return ret;
 
 	state->curr_norm = std;
 
-	ret = adv7180_program_std(state);
-out:
-	mutex_unlock(&state->mutex);
-	return ret;
+	return 0;
 }
 
 static int adv7180_g_std(struct v4l2_subdev *sd, v4l2_std_id *norm)
-- 
2.50.0


