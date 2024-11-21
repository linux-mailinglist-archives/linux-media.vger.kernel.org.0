Return-Path: <linux-media+bounces-21763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 268359D4DEC
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB40D281B95
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7511D90B6;
	Thu, 21 Nov 2024 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="O1Yov6nL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="413pBjeA"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D60D1CF29D;
	Thu, 21 Nov 2024 13:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732196505; cv=none; b=J+t5Mk0BZE4UvsMRWhjmN4DPXqCdZkoAbqOSVhDUwf+NSlYJsevCTNqPQ7u8CpopOW4oQS8jkSAnFd0ANCo7WPSWF/af3xE6RdPJMkWGiSB/oiKqMbZYxXvRAR9flu8G8r0idiMe4cgkMb+1SuWuyI6sa1+M33FcujanWut7Y/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732196505; c=relaxed/simple;
	bh=XqJaTBN/X3u/6gPHqDVAFCt1rrsL3b+ZQ9PAufYDBAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmBoJivbjMmCAv1H69uFeXsjx8kdXz7LBggFSpVZKm3ozP3bxX/iKL56OHYDpybDN9pSOheFLdWzwufjyWIy3r+sOl9c0tcsAVKKK70wKG1lusrj9hqGNtYHi9e8PEcoHltatMQKpLb2597zpW32QuhbdTjuSjm4xs3u3F64g0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=O1Yov6nL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=413pBjeA; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 3160D13801B5;
	Thu, 21 Nov 2024 08:41:42 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 21 Nov 2024 08:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732196502;
	 x=1732282902; bh=H0e6s3PIOoJlzVrOe1t8GJgsKKr1PhiWxTfol8N2kbQ=; b=
	O1Yov6nL4CxdLmizBGHMdLZQWygzBxXMAA+nSQc05DeRHDu6ANwOMMGU71x0V+9g
	A1WW3A6tI819Fb1/gvFOX8anR1NR+qRVFGR+s/oLr4SvilpBvvTrCWYVMV5uCWCx
	whaVtkhOXzslkmMG33qUlajWWwoBSNrl9ts8lK+MX4jHf/CiI0NFpHRRPQ9Pl/6H
	rk+25cglFXBdUCSKKn91m3Yxy0t8oW3rjnUXQ9p6joDcC/BRRG1ZIkF1ywdQ+my2
	/CXoXQZIpX1SK9taXooFL4jYFg4vy/pdvo/MsAmKa6lLpqP63Y5P6ifzXGGiNejz
	kUeUrh2scb4pfoJRLMdVEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732196502; x=
	1732282902; bh=H0e6s3PIOoJlzVrOe1t8GJgsKKr1PhiWxTfol8N2kbQ=; b=4
	13pBjeAOoTVLSiTBFAJHNVA+k97dGOGk+Hp/Ovy+38xfb6rJY5k4ynK9bmFaZrB1
	jBRfOJudVDxPjBUPsqGU4Kp5HhwSL6poZDuJu7ik57sT5TmIELeE5Ou/5D559rJx
	lV+e10Yw53sCJYT4XNp4jmuvAeWCSIdPAdPwX3UP6o0HwNmFnivEbEUhKOG2UhFH
	YE3cmeS6Gw4MkDMjFkjkX7VYH1Zp9Med7jOoaUAWIxd4pgjKQFrSQXzRa4nulPKt
	ixf2MsF+3P9eGhkNykmffEhmnohB7ywAHWUPoV2mnByLBsj132wbE5e7zpRl0q8u
	bYOZ5dp3SZkyAEhz6DUlw==
X-ME-Sender: <xms:lTg_Z6ySDyf4JU53i-VbT3RtoDQP5kmpQ12zbJaa2wOVRFxsgWdOwA>
    <xme:lTg_Z2QX7kWxbShtJzhnfWSCnXmbI_wH2lFyLOPAQoXBdJeaeYwFXrLf_jkYzIyvI
    9Ye9w51WgB1Y6a2hJQ>
X-ME-Received: <xmr:lTg_Z8Ul9O5A4uwgeC-Nqx5ZXsU686LMMN69YVfJ3Ih39gvHGIFwvL5fyGVUvpFkGTp0tm5iGSXlh4SNQRJIlE80TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeigdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfe
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonh
    horhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghs
    rghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrh
    htsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvggu
    ihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvg
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:lTg_Zwh_YgR62Tqseip4eeGWx-CKn-bLinrxXLLOFcTKh2YKcvlFDQ>
    <xmx:lTg_Z8AKtaOiH7gf8jAMMGzAZSCMp3xahCGUUs8ocs6HfrLxHLSxVQ>
    <xmx:lTg_ZxKwpEXW71u0yDEUbFmAshsw7pmE1_W_kZ9NjCIcBsLWUcLslQ>
    <xmx:lTg_ZzC1hPxqZYlaO_rxmiTld3dMontK7hHtNuqvCCcBkjQZMKYxCA>
    <xmx:ljg_Z1Lr7r7Cl3J0PXm3FzREzqQrB0lv2ZPB5UKjQZ4f3G2E3iXqwxdv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 08:41:41 -0500 (EST)
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
Subject: [PATCH v2 1/4] media: dt-bindings: Add property to describe CSI-2 C-PHY line orders
Date: Thu, 21 Nov 2024 14:41:05 +0100
Message-ID: <20241121134108.2029925-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
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
* Changes since v1
- Add missing 'items' node.
- Improve usage of should and must it the property description as
  suggested by Sakari, thanks!
---
 .../bindings/media/video-interfaces.yaml      | 21 +++++++++++++++++++
 include/dt-bindings/media/video-interfaces.h  |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 26e3e7d7c67b..038e85b45bef 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -210,6 +210,27 @@ properties:
       lane-polarities property is omitted, the value must be interpreted as 0
       (normal). This property is valid for serial busses only.
 
+  line-orders:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 8
+    items:
+      enum:
+        - 0 # ABC
+        - 1 # ACB
+        - 2 # BAC
+        - 3 # BCA
+        - 4 # CAB
+        - 5 # CBA
+    description:
+      An array of line orders of the CSI-2 C-PHY data lanes. The order of the
+      lanes are the same as in data-lanes property. Valid values are 0-5 as
+      defined in the MIPI Discovery and Configuration (DisCo) Specification for
+      Imaging. The length of the array must be the same length as the
+      data-lanes property. If the line-orders property is omitted, the value
+      shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
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


