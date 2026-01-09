Return-Path: <linux-media+bounces-50281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60361D09D12
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 13:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 25C03310997A
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 12:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2AC35B141;
	Fri,  9 Jan 2026 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="reUlOVVz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814E731E107;
	Fri,  9 Jan 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767961978; cv=none; b=kJd8SUIGLBLWmkQ+Q30KRyiGNAyykZiBE20XMmARCvKyWXtHULGxVyZvwuDDK5IbaZCN++nkAdSFABN9M7JLoo3kW3fSY4InoNiCRPDBHZDMKYuskSEmj5SmkVA6Vcs/2YrQmFfS/PM544ThIv6uZNjpgVe2ip8sOlthPfsuyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767961978; c=relaxed/simple;
	bh=RvaGYB0K7abFbaCYUVw7EmN+x5RQ9FAWltYCa30ryB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5e/eQbpTwTYM5Wq8KdrSY9jTrSjBtC46pB5p0gQg42ooUjv6EZC/rlTw5tyr4DgWGJxU+GxoUuR8ehnAMK6HPhM6AmT41hBf9jgPb6ZYKvJjuaGHJyMB7IcfxQWC6zqoVC5I9nu/kwNV6suyZj0/epclHd+6MpIf74QAPTwYy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=reUlOVVz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BEB9C19421;
	Fri,  9 Jan 2026 12:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767961978;
	bh=RvaGYB0K7abFbaCYUVw7EmN+x5RQ9FAWltYCa30ryB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=reUlOVVzewLtXHtb79/J8vOMrGzvcDWQ7cgu6VRCvBh0WZKb/4fTWTGrXbDF3Ad0o
	 eFEVE2fR0JjqJFpbCs17LXLBtzOKKeCNU+Ki84CDlQbcQdstK8Xgp9TKTrQg6XTI16
	 kybT+Z6KMxL8t7z7zeF8slpNIL3YrAhYB+uWdftgQoad3MIAJpIx4a4cPC6be99Pi9
	 QB1XOHGrNxItpn9L0qZ9Oq8CxUXYbpet9v2mwqwJ8H7jRKCuCLCYJVlwbgXViN9IXC
	 bVzQYP1w+P3U5hj/p2/6tPc5pJe5/ZW3Lm6WIzefntNeoiBZ6VODKwP8BOxwngnES4
	 NVWpPRGKMgmXQ==
Message-ID: <dc68db73-163e-4443-b334-31e2ae529e99@kernel.org>
Date: Fri, 9 Jan 2026 12:32:52 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: imx412: wait for NVM read (T7) before
 programming mode registers
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, sakari.ailus@linux.intel.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <tjF2Z2nt6dR-T_d-5cSpzZqItgoMsUzNmUBQ-jucG9SMQ9Q4y9cCrW4aya-hRJR0dQG-q63OBmZajTWMbxfeUA==@protonmail.internalid>
 <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20260109044913.3310-1-wenmeng.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/01/2026 04:49, Wenmeng Liu wrote:
> During sensor bring-up, the IMX412 performs CCI ID read (T6 ~0.6 ms) and
> parameter loading from NVM (T7 ≤ 8 ms) after INCK/XCLR rise. Writing the
> mode register list while T7 is in progress can cause  failed
> register programming.
> 
> Move the usleep_range(7400, 8000) to the beginning of
> imx412_start_streaming(), so the driver waits for the NVM read window (T7)
> to complete before pushing the mode registers and sending the streaming
> command (T8). This change preserves the original delay length but fixes
> the ordering to match the datasheet timing:
> 
> - T6: CCI ID read wait (~0.6 ms)
> - T7: NVM parameter read (≤ 8 ms) — now fully elapsed before any
>        register writes
> - T8: start of first streaming after issuing MODE_SELECT
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
> Changes in v2:
> - Move the 7.4–8 ms delay before mode-register programming to satisfy T7 (NVM read).
> - Link to v1: https://lore.kernel.org/all/20251222-imx412-v1-1-51c7e724b376@oss.qualcomm.com/
> ---
>   drivers/media/i2c/imx412.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index b3826f803547..ed249a95ff35 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -798,6 +798,9 @@ static int imx412_start_streaming(struct imx412 *imx412)
>   	const struct imx412_reg_list *reg_list;
>   	int ret;
> 
> +	/* Wait T7 (≤8ms) so NVM read finishes; avoid I2C NACK when writing mode regs */
> +	usleep_range(7400, 8000);
> +
>   	/* Write sensor mode registers */
>   	reg_list = &imx412->cur_mode->reg_list;
>   	ret = imx412_write_regs(imx412, reg_list->regs,
> @@ -814,9 +817,6 @@ static int imx412_start_streaming(struct imx412 *imx412)
>   		return ret;
>   	}
> 
> -	/* Delay is required before streaming*/
> -	usleep_range(7400, 8000);
> -
>   	/* Start streaming */
>   	ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
>   			       1, IMX412_MODE_STREAMING);
> --
> 2.34.1
> 
> 

This delay should go at the end of the operation that requires the delay 
not at the start of the streaming operation.

The delay after the stream write, should be related to the stream write 
command, not the antecedent - the command that came before start_streaming.

Basically I think you need to put your delay into the CCI_ID read NVM 
parameter load routine so that it guarantees its own completion.

Because for argument's sake if start_streaming() were not to be the 
thing to happen after CCI_ID/NVM loading, the logic would no longer work.

And you need a Fixes: tag for this patch too.

---
bod

