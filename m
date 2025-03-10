Return-Path: <linux-media+bounces-27936-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE08A59137
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 11:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DC683A62B0
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B089224252;
	Mon, 10 Mar 2025 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KUHdaCMm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142621C9EAA
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741602645; cv=none; b=Pt7hBfTE4mduCPFt5WAWJi6PTaB2R2MtkshavsmQqeC2cKA6CFU6FFavuZM03udVZ0YbxgBFsTv+Xb5bUhrCSm1eIpBglfr3U3uGGOsS4lVx7KV3TDQRZVXHgRZWDmgKQl+w9e50kT7ECvEVAXoKOHuDR6ADJivmodnCTXH3F5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741602645; c=relaxed/simple;
	bh=NLYJ3SchetcvvAwSyyrgrOovxYBtETf4JtgAUAB6Tbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G358DHF/VSOJ2NpPWAI/EZU5XbzWfqPLMunq3+A1I18ktjPTL8s7ZjRnWqHddatU/tYA4SU9gYpr6R2PPiGWHK+A0rtNlCHJUklwCKq1t1wYc9eM756kFmivlejCm/10LxuP4wq7s27fXenink0Ron2RWnDf+cSZgcJRIajs1Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KUHdaCMm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741602644; x=1773138644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NLYJ3SchetcvvAwSyyrgrOovxYBtETf4JtgAUAB6Tbk=;
  b=KUHdaCMmFfc20BBnYucetQL0REpJUNXp4Bug/iIarFeZ4cnKrwamuNK9
   5eJkpGcZasupbxemUYHT52rZ3W58NWuZWT0aAVHmWLwg9amhc9NSxASR6
   F4nKMbab9jC9a+uCPmeAZqjd+p3sfbNZ4cKApPwWtK2md77fFuDfKTNEb
   dnsPst5WdZeM2QeCbRL+xOwkS+N7p/efMOIVTUyNMlkHdY79Xb0C9L3l8
   eGm3cr0/sauHmj6q4arhsquwikEEeHzT/LZ9MqmGEhKlZ7d+vapx48VPr
   BvUosfORTnndMKmpgItfgTKHHM1GJzY/vzGqV7SC27oETmx8RuyXmIQUW
   w==;
X-CSE-ConnectionGUID: 6NVuluYxSo60l0Ct2P6wSA==
X-CSE-MsgGUID: uKUBy7HuQV2nWu4Ta6iijQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="53233951"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="53233951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 03:30:43 -0700
X-CSE-ConnectionGUID: 79KPNeEDQI2JAxGy743IVg==
X-CSE-MsgGUID: WJG7NBMzT7ScBWJyvgtpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="150906180"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 03:30:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 17DA711F7F0;
	Mon, 10 Mar 2025 12:30:40 +0200 (EET)
Date: Mon, 10 Mar 2025 10:30:40 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v1 3/3] media: intel/ipu6: Constify ipu6_buttress_ctrl
 structure
Message-ID: <Z86_UII900cD9fkk@kekkonen.localdomain>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
 <20250306130629.885163-4-stanislaw.gruszka@linux.intel.com>
 <Z8qj_2RJpuff42Sd@kekkonen.localdomain>
 <Z86k41DyFtNTHMsM@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z86k41DyFtNTHMsM@linux.intel.com>

Hi Stanislaw,

On Mon, Mar 10, 2025 at 09:37:55AM +0100, Stanislaw Gruszka wrote:
> Hi Sakari,
> 
> On Fri, Mar 07, 2025 at 07:45:03AM +0000, Sakari Ailus wrote:
> > >  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
> > > -			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
> > > +			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
> > 
> > pdata should be const, too, btw.
> > 
> > >  			   char *name);
> > >  int ipu6_bus_add_device(struct ipu6_bus_device *adev);
> > >  void ipu6_bus_del_devices(struct pci_dev *pdev);
> > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > index 787fcbd1df09..f8fdc07a953c 100644
> > > --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > @@ -443,7 +443,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
> > >  	return ret;
> > >  }
> > >  
> > > -int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
> > > +int ipu6_buttress_power(struct device *dev, const struct ipu6_buttress_ctrl *ctrl,
> > >  			bool on)
> > 
> > But this is over 80.
> 
> On official kernel doc the limit is 100 (with 80 being preferred).
> I run chackpatch.pl on this patch and it was just fine.

The Media tree driver documentation suggests:

$ ./scripts/checkpatch.pl --strict --max-line-length=80

> 
> However clang-format change this to:
> 
> int ipu6_buttress_power(struct device *dev,
> 			const struct ipu6_buttress_ctrl *ctrl, bool on)
> 
> which is less than 80 characters. So I guess I need to use auto formatter
> for lines I change (for whole file clang-format change lot unrelated things).

-- 
Kind regards,

Sakari Ailus

