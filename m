Return-Path: <linux-media+bounces-17246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01041966AAE
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0BE81F23728
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51471C1753;
	Fri, 30 Aug 2024 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="wTRcO6cL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ok0CTyLc"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB7D1C173A;
	Fri, 30 Aug 2024 20:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050111; cv=none; b=loNHQXP1PmnqbhNHHbdp+aFHW54MWd7NydqHsUPKznBIl/zhBe/jhCNXtSBAb/U2TePc9WgOTXdDT5fwz8K1dq1Yhufs5ixwmnz8KYJbQBUfVitbBbSrfZl2HRxR+0NTAvymYRyYhQOkr7LpVZIJcAe9fMzTqIJa+OikfGWO5kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050111; c=relaxed/simple;
	bh=APSWh4mIXesIjwqaDvndgsOoJ0YBwIPQm7iGLeXVTtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/EoZQAo76Y69hVYYtkemUOssxlDoefg2na1SioxcXdOooaHFe22/lB3sTqp+813+wNlE1k9IqXJ4FRU5si8mMboSRucf8kkug6nVWY7gMZujPwyPJDSH4UeBdF+btu0olYkx2KHqgd/+n/cKEpUDIyD216D2CQqI9cz0xZn1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=wTRcO6cL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ok0CTyLc; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 96E80114017A;
	Fri, 30 Aug 2024 16:35:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 30 Aug 2024 16:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725050108;
	 x=1725136508; bh=i4gRbM1pSVE2qzmXjU5zUsyD19N0QlayHIRtkAwZWrM=; b=
	wTRcO6cLs0qhV2PI0JPBSNWAQC8Dzmpvkm0IEioBfT8XUdDMBzaphrDdaLZ+LBjT
	M1q0u7Ub8otvNPsg/UwubJO4lNcy6e+g+YzGNpLwqLnD9xdDFn9tjfIulN/4BILz
	HcKlvRriH+/JeTuSFBy7E6RxsjJbO7UEg54cTZxF4jNlrcPXoqAqg0NjfygMWLQw
	9FVt3cgayyjGYLhuzXzsTMlgjBqqL4Fvrj/FYMkM4XNZxqINIaYfltuYIAaBDIoY
	d/GVgUIliB4OOYYjkU1yzeV+ifwI3cDQCx0gyraNP0Fncz4ClkJMT7ecPRlyzbgw
	fNWngQDSfwHVPYK7di5bGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725050108; x=
	1725136508; bh=i4gRbM1pSVE2qzmXjU5zUsyD19N0QlayHIRtkAwZWrM=; b=o
	k0CTyLcaNEz2pjmrW/ss1jqNyusz+42WpCgw+ap8Tu1d98kO2hQkwySiQtgyKHMa
	rIRQREQta+62BztnfP2ixKOpPdxMbZ8XthdkAlqPcs8BsM2I9Y25ap7PH+ghJUJw
	k5Xw3bWhxH2W+gtIgXsEr02Ni/nXqD5xAoH89UeO8u8wGH/qOfvwMSIHMXtlqrDF
	DlqByurS5tqvLgQHu0uBYKaqiBPiwMXGZqscVLVF9zyReO2rfwt6js2sEeO0riUm
	5jT3JWUcdzpUnzuV9k82JImXp3d3cF6dMqY9z9x+PJIhUAANCt71P9fCiG37t0aO
	xG6XYplj9X0mvbNUO16pw==
X-ME-Sender: <xms:_CzSZvrxx9YvZTuUfM6o7zVQLywgZnc2s7a8dBIuOqJo0jJVOkH9uw>
    <xme:_CzSZpq_9jzDzjH94RBoXVq3zMD43UjkU4Se9yaE5GDDWme9jmMm8wYTeM8ZFPYPO
    my3KbZfinUXZ2yi5Js>
