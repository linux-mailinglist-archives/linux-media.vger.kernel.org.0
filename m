Return-Path: <linux-media+bounces-55887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FjbN9rXt2mcWAEAu9opvQ
	(envelope-from <linux-media+bounces-55887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:13:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CA2297BF0
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 11:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77F863006B78
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153C638CFF7;
	Mon, 16 Mar 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYtnYR7z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E39352FB0;
	Mon, 16 Mar 2026 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656009; cv=none; b=mtpY8ZFph5U6au30xpf3ntUyl+ITkwr3cN0SPgSqXMcdoqHUFkLZpppSndT17sY43P25GvLNAptNsqDgyx++bQFBG0+DnDHOa00P66odSR5XzHKQAtIru5mClyQWR9T6VteogFeiLF09qF/lTR0alRtiD/wvV8S/7Xe9B1+RZxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656009; c=relaxed/simple;
	bh=uvmNUVeW05PxXKT9g2Z+LxiEzXQO/dH0eTByg8eVn/E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ssNTsGohgZYngPIs79aKxiZphKr37eV9Oypao/hVTuXQ+dAeJLNNugDscfclkgKtgOkKlLioayQ6pVXX9kEv2rIHSSc02M8GuB0KgkrR6REyq6AtZWzbu8AM4uhy+ODdzfBec/BD7pJn/GBjFxjfZvad4RyEy4PZs7+RrB+dk3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYtnYR7z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CAFC19421;
	Mon, 16 Mar 2026 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773656009;
	bh=uvmNUVeW05PxXKT9g2Z+LxiEzXQO/dH0eTByg8eVn/E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=lYtnYR7zUf8+8AfVyh/A1n57n6tphcah6GFYj7Jo/9aIARfwXp8r6N6yEdvwIiYbA
	 MxsfxmkmPUedlm8Clq0Ea6IoktbCDeemrI5SxPI05iqqaiJaFd1M5wKga64jjOdfqL
	 u0UoX6DNe1pPlnr0HoWK09ICt0+LHOvFugc/iPJUaAIACExyipxDux3uhhfpyWSzmS
	 iOaD+GXjRQJkb0kU7M6Ui6vq54TTDZLqzDErNCb/CV+DN4oRZQyjXrBfeDAyOZ/I0G
	 GZ2uuCIhc4xw8jH17oTosyW78b3Sm8OyPtFEpmAIteJtNIbT3Vyi7Y14tl1CThSLp4
	 dr7aI7fRPgSbg==
Message-ID: <8fcc1419-266c-429e-b1bf-1799322eb69e@kernel.org>
Date: Mon, 16 Mar 2026 11:13:24 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v2 1/6] media: vidtv: Rename PI definition to PI_SAMPLES
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
References: <20251107201005.3156118-1-andriy.shevchenko@linux.intel.com>
 <20251107201005.3156118-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, nl
In-Reply-To: <20251107201005.3156118-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55887-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,chromium.org,metafoo.de,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 48CA2297BF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andy,

Just FYI: I'll take this patch. Regardless of the other patches in this series it does
make sense. I haven't seen any updates to this series, is it abandoned?

Regards,

	Hans

On 07/11/2025 21:02, Andy Shevchenko wrote:
> The definition of PI in the driver is not the actual value in radians,
> but rather degrees. Since we are going to have a value in radians
> defined in a global header, rename this definition to avoid potential
> collisions. No functional changes.
> 
> Acked-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/media/test-drivers/vidtv/vidtv_s302m.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vidtv/vidtv_s302m.c b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> index 9da18eac04b5..b3217d643b1e 100644
> --- a/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> +++ b/drivers/media/test-drivers/vidtv/vidtv_s302m.c
> @@ -45,7 +45,7 @@
>  #define FF_S302M_DEFAULT_PTS_OFFSET 100000
>  
>  /* Used by the tone generator: number of samples for PI */
> -#define PI		180
> +#define PI_SAMPLES		180
>  
>  static const u8 reverse[256] = {
>  	/* from ffmpeg */
> @@ -259,10 +259,10 @@ static u16 vidtv_s302m_get_sample(struct vidtv_encoder *e)
>  		if (!ctx->last_tone)
>  			return 0x8000;
>  
> -		pos = (2 * PI * ctx->note_offset * ctx->last_tone) / S302M_SAMPLING_RATE_HZ;
> +		pos = (2 * PI_SAMPLES * ctx->note_offset * ctx->last_tone) / S302M_SAMPLING_RATE_HZ;
>  		ctx->note_offset++;
>  
> -		return (fixp_sin32(pos % (2 * PI)) >> 16) + 0x8000;
> +		return (fixp_sin32(pos % (2 * PI_SAMPLES)) >> 16) + 0x8000;
>  	}
>  
>  	/* bug somewhere */


