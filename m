Return-Path: <linux-media+bounces-34927-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CDAADB23F
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 15:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5DF118873E0
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 13:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6748227FB29;
	Mon, 16 Jun 2025 13:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vFU6xnzo"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F582BEFE1;
	Mon, 16 Jun 2025 13:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750081091; cv=none; b=SeZq5F7NqBijdEpvNo8l2GTaa7quD4EyBoLkGUSM5NDAewPRNxxeFVgfhia3OrpJdOXv/NurpkO+TDxxDPhNabGI4smhDO2IeG2R3Lua4rsIYrX4EsefLem69RCjrWDijagYDLZ52GLhxqUoSaL9zCQQscriz29CaWNp5e//pTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750081091; c=relaxed/simple;
	bh=PAiXz5vwin6ALBykyX+Z1oiXDEfr9TdECNi8ZpcyZEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+bYDw53UGPURhUVPToxPONJ4D1gNbmoF79gBONWVCWf408pJByHXOF/wn7kmoE7wIbDdMa02tATnmpRYvaxX9Zd73Fjr6aQ7LHHQj6Vt9lcaBeaCWgFePRW0DpN3LWiz4JzCcP8MaWNuCG+YqfhX+1A8AygcTJRQp6DHwJkpQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vFU6xnzo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E824BC4CEEA;
	Mon, 16 Jun 2025 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750081091;
	bh=PAiXz5vwin6ALBykyX+Z1oiXDEfr9TdECNi8ZpcyZEc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vFU6xnzothn3yHDRdgYTJ7FNenaPL9VrvySL3ySbMnUcOjBhLWyAqzY0hkjeBdgnP
	 tBdyFbyCHQ2qF+qznSoD4efslVEX9TTFFDRTTbAEwLtK6gMbUfABBIH25Fzoet7rAI
	 2wqId+K4Y++xQYfnFvOvKK5HoUGRmENrL7hhSy0QQ83z6t9VwxISAMbbqP+Jn8isLo
	 T/Z/YK6BZ9jjalLgBdgTohYa21afEcOfpW5S0GGzBvFCZkm3F/7vghWbGXT5FmNE11
	 MjwxT9Mg1uOND3HLO28z2HF9E1umCfSdweptgK6nd5KgIVjEnGIgQX3ixK3eg/64yw
	 wYPNSjdSlvlKg==
Message-ID: <61600bf6-92dc-49cd-bad9-a7342ce2fef9@kernel.org>
Date: Mon, 16 Jun 2025 15:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
 <f9275079-842a-406e-8bb7-b22a22b7c7e6@kernel.org>
 <CANiDSCt18PUWo2Z-9T2nBMMJfpRcdAGhO5S0jE85-1ZPO1qD7g@mail.gmail.com>
 <b78cde8b-23b2-48c5-b8c6-b935a403963f@kernel.org>
 <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <CANiDSCuPP+EOCps0gjH_bpJWsbyJDBcD+NoOeTB-sSUjUr0=Sg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 16-Jun-25 15:31, Ricardo Ribalda wrote:
> On Mon, 16 Jun 2025 at 15:26, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi Ricardo,
>>
>> On 16-Jun-25 15:22, Ricardo Ribalda wrote:
>>> Hi Hans
>>>
>>> On Mon, 16 Jun 2025 at 15:05, Hans de Goede <hansg@kernel.org> wrote:
>>>>
>>>> Hi Ricardo,
>>>>
>>>> On 29-Apr-25 15:47, Ricardo Ribalda wrote:
>>>>> When committers contribute quirks to the uvc driver, they usually add
>>>>> them out of order.
>>>>>
>>>>> We can automatically validate that their follow our guidelines with the
>>>>> use of keep-sorted.
>>>>>
>>>>> This patchset adds support for keep-sorted in the uvc driver. The two
>>>>> patches can be squashed if needed.
>>>>>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>
>>>> I've no objections against these 2 patches, but these need to be
>>>> rebased on top of the latest uvc/for-next. Can you send out a new
>>>> version please ?
>>>
>>> I was waiting for HansV to say that keep-sorted was useful and then
>>> add it to the CI.
>>
>> Ok, so should we drop this series from patchwork then ?
> 
> If the series does not bother you too much in patchwork let it stay
> there until HansV replies to the makefile series.

Sure that works for me.

Regards,

Hans


