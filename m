Return-Path: <linux-media+bounces-11651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B771A8C9B97
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB071C2107B
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 10:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC6752F61;
	Mon, 20 May 2024 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjODDvL/"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A672032B;
	Mon, 20 May 2024 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716202046; cv=none; b=CSDdmANcKM8xrDtFhTE/plsQbBMi38yWGqHFAw9pLJE+ReCpz2mgD0RR2PXSjjeJEYG6+bIBDIjws/DFk3I5bZ75YLHjnnH67nDwTxj2gWPDsmI5jgG9CQMxMwGgnZmyjw6QTWDBy5YRONcUqUkt+ljGnMgAZ+W2ItQ6CQ1ZDIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716202046; c=relaxed/simple;
	bh=VR0o67WRvl71On11az9p5YmeGt19mCLC3wEHzN3SGf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOYNi0CJ33jr63joDBXoFhLJ2iZycL3g8/V4b6eMx1qAa/dqcQJ7BXngyguE+m9mUL+WPdKi+wN9XA1zKiEWygMShGr/xQuXQfaWMqJZyN9RLchURvE1cu9quM8z+aio7E4rBTzgcFkHhzmUFeOR6Ln0xX6yCGMaoNAK5eytdWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjODDvL/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716202046; x=1747738046;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VR0o67WRvl71On11az9p5YmeGt19mCLC3wEHzN3SGf4=;
  b=DjODDvL/aT8f5xF2szSLWnYklOZeEv05XOaYlkVhogMjgUlI/+WaVgzE
   ipd6EGGccQLBFUDHIK8S4qJdowV392kgYkPDsOVJF6CrrU4WTzlToDOpy
   leXFUjPMiI0FN5kHghv3Pltlwe4sIhDDZ9RejJWzp3bZso5uQ1WFyhtR8
   OsRTmv6clrDKQYLLBB/j5cD2ELiHF8/9idqyGZGU0InNmYQ33Yg4ut3vp
   5eFqaMnUKntShOwv5v9ChuCfgCloRrsPJMfOc/zinzaRb8MbvtLk5pzfA
   prflIE4OLLWZI8ITC/FjXZk3qzitri8mJFoAhzU4kAFRyZtuVEsnxiR2l
   g==;
X-CSE-ConnectionGUID: 1IUvbm5sSoKmtKGOsPk4lw==
X-CSE-MsgGUID: uq3BDWrBRt2vrTMzzqidxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12164199"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12164199"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 03:47:25 -0700
X-CSE-ConnectionGUID: 9ukQbBCFS52uf1+oM45loQ==
X-CSE-MsgGUID: O088slIgQiWLBQ2zkyOn6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="37436813"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 03:47:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 119BC11F830;
	Mon, 20 May 2024 13:47:20 +0300 (EEST)
Date: Mon, 20 May 2024 10:47:20 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: intel/ipu6: Fix an error handling path in
 isys_probe()
Message-ID: <ZksqOEXE0vCSPzYY@kekkonen.localdomain>
References: <545315bcaac0a897c25cfa20a603be2af2a40aa9.1716201136.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <545315bcaac0a897c25cfa20a603be2af2a40aa9.1716201136.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

Thanks for the patch.

On Mon, May 20, 2024 at 12:32:30PM +0200, Christophe JAILLET wrote:
> If an error occurs after a successful alloc_fw_msg_bufs() call, some
> resources should be released as already done in the remove function.
> 
> Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index 5992138c7290..d9e1e1a135b9 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -1062,6 +1062,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata;
>  	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
>  	struct ipu6_device *isp = adev->isp;
> +	struct isys_fw_msgs *fwmsg, *safe;
>  	const struct firmware *fw;
>  	struct ipu6_isys *isys;
>  	unsigned int i;
> @@ -1140,12 +1141,17 @@ static int isys_probe(struct auxiliary_device *auxdev,
>  
>  	ret = isys_register_devices(isys);
>  	if (ret)
> -		goto out_remove_pkg_dir_shared_buffer;
> +		goto free_fw_msg_bufs;
>  
>  	ipu6_mmu_hw_cleanup(adev->mmu);
>  
>  	return 0;
>  
> +free_fw_msg_bufs:
> +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
> +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
> +			       fwmsg, fwmsg->dma_addr, 0);

This is also done in isys_remove(). How about moving these into a new
function that releases memory from both lists?

There's no harm in traversing framebuflist_fw as well, it's empty at this
point.

> +
>  out_remove_pkg_dir_shared_buffer:
>  	if (!isp->secure_mode)
>  		ipu6_cpd_free_pkg_dir(adev);

-- 
Kind regards,

Sakari Ailus

