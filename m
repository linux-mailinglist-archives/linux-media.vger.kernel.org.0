Return-Path: <linux-media+bounces-19600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CE699C8EC
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 13:31:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 712E02915CB
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9493617BECA;
	Mon, 14 Oct 2024 11:31:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D492C149C57
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 11:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728905511; cv=none; b=ib+C6NINX1Yq51arb5+WQAkaNsbUxgPVSteVos+OREdMcCHkBV/6YaQxl4sk7P7EN4jjNt5JS4KsfAxBr0S7SQfGR9bMvlb6HpA0sK+NeZMxa4ITnkK0LqFT2wQksCvHUhu7GOaXnLK3kbhzRS7lB5HUZ6NmRNv6eSDx4CzHjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728905511; c=relaxed/simple;
	bh=FX6WDxEHtfdC2PhJwmYxNnv6TtU0S2T2fvnhakz3Bkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXtvFdDxKWxh3/8Gai0z1tKYrkyHE1AC3o6VLXjC+hlQXsUA28mfpy2ikkDkCTzVo2RuLpOOLNTMdncLWOUGtqzopUi6rKgU1XXYqiJF5uKEBOPPzZQlPeJ38Q6uA92t5QBzhA9LB5rI4n8Vm7lD8J9g5x49MrfJMtEFReDYF3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: X+DXgdabR5yHw1WyZo37Dw==
X-CSE-MsgGUID: EJS8yzuWT7y0WSMl8q0qiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28132360"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="28132360"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:31:49 -0700
X-CSE-ConnectionGUID: ImwsUHIrTfCItyPuDj59VA==
X-CSE-MsgGUID: xwa6bGxBRSKS/gD0X0eO7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; 
   d="scan'208";a="77732644"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 04:31:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t0JIe-00000002sgy-1N2j;
	Mon, 14 Oct 2024 14:31:44 +0300
Date: Mon, 14 Oct 2024 14:31:44 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, Robert Mast <rn.mast@zonnet.nl>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 3/4] media: atomisp: mt9m114: Add missing mutex_init()
 call
Message-ID: <Zw0BIPSWN_vR48xf@smile.fi.intel.com>
References: <20241013154056.12532-1-hdegoede@redhat.com>
 <20241013154056.12532-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013154056.12532-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Oct 13, 2024 at 05:40:55PM +0200, Hans de Goede wrote:
> The input_lock was not being initialized, fix this.
> 
> Also switch to devm_kzalloc() for the main driver data struct, so that
> devm_mutex_init() can be used for this.

...

>  		ret = mt9m114_s_config(&dev->sd, client->irq, pdata);
>  	if (!pdata || ret) {

Hmm... What is the ret value when no pdata is provided?

>  		v4l2_device_unregister_subdev(&dev->sd);
> -		kfree(dev);
>  		return ret;
>  	}

...

>  	ret = atomisp_register_i2c_module(&dev->sd, pdata);
>  	if (ret) {
>  		v4l2_device_unregister_subdev(&dev->sd);
> -		kfree(dev);
>  		/* Coverity CID 298095 - return on error */

This comment is useless. But it seems we tend to drop this code completely in
the future.

>  		return ret;
>  	}

-- 
With Best Regards,
Andy Shevchenko



