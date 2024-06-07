Return-Path: <linux-media+bounces-12723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCE49003D0
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 14:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 910F31F2241E
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833C11946DF;
	Fri,  7 Jun 2024 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSGVBbPc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F07419409E
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764072; cv=none; b=Ojs7VMHmYhwiVBv7f3gm9wVEHgdxC26VzhujklonUFYZZFdSfIGONl1zYft4oESivWDGIKPpuKRnn3x/cKLm4Gg+WaF1dscQDRlqsoyHF5ew5JaZwxNbJq68xUr5xfwbmP78+ZVONppvgPigMAHhHVxdzucYJ+tc6nABPryZDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764072; c=relaxed/simple;
	bh=ZSeRmYb225co1IgIUpFIKfkPoKm+WHf6x+HzdDrplr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPtjfdHq2p0XoPzFjLteY7fOfMykpfYq1Ed4PaX6l4ijxpvkEFVNh4HgDs4AR8ycB26o5WTBnWxyLZvwQFt/32NxtkkiL4FPXEDdGF/ed/0kZ3vh8Z+CTbaES/zjrwVacyYtwNPcExfXF9f4eaX8wBoPPcpnLK2bKHCNBZtaKr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSGVBbPc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717764071; x=1749300071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZSeRmYb225co1IgIUpFIKfkPoKm+WHf6x+HzdDrplr8=;
  b=CSGVBbPcHVeib+AFtEvQfs2tLB7ygqi1tEDoapONN5sxjAwbmaFy52KL
   8Nx6MpizncHKDXGtDdwUYHjd2TjzoHLgAqoq7xKFkM5k0QtrL0QP+Jh5E
   SAp/yb7BAEy7+YGv5LzqVxz9IcyWPVa5/B0usl4IGI65FVp2NX/mrtIZe
   8O+RbdPUxbsVzpx0wVJUg2xwwgfDTsBF7WgesU9tnPKyaAu9GG4q1Y1bP
   cF/EU9S3oRhMumQQgfVboTwqagtiLrF9ESJhdJ755/NZWo4ic7yyWVN4s
   QUf7bRqxmxUyQaS2iuoAMTgm067x+XEb0mBbhwFuATsGDRnQ/FbPmSJVx
   g==;
X-CSE-ConnectionGUID: atGJHjChRBqEAK4FpJTw3Q==
X-CSE-MsgGUID: /nLU0kSuSgOmh6SPQKmPtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25109584"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25109584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:41:09 -0700
X-CSE-ConnectionGUID: o0AzZr1kQH2GG7tttYrN+g==
X-CSE-MsgGUID: E/RnBgxhRaC0hBKs82Tq1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38764695"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 05:41:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 47A8911FA94;
	Fri,  7 Jun 2024 15:41:05 +0300 (EEST)
Date: Fri, 7 Jun 2024 12:41:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Wentong Wu <wentong.wu@intel.com>
Cc: linux-media@vger.kernel.org, hao.yao@intel.com,
	Jason Chen <jason.z.chen@intel.com>
Subject: Re: [PATCH 2/3] media: ivsc: csi: add separate lock for v4l2 control
 handler
Message-ID: <ZmL_4f8UIab5qaZp@kekkonen.localdomain>
References: <20240603082614.1567712-1-wentong.wu@intel.com>
 <20240603082614.1567712-3-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603082614.1567712-3-wentong.wu@intel.com>

Hi Wentong,

Thanks for the patchset.

On Mon, Jun 03, 2024 at 04:26:13PM +0800, Wentong Wu wrote:
> There're possibilities that privacy status change notification happens
> in the middle of the ongoing mei command which already takes the command
> lock, but v4l2_ctrl_s_ctrl() would also need the same lock prior to this
> patch, so this may results in circular locking problem. This patch adds
> one dedicated lock for v4l2 control handler to avoid described issue.

Before this patch, wouldn't the ongoing MEI command simply complete before
v4l2_ctrl_s_ctrl() could proceed?

> 
> Reported-by: Hao Yao <hao.yao@intel.com>
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Tested-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/pci/intel/ivsc/mei_csi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
> index 004ebab0b814..d6ba0d9efca1 100644
> --- a/drivers/media/pci/intel/ivsc/mei_csi.c
> +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> @@ -126,6 +126,8 @@ struct mei_csi {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	struct v4l2_ctrl *freq_ctrl;
>  	struct v4l2_ctrl *privacy_ctrl;
> +	/* lock for v4l2 controls */
> +	struct mutex ctrl_lock;
>  	unsigned int remote_pad;
>  	/* start streaming or not */
>  	int streaming;
> @@ -563,11 +565,13 @@ static int mei_csi_init_controls(struct mei_csi *csi)
>  	u32 max;
>  	int ret;
>  
> +	mutex_init(&csi->ctrl_lock);
> +
>  	ret = v4l2_ctrl_handler_init(&csi->ctrl_handler, 2);
>  	if (ret)
>  		return ret;
>  
> -	csi->ctrl_handler.lock = &csi->lock;
> +	csi->ctrl_handler.lock = &csi->ctrl_lock;
>  
>  	max = ARRAY_SIZE(link_freq_menu_items) - 1;
>  	csi->freq_ctrl = v4l2_ctrl_new_int_menu(&csi->ctrl_handler,
> @@ -756,6 +760,7 @@ static int mei_csi_probe(struct mei_cl_device *cldev,
>  
>  err_ctrl_handler:
>  	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> +	mutex_destroy(&csi->ctrl_lock);
>  	v4l2_async_nf_unregister(&csi->notifier);
>  	v4l2_async_nf_cleanup(&csi->notifier);
>  
> @@ -775,6 +780,7 @@ static void mei_csi_remove(struct mei_cl_device *cldev)
>  	v4l2_async_nf_unregister(&csi->notifier);
>  	v4l2_async_nf_cleanup(&csi->notifier);
>  	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> +	mutex_destroy(&csi->ctrl_lock);
>  	v4l2_async_unregister_subdev(&csi->subdev);
>  	v4l2_subdev_cleanup(&csi->subdev);
>  	media_entity_cleanup(&csi->subdev.entity);

-- 
Kind regards,

Sakari Ailus

