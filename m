Return-Path: <linux-media+bounces-30844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33296A9956E
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 18:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 193105A7917
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 16:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24586285405;
	Wed, 23 Apr 2025 16:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cFLxqLBp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LuhIsKvm"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD7A2820C2;
	Wed, 23 Apr 2025 16:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426023; cv=none; b=Agrqu4IVzBXl6LhTwID0MKUqTLB79tfr/dsGB9gAJNCg9YRrY3nRMsKJOEiuhtcKI8RjPvFtA75EjwjTzwvIFmHSZHsdI8qIrk+D2ioRsW4lireZYP/FtK/gMDNd6N3hx/bPujUuBbhdmh2L8+19WHDbeMlKSRzr4DbezVL65iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426023; c=relaxed/simple;
	bh=GGs9JbwLq5kmsaHHvLE2ayQn+ofqui9Nw0wabI27W0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G96z/oGK9Wk2gMBED1kjtWTBmXi5wbDcPVZyWyqYCBtTRoN/K45QPaMcxHI7nRnZEKGq7T0rDNcnNDcM35mNXSzmoNKySqr/1ZXqdu1PNWKfRGI7z6MDQHJAkBkiDZ3kj++V8zUEOSxtFeVxfR72c4jsVVP7IXBKnXGNuW29C5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cFLxqLBp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LuhIsKvm; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 979F8114021F;
	Wed, 23 Apr 2025 12:33:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 23 Apr 2025 12:33:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745426019;
	 x=1745512419; bh=rAqmvqXfJ7Xk1g7GEd9oXDZzoE0rHmrW1vd4nd1KGtg=; b=
	cFLxqLBpUGJT3owivYuildKSoo2AXL9iKaSZuQ/wDoRCX7i5m0EjVfSgs64dacf1
	k60uxU6OtYHXOGpnGL8b/nT+rRHi1koeyGnSqYZ9yYn2O+wJj6OYW7KK0mMAmnxJ
	GPt9YaH4TuqyrSLUU+snAdTvuWmossfciRsOEvo6RGoC9EosSFDMOdCCkBB7axOM
	sadrXwIJYWSs0X0+x+C6Ih+EpdqQdEinaVNxVoQM5as1O+hpwnPM79x2m5q5uVxF
	qYpVhK/JPgmuC85jSZGRZdCHhUhNxwnTekH5/rspFSMOgT7Fdfmb3lDEIksi6Uz9
	o0bBmtOh1dWRRcN2J681DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745426019; x=
	1745512419; bh=rAqmvqXfJ7Xk1g7GEd9oXDZzoE0rHmrW1vd4nd1KGtg=; b=L
	uhIsKvmVEBCwTrxOn3CDn7LhydLNWB0JMrf9f6biWNcNrbmf9HpIMd2cMdACgETb
	MDceUn9VR3uNO89+jYs+YN63ZOBTo7q+yKvlNoMGKx6EDWKWXBj5L2aKSnKn/wOd
	Fg37ndZXb84Jl3aky4DyPYexkh72z8SDq/gr9u9DScbYuaYNAkCEATupZAmza7Qx
	IMAo8gIjeEf9hBraJ8QWmjw2EY7oJP7CvPvvuj+yN+td/vfrWyNvwZJ/9KRfutUP
	61VUzmVzotlH160L4LHYFjQG6XT8qJ2A9muBiSFy0YXckn51fdmJBc+upnUyo1Li
	9XtjAGe2myNqDiujn5qFA==
X-ME-Sender: <xms:YxYJaEg2WE3u-R1yu6IjebFfdWuq4oxACM-khfKXIATv0xJl3Xr23g>
    <xme:YxYJaNDoqfGrEbT2xa2fSpVwE12RTpUhl9oIb_hT4gNbNFc58sAr_dTDlFYzEhAOc
    N4CC6ZAZpP_jRN5m7M>
X-ME-Received: <xmr:YxYJaMFYo4OBJ6tvb0T89j34ogVCCcYCirc2QSRczHCtAQTCL_8cYtGjT3DKBePCLEmRwtQvMrMz_ZzTGeLPVn_1>
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
X-ME-Proxy: <xmx:YxYJaFScGUPUWohR1zxrBowaae1gnlen7BChb2oqRC7-TCp4k--oKw>
    <xmx:YxYJaBzMDsbVgAtdzfWv3m42ejHyk5_2vCofALpcCTlXcaF42qji-A>
    <xmx:YxYJaD6sZJLapfCj8t-9U9aG1KNe70rVxjmhpF-qRamqD8HrRa3MpQ>
    <xmx:YxYJaOybYsd46dRkBGq2WS4wjJ0tTICo8uJlWJmSSHTP0IZjNmqSUw>
    <xmx:YxYJaBgCQc-vwuJ1VG2HMtyw7u3XvyJ9OVrhQjPSs-9GCKxILAaU9Udk>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 12:33:38 -0400 (EDT)
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
Subject: [PATCH v3 5/7] media: rcar-isp: Move driver to own directory
Date: Wed, 23 Apr 2025 18:31:11 +0200
Message-ID: <20250423163113.2961049-6-niklas.soderlund+renesas@ragnatech.se>
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

Before extending the driver with functions from the R-Car ISP core that
will span multiple files move the existing driver to a separate
directory. While at it rename the single source file to allow future
files to be grouped by functions.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
* Changes since v2
- Add blank line after SPDX header.
---
 MAINTAINERS                                    |  2 +-
 drivers/media/platform/renesas/Kconfig         | 18 +-----------------
 drivers/media/platform/renesas/Makefile        |  2 +-
 .../media/platform/renesas/rcar-isp/Kconfig    | 18 ++++++++++++++++++
 .../media/platform/renesas/rcar-isp/Makefile   |  4 ++++
 .../renesas/{rcar-isp.c => rcar-isp/csisp.c}   |  0
 6 files changed, 25 insertions(+), 19 deletions(-)
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Kconfig
 create mode 100644 drivers/media/platform/renesas/rcar-isp/Makefile
 rename drivers/media/platform/renesas/{rcar-isp.c => rcar-isp/csisp.c} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index bf9dd1f161b9..acd0d92f5699 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14934,7 +14934,7 @@ F:	Documentation/devicetree/bindings/media/renesas,csi2.yaml
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
index 000000000000..242f6a23851f
--- /dev/null
+++ b/drivers/media/platform/renesas/rcar-isp/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
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


