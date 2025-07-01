Return-Path: <linux-media+bounces-36418-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FDBAEF913
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 14:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FF221C01C5A
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 12:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D20E274669;
	Tue,  1 Jul 2025 12:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUNUk+U7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F792741D4;
	Tue,  1 Jul 2025 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373934; cv=none; b=ra0WcHYZ5Ob4R2czSo5fkNaWAyptXh6qPpQ5R3zU9oSXG9zW+SVMdGh24WDYfR6F6JgKK7iSik0BkgG0DHD+Pm/9JudIlwYM7GKZ4qyr/nyMgj1at6jbvWUtrFlxe/NCcj2MvIQ2Evcjo+cCYCpM/Vdi5ttVSm1ctb1S0TD93/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373934; c=relaxed/simple;
	bh=jLzMVW+bdlcX8BieIAvHsE5uVq8etbvJL+agrUWGPV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSHJMIsubAF3Ppi0ErMWHzGyd817vdiFzym1nmGJsB8s6JMnKXe+Hispc0QWiWY7k9IQNrtN8FBFKjo4cyejgBA8ym2YVtuecfepv0kutURW2XRpZBwdBYXuCCAbl3j+RzKxqdXwaHTSkdX4aeJpAkhVM5a5LjrC5y6gPAeQtOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUNUk+U7; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751373933; x=1782909933;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jLzMVW+bdlcX8BieIAvHsE5uVq8etbvJL+agrUWGPV8=;
  b=cUNUk+U7q1kM5Y6wReW7oVYPeshrFsgV8VG4y7m/OaOigklM3Dttxi9q
   vMu8HxUcuqlV0DJGldcob2JlFqdP54M0FyzS7qp94xKN5lVJXXPDqSs9w
   LBWiQS3+TQFKX8EKn3rMtVFx/CnJOHmLyeKK0sGzJjByXMMub/FmloIS4
   aDudAyndVJY3O/XZqNjQSLiDGM2FMvNUTIg9m2E4s8z4HP3L+e12rne5Y
   JIq7clWHRjNyUCLxZyzlgYlzCTQ5WzDDYD+wb/UlPus/RzgzLRAK9OVqX
   TdOkPeDJyN+cZnVpdtl1slY55gJV4HmPTdj6/Bb8FD6auLYS3cu5yxQoU
   A==;
X-CSE-ConnectionGUID: g+otYfVwSSG77sK6cp+4fQ==
X-CSE-MsgGUID: a/T9W2POT6GXo0nYjBhrVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="57318037"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="57318037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:45:32 -0700
X-CSE-ConnectionGUID: SRVgI8rqQ4WsstZn1bAFyw==
X-CSE-MsgGUID: uaVhz3xfQcK7oIGIqObU4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="153851008"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 05:45:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uWaMY-0000000BbAP-1iXd;
	Tue, 01 Jul 2025 15:45:26 +0300
Date: Tue, 1 Jul 2025 15:45:26 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, andy@kernel.org,
	hdegoede@redhat.com, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: media: atomisp: Fix premature setting of
 HMM_BO_DEVICE_INITED flag
Message-ID: <aGPYZhK65LaD0wVO@smile.fi.intel.com>
References: <20250628052536.43737-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Vcy3dHRu8Wb2KZ=xK7adz=-P-iuRTeR8vOWzHzZL9uFeg@mail.gmail.com>
 <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGn2d8OMRaeozOMxj1Ry8i9T3sJ5J1QqA_Jpk7wYO8KiUbpKBA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 01, 2025 at 02:58:43PM +0300, Abdelrahman Fekry wrote:
> Hello Andy,
> On Sat, Jun 28, 2025 at 10:52 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Sat, Jun 28, 2025 at 8:26 AM Abdelrahman Fekry
> > <abdelrahmanfekry375@gmail.com> wrote:

> > > The HMM_BO_DEVICE_INITED flag was being set in hmm_bo_device_init()
> > > before key initialization steps like kmem_cache_create(),
> > > kmem_cache_alloc(), and __bo_init().
> > >
> > > This means that if any of these steps fail, the flag remains set,
> > > misleading other parts of the driver (e.g. hmm_bo_alloc())
> > > into thinking the device is initialized. This could lead
> > > to undefined behavior or invalid memory use.
> >
> > Nice. Can you make some fault injection (temporary by modifying the
> > code to always fail, for example) and actually prove this in practice?
> > If so, the few (important) lines from the given Oops would be nice to
> > have here.

> I have been trying to test it without having any intel atomisp
> hardware and failed continuously, do you have any tips or maybe some
> resources on how i can test this driver.

So, the easiest way as I can see it is to ask people who possess the HW to
test, but you need to provide a testing patch (which can be applied on top
of this one, for example).

> > > Additionally, since __bo_init() is called from inside
> > > hmm_bo_device_init() after the flag was already set, its internal
> > > check for HMM_BO_DEVICE_INITED is redundant.
> > >
> > > - Move the flag assignment to the end after all allocations succeed.
> > > - Remove redundant check of the flag inside __bo_init()

-- 
With Best Regards,
Andy Shevchenko



