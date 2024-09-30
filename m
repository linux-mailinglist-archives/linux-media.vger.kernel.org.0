Return-Path: <linux-media+bounces-18866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A656898A48D
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 15:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EB571F24E46
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 13:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4359191F77;
	Mon, 30 Sep 2024 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U285OPX8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B9718F2FD
	for <linux-media@vger.kernel.org>; Mon, 30 Sep 2024 13:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702170; cv=none; b=KdZFiDRnUd4/Fkfe+BBYFQdINfnthk5AqKzZ+Zh2M9Y+ql58k5QzAehAJR48Y5vCKSY51l3aIS7vci80Mol5QqsgG9YdnA8gwSX9DCF3vZPq5d0yhvqYnZNziMVLu6skurYoLZSR0XCgr5qGwq8Hg7a03uW38E4/R0USUPmgrds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702170; c=relaxed/simple;
	bh=wBnbEa44GT84Kf+ueaheck0Qf1oTiufyz1dxUkNu+9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reghU23T2PeSxLcr1uIERBwJ5NGGyVvy9PPVtuLcdgc16ARWgEyZFztH9n5CUX6/cqif1fds6v1yFg6Teq2Vuj08xAgJJgY4juO0LTr6u5eyZYHQeyyM2Jsny+4eOn3QgvfoYMDTO4b6dMLpVRf+kpNJxnqs1V88lmW2ppdfUGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U285OPX8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727702169; x=1759238169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wBnbEa44GT84Kf+ueaheck0Qf1oTiufyz1dxUkNu+9M=;
  b=U285OPX8qlzMn+7MvDfXXFZ/O/wvj4yUSVeY/eTTT4iWkDGK8IJNerMN
   I7R64m2WEpO8yNGS1lBuPS+3khpZVXUEtyxEvDl/DehPnpqnw6M1kraVf
   pUBRRwYSrBORE3JTvKU46Ev881w21Gqv9JzEJayoiCNm4U0Z0z2c3m5C4
   4qeCbr0aVQ4hCoF0BY3pQ+W+I7ENifZRktR+b+d+pcT39cnkZTM+7ECwT
   1lJ/BJ6zcyGuvyAOw+qM6TGwS9FRUQX3UYezzMY6Wx4C9g+iYlsBimCXE
   wO5eVjV2C81kysCEB5LCS7Uw0yZtOE5hC3z2eJEusrer2OInQpMk4IyAT
   w==;
X-CSE-ConnectionGUID: KeRbloMGSYSv6/A/1NwT9A==
X-CSE-MsgGUID: N0NV7e6pT4KnWH1e9ALkBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52202822"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="52202822"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:16:08 -0700
X-CSE-ConnectionGUID: CbJpVDVzR9umAnaus9U0CA==
X-CSE-MsgGUID: nD1VgW7BT7mIzWjsdl8RoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73165981"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 06:16:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1svGFw-0000000Efb2-2kxB;
	Mon, 30 Sep 2024 16:16:04 +0300
Date: Mon, 30 Sep 2024 16:16:04 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: ipu6: remove redundant dependency in Kconfig
Message-ID: <ZvqklIPdFcSD9JT0@smile.fi.intel.com>
References: <20240927021613.2158020-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927021613.2158020-1-bingbu.cao@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Sep 27, 2024 at 10:16:12AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> IPU6 driver simply depends on X86, X86 and 64BIT cover the
> X86_64, redundant X86_64 dependency in Kconfig could be removed.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko



