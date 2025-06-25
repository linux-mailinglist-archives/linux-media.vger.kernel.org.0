Return-Path: <linux-media+bounces-35844-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A8EAE76C9
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 08:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DEF23AFDB6
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 06:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40D61F2BA4;
	Wed, 25 Jun 2025 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1Eqvrpf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E4307498;
	Wed, 25 Jun 2025 06:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831908; cv=none; b=BTmNuxeoF+Ujur5N2bWX75OyNNL+6C6fOZEHtrhSUuThAZ/UGcNif8B1Sx0Trb/xLYVAHS2/DKOjpbc0hPppT7Bo8KjIDsUaHCMK7gZ/3tWw3p7ftpcmBy3/Ewj/POvukXCX/SbPdUECvB3w3c+FeiXnYmdFsRidXl94oDl6VNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831908; c=relaxed/simple;
	bh=BLRL/tfRl0xXr0I6Dv0V4j/7kZhCaRjPCxscsQX+91I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q875+fGSdwArwUad5T8YxHOXrCcSupBBMbJdc90Ux3fwS8hHuZwB1NRqsbc5EbnVHPEN/dUNVwhq3Fy2/B04dVyuG9lvfVzuY5zbT+mNmMAhO/1srwRuB5c3kAG37l7K9r2zd0gWp3MpqHNORJSf04tOmz0eOMAaUGVue5qT7VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1Eqvrpf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750831906; x=1782367906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BLRL/tfRl0xXr0I6Dv0V4j/7kZhCaRjPCxscsQX+91I=;
  b=W1EqvrpfD02qMiTw5zZBXuzrYdptBfMoV1Gff9hNiLSqr/IvV4g7Q9s2
   rNYfJ5jhoUbNSBeYX66lGjiWp0eBoNJ+BjoG3mz4LWfvVRFOggHujJhrY
   qRtqEkgSK0PjX9Qu+IIBmnVWEp/JuHdeEk2ZJdtM/89gIwKr3bDL94Cqy
   aVEdGVJq2fC/nxo6onGH1nm9D1UfAIeQyZEavGjrIWhoEJrPAh9xbrtKq
   OiFSFE8vgznDEZl2Xq7sg5aoCzAiRmEXD+U6A2XiJSf9ulGZmOaToV/L5
   PzMDKaXeMJkTN5y+IpuXsnVwXlD/JtZB57/NIPUFW01aewmOA6qHhs1Ua
   A==;
X-CSE-ConnectionGUID: Y3kqi7PnSKGl7khX6OR3JQ==
X-CSE-MsgGUID: wh30H9s4RviyPp6D9DNAXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52203458"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52203458"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:11:45 -0700
X-CSE-ConnectionGUID: fhAeAE6jRWev4DSNMcxAng==
X-CSE-MsgGUID: aGWvhxcmSt6GuB2BuoM4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152298025"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.155])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:11:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BA76F11FAB3;
	Wed, 25 Jun 2025 09:11:37 +0300 (EEST)
Date: Wed, 25 Jun 2025 06:11:37 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Nirujogi, Pratap" <pnirujog@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <aFuTGe1MnXNyvP3u@kekkonen.localdomain>
References: <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
 <aFp7tuXkU1jayPum@kekkonen.localdomain>
 <aFp78tqHhe_IhV6d@kekkonen.localdomain>
 <20250624102745.GG15951@pendragon.ideasonboard.com>
 <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>
 <aFqQEwdzSY123xps@kekkonen.localdomain>
 <aslodzamkbjm6n6oherakch2nyltl6mnncl4mzr4o774oolr4t@hpegah7dq72g>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aslodzamkbjm6n6oherakch2nyltl6mnncl4mzr4o774oolr4t@hpegah7dq72g>

Hi Mehdi,

On Tue, Jun 24, 2025 at 06:34:51PM +0200, Mehdi Djait wrote:
> Hi Sakari,
> 
> On Tue, Jun 24, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:
> 
> [...]
> 
> > 
> > I'm in favour of the latter but both should be workable.
> > 
> > Speaking of return values, devm_clk_get_optional() may also return
> > -EPROBE_DEFER. That needs to be handled.
> > 
> 
> Ack.
> 
> > And further on -EPROBE_DEFER, I think the helper should return
> > -EPROBE_DEFER if the "clock-frequency" property doesn't exist on non-OF
> > nodes. That signals the required software nodes required on Intel Windows
> > definitions/ipu-bridge or AMD systems aren't in place yet so really probing
> > should be deferred. This would allow removing the hacks that return
> > -EPROBE_DEFER in sensor drivers when no graph endpoint is found.
> 
> device_property_read_u32() returns the following:
> 
>  * Return: number of values if @val was %NULL,
>  *         %0 if the property was found (success),
>  *	   %-EINVAL if given arguments are not valid,
>  *	   %-ENODATA if the property does not have a value,
>  *	   %-EPROTO if the property is not an array of numbers,
>  *	   %-EOVERFLOW if the size of the property is not as expected.
>  *	   %-ENXIO if no suitable firmware interface is present.
> 
> 
> Do you mean something like this in the helper:
> 
> if (ret == -ENODATA && !of_node)
> 	return ERR_PTR(-EPROBE_DEFER);

I think -EINVAL is returned if a property doesn't exist on ACPI, same on
software nodes. On software nodes you could also have -ENODATA if the
property has no value. So test both of these?

I'd also test !of_node first.

-- 
Regards,

Sakari Ailus

