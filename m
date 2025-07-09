Return-Path: <linux-media+bounces-37227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D092AFF319
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 22:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 635AA1BC6A2C
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 20:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7684C24167D;
	Wed,  9 Jul 2025 20:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1EGP1bR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A830202F8F
	for <linux-media@vger.kernel.org>; Wed,  9 Jul 2025 20:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752093368; cv=none; b=nbstWVx9zORT58l06aaOpvUy6j4HT26nimsAs244TabwVRiC9kPQgMJDVRHEnTqqnmGdQqc7YA9CVQ4ntsKQL0fpPsOH2OGL1M8r4N7eTvjxjV4yfYVu0QvEBFomGSU/Yr1VvpOQKAqS9xEs0y1ojGHT2GiyJTE7YwOfcZOyCDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752093368; c=relaxed/simple;
	bh=BlYHF5wJPAplIr20+KNujMqWpapeSHW43CNtVgJPNsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZTb6vXSOsbutyyzwd9DY1SujLYbMCtbg3IJGP+cmmpcfVTXUulw3282/4sa5AJWlcCpssK7gT9ileZONbdNiGGtN/FJKPt3IHbJdZXrP2UX7rPFQXN/CMphiQLknYFUG38tSG58rVlHL0AEBgQdIpTK5EjrMpTHGAcaKW7xpzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1EGP1bR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752093367; x=1783629367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BlYHF5wJPAplIr20+KNujMqWpapeSHW43CNtVgJPNsk=;
  b=l1EGP1bRwB29ao9VkBp0vdwG1fu+UPmEUhuV2yzbzhdQSiHQkAlQc96K
   fCWPzCN2sLHvnpyJ1IXrn5uS5yan16PJEcH1pf2Cushnckd0MTIHRY1st
   tYIIzWQNjEMOGfFWAXp/3JMpxEndAuY9IDP5tkMtEQRhMTkEnYyJjM5Bt
   1tv0K9Wb1CVC+0rkRMUZ2bh5I4io8xaZLj7T84teADfxQ1qRxRE7JNV/i
   jh6EWCJyZmOnUqZ6y8b2cRRUW2hIEqNr8abaPsJWphwG3FlKc8RpFUkip
   w19BnQJRpZulL8v51ypiWULBN6JSuiR4zgG+SuI0QvjU2pabF2rJIdXUY
   g==;
X-CSE-ConnectionGUID: elxthQxwSg2khMSC8iNiJg==
X-CSE-MsgGUID: 83apmAjxTBaUUlONuRMj4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54293428"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="54293428"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:36:07 -0700
X-CSE-ConnectionGUID: xNaRwt0SRcmiVnVFTQoMaQ==
X-CSE-MsgGUID: Jt6SbVefQPWCb2XbnY3cZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="155290373"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.15])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 13:36:05 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 67DB511F89A;
	Wed,  9 Jul 2025 23:36:02 +0300 (EEST)
Date: Wed, 9 Jul 2025 20:36:02 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH v2] media: staging/ipu7: use 64-bit math macro for post
 delay calculation
Message-ID: <aG7SslOEKdcE8noV@kekkonen.localdomain>
References: <20250708025837.3898579-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708025837.3898579-1-bingbu.cao@intel.com>

Hi Bingbu,

On Tue, Jul 08, 2025 at 10:58:37AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> When build ipu7 driver with i386 config, it will report error:
> ERROR: modpost: "__udivdi3" [../intel-ipu7-isys.ko] undefined!
> 
> This patch fix the problem by using correct math macro to implement
> the 64-bit value division instead of C divide operator.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507051239.cb4TkmuW-lkp@intel.com/
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>

I opted to take another patch from Arnd
<20250709145710.102669-1-arnd@kernel.org> that addresses another problem as
well. The actual value could even be u16 but u64 is being used...

-- 
Regards,

Sakari Ailus

