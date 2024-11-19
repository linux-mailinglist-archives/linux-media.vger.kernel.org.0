Return-Path: <linux-media+bounces-21605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9E39D304D
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 23:14:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8EAB1F24496
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 22:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E93D1D47C0;
	Tue, 19 Nov 2024 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="bgz4sxZw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VubrdSYt"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869A01D4177;
	Tue, 19 Nov 2024 22:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732054432; cv=none; b=ZiydxZGGitPjhBNAHR9VmOSV7cJQrIsq0iGlMWnJGtrYjASPnKNOpvAgcJUgagOF6jKAwejCkJz6stJznL590BdplVt+Y4r/4j8fBCmTxBfuOiTQAkdMs8xkmVrXRtHUYQWmpDunnFq7AXldHE8d8MGlr+tznAT9snUtbc0OejY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732054432; c=relaxed/simple;
	bh=+xruQHeqTm8nJXrW1f6upB1nbXfUdCKap49UeYS1rxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WsUxrDp8iLYRQ4YnAranv7PH/bNm5LHSrmjFSwubjQbDjkenfGOludQp1EuY3Q1RAWiUsg3bhoRDPtBVEWEnYPcyfqXcPL2+xaSjDRsRTv7UlN+F1IxCr8yf50teoni5lHAqYJkByHoHbCLHba1i/P0nxqoHoMY5w+Pdpa8M09Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=bgz4sxZw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VubrdSYt; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 99F251140170;
	Tue, 19 Nov 2024 17:13:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 19 Nov 2024 17:13:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732054429;
	 x=1732140829; bh=grcGNsDkKt33qsjmm220Rd9FMIJGuctg8Ed87a935xU=; b=
	bgz4sxZwqWBA7673tCbhf3PL3TDzEUEo0/wQwDy0a7N3/n/AX+pejO3CPONjMYHm
	ZyWk6VHRfjtigQpnMGoGxvzrdaod07EbgJIc6CqDxQ0CUX32J5h2nTRgkCEOZBRb
	hCZWwbd5058TieLpwL/cbfp/qBLVnYVX7w/o1jYTC96LMtjaoTrolU9sRBPsEOt+
	Fg6jns4zG6fYYzZXKJQ+UsDm6pFguK9V1J9+otnMsRLpnEVazwfRJTIO7z4tJydO
	GKnVCuQ3EAoCNZ8jjUj9f9Gwcs3z1Gr5i4ums2w/95ttSwg3EeBX4xzwu61jAlcx
	uxYqAfvbIFDYLtPUBNnwFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1732054429; x=
	1732140829; bh=grcGNsDkKt33qsjmm220Rd9FMIJGuctg8Ed87a935xU=; b=V
	ubrdSYtEPThZqgTOHJyA12zpTA2HZpiZiJ+tAmHyBOFTqINi36Y2VehVlFihFD2y
	0eNZBEH6bwQC8DamvqMzi/nN4MkP/qn32VLEgFcDzuRA+7H/Dum+4lF+49xuOQPC
	xzugVKv3+lfwUUOQ34jLtGnmW6/egzQA4yWetpyJbJMR5sZiQUgtHAkfmSgXfSAk
	56AfeGiX9nTWgm9NtTBb7diloZELXv4rd8W8jwwCdxM/S5JOf3KtZ53t20GIxiNx
	44Gv5SvXqRXhSHfGvnJVBAn4IB0iRf3aClWCyEGqCWFh8uyxx8ri7VuyYQpsnXeA
	F+UCKVxCAPg6n055xh7tg==
X-ME-Sender: <xms:nQ09Z9jwGg2jOkKoDupKHk5LyJ0jsM8VOPTOsQwx03umjiVmJS8-EQ>
    <xme:nQ09ZyC48Gfy-XjflD2Kro_VFF5gmGVIpGOMkbbJkvBRlMkezVWzpK_7hLLquItvs
    6Gv4TxgT8Dg_UZ2-2U>
X-ME-Received: <xmr:nQ09Z9F9y_tzq49zzMe6GR_6s-g18EPUZRqtJUa_uw7LgYQCs3dpYbieNmmceK9_U2axshPqnXtgg5xU4sa2D3lGSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfedvgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgrkhgrrhhirdgr
    ihhluhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhgthhgvhhgrsg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtoh
    hnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrthdorhgvnhgv
    shgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrg
    hrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgv
    ughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrh
    gvvgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nQ09ZyTEPYiWI-r3dW6j27_TjTcp4aC8KnPVkKklwi-ekm39jN7tHg>
    <xmx:nQ09Z6yf-MWsbmMSXnRJTAAcfzfS2n6bDdbqp1_YUMkKZ3zhshPMAg>
    <xmx:nQ09Z44gx4XnGz_VRvsEof1L6IEhOmHRlVmUNqv3rF69wkDuDMYzGg>
    <xmx:nQ09Z_wBjnYjwCeWY2KL3aZm9X6IPKYOSch3bCQvV6VzFI25V3pkRA>
    <xmx:nQ09Z85yvsRYM8PQvv57CH8OUBKbFFMUmPIPa5Bk_bmc2rlFlqivikU2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Nov 2024 17:13:48 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/4] arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders
Date: Tue, 19 Nov 2024 23:12:48 +0100
Message-ID: <20241119221249.539610-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The second CSI-2 C-PHY data-lane have a different line order (BCA) then
the two other data-lanes (ABC) for both connected CSI-2 receivers,
describe this in the device tree.

This have worked in the past as the R-Car CSI-2 driver did not have
documentation for the line order configuration and a magic value was
written to the register for this specific setup. Now the registers
involved are documented and the hardware description as well as the
driver needs to be corrected.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
index 3006b0a64f41..a5d1c1008e7e 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
@@ -21,6 +21,9 @@ csi40_in: endpoint {
 				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
 				clock-lanes = <0>;
 				data-lanes = <1 2 3>;
+				line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
 				remote-endpoint = <&max96712_out0>;
 			};
 		};
@@ -41,6 +44,9 @@ csi41_in: endpoint {
 				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
 				clock-lanes = <0>;
 				data-lanes = <1 2 3>;
+				line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
 				remote-endpoint = <&max96712_out1>;
 			};
 		};
-- 
2.47.0


