Return-Path: <linux-media+bounces-30596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6025A94FF9
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77BD7188E017
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB77263F31;
	Mon, 21 Apr 2025 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iqpGndxk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FDMP1D4Z"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5F2627E7;
	Mon, 21 Apr 2025 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233988; cv=none; b=vDlonmgfFpuGlCOV7yHqyq1257IAM/LKdAnXq+v/opVsYO+sTY9FC0BKvVrlDAWH9bXihcIbcCCjMQIXV9L6ntLBXhmGErOjXkohDNOXt/H/C0Ya/fY/jsOrTu3DDaBkUOrJob6GMnaX1mvu+72xg9qut+D5HUKwsA33FqdCXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233988; c=relaxed/simple;
	bh=POijSVfPS4I9C2ZqiXWZ/cwkQzX7hLXPQAKqf8T7Hm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nnxMUm78t6/vx5g9VQ1NDS0d2D/4Npz6NX2uyL7Cyu9H4xNoDcF+Wt1TYCzm33zhfBYUbdORP1MHD0oiAUZE3jeO+mdDc/L1/wtqAy0YGu+F4O/sOTMxM/qDId+RCKCYb3eYJA1LwMrM40Ux844iI5lUJN1U1jsEqlpkmE6bu2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iqpGndxk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FDMP1D4Z; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8F62213801E6;
	Mon, 21 Apr 2025 07:13:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 21 Apr 2025 07:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745233985;
	 x=1745320385; bh=pg726CHGYvg5Za0W/NWkRuK4dJp76WAXtjPQW1Qc9QA=; b=
	iqpGndxkNwPFeO2r/AQnuCDROEm3+MyaUHtkniBfiTVuUOdTzEA3NhvOR3uPGYg2
	4XrKIf/EevgetzBEA373M5X6+QsmN3H3p5bq7/bYIEuGUxNkPJnO1k/1q1O4x4DU
	ekDpPWXC2VHvoKsvFMZeHn75ainZiSMURLvnKFGRo6s6V31KJhADu9RhoqzGXE4X
	RoQmrxkwuq8VZoAjzakfHwQ4QremjXeYDjLl96UShCoNcBJYlzEDQZHyPVA58R1M
	7Gtd1agUJmnepb9PnfsgE8V86MyX5qFRjyKrGbY5XbgG9I1Di1l+5GC0K0uTW5Ki
	pGG2hZtjRAyBSPRnkt8Q1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745233985; x=
	1745320385; bh=pg726CHGYvg5Za0W/NWkRuK4dJp76WAXtjPQW1Qc9QA=; b=F
	DMP1D4ZnLuJqfw+XqIH3tBZJwR7UC+s5cGQLlPaFirIQh3UmetOjla24Zdy4b7Pb
	LfW1f1j0zk7UkXgvVlSZXLHZpBvrqnEKzdl6kPK/VXw9TCCeoSuBHw1dPkHDL61I
	vpdmXvtuw2gzJu5lPEnDw+vgVhYrhpdezYcMO455klU3aBE9sof/xL5LfnmhN2tR
	0xe9Qwsb23p045obbYm5wH8Sb5CuSQ3ERntbXYqFfSmbL7i8+ceCCB+SLtyaEzxi
	rfiOb8/KKMIGfzrhNzCcAQHFECFTfrK4D325SfOi3VerNisEYYSUB5C1iSFQxg+k
	TDdifPoL/GHrUyh6A0gcg==
X-ME-Sender: <xms:QSgGaChy2uxOTRXdiTy7_3U31uaqFxV8Rg7773fmjKiiGaWEG8iPtA>
    <xme:QSgGaDCnaFDzjvHIYf7E79UfV45-O2Iwx7h5Mqr6oMDGNqQ-tFt_WYA8aDp0pZaW5
    B2Yde29iZ9X5whkDBA>
X-ME-Received: <xmr:QSgGaKGnZPqgCaae6Z9S0MFFkpXu-L3t-xkT--gwpWxbD3OFap1tdLUpqQkAlDVaV6vGl66_YdBi_ufoY_o43KhLTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegr
    lhhlrdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiug
    gvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:QSgGaLRxxXY9h1ytly-JyDw_Jd8deMxwHJ6x7Fr57mFxFcJzFz2LMQ>
    <xmx:QSgGaPzlbByPUhGTcB3VozNEzAG2IEVmAy6400fr_SSQ6MFFbEa56A>
    <xmx:QSgGaJ7wNP4Wk8kBPesSnMIK7cUsUjH4swYrrpfH_RDvE2hkwNhQJQ>
    <xmx:QSgGaMz4_RTxxtdzEnXUIYgCafNLsdwcubN1ju0SzwOe5TLRg6Z6tA>
    <xmx:QSgGaP7cunC_mYVVtzIju-pOQzNuLwi6u1O8aWoPlzqRy7i-FajfUKFR>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 07:13:04 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 6/7] media: rcar-isp: Rename base register variable
