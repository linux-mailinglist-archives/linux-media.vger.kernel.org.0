Return-Path: <linux-media+bounces-8688-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B25899557
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 08:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B7DFB23322
	for <lists+linux-media@lfdr.de>; Fri,  5 Apr 2024 06:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF4122F0C;
	Fri,  5 Apr 2024 06:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEuCv9BG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04522F0F
	for <linux-media@vger.kernel.org>; Fri,  5 Apr 2024 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712298613; cv=none; b=gm8mTQCLtb/NP/XnLSHoAERl0Qsx96yLk9uzGPrjiP7guLfoPyAbDeCEeMhJUfZKSCB0uycIldqcyJg6AmEiDaj/1tmMiEuIBedVDlR0VJjqBYHdGbs5Hud0kUjOcDIqNYpXYTvZnVZPDhLUFXNV/8kPECsrCZsEV7RXRSQccCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712298613; c=relaxed/simple;
	bh=I0FMxzCYkWtFXw3VKlAwAb6polBKyPXd7F+uCy6sYZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oc9xl4Uje449XHtKt+nyvcfwHDatC+NpG1YubmXbU+bI3RLeyAjiTkQnfchRbh65T48Eh/jpoFhy7UZOcfsjzblqkg9T2UTtF+cJG2XdAwf3wCrQuQkDj48530RULc28z9luQMnbVHHmnlfLMfHiXk3zVJKJ1ptTbmpEKZs5ta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEuCv9BG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712298611; x=1743834611;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=I0FMxzCYkWtFXw3VKlAwAb6polBKyPXd7F+uCy6sYZY=;
  b=nEuCv9BGGB/HR7qSDBOk726NTDn3RdY38LXBrrFm1D+GUl2UjjFTeoTv
   KyFt8NPogTHvLRA9WFpuCmiQtAlPEb5X8VDkt1hpEQtX9vr8LnTDSdvIK
   dUbUxPfNnYOTvJ4iFWcioqzu6E1dUqtHoW7JZAKYwKThedhiGuC8EWc3r
   wdTeVI4FY+xs3/HWJ1nADEIdO7Bxx67eJNvKFvFuuQckuf3VVkQ4eLF/4
   HqL3zQ+Lqu9Wy7znAnwYJHgZKoi6Ecr+3zVWZzLOcqZfX/ugEOFYVderd
   y2heoAtvLrJUP8Z2WUZeZpIw/iBGRHWJva0qUq0IB5Tnn4MZ56wlEH7gc
   g==;
X-CSE-ConnectionGUID: AiAR+tFgSrCH2eGgU4DODw==
X-CSE-MsgGUID: rq1nD6joSn6FhBMwHoyiZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7802817"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7802817"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 23:30:11 -0700
X-CSE-ConnectionGUID: k+wx+wVvR56VjfEr0Jm3cw==
X-CSE-MsgGUID: Y5XUCChqQ0CgzuGwtQgubw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="50307628"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 23:30:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1BC6611F8DF;
	Fri,  5 Apr 2024 09:30:05 +0300 (EEST)
Date: Fri, 5 Apr 2024 06:30:05 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	"stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.org>
Subject: Re: [ANN] Media Summit 2024: where to hold it?
Message-ID: <Zg-abUI8fRgjkL2l@kekkonen.localdomain>
References: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <607815ae-57b5-4c67-9a52-0de795aefc52@xs4all.nl>

Hi Hans,

On Thu, Apr 04, 2024 at 09:29:34AM +0200, Hans Verkuil wrote:
> Hi all,
> 
> Normally we like to have a one day Media Summit meeting co-located with
> the Embedded Linux Conference Europe, however there isn't one this year.
> Instead of organizing an ELC both in North America and in Europe each
> year, the Linux Foundation switched to alternating between NA and Europe,
> and this year it is in North America.

Thank you for proposing this.

> 
> The problem is that most media subsystem developers are based in Europe
> for some strange reason.
> 
> So we have to make a choice this year: we can co-locate with the gStreamer
> and XDC conference in Montreal, Canada on October 7 or 8, or we can
> organize a meeting somewhere in Europe ourselves. One possibility is
> to try and co-locate with the Open Source Summit Europe/LPC conferences
> in Vienna, Austria in the week of September 16-20. Another is just to
> organize something ourselves somewhere in Europe. But that's a last resort,
> co-locating with a conference is generally more appealing for people.
> 
> The advantage of picking Montreal is that the gStreamer conference is
> more applicable to the work we do, and we can get a meeting room there
> free of charge. Besides, I've never been to Montreal :-)
> 
> But can we get enough of the core media maintainers there? There is no
> point otherwise. I suspect that the same company travel constraints that
> were present last year are still in force this year.
> 
> If we pick Vienna instead (assuming we can get a meeting room for a decent
> price), would that work better?
> 
> So if you are a core media maintainer, or an active media developer interested
> in joining a Media Summit, please let me know if:
> 
> 1) Montreal, October 7 or 8, works for me!
> 2) Vienna, one day in the period September 16-20, works for me!
> 
> Please respond asap, I'd like to get a clear picture soon, ideally by the end
> of next week.

My preference is Vienna. I wouldn't expect to travel to Montréal this time
if the summit was held there.

-- 
Kind regards,

Sakari Ailus

