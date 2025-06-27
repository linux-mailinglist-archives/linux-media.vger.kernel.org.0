Return-Path: <linux-media+bounces-36124-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5176AEBCC5
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 18:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 225F3172110
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 16:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E192E9EBE;
	Fri, 27 Jun 2025 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHqgHXIi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84281A316E;
	Fri, 27 Jun 2025 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040214; cv=none; b=EXtVT57TNSb9zqABPnRbQcUDnLqasY85hJOQyBT7+qAqqO6N4QnB8ACMNr1S+U+LQAnLiEkeq31wkbN2fjBcfe/R7rHOxjzU1sVKF09egOiA1y200Z5TMTlczTFdT2EwY1VKh2Ju0Tr95umJd/9NUIZ5YOaE8UQYjqb0S3nQwzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040214; c=relaxed/simple;
	bh=SweOwYIisz+RSUn+EV34sWhAEWNmOQ/nrZuEKIbq+FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mOL3xrl5zD7R5yhBcWTMlRYD/Mj7JtlpHCV30k1pAEcDHBL/BHWuJOnMKpsIB3pS8LI5U2+jj1Mfw3K1+5z/ARyWqbUsKCpZwxRibwswxhslEacgqMA/YhUHZN5DgBk4vZBi99AEsgHf66P7plx0K9hjMBnjpK/V79isDpMnUf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHqgHXIi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751040213; x=1782576213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SweOwYIisz+RSUn+EV34sWhAEWNmOQ/nrZuEKIbq+FE=;
  b=WHqgHXIiivfUG16HKFKKMrZZdyPiKEt8oVdjJ5TAhRSJa7JFzRIc3rP9
   D2cft4Qm7iteCNqPON2NEnSwTrU1JA5hIciNenNtLVN6HB4VoD+CQbej1
   BLIClmCuRGVjhl3dhUVPtDuPrUJIhURn3H0ODk5hZgKaYdCVH7Xek62mJ
   BfkvMP2XdQhKPRT3TIPBRqdoOXFDFpwzoWovyRczy3KskjPjjiEB6VauA
   hrms4wVuyHD8gfUMtlSE4rI2R7PQIDygaDtA+Q/3Gu/4RiVRFiiz5kZNr
   Uw0Qel+Zt3yZJX71KJhwcMata2ucr/SxfxNvEl3kDm16xzc7S+PcbqeiZ
   g==;
X-CSE-ConnectionGUID: k+k9WHYvTgeD7uVbTOfXCw==
X-CSE-MsgGUID: B/oxBymCQqOYfWxdqTEClA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57165016"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="57165016"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:03:32 -0700
X-CSE-ConnectionGUID: quOsVAcRTJ28fr/y7IVW6g==
X-CSE-MsgGUID: d3bnjaQxQWCDqXv3mdySOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153326466"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 09:03:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uVBXx-0000000AWur-1dH7;
	Fri, 27 Jun 2025 19:03:25 +0300
Date: Fri, 27 Jun 2025 19:03:25 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6] staging: media: atomisp: apply clang-format and fix
 checkpatch.pl errors
Message-ID: <aF7Azdn8G8EloJsH@smile.fi.intel.com>
References: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-bar-v6-1-b22b5ea3ced0@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 10:56:09PM +0800, LiangCheng Wang wrote:
> Applied clang-format to the entire AtomISP driver to improve code consistency,
> readability, and adherence to Linux kernel coding style.
> 
> Additionally, manually fixed all checkpatch.pl-reported ERRORs across
> the driver, including:
> 
> - Macro definitions with complex expressions now wrapped in parentheses
> - Removed unnecessary parentheses in return statements
> - Avoided initializing globals to zero
> - Fixed invalid spacing around unary operators
> 
> This patch only includes formatting and stylistic changes with no functional logic modifications.
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Link: https://lore.kernel.org/all/aFwSgCtrK7DH3pIw@smile.fi.intel.com/
> Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
> ---
> This patch applies clang-format to the entire AtomISP driver and manually
> fixes all checkpatch.pl-reported ERRORs. The intent is to improve code
> consistency and align with kernel coding standards.
> 
> Formatting and error fixes include:
> - Replacing space-based indentation with tabs
> - Wrapping complex macros in parentheses
> - Removing redundant return parentheses
> - Avoiding unnecessary zero-initialized globals
> 
> The following tools were used:
>   clang-format -i $(find drivers/staging/media/atomisp/ -name "*.[ch]")
>   ./scripts/checkpatch.pl -f $(find drivers/staging/media/atomisp/ -name "*.[ch]") | grep '^ERROR:' -B 1 -A 2

> WARNINGs (~1500) were intentionally left untouched to keep this patch
> focused and reviewable. These may be addressed in future patches.

Thanks for this version, but no need to send such a huge changes.
Just make a public Git repo with it and provide just a cover letter.
This is unreviewable.

Looking at some changes it might be doubtful. Perhaps we need a modified
version of .clang-format for this driver. Dunno. It's up to Hans, and others
are welcome to share their opinions.

In particular I'm referring to the change of amount of TABs, like

#define FOO		1234

to

#define FOO 1234 // if it's even a TAB there!

-- 
With Best Regards,
Andy Shevchenko



