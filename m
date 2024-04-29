Return-Path: <linux-media+bounces-10313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4B8B5296
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 09:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B62F01C20B63
	for <lists+linux-media@lfdr.de>; Mon, 29 Apr 2024 07:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16BE168B9;
	Mon, 29 Apr 2024 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGv/C2if"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22630883D
	for <linux-media@vger.kernel.org>; Mon, 29 Apr 2024 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714377063; cv=none; b=bHRQeRSxiBvpINkvQBTsQIdUnSjNiLQMGbrIk2erwfVfjlsH6aDDknXJkyyNBv+rtksxL0MIYjSdpDsoW/NeUSDnILzkygdsTOgcCSYkxSvt9CMFhGODpbdZ+0Rf/jEzUDgrT0Vc50vW0sadAYUABxiq3rPyqP3mmhWvTu2jRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714377063; c=relaxed/simple;
	bh=3Ldl6Ib+yo+4QoBqDxPKJwtr9Pg+b08ZaPn/2+0en4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTEtlNHBQa7teA8M/65TgYjqMkai00favxjBEvpAZHiMX8rGXU6S6c80f2T/fEYY/ioDp9UMCn0euMYt0FO5IZ3V1Ef8D5ZqNlltQvgkpdU7gKQlL8bChFrBVHzYuoY2wwvYVNsx8ORYCgL8CUcCCpmBlDSzpSM21oNlqMazxkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGv/C2if; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714377061; x=1745913061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3Ldl6Ib+yo+4QoBqDxPKJwtr9Pg+b08ZaPn/2+0en4M=;
  b=FGv/C2ifUSS+9/Q05b4g5O+XuY7OC6fVgTXClvHW8s8CewDqq6ZVqvPH
   PFkbPah3T8xnomwFAlab0vSMYDRqCrgnwW3ie/cgqE9huqP/dSZVcR33h
   NHagk6PG/ffk/DQRvhElcNVpihwm6hgqOJtR0d32em2ktzv5oIB1fHllU
   Uy938+gXqGanYXnFOE6yf+gV3WkG1GUyPkE8jl3Wz00ceu3C/Mev0+eUk
   E8gbSvJ8choAFKpzvJX/MlE6k/lLTf1FbpeevYOvqUt+JRPyCbvRCMqqm
   uKF4ePE3fnZYgRHUmGFYH6vGUzlZ5hMaZ4hplKaogyoyoiYV1I1bgve15
   w==;
X-CSE-ConnectionGUID: 7lkwv6dzT3+CpBaANRb13A==
X-CSE-MsgGUID: bqKP2GSLS2eIZvvWDNCdJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32528033"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="32528033"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 00:51:00 -0700
X-CSE-ConnectionGUID: B46y7AvSRIeqiW7V8CCW5g==
X-CSE-MsgGUID: 3i0Gu56jT06k0XT+ohynKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="25996298"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 00:50:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8E4EC11F830;
	Mon, 29 Apr 2024 10:50:55 +0300 (EEST)
Date: Mon, 29 Apr 2024 07:50:55 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v2 0/3] Use INTEGER64 type for MEI CSI LINK_FREQ control
Message-ID: <Zi9RXzLPCnYNkeh6@kekkonen.localdomain>
References: <20240426145538.654212-1-sakari.ailus@linux.intel.com>
 <20240428232028.GD4950@pendragon.ideasonboard.com>
 <Zi9MLcZzS4xW1tyU@kekkonen.localdomain>
 <c0ae16a7-a817-4c43-bfb8-f71da01e0713@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0ae16a7-a817-4c43-bfb8-f71da01e0713@xs4all.nl>

Hi Hans,

On Mon, Apr 29, 2024 at 09:30:37AM +0200, Hans Verkuil wrote:
> On 29/04/2024 09:28, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > On Mon, Apr 29, 2024 at 02:20:28AM +0300, Laurent Pinchart wrote:
> >> Hi Sakari,
> >>
> >> Thank you for the patches.
> >>
> >> On Fri, Apr 26, 2024 at 05:55:35PM +0300, Sakari Ailus wrote:
> >>> Hi folks,
> >>>
> >>> An integer menu isn't a useful control type for conveying the frequency
> >>> depending on an external device to the receiver. Instead, in the MEI CSI
> >>> driver, just obtain the link frequency from the upsteam sub-device and
> >>> pass it on to the receiver.
> >>>
> >>> The v4l2_get_link_freq() is changed to add support for this and it's
> >>> documented as well.
> >>
> >> Using a control for this seems to be a bit of a hack :-S Wouldn't it fit
> >> more nicely in the .get_mbus_config() operation ? That would avoid
> >> exposing this to userspace, and would also have the nice advantage that
> >> the value could be queried per pad.
> > 
> > Works for me. I also think it's better than using a new control for this
> > actually.
> 
> Same for me. As you gathered, I was not very enthusiastic about using a
> control for this either.

Ack.

I guess these are fine to be merged for 6.11 but still backporting to 6.10
should be done. Nothing breaks now as there's a single frequency used right
now and that's 400 MHz.

-- 
Regards,

Sakari Ailus

