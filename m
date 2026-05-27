Return-Path: <linux-media+bounces-62855-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MF1EQWtFmpHoQcAu9opvQ
	(envelope-from <linux-media+bounces-62855-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:36:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C505E1326
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 10:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0A4E43033196
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 08:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE213DF008;
	Wed, 27 May 2026 08:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="aWqyzJpy"
X-Original-To: linux-media@vger.kernel.org
Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DD83CF02B;
	Wed, 27 May 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779870819; cv=pass; b=ZPpFNioQr06Pn8bGb/XYcs6MlAtGUshyhEPk133/qThbPH3xFjwVA2PjhCFcT2MebeaQM+vcyGWAxDdsj6rirXCjtVPMFScciYTv2GuRwDljPhdTTuOFmX9pBDIvwPosluQOP4oaS/nwswsu0shsSZ4Lpwk21njf0t70tvzag9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779870819; c=relaxed/simple;
	bh=ojvVE5uAbXwPUNUVoy8Awca3IEF6AGOojtymNv3e0UA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=FKcDrSM3wAxdleVVm8cQw+OigPTQPpELdVde5bF6r/Jq+QGAabWx1CxxS8ezad/nND+azuBBKZco/61dBg3pKt4YM6ekuxLxaCJBJARuZ1b35VtwdsyEfejnPrwINg7+zdVrL+xydSBhyWP52oAjw2PWMJYmJKc/oSJS9dkuc+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=aWqyzJpy; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
ARC-Seal: i=1; a=rsa-sha256; t=1779870799; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=R6bQ2zIAg7tZvbb+v/NfLUoiKrYWU1wp89vlsHGYPrtZjJW8kf0JJmCsbKcIwa4A1iWaxPe6KZj6JcxmY+0QHg/QPCnZxYEruCGH4I8n+x3ZTMiIAvl6sLzizT2UbcEx3H8wqC4eZr8zVNrpVzjIc/txAnLn25xsLfo61Br/p/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779870799; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=obRTr1Xbo8JP2VlhsrP+96R7FmmM/Xqkp9Ke94vfykY=; 
	b=cByUFyLQFvDIR29klwgra29cyVa/XoW3fbr6rvdGLTLCCH4IurBmfbkX0NwCouOWVKxbNVVDH30lYuhg1mCEY2KSmDOE+tK0Ndzddk5EW8BOKHpiyPcRy5oj4H0PgKun/WHSB4ETLp8ZVfOkaM6HEnrrsai4hQzfqTeS4Ip9uJk=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779870799;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=obRTr1Xbo8JP2VlhsrP+96R7FmmM/Xqkp9Ke94vfykY=;
	b=aWqyzJpyMpH1p7170fDNfLhRtNx2ZRKlV0CqUWMN3KgRmFwWZOyUPItz/SFyqDnH
	ElHzOgNImkt8vYKLgf9Y7ZEl6VJghZYXDHUg1KsyDuzG4HzzryB1e70v7UMRNzUe5qs
	taNzcZQdu5IVocaGrOUPZ1K0RQJgEH6+OQ1fJ+aQ=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779870798433789.8771906224354; Wed, 27 May 2026 14:03:18 +0530 (IST)
Received: from  [157.48.160.125] by mail.zoho.in
	with HTTP;Wed, 27 May 2026 14:03:18 +0530 (IST)
Date: Wed, 27 May 2026 14:03:18 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>,
	"linux-media" <linux-media@vger.kernel.org>
Message-ID: <19e68911259.638e56bd13233.647726868191191070@zohomail.in>
In-Reply-To: 
Subject: [PATCH v4] staging: media: Remove deprecated Atmel ISC drivers
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[zohomail.in:s=zoho];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	DKIM_TRACE(0.00)[zohomail.in:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-62855-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linuxuser509@zohomail.in,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,zohomail.in:email,zohomail.in:mid,zohomail.in:dkim]
X-Rspamd-Queue-Id: B9C505E1326
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
v3: Updated MAINTAINERS to remove staging/atmel references.
v2: Removed Kconfig and Makefile to fix Media CI build issues.
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



