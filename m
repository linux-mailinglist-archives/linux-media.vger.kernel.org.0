Return-Path: <linux-media+bounces-15546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA65940BF4
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 10:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC0661F25939
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 08:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F885192B8E;
	Tue, 30 Jul 2024 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QO/mbFAQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C30C55769;
	Tue, 30 Jul 2024 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328925; cv=none; b=A+WevVGR1pASz2RxAXJeg0zuWUSA6N/VfC48IrJnIX3eQ7ojpvdyOzdrMnjVvjaw29dHE6XVB+VjotYTVrXfvMTp8KbFsApCtz4/S/UC1L7PklPj8GNg7KvochY8geCk7iZHkDAtIjtrw4kMXhmgK5nF6JbbwP965jZDjF4RHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328925; c=relaxed/simple;
	bh=ceVEUmRmcQ4KnLWkgoSmg7JJO06F83rsrdbhNKdWrTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2DxwKJ5hM01wegb2APQE7bwPxLybKP+5n7lOJtRUUoqTto/hdrY78hddROhEUzEGqjgdey5z6cGwOyiXgqjbs/i9BMHedw3QMucW2LM4JnBxYpJFtH+0bxeUPnUwInloJBDthtcSXoR4P1NTvC5EtJIQ+8wfZLyqNYvrtJMyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QO/mbFAQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC77C32782;
	Tue, 30 Jul 2024 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722328925;
	bh=ceVEUmRmcQ4KnLWkgoSmg7JJO06F83rsrdbhNKdWrTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QO/mbFAQ3YAQycQa6XyR0vcD2qZ7kafIEX2XbwPtiOd6/i/29U9OIzSK7/cLXKvfX
	 MVGgYReVY5PYqkZAGXTnlFnQRRZwLj9QMJUWpX3yB81riY0NrCE9WzO6cGWD57Oe5Q
	 qvgSJob18fmbYXf8GR8X9FdSJRDjFPNnO2ED+PUspX8ZsN0YiAJQZQ3csfkW4Miuwg
	 CLylTIeaNmerINAnfHg31lEynavO63w4/93Yb9Exyg/R2OOSk7O7GsEzMZ4Ff0XA3l
	 Q3bTgSBoSnHQZt0CkcxklIK4zLyO+uCnR1UM2cDbc9y6eJIG1eHdyyq+PNPA+MROXB
	 CrB4djA32ey0A==
Message-ID: <729280cd-557f-43ba-b1a6-8d319977ca82@kernel.org>
Date: Tue, 30 Jul 2024 10:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-media@vger.kernel.org,
 stable@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
 <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org>
 <ZqijVf68ZQuFGKhU@kekkonen.localdomain>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZqijVf68ZQuFGKhU@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/07/2024 10:24, Sakari Ailus wrote:
> Hi Krzysztof,
> 
> On Mon, Jul 29, 2024 at 04:09:39PM +0200, Krzysztof Kozlowski wrote:
>> On 29/07/2024 13:04, Umang Jain wrote:
>>> Rectify the logical value of reset-gpio so that it is set to
>>> 0 (disabled) during power-on and to 1 (enabled) during power-off.
>>>
>>> Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
>>> time to make sure it starts off in reset.
>>>
>>> Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>> ---
>>>  drivers/media/i2c/imx335.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>
>> This will break all the users, so no. At least not without mentioning
>> ABI break and some sort of investigating how customers or users are
>> affected.
> 
> I know the original authors aren't using the driver anymore and it took
> quite a bit of time until others started to contribute to it so I suspect
> the driver hasn't been in use for that long. There are no instances of the
> device in the in-kernel DTS either.
> 
> Any DTS author should have also noticed the issue but of course there's a
> risk someone could have just changed the polarity and not bothered to chech
> what it was supposed to be.
> 
> I agree the commit message should be more vocal about the effects on
> existing DTS.

I can imagine that all users (out of tree, in this case) inverted
polarity in DTS based on what's implemented. You could go with some
trivial hack, like I did for one of codecs - see 738455858a2d ("ASoC:
codecs: wsa881x: Use proper shutdown GPIO polarity"), but I remember
Mark Brown rejected similar commit for newer drivers.

Best regards,
Krzysztof


