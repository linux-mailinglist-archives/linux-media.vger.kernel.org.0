Return-Path: <linux-media+bounces-36247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10367AED5C1
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 09:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289FE1887F26
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 07:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09EC221DB1;
	Mon, 30 Jun 2025 07:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5iYqKxw"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9541FF7D7
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268847; cv=none; b=fjSWaKXODM3s04gIiP707E9a2mEgs8VFJ4rz6V0J31UFIg9O9ytJ8WEsB59Nx/xoyxQ/pCGPRWgZP1CxrfkLKF31133KPulytcJjvZ8nM3BtNKZLjDahDc19ib5jQuX7PoIwqVXH8Lh8j+cL7521psRJf9Zd/Wm4zX4k1q7J6ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268847; c=relaxed/simple;
	bh=M+ch0LUtsHrdhbUL1za51HX4TSXIiP9nIRbudq4L83w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RA2uYnuRceOfty3hVT0e88WaXSn3GnYIJ/aZ5y8qNQhJOaiP3O28BJnD369tdLCLfZzZko9ivlO36sbuG/m9dqEj0heFCIPiWffH8xrED8Mgdn9Dv+020FM4apkdadFtiMLI4i3QlEBcMANm8vxBiQ7FlLFBiA/6tfyz++aeuQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5iYqKxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B66C4CEE3
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 07:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751268846;
	bh=M+ch0LUtsHrdhbUL1za51HX4TSXIiP9nIRbudq4L83w=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=G5iYqKxwn6kganKMPoVgeQkFqXT2JSwjm4lBf11AGAvrFuGWOxeaHCnLltuWLxqTS
	 0QcWPDwii97BaAVFaEbTkfJZGQS5XUK6ZMIwIe/FCA+/9OtpYtxcm6NO5PTZwtdRv8
	 XZc4a1w12Rgpq38KvSQb8Pq917aM/lha1kdrQHNy0u1E+IXUtuT1LGPmCA43IGgUqv
	 8AMK48Z/gmON7odfFQJJwLPlDHJSAMgwA5X9psaIqUsabYzODDHVcF/8L02F3ARsGS
	 Bb8T3/XZl0a082DGXSl5gyqVcxJio6oIUwJH60ncBsqWG7oWFQ7BF3YtiPMkxWXUFu
	 HwaBNEVqlxTHg==
Message-ID: <ceffaf7a-94f0-41d3-8036-e636458dc0f9@kernel.org>
Date: Mon, 30 Jun 2025 09:34:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3,00/15] media: mt9m114: Changes to make it work with atomisp
 devices
To: linux-media@vger.kernel.org
References: <20250629205626.68341-1-hansg@kernel.org>
 <6861b00f.050a0220.379e4a.5185@mx.google.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <6861b00f.050a0220.379e4a.5185@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,
On 29-Jun-25 11:28 PM, Patchwork Integration wrote:
> Dear Hans de Goede:
> 
> Thanks for your patches! Unfortunately the Media CI robot has not been
> able to test them.
> 
> Make sure that the whole series 20250629205626.68341-1-hansg@kernel.org is
> available at lore. And that it can be cherry-picked on top the "next"
> branch of "https://gitlab.freedesktop.org/linux-media/media-committers.git".
> 
> You can try something like this:
>     git fetch https://gitlab.freedesktop.org/linux-media/media-committers.git next
>     git checkout FETCH_HEAD
>     b4 shazam 20250629205626.68341-1-hansg@kernel.org

My bad, this is based on top of:

https://git.linuxtv.org/sailus/media_tree.git/log/?h=fixes

since that has some pending mt9m114 patches. I should have
added a base-commit to the cover-letter.

Regards,

Hans















