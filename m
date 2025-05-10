Return-Path: <linux-media+bounces-32228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F08CAB2548
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 22:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA260A00357
	for <lists+linux-media@lfdr.de>; Sat, 10 May 2025 20:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378F32882A2;
	Sat, 10 May 2025 20:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="KUUUBRqM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="snWtmjr+"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FA4223DC6;
	Sat, 10 May 2025 20:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746910588; cv=none; b=AuDREfPHdeMKA3xEajDGEmkWA6cGKgVVRRcsUua9/23WXz6wVgPxiaU8YwvAgruHRbM5GV96dWXyMgx4ndQUk83i2sb6V1Xu/ysAssvGNoQlTvPfOGgFPwJRebi1drQxjOFD+1dcbZQP5n839XodQnqsI91eoNfS3gW+c4XJ+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746910588; c=relaxed/simple;
	bh=2U8R+50x6QeN25N0pgSVv/EX8ZIhj0nOJVyr0fIfplk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ER10Xf1PMFmDVrbQBOQJ8FYHMZv6UUbZcXX6poiKdzJwsg6jB8Z/JjB/Pq0R5KcEDlioFjVl4j/VefImg0FKNtv7a4OqBjsvWIseRTPvu3EM9kugtw30Lcxicto0lDYnSA5UeuN4tMI+hHdEEyV4eMRHU95Fy6lXV4hyYqiE2CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=KUUUBRqM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=snWtmjr+; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id B9E6111400B8;
	Sat, 10 May 2025 16:56:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 10 May 2025 16:56:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746910584;
	 x=1746996984; bh=4oecEAnOgtjKaSG1HzQSfrs8Q09xN4KkSmb5MCBQLBI=; b=
	KUUUBRqMVZ/ww7KD0pgXXPGOk1QYtr4tRqjn/XffGajNALsFc0b4xBC//pUMvF3W
	QQvupFM4FymXd1tOUtoAX8HVLGIXr94cvXWK20aHtdMVhJSIl1NlpgkkZF70Cb1C
	krhvZl09b0VBGYFyrZRznQzpuXR2/S2uW2bAjkE3xfGORzIPQhbs0M/8b/+nQE2Q
	+k5syEtWn8BmqgDWNHnY6hFNWM2h2gq+oO7Dzo+Z98gvLNx+k3FXT2CKBBuyy2sD
	aeJon5G5vZ/M8aa8gOuP1jb9CNTLYAk4+s3Nx6mNVt4XDJJOioSC3R7EuewEf1LQ
	jVSSpOj68aney5irtZm+ZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746910584; x=
	1746996984; bh=4oecEAnOgtjKaSG1HzQSfrs8Q09xN4KkSmb5MCBQLBI=; b=s
	nWtmjr+seVYPjPX5XruLLWIAWuVGDQH2u6nyNNRhSJr0hUXqR9+HgsHQCZOvN8Qw
	1YHW2yiZGGkd5BWHEdNLXG5/dXNkehmjnKfH18srnWGvhtbHmTdr85RClQzzTyQG
	Q4hJh3XJzbKVrDWxcQZYQKn6HkSDJWoJs2aQ0PnEeY3HgjYcNwI9A/5K3OijENlJ
	v8IrBwjjfTjB4Al+RgfPYREa9oDXHJ4FlnNpLCJ4UlnAAFMQtmWn2oHZMja3Q4DW
	E20oJz/BybAuLKT+XLxx/NZEe+/wrqrFrsTX+bbZJ1AdTiot07g3DkJ14sLYegxV
	EfKZwejFuIJZnmZjtLbaA==
X-ME-Sender: <xms:eL0faEqC6xhrTQOzBGtmdbgP_q7VUvNb99_INRvNdgZl7I49TCft0g>
    <xme:eL0faKoRg8Nxh5AvQirC1ccxp99F3gn_LFZJcOVTYbrOcKx_JVu6krmE3lm1m_84w
    IBAmYrtzoSEAPYUkBE>
X-ME-Received: <xmr:eL0faJOZxaykbHHtfDVaBhLXnN4SSeWdepy99Twigl7cMxI-FRg_9VKB44j3rLu6kraiPOUWkCxHauHutmGQktRX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
    hiuggvrhdrsggvpdhrtghpthhtohepshgrkhgrrhhirdgrihhluhhssehlihhnuhigrdhi
    nhhtvghlrdgtohhmpdhrtghpthhtohepthhomhhirdhvrghlkhgvihhnvghnodhrvghnvg
    hsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlrghurhgvnhht
    rdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplh
    hinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvg
