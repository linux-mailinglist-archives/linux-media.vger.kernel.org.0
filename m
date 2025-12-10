Return-Path: <linux-media+bounces-48510-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3021ACB1793
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 20D373022181
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C87414B953;
	Wed, 10 Dec 2025 00:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzDCLG5I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68A9322A
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765326035; cv=none; b=KnbLRZSP2pffpmkBaoThQEjAQGoPnA2cQ9sR/yJM8OMPZmv6pYAkgd8h3eb0Gc18Q2p2Pr64qkSY1SmiGt1sAlClVuOAU1IYj8S5oVXMFAzaAMWZGlqWGaGrSeq0/Q4JN9qanhLGihl2BP6E27UN7YAswH0/4mRAf+WK6Z1UUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765326035; c=relaxed/simple;
	bh=jYw01dbN4ZY9ghqSnb5I4qEqWq2RL+8hh+xo9mT2e1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ooh0L+itsLs57GvP7K7G2+sdR/Jn43wGKvAomhuS7B1xvdVDlLS0R2tq6u5vwHNk7FhmxZqMzJea0IeUASEWuBE4a60ufiBHVqLe+8bCdoMpgQxFfIlddq5lTCJbDlBS/ez3chN/xXi2AEzosjbnVUT0OVBncNMMqKCk2N6dInM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qzDCLG5I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 069A3C4CEF5;
	Wed, 10 Dec 2025 00:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326035;
	bh=jYw01dbN4ZY9ghqSnb5I4qEqWq2RL+8hh+xo9mT2e1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qzDCLG5IWU4uufq5CL4ceyZoZIlubYD0yOdE7RS5Fb8OVZ3Oip9MT5YTsE8lu2bZv
	 rcZXL8eELxjnSjq6K7Ed9Z0yr6bIySq2RNxXirF8M1kVzJQXrZaBmZH84bQWYW424O
	 HhQSPj8iCHezG7zZpgZi06UVzgTUA3HpCYvCA6kzoXD+6R4b4RHM3+HBgVgaigdl14
	 QIXQj44/3CXIRQKuOhghF5m6oxs4tUD6Efyk6A7pj2TZUiWj7cHRIauHs7B05PAmjz
	 VvVobQ6KZdFvUg04LfwILEH6mLC/yUvXQinhqSuzgh1vYbnx2Km38+Lf01eObegzva
	 5QHN1+E5Qbyww==
Message-ID: <a80e2e16-0936-4003-ba0e-954bc1953376@kernel.org>
Date: Wed, 10 Dec 2025 00:20:28 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] media: ov02c10: Fix bayer-pattern change after
 default vflip change
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
 <jmsFca-pJKokn442ctU12qixQZlUWoMfDL0EhOmZRXBUTjri0EibmvXrMH_GcP91oAFPz6GmI4aBDfP5QaUgEA==@protonmail.internalid>
 <20251209160621.6854-2-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251209160621.6854-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2025 16:06, Hans de Goede wrote:
> After commit 69fe27173396 ("media: ov02c10: Fix default vertical flip")
> the reported bayer-pattern of MEDIA_BUS_FMT_SGRBG10_1X10 is no longer
> correct.
> 
> Change the 16-bit x-win register (0x3810) value from 2 to 1 so that
> the sensor will generate data in GRBG bayer-order again.
> 
> Fixes: 69fe27173396 ("media: ov02c10: Fix default vertical flip")
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/i2c/ov02c10.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index b1e540eb8326..6369841de88b 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -168,7 +168,7 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
>   	{0x3810, 0x00},
>   	{0x3811, 0x02},
>   	{0x3812, 0x00},
> -	{0x3813, 0x02},
> +	{0x3813, 0x01},
>   	{0x3814, 0x01},
>   	{0x3815, 0x01},
>   	{0x3816, 0x01},
> --
> 2.52.0
> 

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

