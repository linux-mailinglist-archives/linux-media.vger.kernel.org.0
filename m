Return-Path: <linux-media+bounces-21356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 587A89C6A14
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 08:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18CD5281322
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 07:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0329C185B4C;
	Wed, 13 Nov 2024 07:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJDpiXFS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30135885
	for <linux-media@vger.kernel.org>; Wed, 13 Nov 2024 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731483470; cv=none; b=okgMvAClyh71FHPpBgZXDidi7kHVHMk+jvSkGnKUZXGXgDuE7uKXSAb6awibblP20bjg0Wnxq0M/rKZvJnh/hvRxYmYK0wAJwIz0PTNq7FbYuEZVs4asqJ3YPYytmj07Fu8DLa/jh2scJx4Hnncjs0+bhFOJwC6IdMyabMeckJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731483470; c=relaxed/simple;
	bh=+oAZzdOKyU5yK8oEN1L/lE/z4p47QVmZtXhprDUZ/eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRBzSpuIjKCqIDiJ5SZYuwLHriBwhWvVza2lT4aWX1aKo7h+msemVyDDKn47yfTXSPJOV8YS3+1s7hBys/sxgJ1Jg6SrhQRNzgkDb2hBHRRunHiOIRUSqZ9H9GB2vOtH+04jETk1fTU0K9txq/4JAej2n0sb0T43snHtCYDzvcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJDpiXFS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731483469; x=1763019469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+oAZzdOKyU5yK8oEN1L/lE/z4p47QVmZtXhprDUZ/eo=;
  b=QJDpiXFS+aZCO0BcW8z00XFbOnF1OcVhvEiZaxpSxImBL3JiC9z8UulR
   qfGhLGaSUdHHJWCvCw5fxGwWRYsVKlGxkA0hh7uB88tul1nBUjHVMqjGB
   neDrKBgTojWKSLtz7Vetjy0Ml02mV/vqVVQYC7psdq3UGQ+Riqymqmg5/
   iCHNy3PQd/UIT5LcOmJh0FlQ+1pzk2mPzW+XxBSzQDRKYg4GshV6q1+d0
   pmGEQvwV9TcFnth+NIJbWHCoTBZe2Ul7Jge1Xcwg44T1mW/bqHaO+IX9p
   TGqJwam6lPchFP/dfRfVQdehO5PmPdzU2lPBhqYEq/3d7fQPMPg2wZiwP
   g==;
X-CSE-ConnectionGUID: vsM8H4bsRsODczsdfyhF/A==
X-CSE-MsgGUID: 5+wy7n+/S1OkbNmlfZAyvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31471859"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="31471859"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 23:37:48 -0800
X-CSE-ConnectionGUID: cIkmG30zR0KICf46jlHPaA==
X-CSE-MsgGUID: Kj+gVWQLR5+/PGDs34W7PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87945254"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 23:37:44 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ABA1D11F72D;
	Wed, 13 Nov 2024 09:37:41 +0200 (EET)
Date: Wed, 13 Nov 2024 07:37:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 4/4] media: v4l: ctrl: Add V4L2_CID_CONFIG_MODEL control
Message-ID: <ZzRXRWoWjQ0zgRda@kekkonen.localdomain>
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
 <20241011075535.588140-5-sakari.ailus@linux.intel.com>
 <20241022194253.GE9497@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022194253.GE9497@pendragon.ideasonboard.com>

Hi Laurent,

On Tue, Oct 22, 2024 at 10:42:53PM +0300, Laurent Pinchart wrote:
> > index 8ec801998f5f..d4ae921b69c8 100644
> > --- a/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > +++ b/Documentation/userspace-api/media/v4l/subdev-config-model.rst
> > @@ -1,5 +1,7 @@
> >  .. SPDX-License-Identifier: GPL-2.0 OR GFDL-1.1-no-invariants-or-later
> >  
> > +.. _media_subdev_config_model:
> > +
> 
> This could be moved to 3/4.

Yes, that's where it belongs indeed.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

-- 
Sakari Ailus

