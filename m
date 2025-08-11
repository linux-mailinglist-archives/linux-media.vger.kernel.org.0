Return-Path: <linux-media+bounces-39427-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DC9B2081E
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 13:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF2383BCE29
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 11:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713042D320E;
	Mon, 11 Aug 2025 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ha/ZKdab"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B270B21B9C1;
	Mon, 11 Aug 2025 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912795; cv=none; b=AEzWnt3rtB2w6FgLNAUumakFXLx3jCbYYw3TwjjNWYK42zzJ3oVW/7arxQKCrCEIHVGkZTIzsQfbjvZzxX/76QpilaCkof6o2TAdxjwEq3OhWsRZ3Ox0aYpKYPU6NuRUEiN6ZxIED9sOBY1zTCwqqaSpxCHJN9PqI5JWUM9oaMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912795; c=relaxed/simple;
	bh=uGFqcupnRh+G5hodseUI1PgPLyyBa4cZOD0tAuSJPpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4gKQyFn4mGJGiqQFnMOi6qoTNIu/x9CYo8ToaxrasZMBXyd2zXNkw17HoDgzWqClX9V30E4iojbIOdtJzuF0Ngn+91+IqFriDx+ThwalSTSTGiceycac1ybAHhz9hEp0Q2MO9TNkmLdW2/GbMVHOaZaWeIwUEwa3nS4BFoYhOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ha/ZKdab; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754912795; x=1786448795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uGFqcupnRh+G5hodseUI1PgPLyyBa4cZOD0tAuSJPpk=;
  b=Ha/ZKdabvqQdNbeZBFplklpbPzswhmWYrUB4nmXrX/7SLgP8/hsgm/dR
   jkYOLXGJxN6pDviqw11hg4sYGtQXie3DIfNUxdHH93j/oyTB8sI4yTQS2
   aWpUUFV8Ob9P+PZg4vhKx3t6J9Vr/geuVVPXTfrLe8Ov362Bfqun8xPIe
   4HDa3+uyWo6h3KS/0U2U6BsaADYlFY4EFQq8NGr0JlYKqDYsVqT3NpU0u
   ZLI4iX/VUqlXCVctPry9JGpIvaqq/mdRDWwo7fsbRyLcy0SRMrtSnlvCo
   2hgj2eglN0PkZ1c4c6oYXm+OLAeK7zt1WLe9ZyxwXFZr/jjbJsmnjLng2
   A==;
X-CSE-ConnectionGUID: NglUrohpTguJoD/i1VIFmQ==
X-CSE-MsgGUID: wK1tjtuvRbiivZx8SECq1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="79734308"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="79734308"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 04:46:33 -0700
X-CSE-ConnectionGUID: w03Yw9omS52rSsMdbaNHJQ==
X-CSE-MsgGUID: gigyuDeESLSweFmec4ChDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165385892"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 04:46:29 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 233ED11FC37;
	Mon, 11 Aug 2025 14:46:27 +0300 (EEST)
Date: Mon, 11 Aug 2025 11:46:27 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
Message-ID: <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <aIclcwRep3F_z7PF@kekkonen.localdomain>
 <b033bf6c-c824-4f6d-8025-b6542ea8f35f@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b033bf6c-c824-4f6d-8025-b6542ea8f35f@amd.com>

Hi Bin,

On Tue, Jul 29, 2025 at 05:12:03PM +0800, Du, Bin wrote:
> Many thanks Askari Ailus for your careful review
> 
> On 7/28/2025 3:23 PM, Sakari Ailus wrote:
> > Hi Bin,
> > 
> > On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
> > > ISP firmware controls ISP HW pipeline using dedicated embedded processor
> > > called ccpu.
> > > The communication between ISP FW and driver is using commands and
> > > response messages sent through the ring buffer. Command buffers support
> > > either global setting that is not specific to the steam and support stream
> > > specific parameters. Response buffers contains ISP FW notification
> > > information such as frame buffer done and command done. IRQ is used for
> > > receiving response buffer from ISP firmware, which is handled in the main
> > > isp4 media device. ISP ccpu is booted up through the firmware loading
> > > helper function prior to stream start.
> > > Memory used for command buffer and response buffer needs to be allocated
> > > from amdgpu buffer manager because isp4 is a child device of amdgpu.
> > 
> > Please rewrap this, some lines above are quite short.
> > 
> Thanks, the line after the short line is supposed to be a new paragraph?
> Should we put all the description in one paragraph?

One or more paragraphs work fine, but a new paragraph is separated from the
previous one by another newline.

...

> > > +	void *cpu_ptr;
> > > +	u64 gpu_addr;
> > > +	u32 ret;
> > > +
> > > +	dev = ispif->dev;
> > > +
> > > +	if (!mem_size)
> > > +		return NULL;
> > > +
> > > +	mem_info = kzalloc(sizeof(*mem_info), GFP_KERNEL);
> > > +	if (!mem_info)
> > > +		return NULL;
> > > +
> > > +	adev = (struct amdgpu_device *)ispif->adev;
> > 
> > Why the cast?
> > 
> > adev isn't a great name here as it's usually used for struct acpi_devices.
> > 
> In the next patch, will use new helper function for this and will no longer
> use amdgpu_device

Use correct types when you can; either way this doesn't seem to be changed
by the further patches in the set.

...

> > > +static int isp4if_gpu_mem_free(struct isp4_interface *ispif,
> > > +			       struct isp4if_gpu_mem_info *mem_info)
> > > +{
> > > +	struct device *dev = ispif->dev;
> > > +	struct amdgpu_bo *bo;
> > > +
> > > +	if (!mem_info) {
> > > +		dev_err(dev, "invalid mem_info\n");
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	bo = (struct amdgpu_bo *)mem_info->mem_handle;
> > 
> > Why do you need to cast here?
> > 
> In the next patch, will use new helper function for this and will no longer
> use amdgpu_bo

Not quite, on top of this patch number 6 adds more of the same.

...

> > > +static struct isp4if_cmd_element *
> > > +isp4if_append_cmd_2_cmdq(struct isp4_interface *ispif,
> > > +			 struct isp4if_cmd_element *cmd_ele)
> > > +{
> > > +	struct isp4if_cmd_element *copy_command = NULL;
> > > +
> > > +	copy_command = kmalloc(sizeof(*copy_command), GFP_KERNEL);
> > > +	if (!copy_command)
> > > +		return NULL;
> > > +
> > > +	memcpy(copy_command, cmd_ele, sizeof(*copy_command));
> > 
> > kmemdup()?
> > 
> Kmemdup is to allocate memory and copy, can't be used here.

Isn't that what you're doing above?

> 
> > > +
> > > +	guard(mutex)(&ispif->cmdq_mutex);
> > > +
> > > +	list_add_tail(&copy_command->list, &ispif->cmdq);
> > > +
> > > +	return copy_command;
> > > +}

-- 
Regards,

Sakari Ailus

