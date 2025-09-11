Return-Path: <linux-media+bounces-42330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6EFB531D4
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 14:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6963ABA2F
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 12:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E7C3203B9;
	Thu, 11 Sep 2025 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFSpG9NZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E5730E839;
	Thu, 11 Sep 2025 12:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757592901; cv=none; b=irT9kWIxEt7G3XbDribQUeWNx+n/brVQT3sOfS3lzesAd739dndbhs687L2SV/EOaBusX0AJlswJJY/e/emNTsudSkwEw79BCTR3aiPNp7J1h/U9GoqsARxAFjvwwM4YObiZp0aiCrOxR1lfKOS/9O3G5lpaZo19/h5ODiYGprc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757592901; c=relaxed/simple;
	bh=N7a7r3HteSZna52mR1fkckk8ZEMlEjNaoxOclceRim0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upjbcTd8aRHwSAK/Ud5wFjb5IfqAJ+XFmytgyNj+5FlXI3bZ8Oz9mH0BKnZ+JyjoWclJwrAb47k4mD1v8q+WPrtQyc100rwaInS+Tt5DDzzRBOHpYPBZo91AxwzOsssUBNbCQHaLtmkhm70jA/z47pXxDXiMK2Vjp3hx8MajUhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFSpG9NZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757592900; x=1789128900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N7a7r3HteSZna52mR1fkckk8ZEMlEjNaoxOclceRim0=;
  b=VFSpG9NZTv2c5mpWSrw42O0Rr4HPwtg/YYQBqd5galEDoUOEtcNQWX2K
   830Vti5DsEdXAk7hli0MUZ3GSaTSUq1XDBj+MRATwVHVubh105pOi3F1L
   8zUMvAiMGEQXuX0zlXsTT4z7pqYEQbuzym0s9FHLGSH7rFM7XhhCiRK+7
   5Ktt09PW9p0bJHRX3PJf51oOH7MBz/sZ/JarpVbfrtKUERA9lyuZuRsmT
   HvSRLlQa1JcDnXOx6hSHxwNsU3sE/XK2ZZ6uqY7k5N2zMBEBoE+QO7wQp
   eJ8JyH1WsfkygaMTgpWrL9TWVBEAoD7ZukwRcj4Jm9T4ea/wkodwplId8
   A==;
X-CSE-ConnectionGUID: 8+d5RsDWQoi5qVW5BoRY6w==
X-CSE-MsgGUID: S6Q8lQCISoSZpEeSelhIcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77532762"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="77532762"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 05:14:59 -0700
X-CSE-ConnectionGUID: wirAOIDSQ+qmUTJG526ilQ==
X-CSE-MsgGUID: H85REsf+RI6zF7t8M2EOWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="210807215"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 05:14:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 863771201BB;
	Thu, 11 Sep 2025 15:14:53 +0300 (EEST)
Date: Thu, 11 Sep 2025 15:14:53 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Martin Hecht <mhecht73@gmail.com>
Cc: linux-media@vger.kernel.org, michael.roeder@avnet.eu,
	martin.hecht@avnet.eu, Tommaso Merciai <tomm.merciai@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: i2c: alvium: cleanup media bus formats
Message-ID: <aMK9PQ62EYeJpgeo@kekkonen.localdomain>
References: <20250909135938.2841635-1-mhecht73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909135938.2841635-1-mhecht73@gmail.com>

Hi Martin,

On Tue, Sep 09, 2025 at 03:59:37PM +0200, Martin Hecht wrote:
> This patch removes MEDIA_BUS_FMT_RBG888_1X24 and MEDIA_BUS_FMT_BGR888_1X24
> as of that formats are not supported by Alvium currently.
> The missing and supported MEDIA_BUS_FMT_RGB565_1X16 has been added.

What's the pixel order used by the format in Alvium case?

-- 
Regards,

Sakari Ailus

