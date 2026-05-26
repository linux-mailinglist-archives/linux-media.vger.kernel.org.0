Return-Path: <linux-media+bounces-62784-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAKvOgKQFWrUWQcAu9opvQ
	(envelope-from <linux-media+bounces-62784-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:20:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC795D5718
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 14:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5B9300D14F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 12:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10083F928B;
	Tue, 26 May 2026 12:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="x7KgnH+/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD73DA5BC;
	Tue, 26 May 2026 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797844; cv=pass; b=lUXkJXXBK9OSGtfF22MtbQu2GrXMlsU87rcyX4W0uvOphtVqe+tocrbJts0r5xAH1vnwksmEkyd4lzoHQIsXv8pvDqcXjFL09jO648oI0rMB8qeBNAw6oxGx0EXDo4vv0W1GMoa11RNGCzBz7+XuZq4bx7w20Rn/ykx3yJ9KnDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797844; c=relaxed/simple;
	bh=qLJqGU149AFEK5NAq3HTdCtG16am9VLMU7zTyfXwD7s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=maLMFt9b12mTfIy/V3pqeLU2PVyHM+Q0iYGNUtuhDk67l6vN/v1dnhxQm7nFmS4juq++tz/TJoyz8b45BcshGq39AbOU/MPXifdQONA7JMtWIutfExOrQ8GuM7V+EtfcHDUIBYagiDxXGs499uuFdFO1KiOWNqvPg4e5YXC4d/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=x7KgnH+/; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
ARC-Seal: i=1; a=rsa-sha256; t=1779797817; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=XZrSsg7xjPkluKenruUMlqvU8ob6WnsTA5J8959sjqdBNVuqxzcT4bdNyNTe0QMnQgSRAXlmSndvOwodr2ZqrTuohwi1QyyKAYNNKqRkSoxLU4eBqCnwZY5Xvi8dVc0eamGrP1YCmDibO4eRH8XlRqDfn01Idm2SCXToGAIQ72g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779797817; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fBl59d6BpzTCvjrU0Ys2J2ycHy/10G7PhZT1nzOVOzc=; 
	b=PwxLLlgL1UicAKZEkmrbvRM9/RxxdCNhftwj/jZMO3+8qFBqf21fC7+LVnB2mWlq/zGBGQQ2wh3b+TkzL40IsKs1RuvY1RnGpoWDfUkB+rB0mW6z1PJCkJCnCVieyp1aWU9ZYxupeKAu4dwZM+UvWMeorgMNyo7DNePLBlrheBQ=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779797817;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fBl59d6BpzTCvjrU0Ys2J2ycHy/10G7PhZT1nzOVOzc=;
	b=x7KgnH+/750qiDJ/c0QznrO5+KSiwZZblE7GH00kF1fZ7PVWedLc1ar8EHzj29eo
	O74qTKEIhJb8c/d+byB3cSNGt/U/GcrSxWHcNtQLdLFi/CHM5XXZsL8tTrHrXwdFjNq
	Z3l0DFHNnKfi74MC2OK9XSOO79oOGHKNxKiUFAa4=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779797816842128.25528368276662; Tue, 26 May 2026 17:46:56 +0530 (IST)
Received: from  [223.228.122.9] by mail.zoho.in
	with HTTP;Tue, 26 May 2026 17:46:56 +0530 (IST)
Date: Tue, 26 May 2026 17:46:56 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-media" <linux-media@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e64377600.72fca248167943.7947263371163961978@zohomail.in>
In-Reply-To: 
Subject: [PATCH v3] staging: media: Remove deprecated Atmel ISC drivers
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[zohomail.in:s=zoho];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_TRACE(0.00)[zohomail.in:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-62784-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxuser509@zohomail.in,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zohomail.in:email,zohomail.in:mid,zohomail.in:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4FC795D5718
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Atmel ISC and XISC drivers were deprecated and scheduled
for removal by the beginning of 2026. The replacement drivers
(VIDEO_MICROCHIP_ISC and VIDEO_MICROCHIP_XISC) are available
in the main media subsystem.

Remove the Kconfig entries, Makefile rules, MAINTAINERS entries,
and the STAGING_MEDIA_DEPRECATED menuconfig since it is no longer
needed. The source files remain on disk but are no longer compiled
since the build infrastructure is removed.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
 MAINTAINERS                                   |  2 -
 drivers/staging/media/Kconfig                 | 18 +------
 drivers/staging/media/Makefile                |  1 -
 .../staging/media/deprecated/atmel/Kconfig    | 47 -------------------
 .../staging/media/deprecated/atmel/Makefile   |  8 ----
 5 files changed, 1 insertion(+), 75 deletions(-)
 delete mode 100644 drivers/staging/media/deprecated/atmel/Kconfig
 delete mode 100644 drivers/staging/media/deprecated/atmel/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 27a073f53cea..4290eae8838e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17364,8 +17364,6 @@ F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
 F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
 F:	drivers/media/platform/microchip/microchip-isc*
 F:	drivers/media/platform/microchip/microchip-sama*-isc*
-F:	drivers/staging/media/deprecated/atmel/atmel-isc*
-F:	drivers/staging/media/deprecated/atmel/atmel-sama*-isc*
 F:	include/linux/atmel-isc-media.h

 MICROCHIP ISI DRIVER
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




