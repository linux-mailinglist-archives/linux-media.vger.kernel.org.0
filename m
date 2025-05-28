Return-Path: <linux-media+bounces-33518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E17EAC6877
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 13:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD40D1BA2452
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 11:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF82F2836A2;
	Wed, 28 May 2025 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ey3e/e+q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E5229B30
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 11:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748432274; cv=none; b=ZllH09Myf9easCMAJQQiAk3x6pkMH0q2I9uH2OrEAivS8ofCKziEFyVZz43gb55lKfPvEtDGHWxGYNxe+8zppTohUHLdJwnNP5/d09LC4I5w6c/oiwagGVsd9w4ADaDqllqgZmADWnpZcFc7pBS7JLlfu4l35Y3Tf+a7+BD/UEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748432274; c=relaxed/simple;
	bh=aRw4CAux7kom39FiphGx9QzBWUL7vSSSVdFLSzPwl5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgxDJasT2M1lRplZ+GwoJ1UToDj25AQFkeULKLy6CsCGf/0saU5usOUyJie14hVQhSYFeU3o9+Z7+ou9z0R11H0T1/PfGVAZuLsy/8KDyYXxNSe7Lthf2s6OUmkNINyL50BGhAqRvaKlcNBfnxfFAZAxpw1hmwQJMJ5sNfOyaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ey3e/e+q; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748432272; x=1779968272;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aRw4CAux7kom39FiphGx9QzBWUL7vSSSVdFLSzPwl5g=;
  b=ey3e/e+qOs8O28sdNxUZa4f3sYzuB6JhLtB8x4Zxg0FZuYhgE+EbCxhI
   aUpl96Qq7Y/gk17LVOubjLD+Kd6pAYQvU6+Saf6lvVR8s1SEzhZQ1kAEf
   Q7iRv7KVs2H1d79wDAaa5xIOxPE1yroLoKY3eYjsFPj4rzb0tueSeg6cq
   GIQ5vUxt76+gXbiSzXMokiljtlQ1wNKTNKXH/pN1OCVOq86lXNPUx/QQj
   C2fCU1+8MI1J/VmbPGJ/9nER2/EE+Yt/9r7Zm/yHfvW5oEwZ8qEercyfY
   ifejGqo+9nXGnsbkAI5IHhddBbiqWc6NuK0ue4LwuAdz6L4ckxRL5m4bc
   A==;
X-CSE-ConnectionGUID: fp7aCZ5LRQWmoWf2q6ruVg==
X-CSE-MsgGUID: fdpKm+qvR+KownTi8h4vLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61113135"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61113135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:37:51 -0700
X-CSE-ConnectionGUID: 7tXgKpYZQgmtw2oVPDweww==
X-CSE-MsgGUID: Z5lR7MfiTc+cIiNhSP64Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143558268"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.50])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:37:49 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1273611F741;
	Wed, 28 May 2025 14:37:47 +0300 (EEST)
Date: Wed, 28 May 2025 11:37:47 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: bingbu.cao@intel.com, linux-media@vger.kernel.org,
	stanislaw.gruszka@linux.intel.com,
	laurent.pinchart@ideasonboard.com, jerry.w.hu@intel.com,
	hao.yao@intel.com, tian.shu.qiu@intel.com
Subject: Re: [PATCH v2 1/8] media: Rename the IPU PCI device table header and
 add IPU7 PCI IDs
Message-ID: <aDb1i2ly1dlHIccL@kekkonen.localdomain>
References: <20250528075146.1763079-1-bingbu.cao@intel.com>
 <20250528075146.1763079-2-bingbu.cao@intel.com>
 <eec99ae8-d168-428b-c713-e00ab7de0572@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eec99ae8-d168-428b-c713-e00ab7de0572@linux.intel.com>

Hi Bingbu,

On Wed, May 28, 2025 at 05:18:54PM +0800, Bingbu Cao wrote:
> Sakari,
> 
> On 5/28/25 3:51 PM, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> > 
> > Rename the IPU PCI device table header file and add the IPU7 PCI device
> > IDs.
> > 
> > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6.c                |  2 +-
> >  drivers/media/pci/intel/ivsc/mei_csi.c             |  2 +-
> >  .../media/{ipu6-pci-table.h => ipu-pci-table.h}    | 14 +++++++++++---
> >  3 files changed, 13 insertions(+), 5 deletions(-)
> >  rename include/media/{ipu6-pci-table.h => ipu-pci-table.h} (68%)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> > index 277af7cda8ee..aa859220ba94 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> > @@ -21,7 +21,7 @@
> >  #include <linux/types.h>
> >  
> >  #include <media/ipu-bridge.h>
> > -#include <media/ipu6-pci-table.h>
> > +#include <media/ipu-pci-table.h>
> >  
> >  #include "ipu6.h"
> >  #include "ipu6-bus.h"
> > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> > index 92d871a378ba..47fc48c7619b 100644
> > --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > @@ -27,7 +27,7 @@
> >  #include <linux/workqueue.h>
> >  
> >  #include <media/ipu-bridge.h>
> > -#include <media/ipu6-pci-table.h>
> > +#include <media/ipu-pci-table.h>
> >  #include <media/v4l2-async.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-fwnode.h>
> > diff --git a/include/media/ipu6-pci-table.h b/include/media/ipu-pci-table.h
> > similarity index 68%
> > rename from include/media/ipu6-pci-table.h
> > rename to include/media/ipu-pci-table.h
> > index 0899d9d2f978..528080c6f742 100644
> > --- a/include/media/ipu6-pci-table.h
> > +++ b/include/media/ipu-pci-table.h
> > @@ -3,8 +3,8 @@
> >   * Copyright (C) 2024 Intel Corporation
> >   */
> >  
> > -#ifndef __IPU6_PCI_TBL_H__
> > -#define __IPU6_PCI_TBL_H__
> > +#ifndef __IPU_PCI_TBL_H__
> > +#define __IPU_PCI_TBL_H__
> >  
> >  #include <linux/pci.h>
> >  
> > @@ -15,6 +15,9 @@
> >  #define PCI_DEVICE_ID_INTEL_IPU6EP_RPLP		0xa75d
> >  #define PCI_DEVICE_ID_INTEL_IPU6EP_MTL		0x7d19
> >  
> > +#define PCI_DEVICE_ID_INTEL_IPU7_PCI_ID		0x645d
> > +#define PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID	0xb05d
> > +
> >  static const struct pci_device_id ipu6_pci_tbl[] = {
> >  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6) },
> >  	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU6SE) },
> > @@ -25,4 +28,9 @@ static const struct pci_device_id ipu6_pci_tbl[] = {
> >  	{ }
> >  };
> >  
> > -#endif /* __IPU6_PCI_TBL_H__ */
> > +static const struct pci_device_id ipu7_pci_tbl[] = {
> 
> I got media-ci build errors:
> In file included from drivers/media/pci/intel/ivsc/mei_csi.c:30:
> ./include/media/ipu-pci-table.h:31:35: warning: ‘ipu7_pci_tbl’
> defined but not used [-Wunused-const-variable=]
> 
> Do you think is it OK using 1 table to cover IPU6 and IPU7?

Static const tables in a header isn't that great to begin with, but the
alternative would be another module which is way overkill. Two headers
would make sense in this case I think -- the tables are separate in any
case.

> 
> > +	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7_PCI_ID)},
> > +	{PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_IPU7P5_PCI_ID)},
> > +	{ }
> > +};
> > +#endif /* __IPU_PCI_TBL_H__ */
> > 
> 

-- 
Regards,

Sakari Ailus

