Return-Path: <linux-media+bounces-42157-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9EEB50FC7
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7E6485260
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 07:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D936230C359;
	Wed, 10 Sep 2025 07:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeaGA7q7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B70212550;
	Wed, 10 Sep 2025 07:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757490152; cv=none; b=omvPLlNEFOFuFVFqJk4EiGbkdh6+vo2hIQBn338x7UmZnivxEd19vC7brt6H3CHkJn+uuORdYwMeVi8vYfnty9s+gNTdffTeTfTefSuZlMJSEysvZScsqb49VEgJgqcOFqWptWFtx6d0IgpgCOFrDFAJxH8NKc9UFyVMwr+IKh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757490152; c=relaxed/simple;
	bh=XF/ishJ1RSuKO+v8xop0Qb0zD1G6U/x2kGbSrhhwJZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmjATsWgTOyhdkyb7lGpn+UR4wEWjlxKPg9o2zNppCc7xJPT78BL8ivJprTWLlvwbs4K0iQwhQzKIXq1oTSaXaQRptsJVl4qhzblDnIueUO1A5btmaIi5YCTro6bOtHFK7FYIZsnHxYt7z+qlUSoCPZ3S9U+zcYvUh8yddDyZJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeaGA7q7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757490151; x=1789026151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XF/ishJ1RSuKO+v8xop0Qb0zD1G6U/x2kGbSrhhwJZc=;
  b=TeaGA7q7TQgYFZiCqCdoQoQhNGPxSVBROPzEyxPq8VgFhBzFm/bpVfiN
   bI34H9Tkd5B0l8VEaSZ6tBFbfYyMcsYFguJVYjHtCXnWJpklU37d6d9HI
   NWpZ+3b1VGdLpcGJuWW23xxROCddcnCXdXDHVEQbIlo9jj0wggFgKE0vO
   rrYUlwdLnIShYT76ZuiDM0jQ60R8v5oNG87Q0cZ+XimBlCsCSnFwzrI1Q
   V75xKwhetEYeZ9MRsguwhs7u781qJ8/YI0mApclxanXP6HXT41TNEsLKU
   h1UDtA6b6goHwOcV4FsCKGS55ZlSDm/BHflbTfwap++/bGMSImIGplM3z
   w==;
X-CSE-ConnectionGUID: pq00hSH9RcagViLbPEVYfw==
X-CSE-MsgGUID: zLtAH58rTBq/iDUodhYr0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59855243"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59855243"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:42:31 -0700
X-CSE-ConnectionGUID: qIs22zwORDeM3KjEBvkh+g==
X-CSE-MsgGUID: s59dmbRLQ0qlh+vWmxPSdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="177649140"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.29])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:42:28 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3DBD711F758;
	Wed, 10 Sep 2025 10:42:25 +0300 (EEST)
Date: Wed, 10 Sep 2025 10:42:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] v4l2-subdev/int3472: Use "privacy" as con_id for the
 LED lookup
Message-ID: <aMEr4Qtui91NQqkk@kekkonen.localdomain>
References: <20250909144823.27540-1-hansg@kernel.org>
 <CAHp75VeMMKCTDNWhdZJH2F=cmUObbpoYcDUch2jpsLBBNs_EhQ@mail.gmail.com>
 <e3edf119-2dfe-4857-842d-fb2a52470eb9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3edf119-2dfe-4857-842d-fb2a52470eb9@kernel.org>

Hi Hans, Andy, Ilpo,

On Tue, Sep 09, 2025 at 10:40:35PM +0200, Hans de Goede wrote:
> Hi Andy,
> 
> On 9-Sep-25 7:27 PM, Andy Shevchenko wrote:
> > On Tue, Sep 9, 2025 at 5:48 PM Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> During DT-binding review for extending the V4L2 camera sensor privacy LED
> >> support to systems using devicetree, it has come up that having a "-led"
> >> suffix for the LED name / con_id is undesirable since it already is clear
> >> that it is a LED:
> >>
> >> https://lore.kernel.org/linux-media/0e030e7d-0a1a-4a00-ba18-ed26107d07fa@oss.qualcomm.com/
> >>
> >> There was discussion about making an exception for "privacy-led" since
> >> that is already used on x86/ACPI platforms, but I'm afraid that will set
> >> a bad example which ends up being copy and pasted, so lets just drop
> >> the "-led" prefix from the x86/ACPI side, which we can do since there
> >> this is only an in-kernel "API".
> > 
> > Since it's an in-kernel API, why can't these two be simply squashed?
> 
> Good question, this is only a runtime thing when running on actual
> hw with a privacy LED. So having this separately will not break
> the build in the middle.
> 
> As such it seems better to have this as 2 patches since it involves
> 2 different subsystems.

Seems good to me.

Ilpo: are you fine with merging this via the media tree?

-- 
Kind regards,

Sakari Ailus

