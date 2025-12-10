Return-Path: <linux-media+bounces-48509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4CCB1790
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BBD930295B4
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7901313D503;
	Wed, 10 Dec 2025 00:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ow4uY7dx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEF322A
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765325990; cv=none; b=htGecRcnTqMJK75xYfU0lO82Gdzd8WBdUx5MrjHB0MRaPM81HAMJykRtqa9h5qqkRjRx3/dgkPEs7s6q/HDlL3BQS/NiJxiS3GgTVvfhoMQ11msl2yGWG6Re38nzNJOnPAnhu7nUiQWe0SEh6DZMybQTZTl62q33A/Pu/SJtiqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765325990; c=relaxed/simple;
	bh=KG9kikyKapZJ9drmBH4ke3g73C+H/gTt31KQganL3SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2KQ50/wCK3xR3fOOVsQo2F1m1l9WM5Q95aGsTSgd35Sz4ImeNsawazvIF+kolLIAYKgJk66rFhLOLq2voyY5V0/OHFVnvAnoV8My4NbVTcvH8PNAZJD6u14RBXgLJiq+4S7iSFM6oAAQKxccLMFFrgE1xB55CVeiCyNTyxkUeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ow4uY7dx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000B5C113D0;
	Wed, 10 Dec 2025 00:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765325990;
	bh=KG9kikyKapZJ9drmBH4ke3g73C+H/gTt31KQganL3SE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ow4uY7dxUhV3xNfTx2KGJ60MxSorEfxoDLwvI/1UykF5nyFO136WuGiFfhvGScJJQ
	 I2qILKpnubx9p/xQOna+dacr3cb4oFYCKz8FnuX+6sLm8YdrYyR0ijuuXiZWp+Lcnk
	 0o+mSBD2tncrL+q3eyKBRfY5FdaVBrDZbzVigaVuaBctSXW60/o+Otyt6StVEmsNjN
	 Z4I2gE2NHtDU56+eSMXEtCnE1mn7J9ynrzUPvO+MPCrZQWiPYz3pj2EJKFS//ektCS
	 XFuaAzu++shKehi/Vst7yg2gigfYswbHSkSESxMe2NLUannxaisDFR+x0u+DBX3l4D
	 w9K6Su4BWSXOA==
Message-ID: <8ede3907-8191-49a5-a1dd-cbc6f20edb50@kernel.org>
Date: Wed, 10 Dec 2025 00:19:39 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH regression fixes for 6.19 0/5] media: ov02c10: h/vflip
 fixes
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 linux-media@vger.kernel.org
References: <O5Gex5D3AY7Qx5JRN_QeWluQpNM8uye-XD90s-asNy5IJgdUAK9-D2UDDW5dXOL1vgSw1CeY1U70nwxr6aXm3A==@protonmail.internalid>
 <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2025 16:06, Hans de Goede wrote:
> Hi All,
> 
> Commit 69fe27173396 ("media: ov02c10: Fix default vertical flip") which
> has been merged this merge window is causing various problems for
> laptops with a ov02c10 sensors:
> 
> 1. This changes the vflip default but does not update the bayer-order
>     leading to debayer artifacts and wrong colors
> 
> 2. The ov02c10 driver was originally developed on a XPS 16 9640 which
>     has its sensor upside down. Changing the vflip (and hflip) default
>     values fixes the image being upside down on other laptops, but will
>     cause a regression on Dell XPS models causing the image to be upside
>     down there.
> 
> 3. The mentioned commit only changes vflip, so the image now is upside-up,
>     but it is still mirrored.
> 
> Patches 1-4 of this series fixes these issues. Patch 5 is a follow-up
> cleanup patch.
> 
> Hans Verkuil, can you please queue these up as fixes for 6.19?
> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (5):
>    media: ov02c10: Fix bayer-pattern change after default vflip change
>    media: ov02c10: Adjust x-win/y-win when changing flipping to preserve
>      bayer-pattern
>    media: ov02c10: Fix the horizontal flip control
>    media: ipu-bridge: Add DMI quirk for Dell XPS laptops with upside down
>      sensors
>    media: ov02c10: Remove unnecessary hflip and vflip pointers
> 
>   drivers/media/i2c/ov02c10.c          | 28 +++++++++++----------------
>   drivers/media/pci/intel/ipu-bridge.c | 29 ++++++++++++++++++++++++++++
>   2 files changed, 40 insertions(+), 17 deletions(-)
> 
> --
> 2.52.0
> 

I thought of this at the time but, assumed it was tested, on submission.

Should have asked.

---
bod

