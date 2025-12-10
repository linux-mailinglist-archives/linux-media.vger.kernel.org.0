Return-Path: <linux-media+bounces-48512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E2ACB17A2
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 01:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF2C430D1737
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 00:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B221917F1;
	Wed, 10 Dec 2025 00:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="THAzCQL0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EE684039
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 00:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765326258; cv=none; b=Qz35D40ZWMJnurkaKYvaAhCWJg8ZaKAjaBLvdEEIzSikLANaZevJjswjKcd80IyhxBwvZgUiMihDBkNudFAbzw1RVW5creSKdCVSa6sF8gG2WW0h+tAVLobFRRZGXKuSQ61cvvSXRQdjfjaJA/bKeEp4ZPP/NfKWk4gSR7YAKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765326258; c=relaxed/simple;
	bh=UfetjvmebInmaJqQ67EUQXEtggNaBR4KU8h6AU6jTRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KkxnHsqEjjEPagMm8JFKlM4YveQml7tbi3/nCxB6SoPkrCyK3AeJMp+OY44fBah3dPGrqBJ/roohwmz9xfZXLM/ttm7knFTx9TmJ+wDPNNGLbYZ+CkSQ5anlvb1K4gfdaC2p3dfKQYvA48fzuUHwv2DQBZud+H173tmX1hiZlbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=THAzCQL0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ADCBC4CEF5;
	Wed, 10 Dec 2025 00:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765326257;
	bh=UfetjvmebInmaJqQ67EUQXEtggNaBR4KU8h6AU6jTRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=THAzCQL03QkrvtWc5SI1tm3lpLoJZng4K/QlHrp82SGDzo99YiW9OudFBnlkXuRza
	 cv3qclDKBaPA7Dme4jCSlzEtuDF7RmBXTbNle6BogvcLEmXoxDsPlQUXWpADKJA3wP
	 8lrkXO8J73OImPthlgwkYS2iuEFCllIhC5s+3Ff1sVkI2vHN+CtxkkK0iG5NKxdEbz
	 7r1CKhQ2ZjZQ/a72wD5lon40PQFUovi7pJIQJTIdvxlGXTxrsoBhzCGooAPqm/RYpZ
	 IAtwgR9BkQS4UDWi8zjRI1DC+7G9GW3ouESAid9APZDB5fIqjUnpz3OkY+dFV2pKfn
	 h7VsN65Y+oWAw==
Message-ID: <7a14bd1e-496a-4036-8af4-845048f0a22d@kernel.org>
Date: Wed, 10 Dec 2025 00:24:13 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: ov02c10: Fix the horizontal flip control
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
 <kmp3aPDRwZLaM9lOHQI3MD44h_G8lXzUBo7ECP4OVTc0cmV10eDo7cdK9jhXm-WJq9nFh4097y9XGNnsQLS27Q==@protonmail.internalid>
 <20251209160621.6854-4-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <20251209160621.6854-4-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2025 16:06, Hans de Goede wrote:
> During sensor calibration I noticed that with the hflip control set to
> false/disabled the image was mirrored.
> 
> The horizontal flip control is inverted and needs to be set to 1 to not
> flip. This is something which seems to be common with various recent
> Omnivision sensors, the ov01a10 and ov08x40 also have an inverted
> mirror control.
> 
> Invert the hflip control to fix the sensor mirroring by default.
> 
> Fixes: b7cd2ba3f692 ("media: ov02c10: Support hflip and vflip")
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/i2c/ov02c10.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 384c2f0b1608..f912ae142040 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -170,7 +170,7 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
>   	{0x3816, 0x01},
>   	{0x3817, 0x01},
> 
> -	{0x3820, 0xa0},
> +	{0x3820, 0xa8},
>   	{0x3821, 0x00},
>   	{0x3822, 0x80},
>   	{0x3823, 0x08},
> @@ -462,9 +462,9 @@ static int ov02c10_set_ctrl(struct v4l2_ctrl *ctrl)
> 
>   	case V4L2_CID_HFLIP:
>   		cci_write(ov02c10->regmap, OV02C10_ISP_X_WIN_CONTROL,
> -			  ctrl->val ? 1 : 2, &ret);
> +			  ctrl->val ? 2 : 1, &ret);
>   		cci_update_bits(ov02c10->regmap, OV02C10_ROTATE_CONTROL,
> -				BIT(3), ov02c10->hflip->val << 3, &ret);
> +				BIT(3), ctrl->val ? 0 : BIT(3), &ret);
>   		break;
> 
>   	case V4L2_CID_VFLIP:
> --
> 2.52.0
> 
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

