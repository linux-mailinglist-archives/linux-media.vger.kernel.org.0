Return-Path: <linux-media+bounces-44407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE4BD9294
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0CBD426074
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 11:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199B5310629;
	Tue, 14 Oct 2025 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKGG2qN/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BBD13D539;
	Tue, 14 Oct 2025 11:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443077; cv=none; b=GcKyMnp7WbJk0lg6vPorex0EPfX6j0j1yCDTBayVRuK4re/0xLJ9GCJ2xIzVNngA6YwdDuNtx8T0IgPzI4Y+YWh2N+LDldwVF2rTrrn2r+9YanMfntUi242CKhj5xDHJOPDsPzDcZAetKkgWKDZnq/nv47d5IjVmiqN7uxjQafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443077; c=relaxed/simple;
	bh=MwFsTXJugioHv41ijTZirhY8i4xRXoi7Y4vCJ56SHUY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=t5A7gQ+pHrgXqbOoDNul3f7P73x2OLUcPRaCDg+jMNCfg5OmVylJxLFzCqyV3oPf7TJRLyvIikTYAELVIKCQYnOSwFnhDsdLKM77hhg2s9fCgtmP2Vt+e3mJKduS4b07OC90w5hgXvgHXKx+RTCX+1eao2gHNle9BfD4/Meyres=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rKGG2qN/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6C3C4CEE7;
	Tue, 14 Oct 2025 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760443076;
	bh=MwFsTXJugioHv41ijTZirhY8i4xRXoi7Y4vCJ56SHUY=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=rKGG2qN/DFIWc+QTzf8G73nx++OTjbQi7n/3Qb45wM2YdJxAiGXnjkeUWgOH7Bdse
	 f9UynPWYm/RHkQbJdyl6I09Si1ScilHmRZ5KV+geOmmM34yL1QQHsYj8qiAvMVVzS2
	 w9D1YTIjOX6xW4LIA7w72cnh9IMPp3OaYkpXvFbTGicWcFpuyYzOiUk4wjaMwJwt6/
	 7WKUGdwq6YE1qjiPOxzw6uHsuJFd7bnbg68vG1eoRdnAGwgk2kowUyy/9Dt2p+oiqa
	 TC2XZHmvz9vyeukT4VaNcE1AKVyW+UNe1NPuVyvp86hiFyKwhLV9A7Jj9mgo5h/gWI
	 qpRCvNpvsdWAg==
Message-ID: <1efc306d-a786-4863-82c5-517f1d4f7899@kernel.org>
Date: Tue, 14 Oct 2025 13:57:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v4 0/2] media: pci: Fix invalid access to file *
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
 <0627cfba-798a-482b-b335-cc78a609c150@kernel.org>
 <3cqjf6pts5fzs5gziog3g3jay6txcvxshm554uqpzgb6ymnukh@dsbo27d47rol>
Content-Language: en-US, nl
In-Reply-To: <3cqjf6pts5fzs5gziog3g3jay6txcvxshm554uqpzgb6ymnukh@dsbo27d47rol>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/10/2025 13:52, Jacopo Mondi wrote:
> Hi Hans
> 
> On Tue, Oct 14, 2025 at 09:05:20AM +0200, Hans Verkuil wrote:
>> Hi Jacopo,
>>
>> On 19/08/2025 09:07, Jacopo Mondi wrote:
>>> Since commits
>>> 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
>>> 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
>>>
>>> All the ioctl handlers access their private data structures
>>> from file *
>>>
>>> The ivtv and cx18 drivers call the ioctl handlers from their
>>> DVB layer without a valid file *, causing invalid memory access.
>>>
>>> The issue has been reported by smatch in
>>> "[bug report] media: cx18: Access v4l2_fh from file"
>>>
>>> Fix this by providing wrappers for the ioctl handlers to be
>>> used by the DVB layer that do not require a valid file *.
>>
>> This series should go to the fixes branch for v6.18, right?
>> This looks like a pure regression, so I think that makes sense.
>>
> 
> I think so, yes
> 
>> BTW, why is there a Link: tag in the cx18 patch? It just links to
>> the v1 of the patch and that doesn't add meaningful information.
>> Linus likes Link:, but only if it really adds useful information.
> 
> Good question. I presume it's probably a copy&paste error, as it has no
> place in the patch.
> 
> Would you like me to resend or will you remove it ?

I would prefer a resend for these two patches, clearly marked as [PATCH for v6.18 v5 n/2]
in the subject.

Normally I'd just drop the Link: tag, but it's good to have this clearly marked
as a fix for v6.18.

I'll also see if I can do a quick test of these two patches with my ivtv and cx18
boards. Just to make sure there are no other corner cases lurking in these drivers.

Regards,

	Hans

> 
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>> Changes in v4:
>>> - Slightly adjust commit messages
>>> - Link to v3: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com
>>>
>>> Changes in v3:
>>> - Change helpers to accept the type they're going to operate on instead
>>>   of using the open_id wrapper type as suggested by Laurent
>>> - Link to v2: https://lore.kernel.org/r/20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com
>>>
>>> Changes in v2:
>>> - Add Cc: stable@vger.kernel.org per-patch
>>>
>>> ---
>>> Jacopo Mondi (2):
>>>       media: cx18: Fix invalid access to file *
>>>       media: ivtv: Fix invalid access to file *
>>>
>>>  drivers/media/pci/cx18/cx18-driver.c |  9 +++------
>>>  drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
>>>  drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
>>>  drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
>>>  drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
>>>  drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
>>>  6 files changed, 52 insertions(+), 34 deletions(-)
>>> ---
>>> base-commit: a75b8d198c55e9eb5feb6f6e155496305caba2dc
>>> change-id: 20250818-cx18-v4l2-fh-7eaa6199fdde
>>>
>>> Best regards,
>>


