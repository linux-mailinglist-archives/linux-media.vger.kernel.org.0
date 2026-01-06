Return-Path: <linux-media+bounces-49971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A890ECF755C
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 09:44:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 112AA302B765
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 08:44:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496433090C1;
	Tue,  6 Jan 2026 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FElsagqW"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C061A76DE
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767689069; cv=none; b=dE6m7pz699HeVsB4JpnIGgmXQvdmJ6fcWNl0Q39jsFM6/9kXYjVQWdourBYZGRYHAy24p+wtlDDUqpfQlyoQYNtsXZoVpe0rG+NxqZdPQH0iqOyS2XH8ZDvOt4qbaS74sQZHII8DRkjmjqSLRcMGqIxwFtfU6y12pDNewmKfXUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767689069; c=relaxed/simple;
	bh=ZbHliOHJTuhPIHk796OtrMKEdzH4UXu10O4kbQKhmzA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=URJoq4D5Iy4lnXRq+EBUBTMQt0/63LNuz24JPIuCCzMwHzUZFbnBvrxpQENfUJ6eiFuqhOoPBJwijcdGUGUK5QRavGSxU1CJTqKKmxl3Q7BcpcUqpQrTJm2JeJKsRg7wF0rSaKX0ZVaNqktntwUIEyg1UyyCgQUL4ldFbjVB5uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FElsagqW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9275C116C6;
	Tue,  6 Jan 2026 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767689069;
	bh=ZbHliOHJTuhPIHk796OtrMKEdzH4UXu10O4kbQKhmzA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=FElsagqWzses/uOFXXUPgzQojVMHYEJOMw6MCO5gOvosTVtJtjCQEp6nsoSPXLSHy
	 3qNUQ/RBtgEVAA9RPcUDSLCENlor2CNN4Kx2D0iYyQ/cmjWyq6RT9uaBujhy8dwXlL
	 Nbo15RP3a5yN7cIzEjYLKVuww2oSEWJMwommetI30AQ/VArjGxWfj+bWEcm63/G6t4
	 0O5cn5vQn/DSNlbpr2S36hoP6VcIliBLJUq3YSaFNp+5pa3cF6PH8ojLjhyXGN6pv4
	 bqt2tONqOU59gb7WmVCu/LOPVKKMRz97i9GtQvbb4fSCTmVFix0wimpw+ygGDtVZfc
	 0yiwPMCxWF1JA==
Message-ID: <7ae434c0-0e36-4434-826a-2122c4e9ccb4@kernel.org>
Date: Tue, 6 Jan 2026 09:44:25 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [GIT FIXES for v6.19] media: ov02c10: h/vflip fixes
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <df8059ac-2c6a-46e2-9494-974fc6460184@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <df8059ac-2c6a-46e2-9494-974fc6460184@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Hans,

On 19/12/2025 16:03, Hans de Goede wrote:
> Hi Hans, Mauro,
> 
> As discussed in:
> 
> https://lore.kernel.org/linux-media/382e2dc1-6552-4ff4-adb2-7e4bfafaefb4@kernel.org/
> 
> Here is a pull-request for a set of ov02c10: h/vflip fixes.
> 
> Note the tag has a -2 suffix, because for -1 I had accidentally
> used a random post v6.19-rc1 commit from Torvald's tree instead
> of v6.19-rc1. The -2 tag is correctly based on top of v6.19-rc1.
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git tags/ov02c10-fixes-for-6.19-2
> 
> for you to fetch changes up to ddf8d8757cb36654cb146f90c4af6a82d0edff25:
> 
>   media: ov02c10: Remove unnecessary hflip and vflip pointers (2025-12-19 15:50:49 +0100)

The patches are for this v2 series:

https://patchwork.linuxtv.org/project/linux-media/cover/20251210112436.167212-1-johannes.goede@oss.qualcomm.com/

However, this series is marked as Superseded in patchwork. Is that a mistake?

The v1 series https://patchwork.linuxtv.org/project/linux-media/list/?series=20131
is still marked as 'New'. Did you mark the wrong series as Superseded?

Also, most of the v2 patches are delegated to Sakari, not Hans de Goede.

I just wanted to clarify this before merging anything to the fixes branch, and
make sure you and Sakari are on the same page.

Regards,

	Hans

> 
> ----------------------------------------------------------------
> media: ov02c10: h/vflip fixes for 6.19-2
> 
> This fixes various problems for laptops with a ov02c10 sensors caused by
> commit 69fe27173396 ("media: ov02c10: Fix default vertical flip"):
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
> ----------------------------------------------------------------
> Hans de Goede (5):
>       media: ov02c10: Fix bayer-pattern change after default vflip change
>       media: ov02c10: Adjust x-win/y-win when changing flipping to preserve bayer-pattern
>       media: ov02c10: Fix the horizontal flip control
>       media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down sensors
>       media: ov02c10: Remove unnecessary hflip and vflip pointers
> 
>  drivers/media/i2c/ov02c10.c          | 28 +++++++++++-----------------
>  drivers/media/pci/intel/Kconfig      |  2 +-
>  drivers/media/pci/intel/ipu-bridge.c | 29 +++++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+), 18 deletions(-)
> 
> Regards,
> 
> Hans
> 
> 
> 
> 


