Return-Path: <linux-media+bounces-27962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F244A59584
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 14:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6F3A7A20B8
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 13:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D4F22170B;
	Mon, 10 Mar 2025 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/s0uPbw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD41A930
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741611723; cv=none; b=TxaUNBsEdwjoMIgTVVa4pLoUFtClfhSNXS6frPnprvHTCft8JZ03JSOyegqbm29QgIsrqcaHhaobHR680pmg6zooOJNRujoIDw0W+pXzSkdO/8I2FKqWUvu3Wh3Sg19jG9U3dxP8NMRRyOOfSz0ersoXjTslpssK4Iz0sA34Pqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741611723; c=relaxed/simple;
	bh=ZVzOMlTGCOksMHzz3P0VbRsYRWxd7mS39dGGY+IpZjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9EQ0YoOZ9H1Uuq+OEFJA7KXmDbWXt1kg6HxCI7myVvC3h4h758D3r5EiHN+ro/nXRoKuTwN79jsStMQpqbfrYUR/IiSNTmgpbhBwUX0B1DSaqRvdPQ9q2a57uL+msIoN/Wv0rgfi2tunvKkWMTWKON2PFPTpnzeRQlZYNtPd2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/s0uPbw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741611721; x=1773147721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZVzOMlTGCOksMHzz3P0VbRsYRWxd7mS39dGGY+IpZjU=;
  b=M/s0uPbw938JlWAabkEXOLcmiXezy+jvt7tY8rLW3TAhbfiGIaGO9U40
   FNti6y4ysQ8JYb8S+3MzhKYLPiit1FVMIoXdddVWO7L7muMLMvIgOnSxB
   giLpUjZNRgw13FVhIEZvesK4YvuEjb4clj+98PvD7gE/9Y+zH1sfEmib3
   PRB5CeCHAOYV2IKWHWJochHXLXYNZC8nf8Q0Q9VBQY55IZnD/M6Ot/N1Y
   MokfLRewRGUaG7cJ6JQfNrYHlV5jjfj1JWCaHFkWziMxSmFOZmSHAJgXb
   8Xk7vtAv70cI2P85q+p6LSc/hWJWr0A7zU4IULeXpw5XUi+9cLM+gIlYz
   w==;
X-CSE-ConnectionGUID: fByj24OHS86G1lHKwk0BoQ==
X-CSE-MsgGUID: 5bbVaGnVRke6rlprlqBujw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42482999"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="42482999"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 06:02:00 -0700
X-CSE-ConnectionGUID: PZ17aG8IS6KJqHhS4DBU8w==
X-CSE-MsgGUID: OGhuYwHbQrK1XPfMxJZHeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; 
   d="scan'208";a="124992731"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 06:01:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B17FF11F7E5;
	Mon, 10 Mar 2025 15:01:56 +0200 (EET)
Date: Mon, 10 Mar 2025 13:01:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v1 3/3] media: intel/ipu6: Constify ipu6_buttress_ctrl
 structure
Message-ID: <Z87ixOAC7l8NO3Uf@kekkonen.localdomain>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
 <20250306130629.885163-4-stanislaw.gruszka@linux.intel.com>
 <Z8qj_2RJpuff42Sd@kekkonen.localdomain>
 <Z86k41DyFtNTHMsM@linux.intel.com>
 <Z86_UII900cD9fkk@kekkonen.localdomain>
 <Z87KgbCzYU6nzpxF@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z87KgbCzYU6nzpxF@linux.intel.com>

On Mon, Mar 10, 2025 at 12:18:25PM +0100, Stanislaw Gruszka wrote:
> On Mon, Mar 10, 2025 at 10:30:40AM +0000, Sakari Ailus wrote:
> > Hi Stanislaw,
> > 
> > On Mon, Mar 10, 2025 at 09:37:55AM +0100, Stanislaw Gruszka wrote:
> > > Hi Sakari,
> > > 
> > > On Fri, Mar 07, 2025 at 07:45:03AM +0000, Sakari Ailus wrote:
> > > > >  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
> > > > > -			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
> > > > > +			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
> > > > 
> > > > pdata should be const, too, btw.
> > > > 
> > > > >  			   char *name);
> > > > >  int ipu6_bus_add_device(struct ipu6_bus_device *adev);
> > > > >  void ipu6_bus_del_devices(struct pci_dev *pdev);
> > > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > > > index 787fcbd1df09..f8fdc07a953c 100644
> > > > > --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > > > +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > > > @@ -443,7 +443,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
> > > > >  	return ret;
> > > > >  }
> > > > >  
> > > > > -int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
> > > > > +int ipu6_buttress_power(struct device *dev, const struct ipu6_buttress_ctrl *ctrl,
> > > > >  			bool on)
> > > > 
> > > > But this is over 80.
> > > 
> > > On official kernel doc the limit is 100 (with 80 being preferred).
> > > I run chackpatch.pl on this patch and it was just fine.
> > 
> > The Media tree driver documentation suggests:
> > 
> > $ ./scripts/checkpatch.pl --strict --max-line-length=80
> 
> TBH, in context of ipu6 enforcing 80 characters instead of 100,
> frequently makes more harm then good IMHO, for example:
> 
> const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
> 	{ V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
> 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> 	{ V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
> 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> 	{ V4L2_PIX_FMT_SGRBG12, 16, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
> 	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> 	{ V4L2_PIX_FMT_SRGGB12, 16, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
> vs:
> 
> const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
> 	{ V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12, IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> 	{ V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12, IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> 	{ V4L2_PIX_FMT_SGRBG12, 16, 12, MEDIA_BUS_FMT_SGRBG12_1X12, IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> 	{ V4L2_PIX_FMT_SRGGB12, 16, 12, MEDIA_BUS_FMT_SRGGB12_1X12, IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
> 
> 
> Or:
> 		if (type && ((!pfmt->is_meta &&
> 			      type != V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
> 			     (pfmt->is_meta &&
> 			      type != V4L2_BUF_TYPE_META_CAPTURE)))
> 			continue;
> 
> vs:
> 
> 		if (type && ((!pfmt->is_meta && type != V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
> 			     (pfmt->is_meta && type != V4L2_BUF_TYPE_META_CAPTURE)))
> 			continue;
> 
> 
> Do we really need 80 chars limit in ipu drivers ? 

In the former case I'd keep data related to an array index on the same
line, they're often more readable like that. It's not a strict rule. In the
latter case wrapping after first && may be more readable than either of the
two.

-- 
Sakari Ailus

