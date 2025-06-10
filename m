Return-Path: <linux-media+bounces-34409-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF4FAD3247
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A42447A2569
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1672228B4EE;
	Tue, 10 Jun 2025 09:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T9jIF6F+"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53CF28AB03;
	Tue, 10 Jun 2025 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548353; cv=none; b=uff02r6ln7FHr8c45kzpilQeajmUXwEN9igW6vUUguISWw/jwhuWWgtBC4OxuM8OSz6isHeN0imonPMozzwpjLV+0Uv2WfZa57yA8IiA//6UyfeOxC4avMcAmCqP4THyrzv8c7DAhXhFnEeyucxoBIvXYdYkBFTteiJjbrpa/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548353; c=relaxed/simple;
	bh=0LexJ1DKyWm821GRgkoDRUbdIZqYmeJek4sQWiljJI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXafymERTFwp92RnSTuQtiVrl5VjRr9XO9tQ91MIavh9PpdmaxcZLLGcnhzcea/G5EYdWARaH4UEF0ShFLkz84KrbudPv1LtMI51MaNxYypRNHuH1mKdtOYzsR3JYQOO916Ih7qqmOCsNe3H8V2UhlV3DfflfzG7MbxhtMHphu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T9jIF6F+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749548352; x=1781084352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0LexJ1DKyWm821GRgkoDRUbdIZqYmeJek4sQWiljJI8=;
  b=T9jIF6F+PaFhuGchu4puDIyQSyeFxeY+oNqWhbVHTMhLNtrFn5u7NgnV
   8twz8lDo4v9gw3ocufjvsIRXLD6yFk49x+1X6Mc2cEsllaFavJ3XBStID
   mCOiihkjn/WP9mZqdvfn3eNhxLZKY3d1zwgKS4wTaiALc7D/T9Bw8tTfG
   dlV9UEEQDomU5h8sojuXlmZiwbQYQaQXcAoHFwIQ90KUK7nPCVM+h18ni
   CrXDHSU2wo0tR2AgfYrEIFIYH6Se0et2CUlyXzw+ACItqZRfMSXOKdzhx
   +yElOlGGRL+pXjN923Wky7+4GRqqHdLt/M0Gi5hHP8+bEUjp3KucUS2eP
   A==;
X-CSE-ConnectionGUID: YyQ2a4I5QxOnLYJOmbbbgw==
X-CSE-MsgGUID: WHwOrFj2Tz2RamslOQApqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="62305304"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="62305304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:39:10 -0700
X-CSE-ConnectionGUID: LKb9DclCRJm6G8QILItRgw==
X-CSE-MsgGUID: cCfDtmt6T/6QdUl7kPsP0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147145994"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.169])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:39:08 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0107811FBC0;
	Tue, 10 Jun 2025 12:39:06 +0300 (EEST)
Date: Tue, 10 Jun 2025 09:39:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: i2c: vd55g1: Miscellaneous fixes
Message-ID: <aEf9OfSWjp7id68A@kekkonen.localdomain>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
 <aEf0KcapklkWpBFD@kekkonen.localdomain>
 <55fd5868-0481-42e1-b56b-80f59d724364@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55fd5868-0481-42e1-b56b-80f59d724364@foss.st.com>

Hi Benjamin,

On Tue, Jun 10, 2025 at 11:31:05AM +0200, Benjamin Mugnier wrote:
> Hi Sakari,
> 
> Thank you for your review.
> 
> On 6/10/25 11:00, Sakari Ailus wrote:
> > Hi Benjamin,
> > 
> > Thanks for the set.
> > 
> > On Mon, Jun 09, 2025 at 03:46:20PM +0200, Benjamin Mugnier wrote:
> >> This series provides small fixes and style improvements to the vd55g1
> >> driver.
> >> Nothing fancy really, just to keep everything up to date.
> > 
> > On all (or at least more than one) patches:
> > 
> > - please add a proper commit message beyond the subject line and
> > 
> > - properly wrap the commit paragraphs (up to 75 characters per line, e.g.
> >   the above paragraph would fit on two lines).
> > 
> 
> Yes, commit descriptions have been added in v2. Media-ci rightfully
> yelled at me for that ;)
> 
> I don't see any commit paragraphs being above 75 characters, my vim
> seems to be properly configured.

It's not over 75 characters per line but some lines are shorter than they
could be.

> Do you mean the commit header too perhaps ? For example "media: i2c:
> vd55g1: Miscellaneous fixes".

-- 
Regards,

Sakari Ailus

