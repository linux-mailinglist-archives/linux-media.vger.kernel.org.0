Return-Path: <linux-media+bounces-35808-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F63CAE6C7E
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 18:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 448991C209BC
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 16:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB852E2F15;
	Tue, 24 Jun 2025 16:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAwfFdCb"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E62E1759;
	Tue, 24 Jun 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782905; cv=none; b=d6tTPjIGtn96/mrCNywEZrWopZThKJtbQebiL1hTIAHQvT+zSTKn6sqv75xsb7ly4gZVPyxibLht6QLxaC7DgLqvUUh2QjxYn6Ctf/b7Xza1Oi0MKzt1yUPzDTDFi70/S/WLTW0rvtVh9p5Zjpo/pYsxIbNTEWURCX4Cyy4gcXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782905; c=relaxed/simple;
	bh=nP0aUmfHfoTLo2wVCHBobujEMyBJGemPJITa+RyCb1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFf1PEzGrHtNY1okCRhMe8iRhhfd04g22OjX9CdR4s8IP3C3Mr7lxmXxV5Gvh7wnLBboGxs4llr2Kj7WTqnyTASznKTn8beo5GBnWxVfX3zFp2YY6dwiTlvmyzLk4rpWLvEDm4l4pzofGutrOg9dV5CLNC0VJw+6kEhVp14EwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAwfFdCb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750782903; x=1782318903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nP0aUmfHfoTLo2wVCHBobujEMyBJGemPJITa+RyCb1c=;
  b=gAwfFdCbj0zrTNzyeOekadOyqXFFIQYpFUnLM3LKIl5oIYS4AW/3PgCf
   VRZCS3udL1rR94cAna/KsFouAtqKFE8HLj+RAT0DAjlDBLxQ1eskuqHu7
   TwR1BVpTtfklFAI4lH/9BrsJ+CVmsitbxg0qQbuVd/bZIW8ju0mgckbME
   I5ULln/Y5T/G6XPCwYpEMhfWhkaqOP1u9L9uGKlzqL434yJhvXr6VHwKN
   iw8BHMBwhZAdgGH6Aqid2N4lx+cQGmf9pxkZPe0uaQ3I72vmN77QQ7rlk
   wSSIwyYvZIidMrb6ecK8GTux6osWJkdVOYfhapjjfcYu48d/UA2+TP0DC
   w==;
X-CSE-ConnectionGUID: 0kh+EjShQdCu/3kUURezVQ==
X-CSE-MsgGUID: dXOyus2hQF+/xZEtdJrAHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56704625"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="56704625"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 09:35:02 -0700
X-CSE-ConnectionGUID: ABr/3/C6TzqiHEFM5Ph9RA==
X-CSE-MsgGUID: Ps9F2R4lQ9uqiswuj49eyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; 
   d="scan'208";a="182848015"
Received: from vpanait-mobl.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.116])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 09:34:59 -0700
Date: Tue, 24 Jun 2025 18:34:51 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	"Nirujogi, Pratap" <pnirujog@amd.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org, 
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com, jai.luthra@ideasonboard.com, 
	tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com, 
	dantony@amd.com, vengutta@amd.com, Svetoslav.Stoilov@amd.com, 
	Yana.Zheleva@amd.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <aslodzamkbjm6n6oherakch2nyltl6mnncl4mzr4o774oolr4t@hpegah7dq72g>
References: <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
 <425j7c6xvbbatdhxgjgjawzwfnjmjetg6rpnwfudbtg6qz6nay@dy5ldbuhtbvv>
 <aFp7tuXkU1jayPum@kekkonen.localdomain>
 <aFp78tqHhe_IhV6d@kekkonen.localdomain>
 <20250624102745.GG15951@pendragon.ideasonboard.com>
 <nixg4efp3zkdpd6h7kp6wkvam63batpoknov2nkgu36voks6bk@gzuackzl3l5g>
 <aFqQEwdzSY123xps@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFqQEwdzSY123xps@kekkonen.localdomain>

Hi Sakari,

On Tue, Jun 24, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:

[...]

> 
> I'm in favour of the latter but both should be workable.
> 
> Speaking of return values, devm_clk_get_optional() may also return
> -EPROBE_DEFER. That needs to be handled.
> 

Ack.

> And further on -EPROBE_DEFER, I think the helper should return
> -EPROBE_DEFER if the "clock-frequency" property doesn't exist on non-OF
> nodes. That signals the required software nodes required on Intel Windows
> definitions/ipu-bridge or AMD systems aren't in place yet so really probing
> should be deferred. This would allow removing the hacks that return
> -EPROBE_DEFER in sensor drivers when no graph endpoint is found.

device_property_read_u32() returns the following:

 * Return: number of values if @val was %NULL,
 *         %0 if the property was found (success),
 *	   %-EINVAL if given arguments are not valid,
 *	   %-ENODATA if the property does not have a value,
 *	   %-EPROTO if the property is not an array of numbers,
 *	   %-EOVERFLOW if the size of the property is not as expected.
 *	   %-ENXIO if no suitable firmware interface is present.


Do you mean something like this in the helper:

if (ret == -ENODATA && !of_node)
	return ERR_PTR(-EPROBE_DEFER);

--
Kind Regards
Mehdi Djait

