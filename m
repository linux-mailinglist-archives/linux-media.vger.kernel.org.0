Return-Path: <linux-media+bounces-17242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15968966AA2
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 22:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ADE31C22337
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 20:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F9D1BE259;
	Fri, 30 Aug 2024 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="rXh5WBt9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mXYDpHop"
X-Original-To: linux-media@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC81C0DC5;
	Fri, 30 Aug 2024 20:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725050103; cv=none; b=UyGsgUcTtM+7oOvYDre2YfdT79r96sA/tx7XJ5pI1omIaL1hVsV34DOHc5R0j9rh10lJVAmP9g/l7gaizkTkab7/i7JkkTE6Fhwppwdyb5Zd4cLW2V9EQJWoKJLGFPIIVBfNPWmCHOsYWVQ6u4M10A7yr3rTV3MycRIehL71BhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725050103; c=relaxed/simple;
	bh=Z5GIt5f7DPb9bQmjJjU/GaAtvD913pig2jxGXRbpouw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h8ZVRr9LTB3hACYVA4CGcnj+WR5XYMWxmwqBUFV8zyFJIpKydqPczWcWdsjnAxbqBgMGJCF97W4G91qgGI21TTACXr0UM/R1a3EIBdshAQixPNvq7kPqu/yBngy8YJ7nYJ5ACjYfmURHtpKfnnwPF1KYyXoaQNxQPbnZRZKLbHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=rXh5WBt9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mXYDpHop; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id A64501380132;
	Fri, 30 Aug 2024 16:35:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 30 Aug 2024 16:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725050100;
	 x=1725136500; bh=QutUibBOlYFAkhIbQp9z+y9Dh4f7NN8pOiY+Tkgf0i8=; b=
	rXh5WBt9ibvyXwYAZ0Wywn5ywzb/A32K8n98W+cEofRwPC+mP4VA+CNoY5kc3qQL
	U/9axckz7N2LUj+q4/Eddapxz8ta9+2vF+zYBybz8ZhrZKq++3hsIKhAz7qhJJxD
	9Knp62qe5vv0FMuWo13m8mRIu+OcAXHxHL8hQ4X42QWp8TCA8+1prUGF1xE5GIyf
	2dPfX66mQOMLEd7wljKACdBC4C4VpQuIA4nG8YS7RNTxDHlJpIrWWR6VOeiw0p6X
	GtRQirrX2aqAzC8FROGYW6zDlKfpn5IPS4lzyRfxohC4Py2jgEtvaM5HYvlyk6xr
	5sAARfX6BtS9/wm/8S8jmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725050100; x=
	1725136500; bh=QutUibBOlYFAkhIbQp9z+y9Dh4f7NN8pOiY+Tkgf0i8=; b=m
	XYDpHoptVdV/H701bYgZAWqCQe0h/myFtymlvXGNQ3LkEgKm+7NlXSNji0oQ7ljR
	w52oby9Q0jWZvw63qrxtJOowu0ohWK/R5asOzcaKW/O7vnExhSZl/iQY7+JUJzi+
	CqX4838Rtlm9JZjdXVqY14u6cAhz/Ea+v8btlGxGGKny568Ge0ZQgeWHu4f+BEV9
	FV5/fL7H2lJmPNHLZxGnXlniRRaaAUFLy5r9oTk5Jck2kMZ8Yk50F7H0xi3Xc8CS
	ERSvfFzvVnIQwAMV4EVU0hLKSW9uDWsPK5omMdfylcJyJ8A3Kgs8USplS+Frq21j
	Vx5L6WaCtchelyvEJpqRQ==
X-ME-Sender: <xms:9CzSZvGKCJFN3CMRRX4OA9Sg28_mr1rWAIFpV0wjaPBELQBbtMTW2A>
    <xme:9CzSZsXKmcm-dMx29GHjuGRaQiB4H38UxZbSPr40SSJXBpvBhU_GOoklx1g92zAMm
    s5dleTdVDIleGzDpkM>
X-ME-Received: <xmr:9CzSZhKspL11HsS9Us34SaNrsTvTFEUge4aV74LkS7IODTGZ_KJxFztMQo2OjZTuZQ1WzDShT1zGiPCNaRvAMswGGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefiedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
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
X-ME-Proxy: <xmx:9CzSZtHbMDMWBejJ56gPu00cFJStUjBbKz6CfKrgCySbiYPmeyNT3Q>
    <xmx:9CzSZlUiO9AuGrYA0wBnf_Erw6Ibiuj78nHehDFRevS_Bt3mvY9w5Q>
    <xmx:9CzSZoOYSKfGZn_GmZBois8wMlHjbXcDvb1pPZsPdDDApUGWUsoT6A>
    <xmx:9CzSZk0zUBimtj_TD2hyNH_uLnqzWXj0JxbXLLk8WOMVo-QibcxGuA>
    <xmx:9CzSZgPSkYQWj3RxhOYnTB2n7xKXl5qB8VBR6mCBepfKTohGQTPK764g>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Aug 2024 16:35:00 -0400 (EDT)
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
Subject: [PATCH v2 2/8] media: rcar-csi2: Correct field size for PHTW writes
Date: Fri, 30 Aug 2024 22:30:58 +0200
Message-ID: <20240830203104.3479124-3-niklas.soderlund+renesas@ragnatech.se>
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

The data and code written thru the Test Interface Write Register (PHTW)
register are 8-bit wide, change the datatype used to reflect this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-csi2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
index c419ddb4c5a2..932826ee0961 100644
--- a/drivers/media/platform/renesas/rcar-csi2.c
+++ b/drivers/media/platform/renesas/rcar-csi2.c
@@ -238,13 +238,13 @@ static const struct rcsi2_cphy_setting cphy_setting_table_r8a779g0[] = {
 };
 
 struct phtw_value {
-	u16 data;
-	u16 code;
+	u8 data;
+	u8 code;
 };
 
 struct rcsi2_mbps_reg {
 	u16 mbps;
-	u16 reg;
+	u8 reg;
 };
 
 static const struct rcsi2_mbps_reg phtw_mbps_v3u[] = {
@@ -1451,7 +1451,7 @@ static int rcsi2_parse_dt(struct rcar_csi2 *priv)
  * NOTE: Magic values are from the datasheet and lack documentation.
  */
 
-static int rcsi2_phtw_write(struct rcar_csi2 *priv, u16 data, u16 code)
+static int rcsi2_phtw_write(struct rcar_csi2 *priv, u8 data, u8 code)
 {
 	unsigned int timeout;
 
@@ -1488,7 +1488,7 @@ static int rcsi2_phtw_write_array(struct rcar_csi2 *priv,
 }
 
 static int rcsi2_phtw_write_mbps(struct rcar_csi2 *priv, unsigned int mbps,
-				 const struct rcsi2_mbps_reg *values, u16 code)
+				 const struct rcsi2_mbps_reg *values, u8 code)
 {
 	const struct rcsi2_mbps_reg *value;
 	const struct rcsi2_mbps_reg *prev_value = NULL;
-- 
2.46.0


