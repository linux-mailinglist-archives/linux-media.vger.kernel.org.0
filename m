Return-Path: <linux-media+bounces-28296-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F90A62F29
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 518821892886
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5332046B5;
	Sat, 15 Mar 2025 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="zCp08NJM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gwwVb58R"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1F720469B;
	Sat, 15 Mar 2025 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052519; cv=none; b=BzUnkSSL6y/Vr82P9BeYqnmxR4AsPSVo08UIMO6xgJL31p7IlMyzdnp/8fz8A1OFS1S/piydTFwpHUTEjeP9dzz8aPuMzzVIXrBw/SoQkqheaqiJZNbKsXITGPk+laqCQH8h6CK/eXX+P8X5W/hB/B0DTcxBoXnDw2LVfRWhJ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052519; c=relaxed/simple;
	bh=n8lZtP4bo6rVfKyHEXsdGsKVHlk6ZB3Mr5lM79WvQyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jj19aDwAWLvWqj6YOxVOZyk0ULGeq6a1mWcZrD9WgbGXRa12o3a276z4iu0CvYDNt+ZvvqPOUSMwMbA9WaajWtC2gBXEE5yZg8gyD93oSruVQRjzBA95fSQNtdsBLzTvSZiqfEw+xh2s6xupdKfEZtHh0cDh92UcNjSWcVQKmnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=zCp08NJM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gwwVb58R; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D95FF2540169;
	Sat, 15 Mar 2025 11:28:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sat, 15 Mar 2025 11:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742052516;
	 x=1742138916; bh=fmzGoMeIVP1/20Mkk5qdpCnXLAguWy+5rNJwiNEVrnk=; b=
	zCp08NJMgEdukW3kklTxnnC3VzKU3ZHAxdepbIeOa47O6Fe9Vw1VkWZGQOtOy/PA
	Com642VKukyphoj2CLvJEzsM/SfJQVBy9OL4UH86uvJUCfm5XnF5DjJFGDUg6v+D
	nvMXLkO4zKK5rPQzLM7jxOdsGRE5ClnZl7ENEkvMdUhdYBnctM9wkFDSWa2aTi2S
	p5pfN3pnWhVESHV3qmbHHOvxOa3zWQHZ94jPKLIJZwqPAVJvpb6tOJ2zusoiSs7T
	UcElH9iaMRQo26r2Vng28ddhx2LW7HSN0hfkmAyER5EO6eNU7K8gXeubw7k/uLeu
	rfqH1PEIr0+Zk1HSG3UwAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742052516; x=
	1742138916; bh=fmzGoMeIVP1/20Mkk5qdpCnXLAguWy+5rNJwiNEVrnk=; b=g
	wwVb58RCJEBH0MplLmtoxx4rKlE+2yatTKhYZYqKfO2YQ1V3sCX0t2q4d1Kj0ARu
	qDDNcLcKLpIoHBjg68M4bTXoRgkjzRNHeWfzRbwk01yj8EJ5+Xx9I9GJHaRsWqgq
	jWRnKZqwCRBIJXTijm/HmDcwNIrW63iPONTVp8Sn9MifpU9nCN4LK8T2ySrZi0Zn
	1sX8vwZLM/EKqxCtOhRhfrgvVqX5NVeDPEW0kXPTaFU+nNZJhsIAPUsQ/EZDL6Po
	Y0lLOScUo34J3B9Wt071e/XQicEyufXNl8x4Oe4gLY3LXKSBpG06EKqKtgcxWK8d
	+vYtmgBRnLPgqYtOnP64Q==
X-ME-Sender: <xms:pJzVZ7q5AYaEoXklMHKJbSUf580Llu3mLCc4BF2xP8cXYC0S698M8g>
    <xme:pJzVZ1pMB2dnoHtDED5uiszhE6iX6SY4eHn-DAeHrLFKerU-q2KIQT8uFuHYyhjIB
    X62S-_zk6JhOL0zJ7o>
X-ME-Received: <xmr:pJzVZ4O2DNM4AZtq_rm0T8fbNjpDObgb-vyegdMdoPba6O3l0Y0kNsNMASM0UrgUB0pEN51GAPnOIzDnIBnHVAzwgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeegtdekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:pJzVZ-7TCmi8_peFUMOB4E9ow8fnpsJhTOVBB7VY-3ybjkAnZ2_SZg>
    <xmx:pJzVZ67UrwZcc0JaZxRc_nASd1k70MJ4UYVUduUUz6ZdxY1OZ5IjSA>
    <xmx:pJzVZ2h-QEfxX1A-dyQcaDt3Nz-n_IXsNdjcbsPnfjTjjc8LKZhqVA>
    <xmx:pJzVZ87ThHLkyM5ro4baAqQcKl-HQ6AQRgNAJ3jkTYJkWWn8NdjyEg>
    <xmx:pJzVZ9JzqXAzSnzkB23s7fvUBF2dlJcgnR5AMr5XhsRBavnYKFBfhH2_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Mar 2025 11:28:35 -0400 (EDT)
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
Subject: [PATCH 4/7] arm64: dts: renesas: r8a779h0: Add ISP core function block
Date: Sat, 15 Mar 2025 16:27:05 +0100
Message-ID: <20250315152708.328036-5-niklas.soderlund+renesas@ragnatech.se>
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

The first ISP instances on V4M have both a channel select and core
function block, describe the core region in addition to the existing cs
region. While at it update the second ISP to match the new bindings and
add the reg-names and interrupt-names property.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 8524a1e7205e..ed1eefa3515d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1968,13 +1968,20 @@ du_out_dsi0: endpoint {
 		isp0: isp@fed00000 {
 			compatible = "renesas,r8a779h0-isp",
 				     "renesas,rcar-gen4-isp";
-			reg = <0 0xfed00000 0 0x10000>;
-			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
-			clocks = <&cpg CPG_MOD 612>;
+			reg = <0 0xfed00000 0 0x10000>, <0 0xfec00000 0 0x100000>;
+			reg-names = "cs", "core";
+			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs", "core";
+			clocks = <&cpg CPG_MOD 612>, <&cpg CPG_MOD 16>;
+			clock-names = "cs", "core";
 			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
-			resets = <&cpg 612>;
+			resets = <&cpg 612>, <&cpg 16>;
+			reset-names = "cs", "core";
 			status = "disabled";
 
+			renesas,vspx = <&vspx0>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
@@ -2053,10 +2060,14 @@ isp1: isp@fed20000 {
 			compatible = "renesas,r8a779h0-isp",
 				     "renesas,rcar-gen4-isp";
 			reg = <0 0xfed20000 0 0x10000>;
-			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
+			reg-names = "cs";
+			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "cs";
 			clocks = <&cpg CPG_MOD 613>;
+			clock-names = "cs";
 			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
 			resets = <&cpg 613>;
+			reset-names = "cs";
 			status = "disabled";
 
 			ports {
-- 
2.48.1


