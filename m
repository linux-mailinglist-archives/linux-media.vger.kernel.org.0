Return-Path: <linux-media+bounces-30984-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064DA9BFB6
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 09:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC5B466A04
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 07:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A3F22E3F3;
	Fri, 25 Apr 2025 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rvqcx2GI"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1101F4CAC;
	Fri, 25 Apr 2025 07:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566090; cv=none; b=Wbh+Tj0wpRyJAmZeDu/1C/kqp9AqjMohaHr6jAvQXnTBEjCCv+Wnzj6xZu3EVWxelaILReFOoXATxue2Ht38f+xGQ8qcymuBAEAhE7LhdemoVmhfSq/j1qy17XOTCuv6KaeG1KzmtIP57LqNclX0TGwffYhlj5Emn7yyU2/vXIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566090; c=relaxed/simple;
	bh=CnAAjlW+/n57ctHV+AovPIRgLSMUUcVXvUPynFXN7x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h50AVZZ0oh/U0GJjddHukIzRUpbofHW/ZUI+8EGqurNFujkYvQKisGehDTbZAygXTRpBfv2k53xniLZhxT4yDF1UMOILX9uCLfHw2UDeuk3UN3OnUeKaQeslh+BPE39KrYAh0KGQnJlymUXylF2E7eF1xDGdw+6E9UnSqCzjSi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rvqcx2GI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745566089; x=1777102089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CnAAjlW+/n57ctHV+AovPIRgLSMUUcVXvUPynFXN7x0=;
  b=Rvqcx2GIM8KwRDEEjfmUXtBW/KEtk1yCuEv6lVCuo675bcAcWnSU2Yyj
   y7pt1rYQ7bmhovZJtFme5njUe+aOm+3Upu8z7ZylTAuG15C47XLaht5LC
   Xi1e34gsMBZNUdiEYDbPcFi48NB9z6MzT/P1ee2OM5eFKLkZM+b3O93ZT
   JGHI19OToaK2yjUAcW7kK1VvgE+oWHSnDmGD257n4pPzp8O8umoHo1ufI
   TJCs4vVv5RcMHaqjN8WeU+1CceV0nkGpeSFq3S+nHdYyri5YMjO8BCitm
   nWBQMa2PDcy0fYPF4towbXSmx3bbcODFg0Q37Yqn0h743ytjhgWajRdTo
   g==;
X-CSE-ConnectionGUID: rFA0po35RailK9GIh0pmdQ==
X-CSE-MsgGUID: UiaQ6y/kSZa36R2oBZz5YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46452970"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="46452970"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:28:08 -0700
X-CSE-ConnectionGUID: uPz9TA+1Rr+V9e4QzrteDw==
X-CSE-MsgGUID: na1vxuV/QdWD8JHyZjuiBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137827999"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 00:28:06 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4B0DE11FA28;
	Fri, 25 Apr 2025 10:28:03 +0300 (EEST)
Date: Fri, 25 Apr 2025 07:28:03 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] media: ov2740: Move pm-runtime cleanup on
 probe-errors to proper place
Message-ID: <aAs5g937g3FHFxLu@kekkonen.localdomain>
References: <20250327165529.31388-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327165529.31388-1-hdegoede@redhat.com>

Hi Hans,

On Thu, Mar 27, 2025 at 05:55:29PM +0100, Hans de Goede wrote:
> When v4l2_subdev_init_finalize() fails no changes have been made to
> the runtime-pm device state yet, so the probe_error_media_entity_cleanup
> rollback path should not touch the runtime-pm device state.
> 
> Instead this should be done from the probe_error_v4l2_subdev_cleanup
> rollback path. Note the pm_runtime_xxx() calls are put above
> the v4l2_subdev_cleanup() call to have the reverse call order of probe().
> 
> Fixes: 289c25923ecd ("media: ov2740: Use sub-device active state")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Add Fixes: tag

Usually there's no need to resend just for the tags. I've got v1 already in
the tree so I'll mark this as "superseded".

-- 
Regards,

Sakari Ailus

