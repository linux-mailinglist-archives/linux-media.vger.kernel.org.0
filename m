Return-Path: <linux-media+bounces-50548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A9279D181BD
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A1FB3003FE0
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495B1331237;
	Tue, 13 Jan 2026 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7+9xL9D"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FC2DCBF8
	for <linux-media@vger.kernel.org>; Tue, 13 Jan 2026 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300974; cv=none; b=PQ41wVfm7OP5WTYObYvdCRGQpsHsPb/QoY/u+8VzsgQRJv9juW/42r6E9CMOOOmFf3ves4ku8+XVHG/94/8nOJG0YyIOeii6rILrV7EQkzhgjBdnKVXm60EfKBI08SWzs2iKsCZ4Qapm5sp9pThUKMwGbiRATKDcxniYix2awZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300974; c=relaxed/simple;
	bh=UI3w4j0tJfGteau/LxZvwWTa8ihHCKtddlC0pVogmwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CN1FRP3gzdZewUWW1RCkgEL3CByPfA3g7U1sYu9D3dL/tlrEYP4HqHwDgY2omJ87KazeLQol53Im9Ga53onK/HJ7H+lVAqHd0jhjc3JhY1/yUxzJG61X1avmLp+c7fENaJfs6Q5/B1I7jG15DqJMfab2Vt4b/FbYBHBwnFpwDRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7+9xL9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE021C116C6;
	Tue, 13 Jan 2026 10:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768300974;
	bh=UI3w4j0tJfGteau/LxZvwWTa8ihHCKtddlC0pVogmwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y7+9xL9DfB8cP4Imzo+hllGYH0tljdVFVsNw3gF38As40bewqamU4eArDLd8gvGTn
	 mrAEmsgMAZ3g0pXnBlCQKwVEa8L/ZySJLYW5ZCc3gMRIKXQujGxf+D2c7ZjCkevQdA
	 jEGuUhleZg/0Gv8cN8QmydD08u2qWVlxLekmd1yMcFPIS0m9zkCfMBadH/g8qy+x2R
	 EwMi+OmDiRuaCJVgNt6En7Ov7yDGsb1dbEFT5e80jT9TUxjX9pB6NiEEOZ59oTvMgm
	 +/zzcKn9CrLAZexoGY2ANmIlqWmVBTlfCU6OnH2EDkjTgTWfDVFn111UgWk1XequHP
	 EXS2XX/3V/QDg==
Message-ID: <988fe458-da1d-4042-92fa-8e1b80e09d5e@kernel.org>
Date: Tue, 13 Jan 2026 11:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: ov01a10: Fix test pattern assignment
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Bingbu Cao <bingbu.cao@intel.com>, mehdi.djait@intel.com
References: <20260113082512.102779-1-sakari.ailus@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260113082512.102779-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Jan-26 09:25, Sakari Ailus wrote:
> The test patterns of the test pattern menu control start from 1 whereas
> register values start from 0. Fix this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> This goes on top of my recent ov01a10 series.
> 
>  drivers/media/i2c/ov01a10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index 3dbc77430e0e..0a66d8974974 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -319,7 +319,7 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
>  static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
>  {
>  	if (pattern)
> -		pattern |= OV01A10_TEST_PATTERN_ENABLE;
> +		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;

Nack, copy paste of my reply to Bingbu's email where this change was requested:

This was "pattern - 1" in the original v1 patch-set, the - 1 is dropped
deliberately c2 because testing has shown that there is no difference
between writing "0 | OV01A10_TEST_PATTERN_ENABLE" vs
"1 | OV01A10_TEST_PATTERN_ENABLE" to the register.

See the discussion here:

https://lore.kernel.org/linux-media/jgzovuqvd5csxwzmzf5asri7xvftoyb4lqyywtfdsrsgdvwz7i@neqszepmzw3m/

Please drop this patch.

Regards,

Hans





