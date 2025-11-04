Return-Path: <linux-media+bounces-46245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1632C2F743
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 07:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26173189C27D
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 06:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EDA5280308;
	Tue,  4 Nov 2025 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvDt0/4J"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A65D1B7F4;
	Tue,  4 Nov 2025 06:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762238124; cv=none; b=H0TemPbxLSbt2vH4RYkCx/eqZqRvIEe9JUOGAEHMzk3qar6/BT4h3LDCoQ4KdU8EfuNbvrDcIfEz67gKp07njNljMcXLFukaC/kFYQV3zV1dV7bwTFxVgOh4hQCeAqu+oAsLCPNe02CV8aPaZydKS29KlWFUEooonW2RcNpZe5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762238124; c=relaxed/simple;
	bh=eFuDg37ZQAag3sg5+6r+dhczzX8GMtILmYLd5akxHxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iix4Q+5TPbMxKa/oeMovRASRDrAoz5ly3ZlLtg0UOzZGXp+FG2bste1vpogTlBpPLWd+rd46kXxk2HBXoQbP7r0+el67hpPyf0FreFMcG0APcuWR6RO7LCXkPI89xbnaK9rzk1cHWAmZtW06AmR6WOzi2iP2liYG8FwFy4/V7EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvDt0/4J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11309C4CEF7;
	Tue,  4 Nov 2025 06:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762238123;
	bh=eFuDg37ZQAag3sg5+6r+dhczzX8GMtILmYLd5akxHxk=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XvDt0/4JxCDD8N4w4xQdVrdlLd63KTFg7ne6R5N3/7HZn88/qr7qw+gLTFv8Q3lUw
	 Sk40/10HHnBfbmEpyhsLgTxR3xfuK0ZLvpVYN8hfoimKU6he8WNmvPz76BbftL2UiW
	 cWbDPwlJiQhQgalfini5lXBV6LXkeEwmERW2tyFJrns6IQT+TEWDao1i9K6gOF+FJi
	 BeEdrYjPwOVLuwah/q7rm0BeIxLzruNEYRaeNutohUqWkbM5p/0g/CwA+XoUh/v00H
	 UdK8qCrq1Dk+23980NzcJB1P6idBLmFYuW4oJyTHl3lgdObPL3XPP6HE88Hm3SbxK5
	 QcyGh/l2S6RkA==
Message-ID: <ab56339a-8736-4d68-bf11-d27c8d591597@kernel.org>
Date: Tue, 4 Nov 2025 07:35:19 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH v2 0/3] module: Add compile-time check for embedded NUL
 characters
To: Kees Cook <kees@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Malcolm Priestley <tvboxspy@gmail.com>, Hans Verkuil <hverkuil@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251010030348.it.784-kees@kernel.org>
 <176219902728.2668573.8447418880394997824.b4-ty@kernel.org>
 <202511031612.8A05E2FD1C@keescook>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <202511031612.8A05E2FD1C@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/11/2025 01.13, Kees Cook wrote:
> On Mon, Nov 03, 2025 at 08:49:43PM +0100, Daniel Gomez wrote:
>>
>> On Thu, 09 Oct 2025 20:06:06 -0700, Kees Cook wrote:
>>>  v2:
>>>  - use static_assert instead of _Static_assert
>>>  - add Hans's Reviewed-by's
>>>  v1: https://lore.kernel.org/lkml/20251008033844.work.801-kees@kernel.org/
>>>
>>> Hi!
>>>
>>> [...]
>>
>> Applied patch 3, thanks!
>>
>> [3/3] module: Add compile-time check for embedded NUL characters
>>       commit: 913359754ea821c4d6f6a77e0449b29984099663
> 
> I'm nervous about this going in alone -- it breaks allmodconfig builds
> without the media fixes. My intention was to have the media fixes land
> first...
> 
> Should I send the media fixes to linus right away?
> 
> -Kees
> 

I can take both patches. But I think it'd make sense to drop patch 3 first and
then, apply all 3.

Please, Kees, Hans and Mauro, let me know if this is okay with you.

