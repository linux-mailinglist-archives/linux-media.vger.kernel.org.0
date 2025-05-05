Return-Path: <linux-media+bounces-31693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3391AAA8E94
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 10:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03CBD188A22C
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 08:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2381F8730;
	Mon,  5 May 2025 08:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKxpMGUg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90DC1DDA14;
	Mon,  5 May 2025 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435138; cv=none; b=BbWAqNQkbXvd1bGPVCwvp/Jj2VX9zjWyKVmQoEpeY2Xq2OpZJfF348ZhER9s4gXDuJH1EUjC3VuglIPOdKu5d7pQxweC5nop0W+9M7l9VzoK6lgLNAi7CR6Fz8kr/3m9/389whyku0zAg8+tgF61U63bOsejoJsvcdIOvB+Bu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435138; c=relaxed/simple;
	bh=9zluxNSbXALMLbz2BBvW6HxB3hk8PNHobc7RsItkZOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gC4p1LeMaXw0ox3DulFY+dEK/xaNuaQJ7WZqrm+x9P2wEA6EkmJrWYdyKya8HQty60FW5aARnQj37OUS3mZ7TVX8xP2g2b9yaWkqflBEO0JuHDFWUaDRZs8G0hOeWTpcH0Y4KbJkTmF7aKTmkv3YQzCL/6kuw+97FdQVfAL/eUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKxpMGUg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746435138; x=1777971138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9zluxNSbXALMLbz2BBvW6HxB3hk8PNHobc7RsItkZOg=;
  b=RKxpMGUgb/w0CWCCMCnwrIhlPdqOXcK6DjfUOX24FnCz/xGgBZTzVTev
   nOfkZkyloHzCZJxu/iivw+QDnr6Cybz7e0O9bz80YhGWsTqcAu86p6zaH
   loxRvxwLsguifwAnBkEZP2XHSUjegdGIHkiKQwIbenAce9CTgMA7Am0MX
   5a1pAJU1X7l6nv0qHq9/wz1UBxxBvBYlD+V6xdTwfpOkX137UjZ7XFnni
   xIjglw8gZDMH/1YFGWgTYSUm4Q3/ZdRk4PvhyvfAy9xbdS0XUsK+qAnlw
   vqa6anXqnNsiRAFWSv6EksFNRN/qpJfWbehtD2BCs9US9stZbD9Kd1gO8
   Q==;
X-CSE-ConnectionGUID: vm+9bIR3S12sDx+ZXz2xrQ==
X-CSE-MsgGUID: Rsz1xXV3RMuU8UWF2NITIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="65438693"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="65438693"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:52:13 -0700
X-CSE-ConnectionGUID: E1k0s4QjRsCs+ckMnHFb9Q==
X-CSE-MsgGUID: Y9XwPmxVQzexINjL9bBPdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="139983927"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.252])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 01:52:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F40C120B57;
	Mon,  5 May 2025 11:00:34 +0300 (EEST)
Date: Mon, 5 May 2025 08:00:34 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: benjamin.mugnier@foss.st.com, mchehab@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	tomm.merciai@gmail.com
Subject: Re: [PATCH v8 2/2] media: i2c: Add driver for ST VD56G3 camera sensor
Message-ID: <aBhwIl7G60EJ9k9F@kekkonen.localdomain>
References: <20250502201849.12588-1-sylvain.petinot@foss.st.com>
 <20250502201849.12588-3-sylvain.petinot@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502201849.12588-3-sylvain.petinot@foss.st.com>

Hi Sylvain,

Thanks for the update.

On Fri, May 02, 2025 at 10:18:49PM +0200, Sylvain Petinot wrote:
> +static int vd56g3_check_csi_conf(struct vd56g3 *sensor,
> +				 struct fwnode_handle *endpoint)
> +{
> +	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
> +	u32 phy_data_lanes[VD56G3_MAX_CSI_DATA_LANES] = { ~0, ~0 };
> +	u8 n_lanes;
> +	u64 frequency;
> +	int p, l;

unsigned int. There are more cases where you have a loop variable that
doesn't need to be signed. Please address these in a follow-up patch.

-- 
Sakari Ailus

