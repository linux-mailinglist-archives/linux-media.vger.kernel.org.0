Return-Path: <linux-media+bounces-28298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E4FA62F2B
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:29:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28DB83B91D0
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7D1204697;
	Sat, 15 Mar 2025 15:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="kepfGMTK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="E02GFDFU"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5803204684;
	Sat, 15 Mar 2025 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052524; cv=none; b=MPJSHibEYVNlmix7m0hRJGWtuiJX/B+lLdnm+b/BiOcOffkhH+jNthQOYx26pYSs0VEG7JDnIqhMCq23YW8k4KyPjeaUc2TbeIiUO1mt02H2nCVKlWSeOQ+739ApXDgL7N7xKrbB47otDXekgD2wyx8XqT79SpDzz/VcSD+y60M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052524; c=relaxed/simple;
	bh=8DbvGikmpWnJeIX8gK0zybAMiAWBtmPbUrT/sh6IBFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4a5v0H3rrc6ZN3PRIpPlgqM0qbGHyYX1bLZFTf7uI4BvGYHgqFxtBFFGln/uIJJ0LDke0/TaTrwKZSWfNSwWsIBEoeiOhJOJ/7y7C0swLCa921M3Dh5yJxVC+pGsh7VEAl71pQ+B17/UanDqaiP8C0Fz6D/AWI8tIekC/k5njA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=kepfGMTK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=E02GFDFU; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 9B7B9114015A;
	Sat, 15 Mar 2025 11:28:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sat, 15 Mar 2025 11:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742052521;
	 x=1742138921; bh=L2nTFLGDzUDj3VvOW56bNuqjeRnajnNmhFuGXtbayF4=; b=
	kepfGMTKxzA+L8gZQoAr/DK7c2I1/CejmzX6pCDDdbsqzV5MXIxffZx/Z7a92YPu
	G7E3lA8FGZ/AkQFYgoLc8Ms1Jnt1mWkL8q+U1EWoFfNoQfUW9i08zG0PbkEm3YET
	krcdFTwwoY21/RnWl7HtlvMmsFLYL8w/c5Bm6WXMasGTxFSw3Vn4QzfIrk6IIdnP
	CJmgBq8rAr7j39UzDOzkZbFYjweyunPaxGjhpPSF2lk4LtOY/zaq+VY0XzTI4dOe
	0PE5zryZZra8hiGeeRwukzI0uPz/6wcce7zNLIjbiJJBkORqzau6/Egw36l8v8XW
	a/aSxikfHhT7Y9SQnwLlMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742052521; x=
	1742138921; bh=L2nTFLGDzUDj3VvOW56bNuqjeRnajnNmhFuGXtbayF4=; b=E
	02GFDFU579A+KdgQmdixHah1xW5OAfbRxg4u3YgGbcNsoNIY8NunnPshZ9ZgXMKJ
	JAppCqecE21ZTTnBqpXSc3SQWkaVLbl3bd+BB/oQrxzriYVHb0WHaKSk914su1W7
	RFs4JFMUrPF/U7i2rAphtqNn2qJnWnVUV6lEFp/qfisAdmOfl2196NTmAk2Uhcxd
	dKgO636+OTnf3b84a3ZPFqEa/jzBKir176uE1igijR9rtWmvPtwQ0umMV/6Et6N4
	e8ZIMJztJZCPxCD08A6tibkRq7vbRDooZ6JywL0w8KnJ+qczYh805rUctyJ0MpPi
	p4YLvpWYzNZhO+RvCjpzQ==
X-ME-Sender: <xms:qZzVZ2zp_oyOqxfxhntR_n04vCfxLXKeRLCYMVV17_icbuhSRSq4GQ>
    <xme:qZzVZySHxi2QrzJZ1efRyGaJ4SRlZTlYXAvsbn1mNus_HcPFD5WeHUpBBHOT3__U9
    ZOJ4hI2A-n6ygyUh2o>
X-ME-Received: <xmr:qZzVZ4U6gp9e7MMo8n5ay7clapNTTvA9nDZSuxQZKGRXGIcFBERTMhYrENXd322OzVUQnzxrayPJktq-pKFA-Qbajg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeegtdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhm
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
X-ME-Proxy: <xmx:qZzVZ8jUhXh2M95ePaQMoawzZsqpPDYnXaRI5UGA8A8L_kenqZch5Q>
    <xmx:qZzVZ4ANy2I_e3D99qqJ0_bq7YsiUWRSNZ4zto47-pz8DnRhkaox_A>
    <xmx:qZzVZ9JbfHH4YTW0ks-TYUKF0jiF7JOu-EenPvjiT9cIoIUOu3ULyg>
    <xmx:qZzVZ_BVp0B3JpHUS4G_xfTSOkZgNb8Tqk75AVvKCY40Mc49H5khjQ>
    <xmx:qZzVZwYSmH4U5NZddXtfrSm4ZOM739zPJw5_V-7vz1WzVYXxAo6Z33MG>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Mar 2025 11:28:40 -0400 (EDT)
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
Subject: [PATCH 6/7] media: rcar-isp: Rename base register variable
Date: Sat, 15 Mar 2025 16:27:07 +0100
Message-ID: <20250315152708.328036-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
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
---
 .../media/platform/renesas/rcar-isp/csisp.c   | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index c515278e3be5..a86d2a9a4915 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -111,7 +111,7 @@ enum rcar_isp_pads {
 
 struct rcar_isp {
 	struct device *dev;
-	void __iomem *base;
+	void __iomem *csbase;
 	struct reset_control *rstc;
 
 	enum rcar_isp_input csi_input;
@@ -137,14 +137,14 @@ static inline struct rcar_isp *notifier_to_isp(struct v4l2_async_notifier *n)
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
@@ -193,31 +193,31 @@ static int risp_start(struct rcar_isp *isp)
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
 
 	ret = v4l2_subdev_call(isp->remote, video, s_stream, 1);
 	if (ret)
@@ -231,7 +231,7 @@ static void risp_stop(struct rcar_isp *isp)
 	v4l2_subdev_call(isp->remote, video, s_stream, 0);
 
 	/* Stop ISP. */
-	risp_write(isp, ISPSTART_REG, ISPSTART_STOP);
+	risp_write_cs(isp, ISPSTART_REG, ISPSTART_STOP);
 
 	risp_power_off(isp);
 }
@@ -419,9 +419,9 @@ static const struct media_entity_operations risp_entity_ops = {
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
2.48.1


