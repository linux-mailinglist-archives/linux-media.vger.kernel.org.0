Return-Path: <linux-media+bounces-57221-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJtPCdBpxmmkJwUAu9opvQ
	(envelope-from <linux-media+bounces-57221-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:28:16 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 985723436F6
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 12:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 75B75305BFF8
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 11:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B65983DB64B;
	Fri, 27 Mar 2026 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4ujPzDL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51203BED1D;
	Fri, 27 Mar 2026 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610663; cv=none; b=gPBo5QeCLhy5DmkRD3NFP4UnfSxJpawFbbtyOfVmxqW3ZvhUBe7dfb7eIuJ0NRw+2c8Mj44qkJeJlqp9XveNvGWV8fwhlwtm5MFW0WZPqmg8jVeaPEjuoULwZKnxY21+M5/SGSFknJGhRl13uqO+DzIItYlDGsS3m9OyAt6W8hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610663; c=relaxed/simple;
	bh=ojNQ6+TkSwL0/TNIXneOlFJO+/K4GmoOQtz7nh2uvSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OhFXMEs2SwrVptdb6e+aR8ZxdptJwXGpCjBBcAMkHkRIbO7Qv9XOwEfrvSgy4PDmMFwwfx4XKTxODqPvRgny/LBC0PUbeJ9tmDRJXwNBY5brEGltqSeJNgUXB3Gh775kLLp+O34hSBokpw5C+H6hr7fgMVxB7Z5bGEd9qjipvdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4ujPzDL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774610661; x=1806146661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ojNQ6+TkSwL0/TNIXneOlFJO+/K4GmoOQtz7nh2uvSs=;
  b=c4ujPzDL6y8fmAtBT5LKWPT0UZoB8ePpiUUzj1DigQjrcBzuq7VGjriV
   9tFWZKNpTCMbt+V/SXR2zhbgFs3fzyx9Z9wY4rQ+nXes/xZQk9pJDKdjS
   cKFkpZZQmOV5+aasRekZp35Y+B2w6Ze6m/K1CCjCMax6OslQMQHS3Ca84
   k8fOrxw1CN8T7jmwIeWQ540ZGVKLMx2bivEv0b8ZaHKZvUJrCxA15Ecjh
   6RbGfmEiNy/UkwJhOxJ+p1PhTaY1pR2IEhRt/j/rlO/J6n8vvyvHd/W/Z
   jsuIdeD7D/pVkIcqRAw1m70Z1By4lOIV8y33D6XjErMDEp1EUakKfYJV+
   A==;
X-CSE-ConnectionGUID: eK7ywtwrQDa7JDF+qW+ROA==
X-CSE-MsgGUID: I0G0CcwpRjaK4Q3l2uvw1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86374343"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="86374343"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:24:20 -0700
X-CSE-ConnectionGUID: awLHmNY9Tc6BFNtDsqv6hw==
X-CSE-MsgGUID: vnVvIO/pTzaSFMBs3dXioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="229768932"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.137])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 04:24:17 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B501E121DA0;
	Fri, 27 Mar 2026 13:24:20 +0200 (EET)
Date: Fri, 27 Mar 2026 13:24:20 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andriy.shevchenko@intel.com, andy@kernel.org,
	gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in
 gp_timer.c
Message-ID: <acZo5LUXH70-UKUi@kekkonen.localdomain>
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327031106.10386-1-anushkabadhe@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57221-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 985723436F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Anushka,

Thanks for the update.

