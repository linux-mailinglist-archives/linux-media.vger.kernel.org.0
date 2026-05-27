Return-Path: <linux-media+bounces-62914-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ7dANodF2rw5AcAu9opvQ
	(envelope-from <linux-media+bounces-62914-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 18:37:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F367A5E7DD8
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 18:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 06FED30428CF
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 16:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77C3438FF4;
	Wed, 27 May 2026 16:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgA154mq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476B42EEA7;
	Wed, 27 May 2026 16:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899469; cv=none; b=uNwIUUrCu+2rI307XxjuWVQQacNdn7fxuTEWIOKZzR5WHgXKUYLLtO1tBD+K9yhuz4WPQ/MFQC+PQf3RV0aw1tcmNWsySpleuA7C7I2ybnsb0UtwliYMyFELRJGzyPHMbyejPwBhDy73/8wb2VtBClVKCA8aNCic5w76gc7Q8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899469; c=relaxed/simple;
	bh=xY8g76jiauK85zISL170tG4vY7L6kvcFpOhU6iq43Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPk6jwlOJcGqJA7ngkCUvThBT65mXLXr/beBSJZsz51JhyYjuKKvk/HpFcBtQXXzrN85UnGLDjIJEarSRqZ6QXv/2dVz/ULkT8G9cTKtPb92veeNbqEafDRt4C1pkCo07sQdMShVfodL5KuqxPY8b/gBAk1qdB8IJkPOxlE8yok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgA154mq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3751F000E9;
	Wed, 27 May 2026 16:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779899466;
	bh=cXP5E+XlI0p2xdeyXf3ZWsRiSqLOR5raKfJuiGMGDjA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=KgA154mqKp/6CvDbzQ2xTRYrIBCmHvsQSs2uLuYXTlfBhMSmb3zik2zd+yXQ/ybiS
	 Y32HicRTUQwtW7wYXMp5E0vDaxrKV4TDrLR80rSy0gHhBwErlSMQZlxjp0tkqY8LCQ
	 kh6WyXGIflsvaHOHAaTsKlgaWAPFSfHVmGufSayNskNMmDkHEv7BgzcLM1pnLfZM5f
	 aHl96Ven08tTwSFI48J6kqy+9aAJrv53wCIFTX4MmXx7s3aLnepKcu4Ki6XQqsy7gO
	 RVSR37YP6vhkREFJxRJHE0jTiD4er4wQfwF8j+kofHjgIjdNfuMrUREBraAnRMEgwP
	 r8rcO848oHtWA==
Message-ID: <27d12c1d-2212-4e6d-8123-cdb0db59e0d1@kernel.org>
Date: Wed, 27 May 2026 19:31:02 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] staging: media: Remove deprecated Atmel ISC drivers
To: Ashwin Gundarapu <linuxuser509@zohomail.in>,
 gregkh <gregkh@linuxfoundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-staging <linux-staging@lists.linux.dev>,
 linux-media <linux-media@vger.kernel.org>
References: <19e68911259.638e56bd13233.647726868191191070@zohomail.in>
From: Eugen Hristev <ehristev@kernel.org>
Content-Language: en-US
In-Reply-To: <19e68911259.638e56bd13233.647726868191191070@zohomail.in>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-62914-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ehristev@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F367A5E7DD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/27/26 11:33, Ashwin Gundarapu wrote:
> The Atmel ISC and XISC drivers were deprecated and scheduled
> for removal by the beginning of 2026. The replacement drivers
> (VIDEO_MICROCHIP_ISC and VIDEO_MICROCHIP_XISC) are available
> in the main media subsystem.
> 
> Remove the Kconfig entries, Makefile rules, MAINTAINERS entries,
> and the STAGING_MEDIA_DEPRECATED menuconfig since it is no longer
> needed. The source files remain on disk but are no longer compiled
> since the build infrastructure is removed.
> 
> Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
> ---

This is very strange . It comes *right after* I already sent a patch for
this.
Also, your patch is incomplete. "Source files remain on disk" ??