X-ME-Proxy: <xmx:eL0faL7hg2ruhtpv4KkITp2yyYtK2IH1mZsq6qOEXDNveDSxiI43Hw>
    <xmx:eL0faD6WY_KAWLHGw4tzQLv3IPABW_5M2eE0zxaEVjHQPMNdtBXmeQ>
    <xmx:eL0faLhIcXMpnI01DUlTvUXBWq4A7C56URKlXN81Y_NgwQctVD6d0A>
    <xmx:eL0faN7XzvpZvBHnzyqQiHjdyDbHN0YLd0xlDWIZ3-6SvZjdmDj6mA>
    <xmx:eL0faO2x5W5Bt4fgS2-DQO58K0l4IUUdA5dIjxutynsko8FbC5oZ6TCq>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 May 2025 16:56:23 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/4] media: rcar-csi2: Clarify usage of mbps and msps
Date: Sat, 10 May 2025 22:55:31 +0200
Message-ID: <20250510205534.4163066-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510205534.4163066-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250510205534.4163066-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The helper function to deal with calculating the link speed is designed
in such a way that it returns the correct type bps (bits per second) for
D-PHY and sps (symbols per second) for C-PHY. And for historical reasons
the function kept the name mbps.

This is confusing, fix it by having the function only deal with bps
values as this is the most common use-case and convert bps to sps in the
only function where it is needed to configure the C-PHY.

Reported-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 9979de4f6ef1..358e7470befc 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -975,10 +975,6 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
 
 	mbps = div_u64(freq * 2, MEGA);
 
-	/* Adjust for C-PHY, divide by 2.8. */
-	if (priv->cphy)
-		mbps = div_u64(mbps * 5, 14);
-
 	return mbps;
 }
 
@@ -1203,9 +1199,13 @@ static int rcsi2_wait_phy_start_v4h(struct rcar_csi2 *priv, u32 match)
 	return -ETIMEDOUT;
 }
 
-static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int msps)
+static int rcsi2_c_phy_setting_v4h(struct rcar_csi2 *priv, int mbps)
 {
 	const struct rcsi2_cphy_setting *conf;
+	int msps;
+
+	/* Adjust for C-PHY symbols, divide by 2.8. */
+	msps = div_u64(mbps * 5, 14);
 
 	for (conf = cphy_setting_table_r8a779g0; conf->msps != 0; conf++) {
 		if (conf->msps > msps)
@@ -1301,7 +1301,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	const struct rcar_csi2_format *format;
 	const struct v4l2_mbus_framefmt *fmt;
 	unsigned int lanes;
-	int msps;
+	int mbps;
 	int ret;
 
 	/* Use the format on the sink pad to compute the receiver config. */
@@ -1314,9 +1314,9 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	if (ret)
 		return ret;
 
-	msps = rcsi2_calc_mbps(priv, format->bpp, lanes);
-	if (msps < 0)
-		return msps;
+	mbps = rcsi2_calc_mbps(priv, format->bpp, lanes);
+	if (mbps < 0)
+		return mbps;
 
 	/* Reset LINK and PHY*/
 	rcsi2_write(priv, V4H_CSI2_RESETN_REG, 0);
@@ -1352,7 +1352,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	rcsi2_write16(priv, V4H_PPI_RW_COMMON_CFG_REG, 0x0003);
 
 	/* C-PHY settings */
-	ret = rcsi2_c_phy_setting_v4h(priv, msps);
+	ret = rcsi2_c_phy_setting_v4h(priv, mbps);
 	if (ret)
 		return ret;
 
@@ -1363,7 +1363,7 @@ static int rcsi2_start_receiver_v4h(struct rcar_csi2 *priv,
 	return 0;
 }
 
-static int rcsi2_d_phy_setting_v4m(struct rcar_csi2 *priv, int data_rate)
+static int rcsi2_d_phy_setting_v4m(struct rcar_csi2 *priv, int mbps)
 {
 	unsigned int timeout;
 	int ret;
-- 
2.49.0


