Return-Path: <linux-media+bounces-50178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20707D00578
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 23:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFE3C301E9B3
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 22:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E150F2E54D3;
	Wed,  7 Jan 2026 22:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1EjH5IU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4029D293;
	Wed,  7 Jan 2026 22:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767825479; cv=none; b=g9edc42vBU3zjwJ6A3mpavwexfodUC+SOxU4ZMM7rEXVQ4sOJNDjO5XE/+ZIT9hpVCRRllSYf9YwVTpoPhyAGr9cvQhGeXk3XkCV3IwwD+GIXxo5Zp+lH/TIRrWd4p7UvL9wWzJoOeq5zOVyY3LK9eOMheizxQW19rwfNay1D7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767825479; c=relaxed/simple;
	bh=9D0STyhS/zXMhjD2Uo7KYEXiOXf3q1ZDZfpciqvNnM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2eRTw1Hct2lMRejXXe6oimgXexyGJI0iY0uQDzrb6guRlypXQpBmXDYJiS+S4/UKceHqEKoGtQ8pajXB6ecifXuE1Hq1IFJ95arLZlIWjMtmYXzSy6xg1f6F2RA+J/19Oellensebx5Fvt+/bGhvAj2O6+PdS3hu0QPjYweJp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1EjH5IU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767825478; x=1799361478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9D0STyhS/zXMhjD2Uo7KYEXiOXf3q1ZDZfpciqvNnM0=;
  b=n1EjH5IUORzNsg/UusNEay43TlfkK/flOo0uyxJ1hoZTtwqDusSc+vTa
   vp+8rNWz9KbucAk4g8UhTikU+lzmog3YjDWsTvuKedbHJcv8a7o6AxEAB
   fqRxccShuS//y93nIDqJR7fKFTl9LFg9TmpWmRMNwzo7HsD6movOsiur5
   0zwEWe/ZLZpj2wxMq6i1JNMtfKYH3yv3tKb89udlfDn/NHvSdWGuPe+nP
   9Rn70tCphEdBf27DkJ1HlNvB3WWcyBXdx9EHXELRCOwWMZnTtGPsYr2xu
   cHqwirfMvh+bq+ENY2m8jo8rQFLBH/o3IHH4nYAiwV9j76Xh6HWHjjjXn
   A==;
X-CSE-ConnectionGUID: g0dueF1vSXG1/zxxy2PO/A==
X-CSE-MsgGUID: Y4IwEOEaS82xDZ6JFX6hHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69116148"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="69116148"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 14:37:57 -0800
X-CSE-ConnectionGUID: jL3xMijXR+2rQpWz/NueiA==
X-CSE-MsgGUID: tqUVzeYAQlCdQYj94bczEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="207888828"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.174])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 14:37:54 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 02282120D05;
	Thu, 08 Jan 2026 00:38:07 +0200 (EET)
Date: Thu, 8 Jan 2026 00:38:07 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
	dave.stevenson@raspberrypi.com, jacopo@jmondi.org,
	mchehab@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	hverkuil+cisco@kernel.org, johannes.goede@oss.qualcomm.com,
	hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] media: i2c: ov5647: Switch to using the
 sub-device state lock
Message-ID: <aV7gT5j5JVheV6WW@kekkonen.localdomain>
References: <20260101103001.207194-1-xiaolei.wang@windriver.com>
 <20260101103001.207194-3-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101103001.207194-3-xiaolei.wang@windriver.com>

Hi Xiaolei,

On Thu, Jan 01, 2026 at 06:30:00PM +0800, Xiaolei Wang wrote:
> @@ -1297,9 +1285,16 @@ static int ov5647_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		goto power_off;
>  
> +	sd->state_lock = sensor->ctrls.lock;
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret < 0) {
> +		ret = dev_err_probe(dev, ret, "failed to init subdev\n");
> +		goto power_off;
> +	}
> +
>  	ret = v4l2_async_register_subdev(sd);

v4l2_async_register_subdev() needs to be called before enabling Runtime PM
below. Not a fault of this patch but it'd be nice to fix that. 

>  	if (ret < 0)
> -		goto power_off;
> +		goto v4l2_subdev_cleanup;
>  
>  	/* Enable runtime PM and turn off the device */
>  	pm_runtime_set_active(dev);

The first patch doesn't seem to apply; I've taken earlier a set of ov5647
patches from Dave, could you rebase this on them? They're in my "cleanup"
branch here
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=cleanup>.

-- 
Kind regards,

Sakari Ailus

