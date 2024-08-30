Return-Path: <linux-media+bounces-17243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99A966AA5
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35979284A6B
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348511BF7F8;
	Fri, 30 Aug 2024 20:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qZ/J0GNn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jRPDSfGy"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15BF1C0DC4;
	Fri, 30 Aug 2024 20:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050105; cv=none; b=MChvrWw42lZPhYcdOjDJ2spFDb1lY9NNDNHEDviSpkMXd8wb4wsyExHAldGKfdQccG/Zz6gAqqrz5neL/VEW/sR6Yb9afHfU9qNoM8msj0/CbLPyzia0h6d/OwWqjM/QIwIQj1t6s3N2Uo5gqLxMvIQK/U6ZC0xk0bRDQdXvTh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050105; c=relaxed/simple;
	bh=RusLnnzXe0jlX36BmL8KW2HQb+8KMlD3M2aMYkJLfeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FuCcsqdbTpMYwdLayDZSrWxvojoZQd2jspUy8Ff3GKpd5lx89gk5lFSFccQfOjSbKMzO5ddu28TuB9V5cuNF+14wkPcg5QsezdDNEKJYpEBfYineolIfS6w6C/yDeYieQXS5NyOstPPPDzFxS9zSqvJ1K+yZTOI0mbbshte0wmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qZ/J0GNn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jRPDSfGy; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B11F41140181;
	Fri, 30 Aug 2024 16:35:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 30 Aug 2024 16:35:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725050102;
	 x=1725136502; bh=zVPJjWpyJz870XcHiD2OTc0eZoFvRtxahIqTo+Tan/A=; b=
	qZ/J0GNnniPzrlSi07Wwbxm3H3iX0z+d3bVWuso1BA80t1DmclTv+WImXWcAh/t6
	tiU/rujRwe35QG4mNkTl3WWRv2wVNMjD+kWMgS+Hd33XanjZOw+K24GcC2v8WeDK
	GEAevyvQ4gpM4lSDuFPC5Oi5pGbVb8uukVU/zyCQubnLk+Rr/ZR/Nx5qu7wq4ptS
	KEwVtAEDq2hVwuOfkm1jcPigG3KDXWZ3+va9KZwf7klnv63MgbDkEMeU7L394/uQ
	wCTxRBApzH3c6q87f5nElM/As7LULNRxrVcjoW/yAXlMhFm6F+xHbgV5s80/mXeA
	/H/TKhaxzxq9Cvd7rHcn4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725050102; x=
	1725136502; bh=zVPJjWpyJz870XcHiD2OTc0eZoFvRtxahIqTo+Tan/A=; b=j
	RPDSfGyxosqMqhklT3O79JJX7O+rwVuuYa9MrFKMklUnO3fePIbITzBFRoX03GXX
	dzr9F7JMwAYbRdOaOZhIODNIL2qlPqwg5om/KSCS8+2IRiG7RS01ZQ/7mAcFkrWf
	/qTDx1htDF1XAwwLu/IhlbPDyk4qJun1qKf0tHAEKgyduNyIGgQ/zpqweR2JQNyz
	ryqpwB4ruBsMqdXO0aLjqE27TKfseiNQrB+CaHvu44trBcZADNJB+oPPaxemMAlV
	TUNvonfddhx2oWJI1Ehk+Ydnf+se99w2k47qaKDy1nGWVjRHNjTq/+lzLS1Geo3k
	CId5U336RPrvVyZ0ALFKQ==
X-ME-Sender: <xms:9izSZuZ-0UZMuVnyUQ0A4AhnsaulWqYwVLrq_MCM3wVSmz0a0F9erA>
    <xme:9izSZhbIMxfCjHcpq0Dt7Xf8dXdRkTtLnQyZ4Wdbj05kkpG-Q5eOGnpP-cWtd-GyI
    RNQOY67u7KKv58kLRg>
X-ME-Received: <xmr:9izSZo9NeOauQMP5hJdmRKonT6WoA8UN0GQHzDdolk8WMxJUco2-Q1AYL98l61MBUOqynAfj5wsXPJOhYNyxLhXiLg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrth
    esihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehkrhiihihsiihtohhfrdhkohiilhhofihskhhiodgu
    theslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggv
    pdhrtghpthhtoheplhhinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9izSZgrsnv1MnCAP4wvh5d_4GRkMhJ28knDKzjg_4-JfFmuL1vsT1Q>
    <xmx:9izSZppAN0ZajGgwT15NPmnVGsuC-xgPXG4oBdRpQ0rKpEaHHkB0cA>
    <xmx:9izSZuR5bySK3OVatTtC2xrfM8sA5RPrrRKtu17Zu7jKUa4NTwEjjg>
    <xmx:9izSZppPxzP_V7xm09wY28wlGbCqltYYiMZ1nq9CUvIf4hBJnW1CDg>
    <xmx:9izSZqTNJxmmVoaMkQosPcDv6LI3HixvnDG5enJ7llYWBuluik2-YlPU>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:35:02 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/8] media: rcar-csi2: Allow writing any code and data value to PHTW
Date: Fri, 30 Aug 2024 22:30:59 +0200
Message-ID: <20240830203104.3479124-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240830203104.3479124-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The helper to write an array of code and data values to the PHY Test
Interface Write Register (PHTW) register uses the case where both code
and data are zero as an exit condition. This prevents writing data = 0
and code = 0 to the register.

Up until now this has been OK as no such combination where needed, and
it was a convenient exit condition. In future writing data = 0 and code
= 0 to the PHTW register will be needed.

Avoid using an exit condition when writing an array of PHTW values and
instead pass the length of the array to the helper. This allows any
combination of code and data to be written.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 29 ++++++++--------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 932826ee0961..5ab19f94fcde 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -1473,13 +1473,13 @@ static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
 }
 
 static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
-				  const struct phtw_value *values)
+				  const struct phtw_value *values,
+				  unsigned int size)
 {
-	const struct phtw_value *value;
 	int ret;
 
-	for (value = values; value->data || value->code; value++) {
-		ret = rcsi2_phtw_write(priv, value->data, value->code);
+	for (unsigned int i = 0; i < size; i++) {
+		ret = rcsi2_phtw_write(priv, values[i].data, values[i].code);
 		if (ret)
 			return ret;
 	}
@@ -1520,7 +1520,6 @@ static int __rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv,
 		{ .data = 0x11, .code = 0xe4 },
 		{ .data = 0x01, .code = 0xe5 },
 		{ .data = 0x10, .code = 0x04 },
-		{ /* sentinel */ },
 	};
 
 	static const struct phtw_value step2[] = {
@@ -1529,12 +1528,11 @@ static int __rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv,
 		{ .data = 0x4b, .code = 0xac },
 		{ .data = 0x03, .code = 0x00 },
 		{ .data = 0x80, .code = 0x07 },
-		{ /* sentinel */ },
 	};
 
 	int ret;
 
-	ret = rcsi2_phtw_write_array(priv, step1);
+	ret = rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
 	if (ret)
 		return ret;
 
@@ -1549,7 +1547,7 @@ static int __rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv,
 			return ret;
 	}
 
-	return rcsi2_phtw_write_array(priv, step2);
+	return rcsi2_phtw_write_array(priv, step2, ARRAY_SIZE(step2));
 }
 
 static int rcsi2_init_phtw_h3_v3h_m3n(struct rcar_csi2 *priv, unsigned int mbps)
@@ -1575,10 +1573,9 @@ static int rcsi2_phy_post_init_v3m_e3(struct rcar_csi2 *priv)
 		{ .data = 0xee, .code = 0x54 },
 		{ .data = 0xee, .code = 0x84 },
 		{ .data = 0xee, .code = 0x94 },
-		{ /* sentinel */ },
 	};
 
-	return rcsi2_phtw_write_array(priv, step1);
+	return rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
 }
 
 static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
@@ -1587,20 +1584,17 @@ static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
 	/* In case of 1500Mbps or less */
 	static const struct phtw_value step1[] = {
 		{ .data = 0xcc, .code = 0xe2 },
-		{ /* sentinel */ },
 	};
 
 	static const struct phtw_value step2[] = {
 		{ .data = 0x01, .code = 0xe3 },
 		{ .data = 0x11, .code = 0xe4 },
 		{ .data = 0x01, .code = 0xe5 },
-		{ /* sentinel */ },
 	};
 
 	/* In case of 1500Mbps or less */
 	static const struct phtw_value step3[] = {
 		{ .data = 0x38, .code = 0x08 },
-		{ /* sentinel */ },
 	};
 
 	static const struct phtw_value step4[] = {
@@ -1608,29 +1602,28 @@ static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
 		{ .data = 0x4b, .code = 0xac },
 		{ .data = 0x03, .code = 0x00 },
 		{ .data = 0x80, .code = 0x07 },
-		{ /* sentinel */ },
 	};
 
 	int ret;
 
 	if (mbps != 0 && mbps <= 1500)
-		ret = rcsi2_phtw_write_array(priv, step1);
+		ret = rcsi2_phtw_write_array(priv, step1, ARRAY_SIZE(step1));
 	else
 		ret = rcsi2_phtw_write_mbps(priv, mbps, phtw_mbps_v3u, 0xe2);
 	if (ret)
 		return ret;
 
-	ret = rcsi2_phtw_write_array(priv, step2);
+	ret = rcsi2_phtw_write_array(priv, step2, ARRAY_SIZE(step2));
 	if (ret)
 		return ret;
 
 	if (mbps != 0 && mbps <= 1500) {
-		ret = rcsi2_phtw_write_array(priv, step3);
+		ret = rcsi2_phtw_write_array(priv, step3, ARRAY_SIZE(step3));
 		if (ret)
 			return ret;
 	}
 
-	ret = rcsi2_phtw_write_array(priv, step4);
+	ret = rcsi2_phtw_write_array(priv, step4, ARRAY_SIZE(step4));
 	if (ret)
 		return ret;
 
-- 
2.46.0


