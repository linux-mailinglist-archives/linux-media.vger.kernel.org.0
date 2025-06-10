Return-Path: <linux-media+bounces-34396-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D042AD310E
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4F03AD898
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA6828A1E2;
	Tue, 10 Jun 2025 09:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJAnBUZ0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1962B221549;
	Tue, 10 Jun 2025 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546035; cv=none; b=Nuy4X8c0P+xwbNSovultwwm1H2Jitqww8mA9Ij2rgr8KW+OZxBKvfp6ZYndsKowLxKAA61Ehn+DBnAFvr0hAEJb5RvOMoqa2uSE06CzQhdTU/2Nsjq5zOCa68ObMLEUWJ1VdkFtNaU95xyDZGo2BAMY29Ieg2NemqxZETqFehBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546035; c=relaxed/simple;
	bh=GRGUGaQD4J6K5ZIW1jOrHdrqBHO2wN7KIwDxsZ5e7gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKzV8k6hwWJ45LpP5DzeLSlXKIKY7EtzwGjRvIv4O9S9p+T/vUTiNiGzkHlpnRjnuSDmfGbd2SgQYousSzzfehcDQtxiKC05y4vU5ALMD+rgECwnoo0FZJnrtMoW3/4BWcL/WiqyvLrWbBh0rsDbknyk/a/h7Q3BIMPl0cF5Sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJAnBUZ0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749546034; x=1781082034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GRGUGaQD4J6K5ZIW1jOrHdrqBHO2wN7KIwDxsZ5e7gQ=;
  b=mJAnBUZ0RlVPpjt0y9JygOgSTGbeJlg4f8hkt42+Ua3cclzffhCnG5yM
   VCopNZxgYaGIUhoM9UqeQhQyPlpQsh2eh7rDczhtlttEPEfONzWOFble5
   i/raur/zc5EAk8j9rezASrpo5zDrX2OVusXdfAFj5+LNT14KaAeVlD0J0
   Sq0XiYT5gM2CBK0US5dfCz85+tLjW42fElKFLXvhn39gf4i95nTDT+wEy
   DqeMm5HmvDXQtBu06Nz8GyeVnFdjnKHvHxNb05CajrNP1yaskfUpdNWVz
   RPlYhLwSI0sIX+kECt5qrW4w9QUn/XsL06dcxrWl60axhd37jokxBtDwC
   A==;
X-CSE-ConnectionGUID: PsP/JbbNS1ium+EkOMzhWQ==
X-CSE-MsgGUID: zgMiiMpfQmWFCg0G33SYlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61916635"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="61916635"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:00:33 -0700
X-CSE-ConnectionGUID: 8Kqmqc2eQ7yeqGjxrEyRHg==
X-CSE-MsgGUID: FTO/EwDWSXOSGRz7Gsrh7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="169949648"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.169])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:00:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32C8711FBC0;
	Tue, 10 Jun 2025 12:00:25 +0300 (EEST)
Date: Tue, 10 Jun 2025 09:00:25 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: i2c: vd55g1: Miscellaneous fixes
Message-ID: <aEf0KcapklkWpBFD@kekkonen.localdomain>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>

Hi Benjamin,

Thanks for the set.

On Mon, Jun 09, 2025 at 03:46:20PM +0200, Benjamin Mugnier wrote:
> This series provides small fixes and style improvements to the vd55g1
> driver.
> Nothing fancy really, just to keep everything up to date.

On all (or at least more than one) patches:

- please add a proper commit message beyond the subject line and

- properly wrap the commit paragraphs (up to 75 characters per line, e.g.
  the above paragraph would fit on two lines).

-- 
Regards,

Sakari Ailus

