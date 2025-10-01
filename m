Return-Path: <linux-media+bounces-43458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBB3BAFC8B
	for <lists+linux-media@lfdr.de>; Wed, 01 Oct 2025 11:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7206F7B0F71
	for <lists+linux-media@lfdr.de>; Wed,  1 Oct 2025 09:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916DC2D8375;
	Wed,  1 Oct 2025 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcKfdHCe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01CF239E67
	for <linux-media@vger.kernel.org>; Wed,  1 Oct 2025 09:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309642; cv=none; b=oUFhRf05QNXVvIaOXBPQHZoFDn5i3QuttLgeK1UHgf302259R1A6xfJPatlx5XpEUDDEyS9BV6stj483yIvlizyxEO8A/gI1Bn0w/wjkFkgkkBpqfNE0TKFywuDLATEAVgO4S4HyJDCYirSlnkMcJr2HWGRZ5zOk2/6mTX+qx+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309642; c=relaxed/simple;
	bh=61Hg4K2dy0BUTpz/i7xRW51YGPZMRYcyAM0uqPSpHoI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LXY5wFpW+ceD/OF/ZUfuPJE0QvVJV8IMyhITeAjDGfD1aJC+MZ8p8EFiHV1Xwm2awxN7j8DJNk386B3/tHttPiY5c7e/hhaJq8GssINePv0SndDHeWBmZ01+aMtMXLv/PYF0XfwiKGLHoevkE/QNlf2yUpKTMSzsIXS7YnuXSDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcKfdHCe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBBBC4CEF4;
	Wed,  1 Oct 2025 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759309641;
	bh=61Hg4K2dy0BUTpz/i7xRW51YGPZMRYcyAM0uqPSpHoI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=hcKfdHCe1FR1qGDNlGG4gyTJ3OsNC1KH2A+nGp/tlFH75v2fLxHqExbA1TOWvfQGw
	 qpz4Rg+juxUUT3Sqtn7qIjTvaQ63Sj/h69f25TkPi1g+GeOohgnNzft98GHpu0Ykrz
	 AhTTpFZ+RTEHgVeU+4jSeexiz3CdIk6HU6JPU18ScUVYhxUOkgpcRaM5dqt4BGslMH
	 87mQlZza25aEoPBlwPX6q3TseTBhzOCMRRGH76/pq//v4Cg7ppzbA+QP4X0h8sQ56h
	 zX8YK94aWc/Ju9ei+G224HHwiJRxmMHuMCpCEzp7ioK2WDnyLGFcj+ID8LFw2YKfDy
	 g6n58HuK2dhDg==
Message-ID: <cf86611b-2acc-4fc8-a7a9-f2f1be76d433@kernel.org>
Date: Wed, 1 Oct 2025 11:07:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 1/3] README.md: fix mailinglist typo
To: Quentin Schulz <foss+kernel@0leil.net>, linux-media@vger.kernel.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
References: <20250905-readme-typo-v1-0-4262d4acd65c@cherry.de>
 <20250905-readme-typo-v1-1-4262d4acd65c@cherry.de>
Content-Language: en-US, nl
In-Reply-To: <20250905-readme-typo-v1-1-4262d4acd65c@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Quentin,

Can you combine these three patches into a single patch and repost? Please
use prefix 'v4l-utils:' so it is easy to find.

It looks good, but it is overkill to spread this over three patches.

Regards,

	Hans

On 05/09/2025 14:38, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Should be "mailing list" instead.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  README.md | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/README.md b/README.md
> index 358960a78bcde62599fa572c33891d4a50a1dbcd..58bfa0fa55d1acfeaa6cdf6eaf7adb0226ede8f8 100644
> --- a/README.md
> +++ b/README.md
> @@ -9,9 +9,9 @@ You can always find the latest development v4l-utils in the git repo:
>  Those utilities follow the latest Linux Kernel media API, as documented at:
>  [http://linuxtv.org/downloads/v4l-dvb-apis/](http://linuxtv.org/downloads/v4l-dvb-apis/).
>  
> -Any questions/remarks/patches can be sent to the linux-media mailinglist. See
> +Any questions/remarks/patches can be sent to the linux-media mailing list. See
>  [https://linuxtv.org/lists.php](https://linuxtv.org/lists.php) for more
> -information about the mailinglist.
> +information about the mailing list.
>  
>  There is also a wiki page for the v4l-utils:
>  [https://linuxtv.org/wiki/index.php/V4l-utils](https://linuxtv.org/wiki/index.php/V4l-utils).
> 


