Return-Path: <linux-media+bounces-34398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E31CCAD3114
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C66F6188F034
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF5F28A1DD;
	Tue, 10 Jun 2025 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMmFVw7e"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6F327E7F4;
	Tue, 10 Jun 2025 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546121; cv=none; b=FFDaqG57YpPvNvUl2f+CrT8I9FfgAE8dG00KbduQoLDHTz+ItLKdc4GEL5YShfWIF+te10PoIIuTV7YS902InNasAL0dL3r7pZ5lLjaERZjbRxYJenNr3yUv+sNrplWsxEGXefgLRxggRW72hsP8JSazY3kg9Y5ttOB+OTGy5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546121; c=relaxed/simple;
	bh=94LOGFtv9fju+jJlRWljh0ww2426M0bNiXZiK221vdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEALa1NBnQ4zCzof3kKrflQ8goDAm2UK7BY8Ef5lJqTYHLfdtEKna3X1ss6sisyow8ry8WzdE5RGaKWvGWhjwka7M6Fou+iUU+mMelrzfn60zuzV0KJtkXpb/LyJVP+aK4S/ZC2/9m4Lf8OYVtr5iexnYPwwY4XYmdbppFddGGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMmFVw7e; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749546119; x=1781082119;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=94LOGFtv9fju+jJlRWljh0ww2426M0bNiXZiK221vdM=;
  b=AMmFVw7e5RJevt8/f/I8vGG2UsluK7AxyJ97kfd9aUs0WIO9CPcZ/nwI
   J2fSyq8CRJnyynpKm+gGVbCJ3ezYpCDTGyAwjBIw/mGArmPmsq8b8FqSG
   LC7E+SLjDWxX5heG/BX8e1In9PcaR1hRLGgRiNDPFXFPLjQQ19tiyBsPg
   nAD0qWeV7oakpAkiZVB0oX4ZYcPisA8O1mlnFbc0DizwJnzYA0uUuzmxZ
   MhM+DSOP+k9oviSuACHHbvBXyuYJYUr/JBZRcHqSWigZdKVJbgZd2Yhm2
   sUXJA7d90AeyuZxli9DuexfSJuyMrCfKzlaLGbBWOBrPF7iK0UBdiLIcM
   w==;
X-CSE-ConnectionGUID: gwvIBT9ZTam3Pj+TQgHeqQ==
X-CSE-MsgGUID: yRJqsgLJR7GH5w5MMVeHIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51791400"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="51791400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:01:58 -0700
X-CSE-ConnectionGUID: Jh9SwRskQLmYX/BBDCtvrw==
X-CSE-MsgGUID: 3ML7GBduSDqHL0fwWoXSwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="152026984"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.169])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 02:01:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D636C11FBA0;
	Tue, 10 Jun 2025 12:01:53 +0300 (EEST)
Date: Tue, 10 Jun 2025 09:01:53 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] media: i2c: vd55g1: Fix RATE macros not being
 expressed in bps
Message-ID: <aEf0gdJ0hA2dNQoH@kekkonen.localdomain>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
 <20250609-fix_vd55g1-v1-1-594f1134e3fb@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-fix_vd55g1-v1-1-594f1134e3fb@foss.st.com>

On Mon, Jun 09, 2025 at 03:46:21PM +0200, Benjamin Mugnier wrote:
> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> ---
>  drivers/media/i2c/vd55g1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 25e2fc88a0367bf6a28bb22d209323ace99299f2..78dd22d9cab03edf4ff3e5a301f8d045e930c997 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -129,8 +129,8 @@
>  #define VD55G1_FWPATCH_REVISION_MINOR			9
>  #define VD55G1_XCLK_FREQ_MIN				(6 * HZ_PER_MHZ)
>  #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
> -#define VD55G1_MIPI_RATE_MIN				(250 * HZ_PER_MHZ)
> -#define VD55G1_MIPI_RATE_MAX				(1200 * HZ_PER_MHZ)
> +#define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
> +#define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)

As the meaning of Hz is just /s, I don't think the use of HZ_PER_MHZ was
wrong in any way above.

-- 
Sakari Ailus

