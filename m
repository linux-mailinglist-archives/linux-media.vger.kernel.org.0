Return-Path: <linux-media+bounces-27927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D778A58E4A
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 09:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85535188EB3F
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 08:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5410224238;
	Mon, 10 Mar 2025 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irXRyf4F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F50223705
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741595881; cv=none; b=mEhXZALX1+oZW1dhZHArQfzENA4rfarU5CREwie4lAjajqgWc08druDpBeXi/jNOo70a/IqUECdW5mCck0tJgzOGNS/cx2vTxiyRvWkhJIXi4NRcOTHoHCPZJD7Kqe6+4TzOn9YnF16cedHaRYTUFZ15bEZQjbLPXx7p8pMMX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741595881; c=relaxed/simple;
	bh=nxFcwKvvoK1UjkxhFySPmDTgOkVgn8q4MoSsOMMatEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaGivgHWcCqztMjktlIivte+J6JspahSP1gH5wkgOnq3Nj2+sDBoT6YblyKrSLdIUH9T5e04aDRvvELcEJPibLH8mLCP+hrGYcfkjVRkmGXWEoWTIY96RzVt8HRWukqg+iGrSu8pZC6Lj/PoBLRLmpqeBQeh1v8ORt4QyescTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irXRyf4F; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741595880; x=1773131880;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nxFcwKvvoK1UjkxhFySPmDTgOkVgn8q4MoSsOMMatEM=;
  b=irXRyf4Fz2bOQaIuyIFbr3ukjPAkp/Bl1Yy/oN1Pbd+PkJqhSX7uLULC
   5wxZiTzYhc/NXY2kGloS9unSRsEM+8b3FFnOojoyGT3L+jbpiupFCxYrT
   wf3N5Rfu8XO9/rHlGI4lUxZifKrnmgqA3rWl3rVCxI6KNA1g/fH5/u8eo
   K6StQQgUnKivla63FUehg6GMUQxs0G30V+GFWLd/INFt/bR0ALFaf9hdz
   SJfLFYXORoWpmbpflmBdKo+Ea1qIStXJMTJSpdwnq+RWJA2JFAoLhXgrH
   8rZze9Jd9lR0TArpVJXzIb5sA83uEEcCl/Vr6C616yVEmWBx/uXG/sNuT
   g==;
X-CSE-ConnectionGUID: +ofpHAxWRbiZCiHNoPlsMQ==
X-CSE-MsgGUID: WiFOjUr+S9WSdnugyfy8fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="45372819"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="45372819"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:37:59 -0700
X-CSE-ConnectionGUID: cWQDlW5RS5291OxbxJqeUA==
X-CSE-MsgGUID: 7BgnGPv3Rpqfwv3yNziA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119861330"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.97])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 01:37:57 -0700
Date: Mon, 10 Mar 2025 09:37:55 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v1 3/3] media: intel/ipu6: Constify ipu6_buttress_ctrl
 structure
Message-ID: <Z86k41DyFtNTHMsM@linux.intel.com>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
 <20250306130629.885163-4-stanislaw.gruszka@linux.intel.com>
 <Z8qj_2RJpuff42Sd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8qj_2RJpuff42Sd@kekkonen.localdomain>

Hi Sakari,

On Fri, Mar 07, 2025 at 07:45:03AM +0000, Sakari Ailus wrote:
> >  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
> > -			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
> > +			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
> 
> pdata should be const, too, btw.
> 
> >  			   char *name);
> >  int ipu6_bus_add_device(struct ipu6_bus_device *adev);
> >  void ipu6_bus_del_devices(struct pci_dev *pdev);
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > index 787fcbd1df09..f8fdc07a953c 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > @@ -443,7 +443,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
> >  	return ret;
> >  }
> >  
> > -int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
> > +int ipu6_buttress_power(struct device *dev, const struct ipu6_buttress_ctrl *ctrl,
> >  			bool on)
> 
> But this is over 80.

On official kernel doc the limit is 100 (with 80 being preferred).
I run chackpatch.pl on this patch and it was just fine.

However clang-format change this to:

int ipu6_buttress_power(struct device *dev,
			const struct ipu6_buttress_ctrl *ctrl, bool on)

which is less than 80 characters. So I guess I need to use auto formatter
for lines I change (for whole file clang-format change lot unrelated things).

Regards
Stanislaw