> Error message:
> Trying branch next c0b1da281d84d33281fc49289f0c7f8aada450ff...
> Running in OFFLINE mode
> Analyzing 16 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v3 1/15] media: aptina-pll: Debug log p1 min and max values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-2-hansg@kernel.org
>   [PATCH v3 2/15] media: mt9m114: Add support for clock-frequency property
>     + Link: https://lore.kernel.org/r/20250629205626.68341-3-hansg@kernel.org
>   [PATCH v3 3/15] media: mt9m114: Use aptina-PLL helper to get PLL values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-4-hansg@kernel.org
>   [PATCH v3 4/15] media: mt9m114: Lower minimum vblank value
>     + Link: https://lore.kernel.org/r/20250629205626.68341-5-hansg@kernel.org
>   [PATCH v3 5/15] media: mt9m114: Fix default hblank and vblank values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-6-hansg@kernel.org
>   [PATCH v3 6/15] media: mt9m114: Tweak default hblank and vblank for more accurate fps
>     + Link: https://lore.kernel.org/r/20250629205626.68341-7-hansg@kernel.org
>   [PATCH v3 7/15] media: mt9m114: Avoid a reset low spike during probe()
>     + Link: https://lore.kernel.org/r/20250629205626.68341-8-hansg@kernel.org
>   [PATCH v3 8/15] media: mt9m114: Put sensor in reset on power down
>     + Link: https://lore.kernel.org/r/20250629205626.68341-9-hansg@kernel.org
>   [PATCH v3 9/15] media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
>     + Link: https://lore.kernel.org/r/20250629205626.68341-10-hansg@kernel.org
>   [PATCH v3 10/15] media: mt9m114: Adjust IFP selections and src format when src pixelfmt changes to/from RAW10
>     + Link: https://lore.kernel.org/r/20250629205626.68341-11-hansg@kernel.org
>   [PATCH v3 11/15] media: mt9m114: Update src pad sel and format when sink pad format changes
>     + Link: https://lore.kernel.org/r/20250629205626.68341-12-hansg@kernel.org
>   [PATCH v3 12/15] media: mt9m114: Don't allow changing the IFP crop/compose selections when bypassing the scaler
>     + Link: https://lore.kernel.org/r/20250629205626.68341-13-hansg@kernel.org
>   [PATCH v3 13/15] media: mt9m114: Drop start-, stop-streaming sequence from initialize
>     + Link: https://lore.kernel.org/r/20250629205626.68341-14-hansg@kernel.org
>   [PATCH v3 14/15] media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
>     + Link: https://lore.kernel.org/r/20250629205626.68341-15-hansg@kernel.org
>   [PATCH v3 15/15] media: mt9m114: Add ACPI enumeration support
>     + Link: https://lore.kernel.org/r/20250629205626.68341-16-hansg@kernel.org
> ---
> Total patches: 15
> ---
> Applying: media: aptina-pll: Debug log p1 min and max values
> Applying: media: mt9m114: Add support for clock-frequency property
> Patch failed at 0002 media: mt9m114: Add support for clock-frequency property
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: drivers/media/i2c/mt9m114.c:2279
> error: drivers/media/i2c/mt9m114.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 
> Trying branch fixes 19272b37aa4f83ca52bdf9c16d5d81bdd1354494...
> Running in OFFLINE mode
> Analyzing 16 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v3 1/15] media: aptina-pll: Debug log p1 min and max values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-2-hansg@kernel.org
>   [PATCH v3 2/15] media: mt9m114: Add support for clock-frequency property
>     + Link: https://lore.kernel.org/r/20250629205626.68341-3-hansg@kernel.org
>   [PATCH v3 3/15] media: mt9m114: Use aptina-PLL helper to get PLL values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-4-hansg@kernel.org
>   [PATCH v3 4/15] media: mt9m114: Lower minimum vblank value
>     + Link: https://lore.kernel.org/r/20250629205626.68341-5-hansg@kernel.org
>   [PATCH v3 5/15] media: mt9m114: Fix default hblank and vblank values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-6-hansg@kernel.org
>   [PATCH v3 6/15] media: mt9m114: Tweak default hblank and vblank for more accurate fps
>     + Link: https://lore.kernel.org/r/20250629205626.68341-7-hansg@kernel.org
>   [PATCH v3 7/15] media: mt9m114: Avoid a reset low spike during probe()
>     + Link: https://lore.kernel.org/r/20250629205626.68341-8-hansg@kernel.org
>   [PATCH v3 8/15] media: mt9m114: Put sensor in reset on power down
>     + Link: https://lore.kernel.org/r/20250629205626.68341-9-hansg@kernel.org
>   [PATCH v3 9/15] media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
>     + Link: https://lore.kernel.org/r/20250629205626.68341-10-hansg@kernel.org
>   [PATCH v3 10/15] media: mt9m114: Adjust IFP selections and src format when src pixelfmt changes to/from RAW10
>     + Link: https://lore.kernel.org/r/20250629205626.68341-11-hansg@kernel.org
>   [PATCH v3 11/15] media: mt9m114: Update src pad sel and format when sink pad format changes
>     + Link: https://lore.kernel.org/r/20250629205626.68341-12-hansg@kernel.org
>   [PATCH v3 12/15] media: mt9m114: Don't allow changing the IFP crop/compose selections when bypassing the scaler
>     + Link: https://lore.kernel.org/r/20250629205626.68341-13-hansg@kernel.org
>   [PATCH v3 13/15] media: mt9m114: Drop start-, stop-streaming sequence from initialize
>     + Link: https://lore.kernel.org/r/20250629205626.68341-14-hansg@kernel.org
>   [PATCH v3 14/15] media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
>     + Link: https://lore.kernel.org/r/20250629205626.68341-15-hansg@kernel.org
>   [PATCH v3 15/15] media: mt9m114: Add ACPI enumeration support
>     + Link: https://lore.kernel.org/r/20250629205626.68341-16-hansg@kernel.org
> ---
> Total patches: 15
> ---
> Applying: media: aptina-pll: Debug log p1 min and max values
> Applying: media: mt9m114: Add support for clock-frequency property
> Patch failed at 0002 media: mt9m114: Add support for clock-frequency property
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: drivers/media/i2c/mt9m114.c:2279
> error: drivers/media/i2c/mt9m114.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 
> Trying branch None 27b0a9c2a67d483a9d4a941882b779a199ff281e...
> Running in OFFLINE mode
> Analyzing 16 messages in the thread
> Checking attestation on all messages, may take a moment...
> ---
>   [PATCH v3 1/15] media: aptina-pll: Debug log p1 min and max values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-2-hansg@kernel.org
>   [PATCH v3 2/15] media: mt9m114: Add support for clock-frequency property
>     + Link: https://lore.kernel.org/r/20250629205626.68341-3-hansg@kernel.org
>   [PATCH v3 3/15] media: mt9m114: Use aptina-PLL helper to get PLL values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-4-hansg@kernel.org
>   [PATCH v3 4/15] media: mt9m114: Lower minimum vblank value
>     + Link: https://lore.kernel.org/r/20250629205626.68341-5-hansg@kernel.org
>   [PATCH v3 5/15] media: mt9m114: Fix default hblank and vblank values
>     + Link: https://lore.kernel.org/r/20250629205626.68341-6-hansg@kernel.org
>   [PATCH v3 6/15] media: mt9m114: Tweak default hblank and vblank for more accurate fps
>     + Link: https://lore.kernel.org/r/20250629205626.68341-7-hansg@kernel.org
>   [PATCH v3 7/15] media: mt9m114: Avoid a reset low spike during probe()
>     + Link: https://lore.kernel.org/r/20250629205626.68341-8-hansg@kernel.org
>   [PATCH v3 8/15] media: mt9m114: Put sensor in reset on power down
>     + Link: https://lore.kernel.org/r/20250629205626.68341-9-hansg@kernel.org
>   [PATCH v3 9/15] media: mt9m114: Add and use mt9m114_ifp_get_border() helper function
>     + Link: https://lore.kernel.org/r/20250629205626.68341-10-hansg@kernel.org
>   [PATCH v3 10/15] media: mt9m114: Adjust IFP selections and src format when src pixelfmt changes to/from RAW10
>     + Link: https://lore.kernel.org/r/20250629205626.68341-11-hansg@kernel.org
>   [PATCH v3 11/15] media: mt9m114: Update src pad sel and format when sink pad format changes
>     + Link: https://lore.kernel.org/r/20250629205626.68341-12-hansg@kernel.org
>   [PATCH v3 12/15] media: mt9m114: Don't allow changing the IFP crop/compose selections when bypassing the scaler
>     + Link: https://lore.kernel.org/r/20250629205626.68341-13-hansg@kernel.org
>   [PATCH v3 13/15] media: mt9m114: Drop start-, stop-streaming sequence from initialize
>     + Link: https://lore.kernel.org/r/20250629205626.68341-14-hansg@kernel.org
>   [PATCH v3 14/15] media: mt9m114: Return -EPROBE_DEFER if no endpoint is found
>     + Link: https://lore.kernel.org/r/20250629205626.68341-15-hansg@kernel.org
>   [PATCH v3 15/15] media: mt9m114: Add ACPI enumeration support
>     + Link: https://lore.kernel.org/r/20250629205626.68341-16-hansg@kernel.org
> ---
> Total patches: 15
> ---
> Applying: media: aptina-pll: Debug log p1 min and max values
> Applying: media: mt9m114: Add support for clock-frequency property
> Patch failed at 0002 media: mt9m114: Add support for clock-frequency property
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: drivers/media/i2c/mt9m114.c: does not exist in index
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> 
> 
> 
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
> 
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> 
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
> 


