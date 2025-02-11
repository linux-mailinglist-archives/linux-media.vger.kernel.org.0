Return-Path: <linux-media+bounces-26018-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF7A3127C
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 18:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E4131887E91
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 17:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DB8262154;
	Tue, 11 Feb 2025 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnWA6uvl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A79D17C91;
	Tue, 11 Feb 2025 17:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293984; cv=none; b=RLLwZ5PfbCGiaQZuEXjLd0rT2mYT43k4DHdrh+EFTxOXYMtBrWTWKNPT0uImzQ58/kyj6yx97mVq/zWNBJFB4f9yO5k/sFfcZkpvwXMVtjZP2aBjw+AktWgCXHuTcTs68jVxbIY2MLHkl3P8S4D6eU7Qqam7xwfQok4vC4ZIre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293984; c=relaxed/simple;
	bh=JmtXwoup7RZ5Y7vvjkiHuyrQfbuNxagqMe+MZgHCTQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qxd2TqPyHyArXhfLxrqOnfXv1FfBXLr3vASZ150wBCCzG2uNvrdFh1me3GTq/3eud37TVKvGwyBsYTCEbfN3GYDaHtz5/u2Gfz9xkHexUlWV7xUOz4HBtWXlaPhowPiYjSfXjIFsATviM4uPCGY46DqJeXu/CSg/P0Bi4H62hPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnWA6uvl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739293983; x=1770829983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JmtXwoup7RZ5Y7vvjkiHuyrQfbuNxagqMe+MZgHCTQ4=;
  b=PnWA6uvlcdR1EAy+lEEuBwgYYlsFeoHMo33mnFycwpygW2koTwnMrZLr
   yk/bP1KEUKSQ/U+xqarTVj0D2uC6XiGrfBeSJPkUZtcXiqKi6LD+C9V3P
   PEQa9t6Bu9W8NgOmlpfEPrmbqD9Ue/N3ArctJ0fwhcgX8N6xb7US0q77L
   3qp3qhN1m2wVK+gYgzxWTKdc/92gwAL72ft7uoAAFNqaNEmj8sxtJLOnf
   ohTgzcLi8sRTBU7lrolewqSifBt7j53cBZTG1EqygrdZh3UzlIktzlmhj
   aeANNCP/trJB7ghREkm5INvab7PJbw1tZFJ//7clJziBOTIm5jkYv9EUk
   Q==;
X-CSE-ConnectionGUID: 0KNzBjw3TrK/0uRVtFJOCg==
X-CSE-MsgGUID: DMvutYgPTFm7wLThqKM0oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42766791"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="42766791"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:13:02 -0800
X-CSE-ConnectionGUID: pavOduCxQ2WzigUwRK8UYQ==
X-CSE-MsgGUID: BkuStkDlRGWpHnaVWVf41w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117192496"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 09:13:00 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7FB2511F7F0;
	Tue, 11 Feb 2025 19:12:57 +0200 (EET)
Date: Tue, 11 Feb 2025 17:12:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/3] int3472: Support GPIO con_id based on _HID
Message-ID: <Z6uFGYcUXbbRMERY@kekkonen.localdomain>
References: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
 <Z6shGGy2FPVc5mEK@smile.fi.intel.com>
 <64b617e1-bf52-442e-be56-71c76d973edd@redhat.com>
 <1938d858-6d66-69f8-5952-9cecf133f254@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1938d858-6d66-69f8-5952-9cecf133f254@linux.intel.com>

Hi Ilpo,

On Tue, Feb 11, 2025 at 04:32:12PM +0200, Ilpo Järvinen wrote:
> On Tue, 11 Feb 2025, Hans de Goede wrote:
> 
> > Hi,
> > 
> > On 11-Feb-25 11:06 AM, Andy Shevchenko wrote:
> > > On Tue, Feb 11, 2025 at 09:28:38AM +0200, Sakari Ailus wrote:
> > >> One patch turned into a set, the second patch being the original one.
> > >>
> > >> since v6:
> > >>
> > >> - Reword the comment regarding GPIO map processing.
> > > 
> > > Hans, Ilpo, I think this is in good enough shape
> > > (the order of the checks I'm still not happy about
> > >  we can amend later on if required). Can it be taken?
> > 
> > Yes this looks good to me. Ilpo can you merge these 3 as fixes
> > for the 6.14 cycle ?
> 
> Currently, these don't appear in lore for some reason (not in 
> patchwork)...
> 
> Sakari, could you please resend the series v7 so that it hopefully gets 
> picked up by lore and is easier for me to apply them using the normal 
> tools I've.

Lore is up again, getting the patches from there should therefore work (I
tried it).

> 
> The last patch IMO falls outside of even borderline for fixes. I think 
> I'll put it into for-next after merging the two first ones from fixes 
> branch into for-next.

Sounds reasonable.

-- 
Regards,

Sakari Ailus

