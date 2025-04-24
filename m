Return-Path: <linux-media+bounces-30940-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F5AA9AC8B
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 13:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF2FB440EC9
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 11:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8291225A20;
	Thu, 24 Apr 2025 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0lGg90F"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699E6221FA0
	for <linux-media@vger.kernel.org>; Thu, 24 Apr 2025 11:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495736; cv=none; b=YWQ4NwnbQGZTX1PdXu8bJA4tHVpgA3ThkpYFFxHUPTed+nsHGI2vRLBNw9WC7oydnb0WPJnGaVqCzPxE9GKQus/fvIjULOTcUvhwAs7fkW28n1CgrYAF2ja7lOnsAZi2M8gKdXnvtiNazFFGukB74zbPTrmm1/3GFJaVVFNxNF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495736; c=relaxed/simple;
	bh=xedhdhkmbIDLGEDZAmR/gw6Sf18IdNFFWeHJmHi0AUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPZyyWXJP515sdN1YoopvwfrRGzyd43CWmxBfxt7RmF0D4q7tEtVLVDhb9HW7cHUTy3+B0BwIYUDMihxUybGtLrF5Y+WQ3na80tn/cCb6S8mx52v4PnNEW2F7z3gCwE0UTR0fxTgxVXg4ioWrDfxeaHG/93skctWDSjE//M7dos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0lGg90F; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745495734; x=1777031734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xedhdhkmbIDLGEDZAmR/gw6Sf18IdNFFWeHJmHi0AUs=;
  b=K0lGg90Fho+OXUMCQgeAj0SUCLTWDZCPVLivaHxlS3ktlhWeetyWqGi1
   /SqaqkUKpcH6OhVL1TeJhP3FJ56fI4ZtCBBsaIknQVyPtsaOpj0IjTilz
   wpb1tKTa2/bJFEfc6l/02t44IZcXHyiPDeYojQKuKoNHq8YZBn5GPrhBR
   uWZRXrnPX4IkLf4JiopL1SXYkpt9zmHA4M6z5klrD8b3DoIcI/V61juXT
   ic6D7cKK0bKZOBuJL7XYIfkrQgO2rFK+1kMpcCIXKyETg1j+AB7LlftNU
   NWqvCXqEIFRVnX6azLN4rIAKns73v7t26PcN+R5+nq/5Xkn96n4ld8hQZ
   Q==;
X-CSE-ConnectionGUID: zddS8SLsQgKaUNqCsXhMYg==
X-CSE-MsgGUID: QujIhPY9RC20ZDGb/jKVbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="46242651"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="46242651"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 04:55:33 -0700
X-CSE-ConnectionGUID: AO7O/N/HTdaKQfoSrco5QQ==
X-CSE-MsgGUID: GDf1pLRlTk2OBXpgDa/Cig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="137687037"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 04:55:31 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3CB1712260E;
	Thu, 24 Apr 2025 14:55:29 +0300 (EEST)
Date: Thu, 24 Apr 2025 11:55:29 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
Message-ID: <aAomsUA01Sm5vo1x@kekkonen.localdomain>
References: <20250311084203.516205-1-hao.yao@intel.com>
 <f8fd0fd4-ca0c-12b5-acc6-ba846b2c9987@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8fd0fd4-ca0c-12b5-acc6-ba846b2c9987@linux.intel.com>

Hi Bingbu,

On Thu, Apr 24, 2025 at 12:18:06PM +0800, Bingbu Cao wrote:
> Hao,
> 
> On 3/11/25 4:41 PM, Hao Yao wrote:
> > There was a hardware bug which need IPU6 driver to disable the ATS.
> > This workaround is not needed anymore as the bug was fixed in
> > hardware level.
> >
> 
> It is better to send v2 with fixes tag here:
> 
> Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")

Is this worth backporting? Nothing is broken because of this, is it?

> 
> > Signed-off-by: Hao Yao <hao.yao@intel.com>
> > ---
> >  drivers/media/pci/intel/ipu6/ipu6.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
> > index 277af7cda8ee..b00d0705fefa 100644
> > --- a/drivers/media/pci/intel/ipu6/ipu6.c
> > +++ b/drivers/media/pci/intel/ipu6/ipu6.c
> > @@ -464,11 +464,6 @@ static int ipu6_pci_config_setup(struct pci_dev *dev, u8 hw_ver)
> >  {
> >  	int ret;
> >  
> > -	/* disable IPU6 PCI ATS on mtl ES2 */
> > -	if (is_ipu6ep_mtl(hw_ver) && boot_cpu_data.x86_stepping == 0x2 &&
> > -	    pci_ats_supported(dev))
> > -		pci_disable_ats(dev);
> > -
> >  	/* No PCI msi capability for IPU6EP */
> >  	if (is_ipu6ep(hw_ver) || is_ipu6ep_mtl(hw_ver)) {
> >  		/* likely do nothing as msi not enabled by default */
> >
> 

-- 
Regards,

Sakari Ailus

