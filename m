Return-Path: <linux-media+bounces-27940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 369B6A59286
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 12:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74778169BB6
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 11:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B18921D5A6;
	Mon, 10 Mar 2025 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ps+QK2ga"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D2925761
	for <linux-media@vger.kernel.org>; Mon, 10 Mar 2025 11:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741605519; cv=none; b=aPcusSRV1U+1C9dyM4gSYsAr2sM2BdZBhwY7JvfwfvkkH3r6XPA5w4g+TPcbLdDBenkF8MTB7mCifLjHHiATcoYtzMB7LxhYfKrQ07UEvJiRnljPxpfiEBueHo3Jqc6oVfJNpXNpuDzn/5J/nB4Pf64ochMf3OMLnBLAvGAt+uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741605519; c=relaxed/simple;
	bh=yZYMkZTFTiNkeC91wPvQXsN9RE8eUXiOoybFSg2GTaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBFaI2GmDKem64iXHJOEKtqNhADBN17Hy4v/BVqfHdY3CASfnSifM+qH8j93X/bg0gRsBEuv0UcHvJS8LTwHz5gRaMaevrd07P5wYRq7jqz9e9o6cGQDqldqEqSM6TPx0ThU9egkGuqDnw00B/yvsYefKYDgtCCdBbOqfaIqzaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ps+QK2ga; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741605518; x=1773141518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZYMkZTFTiNkeC91wPvQXsN9RE8eUXiOoybFSg2GTaI=;
  b=Ps+QK2gaGNxspcPk2qOaMGUAFjq/a1QapfCH1SiUdt2BXi6aRO3FxiQ1
   012UC2rCrEg+SFYXqumE15IGapM6SW/aLazLRilDkTVmIJZRy+kSsmcwK
   r73GOdlZr2qHvnFhgsJ7SaxGw+6pZ2pIihQ3KMnkTtZg8XSzPetSvDj7v
   2W33IuXwiMmckSQEIG0aRRktkAAEVO9SCkTEkXBvEymJXEBWaov1qGtXB
   uEODegeAISnjoE5hHRakkfQCuQE/sVxuGbNAN1XM3MpzSQx3YsxzIqlQh
   iGPehJ8+lkOeJafOcRAOgsRXHz7nwwcfOKFYYujBizHPQpLlZ1VEgzdOF
   w==;
X-CSE-ConnectionGUID: MNkWIUYMSmuL9Eo3JzL2iQ==
X-CSE-MsgGUID: ghVWbMctTFC+Lm95P02Dsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="60002561"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="60002561"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 04:18:37 -0700
X-CSE-ConnectionGUID: 0FyK32HSQLOlZXtZrHD84g==
X-CSE-MsgGUID: AwLMxg9gRimUABDQJA9f0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="125023658"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.112.97])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 04:18:36 -0700
Date: Mon, 10 Mar 2025 12:18:25 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH v1 3/3] media: intel/ipu6: Constify ipu6_buttress_ctrl
 structure
Message-ID: <Z87KgbCzYU6nzpxF@linux.intel.com>
References: <20250306130629.885163-1-stanislaw.gruszka@linux.intel.com>
 <20250306130629.885163-4-stanislaw.gruszka@linux.intel.com>
 <Z8qj_2RJpuff42Sd@kekkonen.localdomain>
 <Z86k41DyFtNTHMsM@linux.intel.com>
 <Z86_UII900cD9fkk@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z86_UII900cD9fkk@kekkonen.localdomain>

On Mon, Mar 10, 2025 at 10:30:40AM +0000, Sakari Ailus wrote:
> Hi Stanislaw,
> 
> On Mon, Mar 10, 2025 at 09:37:55AM +0100, Stanislaw Gruszka wrote:
> > Hi Sakari,
> > 
> > On Fri, Mar 07, 2025 at 07:45:03AM +0000, Sakari Ailus wrote:
> > > >  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
> > > > -			   void *pdata, struct ipu6_buttress_ctrl *ctrl,
> > > > +			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
> > > 
> > > pdata should be const, too, btw.
> > > 
> > > >  			   char *name);
> > > >  int ipu6_bus_add_device(struct ipu6_bus_device *adev);
> > > >  void ipu6_bus_del_devices(struct pci_dev *pdev);
> > > > diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > > index 787fcbd1df09..f8fdc07a953c 100644
> > > > --- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > > +++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
> > > > @@ -443,7 +443,7 @@ irqreturn_t ipu6_buttress_isr_threaded(int irq, void *isp_ptr)
> > > >  	return ret;
> > > >  }
> > > >  
> > > > -int ipu6_buttress_power(struct device *dev, struct ipu6_buttress_ctrl *ctrl,
> > > > +int ipu6_buttress_power(struct device *dev, const struct ipu6_buttress_ctrl *ctrl,
> > > >  			bool on)
> > > 
> > > But this is over 80.
> > 
> > On official kernel doc the limit is 100 (with 80 being preferred).
> > I run chackpatch.pl on this patch and it was just fine.
> 
> The Media tree driver documentation suggests:
> 
> $ ./scripts/checkpatch.pl --strict --max-line-length=80

TBH, in context of ipu6 enforcing 80 characters instead of 100,
frequently makes more harm then good IMHO, for example:

const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
	{ V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12,
	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
	{ V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12,
	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
	{ V4L2_PIX_FMT_SGRBG12, 16, 12, MEDIA_BUS_FMT_SGRBG12_1X12,
	  IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
	{ V4L2_PIX_FMT_SRGGB12, 16, 12, MEDIA_BUS_FMT_SRGGB12_1X12,
vs:

const struct ipu6_isys_pixelformat ipu6_isys_pfmts[] = {
	{ V4L2_PIX_FMT_SBGGR12, 16, 12, MEDIA_BUS_FMT_SBGGR12_1X12, IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
	{ V4L2_PIX_FMT_SGBRG12, 16, 12, MEDIA_BUS_FMT_SGBRG12_1X12, IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
	{ V4L2_PIX_FMT_SGRBG12, 16, 12, MEDIA_BUS_FMT_SGRBG12_1X12, IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },
	{ V4L2_PIX_FMT_SRGGB12, 16, 12, MEDIA_BUS_FMT_SRGGB12_1X12, IPU6_FW_ISYS_FRAME_FORMAT_RAW16 },


Or:
		if (type && ((!pfmt->is_meta &&
			      type != V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
			     (pfmt->is_meta &&
			      type != V4L2_BUF_TYPE_META_CAPTURE)))
			continue;

vs:

		if (type && ((!pfmt->is_meta && type != V4L2_BUF_TYPE_VIDEO_CAPTURE) ||
			     (pfmt->is_meta && type != V4L2_BUF_TYPE_META_CAPTURE)))
			continue;


Do we really need 80 chars limit in ipu drivers ? 

Regards
Stanislaw