> v3: Updated MAINTAINERS to remove staging/atmel references.
> v2: Removed Kconfig and Makefile to fix Media CI build issues.
> ---
>  MAINTAINERS                                   |  2 -
>  drivers/staging/media/Kconfig                 | 18 +------
>  drivers/staging/media/Makefile                |  1 -
>  .../staging/media/deprecated/atmel/Kconfig    | 47 -------------------
>  .../staging/media/deprecated/atmel/Makefile   |  8 ----
>  5 files changed, 1 insertion(+), 75 deletions(-)
>  delete mode 100644 drivers/staging/media/deprecated/atmel/Kconfig
>  delete mode 100644 drivers/staging/media/deprecated/atmel/Makefile
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 27a073f53cea..4290eae8838e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17364,8 +17364,6 @@ F:	Documentation/devicetree/bindings/media/atmel,isc.yaml
>  F:	Documentation/devicetree/bindings/media/microchip,xisc.yaml
>  F:	drivers/media/platform/microchip/microchip-isc*
>  F:	drivers/media/platform/microchip/microchip-sama*-isc*
> -F:	drivers/staging/media/deprecated/atmel/atmel-isc*
> -F:	drivers/staging/media/deprecated/atmel/atmel-sama*-isc*
>  F:	include/linux/atmel-isc-media.h
> 
>  MICROCHIP ISI DRIVER
> diff --git a/drivers/staging/media/Kconfig b/drivers/staging/media/Kconfig
> index 1aa31bddf970..52b4aab944f6 100644
> --- a/drivers/staging/media/Kconfig
> +++ b/drivers/staging/media/Kconfig
> @@ -38,20 +38,4 @@ source "drivers/staging/media/sunxi/Kconfig"
> 
>  source "drivers/staging/media/tegra-video/Kconfig"
> 
> -menuconfig STAGING_MEDIA_DEPRECATED
> -	bool "Media staging drivers (DEPRECATED)"
> -	default n
> -	help
> -	  This option enables deprecated media drivers that are
> -	  scheduled for future removal from the kernel.
> -
> -	  If you wish to work on these drivers to prevent their removal,
> -	  then contact the linux-media@vger.kernel.org mailing list.
> -
> -	  If in doubt, say N here.
> -
> -if STAGING_MEDIA_DEPRECATED
> -source "drivers/staging/media/deprecated/atmel/Kconfig"
> -endif
> -
> -endif
> +endif # STAGING_MEDIA
> diff --git a/drivers/staging/media/Makefile b/drivers/staging/media/Makefile
> index 6f78b0edde1e..6fd7179733d8 100644
> --- a/drivers/staging/media/Makefile
> +++ b/drivers/staging/media/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE)	+= deprecated/atmel/
>  obj-$(CONFIG_INTEL_ATOMISP)     += atomisp/
>  obj-$(CONFIG_VIDEO_IMX_MEDIA)	+= imx/
>  obj-$(CONFIG_VIDEO_MAX96712)	+= max96712/
> diff --git a/drivers/staging/media/deprecated/atmel/Kconfig b/drivers/staging/media/deprecated/atmel/Kconfig
> deleted file mode 100644
> index 418841ea5a0d..000000000000
> --- a/drivers/staging/media/deprecated/atmel/Kconfig
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -
> -comment "Atmel media platform drivers"
> -
> -config VIDEO_ATMEL_ISC
> -	tristate "ATMEL Image Sensor Controller (ISC) support (DEPRECATED)"
> -	depends on V4L_PLATFORM_DRIVERS
> -	depends on VIDEO_DEV && COMMON_CLK
> -	depends on ARCH_AT91 || COMPILE_TEST
> -	depends on !VIDEO_MICROCHIP_ISC_BASE || COMPILE_TEST
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	select VIDEOBUF2_DMA_CONTIG
> -	select REGMAP_MMIO
> -	select V4L2_FWNODE
> -	select VIDEO_ATMEL_ISC_BASE
> -	help
> -	   This module makes the ATMEL Image Sensor Controller available
> -	   as a v4l2 device.
> -
> -	   This driver is deprecated and is scheduled for removal by
> -	   the beginning of 2026. See the TODO file for more information.
> -
> -config VIDEO_ATMEL_XISC
> -	tristate "ATMEL eXtended Image Sensor Controller (XISC) support (DEPRECATED)"
> -	depends on V4L_PLATFORM_DRIVERS
> -	depends on VIDEO_DEV && COMMON_CLK
> -	depends on ARCH_AT91 || COMPILE_TEST
> -	depends on !VIDEO_MICROCHIP_ISC_BASE || COMPILE_TEST
> -	select VIDEOBUF2_DMA_CONTIG
> -	select REGMAP_MMIO
> -	select V4L2_FWNODE
> -	select VIDEO_ATMEL_ISC_BASE
> -	select MEDIA_CONTROLLER
> -	select VIDEO_V4L2_SUBDEV_API
> -	help
> -	   This module makes the ATMEL eXtended Image Sensor Controller
> -	   available as a v4l2 device.
> -
> -	   This driver is deprecated and is scheduled for removal by
> -	   the beginning of 2026. See the TODO file for more information.
> -
> -config VIDEO_ATMEL_ISC_BASE
> -	tristate
> -	default n
> -	help
> -	  ATMEL ISC and XISC common code base.
> diff --git a/drivers/staging/media/deprecated/atmel/Makefile b/drivers/staging/media/deprecated/atmel/Makefile
> deleted file mode 100644
> index 34eaeeac5bba..000000000000
> --- a/drivers/staging/media/deprecated/atmel/Makefile
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0-only
> -atmel-isc-objs = atmel-sama5d2-isc.o
> -atmel-xisc-objs = atmel-sama7g5-isc.o
> -atmel-isc-common-objs = atmel-isc-base.o atmel-isc-clk.o
> -
> -obj-$(CONFIG_VIDEO_ATMEL_ISC_BASE) += atmel-isc-common.o
> -obj-$(CONFIG_VIDEO_ATMEL_ISC) += atmel-isc.o
> -obj-$(CONFIG_VIDEO_ATMEL_XISC) += atmel-xisc.o
> --
> 2.43.0
> 
> 
> 


