Return-Path: <linux-media+bounces-40537-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CCEB2F265
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 10:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27884A21ED9
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD5C2EAD19;
	Thu, 21 Aug 2025 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGZhuVJN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B7B2EACF3;
	Thu, 21 Aug 2025 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765071; cv=none; b=RAfyLD1TtqVQNjAVSg6k1xoblIWAcBvncObpW1k5+CR4eWen4VsQigYTszieNbZ2fXn9FzFxwY1x6HHhQ4Mpt3Q7b8ocbcx7CwpwLReUGTjgDJhBqZyb+jtsKr6KuPBbRAYtsSWuX+24HBVNT6eAsZhQhmrljK2aZANfn1fizuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765071; c=relaxed/simple;
	bh=ekhIQak7qu2ROGBFaHIspyrdtLtgcRaAEJAbXNV6jmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DaKj49k0jAWBufa4hL1h+xUpPDzc0mfL3mBT/7ZkvWbqFhXxpBtFUklAM1DyZzfopZZJ7RRaPeY016VrXjximZjlxH4cQH3Wg8tl3k+HSM2SiDqS+hC23xgS8NuM44Z1bDfwCZeEL0oO48DcHlBSTOVxpPYBmaDdzXPkgGzvFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGZhuVJN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7060C4CEEB;
	Thu, 21 Aug 2025 08:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755765071;
	bh=ekhIQak7qu2ROGBFaHIspyrdtLtgcRaAEJAbXNV6jmY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kGZhuVJN9bwLkJToG+urzc1mGuvwsLZOGDe2BYyDY4IWxbNHZy880qDYaZaTumN3Z
	 0QRMBypeqAcomoDBfYqK9IKogBQkQxj5OOY/f3clOQCL3rDURxgEQSGBxgpwqhvLIt
	 XtGGOT05cryIxaVxY3wotrm/jd9cLhVRRa80urCdmTTRaq4dCFX3M11MkmJGvLJShI
	 1Ve5uLPTHrWocYnSsiYbZ1F58+VYHMSGzNgW3WML1VkKLFXj17AkGapFNymf8Z7yDD
	 FjLelYj2ZLP//geXylnhWuyj0cMhkDFPTbUL5Pgjsyv5S/5/TcdmZzqbSv2Ua9h/b+
	 lrfOKyMDyMIDA==
Message-ID: <0f743a0d-3b96-4d85-8732-528218ec9dcc@kernel.org>
Date: Thu, 21 Aug 2025 09:31:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: ov02c10: Fix default vertical flip
To: Sebastian Reichel <sre@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: Frederic Stuyk <fstuyk@runbox.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
 <wi1S5bR9Vqu0TCZo3K677S9hSq-RNPmeZn_E6vpQNKhkqxcuBKtVK2DH3aaNt5qL_ecONfnIzF1fsDGBdt7AUw==@protonmail.internalid>
 <20250820-ov02c10-fix-v1-1-3fcca2cfbfbf@kernel.org>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250820-ov02c10-fix-v1-1-3fcca2cfbfbf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/08/2025 01:13, Sebastian Reichel wrote:
> The driver right now defaults to setting the vertical flip bit. This
> conflicts with proper handling of the rotation property defined in
> ACPI or device tree, so drop the VFLIP bit. It should be handled via
> V4L2_CID_VFLIP instead.
> 
> Reported-by: Frederic Stuyk <fstuyk@runbox.com>
> Closes: https://lore.kernel.org/all/b6df9ae7-ea9f-4e5a-8065-5b130f534f37@runbox.com/
> Fixes: 44f89010dae0 ("media: i2c: Add Omnivision OV02C10 sensor driver")
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>   drivers/media/i2c/ov02c10.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 089a4fd9627cf6c13efa65c104caeac370b53bc0..3a02fce0a9bc0ca3ab87defe3eefd04efb4012e7 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -175,7 +175,7 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
>   	{0x3816, 0x01},
>   	{0x3817, 0x01},
> 
> -	{0x3820, 0xb0},
> +	{0x3820, 0xa0},
>   	{0x3821, 0x00},
>   	{0x3822, 0x80},
>   	{0x3823, 0x08},
> 
> --
> 2.50.1
> 
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