On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:
> GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
> globally visible.
> 
> Move its declaration from system_local.c to gp_timer.c and make it file
> local by marking it static. Remove external declaration from system_local.h
> and its usage in gp_timer.h
> 
> This fixes a sparse warning about global visibility and cleans up
> unnecessary global exposure.
> 
> Signed-off-by: Anushka Badhe <anushkabadhe@gmail.com>
> ---
> Changes in v6:
> - Mark scope of GP_TIMER_BASE static
> 
>  Changes in v5:
> - Move GP_TIMER_BASE definition to gp_timer.c
> - Remove extern from system_local.h
> - Remove include of system_local.h from gp_timer.h
> 
> Changes in v4:
> - Remove unrelated block comment style fixes
> 
> Changes in v3:
> - Add commit description
> - Fix subject prefix to staging: media: atomisp:
> 
> Changes in v2:
> - Fix block comment style (move closing */ to its own line)
> - Merge split GP_TIMER_BASE declaration onto a single line
> 
> Note:
> * This patch is part of the GSoC2026 application process for device tree
> binding
> s conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
>  .../media/atomisp/pci/hive_isp_css_common/host/gp_timer.c  | 7 ++++++-
>  .../media/atomisp/pci/hive_isp_css_include/gp_timer.h      | 1 -
>  drivers/staging/media/atomisp/pci/system_local.c           | 6 ------
>  drivers/staging/media/atomisp/pci/system_local.h           | 5 -----
>  4 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
> index d04c179a5ecd..0c1b67988dd9 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/gp_timer.c
> @@ -11,7 +11,12 @@
>  #ifndef __INLINE_GP_TIMER__
>  #include "gp_timer_private.h"  /*device_access.h*/
>  #endif /* __INLINE_GP_TIMER__ */
> -#include "system_local.h"
> +
> +/*GP TIMER , all timer registers are inter-twined,
> + * so, having multiple base addresses for
> + * different timers does not help
> + */
> +static const hrt_address GP_TIMER_BASE = (hrt_address)0x0000000000000600ULL;

Please don't move the defition here. There's a reason for keeping it in the
same location with the rest of the offsets. There's a lot to cleanup here
but what should be done is roughly:

- Make these constants macros (with IPU2_ or ATOMISP2_ prefix?) and move
  them into a separate header (perhaps with register definitions?).

- Remove my_env and make struct device (or maybe struct atomisp_device?) as
  a parameter for register access functions.

This may get a bit complicated due to the amount of cleanup needed so
having the hardware for testing would be rather essential.

>  
>  /* FIXME: not sure if reg_load(), reg_store() should be API.
>   */
> diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> index 94f81af70007..e651d9ef1114 100644
> --- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/gp_timer.h
> @@ -21,7 +21,6 @@
>   *	- local:   system and cell specific constants and identifiers
>   */
>  
> -#include "system_local.h"    /*GP_TIMER_BASE address */
>  #include "gp_timer_local.h"  /*GP_TIMER register offsets */
>  
>  #ifndef __INLINE_GP_TIMER__
> diff --git a/drivers/staging/media/atomisp/pci/system_local.c b/drivers/staging/media/atomisp/pci/system_local.c
> index a8a93760d5b1..8d4fd80f8984 100644
> --- a/drivers/staging/media/atomisp/pci/system_local.c
> +++ b/drivers/staging/media/atomisp/pci/system_local.c
> @@ -83,12 +83,6 @@ const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID] = {
>  	0x0000000000000000ULL
>  };
>  
> -/*GP TIMER , all timer registers are inter-twined,
> - * so, having multiple base addresses for
> - * different timers does not help*/

This comment could benefit from fixing, regarding both formatting and
language.

> -const hrt_address GP_TIMER_BASE =
> -    (hrt_address)0x0000000000000600ULL;
> -
>  /* GPIO */
>  const hrt_address GPIO_BASE[N_GPIO_ID] = {
>  	0x0000000000000400ULL
> diff --git a/drivers/staging/media/atomisp/pci/system_local.h b/drivers/staging/media/atomisp/pci/system_local.h
> index 970f4ef990ec..2bd46f5123fb 100644
> --- a/drivers/staging/media/atomisp/pci/system_local.h
> +++ b/drivers/staging/media/atomisp/pci/system_local.h
> @@ -53,11 +53,6 @@ extern const hrt_address FIFO_MONITOR_BASE[N_FIFO_MONITOR_ID];
>  /* GP_DEVICE (single base for all separate GP_REG instances) */
>  extern const hrt_address GP_DEVICE_BASE[N_GP_DEVICE_ID];
>  
> -/*GP TIMER , all timer registers are inter-twined,
> - * so, having multiple base addresses for
> - * different timers does not help*/
> -extern const hrt_address GP_TIMER_BASE;
> -
>  /* GPIO */
>  extern const hrt_address GPIO_BASE[N_GPIO_ID];
>  

-- 
Kind regards,

Sakari Ailus

