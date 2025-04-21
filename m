Return-Path: <linux-media+bounces-30595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C42D0A94FF6
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A10916D139
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537EA263F23;
	Mon, 21 Apr 2025 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="e5vcILZK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dDhHEkGU"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EEF2620C3;
	Mon, 21 Apr 2025 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745233986; cv=none; b=aqFmyvEcWbx3+D1F+bLib1DdwE7l3Ueyf6yFu5f5x2PmfumcCyxB5OiLUBvxiRf2BZnwbpKqBmbAlwRertl7Od8++OAWg8W5WKxegGCilm3ifbteECFE9vnatzPpvMf3jZxcKfOOc3wNsedGlh4ojOxO2fSulqgpo3qsxNO9Bik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745233986; c=relaxed/simple;
	bh=wNwmfHvs9OZFlU2aIRRHW/qdVMAxHYWedt6pq5+YP9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mc5UjwQRkH3mMG7FOSamw4ZmmwQ6TgzdOrXJ0qgamO70EpN0lb7NkWsFBVsBCpAXfOUz3+1LUCGcolra1GH4wBP2cPXn51coZZapnA3C7vZ6u7Jr1RkoduZP33bjXG5zqqWLAsJxLYYmihiBCPHeTLG6YNZWzncuIaUiyCJoh4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=e5vcILZK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dDhHEkGU; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7C9BF11400F8;
	Mon, 21 Apr 2025 07:13:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 21 Apr 2025 07:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1745233983;
	 x=1745320383; bh=e2N10SpjjxQUmDjh0pXsjgbUjex2lW+M6pL1sAUdB/4=; b=
	e5vcILZKDZ3sLXoaPOCz0dzfZye3hJdl1V1habzzoZpWJKRHsc72+cXcjpxfFGxA
	n3dxWyYdIJ7tO04VcntgcHBis4MomyB+iiYcj4PdbV6Lfn/bul4e4SPJjQInViBP
	oatluspvOmXnucAvb3NXiQWtzX0fP9NuA1MWT2cRiLKN3DjlSnOpzppmgCElpV6o
	KPZ1dh5RbfmK0dBTtB+/X6c0teL7AoC+bx3aVR9RE8n+sOMG6sL7+Ek+WKP/FFmB
	pM6OdVfLYL/P9suSmXUPL4XfNjPQ+/4oOXt7quNVbeKzbfeF3VWffLohWG0CmDuI
	cYsvmoBB0Q1JB8QEftnCsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745233983; x=
	1745320383; bh=e2N10SpjjxQUmDjh0pXsjgbUjex2lW+M6pL1sAUdB/4=; b=d
	DhHEkGU+k3kBwk2+X9jiuX1hY55n1A2OYbkyWst6mVc+V0Zx6FYIKsuFWnplofVr
	WuIJ4bkBXjHUVjNH1CuFNvLjb7zQncyJJxHoCZbIjv3qyjia792M3iCy1O6c+arl
	NxizInMJpTKqCCStkxfwLmBioY1BBXKNKVn6C/ZCWF/ykeAvzILpf5LhOzBVzd5R
	4id6K5E2VrYvIaZPxP6O2EIMfsxAYywM9ORq733Kk20acHGnDhoFRWyIT+5j/yK/
	3I8NpKFna/F8N4QV/JKmaW8mR3vxVo8WzIoMxwPb0tu/MB79QrmdTijTRjcQkaYb
	Zx+A8xAvOiexnqks0WYXQ==
X-ME-Sender: <xms:PygGaHr-IBBAN4I9oswiBtNU3HEXbbWSKW0SC_k-VGx2eReAkXILcw>
    <xme:PygGaBoSHC-aEjp-pclvIPagA-5dtykkCb6FIk_XwbvxI5PsNHVqtyTftwFb7OI8r
    8pc_WCHO7yvIUhoRd0>
X-ME-Received: <xmr:PygGaENpj3oSHcNM0KD9fbnrYhfgIRqbTjUxESrAcdIaGxomjX1xldZw93_fN5GD1apR4QLI6Gcu1d682Z7j3Elzfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrsh
    houggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffr
    rghtthgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffgge
    ffleefgeenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhm
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
X-ME-Proxy: <xmx:PygGaK5vSXD4Unbo3Rmc7VFmIkSfBoU67PsCbE73R9xomFPHlTEGDQ>
    <xmx:PygGaG6lRt6u0sVZUl4jk9dlBWl73rYBgbDWBivPLd8vYukaEkMFfA>
    <xmx:PygGaCjgA4NVxgvTCdq3-s_CJEetmjfq2OZX34S-sffhDFtabGkbBw>
    <xmx:PygGaI7yhwsPb9YijiFkZQApIKTsp18sDmjeovNiNaCgzsnWokh1dw>
    <xmx:PygGaFhu6iUipu16qNH18Sn-0TQmTmOvF1gcJKdHl3OxC4sbSgJPUTfu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Apr 2025 07:13:02 -0400 (EDT)
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
Subject: [PATCH v2 5/7] media: rcar-isp: Move driver to own directory
Date: Mon, 21 Apr 2025 13:12:38 +0200
Message-ID: <20250421111240.789510-6-niklas.soderlund+renesas@ragnatech.se>
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

