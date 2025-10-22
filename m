Return-Path: <linux-media+bounces-45217-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECC8BFB510
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 12:09:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D10B7508138
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 10:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9555320CB2;
	Wed, 22 Oct 2025 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H1LAxPRJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF0031B80D;
	Wed, 22 Oct 2025 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127681; cv=none; b=BApMuhIRlXMIKxJJe5n3RPSef1Oq3iZ7mpm/FzuChwo/NFfCBTr+SZoD4Mx/7DQwnWmw/oe9ZLD3YgQ1ZgRgP5kVzPEjJzudvyHrrBSDXtkqyJwcB6arSTAqGl0jZ4NG8wwMelDJCU5bIuXcxr2CKrLBKMvljOqX8FrLX+QrO9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127681; c=relaxed/simple;
	bh=2gWgs3JtkqrQlNaMUerxSTz5OsBLRFl9X1Eoptbmj+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tf/tchjgvFF0dgwmFQjO1/hi41YSUCmB0CJCWJtH5X01aoa8AWjAFomZx+oHpxvOSqENdh+wbaPL/Ntiu9T0igy9ihNSzwSvN2x2P39NCb1kXaB2Pb/bODmsxIiCeCFFaPLLKfCHwz/5hGsfjqJAnb5oMZ2IxtiAdRtxT1DYreU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H1LAxPRJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761127677; x=1792663677;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=2gWgs3JtkqrQlNaMUerxSTz5OsBLRFl9X1Eoptbmj+U=;
  b=H1LAxPRJbvAmfCA9Y1z1+PvYuM+QwgjaHg/qujkxFwxcRE7YIlD8vyLK
   qQh2agpfwI/XVlwUgQlxBsljJw9f9qRbG/I4yYK8J/CNmKT5QjVA++t3t
   rREYOON1kkwpgnljFSwLlFcp/VAT8GXB9atxK1lmTdWx1mF+U4oygsDjB
   1TMkIkOL6r0NJURx9+DFMLYSJoe8Lib6I3UhZ+/QWisDfwQFGgn+z7qGe
   NhfdiEjpgbau/bGPwNfN01UytuaxTDpU3e7ndjiBJeFWuSuj0YyCxen5G
   m3k0CYJnuqMhfnI9syEg3vsBDt9PhjO8HSb/myqufMmacYWpGdNRjzQOD
   w==;
X-CSE-ConnectionGUID: KTHn7FDMRVq7yU0SiLopSw==
X-CSE-MsgGUID: Y5j1jEWITZCNfYCxK+jebA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63173597"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63173597"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 03:07:56 -0700
X-CSE-ConnectionGUID: sOQyO88fRPmnmtVCeanZ6w==
X-CSE-MsgGUID: waVFlqmcTgeaiFoWUxhojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="207506486"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.104])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 03:07:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Biancaa Ramesh <biancaa2210329@ssn.edu.in>, sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, lkp@intel.com, Biancaa Ramesh
 <biancaa2210329@ssn.edu.in>
Subject: Re: [PATCH v2] Signed-off-by: Biancaa Ramesh
 <biancaa2210329@ssn.edu.in>
In-Reply-To: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251022043108.7197-1-biancaa2210329@ssn.edu.in>
Date: Wed, 22 Oct 2025 13:07:51 +0300
Message-ID: <bc4356efa91d65d5a2407ea8a2cfd54bb697cf4b@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 22 Oct 2025, Biancaa Ramesh <biancaa2210329@ssn.edu.in> wrote:
> -- 
> ::DISCLAIMER::
> 
> ---------------------------------------------------------------------
> The 
> contents of this e-mail and any attachment(s) are confidential and
> intended 
> for the named recipient(s) only. Views or opinions, if any,
> presented in 
> this email are solely those of the author and may not
> necessarily reflect 
> the views or opinions of SSN Institutions (SSN) or its
> affiliates. Any form 
> of reproduction, dissemination, copying, disclosure,
> modification, 
> distribution and / or publication of this message without the
> prior written 
> consent of authorized representative of SSN is strictly
> prohibited. If you 
> have received this email in error please delete it and
> notify the sender 
> immediately.

There are some obvious issues in the patch itself, but please do figure
out how to send patches and generally list email without disclaimers
like this first. Or use the b4 web submission endpoint [1].

BR,
Jani.


[1] https://b4.docs.kernel.org/en/latest/contributor/send.html

-- 
Jani Nikula, Intel

