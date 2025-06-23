Return-Path: <linux-media+bounces-35571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8608AE3664
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 512F87A410A
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 06:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E805B1F2C34;
	Mon, 23 Jun 2025 06:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bto3AEZD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88E21F1534
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 06:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661942; cv=none; b=XTQWIatjLdVaxNfoJwADLpHhDGkVm4208cNS0Lq5NECnUw6CCA3xcBeLVjQUoRfhPjPJG1urrHaY2FXj39OV400fxhJbmpKRjWkGReXjgJgVQQxDhrybImnCPWJYdDRY5g8eAB6NnUuuYUoKtOBtr2Yr8fYiFX1r4ceghgZMtIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661942; c=relaxed/simple;
	bh=ccmjpoiveGR3IJaXq92C8KhE/CnD3iPn1ZIxXdodyQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FheWTC9u9zfDEcqLKbRiIoGJ6/bkCb4FD+Tq6qLIuOpsBwl6LLM5VWEIzGqskh52xgjszcy4Xbb2txB+/NX5OnZrltI0Gwb/2gGGLEMDbO8mNS2GEWsT4Q5loGMSp1bAMa7J4WbZB7IOFjlB//piy9+oFiasWGF7z7qXNTcpzP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bto3AEZD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750661941; x=1782197941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ccmjpoiveGR3IJaXq92C8KhE/CnD3iPn1ZIxXdodyQ0=;
  b=Bto3AEZDaHVjKVpNfM/j4OIqfmkqcUuWyLfNCKFglJOrhvhkXzUmyFSl
   SRARN/A0oOpVIz4M1jDoFqvnf1FoCOzWWLuA7Builk780vFaCwYREponI
   tVaLuHO62Rwhh7Q3O3ezrvnlX3DHNgM97CVPlahNMrSHS9FIv64J/EGwZ
   6utl2Zm9cQdvihnBi32RHOKX8OYS+SZp7zjo8e1I3uIJPO96fb7F+CAG/
   vwbYIwwpNcLqLi96E59wP31E/LzZadOm/AXQBO/pcH70+K9CL90UKwlVL
   rbsz4YT18ejMPTEgkXqp83Xl3WXF1h6e5hbY0+mKwtJA0CkbEw+mOHsoA
   g==;
X-CSE-ConnectionGUID: APSzZj8iSZCo2HKYsRQLNQ==
X-CSE-MsgGUID: GVWeNbEzRyWxmQgezoRr4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52725020"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52725020"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:59:00 -0700
X-CSE-ConnectionGUID: lq3PC89iSCmnJw5h0ddUEg==
X-CSE-MsgGUID: 8EEZrfGkSdeWR4SRo/EICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151289299"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 23:59:00 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8A8FF11FC36;
	Mon, 23 Jun 2025 09:58:56 +0300 (EEST)
Date: Mon, 23 Jun 2025 06:58:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH] media: ivsc: Fix crash at shutdown due to missing
 mei_cldev_disable() calls
Message-ID: <aFj7MIJ8dAkgbsFm@kekkonen.localdomain>
References: <20250621140052.67912-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621140052.67912-1-hansg@kernel.org>

Hi Hans,

On Sat, Jun 21, 2025 at 04:00:52PM +0200, Hans de Goede wrote:
> Both the ACE and CSI driver are missing a mei_cldev_disable() call in
> their remove() function.
> 
> This causes the mei_cl client to stay part of the mei_device->file_list
> list even though its memory is freed by mei_cl_bus_dev_release() calling
> kfree(cldev->cl).
> 
> This leads to a use-after-free when mei_vsc_remove() runs mei_stop()
> which first removes all mei bus devices calling mei_ace_remove() and
> mei_csi_remove() followed by mei_cl_bus_dev_release() and then calls
> mei_cl_all_disconnect() which walks over mei_device->file_list dereferecing
> the just freed cldev->cl.
> 
> And mei_vsc_remove() it self is run at shutdown because of the
> platform_device_unregister(tp->pdev) in vsc_tp_shutdown()
> 
> When building a kernel with KASAN this leads to the following KASAN report:
> 
> [ 106.634504] ==================================================================
> [ 106.634623] BUG: KASAN: slab-use-after-free in mei_cl_set_disconnected (drivers/misc/mei/client.c:783) mei
> [ 106.634683] Read of size 4 at addr ffff88819cb62018 by task systemd-shutdow/1
> [ 106.634729]
> [ 106.634767] Tainted: [E]=UNSIGNED_MODULE
> [ 106.634770] Hardware name: Dell Inc. XPS 16 9640/09CK4V, BIOS 1.12.0 02/10/2025
> [ 106.634773] Call Trace:
> [ 106.634777]  <TASK>
> ...
> [ 106.634871] kasan_report (mm/kasan/report.c:221 mm/kasan/report.c:636)
> [ 106.634901] mei_cl_set_disconnected (drivers/misc/mei/client.c:783) mei
> [ 106.634921] mei_cl_all_disconnect (drivers/misc/mei/client.c:2165 (discriminator 4)) mei
> [ 106.634941] mei_reset (drivers/misc/mei/init.c:163) mei
> ...
> [ 106.635042] mei_stop (drivers/misc/mei/init.c:348) mei
> [ 106.635062] mei_vsc_remove (drivers/misc/mei/mei_dev.h:784 drivers/misc/mei/platform-vsc.c:393) mei_vsc
> [ 106.635066] platform_remove (drivers/base/platform.c:1424)
> 
> Add the missing mei_cldev_disable() calls so that the mei_cl gets removed
> from mei_device->file_list before it is freed to fix this.
> 
> Fixes: 78876f71b3e9 ("media: pci: intel: ivsc: Add ACE submodule")
> Fixes: 29006e196a56 ("media: pci: intel: ivsc: Add CSI submodule")
> Signed-off-by: Hans de Goede <hansg@kernel.org>

Thanks for the patch.

I've added Cc: stable and removed Wentong from Cc as he no longer works for
Intel.

I also realised the driver doesn't have a MAINTAINERS entry. I'll add one.

-- 
Regards,

Sakari Ailus

