Return-Path: <linux-media+bounces-37479-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48014B01BDE
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 14:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941915A4710
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 12:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299E6296178;
	Fri, 11 Jul 2025 12:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8HEiFu4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21282820A7;
	Fri, 11 Jul 2025 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752236535; cv=none; b=Z4o6jna/HDZLFax2e+Rm7ceurbnQcGm2MobEiGNNC226fw6fAhyNLcTdnfjkC1GhKmSne9gRR658LLryGYUWV2yV47EyA9h8Bx9J66xOUIndwTEGpkmS3/yGXyPaAsTaY1aISsKpaBoIgZd9SrWMigL+jJTQgZgupUa8crCJpmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752236535; c=relaxed/simple;
	bh=WYzFU/bJjR71GF2lsmseSnBh7lh9rDf4bBAolgWIvyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9hnoF9aYJO621QQLMUuzl3/5JrL4O/kwNRqdwNhpcNvVTFwNJ2cmE7iepBgcV0XuU+mbo7n+QPBAlj+6K2H0bFSlQRTT6Jy9/I7L/1gpj34cnYZ5OLCPQqYNSnjVM6hha2lhCCnssJb5PpGUsD+SCWGuPe4f03iV0/syT9aUTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8HEiFu4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752236534; x=1783772534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WYzFU/bJjR71GF2lsmseSnBh7lh9rDf4bBAolgWIvyY=;
  b=k8HEiFu4XOfxPjKnbI4OXGWFfZN4nLGn1HPbwzKzyftua3Zvg9MYEHNX
   QdkfomXzdNq5JTHy4KdnpqzbF6pL19XHF6b4ygdlO1SQyqz5S4t9KVvAB
   PK4vbmLQoy0QDhnxwgldwNq9VLxk6Q2aaon7OoKc+VUYwCeTLH4hTIdkR
   CnssCJ3L6bq5+KsKavDeq2DlpTDg1EgscSdzMHzo7ADGcrKEaTAznT8Df
   QqYQsUKxQxehij2a5kkK/6Rl83AYGXTwKnBoAuETLtlFVCiGV950obE+M
   zUxJw2gOrNz4p/UVE3iJAUj6H5wTI1dgf4oM56ZTFsGltofzcHAC0IKcE
   A==;
X-CSE-ConnectionGUID: lFF7k9XmQYuB8NDdNbZvVA==
X-CSE-MsgGUID: BmGboxVRT7mYbGuDPwqphw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54662231"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="54662231"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:22:14 -0700
X-CSE-ConnectionGUID: 6SZaZNZhSv+roNQ2tI9Uew==
X-CSE-MsgGUID: yg+iYVx2SCSsJhkkdspsHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="187338614"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 05:22:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uaClU-0000000EWK7-1FjU;
	Fri, 11 Jul 2025 15:22:08 +0300
Date: Fri, 11 Jul 2025 15:22:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v9 1/3] staging: media: atomisp: fix indentation in aa
Message-ID: <aHEB70JWm1sotEXI@smile.fi.intel.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
 <20250711-new_atomisp-v9-1-a9dd62425ef6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711-new_atomisp-v9-1-a9dd62425ef6@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jul 11, 2025 at 07:54:36PM +0800, LiangCheng Wang wrote:
> This patch fixes tab/space indentation issues in aa

The Submitting Patches insists to use imperative mode.

> following kernel coding style guidelines.

No, currently the code does something different, you forgot to update
the commit message. Something like

"""
Move a standalone kernel-doc comment of the 'strength' field of
the struct ia_css_aa_config to the whole-structure one.
"""

...

> Link: https://lore.kernel.org/all/CAHp75Vfc7QsENHsaYMKau_4DU3-LmW2XaUxd=oHqTS3F3R85eg@mail.gmail.com/
> Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/

Unneeded Link tags. It actually doesn't matter when and how it was suggested,
the relevant people are automatically added to Cc list.

The rule of thumb is that the person who suggested the change (in terms of
Suggested-by tag) should also provide at least Acked-by (or Reviewed-by).
It can be optional if that person is the same as the committer of the changes
(depends on them and respective maintainers).

> ---

Code wise LGTM.

-- 
With Best Regards,
Andy Shevchenko