Date: Mon, 21 Apr 2025 13:12:39 +0200
Message-ID: <20250421111240.789510-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for extending the driver to in addition to support the channel
selector (CS) also support the core ISP. The two different functions
have different base addresses so the driver needs to distinguish between
them.

Prepare for this by marking existing base address variable and
read/write functions to make it clear it operates on the CS portion of
the driver. There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../media/platform/renesas/rcar-isp/csisp.c   | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 4bc89d4757fa..f36d43c2e0a2 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -159,7 +159,7 @@ enum rcar_isp_pads {
 
 struct rcar_isp {
 	struct device *dev;
-	void __iomem *base;
+	void __iomem *csbase;
 	struct reset_control *rstc;
 
 	enum rcar_isp_input csi_input;
@@ -184,14 +184,14 @@ static inline struct rcar_isp *notifier_to_isp(struct v4l2_async_notifier *n)
 	return container_of(n, struct rcar_isp, notifier);
 }
 
-static void risp_write(struct rcar_isp *isp, u32 offset, u32 value)
+static void risp_write_cs(struct rcar_isp *isp, u32 offset, u32 value)
 {
-	iowrite32(value, isp->base + offset);
+	iowrite32(value, isp->csbase + offset);
 }
 
-static u32 risp_read(struct rcar_isp *isp, u32 offset)
+static u32 risp_read_cs(struct rcar_isp *isp, u32 offset)
 {
-	return ioread32(isp->base + offset);
+	return ioread32(isp->csbase + offset);
 }
 
 static int risp_power_on(struct rcar_isp *isp)
@@ -245,31 +245,31 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
 	if (isp->csi_input == RISP_CSI_INPUT1)
 		sel_csi = ISPINPUTSEL0_SEL_CSI0;
 
-	risp_write(isp, ISPINPUTSEL0_REG,
-		   risp_read(isp, ISPINPUTSEL0_REG) | sel_csi);
+	risp_write_cs(isp, ISPINPUTSEL0_REG,
+		      risp_read_cs(isp, ISPINPUTSEL0_REG) | sel_csi);
 
 	/* Configure Channel Selector. */
 	for (vc = 0; vc < 4; vc++) {
 		u8 ch = vc + 4;
 		u8 dt = format->datatype;
 
-		risp_write(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
-		risp_write(isp, ISPCS_DT_CODE03_CH_REG(ch),
-			   ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
-			   ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
-			   ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
-			   ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
+		risp_write_cs(isp, ISPCS_FILTER_ID_CH_REG(ch), BIT(vc));
+		risp_write_cs(isp, ISPCS_DT_CODE03_CH_REG(ch),
+			      ISPCS_DT_CODE03_EN3 | ISPCS_DT_CODE03_DT3(dt) |
+			      ISPCS_DT_CODE03_EN2 | ISPCS_DT_CODE03_DT2(dt) |
+			      ISPCS_DT_CODE03_EN1 | ISPCS_DT_CODE03_DT1(dt) |
+			      ISPCS_DT_CODE03_EN0 | ISPCS_DT_CODE03_DT0(dt));
 	}
 
 	/* Setup processing method. */
-	risp_write(isp, ISPPROCMODE_DT_REG(format->datatype),
-		   ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
-		   ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
+	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
+		      ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
+		      ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
+		      ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
+		      ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
 
 	/* Start ISP. */
-	risp_write(isp, ISPSTART_REG, ISPSTART_START);
+	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);
 
 	ret = v4l2_subdev_enable_streams(isp->remote, isp->remote_pad,
 					 BIT_ULL(0));
@@ -284,7 +284,7 @@ static void risp_stop(struct rcar_isp *isp)
 	v4l2_subdev_disable_streams(isp->remote, isp->remote_pad, BIT_ULL(0));
 
 	/* Stop ISP. */
-	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
+	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
 
 	risp_power_off(isp);
 }
@@ -465,9 +465,9 @@ static const struct media_entity_operations risp_entity_ops = {
 static int risp_probe_resources(struct rcar_isp *isp,
 				struct platform_device *pdev)
 {
-	isp->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
-	if (IS_ERR(isp->base))
-		return PTR_ERR(isp->base);
+	isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(isp->csbase))
+		return PTR_ERR(isp->csbase);
 
 	isp->rstc = devm_reset_control_get(&pdev->dev, NULL);
 
-- 
2.49.0


