Return-Path: <linux-media+bounces-16869-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3696028E
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 08:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8205C1F21D97
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 06:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BA3149C7A;
	Tue, 27 Aug 2024 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ig33DW6l"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069593A1C4;
	Tue, 27 Aug 2024 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724741812; cv=none; b=UMU7iRL5tChg63o/wstXoDUIgp1FyWzmknpQ9k3XFftEoKULGnONOTcdszI1IiMsJ0bCjsSglRa3vS5uG8WyU4ygNCEsj5kEQJQkNKrhTsCKxu4smFYyGcaYBnMneLgjT1QoJd4+CUBEGzsjP+iH+TCwPtyHN+Zzxb1lHyUzpZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724741812; c=relaxed/simple;
	bh=Sklu6BQa8UIa90kmTIVCwReorljZq3qBpyW5hyOb22w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbVTMHJXabMLaUjnd9SZKNtIH/PZ1UrxVZPhHxYrLyZjXNSfEp8p2NQiWkQU8qocgSIuSIm8iU154WG24h2ppvUJ8qp3RBCNLJ4KLWJC1Qwqi9zFi3vVpe31QLs4C/fu1mL436Rn400q2CAfWIYFV8GF9G9JboyFIGVQCzvb5EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ig33DW6l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724741811; x=1756277811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sklu6BQa8UIa90kmTIVCwReorljZq3qBpyW5hyOb22w=;
  b=Ig33DW6l3j23tbGHl5ItSUTdoMo23aGxrnjNVnlRH4YwpPQmMGfDJXMv
   wUzcyfRd/XncAzFm3qwuAD6ddPIfv7BkNwfdpOSs0WRYcLtDuj4Jj3N2C
   NTJ9kM19KcHbU1oawVX2UnK5h0Dm9nu/vVHBRghfYgFduOyx0jZXAi/QL
   bIZ0getxLYCfPcgMmR4RwOusR/zP9/u6fOWXIm3fmTeOwwWGeFbLEFJoy
   wb0XmxS0gfOGmSMbAAO5wSWxRh9S91Jc4GmNUs0XaT0LPpbt6q5MmdLvf
   nhhyMGDRH4P7AH+pa7kW+Z/4GXJWOGHq/IA8JJKMcY1w+lHqwdyGDi0em
   w==;
X-CSE-ConnectionGUID: jt4iycggTtqKtNrd7cnqOA==
X-CSE-MsgGUID: sv73TVFLSGWsjaUBAMVk2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="34573124"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="34573124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 23:56:50 -0700
X-CSE-ConnectionGUID: 0P7D2cfaRf+Y9QsLSErGNw==
X-CSE-MsgGUID: 41A4pYjXTk+03/YEG0sVKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="100266482"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 23:56:48 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 08DD811F965;
	Tue, 27 Aug 2024 09:56:45 +0300 (EEST)
Date: Tue, 27 Aug 2024 06:56:44 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Max Staudt <mstaudt@chromium.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: Fixing IPU3 IMGU warnings due to extraneous calls to s_stream()
Message-ID: <Zs14rHA2lGQibhRX@kekkonen.localdomain>
References: <20240620145820.3910239-1-mstaudt@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620145820.3910239-1-mstaudt@chromium.org>

Hi Max,

On Thu, Jun 20, 2024 at 11:45:40PM +0900, Max Staudt wrote:
> Dear IPU3 driver maintainers,
> 
> The Intel IPU3 IMGU driver no longer shuts down cleanly since v6.7,
> because vb2 now complains if s_stream() is called multiple times on
> the same object:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=009905ec50433259c05f474251000b040098564e
> 
> This series attempts to fix this, but needs a review from someone more
> intimate with IPU3 and its driver. Could you please have a look at this?

Thanks for the patches. They seem good to me, I've taken them to my tree
(devel branch).

-- 
Kind regards,

Sakari Ailus