X-ME-Received: <xmr:_CzSZsNIjMr2b9WKKG6O1E_-7uMzkk9zVzZ0sNSaK4PDzc12WkOHzdu1Vryumi3l0OP__yHKfl7Izc786IsdiXM0sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudehtdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:_CzSZi6ZwblhWybOjYaddXUD9qVWh1PyoyWrAp47-PO3RAhGMzIwzw>
    <xmx:_CzSZu5QuV2NiVfUXLKK9ZlakIPhUvkaa-s75ZrfE_-Xqmk4h5rOPg>
    <xmx:_CzSZqjl6-bVjaD28yWX52GUxUlLWYW_zAwOEbYTD0MLczfOjLNgOQ>
    <xmx:_CzSZg5KQxyk8ogxJCTIVww8pLtQMTE02H3umiR5H3hrHenY2Wk2nw>
    <xmx:_CzSZmiyZsjESWRXuvZ0Et_x-jTFaEekvwZCdlaZZ59DuXUulJBSYLjs>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:35:08 -0400 (EDT)
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
Subject: [PATCH v2 6/8] media: rcar-csi2: Move PHTW write helpers
Date: Fri, 30 Aug 2024 22:31:02 +0200
Message-ID: <20240830203104.3479124-7-niklas.soderlund+renesas@ragnatech.se>
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

Prepare for V4M support by moving the PHTW write helpers to the generic
write helpers. This is needed as adding V4M support will involve
interact with the PHTW register from code that are logically grouped
with similar code in such a way that forward declarations of these
helpers would otherwise be needed.

The functions are moved verbatim.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 72 +++++++++++-----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index 0c65c6aa7260..72fcb6ac840b 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -662,6 +662,42 @@ static void rcsi2_write16(struct rcar_csi2 *priv, unsigned int reg, u16 data)
 	iowrite16(data, priv->base + reg);
 }
 
+static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
+{
+	unsigned int timeout;
+
+	rcsi2_write(priv, priv->info->regs->phtw,
+		    PHTW_DWEN | PHTW_TESTDIN_DATA(data) |
+		    PHTW_CWEN | PHTW_TESTDIN_CODE(code));
+
+	/* Wait for DWEN and CWEN to be cleared by hardware. */
+	for (timeout = 0; timeout <= 20; timeout++) {
+		if (!(rcsi2_read(priv, priv->info->regs->phtw) & (PHTW_DWEN | PHTW_CWEN)))
+			return 0;
+
+		usleep_range(1000, 2000);
+	}
+
+	dev_err(priv->dev, "Timeout waiting for PHTW_DWEN and/or PHTW_CWEN\n");
+
+	return -ETIMEDOUT;
+}
+
+static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
+				  const struct phtw_value *values,
+				  unsigned int size)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < size; i++) {
+		ret = rcsi2_phtw_write(priv, values[i].data, values[i].code);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static const struct rcsi2_mbps_info *
 rcsi2_mbps_to_info(struct rcar_csi2 *priv,
 		   const struct rcsi2_mbps_info *infotable, unsigned int mbps)
@@ -1469,42 +1505,6 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
  * NOTE: Magic values are from the datasheet and lack documentation.
  */
 
-static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
-{
-	unsigned int timeout;
-
-	rcsi2_write(priv, priv->info->regs->phtw,
-		    PHTW_DWEN | PHTW_TESTDIN_DATA(data) |
-		    PHTW_CWEN | PHTW_TESTDIN_CODE(code));
-
-	/* Wait for DWEN and CWEN to be cleared by hardware. */
-	for (timeout = 0; timeout <= 20; timeout++) {
-		if (!(rcsi2_read(priv, priv->info->regs->phtw) & (PHTW_DWEN | PHTW_CWEN)))
-			return 0;
-
-		usleep_range(1000, 2000);
-	}
-
-	dev_err(priv->dev, "Timeout waiting for PHTW_DWEN and/or PHTW_CWEN\n");
-
-	return -ETIMEDOUT;
-}
-
-static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
-				  const struct phtw_value *values,
-				  unsigned int size)
-{
-	int ret;
-
-	for (unsigned int i = 0; i < size; i++) {
-		ret = rcsi2_phtw_write(priv, values[i].data, values[i].code);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
 				 const struct rcsi2_mbps_info *values, u8 code)
 {
-- 
2.46.0


