Return-Path: <linux-media+bounces-15415-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 818ED93EE98
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 372C51F22561
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 07:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5149812BF23;
	Mon, 29 Jul 2024 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vsifve2c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A90823A9;
	Mon, 29 Jul 2024 07:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722238666; cv=none; b=HI/8EERatIZEqM63fNz9JaBvuGUzhYK7FlfMpVroYtzeuuGCYuInL9QLk0XN6nDpQnf3awCIRE/J0lLbpgTMOZYAPvDIhMsj+zKvaiBNqe5ksgz2KQmj7VLIReEsorsQfPO+01BDt/X3vqUAy82p/xlBFTOI+A0mw/Q4TLz1R8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722238666; c=relaxed/simple;
	bh=ZBoqFreWAKMqFYjh2gTvIGOAWHVQUwkpk+FeSPzwiM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQLxEyQsrjRfuym47u/pa7Vo03S1hQSlYSqn6eTOnkqLcftOofTECBmdcX4ZRXd9r6jmHfMR5YNhIrRfNqE0l93q4lQYEOozOygOmiqp6uSgeZJcocdW/e4egnAVxeSJx3rvtbfq/LP2ckEOAVYcskdMN4Knmcw9Hbm9obmhAg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vsifve2c; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722238666; x=1753774666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZBoqFreWAKMqFYjh2gTvIGOAWHVQUwkpk+FeSPzwiM8=;
  b=Vsifve2cExh5BiEOzL7SDqY/6hmZkTZ1EM0bMlBTmlpgyobTgwUOpcnn
   HUYQuoPJw97P/Rg2l98VFiCTzpq/mtXyz4AYSirWOyC9xDkx4gC2nzoay
   AMblwjLUdJA6jlnJKz6XJPOoXvzT3ZUfCoPWWp3mxlfER9O3NA7y7lRVa
   I9T+38fHohP8dCxnR8l4OPHblJ1WyPyDZNMA6DMmLGNqQuJIhZRhnkOdS
   1YncafDrIejAzkCn59O7aT+J8AnLn08rsjDP75nDlBxHgs41c/JpCRtqH
   uUUra97XgHfWfd29Ukpf4TgVV9lyLxD7L53oxjNKWk4xJ+Vy6lkkcpnDv
   w==;
X-CSE-ConnectionGUID: UeMst2okRdu0VV7DTgg18A==
X-CSE-MsgGUID: dSGdPRJLTAOBSR2YBhwKbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="23726735"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="23726735"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:37:45 -0700
X-CSE-ConnectionGUID: oqRTXN42TeSeVTE4mc8DrA==
X-CSE-MsgGUID: WOie8nfDRFWCj8eeanvpdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; 
   d="scan'208";a="54682805"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 00:37:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A51E911F8A8;
	Mon, 29 Jul 2024 10:37:39 +0300 (EEST)
Date: Mon, 29 Jul 2024 07:37:39 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: fix ipu6 Kconfig dependencies
Message-ID: <ZqdGw9dIGameP2j9@kekkonen.localdomain>
References: <20240719095403.3607027-1-arnd@kernel.org>
 <Zqc-tY7LPLdEbZ-9@kekkonen.localdomain>
 <c05a72dd-1821-43ba-b3b4-caa9334e4016@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c05a72dd-1821-43ba-b3b4-caa9334e4016@app.fastmail.com>

Hi Arnd,

On Mon, Jul 29, 2024 at 09:24:23AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 29, 2024, at 09:03, Sakari Ailus wrote:
> >> To make it consistent with the other IPU drivers as well as avoid this warning,
> >> change the 'select' into 'depends on'.
> >
> > Thanks for the patch. I'm not sure how I managed to miss the IPU6 driver...
> 
> The driver was only adding in 6.10, so your patch was correct
> at the time.
> 
> > I think we also need, besides IPU_BRIDGE, || !IPU_BRIDGE, as the IPU_BRIDGE
> > has additional dependencies (I2C) compared to VIDEO_INTEL_IPU6. I'll add
> > that while applying. Please let me know if you have concerns.
> 
> Makes sense, yes. I went with a hard dependency since that stays
> close to the current version with the select. I tried build-testing
> IPU6 now with IPU_BRIDGE=n and I2C=n/I2C=m, which works fine.
> 
> However, the testing showed that IPU6 also missed a 'select AUXILIARY_BUS',
> which I had not found in randconfig testing because that usually gets
> selected by one of is other 30 users.
> 
> Since you are changing my patch already, maybe you can also add
> that at the same time. Thanks,

Well, yes. I got an lkp test report on this and wrote a patch to address
it:
<URL:https://lore.kernel.org/linux-media/20240729071026.3775341-1-sakari.ailus@linux.intel.com/T/#u>.

I'll send a PR on the two in a few hours if there are no further issues,
hoping to get it to rc2.

-- 
Kind regards,

Sakari Ailus

