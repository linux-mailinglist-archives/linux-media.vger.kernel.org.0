Return-Path: <linux-media+bounces-28297-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB6A62F2C
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 16:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F51B1899539
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 15:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD58920468A;
	Sat, 15 Mar 2025 15:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="xTj5YylD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="s1KJGXoc"
X-Original-To: linux-media@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844362046BB;
	Sat, 15 Mar 2025 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742052522; cv=none; b=jS3KjZsO1bGAVbZ2Db/yJ8Jjnb2L1QuIGcdLnfpdQacDUgp4OXsggdPHXDehPvxpM0PtOBPGOg2PJ1yVO7RMsZm15+w4/7Hle4zj8i76y96kvB2eeIFaqWQLe7BLwtkIK4KB1iuJjbbIJnpCev4bDhUNe+HEQ1EKdxT17CV4scg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742052522; c=relaxed/simple;
	bh=0YWonZBUO2s/U0Io8eotRlBYhsHluVbqy4nmbCIdA0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tRzsT//0pcQhXnNhlw9c+Wt5ILryn22JcQUdXL84g+SOgZJL03DatqHkzASSsi6fw4FerecrzuZV7CpFtgWwqqb0Vu3gFJgLxSIUw3pBMSldvSFsxeM9+yUwseAcX/QLWygima/K+GCZ5wXEg7E7DUZ259PaNXUhSEMMvNKGu3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=xTj5YylD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=s1KJGXoc; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 404321140152;
	Sat, 15 Mar 2025 11:28:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 15 Mar 2025 11:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742052519;
	 x=1742138919; bh=2YoPP4F0FfNZI72IUUVmrZnsD/Ac//4B80QW0dpFDic=; b=
	xTj5YylDjX8ZmgaIU7+FhDEZ+SYcVGpn3C1Pop5QzQ8FZydxF1gP/7YfnYDqtbIG
	ROOnEnfBsWyW/gCKZXhyhwxJhFlK67QtSkGdrgpyObkfbDlQEiKsBb1a1gTl4y5b
	pbIjAk6xlG5+ws3ChcOqccWfqcP+yRfVYKaDWODSf+HPnL/cOqhWjHj0W8Dku1R3
	WmHwDZrfo8viwzFCalhoXqJ6CDZd00b9tIGJnw/BSjnpHSgtW0VfiH+h/GePk0HW
	t1gshg6aYhmQ7DNsNhgB9vMX0biBxGiAfkRHzdtV7faAsbKAUSFuNu6qeFZcUdSr
	tiULEV/+/7QBCT6KiViywQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742052519; x=
	1742138919; bh=2YoPP4F0FfNZI72IUUVmrZnsD/Ac//4B80QW0dpFDic=; b=s
	1KJGXoc/FOYAawxFVOBbvI0Igh5cYxcUWiaLPFarR7UI8OjaGJ02E+ChSU87Mtuz
	wbrXwglehHOcGSpS45TcdhkLNqzN88hsFl2shJiH6exo6yFNTDQcklhDqP1vAuez
	ASRc4LvuU9R8fv+vryZqzeStHpLaQ5fW4gaI+Ha28nZ2UbWfB6zrTPfZteCrlt58
	Xz7fPLF9hW/w7KkQl0JtH8P8UfdcAVH6vnC1ozaUHa/Hfg5EEMwSzZq9Q0T6rOyv
	aXrE+r3WbrQRu2xwyWimTP8hdtVDojGMD4xhcYxZu/xPbNmZhBxNnQeaioNbtcKI
	IGLBMrb6o0z+fpe1HnGEQ==
X-ME-Sender: <xms:ppzVZ48DuxNzAklm_3sfbCo-wwzvqmnLHffoXRLi1cRZN6_hGUSqeg>
    <xme:ppzVZwsanf187vi_mG3BmFuR-5jUpMfdv8c0Tqw6NvaNq-0Q4UJ6C1TMIbz0KAr7e
    NXGy6K_O683Ah_69B0>
X-ME-Received: <xmr:ppzVZ-BQzqS4ehReoJ_HolLZEgqNVaWqBAlkSIvGhY4Hj1tQ9FIhUi9SGGceNS5sdO5-Aq7WAcEP1MGwAjeu01sfog>
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
X-ME-Proxy: <xmx:p5zVZ4cb5Zt7dHT0196NKDX5FoKyuiAl89fD3zmEuVyjINNYqUusqA>
    <xmx:p5zVZ9PG_-W25lI12tFzT0ljTrpEzXUTE_VkZIgC2eNfUlxLsRMANw>
    <xmx:p5zVZynW839cGAe0u51-C0Z1hEmu1v3SiOoc9qgsO3Tahe_xsrk_Jg>
    <xmx:p5zVZ_uWpPsfxqsEC_4i_Uiwq0QH4ralK3OsGmtY3PmDa2W8HZ1vKQ>
    <xmx:p5zVZztYzPL_Rp31NPegzPlszVBibOfoub_EAH9IbRuFwaJAvblEvyPJ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 15 Mar 2025 11:28:38 -0400 (EDT)
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
Subject: [PATCH 5/7] media: rcar-isp: Move driver to own directory
Date: Sat, 15 Mar 2025 16:27:06 +0100
Message-ID: <20250315152708.328036-6-niklas.soderlund+renesas@ragnatech.se>
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

Before extending the driver with functions from the R-Car ISP core that
will span multiple files move the existing driver to a separate
directory. While at it rename the single source file to allow future
files to be grouped by functions.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
index f3658f16fa24..c2f36486f5f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14679,7 +14679,7 @@ F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
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
2.48.1


