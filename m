Return-Path: <linux-media+bounces-30151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EA4A87F7A
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 13:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD8871745A8
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 11:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3796C29AAF8;
	Mon, 14 Apr 2025 11:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArLGY7FX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300BF29899D;
	Mon, 14 Apr 2025 11:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631017; cv=none; b=CASR5hm+qzLuJWoApS08534jPl8VaCKNGfywmvy05vJglhTNrSlqgepnfdqkrodmwkWHmIFubzwiOqRius3dpZn6VvY0DoXlqZ2JwRXsIgVx1gn557qWpGDpZhv/UW0tBycWbKIbvikts+xUWNm2ZCVM0gTJQTAmNv21aWb3NLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631017; c=relaxed/simple;
	bh=3HPyCdz3Lztb+QYCCc3qGtYzyXcLfWGMxkMLGe4pgOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvycwytHxK5mRaBBb4aSui16hEbwFNgW+9sciFX6ILEjiS80rAVBh3mSyVtBrTMNKme5R7ZkxDmKH6TK7O1J0JOqJQO2kT9c0fAfWzN2Fe/hXokoDNXbgIyzdTmimu0ufklunr98ctWf0QmVhgSxCQX7BBapy8CZAnJBR/bNh60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArLGY7FX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744631016; x=1776167016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3HPyCdz3Lztb+QYCCc3qGtYzyXcLfWGMxkMLGe4pgOw=;
  b=ArLGY7FX7e2m/ZfjFFEaT6eOTuDbodLdZIOGjizx041NVfoK4ZPWPYri
   hKDKok/IPrE40nYfSeV3Xm8FPrBuR69gFfO5tUnhtE0jStAqNC49P1eIG
   la4XzRdenV3QXa8L+/9wyyPFqN7uQMU8ocRiM3G+/5wrXfX83DbCbvZbx
   IBm78WIjXuj/Zt2mdpzGgVwMFwi17j8qXvElGRTC/zvZg/CMzrTH8vXUi
   3nYHytE1FPsSP74hXMVbGP9VBGpebsUcpTLuqpdK0uwGAVXmFeZg+eFHs
   aieXfsKggsbLJU6vQc8yccoY9ApmmigDUmkOe3xcwbqoDsx6Z156TgBlb
   w==;
X-CSE-ConnectionGUID: BXCrLeWURI2uzLhemJBopg==
X-CSE-MsgGUID: 7CRpOzlcRh2bsPduZn0Sfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49902563"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="49902563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 04:43:35 -0700
X-CSE-ConnectionGUID: nfRB8LLRSIygCouwV8Gjtg==
X-CSE-MsgGUID: 3YEhKAn/SoS5EJaCBdgiVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="152985329"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 04:43:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2FD6B11F871;
	Mon, 14 Apr 2025 14:43:30 +0300 (EEST)
Date: Mon, 14 Apr 2025 11:43:30 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	hverkuil@xs4all.nl, u.kleine-koenig@baylibre.com,
	ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
	hao.yao@intel.com
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <Z_z04jMiTg_xW-c2@kekkonen.localdomain>
References: <20250411082357.392713-1-dongcheng.yan@intel.com>
 <cfc709a8-85fc-4e44-9dcf-ae3ef7ee0738@redhat.com>
 <c8ae2d43-157c-408a-af89-7248b30d52d1@linux.intel.com>
 <Z_zDGYD1QXZYWwI9@smile.fi.intel.com>
 <d9cab351-4850-42c7-8fee-a9340d157ed9@linux.intel.com>
 <Z_zMMtUdJYpHuny7@smile.fi.intel.com>
 <f10f919e-7bdc-4a01-b131-41bdc9eb6573@intel.com>
 <01570d5d-0bdf-4192-a703-88854e9bcf78@redhat.com>
 <9dc86b0c-b63c-447d-aa2f-953fbccb1d27@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dc86b0c-b63c-447d-aa2f-953fbccb1d27@redhat.com>

Hans, Dongcheng,

On Mon, Apr 14, 2025 at 01:09:47PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 14-Apr-25 13:04, Hans de Goede wrote:
> > Hi,
> > 
> > On 14-Apr-25 11:59, Yan, Dongcheng wrote:
> >> Hi Andy and Hans,
> >>
> >> I found the description of lt6911uxe's GPIO in the spec:
> >> GPIO5 is used as the interrupt signal (50ms low level) to inform SOC
> >> start reading registers from 6911UXE;
> >>
> >> So setting the polarity as GPIO_ACTIVE_LOW is acceptable?
> > 
> > Yes that is acceptable, thank you for looking this up.
> 
> p.s.
> 
> Note that setting GPIO_ACTIVE_LOW will invert the values returned
> by gpiod_get_value(), so if the driver uses that you will need
> to fix this in the driver.
> 
> Hmm, thinking more about this, I just realized that this is an
> input pin to the CPU, not an output pin like all other pins
> described by the INT3472 device. I missed that as first.
> 
> In that case using GPIO_LOOKUP_FLAGS_DEFAULT as before probably
> makes the most sense. Please add a comment that this is an input
> pin to the INT3472 patch and keep GPIO_LOOKUP_FLAGS_DEFAULT for
> the next version.

The GPIO_LOOKUP_FLAGS_DEFAULT is the "Linux default", not the hardware or
firmware default so I don't think it's relevant in this context. There's a
single non-GPIO bank driver using it, probably mistakenly.

I'd also use GPIO_ACTIVE_LOW, for the reason Dongcheng pointed to above.

-- 
Regards,

Sakari Ailus

