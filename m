Return-Path: <linux-media+bounces-36896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60465AFA431
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 11:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB34A3B4220
	for <lists+linux-media@lfdr.de>; Sun,  6 Jul 2025 09:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B25F1FECAD;
	Sun,  6 Jul 2025 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8tU/qJx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B677F1EA7D2;
	Sun,  6 Jul 2025 09:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751795840; cv=none; b=nshNhAlMAruOsTCUfgHlIY91QaOxZ9HjIR3vWk2VKOpYhLDWkNdt7XpTvWTZMl58ZVo2PCmcXp/xmgzMdjMt8TwBWHpOnjsXOmBt37rMWUWa4qM6CkRPRHgNrOnnBZtX6Zfq2qfGyKKzfO4s0x2WWQ6jxjN2mDtYIRerxTojWWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751795840; c=relaxed/simple;
	bh=6Z6xk0hZ4ym+h4tpElA1QGUyo+jiCU3uLtQ3R3vzSRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnIH6V8mDXXz1lso8Kdo3s2NfrZq9e76ytT/DexK/+lJPEFXY987GXJb46Y1Uagi5dfkdJujcb+S0LJFjlnF8N0oVXK+hlCvkay/cS6fknWwRvzfQ8JvzTScrUVOVuhUnrAn++hR9FicjMCw2ZV+GmM/y9otdNUThPOuKcZrIp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8tU/qJx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE0FC4CEED;
	Sun,  6 Jul 2025 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751795840;
	bh=6Z6xk0hZ4ym+h4tpElA1QGUyo+jiCU3uLtQ3R3vzSRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j8tU/qJx9kd0NaEWySF5SW5mbIYBR0xYoCD7jZOK4M+q5VLSi7nqF1JyaBXWUU7ED
	 SsW9zNLF007mcfOYR1SRdjA/6ijPaokJHUPlr6tzN2YwfT8T0wwXusnsdFZ3r6MLvX
	 8hjIiASrSVnHhQC++PmrJ3NaOpV37kpQ8gUaykGVBS1bvZ4O8SJptUfsDMDYoefiTy
	 7mvGb2KTm5gXSau0Fex/T5ipdpSmPde1SLvfY5GqJ3pFT+tg8TsAEpWyUdyAzq1IDE
	 d+ZoWYDKxAZHJoAg96FAYtlbitgxVaCwGfWRPV+RIxnqK95Ta/buO/Wi1n6uJHZqQ+
	 p3xbpol/32oBA==
Message-ID: <3bb4690c-eedf-4cb6-8779-2ea1004510e2@kernel.org>
Date: Sun, 6 Jul 2025 11:57:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/23] media: atomisp: gc0310: Add link-frequency and
 pixelrate controls
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250517114106.43494-1-hdegoede@redhat.com>
 <20250517114106.43494-8-hdegoede@redhat.com>
 <aCsWY1ICUoHTq07L@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aCsWY1ICUoHTq07L@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 19-May-25 1:30 PM, Andy Shevchenko wrote:
> On Sat, May 17, 2025 at 01:40:50PM +0200, Hans de Goede wrote:
>> Add support for the pixelrate control as expected by libcamera,
>> while at it also add the link-frequency control.
> 
> ...
> 
>> +/*
>> + * The actual PLL output rate is unknown, the datasheet
>> + * says that the formula for the frame-time in pixels is:
>> + * rowtime = win-width + hblank + sh-delay + 4
>> + * frametime = rowtime * (win-height + vblank)
>> + * Filling this in and multiplying by 30 fps gives:
>> + * pixelrate = (660 + 178 + 42 + 4) * (498 + 27) * 30 = 13923000
>> + */
>> +#define GC0310_PIXELRATE			13923000
> 
> Why not utilise the preprocessor to calculate the above?
> I mean we can define an arithmetic expression instead of the result
> (which is mentioned in the comments anyway).

I don't really see any added value in using the pre-processor
for this, it just makes the #define line unnecessarily long.

Regards,

Hans


> 
> ...
> 
>> +/* single lane, bus-format is 8 bpp, CSI-2 is double data rate */
>> +#define GC0310_LINK_FREQ			(GC0310_PIXELRATE * 8 / 2)
> 
> Hmm... I believe it won't be ever the case, but still the Q here is
> if we expect rounded up value? In such a case perhaps BITS_TO_BYTES()
> would make sense. OTOH the format theoretically can be not only 8bpp
> in some cases, but let's say 9bpp, that macro wouldn't help then.
> 


