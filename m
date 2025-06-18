Return-Path: <linux-media+bounces-35170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B312ADEC2B
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 14:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E2143A5E5A
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 12:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BBB2E9EB5;
	Wed, 18 Jun 2025 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ohlgtAWT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C62E265D;
	Wed, 18 Jun 2025 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249318; cv=none; b=LXm6QiqkoGdxdAiwpyu10l9V3u8XKBVKxxlRZ3TRjaW6UQz/RBM9NtWLnV1+WaeuJalfvSlkwWpRqcZ53MSdb7W0YiPHRcftV4YQFw5NwcwUsPkRMgVYe09eTR8WqSNFiRDu436/CHWFhweL4bq9AyywO3j7RsA+lfK+lML1iVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249318; c=relaxed/simple;
	bh=Ih5zjiRGwMAvZQPX9KEr/plji2ng+jsO/q4Yt/O5IRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pfqryyDbWKdww6oCfoz8LEn3OAnyDHmNmHbcwHIGGZIK6WeGl2/D9pywX0zN2bD832wIe8jOS0fD9TV0WGZRjqpiveZbzOtmHVb4KqcLUu8rypaK6nZDJEetfp8Hh8GUC90Sk/z7N+f74B49YV4lQgKoKtR+oStsjUcYILazg/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ohlgtAWT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750249313;
	bh=Ih5zjiRGwMAvZQPX9KEr/plji2ng+jsO/q4Yt/O5IRU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ohlgtAWT7yjpPcE/xEv1XBO2m6bmo3mg0DJxG6HAaeNer6gFJzTrUtR24807KK1L9
	 RGxCKVMFvq+n8MX8gL+l/JQjRrsco0O1EuykFJ6hnvegjFKVcGzTBnucvh4p+w5Tj6
	 LLw2EUydJU/Mu0tdsHjfRUcujDaGZk7L39eit/oeNYZDqDWkqy39t3qzuoj5Y507yL
	 6VHI6/U44lBH0Vh5YmmqbBsBzRTbZ+8YLLXmaY6Ll7K/12zENr0WcM2yHOqP6HeE5R
	 6Las4LiVbTzVkZzTZ3lvuB9kFCQRKppNfNcXFwKtngTRXlqAVkEMS2qUHqNSj1ftxY
	 w9GQZiHKvbvHQ==
Received: from [10.40.0.100] (185-251-200-162.lampert.tv [185.251.200.162])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C17D17E0CEE;
	Wed, 18 Jun 2025 14:21:52 +0200 (CEST)
Message-ID: <5d3418a3-70f5-46d8-a538-72e6958d5d02@collabora.com>
Date: Wed, 18 Jun 2025 14:21:51 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/13] media: rockchip: add a driver for the rockchip
 camera interface
To: Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Mehdi Djait <mehdi.djait@bootlin.com>
References: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
 <20240220-rk3568-vicap-v8-6-9d9cbc4b524d@collabora.com>
 <656zxutvwytnd5i5l3nknni47r3wofmmwtxycleekjtrkbgfeo@xm7xbzirh3ce>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <656zxutvwytnd5i5l3nknni47r3wofmmwtxycleekjtrkbgfeo@xm7xbzirh3ce>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mehdi,

On 6/13/25 14:33, Mehdi Djait wrote:
> Hi Michael,
> 
> [...]

Let's cut the long story short, shall we :-)

>> +static void rkcif_stream_fill_format(struct rkcif_stream *stream,
>> +				     struct v4l2_pix_format_mplane *pix)
>> +{
>> +	const struct rkcif_output_fmt *fmt;
>> +	u32 height, width;
>> +
>> +	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
>> +	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
>> +	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
>> +	v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
> 
> The rkcif supports the SRGGB10P: the packed version of the SRGGB10.
> 
> When you try to capture with SRGGB10P, the following fails in
> v4l2_fill_pixfmt_mp()
> 
> 	info = v4l2_format_info(pixelformat);
> 	if (!info)
> 		return -EINVAL;
> 
> The return value is not checked in rkcif_stream_fill_format() resulting
> in a call to queue_setup returning with sizes[0] = 0

Thanks for pointing that out. I failed to realize that this helper
function may return an error. What I can do is to implement the error
propagation correctly. Of course this will only avoid the kernel
warning, you still won't be able to stream.

> This will cause a kernel Warning in the vb2_core_reqbufs() because
> plane_size = 0
> 
> Exactly here:
> 
> 	for (i = 0; i < num_planes; i++)
> 		if (WARN_ON(!plane_sizes[i])) {
> 			ret = -EINVAL;
> 			goto error;
> 		}
> 
> I still don't have the solution here but wanted to let you know about
> it.

I only had a quick look at it, but apparently the compact formats are
missing in the format list here:
https://elixir.bootlin.com/linux/v6.16-rc2/source/drivers/media/v4l2-core/v4l2-common.c#L244
for whatever reason.

Have you by chance tried adding a line like
{
	.format = V4L2_PIX_FMT_SRGGB10P,
	.pixel_enc = V4L2_PIXEL_ENC_BAYER,
	.mem_planes = 1,
	.comp_planes = 1,
	.bpp = { 5, 0, 0, 0 },
	.bpp_div = { 4, 1, 1, 1 },
	.hdiv = 1,
	.vdiv = 1,
}
?


Maybe we can fix this, but please note that this issue should not block
merging this patch series.

Best regards,
Michael

