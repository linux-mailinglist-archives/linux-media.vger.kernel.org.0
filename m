Return-Path: <linux-media+bounces-35880-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 968AAAE87C6
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F734174143
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FF226B2D5;
	Wed, 25 Jun 2025 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WcrQRkoG"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4326A1AB;
	Wed, 25 Jun 2025 15:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864711; cv=none; b=bdyyouOug8E/Ls7fvS/NI7Dvu5/3pEw+UIECkq6h616HrYHmLSvbiQlyJGBS9N2wMHum6CVfPIq04fbrXeg+UqZ0aKPhSVtl4d8nvoAd9aPriAGQZRKUAUSlUuTh7Iqk1HzfF7vBciCrVMzHi+JxPO0kU8rE2qR0najD9LkPFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864711; c=relaxed/simple;
	bh=MjRZ/bEHMhVc5FqVAFElEXGRGKcKpNQLI+R38XRacJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqaOqjg+GBs+WrVjrJvulPoAbiFM4A8aJcmzyiHvk+spo1y88reYX/poJMRfWeQ3wvjhuZqKeJHZTqE3iG1ZDsvejHkviR+FM5sBafERWf9eyzEu/77Sr/ngxZIfpdDlFlct5XcvKX8XLUyI9rpwOKF3OwQFMQZD1Iz/LzGZg54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WcrQRkoG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750864710; x=1782400710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MjRZ/bEHMhVc5FqVAFElEXGRGKcKpNQLI+R38XRacJc=;
  b=WcrQRkoGAIlwD/ks2pY8VVe5U/vO8XrEvl12pmsvEcqsV34BDVC6o8+x
   BiBiHxz/kZAlRXKspKzG5gMSLOu1gAy2yWmNpab5s96Hf+RICg7o/biYI
   fVmKyIKiesFgCoH1pDelcZ42nXmrv2HKid32C+KVV/CEj1XcdvL4GNTxM
   CteVCgzBB905SQdolsgR2dvHlOS4am0YFt/n04RBeAaYUWSi5tCPj2AKX
   RtFf+YpZw3anhGaYdRelbr+R93aVwPZHhGj83AUjpnxl77wlBe5a7ADyQ
   RRvJHhzo8Nh5ahNuAX3PBd5LYDAdETaGjxb6YyVc6v3z54V+YGunmqjwX
   g==;
X-CSE-ConnectionGUID: SVqg1MSqQf6kp8aN/JU9vw==
X-CSE-MsgGUID: 4nVP6WbvRzi6w6dMQNHisQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53279647"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53279647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 08:18:30 -0700
X-CSE-ConnectionGUID: zWTG5itzTNOrQWjiXbC3UA==
X-CSE-MsgGUID: RsvjY+UrQVyMWA5/IE8p8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152538596"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 08:18:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uURtI-00000009oZL-2IK9;
	Wed, 25 Jun 2025 18:18:24 +0300
Date: Wed, 25 Jun 2025 18:18:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] staging: media: atomisp: fix tab/space issues in
 output1.0
Message-ID: <aFwTQKtvQFVpaJP8@smile.fi.intel.com>
References: <20250625-bar-v5-1-db960608b607@gmail.com>
 <aFwSgCtrK7DH3pIw@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFwSgCtrK7DH3pIw@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 25, 2025 at 06:15:12PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 25, 2025 at 11:04:31PM +0800, LiangCheng Wang wrote:

...

> Have you tried simply to run slang-format against the whole driver using the

clang-format

> clang-format configuration from the kernel source tree?

.clang-format

> With it done, you may just make it as a single patch.

-- 
With Best Regards,
Andy Shevchenko



