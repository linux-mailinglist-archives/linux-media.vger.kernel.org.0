Return-Path: <linux-media+bounces-46283-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C3CC30DF5
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 13:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E732460D7E
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 12:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05552ED848;
	Tue,  4 Nov 2025 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l90mmw9E"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2742EDD74;
	Tue,  4 Nov 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257841; cv=none; b=kJdgO+jKT8/Uy7DrLv+hWlPu3QCte4fNJL4EohaVQlqfMPEAtVd2dmEDIQNDutlVtZcYk964vtxF+R7Zl1HyrkRKinho8ch+JX0TA6X/n+VTtqTV3xEGdMrhG6anTsV6DeLAMwJugzaRP9l+siPzMhu/JTMbUwJKwm/Wmldwi6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257841; c=relaxed/simple;
	bh=QZ+OVXIYRCz2+yDg3+AXTqnsrpvtrpMFFjx30RVPsq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kISuG2Ry1xIpqtFxg3Vqgqtk2f5OgOeV5zWo0fgdgYOwadffDZDPPAKr46ipdDi6xdPHK5DxlbCKIXC1gjiLqMCbW8kPeDmcFV9rwQ4O/3aMIr3cjVwobEpJNvyx5PqVXUHw8Z/T4oVJcl9XQJwKikK3toDXif0bszRXd9+uCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l90mmw9E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7B2C116C6;
	Tue,  4 Nov 2025 12:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762257840;
	bh=QZ+OVXIYRCz2+yDg3+AXTqnsrpvtrpMFFjx30RVPsq0=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l90mmw9EWDbZXtpP/qqYmOsc79yeV+JtdlVfTudU6GYTHJ6MtzGXuovwkuKB/RbIy
	 S7pUCGvk8e1czxkkX1JhUcTj0DIyMuqodLJOsXBrLMqfXVeMepciXx7irbRi6Iqt46
	 /pRtFBSv5LpDVfoLahaT+4RyZLrbYeH1WJZctjgQJgR4JG/eWK8kiZ8R9d8haj7blc
	 qeHPj13yD2WJ/ksc1/mT1VfaT01BVyrKIzTIxNqlqRFHMJGCw3aTmo/UGRLvs3wA8a
	 2VFTUFkvSdBvp/cleglG1DVWIzxPw9cYBiboBmyzwAg8dBxBNRtAeSknyA+5E1IaWV
	 rNQroB0PdqsQw==
Message-ID: <032ef71c-fcbd-42a9-98ea-b2568d663978@kernel.org>
Date: Tue, 4 Nov 2025 13:03:56 +0100
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
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Kees Cook <kees@kernel.org>,
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
 <ab56339a-8736-4d68-bf11-d27c8d591597@kernel.org>
 <5dba319f-56bc-40bf-9137-acb90f3cc754@kernel.org>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <5dba319f-56bc-40bf-9137-acb90f3cc754@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/11/2025 11.35, Hans Verkuil wrote:
> On 04/11/2025 07:35, Daniel Gomez wrote:
>>
>>
>> On 04/11/2025 01.13, Kees Cook wrote:
>>> On Mon, Nov 03, 2025 at 08:49:43PM +0100, Daniel Gomez wrote:
>>>>
>>>> On Thu, 09 Oct 2025 20:06:06 -0700, Kees Cook wrote:
>>>>>  v2:
>>>>>  - use static_assert instead of _Static_assert
>>>>>  - add Hans's Reviewed-by's
>>>>>  v1: https://lore.kernel.org/lkml/20251008033844.work.801-kees@kernel.org/
>>>>>
>>>>> Hi!
>>>>>
>>>>> [...]
>>>>
>>>> Applied patch 3, thanks!
>>>>
>>>> [3/3] module: Add compile-time check for embedded NUL characters
>>>>       commit: 913359754ea821c4d6f6a77e0449b29984099663
>>>
>>> I'm nervous about this going in alone -- it breaks allmodconfig builds
>>> without the media fixes. My intention was to have the media fixes land
>>> first...
>>>
>>> Should I send the media fixes to linus right away?
>>>
>>> -Kees
>>>
>>
>> I can take both patches. But I think it'd make sense to drop patch 3 first and
>> then, apply all 3.
>>
>> Please, Kees, Hans and Mauro, let me know if this is okay with you.
> 
> I'm fine. If you take it, then I'll drop the media patches from our tree (I merged the
> media patches yesterday).
> 
> Let me know if you take them.

Thanks, Hans. I merged patch 3 yesterday as well, but since patch order matters
in this case, it makes sense to take all of them through the modules tree.

Sorry for the trouble, and thanks Kees, for pointing this out.

> 
> Regards,
> 
> 	Hans

