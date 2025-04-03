Return-Path: <linux-media+bounces-29284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95471A79CBD
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7CE6173ECF
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 07:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DE4241139;
	Thu,  3 Apr 2025 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDDHqp/g"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F97C23F42D;
	Thu,  3 Apr 2025 07:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664566; cv=none; b=OyMTy4DN2jNSZGXaEnmG2jWnYpi85ys3mng7wooNRXJL6Ht5Er5SYH/SvqhGWuEaAKbraRKpwPcpNfard+a40Ya/Iv5r1c9uSNEEuw4bMp/QlLSbinecq0trEijh8lNE2VZPrGcnU5/xSb9PRqp4sXFMUHXhrviovoEk6m4JeQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664566; c=relaxed/simple;
	bh=ihOoeHUJojDpzJ37i9jH2w0uU3hPfFAThQCAxznA68Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mzei3VQz0x7Y+D4Wo1mi3FPo/Upmy66LdQV/8o+j+QZVwkhibuy/WSLPB0om+jXLnRPPUGlNBVNbKCHRlWaZl/3F4idypoALa/54iUwgKO7ZFkEecj76V/Sul3TaPaz7oMoZqXFVCnMuTmHOpfarv7Y0hksPaYY5hy5DRdGGGDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDDHqp/g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743664563; x=1775200563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ihOoeHUJojDpzJ37i9jH2w0uU3hPfFAThQCAxznA68Y=;
  b=XDDHqp/gpAZkAanl3e/lfQH5OfGHQzm6I/jLLLJDu6ElQz4W1nWDdHd3
   1/GRoYLuLEGCgJbd4Oxo4K+mURV19tz7cQu7iZXEJNisHRVoLuaHDv4Mn
   +WF4jFFR79gEYs67dVHNjEIhqIDZGBYkB0q0Ifq7fpFgNmKF7dbU/AHrx
   UXLyDOvn6LIlOtPkZL9YdRbE1MWU1XgbqUUBkyvpWQxDASDQb3qi6idvU
   79JC7tiU+n3qVZ0qv1SJ7k/z6b4fMbF1MGxF0/QTkI8xDaxxB/XPxJQQ7
   ORTL5icA4v4X6dqXktXTdSw9DQI4muikZ2UKLDjFYPKu43LKuTN99WxC9
   Q==;
X-CSE-ConnectionGUID: bkGTezQ+TieglxgEyK/9zA==
X-CSE-MsgGUID: 6Q3Oj+s/R3ysvqns8i4UQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44766757"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44766757"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 00:16:02 -0700
X-CSE-ConnectionGUID: VWaLX/FKTvC8r+pa992Feg==
X-CSE-MsgGUID: q+YsHhhZSumJYvL15eASnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127781557"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 00:15:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 984BD11FAD8;
	Thu,  3 Apr 2025 10:15:56 +0300 (EEST)
Date: Thu, 3 Apr 2025 07:15:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 4/8] Documentation: uAPI: media: add
 V4L2_CID_FLASH_DURATION
Message-ID: <Z-41rHITfEe6tJQc@kekkonen.localdomain>
References: <20250314-ov9282-flash-strobe-v2-0-14d7a281342d@linux.dev>
 <20250314-ov9282-flash-strobe-v2-4-14d7a281342d@linux.dev>
 <d14b8c18-55b9-472c-897d-3a481892b080@xs4all.nl>
 <4w7s6g32rol2ptkchczhyhgvytyeq6baqvz4h7ikurzg2tygnr@a3q7cgeagzk4>
 <0fd2cbfa-8804-456f-891d-ecd06e828bc6@xs4all.nl>
 <p7dar3qvajkaq6y4mxahxh2g5vkxzavjjchkwvh32hhkptona2@mzgo4vf4ni7e>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <p7dar3qvajkaq6y4mxahxh2g5vkxzavjjchkwvh32hhkptona2@mzgo4vf4ni7e>

Hi Richard,

On Tue, Mar 25, 2025 at 09:24:18AM +0100, Richard Leitner wrote:
> Hi Hans, Hi Sakari,
> 
> On Fri, Mar 14, 2025 at 11:36:12AM +0100, Hans Verkuil wrote:
> > On 14/03/2025 11:28, Richard Leitner wrote:
> > > Hi Hans,
> > > 
> > > thanks for your quick feedback!
> > > 
> > > On Fri, Mar 14, 2025 at 10:41:04AM +0100, Hans Verkuil wrote:
> > >> On 14/03/2025 09:49, Richard Leitner wrote:
> > >>> Add the new strobe_duration control to v4l uAPI documentation.
> > >>>
> > >>> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > >>> ---
> > >>>  Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst | 5 +++++
> > >>>  1 file changed, 5 insertions(+)
> > >>>
> > >>> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > >>> index d22c5efb806a183a3ad67ec3e6550b002a51659a..03a58ef94be7c870f55d5a9bb09503995dbfb402 100644
> > >>> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > >>> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-flash.rst
> > >>> @@ -186,3 +186,8 @@ Flash Control IDs
> > >>>      charged before strobing. LED flashes often require a cooldown period
> > >>>      after strobe during which another strobe will not be possible. This
> > >>>      is a read-only control.
> > >>> +
> > >>> +``V4L2_CID_FLASH_DURATION (integer)``
> > >>> +    Duration the flash should be on when the flash LED is in flash mode
> > >>> +    (V4L2_FLASH_LED_MODE_FLASH). The unit should be microseconds (µs)
> > >>> +    if possible.
> > >>>
> > >>
> > >> If this control is present, does that mean that the flash duration always have
> > >> to be set manually? Or can there be an 'Auto' mode as well? And if so, how is
> > >> that set?
> > > 
> > > To be honest I haven't thought about automatic flash duration. Is this
> > > something which is required?
> > 
> > No idea, it was just something I was wondering about. Sakari probably knows a lot
> > more about this.
> 
> Sakari, should I add something like an auto/manual flash duration
> control to this series?
> 
> Personally I think as long as we have no user of such an "auto" control
> it's not really necessary. Or are there any drivers doing "auto"
> flash/strobe duration already?

I think the only other drivers that support controlling the flash currently
are CCS and vgxy61. The CCS calculates the timing in the driver and the
vgxy61 appears to be doing that all in firmware.

I'd add a control to select between auto / manual if there's a need to
support both. CCS could be a case for this as the user space might know
better what it wants from the flash.

-- 
Regards,

Sakari Ailus

