Return-Path: <linux-media+bounces-27938-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD40A5920A
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 11:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A77633B0391
	for <lists+linux-media@lfdr.de>; Mon, 10 Mar 2025 10:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E6722AE45;
	Mon, 10 Mar 2025 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQXiWrOF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C6F226551;
	Mon, 10 Mar 2025 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741604046; cv=none; b=KzQwGRKaGtpgk5Sn8j8Eft27K3vmF9dpz3nILKCPAoFLr+eGAjNwSsxnT9RqWTv5prb1uQsKo0gyIZ4nG7Wa+RL23rEULVnWgZFmJpUcqVlKCeYPa6LehUIjFA0yQQl7DiTTh01HFmLxinHem8Ppxa/tfm9S8JdKrA97zF1BMAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741604046; c=relaxed/simple;
	bh=u2MGQHdDaiZeIev78bZy1eKc33/NKy5fd0vcNmADJxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pj0pYRtqG2aMAvlHIhSky+pMFudYzkHB3c5kSmTVigyyrVb7azE14KVNiFxl8lulLlkKDGHHbSyJDPIFsLY8/54V6u/mgHrJxSr64UA+LLNN4LyYokXTK/9JfTyqtdZtiRF6XukSsqSP32UrEX8jeKGQEUv5ibQ7rdk7P9uUF4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQXiWrOF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741604045; x=1773140045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u2MGQHdDaiZeIev78bZy1eKc33/NKy5fd0vcNmADJxw=;
  b=iQXiWrOFyeqtKez9Irf3mYhM8aIJS+2WtqATXSTrsDETHEyVkHOLVBM0
   bcZNNemvYE6LC1sZBL7YxGMtA/FAok2LjRHn2Jv02pfee+z/ZPko5VucR
   6IOUI55D3KSykM+zjTa63hfmKdcZTnrW6ef5//Z8s+l7OCRvKnrXnVuYW
   Mutpgm3byLQaRsSTXs+Jz6vGngJOW46Pzhqv7zjyAZ9oTh8LVDlhl+1dQ
   L1hFHNX4pseath43bk4HToMNQeUzR85/ezzzfUzqdUAfolp2n2917wgwX
   P0kId9vpPZ8YabifpQ7iTaIiloPuMER/LsDpKSZQk7QA9O3zPxY2rG8MI
   A==;
X-CSE-ConnectionGUID: 2L2nkd5lRwWZFKJFMiwr6g==
X-CSE-MsgGUID: tyf48xQcTT2P52Yz3qAplQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="41842590"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="41842590"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 03:54:04 -0700
X-CSE-ConnectionGUID: pGZrVqOlQeeULPw4XNpgqw==
X-CSE-MsgGUID: j4/LTaz7TPi1TY6JDLp5Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119936919"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2025 03:54:01 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 561E111F7F0;
	Mon, 10 Mar 2025 12:53:57 +0200 (EET)
Date: Mon, 10 Mar 2025 10:53:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: eugen.hristev@linaro.org, mchehab@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, hugues.fruchet@foss.st.com,
	alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, andriy.shevchenko@linux.intel.com,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Convert media drivers to use devm_kmemdup_array()
Message-ID: <Z87ExUkOnaHpfxfE@kekkonen.localdomain>
References: <20250228073649.152157-1-raag.jadav@intel.com>
 <Z86KeDfg9GwFBpGQ@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z86KeDfg9GwFBpGQ@black.fi.intel.com>

Hi Raag,

On Mon, Mar 10, 2025 at 08:45:12AM +0200, Raag Jadav wrote:
> On Fri, Feb 28, 2025 at 01:06:47PM +0530, Raag Jadav wrote:
> > This series converts media drivers to use the newly introduced[1]
> > devm_kmemdup_array() helper. This depends on changes available on
> > immutable tag[2].
> > 
> > [1] https://lore.kernel.org/r/20250212062513.2254767-1-raag.jadav@intel.com
> > [2] https://lore.kernel.org/r/Z7xGpz3Q4Zj6YHx7@black.fi.intel.com
> 
> Bump, anything I can do to move this forward?

The patches these depend on (those adding devm_kmemdup_array()) aren't in
the Media tree yet. They don't seem urgent though so I'd just wait.

Speaking of the patches themselves: I'd use *array instead of array[0] for
sizeof argument.

-- 
Regards,

Sakari Ailus

