Return-Path: <linux-media+bounces-25470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E492A23F28
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 15:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006E416919F
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 14:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1521C1C5D56;
	Fri, 31 Jan 2025 14:30:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B364F145324
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738333854; cv=none; b=PUlmTMJ88gJ2voPheXRVrLlZHI2Z9bsyt/opeP398njjfI3KDmQ+uuqhQNy4w3GSkRocguEubH2exxuiqd88qkjblCfElHH7f5gV5zm5rCrjfda+a0TplZ/8Pu3jAGmHBo4osknluPyf/XcputoTHIwGIOe+oXaNp+AjogfEiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738333854; c=relaxed/simple;
	bh=qpzQ5msTeM+xJA019FrHwO0//SqDhZbe0mjCSAubwbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLZLAFNELWWfV615D5xiQYqumbGfiuslDn7PUAyTBRSFgg+8LCudG/s9MK5zoa938BftiDnwBYTHzN+f6pFODnlp3RH37xTztSabtLrzfHFMgY9p5lSoZSUJWkLHXF+jHoaHaHcKOoo0tcIIzwvKxSr7vHtOheawOMoH/A0Vs/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53541C4CED1;
	Fri, 31 Jan 2025 14:30:51 +0000 (UTC)
Message-ID: <14b37720-1f0e-4f91-bae9-91757615bd58@xs4all.nl>
Date: Fri, 31 Jan 2025 15:30:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "media: uvcvideo: Require entities to have a
 non-zero unique ID"
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, Tomasz Sikora <sikora.tomus@gmail.com>,
 kernel-dev@igalia.com,
 syzbot+0584f746fde3d52b4675@syzkaller.appspotmail.com,
 syzbot+dd320d114deb3f5bb79b@syzkaller.appspotmail.com
References: <Z4aeK4Ct7L/9kR2H@quatroqueijos.cascardo.eti.br>
 <20250114200045.1401644-1-cascardo@igalia.com>
 <CANiDSCvx4QrAuhXgF51W+-B4XJU-6bxTd=5vCuw9SPmKXDXjdQ@mail.gmail.com>
 <CANiDSCu6ociHkyatMHpH5a2TDsMmHNr=f7-wvpwGDSTw=DKNhQ@mail.gmail.com>
 <6d67c5c2-be60-454b-b03c-ed89c74262b8@redhat.com>
 <CANiDSCvr2PVmzir-0NO3P_WaPMcbLj5xe9KWtxCB=+dQFuj8ng@mail.gmail.com>
 <20250131150618.6987c1c7@foz.lan>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20250131150618.6987c1c7@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2025 15:06, Mauro Carvalho Chehab wrote:
> Em Fri, 31 Jan 2025 12:17:25 +0100
> Ricardo Ribalda <ribalda@chromium.org> escreveu:
> 
>> On Fri, 31 Jan 2025 at 12:12, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Hi Ricardo,
>>>
>>> On 31-Jan-25 11:04 AM, Ricardo Ribalda wrote:  
>>>> Hi Hans  
>>>
>>> Which Hans, me or Hans Verkuil?  Since this needs to go out
>>> through a fixed pull-request I think it would be best if
>>> Hans Verkuil picks up the revert directly in the fixes
>>> branch ?  
>>
>> Whoever started in v4l2 later needs to change their name :P.
>>
>> I was thinking about you this time :)
>>
>>>  
>>>> We are seeing a spike of reports with the signature:
>>>>
>>>> "Found multiple Units with ID XX"
>>>>
>>>> Could you take a look at this patch? I agree with Thadeu that the best
>>>> strategy is to land the revert asap and when the storm disappears work
>>>> on a different solution.  
>>>
>>> Ack, Fedora is getting some bug reports about this too. Since both
>>> you (Ricardo) and Laurant seemed to be on top of this I didn't take
>>> a closer look yet. But this definitely is hitting users and we
>>> need to fix this.
>>>
>>> Since we still don't have a fix yet we really should revert the commit
>>> causing this problem ASAP.  
>>
>> Hans (Verkuil) if Hans (de Goede) adds a Reviewed-by or a Acked-by,
>> could you take this patch to the media-committers/fixes branch ?
> 
> I can pick it as well. From what I got, Hans de Goede is also ok
> with such change.

OK, I leave it to you, Mauro.

I'm swamped at work, unfortunately.

Regards,

	Hans

