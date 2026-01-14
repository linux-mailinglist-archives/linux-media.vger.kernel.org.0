Return-Path: <linux-media+bounces-50690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC2D1EA82
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B73B304D8CC
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 12:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE222396D18;
	Wed, 14 Jan 2026 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccZ62Qnt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD064343D8F;
	Wed, 14 Jan 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768392548; cv=none; b=nQRUd2M9jmOOpolDi2XvEvsGZjru72G21UILHrxbVidL7tbmK5JCm/zroy3pzP02rCvKTajcqLomoVxVEU7iCJ0BbNaM/N3RhxkVZ8c/V5ukRJxNN6Ehw7vp4LfhH8r5tpGkXf/pmVuELHi/TzsCgMmF+tnkDc4glRVsx9vGMo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768392548; c=relaxed/simple;
	bh=EYswg02gjuvqs73LUDwN0ChfKC/BQKKnQB+oeLlaqiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=V7aEuIFTxk2JemItOkMxuVwKbGoMbYylcDddyVSZi1lARWFEM4AmhoMZCBlHa72ZMGZSczYBCJgKCreD0E6pltfFblrjEr+JnuZ6fcS3QbO8/4meLE65mZWljK6SZecohCIcZgs+UnpLAuDMmLjxUHKnqwgLqFFAjh04qln6vnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccZ62Qnt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768392547; x=1799928547;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=EYswg02gjuvqs73LUDwN0ChfKC/BQKKnQB+oeLlaqiM=;
  b=ccZ62QnttDIQuKNRrPINyW3NcuVpRv7Tb/nL9yvhw60jFURL4IIPnyZU
   8kWpTYW/vlPhIvBbpDD+++HqzmWWqe/3OpRIkvLxyxHJ4hGZa9dfdEWx0
   wYpCkEcNUAaVvfuhxUK6iOgyc6Fw9I019VndSt8rYXUEbaHVosvECmSQv
   7ZfArwOTMAf/Dt1tOu3rMMCv9xtWyjQEnANaHH+IUQLHbDemOvjjKL+j9
   e52jPr+DvyEIr1BRoiIsnPFesTUCp2sbesyKpnjg1U9HbwDEO7lZ5XKvC
   G5rVsuIfN9Ot8MkKdwwz0qD35LwUVK50zAdJMdG6/xaNt52AlUTQt4n/z
   g==;
X-CSE-ConnectionGUID: C787EWblTDK4etiLJX6TPQ==
X-CSE-MsgGUID: XOF3j2onS8q0q8j6lPql9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68697369"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="68697369"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:09:06 -0800
X-CSE-ConnectionGUID: YfId4127RIiRbKbn/2MR/A==
X-CSE-MsgGUID: voMxLI1LSL+SxXySXk3osg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204943430"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.94])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:08:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Andrew F. Davis" <afd@ti.com>, Randolph Sapp <rs@ti.com>, Jonathan
 Humphreys <j-humphreys@ti.com>, Andrei Aldea <a-aldea@ti.com>, Chirag
 Shilwant <c-shilwant@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Oded
 Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sumit
 Semwal <sumit.semwal@linaro.org>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH 2/5] accel/thames: Add driver for the C7x DSPs in TI SoCs
In-Reply-To: <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
 <20260113-thames-v1-2-99390026937c@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 14:08:56 +0200
Message-ID: <5d2167dd7c898afdb374429a9dca8d262967d125@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 13 Jan 2026, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 1d3a7251b950f39e2ae600a2fc07a3ef7e41831e..8472989cbe22746f1e7292d2401fa0f7424a6c15 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>  obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>  obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>  obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> -obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> +obj-$(CONFIG_DRM_ACCEL_THAMES)		+= thames/
> \ No newline at end of file

Maybe add the newline while at it.

> diff --git a/drivers/accel/thames/thames_core.c b/drivers/accel/thames/thames_core.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..92af1d68063116bcfa28a33960cbe829029fc1bf
> --- /dev/null
> +++ b/drivers/accel/thames/thames_core.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
> +
> +#include "linux/remoteproc.h"

Ditto here about <> not "".


-- 
Jani Nikula, Intel

