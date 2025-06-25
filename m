Return-Path: <linux-media+bounces-35878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DBDAE87B0
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 17:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC3CC7ACDF7
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 15:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0F926B76F;
	Wed, 25 Jun 2025 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVwg/mlq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C0A16A395;
	Wed, 25 Jun 2025 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864520; cv=none; b=LRJsIrwL71HE6kgNwDq4sHFrLn/B4BiVgvEvmzlxeBrQf7AzTYVwsYvKapjV9PC2KmGBBnQ4FQHasKPbMdow/42huKFu7QEZHleIkZl+VIn8StmI7KAEVN2pzenKxwkyUZ6rJoaGYsegou6Olb5GAmXbnkBpmWUAgwLSEzIpqeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864520; c=relaxed/simple;
	bh=X+geANwj+e06vg9CyGf+Mrs07Xd21aM6EWzSmqpFrec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4PjFcz9PO7A6Xkrq54XSL8n+meAeHrMn0+YJ9Qo8463Q37KL3WG4Yo3nIFgX6UtxWZVZj4IgH4bTjJf5NMDIJ90fGp3x50vXGI9wWKtk1sxYZ49O6BdHuNRPukRsoEuPiDYLvwVsn82Slj4QQ/VOA3BkueVoP82uvscHabmKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVwg/mlq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750864519; x=1782400519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X+geANwj+e06vg9CyGf+Mrs07Xd21aM6EWzSmqpFrec=;
  b=BVwg/mlqFIIQDcFI/laz/FDzZGUheABJwo2lXfxqiEpEO+f3yZy0Y1cl
   9jomIMZTd2vvje0L8dSD3yb2ahrB/VJWYFIIMIMqcd64Cra8cro+ZQ0mF
   M5gYJn0A4iz+CxiXDGBYxq1vgYGdG3zTOCV88BRAdmyokZLdr6/kzCjvT
   z5yMIJWdXonvQhKDNyVS27DfNsH8vgtAV/F6Tflnqtlz23+ZB2mec9a4f
   7ac0jYaiQfBZWEzuiaRpZ2tYRhtWMALMM1LDBbSxjWqDGC9sx15SH1/su
   M/z2+39rxwaafKCyeTCeMA+F/5awDz1kmy+ouAj7JBoF0wO5jdWu+vRcC
   g==;
X-CSE-ConnectionGUID: AxH8bmpSQY6cFigpry/R2A==
X-CSE-MsgGUID: fY+FM2zPS1S+igXfoommjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56925145"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="56925145"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 08:15:18 -0700
X-CSE-ConnectionGUID: Rw/epIH/SBarFV+yHcYMhA==
X-CSE-MsgGUID: lqDVQTLsT5apT5AeknqQrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152735245"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 08:15:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uURqC-00000009oWM-1sWm;
	Wed, 25 Jun 2025 18:15:12 +0300
Date: Wed, 25 Jun 2025 18:15:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5] staging: media: atomisp: fix tab/space issues in
 output1.0
Message-ID: <aFwSgCtrK7DH3pIw@smile.fi.intel.com>
References: <20250625-bar-v5-1-db960608b607@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-bar-v5-1-db960608b607@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 25, 2025 at 11:04:31PM +0800, LiangCheng Wang wrote:
> Fix indentation style issues by replacing spaces with tabs,
> according to Linux kernel coding style.
> 
> This cleanup improves code readability and follows Linux kernel
> coding standards.
> 
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
> This patch addresses tab/space indentation issues in the
> output_1.0 directory of the AtomISP driver under staging.
> 
> This patch is part of a broader effort to clean up the AtomISP
> driver and is scoped only to tab/space fixes in one directory
> to keep review manageable.
> 
> Further style fixes for other directories and issue types will
> be submitted in subsequent patch revisions or series.
> 
> Fixes were identified using:
> 
> ./scripts/checkpatch.pl -f $(find drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ -type f \( -name "*.c" -o -name "*.h" \))
> grep -Prn '^[ ]+' drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0
> 
> Only lines with space-based indentation (instead of tab) were changed.

> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Link: https://lore.kernel.org/r/CAHp75VeijMvnbrCmRuqTeo_maxevCA9rB-r5URHaX+TrDNvyGA@mail.gmail.com

These two lines should be just above your SoB in the commit message. Currently
they will most likely be ignored (at least by `git am ...`.

...

>  void
>  ia_css_output_encode(
> -    struct sh_css_isp_output_params *to,
> -    const struct ia_css_output_config *from,
> -    unsigned int size)
> +	struct sh_css_isp_output_params *to,
> +	const struct ia_css_output_config *from,
> +	unsigned int size)

In cases like this you might want to also reshuffle the lines:

void ia_css_output_encode(struct sh_css_isp_output_params *to,
			  const struct ia_css_output_config *from,
			  unsigned int size)

...

Have you tried simply to run slang-format against the whole driver using the
clang-format configuration from the kernel source tree?

With it done, you may just make it as a single patch.

-- 
With Best Regards,
Andy Shevchenko



