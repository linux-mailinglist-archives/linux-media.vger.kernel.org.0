Return-Path: <linux-media+bounces-12713-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3BA900054
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BA391F2162E
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 10:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFFF15B0E7;
	Fri,  7 Jun 2024 10:08:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E086515749A
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717754929; cv=none; b=HP+ln8eNYXV0mJ4gek3ILhF/28tNpMdHJerblTdjbBzN7RfFR/PXUB2b6py4FphVGXaVLGQtMRCvDBitK7qeqBJ82X8oTlgpDp2KHsTeWHHvX/L1wZavnBC60rjneQ3xX+mZ6nQtt+urji2+ToB/oZTFQNbSrqJzmlidsvI8SLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717754929; c=relaxed/simple;
	bh=1eYfBYJAEkPJuON/1zowZuf8aSXQPKwlg3AdLTwdOr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOs2BJCap85KvmnOcQXlCg8cfHkWhNi2Ed3doig0o+l/olZNsijYBQcn7moPKnf0ivxx8BNjcPi3ea31HQwSFxlM22GNlVS12DDs0Pn2kwjy/hmjYxB3qfp8mjBaTaz5YfhaRe1yBiVuMVoP4Zpl4YUrcLMepX/WZ4c89/dWEbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD26CC2BBFC;
	Fri,  7 Jun 2024 10:08:48 +0000 (UTC)
Message-ID: <1c446b8f-8b82-446d-ad19-9bf8625a1b71@xs4all.nl>
Date: Fri, 7 Jun 2024 12:08:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: tuner-simple: Add support for Tena
 TNF931D-DFDR1
To: Nils Rothaug <nils.rothaug@gmx.de>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org
References: <20240203124745.10257-1-nils.rothaug@gmx.de>
 <20240203124745.10257-2-nils.rothaug@gmx.de>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240203124745.10257-2-nils.rothaug@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nils,

First of all, apologies for the delay in reviewing. I'm afraid that changes
to old USB drivers are low on the priority list.

The good news is that the code looks good except for some minor issues.
However, how it is split up into patches needs to be reorganized a bit.

On 03/02/2024 13:47, Nils Rothaug wrote:
> Tuner ranges were determined by USB capturing the vendor driver of a
> MyGica UTV3 video capture card.
> 
> Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
> ---
>  drivers/media/tuners/tuner-types.c | 22 ++++++++++++++++++++++
>  include/media/tuner.h              |  1 +

Add the Documentation/admin-guide/media/tuner-cardlist.rst change to this patch
as well. That keeps all the tuner changes together in one patch.

>  2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/tuners/tuner-types.c b/drivers/media/tuners/tuner-types.c
> index ff5a6c0acdd..cec2d6fefd7 100644
> --- a/drivers/media/tuners/tuner-types.c
> +++ b/drivers/media/tuners/tuner-types.c
> @@ -1434,6 +1434,23 @@ static struct tuner_params tuner_sony_btf_pg463z_params[] = {
>  	},
>  };
> 
> +

Drop this empty line to fix a checkpatch warning about duplicate empty lines.

Regards,

	Hans

> +/* ------------- TUNER_TENA_TNF_931D_DFDR1 - NXP TDA6509A ------------- */
> +
> +static struct tuner_range tuner_tena_tnf_931d_dfdr1_ranges[] = {
> +	{ 16 * 161.15 /*MHz*/, 0x8e, 0x01, },
> +	{ 16 * 463.15 /*MHz*/, 0x8e, 0x02, },
> +	{ 16 * 999.99        , 0x8e, 0x08, },
> +};
> +
> +static struct tuner_params tuner_tena_tnf_931d_dfdr1_params[] = {
> +	{
> +		.type   = TUNER_PARAM_TYPE_PAL,
> +		.ranges = tuner_tena_tnf_931d_dfdr1_ranges,
> +		.count  = ARRAY_SIZE(tuner_tena_tnf_931d_dfdr1_ranges),
> +	},
> +};
> +
>  /* --------------------------------------------------------------------- */
> 
>  struct tunertype tuners[] = {
> @@ -1946,6 +1963,11 @@ struct tunertype tuners[] = {
>  		.name   = "Silicon Labs Si2157 tuner",
>  		/* see si2157.c for details */
>  	},
> +	[TUNER_TENA_TNF_931D_DFDR1] = {
> +		.name = "Tena TNF931D-DFDR1",
> +		.params = tuner_tena_tnf_931d_dfdr1_params,
> +		.count = ARRAY_SIZE(tuner_tena_tnf_931d_dfdr1_params),
> +	}
>  };
>  EXPORT_SYMBOL(tuners);
> 
> diff --git a/include/media/tuner.h b/include/media/tuner.h
> index a7796e0a365..c5fd6faabfd 100644
> --- a/include/media/tuner.h
> +++ b/include/media/tuner.h
> @@ -133,6 +133,7 @@
>  #define TUNER_SONY_BTF_PK467Z		90	/* NTSC_JP */
>  #define TUNER_SONY_BTF_PB463Z		91	/* NTSC */
>  #define TUNER_SI2157			92
> +#define TUNER_TENA_TNF_931D_DFDR1	93
> 
>  /* tv card specific */
>  #define TDA9887_PRESENT			(1<<0)
> --
> 2.34.1
> 
> 


