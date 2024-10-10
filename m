Return-Path: <linux-media+bounces-19355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F029988C6
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 16:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 333A41C23ECA
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 14:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1B11CB515;
	Thu, 10 Oct 2024 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA4TS5az"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F0B1CB326;
	Thu, 10 Oct 2024 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569225; cv=none; b=n/Zc/dyEStLP3tJByw/12tk7p8rI0H7K5c8r13RXQjlmGcY/wmiw88g8DZRuUGQLDicoCy6+LmbKQf92r2zc3uOeoFU6rYdg1lYmyrqMuKcrNDuDUs8i7uAdDMXXdeDbCDsbru+RGtD7y4WtRRCvhTzzk/gJHt4vzmtMlKYcunM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569225; c=relaxed/simple;
	bh=+VIJR/jRN35W8TUo7LIlgUYGvs9YkZvUmGdSwGjTx2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htSQ2eViRtHtqmeL41U1VHLUqO/Scq8ikh8g0/bsD2H1lTPDe7BnkAheH5UztsfTDMe5vxMoBZUNxWKL30x5h+C+xCw06GBwMJkVTkeNRitskmsf2ZTf/7QSWWy2NSxnOh/pk+o2/bKdoDqDO0G/rMRUC77kp2gwhSOCUg3jKXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LA4TS5az; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728569225; x=1760105225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+VIJR/jRN35W8TUo7LIlgUYGvs9YkZvUmGdSwGjTx2c=;
  b=LA4TS5azzqR+ul5DWMEgjz0ZyCg5+ArZdlL9jJiaoMlwJanOibYPBfH5
   izTxQ1W9xAPmRLfyBdcrz7tG2shcWVtvJblzte3QtB20MPYEcWQY98sVQ
   BXoiRzOxqTICtCsuj8mxjum3/RByhV46gEBQT90iGd+X4nQozocMnwjAB
   mIn8D0tYe7CjTLCjTW9/ahcrHIO6B3dv/LKUd/9uOE6HdqXnQK4fp24K0
   JZwGQraorH1tHl8bM1SPkZYMaWi9nwOxfN6C0/ranuStxOsOgcwrKwcvS
   bsfsU/uJ9LeKfTcldYKsfJqmcjP1bX/id4MdxeNtHykgmZeC0UjyH0Uc0
   Q==;
X-CSE-ConnectionGUID: 9weIRhmVSeKRiwCScBH6VA==
X-CSE-MsgGUID: kp+87TyFR5G1yedn5GB5OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28065196"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="28065196"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 07:06:47 -0700
X-CSE-ConnectionGUID: silB9qaRRry0dLuH+nGr2w==
X-CSE-MsgGUID: LhyR3bcRSFOB7iqNiCs7IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="81184419"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 07:06:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sytoQ-00000001YYZ-3o2I;
	Thu, 10 Oct 2024 17:06:42 +0300
Date: Thu, 10 Oct 2024 17:06:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 13/13] media: i2c: ds90ub953: Add error handling for i2c
 reads/writes
Message-ID: <ZwffcuhmpndoCXrD@smile.fi.intel.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
 <20241004-ub9xx-fixes-v1-13-e30a4633c786@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-ub9xx-fixes-v1-13-e30a4633c786@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 04, 2024 at 05:46:44PM +0300, Tomi Valkeinen wrote:
> Add error handling for i2c reads/writes in various places.

...

> +	ret = ub953_write(priv, UB953_REG_CLKOUT_CTRL1, clkout_ctrl1);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

This is just a more verbose version of

	return ub953_write(priv, UB953_REG_CLKOUT_CTRL1, clkout_ctrl1);

...

> -	ub953_write_clkout_regs(priv, &clkout_data);
> -
> -	return 0;
> +	return ub953_write_clkout_regs(priv, &clkout_data);

...and seems you use that pattern.

-- 
With Best Regards,
Andy Shevchenko