Before extending the driver with functions from the R-Car ISP core that
will span multiple files move the existing driver to a separate
directory. While at it rename the single source file to allow future
files to be grouped by functions.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 MAINTAINERS                                    |  2 +-
 drivers/media/platform/renesas/Kconfig         | 18 +-----------------
 drivers/media/platform/renesas/Makefile        |  2 +-
 .../media/platform/renesas/rcar-isp/Kconfig    | 17 +++++++++++++++++
 .../media/platform/renesas/rcar-isp/Makefile   |  4 ++++
 .../renesas/{rcar-isp.c => rcar-isp/csisp.c}   |  0
 6 files changed, 24 insertions(+), 19 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Kconfig
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Makefile
 rename drivers/media/platform/renesas/{rcar-isp.c => rcar-isp/csisp.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 465569a7b264..4904d0896773 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14917,7 +14917,7 @@ F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
 F:	Documentation/devicetree/bindings/media/renesas,isp.yaml
 F:	Documentation/devicetree/bindings/media/renesas,vin.yaml
 F:	drivers/media/platform/renesas/rcar-csi2.c
-F:	drivers/media/platform/renesas/rcar-isp.c
+F:	drivers/media/platform/renesas/rcar-isp/
 F:	drivers/media/platform/renesas/rcar-vin/
 
 MEDIA DRIVERS FOR RENESAS - VSP1
diff --git a/drivers/media/platform/renesas/Kconfig b/drivers/media/platform/renesas/Kconfig
index c7fc718a30a5..27a54fa79083 100644
--- a/drivers/media/platform/renesas/Kconfig
+++ b/drivers/media/platform/renesas/Kconfig
@@ -30,23 +30,6 @@ config VIDEO_RCAR_CSI2
 	  To compile this driver as a module, choose M here: the
 	  module will be called rcar-csi2.
 
-config VIDEO_RCAR_ISP
-	tristate "R-Car Image Signal Processor (ISP)"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && OF
-	depends on ARCH_RENESAS || COMPILE_TEST
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select RESET_CONTROLLER
-	select V4L2_FWNODE
-	help
-	  Support for Renesas R-Car Image Signal Processor (ISP).
-	  Enable this to support the Renesas R-Car Image Signal
-	  Processor (ISP).
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called rcar-isp.
-
 config VIDEO_SH_VOU
 	tristate "SuperH VOU video output driver"
 	depends on V4L_PLATFORM_DRIVERS
@@ -56,6 +39,7 @@ config VIDEO_SH_VOU
 	help
 	  Support for the Video Output Unit (VOU) on SuperH SoCs.
 
+source "drivers/media/platform/renesas/rcar-isp/Kconfig"
 source "drivers/media/platform/renesas/rcar-vin/Kconfig"
 source "drivers/media/platform/renesas/rzg2l-cru/Kconfig"
 
diff --git a/drivers/media/platform/renesas/Makefile b/drivers/media/platform/renesas/Makefile
index 50774a20330c..1127259c09d6 100644
--- a/drivers/media/platform/renesas/Makefile
+++ b/drivers/media/platform/renesas/Makefile
@@ -3,13 +3,13 @@
 # Makefile for the Renesas capture/playback device drivers.
 #
 
+obj-y += rcar-isp/
 obj-y += rcar-vin/
 obj-y += rzg2l-cru/
 obj-y += vsp1/
 
 obj-$(CONFIG_VIDEO_RCAR_CSI2) += rcar-csi2.o
 obj-$(CONFIG_VIDEO_RCAR_DRIF) += rcar_drif.o
-obj-$(CONFIG_VIDEO_RCAR_ISP) += rcar-isp.o
 obj-$(CONFIG_VIDEO_RENESAS_CEU) += renesas-ceu.o
 obj-$(CONFIG_VIDEO_RENESAS_FCP) += rcar-fcp.o
 obj-$(CONFIG_VIDEO_RENESAS_FDP1) += rcar_fdp1.o
diff --git a/drivers/media/platform/renesas/rcar-isp/Kconfig b/drivers/media/platform/renesas/rcar-isp/Kconfig
new file mode 100644
index 000000000000..59e0d91862d1
--- /dev/null
+++ b/drivers/media/platform/renesas/rcar-isp/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+config VIDEO_RCAR_ISP
+	tristate "R-Car Image Signal Processor (ISP)"
+	depends on V4L_PLATFORM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select MEDIA_CONTROLLER
+	select VIDEO_V4L2_SUBDEV_API
+	select RESET_CONTROLLER
+	select V4L2_FWNODE
+	help
+	  Support for Renesas R-Car Image Signal Processor (ISP).
+	  Enable this to support the Renesas R-Car Image Signal
+	  Processor (ISP).
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called rcar-isp.
diff --git a/drivers/media/platform/renesas/rcar-isp/Makefile b/drivers/media/platform/renesas/rcar-isp/Makefile
new file mode 100644
index 000000000000..b542118c831e
--- /dev/null
+++ b/drivers/media/platform/renesas/rcar-isp/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+rcar-isp-objs = csisp.o
+
+obj-$(CONFIG_VIDEO_RCAR_ISP) += rcar-isp.o
diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
similarity index 100%
rename from drivers/media/platform/renesas/rcar-isp.c
rename to drivers/media/platform/renesas/rcar-isp/csisp.c
-- 
2.49.0


