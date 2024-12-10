Return-Path: <linux-media+bounces-22985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6269B9EAB12
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A52D166C75
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0722D230D08;
	Tue, 10 Dec 2024 08:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gsepk7MH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3482309A7
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733820806; cv=none; b=Vgj1+l1jjZSAaSTziG20Mwhz3W0KTYQssxRWX6hGr0qfYipw6ypGdHFvBwdei0t/a19TTLsZ+pMPucDj12UQZD2YBJSk6KmsbrmH8FjIEKrE6lcaq/zq+t3lLCAJY5Awm7HtofqZEeP8L9oRO09x+mLWoQ07/NNkoe3GoFJ8gp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733820806; c=relaxed/simple;
	bh=n4CCrobvwaxk1bLxYmx5jgEZEe5haSgmop4usWbwfQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XIRNJXGsDDZGZuFNbfE9+3gtp7UvFZ2hHweA2MyPlENtMyedULRT8NbZdkSeZo01ZRWpf1i8ciMChiulMfqATteGAo5FUnz2kHIJ+YHsw5HT3wWwvRK9dzqDPKaFUCH6V52mZrDBLmEdGtzw6GtoAsRYA1rr9OIpU4g8kcH92+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gsepk7MH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733820805; x=1765356805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n4CCrobvwaxk1bLxYmx5jgEZEe5haSgmop4usWbwfQk=;
  b=Gsepk7MH1gHpH9N8x9DFTbq6BO/D9xSgespwsp3Dajq5xk2nPwzFLOP2
   hHMZ5GEZsJO5nm/8Jb6RTpjlKvYpc96AT6bIM4WUjHTn3Q9hsiTbr2iYV
   A5/fPiJUhJXk8n2hHvR9BHy4LBjXJSP4JpOQq7sh2gUDGTJ60Z7q8gZ14
   LbBoqCqe468DPbNQ2ZEOYTznk8rDs01QTEzON99nuSJIGzdNHwUS8zTsi
   gtYb5f2nM0zKxmmA9qpcmGHdA8IY0AEXiC8NL1L00ysBWAl0f2UtsfwMO
   dPwE0aMlYIuQvmGaf+INNoT4/d7+IfMlDxaib83iiBmJHnoTEa58TjjVx
   g==;
X-CSE-ConnectionGUID: GqV2UvL5SHmAcsofeFiS4g==
X-CSE-MsgGUID: iun9pZqqSACGgVIaSZKlSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34205847"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="34205847"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 00:53:25 -0800
X-CSE-ConnectionGUID: Pog/kPqvQE+nLh90B1ASGg==
X-CSE-MsgGUID: bmWwgYDgSYmTuqkf0VXYpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="99402905"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.248])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 00:53:23 -0800
Date: Tue, 10 Dec 2024 09:53:14 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH] media: ccs: Print a warning on CCS static data parse
 failure
Message-ID: <nswt4nx4mxffiuztczo5fihkgqzaotjocvqz5pielog4zs4yt3@b2svkrntu66l>
References: <20241209111738.79679-1-mehdi.djait@linux.intel.com>
 <Z1bXED_CbIvPUDUG@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1bXED_CbIvPUDUG@kekkonen.localdomain>

Hi Sakari,

On Mon, Dec 09, 2024 at 11:40:00AM +0000, Sakari Ailus wrote:
> Hi Mehdi,
> 
> On Mon, Dec 09, 2024 at 12:17:38PM +0100, Mehdi Djait wrote:
> > ccs_data_parse() return value is not propagated up to the probe
> > function, making it difficult on static data parse Failure.
> 
> Could you reword this by referring to the CCS static data library only?
> This would fit better for the CCS tools where the patch will also be
> imported to.
> 
> <URL:https://github.com/MIPI-Alliance/ccs-tools>
> 
> I also wonder if the CCS driver should actually fail probe if parsing
> fails: this is a very likely problem and quitting there would be
> appropriate IMO. Not every device might need one, so it should be just
> based on parser failure.

I would also think there is no point to continue probing if parsing fails. I
will send a v2 for this.

--
Kind Regards
Mehdi Djait

