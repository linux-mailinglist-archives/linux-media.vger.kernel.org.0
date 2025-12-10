Return-Path: <linux-media+bounces-48556-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 672BCCB2DDF
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 13:07:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 960F53061A54
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 12:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCF21EDA0F;
	Wed, 10 Dec 2025 12:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmg7VZxq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BBA23370F
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765368446; cv=none; b=ZcYGDWykIJ81VvoLUow1dxvKsNtaM46YYpuDY2jvYuTXnaN+aNoW5JDa26SDtHi5aeO/lezFf2mTImsinI1fMPmK4pJEVlGy2R/egFpOjcJNazcwqmPsMY1vcqPm7DkM+UPlpmXsh0XuZox7IZranGSzrP7gnwINof+RHQvx61g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765368446; c=relaxed/simple;
	bh=Tg9JP+dRXy8CTDLugI317IX5bifDpZoPtaKXvN/sR6M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ap3oqHXPDrJtU7Ykau0xOWpGRYnD8q05MUv13FLBDq9OAq1imy1WSb8M6sYfApKrYbCcLoRJmKJMDKLoV9Wz22nD/+wdLioB936pcKaQAeUtuuOinGKjW1E8gyfeRXYqCwIAF4vL/bGTrQct49loTQGGHU394F5RCOb9ix+mSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmg7VZxq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B768C4CEF1;
	Wed, 10 Dec 2025 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765368445;
	bh=Tg9JP+dRXy8CTDLugI317IX5bifDpZoPtaKXvN/sR6M=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tmg7VZxqJgHrFsrDHelH6KCNkXJNVP01FucRg9wiTEkwzuljEF1vd/KKqcVw6lw7J
	 6vswxmxSRxmk8POSf6g3wqk8OmewiU3g+s0TPmhKBd6bVRZHC4dtAAltwCAg2RzgjG
	 /CdQmGvKJD9K6n2XeFfDQ8HaDX9zEL1m5h+WpzWZh16FL9uipal+20MEDa3YNRQotq
	 d1nMnvOfrpdJ+9AlMzZ2ZlTxuUabLftcZNYQJttIb7bP3KaoM9ceaxHyaQAkhCGZ5/
	 skW9yC6AJ8zNhFIB1dMeDSh1NRT42HCyZpjPqhJo8WGR9ZYMCKbuNntwLtPknAyJbw
	 6xB86vYbbpvEw==
Message-ID: <382e2dc1-6552-4ff4-adb2-7e4bfafaefb4@kernel.org>
Date: Wed, 10 Dec 2025 13:07:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 regression fix for 6.19 0/5] media: ov02c10: h/vflip
 fixes
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bod@kernel.org>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org
References: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20251210112436.167212-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hans,

On 10/12/2025 12:24, Hans de Goede wrote:
> Hi All,
> 
> Commit 69fe27173396 ("media: ov02c10: Fix default vertical flip") which
> has been merged this merge window is causing various problems for
> laptops with a ov02c10 sensors:
> 
> 1. This changes the vflip default but does not update the bayer-order
>    leading to debayer artifacts and wrong colors
> 
> 2. The ov02c10 driver was originally developed on a XPS 16 9640 which
>    has its sensor upside down. Changing the vflip (and hflip) default
>    values fixes the image being upside down on other laptops, but will
>    cause a regression on Dell XPS models causing the image to be upside
>    down there.
> 
> 3. The mentioned commit only changes vflip, so the image now is upside-up,
>    but it is still mirrored.
> 
> Patches 1-4 of this series fixes these issues. Patch 5 is a follow-up
> cleanup patch.
> 
> Hans Verkuil, can you please queue these up as fixes for 6.19?

It's best to wait until v6.19-rc1 is released, then add these patches
on top and post a PR with subject prefix [GIT FIXES for v6.19].

Either Mauro or myself will pick it up (probably Mauro since I'm about
to go on vacation).

Regards,

	Hans

> 
> Changes in v2:
> - Fix Fixes tags to use the correct commit hash
> - Fix compile error in patch 4/5 when CONFIG_ACPI is not set
> - Add Bryan's Reviewed-by to all patches
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (5):
>   media: ov02c10: Fix bayer-pattern change after default vflip change
>   media: ov02c10: Adjust x-win/y-win when changing flipping to preserve
>     bayer-pattern
>   media: ov02c10: Fix the horizontal flip control
>   media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down
>     sensors
>   media: ov02c10: Remove unnecessary hflip and vflip pointers
> 
>  drivers/media/i2c/ov02c10.c          | 28 +++++++++++----------------
>  drivers/media/pci/intel/Kconfig      |  2 +-
>  drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+), 18 deletions(-)
> 


