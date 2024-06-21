Return-Path: <linux-media+bounces-13889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDCA911AF7
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 08:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145F6283FCD
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 06:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D75168C3C;
	Fri, 21 Jun 2024 06:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SgHVQoco"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00583168C17;
	Fri, 21 Jun 2024 06:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718950238; cv=none; b=lgt5kboeDImTOghqWsbjTkEpOCUOLyq9JcqWf+9zA+5+nOaFQfPAGGPc+3y9eh6pP5oJwLD3J+8CPnJ8fcoFpUGy5JBER4FOgUJ2F7JCU9Qs3axiQDw/e+knAYxShQiQxCFU1Gsb+AaVlKnawigNkiIzkc6ikiRNohyuwe3kXUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718950238; c=relaxed/simple;
	bh=vanRCVs7Il0N1bVX0/dHBOpckIxMz3F6/5aZRbOXc3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjQPF79QalDQvdInnmd40943iu9RJgui4Ie2SeN6bQHDdYjWAk9pBnoBP5j0cyLtqVDw5ZA/l9duaDjXDFgIVBlfBrqTAHJIaO7+pOr6qeBNDUgo0r8h3zhtvFQDPE3XrDSTFORBtBnTaNsnPNqYCMFQ6bpSJGvdN0A6DgCGqaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SgHVQoco; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C4CC2BBFC;
	Fri, 21 Jun 2024 06:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718950237;
	bh=vanRCVs7Il0N1bVX0/dHBOpckIxMz3F6/5aZRbOXc3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SgHVQocoCiIw1OHhZ5VnmaFBHjno76cQpn3hOUw3agt9k/yNyFP4X20lAMb/XwW+r
	 PsNJ3RRtPQHqHTvq+AnyiIoL6sByOVlWJjEECnAvn8h/skjp4fmp5rpvxXmasyXR5p
	 M3y1GUkH4gZl9esHKaTyI6x8RL2rIzUuKPMns1GfxHUcE1JEwDpKQQnBUzQjiFmznV
	 DgsmS8eM76NSSRZC046k0iLRArOqBJ3u12icEapzxoaE21/nPncY7XAW0EtDLlq9om
	 3B8yUQ2w48nD/WWOjS7QdOPDHrDixtUfV5qGeSebzGUYwkALUXJL4DyImgOpaCrpoO
	 4lWJR1dUvEW/A==
Message-ID: <3acc5a0a-260a-4958-aab2-1d473c835a1b@kernel.org>
Date: Fri, 21 Jun 2024 08:10:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: rockchip: Introduce the rkvdec2 driver
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Diederik de Haas <didi.debian@cknow.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev
References: <20240619150029.59730-1-detlev.casanova@collabora.com>
 <20240619150029.59730-3-detlev.casanova@collabora.com>
 <dc232a01-1495-42ff-ad2a-5a0aa780b60c@kernel.org>
 <klzru2ak3yxccywqr57bslyctqtmrl2d3eghgv5letp7jkel6s@rlupljmxfijg>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <klzru2ak3yxccywqr57bslyctqtmrl2d3eghgv5letp7jkel6s@rlupljmxfijg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/06/2024 15:41, Sebastian Reichel wrote:
> Hi,
> 
> On Thu, Jun 20, 2024 at 12:30:00PM GMT, Krzysztof Kozlowski wrote:
>> On 19/06/2024 16:57, Detlev Casanova wrote:
>>> +static const char * const rkvdec2_clk_names[] = {
>>> +	"axi",
>>> +	"ahb",
>>> +	"core",
>>> +	"cabac",
>>> +	"hevc_cabac",
>>> +};
>>> +
>>> +/*
>>> + * Some SoCs, like RK3588 have multiple identical vdpu34x cores, but the
>>> + * kernel is currently missing support for multi-core handling. Exposing
>>> + * separate devices for each core to userspace is bad, since that does
>>> + * not allow scheduling tasks properly (and creates ABI). With this workaround
>>> + * the driver will only probe for the first core and early exit for the other
>>> + * cores. Once the driver gains multi-core support, the same technique
>>> + * for detecting the main core can be used to cluster all cores together.
>>> + */
>>> +static int rkvdec2_disable_multicore(struct rkvdec2_dev *rkvdec)
>>> +{
>>> +	const char *compatible;
>>> +	struct device_node *node;
>>> +	int ret;
>>> +
>>> +	/* Intentionally ignores the fallback strings */
>>> +	ret = of_property_read_string(rkvdec->dev->of_node, "compatible", &compatible);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	/* first compatible node found from the root node is considered the main core */
>>
>> So you rely on order of nodes? Before you claim "identical cores", but
>> now "main core" suggests one is different than others.
> 
> Heh, I wrote that comment for Hantro. By main core I was referencing
> the software side of things. With a number of equal cores and no DT
> node describing a cluster (from HW point of view it's just equal
> cores), they somehow need to be combined into a single entity to allow
> scheduling work between them. This solves the issue by making one of
> the devices the "main" device. From the HW point it's exactly the same
> as the others. The function could also use the last core or the second
> one. It does not matter as long as there is only one "main" core.

Sounds good. Maybe comment could be a bit extended with this
explanation, so the term "main" is clarified.

Best regards,
Krzysztof


