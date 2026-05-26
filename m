Return-Path: <linux-media+bounces-62743-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEggNDglFWpFTAcAu9opvQ
	(envelope-from <linux-media+bounces-62743-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 06:44:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0F75D0B15
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 06:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C6A0301327D
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 04:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C533B52EE;
	Tue, 26 May 2026 04:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="La3JuYTw"
X-Original-To: linux-media@vger.kernel.org
Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56AD2BE035;
	Tue, 26 May 2026 04:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779770668; cv=pass; b=VOMBcIEOO7jj3hqAAyhFB1YlE3uDJeTr2DDu5w/RZXKWs3a43eEDpSPpBo1wc8501/1JWrMA3du62R/S6grtgmc4vhhI4fnkoYvt/KSH040xz5fHYqYv8rKLxRtv78rzy5lx54EnwasNEw1lNCG6NszXAeMWLOyFyI90jKKR41w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779770668; c=relaxed/simple;
	bh=wa+ssrnmgjKS6DGBNa0pU9dgdVK8TCUhhcqTQMPV5Rk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=BOn9fPUEvO+EepUk/eTGGhEckXoq1bHOs3ydtbPTJGNK5yrpPwUdwLPyZCEt3WNviz/DUXex+OmNFY6i/fIwXyk/LxjAgmYS5LVxUw1NEWtr3EiIgnFy3vjW+bDANj9A9eoOMRvPKzn2BpNoIowXBhC2fM04A6wCVrTjiUSvwbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=La3JuYTw; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
ARC-Seal: i=1; a=rsa-sha256; t=1779770653; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=U0TECTrww+34B38VnOalrjWutPgMUlf2oWOcFXzT+7CrKHBFtWiHBPW8z9HSRHTGcwaVSsYAgE6ZtU61tWpndwN2+3GhFVdZtG5VXQ3BLXH/x5TaKhWvkJRYHPfGfQ8ciyHQuzIes+zRvHi9eHZa0wC8eZrnB0BUrqcUvnY/Jxo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779770653; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PXeBvSEj10zdgyJ3uDy6QCh3WoezKa+4QwpzAChHyUM=; 
	b=HtnvhPb8j/Oo9HnnXy/8fHLOz7vw8LX5v/jMJC7FoWF2/X2EhQYD1tBLYeCRnsUZBc9XYAz2Jfy4/xWuiIsznrEgaDyVmdjQkaSpQO6TJhj97q2TCGtaB7XuidA1RnuN5UvTD+y5h65aLn+EnYHXF0gioX53scM1oo0Lq2k7iys=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779770653;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=PXeBvSEj10zdgyJ3uDy6QCh3WoezKa+4QwpzAChHyUM=;
	b=La3JuYTwPYndQgYIKAvymDfMvwk50j1ng4h0Sio9bZdLtEcr7MpaDENaNFYm+/Sm
	Yq18g7BKhI6vkRxzHrcQnKsy27HUus0o+1esbetAAZ+9LL2hufOFgDeLJk1aeZDGxNk
	e7Xi1heKAQR7yGYTwqLNI+lvlH7ZvOb3+jo262G8=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779770652392348.1380039290135; Tue, 26 May 2026 10:14:12 +0530 (IST)
Received: from  [106.219.4.39] by mail.zoho.in
	with HTTP;Tue, 26 May 2026 10:14:12 +0530 (IST)
Date: Tue, 26 May 2026 10:14:12 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>,
	"linux-media" <linux-media@vger.kernel.org>
Message-ID: <19e6298f6e0.5ac60f8c58890.6769560352523159305@zohomail.in>
In-Reply-To: 
Subject: [PATCH v2] staging: media: Remove deprecated Atmel ISC drivers
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[zohomail.in,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[zohomail.in:s=zoho];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-62743-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[zohomail.in:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxuser509@zohomail.in,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zohomail.in:email,zohomail.in:mid,zohomail.in:dkim]
X-Rspamd-Queue-Id: 2A0F75D0B15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Atmel ISC and XISC drivers were deprecated and scheduled
for removal by the beginning of 2026. The replacement drivers
(VIDEO_MICROCHIP_ISC and VIDEO_MICROCHIP_XISC) are available
in the main media subsystem.

Remove the Kconfig entries, Makefile rules, and the
STAGING_MEDIA_DEPRECATED menuconfig since it is no longer
needed. The source files remain on disk but are no longer
compiled since the build infrastructure is removed.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
 drivers/staging/media/Kconfig                 | 18 +------
 drivers/staging/media/Makefile                |  1 -
 .../staging/media/deprecated/atmel/Kconfig    | 47 -------------------
 .../staging/media/deprecated/atmel/Makefile   |  8 ----
 4 files changed, 1 insertion(+), 73 deletions(-)
 delete mode 100644 drivers/staging/media/deprecated/atmel/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/atmel/Makefile

diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
index 1aa31bddf970..52b4aab944f6 100644
--- a/drivers/staging/media/Kconfig
+++ b/drivers/staging/media/Kconfig
@@ -38,20 +38,4 @@ source "drivers/staging/media/sunxi/Kconfig"

 source "drivers/staging/media/tegra-video/Kconfig"
 
-menuconfig STAGING_MEDIA_DEPRECATED
-	bool "Media staging drivers (DEPRECATED)"
-	default n
-	help
-	  This option enables deprecated media drivers that are
-	  scheduled for future removal from the kernel.
-
-	  If you wish to work on these drivers to prevent their removal,
-	  then contact the linux-media@vger.kernel.org mailing list.
-
-	  If in doubt, say N here.
-
-if STAGING_MEDIA_DEPRECATED
-source "drivers/staging/media/deprecated/atmel/Kconfig"
-endif
-
-endif
+endif # STAGING_MEDIA
diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
index 6f78b0edde1e..6fd7179733d8 100644
--- a/drivers/staging/media/Makefile
+++ b/drivers/staging/media/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE)	+= deprecated/atmel/
 obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
 obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
 obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
diff --git a/drivers/staging/media/deprecated/atmel/Kconfig b/drivers/staging/media/deprecated/atmel/Kconfig
deleted file mode 100644
index 418841ea5a0d..000000000000
--- a/drivers/staging/media/deprecated/atmel/Kconfig
+++ /dev/null
@@ -1,47 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-
-comment "Atmel media platform drivers"
-
-config VIDEO_ATMEL_ISC
-	tristate "ATMEL Image Sensor Controller (ISC) support (DEPRECATED)"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && COMMON_CLK
-	depends on ARCH_AT91 || COMPILE_TEST
-	depends on !VIDEO_MICROCHIP_ISC_BASE || COMPILE_TEST
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	select VIDEOBUF2_DMA_CONTIG
-	select REGMAP_MMIO
-	select V4L2_FWNODE
-	select VIDEO_ATMEL_ISC_BASE
-	help
-	   This module makes the ATMEL Image Sensor Controller available
-	   as a v4l2 device.
-
-	   This driver is deprecated and is scheduled for removal by
-	   the beginning of 2026. See the TODO file for more information.
-
-config VIDEO_ATMEL_XISC
-	tristate "ATMEL eXtended Image Sensor Controller (XISC) support (DEPRECATED)"
-	depends on V4L_PLATFORM_DRIVERS
-	depends on VIDEO_DEV && COMMON_CLK
-	depends on ARCH_AT91 || COMPILE_TEST
-	depends on !VIDEO_MICROCHIP_ISC_BASE || COMPILE_TEST
-	select VIDEOBUF2_DMA_CONTIG
-	select REGMAP_MMIO
-	select V4L2_FWNODE
-	select VIDEO_ATMEL_ISC_BASE
-	select MEDIA_CONTROLLER
-	select VIDEO_V4L2_SUBDEV_API
-	help
-	   This module makes the ATMEL eXtended Image Sensor Controller
-	   available as a v4l2 device.
-
-	   This driver is deprecated and is scheduled for removal by
-	   the beginning of 2026. See the TODO file for more information.
-
-config VIDEO_ATMEL_ISC_BASE
-	tristate
-	default n
-	help
-	  ATMEL ISC and XISC common code base.
diff --git a/drivers/staging/media/deprecated/atmel/Makefile b/drivers/staging/media/deprecated/atmel/Makefile
deleted file mode 100644
index 34eaeeac5bba..000000000000
--- a/drivers/staging/media/deprecated/atmel/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-atmel-isc-objs = atmel-sama5d2-isc.o
-atmel-xisc-objs = atmel-sama7g5-isc.o
-atmel-isc-common-objs = atmel-isc-base.o atmel-isc-clk.o
-
-obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-common.o
-obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
-obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
-- 
2.43.0



