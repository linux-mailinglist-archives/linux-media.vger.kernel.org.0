Return-Path: <linux-media+bounces-36161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B56AECC68
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 14:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BB3B3B69E6
	for <lists+linux-media@lfdr.de>; Sun, 29 Jun 2025 12:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E222D21FF2A;
	Sun, 29 Jun 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4Uc2yrP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1371F874F;
	Sun, 29 Jun 2025 12:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751199624; cv=none; b=IM+byBxtP8+XP6NV0R4Rrw98aFMlHg9D0b2Y+5BlrZ5Ulr93uJv9IreHEcyMcwgBNhB28uWq/0V56NUI59630lFkXTYpYRwDvkk80x1kNsBx0D1nr9aKWPxzbz4XBCOolxole9jlrQwVIgQ6jPnx+uaWQBLngYqPHFTvnzZ1lbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751199624; c=relaxed/simple;
	bh=fTzdlGh9Pcdfm/0RiYus2NYodJ5WZ23FXS7/H5ojTVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oG8xuB6cAJ/YLqn/PX4cDQulW0LnmVjR+bMvB06SVrB0JaCoCTOYsATmjV0nMqbMxy1weyVxEcAl/KWtD6bVqzDeHD/lzp1cHrXsNdomlfuRh++j3Exs9/tKmV5sRxQzFiVMmOckPyNbJnhEsTOwukzRZVfzSnk+jxliBTyMzHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4Uc2yrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43511C4CEEB;
	Sun, 29 Jun 2025 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751199623;
	bh=fTzdlGh9Pcdfm/0RiYus2NYodJ5WZ23FXS7/H5ojTVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P4Uc2yrPdKey1PujxWvlSsVps5PYz1Jdm64qppsKHmCfD1JVGef2OmFIXInCpAgwp
	 AicbIRYH8GywokEcFHDOUA6izk96lgg+/V6SK4J+EdeyXIBFHqsWL2kKOfDZPon7jc
	 dAaTIFGBNtclG/i9+LVDRvVoBDN5qmCs37Z9ehHQiJ6ahQrckeTQM7BQbJ0IiYnd+c
	 uD+WF2OJdKNxGoMC6Du2BvBQudu/o7VfnkKn+Q4ihvpK/aYIi3amna006fOpyC0BBA
	 I8LkIEn2zEl8UOYjkGLAYnPQqMyavxbsvOZfHSNVaITsBFwKr+qpQIGM4FxCN7Hl21
	 pgnz09+7UbGeg==
Message-ID: <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
Date: Sun, 29 Jun 2025 14:20:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: LiangCheng Wang <zaq14760@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, andy@kernel.org, gregkh@linuxfoundation.org,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
 justinstitt@google.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, llvm@lists.linux.dev
References: <20250629113050.58138-1-zaq14760@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250629113050.58138-1-zaq14760@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 29-Jun-25 1:30 PM, LiangCheng Wang wrote:
> This series applies clang-format and fixes all checkpatch.pl-reported ERRORs in the AtomISP driver, excluding the i2c directory as advised by maintainers.
> 
> The changes include:
> - Applying clang-format (excluding drivers/staging/media/i2c)
> - Removing unnecessary parentheses in return statements
> - Removing unnecessary zero-initialized globals
> - Fixing space issues after unary minus operators
> - Wrapping complex macro values in parentheses
> - These patches focus solely on mechanical style cleanups with no functional changes.
> - WARNINGs reported by checkpatch.pl were intentionally left for future work to keep each patch clear and manageable.
> 
> The full series and corresponding commits are also available in my public Git repository:
> 
> https://github.com/lc-wang/linux/tree/b4/atomisp
> 
> To: Hans de Goede <hansg@kernel.org>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> To: Andy Shevchenko <andy@kernel.org>
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Cc: llvm@lists.linux.dev
> ---
> Changes in v7:
> - Split previous monolithic patch into multiple smaller patches
> - Applied clang-format to entire driver excluding i2c directory

I took a quick look at just the clang-format patch and looking
at the bits of the diff which were not collapsed by github because
the changes are too big, it looks like the changes which clang-format
makes are useless and often make things worse, e.g. just looking
at the first diff which github shows for:

https://github.com/lc-wang/linux/commit/8a3bbdba275e42dfcb0af2ddcc2f27463bb316d2

which is for drivers/staging/media/atomisp/include/hmm/hmm.h
then all of the changes are undesirable and unneeded.

so the running of clang-format just seems to make things worse.

I appreciate coding-style cleanups outside of the i2c dir,
but it looks like you need to do everything manually since
clang-format is just making a mess of things.

Also if you do manual code-style cleanups please do one
type of cleanup per patches, e.g. only fix indentation
using spaces instead of tabs and do so on groups of say
10 files at a time to keep things reviewable.

Regards,

Hans



> - Fixed checkpatch.pl-reported ERRORs (parentheses in macros, unnecessary return parentheses, zero-initialized globals, spaces after unary minus)
> - Left WARNINGS untouched for future cleanup
> - No functional logic changes
> - Link to v6: https://lore.kernel.org/r/20250627-bar-v6-1-b22b5ea3ced0@gmail.com
> 
> Changes in v6:
> - Applied clang-format across the entire AtomISP driver
> - Fixed all checkpatch.pl-reported ERRORs
> - Added explanation of tooling and scope
> - No functional logic modified
> - Moved 'Suggested-by' and 'Link' tags above Signed-off-by
> - Link to v5: https://lore.kernel.org/r/20250625-bar-v5-1-db960608b607@gmail.com
> 
> Changes in v5:
> - Replaced space-based indentation with tabs in output_1.0 directory
> - Used checkpatch.pl and grep to identify formatting issues
> - No functional changes made
> - This patch is now focused solely on tab/space issues
> - Link to v4: https://lore.kernel.org/r/20250624-bar-v4-1-9f9f9ae9f868@gmail.com
> 
> Changes in v4:
> - Moved assignment operator '=' to the same line for static struct definitions
> - Remove unnecessary line breaks in function definitions
> - Update commit message to reflect all the coding style fixes
> - Link to v3: https://lore.kernel.org/r/20250622-bar-v3-1-4cc91ef01c3a@gmail.com
> 
> Changes in v3:
> - Removed extra spaces between type and asterisk (e.g., `*to`) in function
>   declarations, as pointed out by Andy Shevchenko
> - Update commit message to reflect all the coding style fixes
> - Link to v2: https://lore.kernel.org/r/20250621-bar-v2-1-4e6cfc779614@gmail.com
> 
> Changes in v2:
> - Fix patch subject prefix to "staging: media: atomisp:" to comply with media CI style.
> - No other functional changes.
> 
> Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com
> 
> --- b4-submit-tracking ---
> # This section is used internally by b4 prep for tracking purposes.
> {
>   "series": {
>     "revision": 7,
>     "change-id": "20250621-bar-573b8b40fb80",
>     "prefixes": [],
>     "history": {
>       "v1": [
>         "20250621-bar-v1-1-5a3e7004462c@gmail.com"
>       ],
>       "v2": [
>         "20250621-bar-v2-1-4e6cfc779614@gmail.com"
>       ],
>       "v3": [
>         "20250622-bar-v3-1-4cc91ef01c3a@gmail.com"
>       ],
>       "v4": [
>         "20250624-bar-v4-1-9f9f9ae9f868@gmail.com"
>       ],
>       "v5": [
>         "20250625-bar-v5-1-db960608b607@gmail.com"
>       ],
>       "v6": [
>         "20250627-bar-v6-1-b22b5ea3ced0@gmail.com"
>       ]
>     }
>   }
> }


