Return-Path: <linux-media+bounces-37060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B51F9AFC511
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 10:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D462A42533D
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 08:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5353929B8E8;
	Tue,  8 Jul 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bh1npLJj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A6D23BD09
	for <linux-media@vger.kernel.org>; Tue,  8 Jul 2025 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962099; cv=none; b=NzVWVPQNxAZByFICZz/yneXcRSi78nTT9vP7cf3cazEswHaQ3dUMco3sHhBnxy8Fowh/nD7L1yNUsKwoLVFGEE5inx4bh4yeijBaMtQwS5XLRYEzZNQu/su1AS2AlgLGZ/lzGZ4OfuNK7yFazB5nLuQiE1ogmkMeQzcYiBxhfP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962099; c=relaxed/simple;
	bh=RomZbumwrkjkdxepOSDXl4VOV74LbbRJr/ip8RnvUFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCKsGo3KFS3nAXhVRlX0LCHtkLWQkEtxYZnSUI70NdD3g2FG+5fZJgRl6Wiy9j3zNZO3HBl8ljaORnFU6ZFF0hlOFgw2S+M6Pty8ZY4+bLnER96IKAPSYnncTxkl5R7JsXC+svKZRZj/6bGoyGu7JICXcL/kHtRy/9UA4zlDGow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bh1npLJj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751962098; x=1783498098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RomZbumwrkjkdxepOSDXl4VOV74LbbRJr/ip8RnvUFc=;
  b=bh1npLJjjb2cXtGJfpL0UBGNR91alBzs1DlSIpMI/k719ZDDbshC1/P6
   EBjDa4uXqlawv4HZ0D7BDxIqXqnyAK0iz3yD9scbEhPJYnqfBqk3BOltx
   q3eNrjHh4k7KmyyPvIw0TMppbt+siYvk4dfmGkKY73pjPt/d1+XXlYoVC
   2IRtNlz6+LPIleWYEzG/s9/AJdgMxrMjP4nPLwkowKRvrVBU5yDNShnjo
   JEEIJGXtKXt6Xfh14Whi8uGjildVkhYqzG5OflVzS0IFHY2dL27euzjLT
   zdLPmTFO053WG99doWReP7HHjxRFBOQD+XJPMCQw2coVzOS74RJ4GT0Pg
   Q==;
X-CSE-ConnectionGUID: ZNlRIz5gQMW2YFq0WZ7HXA==
X-CSE-MsgGUID: Y3NvWOXkQSaHx75qr8ZJWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53399817"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="53399817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:08:17 -0700
X-CSE-ConnectionGUID: +xYXhLjFQdO3EUw9e2Gmfg==
X-CSE-MsgGUID: x2DwpbP/Q0CNqjlnlqHbiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="156018193"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.230])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:08:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D3ED111F8A6;
	Tue,  8 Jul 2025 11:08:13 +0300 (EEST)
Date: Tue, 8 Jul 2025 08:08:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH resend] media: i2c: Automatically select common options
 for lens drivers
Message-ID: <aGzR7dj1zUXGavsW@kekkonen.localdomain>
References: <20250703150315.25187-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703150315.25187-1-hansg@kernel.org>

Hi Hans,

Thanks for the patch.

On Thu, Jul 03, 2025 at 05:03:15PM +0200, Hans de Goede wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> In commit 7d3c7d2a2914 ("media: i2c: Add a camera sensor top level menu")
> a top level menu was added for sensor drivers so that all sensor drivers
> would depend on I2C and so that MEDIA_CONTROLLER, FWNODE and

V4L2_FWNODE here. I've fixed that while applying it.

-- 
Regards,

Sakari Ailus

