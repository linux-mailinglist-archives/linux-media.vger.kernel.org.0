Return-Path: <linux-media+bounces-30788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE29A9865D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 11:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB8617608D
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 09:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA62D4A07;
	Wed, 23 Apr 2025 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gW/wR4w9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06B12701CD;
	Wed, 23 Apr 2025 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745401624; cv=none; b=OSeBi1tLIRO+QtdcJsaJa82krP+x+30TKdM58AMEjdqKBzKXSSeTt4+hjeiPK8koiONxw+9zxKwzK4YZ2J+QiKQkGJPrR/EF2sA2yCbtTKEZiBOFf3ETqIdhmDFWnSLXYQKRGaWvETX7ZEda1QPKGTQGdcj1VKTAYOzvOqaWkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745401624; c=relaxed/simple;
	bh=CSSfobmAlzcxe5NNNfp5+mFtPpEsoz0wMmuviJ71K+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGfwbCaNseq80q1Gpeo4CDrtFFLM4R2QT99kDCCYvuin8HDhHmMNLDRtvZpKsCk28/uyviTkfzE0f/YlKetDGjdd4zia3UJd6B7SC2SWxTffag/kShra1B9Di7dHeI+OsI3vKvMK87QHMmAY5I07Nj0742vNdi+X09poVaF/scw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gW/wR4w9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745401622; x=1776937622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CSSfobmAlzcxe5NNNfp5+mFtPpEsoz0wMmuviJ71K+s=;
  b=gW/wR4w9s0XJdQ0Zg3f01EHkgLC8lGumD6IeMLMOFzPkkxK8+ftClKqV
   jPlR4956AKxmAslcSvVS30fmK/nJsIpEwEE9uxcTeZcA96aZxh+SsWWip
   i6EM2gKKzvDFw2Ek4/9fuyW8uFjyG8Vv7LI6HW94jbfWgG97U46gPlq88
   yTPYRHmiqBiyv5C8C88nddAaFID3Y4wKBI4qYQFvn90tw/HIQtA3IRnE+
   F4G4o33c+eNP+3mdRDC66LJm99l2D+JNNP54YX/JF5g4Syn9pnviKxqo5
   qxvAI1QOZwriaTDEAVCnl81XqolhCKOG2gH0mcpicRFjCCzEbHhJUxod2
   w==;
X-CSE-ConnectionGUID: fq6Agt4KQ+OhsmTF8KvKbw==
X-CSE-MsgGUID: iEWZBiGvSCWlTqWL0LCCmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="34603810"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="34603810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 02:47:01 -0700
X-CSE-ConnectionGUID: LmGBkD4/Sx2Q4MvAD+MEng==
X-CSE-MsgGUID: DiOM2DyYTP22wNHRwOPJSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137128962"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 02:46:59 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2FD6111F8D4;
	Wed, 23 Apr 2025 12:46:56 +0300 (EEST)
Date: Wed, 23 Apr 2025 09:46:56 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>, Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 0/9] platform/x86: int3472: Add handshake pin support
Message-ID: <aAi3EPXWSu5my3eJ@kekkonen.localdomain>
References: <20250417111337.38142-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417111337.38142-1-hdegoede@redhat.com>

Hi Hans,

On Thu, Apr 17, 2025 at 01:13:28PM +0200, Hans de Goede wrote:
> Changes in v4:
> - Add Andy's Reviewed-by to a few more patches
> - At static_assert(GPIO_REGULATOR_SUPPLY_MAP_COUNT == 2) since the code
>   assumes that
> - Use unique error messages for power-enable vs handshake
>   skl_int3472_register_regulator() failures
> - Drop setting of constraints.enable_time. enable_time already gets set
>   in struct regulator_desc (missed left-over from an older patch version)

Thanks for the update!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

