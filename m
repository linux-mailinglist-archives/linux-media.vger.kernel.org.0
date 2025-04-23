Return-Path: <linux-media+bounces-30814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67837A98C17
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 15:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C37713A50B2
	for <lists+linux-media@lfdr.de>; Wed, 23 Apr 2025 13:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA65521480B;
	Wed, 23 Apr 2025 13:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l87FAavc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8745D1FF5F3;
	Wed, 23 Apr 2025 13:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416704; cv=none; b=QO40tdsib+UqpgTkZdrfB7j3W9H1UoOPKTIFION1T6nEndsx3hxxWn3Fg2WHoHtUgeOfMEwZp7QoTX2V1fimZSqd0COLuIzIK9nFeye+1JRWptMTEC2P6MYycAF2VMSsPcufB76iyOqNOR2tyTgncDFP0yPKNL/fthzKN6LPr0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416704; c=relaxed/simple;
	bh=7q4zdAA6cjvoH7A+eF42XPOlNQyB4KuhTMmsqPLrA4Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JgjS3PbIhzdDSD3G807YJ7khZ02FJBi/28i4Q0Ngj48OiKQXVd83lRZs3BdUMEAVXCLiil6a9T6QGfPTAPGsgUqB0NRfIXgo41LWN85cGAmZ0QNseJ7ChhZTZA/E64BJe2jGzDOTOFMwUEDXVKdrVhcz3a9QltcHLilw3ZIrNY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l87FAavc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745416702; x=1776952702;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7q4zdAA6cjvoH7A+eF42XPOlNQyB4KuhTMmsqPLrA4Q=;
  b=l87FAavcmxZxR3m2+Mafh+bkKVveWtaxPdxG8K8CrJM65M9Ohi4kldRE
   r69NAela8sN+1AoB/hoGbUBRePEsv7gN6RXLrRqCUiFtw1vDxrpLekLy5
   dvP05DtLQwiUcf7U2ctTuPnTrQggChsq2y8OwPsFLoTefNzpwmy8wUG3J
   bIUiS0GrrSvhXlpsorp1ILQqBjiREZ5KsiA0w1a1XZ3Ip1jcHJnWzkvu2
   fzbW/xVIz1ftnJCCb6vEj/o1eGOHaxVQNPzw2P77jEqm3suBL36e1ti2U
   mSnwmVDiarfUWAkJ9mjWXtgOBmzD83Q5C6S79/5zW6cGBtTEASJq/9Esn
   w==;
X-CSE-ConnectionGUID: nEgbwwYoRLOHrSCeNMFAUQ==
X-CSE-MsgGUID: u0yJRMmQTFWH4FgES/Z9vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50810404"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="50810404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 06:58:21 -0700
X-CSE-ConnectionGUID: WNr3micBRmO2tdbeiNfmqw==
X-CSE-MsgGUID: jb0IVUnFRIen1MpHXdGKsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132852073"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 06:58:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Apr 2025 16:58:15 +0300 (EEST)
To: Andy Shevchenko <andy@kernel.org>
cc: Hans de Goede <hdegoede@redhat.com>, Dan Scally <djrscally@gmail.com>, 
    Alan Stern <stern@rowland.harvard.edu>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>, 
    Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>, 
    platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v4 5/9] platform/x86: int3472: Make regulator supply name
 configurable
In-Reply-To: <aAErdSgr_F8L7Sgw@smile.fi.intel.com>
Message-ID: <09254093-8962-3d53-bf56-78eebb23fdd5@linux.intel.com>
References: <20250417111337.38142-1-hdegoede@redhat.com> <20250417111337.38142-6-hdegoede@redhat.com> <aAErdSgr_F8L7Sgw@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, Andy Shevchenko wrote:

> On Thu, Apr 17, 2025 at 01:13:33PM +0200, Hans de Goede wrote:
> > This is a preparation patch for registering multiple regulators, which
> > requires a different supply-name for each regulator. Make supply-name
> > a parameter to skl_int3472_register_regulator() and use con-id to set it
> > so that the existing int3472_gpio_map remapping can be used with it.
> > 
> > Since supply-name is a parameter now, drop the fixed
> > skl_int3472_regulator_map_supplies[] array and instead add lower- and
> > upper-case mappings of the passed-in supply-name to the regulator.
> 
> With a comment and static_assert() LGTM now,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Hi Andy,

In the lack of context what this refers to exactly, can you confirm those 
are already present so no updates are required to v4? Thanks.

-- 
 i.


