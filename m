Return-Path: <linux-media+bounces-50689-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6234D1EA31
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 13:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A76AC3047939
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 12:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9F7218AAD;
	Wed, 14 Jan 2026 12:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTleEYBv"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4223557EA;
	Wed, 14 Jan 2026 12:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768392299; cv=none; b=AsIitnT9deqr8dNVV52f8X30/qavG/c7JIY+JiRAHRUfXlW/rVCel1ryFnbpJ9CqtXZQlPhBowkT7lw+Z0vvDOUXJndEBUQxL51vvj8fJwH9gxADFN/f3BhOyHdLU5wiUTcyxIj+Y7RXCeqjjqpBAvwCxvatpgmlXMccYVV4Y9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768392299; c=relaxed/simple;
	bh=8Vys6z8x451y8jCfmv4tHJdqji+vE+8qZ4G6/y7V1fs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uUmqcilZifmKtrkJBmoogxHkpte6lnl3w1JX7a0beoCVlMCYy0wJhj1mSeyPei/DOnZiQE7ElpvRzr8g3CzHHctB12c3Wq6l25lFHGvvlM6P7cBZrrw9WO0Gi+Tjo4xRZhjS4npEER4EiDizihwytlyKkaKzJ89J+LSmIq93eXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTleEYBv; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768392297; x=1799928297;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=8Vys6z8x451y8jCfmv4tHJdqji+vE+8qZ4G6/y7V1fs=;
  b=bTleEYBvTPwiLQ7JdoJfPVn5CnnqxLFhU0cJXLT/WCocWWV+IrIsxH9Y
   m0O+NZ88XyF+18CNPzRXV+VuIKzKFJndh2UouFGnHK9RfHykWen8hM8Im
   PECNs5SOYDUMPhMAWf8HbHONDZDsw9jmPT9dqONtaIK1DCp6WyyL82VuX
   Zz+6jMwMlMN02c2QjbeqHSXes9D9feSJOieYOPG5rpAUDvOI6rLE7hGLU
   bjjZ/Z/vDvGUICwkPtxPbV8EW/++9bKIrK8N4YTpLbW8kU1guoQY1ubiV
   7p7sjp6LuDgrBeVkI0uCHxM5QBqbrGD/Fka48fmiW5GEl6U2SqTahuao1
   A==;
X-CSE-ConnectionGUID: IS4Nkmv5Q0qzqL+nXJT6zw==
X-CSE-MsgGUID: G1AuqM+JTWq8Wl5pWX/cRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69608381"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69608381"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:04:56 -0800
X-CSE-ConnectionGUID: L5TFJIbzQHuz1awGSe6Qmg==
X-CSE-MsgGUID: UaaRHJhvTS+nCq8qGoc/sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="242205696"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.94])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:04:48 -0800
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
Subject: Re: [PATCH 4/5] accel/thames: Add IOCTL for job submission
In-Reply-To: <20260113-thames-v1-4-99390026937c@tomeuvizoso.net>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
 <20260113-thames-v1-4-99390026937c@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 14:04:44 +0200
Message-ID: <1acdffd8f05eae0a3531d43d3919d8bd4558f37a@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 13 Jan 2026, Tomeu Vizoso <tomeu@tomeuvizoso.net> wrote:
> +#include "linux/dev_printk.h"

Random drive-by comment, please use <> instead of "" for include/
headers.

> +#include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_print.h>
> +#include <drm/thames_accel.h>
> +#include <linux/platform_device.h>

In general, I think it will make everyone's life easier in the long run
if the include directives are grouped and sorted.

BR,
Jani.


-- 
Jani Nikula, Intel

