Return-Path: <linux-media+bounces-29329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CF4A7A49E
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 16:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDDC83B9756
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 14:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30C424EF67;
	Thu,  3 Apr 2025 14:05:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4A21EBA0D;
	Thu,  3 Apr 2025 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689111; cv=none; b=R42kXsKuXsakCtKLVKNsiWDYYj8kjWK2zQgK2S0w4rZp3We0HDNzy5bDn31mY5XWzureYKKh6GMV5sYAmRK6mZVGmtqRi17sXPqqs7JeZqHkiv5kjjiVo64jXNY5u0UBpAMoBqYzPW2t10kli8m5l0uKG6PzTMQ0JdjwtwHKhQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689111; c=relaxed/simple;
	bh=PnaxT91oE2fOBx9IkAmHWSinNbeK6RtKCOJUu/SU3Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovhZb6t2k64CYro1IyNTtYhg1g0rZieaZ+7hEXIXns76eT/cLvJstOc+9oyvu9hQGlAGK2XFXRBWOF/sCt75SdGgK5vU2jF1k9xMoGr69tLUQGElQ6JghegUgJPYm2tPJsL1BrZLAoSHtM/3WxBg/xRJG592HfAogGC1mGRVaZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: FPj+c0C6T1C8IEYwrHZiXg==
X-CSE-MsgGUID: qwKhs2lAQOGdrZtW57e9UA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="32702851"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="32702851"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:05:09 -0700
X-CSE-ConnectionGUID: zPFqkzh6Q0a6JbBaQ6A6Pw==
X-CSE-MsgGUID: G1272zTrSy6xOozBmNqblw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126976066"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:05:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1u0LBn-00000008peY-1pL3;
	Thu, 03 Apr 2025 17:05:03 +0300
Date: Thu, 3 Apr 2025 17:05:03 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 6/9] platform/x86: int3472: Avoid GPIO regulator spikes
Message-ID: <Z-6Vj1kOZeBYYQSE@smile.fi.intel.com>
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <20250402202510.432888-7-hdegoede@redhat.com>
 <CAHp75Vcok+-NPEGKFbZawiJcjhgJK5upbyfXfCEtezYiMspvRw@mail.gmail.com>
 <474fe098-3cf0-4207-92a1-e033799a04af@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <474fe098-3cf0-4207-92a1-e033799a04af@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 11:43:34AM +0200, Hans de Goede wrote:
> On 2-Apr-25 11:04 PM, Andy Shevchenko wrote:
> > On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Avoid the GPIO controlling the avdd regulator being driven low or high
> >> for a very short time leading to spikes by adding an enable delay of 2 ms
> >> and a minimum off to on delay of also 2 ms.
> > 
> > How 2ms was derived? From experiments or is there any other hint
> > (Intel published sources somewhere, etc)?
> 
> 2 ms is the minimum time ovXXXX sensors need to have there
> reset line driven logical high to properly register the reset.
> 
> So that seemed like a sane value to use here to me.

Please, add it in the commit message / comment in next version.

-- 
With Best Regards,
Andy Shevchenko



