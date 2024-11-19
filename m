Return-Path: <linux-media+bounces-21603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 900609D3047
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 23:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211AA1F245F2
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 22:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4811D3656;
	Tue, 19 Nov 2024 22:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mGlG9RhR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QSptcJt3"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F81D0F68;
	Tue, 19 Nov 2024 22:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732054428; cv=none; b=Hxur7GvuhHoq1uysmoKwxVsdf/3bQMTCzwvwDBPKQvAvp4NfsuYWEEEZdCsmRsacMg0OOXQuYy6OkyUH8WrG8pJRSpwW8j+7rfUcpGhUr2QMB0ljlztg7LK7LRbIzpYLjJpFDvKv1CoBT2F5j/7GS1fkzTHbt0Ax3HQhlsLbXtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732054428; c=relaxed/simple;
	bh=i6jrJTqyxLxtjqlGX2g6rH3MVyQ/+3l8adVEHFnRl/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=euSraUr3LHLaZ0kg9XgPAyBl0mUwWNz1jBc+zKh5jwWCnZbRAexC9rNH87DlsEEXrfWVSNWAsOZ6T4ugkfNIC6M6SzXdHmzkWPUPXJsAwTLqXH0NTvc2JginBexQ4XUvoKX2TKZQ+zR7ApwHWdO1hLEQSWy+rkRxqeFaoTKfMVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mGlG9RhR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QSptcJt3; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id C35F81380690;
	Tue, 19 Nov 2024 17:13:44 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 19 Nov 2024 17:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732054424;
	 x=1732140824; bh=MPolRtAA9/0qHv2Xt1x6sttScqYFPoMJTIFcFqrBQ74=; b=
	mGlG9RhRJPdHp35ZrTh32wSXW3bBfxdI+iMtTPwq6JNatsDgsP182ZbCLqmucsV9
	q/XUNJZ+mD8ASuXGcUFpCW/S5j7QbwRR1Xp9mi2F27CEt/lW3hCw0xgAWlf/kRic
	1NOpgMmqLR/BIh4I/0fvKAVGkcPCbG7i7Z0FbKXsyTI09KWdlQSmVgme69yr2rBN
	CwukJrpYhxs9KILhYCqkRoCLQ+DihlDrJRtRBmN52odmfSSlRJ53aIcZPqsDJjP/
	yUFXwxXsjb7fLfTscd1+rT9v/jpYZH9r8LJppHFZrstjCyCZVxQHz6K2sXIhoERz
	IY3ly16VbcENJj5Fab8JHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1732054424; x=
	1732140824; bh=MPolRtAA9/0qHv2Xt1x6sttScqYFPoMJTIFcFqrBQ74=; b=Q
	SptcJt36oGsi/bqIa/2S0SfR/NWURtF+j9Jv1OLoIxMvWjFYK2FIqacBo0XH74Um
	9yzxUSXaDrCepbrfUOHvAxL8E94mQIhXhkI7CKwbh5qQJWCQty4SrnfFJSdcwAK7
	I7fUYkwCCG1tJOIhc+5m32RV0zO+rSffOf03r2xqjJgbJfPVlY2UT+Fy0WI8LyaY
	o7K9j03i/iN9BrTeCe0fCEzLk43CibtnQ3z/kG6zZkVTvfddE+cGqULOm9ka9tIT
	w3iZhEI1ADLKFcGgDrLR1Otxi1SEXx2YwA5K06VVWlcS+X3SZBAwPktPwzf3l2zH
	jCzIqaA/07cHhgF6GMQsQ==
X-ME-Sender: <xms:mA09ZwQWXjUMFg5yyi0n1_wcSuraLIuedLykq9T1aZwYs5gbpvzXKw>
    <xme:mA09Z9wTfUzS4Jd14snT58y11AvAaDy6gRP5F2KihZUTxHgT0PLVX6s5TGzO4WveU
    vKpgX78XP7AOXTyse4>
X-ME-Received: <xmr:mA09Z910Sf8Glv1r9HzSUANZSTtHAJd7nsem0a_0nIBzrrAW5M6NrFREIz69DNbaF7I1gTwJ77uE989YnlV_mcPSjQ>
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
X-ME-Proxy: <xmx:mA09Z0C85Fd0SaPC9abN2fXFZBvogM6gNBn-DCjtNDGraNBQavNFtQ>
    <xmx:mA09Z5hryTTlzZzFQ9FobnZkmg5YshkoA-vfBvBxM9LucOnnx2coQA>
    <xmx:mA09Zwr8c_EEQ2_3ubXwlf2xWhUBOYcJBOcYYPw3bJvyaJtRDmeRBQ>
    <xmx:mA09Z8jdqHq4Lvji1-YO6muI8cDxeeXHuX13ctdn-0dEFU-YUYCSAQ>
    <xmx:mA09Z0oliWkd1noihNcvRdGHkWwN6zqATK78kVf-idrX5VEHHO8uJGR7>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Nov 2024 17:13:43 -0500 (EST)
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
Subject: [PATCH 1/4] media: dt-bindings: Add property to describe CSI-2 C-PHY line orders
Date: Tue, 19 Nov 2024 23:12:46 +0100
Message-ID: <20241119221249.539610-2-niklas.soderlund+renesas@ragnatech.se>
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

Each data lane on a CSI-2 C-PHY bus uses three phase encoding and is
constructed from three physical wires. The wires are referred to as A, B
and C and their default order is ABC. However to ease hardware design
the specification allows for the wires to be switched in any order.

Add a vendor neutral property to describe the line order used. The
property name 'line-orders', the possible values it can be assigned and
there names are taken from the MIPI Discovery and Configuration (DisCo)
Specification for Imaging.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../bindings/media/video-interfaces.yaml      | 20 +++++++++++++++++++
 include/dt-bindings/media/video-interfaces.h  |  7 +++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 26e3e7d7c67b..95491e5779ba 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -210,6 +210,26 @@ properties:
       lane-polarities property is omitted, the value must be interpreted as 0
       (normal). This property is valid for serial busses only.
 
+  line-orders:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    enum:
+      - 0 # ABC
+      - 1 # ACB
+      - 2 # BAC
+      - 3 # BCA
+      - 4 # CAB
+      - 5 # CBA
+    description:
+      An array of line orders of the CSI-2 C-PHY data lanes. The order of the
+      lanes are the same as in data-lanes property. Valid values are 0-5 as
+      defined in the MIPI Discovery and Configuration (DisCo) Specification for
+      Imaging. The length of the array should be the same length as the
+      data-lanes property. If the line-orders property is omitted, the value
+      must be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
+      busses only.
+
   strobe:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 0, 1 ]
diff --git a/include/dt-bindings/media/video-interfaces.h b/include/dt-bindings/media/video-interfaces.h
index 68ac4e05e37f..88b9d05d8075 100644
--- a/include/dt-bindings/media/video-interfaces.h
+++ b/include/dt-bindings/media/video-interfaces.h
@@ -13,4 +13,11 @@
 #define MEDIA_BUS_TYPE_PARALLEL			5
 #define MEDIA_BUS_TYPE_BT656			6
 
+#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC	0
+#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ACB	1
+#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BAC	2
+#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA	3
+#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CAB	4
+#define MEDIA_BUS_CSI2_CPHY_LINE_ORDER_CBA	5
+
 #endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACES_H__ */
-- 
2.47.0


