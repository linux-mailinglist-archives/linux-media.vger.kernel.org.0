Return-Path: <linux-media+bounces-49310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC43CD526A
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 09:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0916C304842C
	for <lists+linux-media@lfdr.de>; Mon, 22 Dec 2025 08:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EDE30E0E4;
	Mon, 22 Dec 2025 08:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhLj98Du"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665523043D2
	for <linux-media@vger.kernel.org>; Mon, 22 Dec 2025 08:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393026; cv=none; b=hd76U/nmJzayTvWDyEyYYyj9EODph5s/zOy8DuChjSOhHmpJOwerNVJutJX/ON1hVJNrRYqSahl2O4tyD7AjPltyLME6uyiN2r4L1b1JSag1JbiPrISB+k8dC4Nnu9Bv5vuAAQYDQCXJWfBJeQHQv+UgsKh/O2W+Dh97ltvdH7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393026; c=relaxed/simple;
	bh=H9ac+wlc4YiCP0v2ik3Q542Vpw9C1CxaJJCNJNcQYQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eIthlBiOngbxkLXci6j3mLSn3OV9ODik64ohuj+aPWX8hwEdWmrfaZa7ez5VedYEQ8gYsP2zGcaUmIhrTBMLBcQjTlI2o8jWW1VLEJLyXk7HI4d/jx3/ysSOKInDSgHCdKSv8RnjQ6TPOTWvvBqVEJ2O1P75f52p2hwVi97cR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhLj98Du; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766393024; x=1797929024;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H9ac+wlc4YiCP0v2ik3Q542Vpw9C1CxaJJCNJNcQYQc=;
  b=WhLj98Du21Gox8qI07EteWJAhvYq3N4iSex8bfsgCAxkqoyBmL3ZZV57
   7EzmeYYL0zR6CtnbxJsY1+bfbAlMtWTwlTAg8XtSf+wN/v+WfNVY9LFxh
   580Fz7mNlDarsT1jHuKGyhghIgQZcRuJ8/eUcXIk4bpziiaGXW6LPvktE
   EdqI16L1kNrS+f/DL2p+/rbdoG0bnSm2KKQLxAaGlOAQlFGD/oA0oJq6l
   qPUBIBDS6VBY4WzrK2DUun/g3YMn04hfhv2etp0ivd8Lwn1+ZfbCKXZcN
   GtDSngWxt48Syx9aOMVGk3wAj7hL7vZZqSldLElRjsWqtWzRU0W0CQEwd
   w==;
X-CSE-ConnectionGUID: 8SZ9cz8qSf+zONYtam5PkQ==
X-CSE-MsgGUID: 2O/IpSMtRcOH5trG0+N31A==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68321097"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68321097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:43:44 -0800
X-CSE-ConnectionGUID: HGFRBFURSjChMulwKi4PwQ==
X-CSE-MsgGUID: b9PR282BQAem6HqqNKho6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199505337"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.187])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:43:42 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2C06011F87B;
	Mon, 22 Dec 2025 10:43:43 +0200 (EET)
Date: Mon, 22 Dec 2025 10:43:43 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	antti.laakso@linux.intel.com, mehdi.djait@linux.intel.com
Subject: Re: [PATCH v2 1/4] media: staging/ipu7: ignore interrupts when
 device is suspended
Message-ID: <aUkEvwTNjfcNtysn@kekkonen.localdomain>
References: <20251222070629.2018807-1-bingbu.cao@intel.com>
 <20251222070629.2018807-2-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222070629.2018807-2-bingbu.cao@intel.com>

Hi Bingbu,

On Mon, Dec 22, 2025 at 03:06:26PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> IPU7 devices have shared interrupts with others. In some case when
> IPU7 device is suspended, driver get unexpected interrupt and invalid
> irq status 0xffffffff from ISR_STATUS and PB LOCAL_STATUS
> registers as interrupt is triggered from other device on shared
> irq line.
> 
> In order to avoid this issue use pm_runtime_get_if_active() to check
> if IPU7 device is resumed, ignore the invalid irq status and use
> synchronize_irq() in suspend.
> 
> Cc: Stable@vger.kernel.org
> Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu7/ipu7-buttress.c | 12 ++++++++++--
>  drivers/staging/media/ipu7/ipu7.c          |  4 ++++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu7/ipu7-buttress.c b/drivers/staging/media/ipu7/ipu7-buttress.c
> index e5707f5e300b..e4328cafe91d 100644
> --- a/drivers/staging/media/ipu7/ipu7-buttress.c
> +++ b/drivers/staging/media/ipu7/ipu7-buttress.c
> @@ -342,14 +342,22 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
>  	u32 disable_irqs = 0;
>  	u32 irq_status;
>  	unsigned int i;
> +	int active;
>  
> -	pm_runtime_get_noresume(dev);
> +	active = pm_runtime_get_if_active(dev);
> +	if (active <= 0)
> +		return IRQ_NONE;
>  
>  	pb_irq = readl(isp->pb_base + INTERRUPT_STATUS);
>  	writel(pb_irq, isp->pb_base + INTERRUPT_STATUS);
>  
>  	/* check btrs ATS, CFI and IMR errors, BIT(0) is unused for IPU */
>  	pb_local_irq = readl(isp->pb_base + BTRS_LOCAL_INTERRUPT_MASK);
> +	if (WARN_ON_ONCE(pb_local_irq == 0xffffffff)) {
> +		pm_runtime_put_noidle(dev);
> +		return IRQ_NONE;
> +	}
> +
>  	if (pb_local_irq & ~BIT(0)) {
>  		dev_warn(dev, "PB interrupt status 0x%x local 0x%x\n", pb_irq,
>  			 pb_local_irq);
> @@ -365,7 +373,7 @@ irqreturn_t ipu_buttress_isr(int irq, void *isp_ptr)
>  	}
>  
>  	irq_status = readl(isp->base + BUTTRESS_REG_IRQ_STATUS);
> -	if (!irq_status) {
> +	if (!irq_status || WARN_ON_ONCE(irq_status == 0xffffffff)) {
>  		pm_runtime_put_noidle(dev);
>  		return IRQ_NONE;

Doesn't this apply to the ipu6 driver as well? E.g. on my Alder lake system
the interrupt is shared with i801_smbus and processor_thermal_device_pci.
It may be no interrupts are generated by those devices at inconvenient
times for ipu6, but the ipu driver can't assume that.

Is the WARN_ON_ONCE() necessary? I'd use dev_warn_once() here if you'd like
to write a message to the log.

>  	}
> diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
> index 5cddc09c72bf..6c8c3eea44ac 100644
> --- a/drivers/staging/media/ipu7/ipu7.c
> +++ b/drivers/staging/media/ipu7/ipu7.c
> @@ -2684,6 +2684,10 @@ static void ipu7_pci_reset_done(struct pci_dev *pdev)
>   */
>  static int ipu7_suspend(struct device *dev)
>  {
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	synchronize_irq(pdev->irq);
> +
>  	return 0;
>  }
>  

-- 
Kind regards,

Sakari Ailus

