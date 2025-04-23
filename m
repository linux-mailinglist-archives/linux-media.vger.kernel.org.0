Return-Path: <linux-media+bounces-30845-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C15E0A99542
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFA8646477C
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899DF28466F;
	Wed, 23 Apr 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="VHKc/lvk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lQ7Ch7qr"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE8280CD9;
	Wed, 23 Apr 2025 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426024; cv=none; b=Ou0mRFjtnOhIuz7//yU7D3Apkltp17GDN9b0VDxHqLueBRhV5cCL/DhYZeh18rffDzyglyoqXQeGLn7xsFPbKATFZMMjYNRgo4pHQ0HAVMNOLZ3XogkNtUoxSY8lS8xr1RAm6FPtJzdwE7o/qaweEqp/mNOVTZv5tbNov42xmsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426024; c=relaxed/simple;
	bh=Hj4BwdqP4t+ke7R6h7xSOD9lqKoQX7W3bj3iiMTNEpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxvLPhcnktrjMWr4Vv3B51wJCt8X3tyPq8QmgOH1AO2lGKVJYGCaV8AtHQAKkjCUMDkR4X3XD+zZGkBE22zJu3dobz66zj56AyxUYX9+o4J6SDbW9qqMCD0GjXMKq2V09TdHF7KeBFLPX3NXacZUPmHEK1dZDR3V6sAbYKgYByo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=VHKc/lvk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lQ7Ch7qr; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B996F1140205;
	Wed, 23 Apr 2025 12:33:41 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 23 Apr 2025 12:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745426021;
	 x=1745512421; bh=wXbqCDJk+FpS8BBq3f9gNeZ/AVZhnjUw5ofvRmTK8yI=; b=
	VHKc/lvkuZoVk/jikLGGFgR/Xp0cTqcWFJWNoacB7CxEEbYxUxmTbq6Uq6hlRZBQ
	7VimiLEYh3CSjTe58gFM1KC/98w3YlCl045bQ1/lyhKZRI44w4RWoEkUuzGYo1MF
	Av4JgkyjNcaCTZ+swGwSqhrs5gSrfBzBdbKkvjIxuEEwtNLdWy13LL9xc5QHaIYe
	8BqXC8FRLp97rQQibB6iU63K+gw5nsJh+6SIZQDTBgo5ZTmrwTFbDE/VtTdwRGML
	QuGzNKR20WRm3bO3IWc9yECTyIwFTtrtbkq/qoCb/H17mhjXDbRMrKDZAgxQ1WHF
	uhmHNjw3PWUrRmZwITu/0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745426021; x=
	1745512421; bh=wXbqCDJk+FpS8BBq3f9gNeZ/AVZhnjUw5ofvRmTK8yI=; b=l
	Q7Ch7qrvcwB3+d77delw4gE+Ow7AVCe06QewrEWW0h99XDxJ9crud0MpmWBZsHN5
	gsgxqVUpyKlSHvt0KPmcj/I+Bvd3L4vvgz+9j83pyWTf+Uu8SoK06nb6v2VAVBP2
	NSTClZOZYerPUZuVUvrAsBHTStiLOzsXmI4Ro8thEymHeiQTP4cCKuZollHJoyju
	Q0YJAAY5tmzGt2uNw0ssuMWvdvVSuttwk7U1RUXHaQrM0bnDATGQo0hccZoi8JfN
	PuYkUXp7V/FRAjs/jPOvINeruA98vW/sq3J6//sDR9tWI3wInUO1V4rWQTfQdScY
	I9dXR1aNVvMNthr5Cm9VQ==
X-ME-Sender: <xms:ZRYJaHm9fkbpU1yc2V50VhjT7q3FvSaOXO7MI8wJq1dRyDMZ6AqO8g>
    <xme:ZRYJaK1-s8MHiBp0NzZakd6TEbjMcr3km8UZAox7n0eiLakqcN2Jyfj-zTBZ1Exzq
    owCZBTRhyjRsnCqDE0>
X-ME-Received: <xmr:ZRYJaNq1GFyshr8eAN-rw-4OKQnNzh8dSiSZkzaqrTDiFX1HEOJIHHLz3BO33sZPoLIVaYX1xBb-aCC1kIjaUYg2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejtdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprh
    gtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgthhgvhhgr
    sgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegt
    ohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnh
    gvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehhvhgvrhhkuhhilhesgihsgegr
    lhhlrdhnlhdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnth
    gvlhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggr
    shhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrtghophhordhmohhnughisehiug
    gvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:ZRYJaPm1wl9R3F9ATubPa_BB5Hj75pso1qYmFsrkoPUoDEPGT3S9CA>
    <xmx:ZRYJaF31NKH0LE_688_oRB0fI8nsHLGiSguOjzSB2GJF-ZG5bMuGOA>
    <xmx:ZRYJaOuioJCk3gkI761vZ1maR9CL-9ezId5cImRSTkQMGZudjhoynw>
    <xmx:ZRYJaJURBlTDQxKBods8ks2fNR6HBJ-ndIPz-dl8rn6rnmk-CD9eRw>
    <xmx:ZRYJaBZxp7Twjagl8A_8tSR9cIyoiLF-RpOK4cGXuJPeJERjjRb6WgAp>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:33:40 -0400 (EDT)
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
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 6/7] media: rcar-isp: Rename base register variable
Date: Wed, 23 Apr 2025 18:31:12 +0200
Message-ID: <20250423163113.2961049-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Prepare for extending the driver to in addition to supporting the
channel selector (CS) also support the core ISP. The two different
functions have different base addresses so the driver needs to
distinguish between them.

Prepare for this by marking existing base address variable and
read/write functions to make it clear they operate on the CS portion of
the driver. There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v2
- Fix spelling in commit message.
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


