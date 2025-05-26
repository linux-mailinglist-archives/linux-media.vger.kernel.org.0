Return-Path: <linux-media+bounces-33367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EFFAC3E32
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 12:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF5E2189732D
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 10:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53111F7586;
	Mon, 26 May 2025 10:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfmlubT0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396E158DD4;
	Mon, 26 May 2025 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257033; cv=none; b=qYjlSMbB8vJEgDryCIf0XjnjrutNdF838BIngE1Re58EExDMhriRXkYo3z1fUL9kW0U1bby7qAz/nvHrJQtXAgP/A4VqFSLVu3XZCL/zGz9UJdQlhqpYg+4Ab2hvhBjEh4ims7oSlLjBbcg64H2iEqxQ9D0MxWBNQVYouWWKqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257033; c=relaxed/simple;
	bh=p4Zc5E4s4jSmRYkWVsP8yD+Jv6GaTktdOKbO1XklD3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUNI+aDGe1U7qtxxMB2usKJA2AS74heOVHMQUihzcQCI2HsxaOidPBkzw08RUO5Ra+WpA2WVGM6iF/8n/iuj2bLDLwe/Y4IfISUYm3TkWzSYmVCRLO9AjTIYpMMABTWLwRLtqaYMHlsvLjoAsEURehh+PLNWeD8YFqjXyjDUVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfmlubT0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968C0C4CEE7;
	Mon, 26 May 2025 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748257032;
	bh=p4Zc5E4s4jSmRYkWVsP8yD+Jv6GaTktdOKbO1XklD3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AfmlubT0FcgBwEDpWIZa0gV86Bsp5UAMvsdz4fElEGvUo7acim4Nw4jAhbb93OxlK
	 YUINhIZApzaGrj5Kzu94cq7ie9yoqESV2judj+4ChRTy5FIK+hCC6/R+s33dGnNfU+
	 RfnCJ2InvQRXC8ZG7JYChzv7c9fKURuOvKb0l4Gm33jB4boT6d1Jp2wxAqSAWdGOiz
	 IymfZ7mBROHzOBBiOK/cLA1m7TTk7IilcF2t+WsmZsa2cNGghr4QEzhyp3b2P6B5hD
	 2G1eTzK4tbgJsZh/qKqmeYsgg7sgHpBdNMd4aQLHjyKxRexowi+GYaS9XvM3BXiSv+
	 fR++otAsNW4UA==
Message-ID: <b5bb919e-6273-48ed-b5d8-29177dbbfb76@kernel.org>
Date: Mon, 26 May 2025 12:57:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder
 dt-bindings for Gen3 IP
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michal Simek <michal.simek@amd.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>, Junhao Xie
 <bigfoot@classfun.cn>, Rafa?? Mi??ecki <rafal@milecki.pl>,
 Kever Yang <kever.yang@rock-chips.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Gaosheng Cui <cuigaosheng1@huawei.com>,
 Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
 <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
 <3e6be40a-2644-416a-bd32-f6256f1501ff@kernel.org>
 <7863d15a-fa20-4db5-89b5-77a026d3f937@kernel.org>
 <a72z6exgol5cbur2cy7wjwyroi4zddtki5ab3zdkfuwpskpavr@r26wahldhd3r>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <a72z6exgol5cbur2cy7wjwyroi4zddtki5ab3zdkfuwpskpavr@r26wahldhd3r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/05/2025 09:25, Yassine Ouaissa wrote:
> On 23.05.2025 19:13, Krzysztof Kozlowski wrote:
>> On 23/05/2025 19:11, Krzysztof Kozlowski wrote:
>>> On 23/05/2025 15:41, Yassine Ouaissa wrote:
>>>> Add compatible for video decoder on allegrodvt Gen 3 IP.
>>>>
>>>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>>> Please do not send the same patches over and over again. You got review
>>> which you need to address.
>>>
>>> Once address you send NEXT version with proper CHANGELOG for each patch
>>> or top of cover letter. See submitting patches... or just use b4. This
>>> should be actually requirement for this work.
>>>
>>> Anyway, I see all of previous review ignored so let's be explicit:
>>>
>>> NAK
>>>
> Hi Krzysztof,
> 
> Make sure that i'm not ignoring anyone reviews, i sent a new set of
> patches to start cleanly, and i have sent you an email about this.

It is still v1 - the same? - while you already sent three patchsets before.

> 
> Also, for this patch (dt-bindings), i respected your previous reviews.
I did not check every previous comment, since this is v1, but at least
subject did not improve which with lack of changelog and versioning
suggests nothing else changed either.

OK, if you implemented the reviews, please point me to the changelog
listing all the changes you done from each previous version?

Best regards,
Krzysztof

