Return-Path: <linux-media+bounces-24606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18381A08E09
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 11:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ACE83A62CA
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0096A20B205;
	Fri, 10 Jan 2025 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IN6A5or6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAC2080CB
	for <linux-media@vger.kernel.org>; Fri, 10 Jan 2025 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736505004; cv=none; b=lkTsq6i1JEmuLDdHe0GSuh2Q4rZEkCDSmZso7ySq1Zv0ISsKuqk6ZE4XAS+pKKJAy07hE0RJwHtjt0PmFMSHCwSZY7T1MqYaOPgYW9L+NqWT0E/r6WI7QnJ5jvbf5oQHFTp627Zh/Giot83eBrWxSJl4y3kRln/Bi92z7vZ8nFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736505004; c=relaxed/simple;
	bh=/X6bdYOg/gUOXjqwBd7R9cM7gcRHAPufzg+Le9kLfSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYWK7dkbDjzwURkiULDG93t2UxQRPmKiVKhfb6cv/Ft6nP6NVR/FOWY+EBHZOlQ8PRdpUP3mG5BctzTd0PZjmH0+fHvwxql9W6UEwm6095qcRpwJbmD0Y/OyFJl4ozm8AZHv054eEG/cAlwEOV1ozZrN80x8bSCr1lTX57kOdow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IN6A5or6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736505003; x=1768041003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/X6bdYOg/gUOXjqwBd7R9cM7gcRHAPufzg+Le9kLfSU=;
  b=IN6A5or6Aco1EarUMx214LWk9eT/z2xUEe085WTWbEYPXj+Jbw1JXi9g
   RD289xlovMHzZumC8NUON+zin5N9xcQ/lrkI94ja5qASdPb6OX/xkIRgh
   UVnEUHqfUHR2tbLPgbNCkgTPiGAdnqtdlwu0+uah7fQcUrXCFgFmXqgok
   URIQOeP/HlWh6E0iBreeIAXoYcXc9+gGLVWGUQZTlxNhudim7nFDB+635
   NT7cxK5khCs+yd0VZXf+o0P74Fj0nKuoSNxlAnXWLKNs71Yge66SXRxDE
   LuxMyU962+UvDwsMQQALf91hyaXcdNnrvzwoY7wWQuszMMELUVKjoZyJ9
   Q==;
X-CSE-ConnectionGUID: /zd9CfpHQuScoSsoUcBpvw==
X-CSE-MsgGUID: vgyR3yF5SaitfZO90MX8/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54211335"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="54211335"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:30:01 -0800
X-CSE-ConnectionGUID: pqBoC+2dQCGyDfby64pMlg==
X-CSE-MsgGUID: 1JuBxZ1ARRe8nuaHIfkfLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="103484868"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:30:00 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id AEAA812049D;
	Fri, 10 Jan 2025 12:29:56 +0200 (EET)
Date: Fri, 10 Jan 2025 10:29:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 08/10] media: ov08x40: Add missing
 ov08x40_identify_module() call on stream-start
Message-ID: <Z4D2pDD4AY7zENkH@kekkonen.localdomain>
References: <20241220144130.66765-1-hdegoede@redhat.com>
 <20241220144130.66765-9-hdegoede@redhat.com>
 <Z3_7TAXXUlqkUcwY@kekkonen.localdomain>
 <d807cb98-40d0-41ea-8f7e-9ae51b05822f@redhat.com>
 <Z4DKjLBGP_bZpHjq@kekkonen.localdomain>
 <a084ccf0-6b73-4e83-9310-59a618e82a28@redhat.com>
 <d12a9f38-2ec9-4174-907a-00ff613e61c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d12a9f38-2ec9-4174-907a-00ff613e61c0@linaro.org>

Hi Bryan,

On Fri, Jan 10, 2025 at 10:23:40AM +0000, Bryan O'Donoghue wrote:
> On 10/01/2025 08:43, Hans de Goede wrote:
> > Hi,
> > 
> > On 10-Jan-25 8:21 AM, Sakari Ailus wrote:
> > > Hi Hans,
> > > 
> > > On Thu, Jan 09, 2025 at 10:23:41PM +0100, Hans de Goede wrote:
> > > > Hi,
> > > > 
> > > > On 9-Jan-25 5:37 PM, Sakari Ailus wrote:
> > > > > Hi Hans,
> > > > > 
> > > > > On Fri, Dec 20, 2024 at 03:41:28PM +0100, Hans de Goede wrote:
> > > > > > The driver might skip the ov08x40_identify_module() on probe() based on
> > > > > > the acpi_dev_state_d0() check done in probe().
> > > > > > 
> > > > > > If the ov08x40_identify_module() call is skipped on probe() it should
> > > > > > be done on the first stream start. Add the missing call.
> > > > > > 
> > > > > > Note ov08x40_identify_module() will only do something on its first call,
> > > > > > subsequent calls are no-ops.
> > > > > > 
> > > > > > Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > > > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > > 
> > > > > I'll add:
> > > > > 
> > > > > Fixes: b1a42fde6e07 ("media: ov08x40: Avoid sensor probing in D0 state")
> > > > > Cc: stable@vger.kernel.org
> > > > 
> > > > Sounds good, thank you.
> > > > 
> > > > That is when you say "I'll add", you mean you'll add those tags
> > > > while merging this series, right ?
> > > > 
> > > > Or do you want me to the tags in a v3 series?
> > > 
> > > No need for v3. Thanks!
> > > 
> > > Are there other patches not merged for the driver, besides this set? No?
> > 
> > Bryan was talking about a fix from him which also needs to be merged:
> > 
> > https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/f10539a3cbe5c072829b082683f0d1393a7e50dc
> > 
> > But I cannot find that in the lore archives.
> > 
> > Bryan, did you ever post that fix ?
> > 
> > Regards,
> > 
> > Hans
> > 
> > 
> 
> Yep, it would be nice to place that patch first as patch #3 in this series
> conflicts with it.
> 
> I've fixed up the tree here:
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/media-stage/master-ov08x40-integration?ref_type=heads

Hans's patches are in my tree already. Could you rebase yours on my devel
branch (tree at <URL:https://git.linuxtv.org/sailus/media_tree.git/>) and
post it?

-- 
Regards,

Sakari Ailus

