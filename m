Return-Path: <linux-media+bounces-28135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B92A5F1A0
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 11:57:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668083B0DA4
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27667266566;
	Thu, 13 Mar 2025 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYvVmbfa"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199E31EE028
	for <linux-media@vger.kernel.org>; Thu, 13 Mar 2025 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741863298; cv=none; b=gDnjdmpZF55OdIy6nKl+vokhjCBnuBeUy2Yti2CuiTZNEOD49AK3Hxfi+QDGNLjG019xO+tBIdvbieeK99PZXd0ljnfbyMwTN4TWhlYzWIHS89KX5KyMPgXbo8NGqT52QTD6BLOZ4iLygegv6pga8H+LAMLnF5oaDfo+Zg5cglQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741863298; c=relaxed/simple;
	bh=AsIlyQNZU4xCy41Q4zK7YcWkCct0t6d3rXt94wHTChM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXmq5OXU06TsS15WV9e7B5gmZC14IpfUhZIXgX4zMn+cQPx5YP4vuykt652p0lyXdOfB2wTJy6UTUnOf32dyI8PFl7+pc7MLAnzSRcWuHqCSfqjgfKuJ3e9HQxYxKmq8+wWLcDMLCM4XXsTzRn4xjjK6Y9l9Jh4Apq6Ig2EHf5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYvVmbfa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741863297; x=1773399297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AsIlyQNZU4xCy41Q4zK7YcWkCct0t6d3rXt94wHTChM=;
  b=gYvVmbfaGfaBmlv3rjfHXpUi96EPbuHevSusVZ+Luy5P/MXmSESm86EO
   6ZxvosM0Vxf2xQMKgcg8ffvfmmCgKf21YA/2lBFe88o7NmnGPU0m9trON
   swFphQ4+3mWGxgL04HUlzpwC5PxDgSJjnI3F6trW6deCgtYM1g/45Y6Dn
   +UeJY8D57LjAFKt3ia9u9e5Te2gHaqLj6GxbW0hZqUjaJrVOfq3dhke/q
   SMdFfponr+KPCDwOgnLv0FCezsiFmRrNAf7QowZAkpjCnSz4JAAp0cPgX
   Muus0YQCs7l/TH9PafcH+HBm/+6iYOd1AalPg7tqHbtVqTMdAKS71wIpZ
   Q==;
X-CSE-ConnectionGUID: UUnamZJgS9itO4eUEj1AtQ==
X-CSE-MsgGUID: 9ItzVUpBQIik4Xl2RPsP3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60514931"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="60514931"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:54:56 -0700
X-CSE-ConnectionGUID: B2zo1RHpT++e1a2TJYNXiA==
X-CSE-MsgGUID: zHXk3BWDSIi6PdUS+NPDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125990207"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 03:54:55 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D8CD31202E6;
	Thu, 13 Mar 2025 12:54:52 +0200 (EET)
Date: Thu, 13 Mar 2025 10:54:52 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>
Subject: Re: [PATCH 5/5] media: intel/ipu6: Remove unused dev field from
 ipu6_isys_queue
Message-ID: <Z9K5fPKjmwOs2Cx9@kekkonen.localdomain>
References: <20250313102427.131832-1-stanislaw.gruszka@linux.intel.com>
 <20250313102427.131832-6-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313102427.131832-6-stanislaw.gruszka@linux.intel.com>

On Thu, Mar 13, 2025 at 11:24:27AM +0100, Stanislaw Gruszka wrote:
> With current code base dev is only writend but never read.

s/writend/written/

Maybe add: Remove it as redundant.

> 
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.c | 1 -
>  drivers/media/pci/intel/ipu6/ipu6-isys-queue.h | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> index c7f302df2dcc..dd11eae1eeca 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.c
> @@ -841,7 +841,6 @@ int ipu6_isys_queue_init(struct ipu6_isys_queue *aq)
>  	if (ret)
>  		return ret;
>  
> -	aq->dev = &adev->auxdev.dev;
>  	aq->vbq.dev = &adev->isp->pdev->dev;
>  	spin_lock_init(&aq->lock);
>  	INIT_LIST_HEAD(&aq->active);
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> index 1a277b0fb4b5..b865428a0fce 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys-queue.h
> @@ -20,7 +20,6 @@ struct ipu6_isys_stream;
>  struct ipu6_isys_queue {
>  	struct vb2_queue vbq;
>  	struct list_head node;
> -	struct device *dev;
>  	/*
>  	 * @lock: serialise access to queued and pre_streamon_queued
>  	 */

-- 
Sakari Ailus

