Return-Path: <linux-media+bounces-35037-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB214ADC4B6
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 10:27:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 800B9161E7F
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 08:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9500D28F92E;
	Tue, 17 Jun 2025 08:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="big5LgqM"
X-Original-To: linux-media@vger.kernel.org
Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8543821B184
	for <linux-media@vger.kernel.org>; Tue, 17 Jun 2025 08:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148823; cv=none; b=P9/QP4y/d/LjZDa6SSZHaGQC13o86e+Eob4uEnFDlNPKuh5a0J0ddb6EME73Oj728QvEBRFs0xZx3/G/1N1WrriKC1/wxcbuJ62Q6FeA6go6yvh6L9PTpLGY904pFR5CXeg1fBYUnMorFfuU58exFa59ipHrNKkbOzKjib60LmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148823; c=relaxed/simple;
	bh=n4wFiBD/uNh/WykhIpDOWAGjZIESv+Tw84qp0Ad4XeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9Wel8B/3YzBxk2n5GmsKLMVwXhYtzGWwbSBSbula03buE37APy6q1Doqa4AdKJnnUybHXF5RM4hJlz+aYLBUVv4xydB0zTKzJwOgft8XKHvovhQT4U8HZjkcPNtYOoCqUIhMKz+4rd8gl3OYW8lkSqmVfmv8ZoV4V8QtGSpvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=big5LgqM; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bM0Mz2WjgzwxX;
	Tue, 17 Jun 2025 08:26:55 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bM0My5vrDz5l;
	Tue, 17 Jun 2025 08:26:54 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=big5LgqM;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750148815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oYYG2qaajfdX1IiIOP5/b69StTeMYQrMNyfF9bMTzj8=;
	b=big5LgqMPK9cpizGOEJcSUArdOoc8onVSzO16cOPF69jtEJZII0vu9dK6lm5UCJEeSZ+99
	3yez0Vrwsl3sJOUTorfkYmMTiXqlFTbqcHWJtyUbtK6EPFHqthOJtI8zziYobeyXigqFEN
	qd+b2QgEr4UO6mFgN7mkvdDehxMzYJpKaRvnf3QZgNuve3uj+XSKs+zre4K5SUPo1i8v3p
	Tf2zN/5nca58T7UrQisE9KyfLh3XgFGQn3i5f3edTtsyJPNSlEFxU5/wVc/VJGjzExZuoq
	4h0KBZr+yUq/4t2kadlnhmnn/g9RpaAkeyarnOvZZYMlHbJj8mZr7QozUbYCgA==
X-CM-Envelope: MS4xfIYbbIofm5f7pFGvK4E8rU+fZymbp4H6SekmIHXStl7dtIDAVqdwlgWc7OqA3VUFoY7anFMWqHvigPbupYYz5so06r4nQhDfPEv5DUfSMwZ/PvfbBTTg zYEbYv3asVjFQPzLWKzvnJ3jnPVx+Gt+Ouc2TBQYHVerV5MpgGzp66jrkRGPwlQq+RFBEG9e/tGJEL6VajQn1hLIXhDM4RCE4dCdTPbnXvnNsYe8d7TEdbPj FC5yjbsQFHgm9xXl1v1ddhnaZ5wCmoRGvod4vGHhtFDTsAyEOw1Zel/a827E28FG8UVSdWsRJZN9sWF/uym9yeYgCh+5XsgGR2+esAfkj1EUD87n7igM4mWf SF7dHh6NNZJY66eyxiIDCtrMFWzm+7ZGZoGrjOzN+kJgdPU2FQsKGf9sIeueUHMNZgDV7JF3T5Sl1oSeRknOiN3lSG8yNz7L0ePD3Z7jggFpCnkd+cYinR4h mlLTkxtS+cmNyDCYtJf/VMi9n02da7bv9wKV0Sm92vlNTT6Mb3lg95LtQ2PNhLl+4RUJK0HsJJdjG99Ltrzhrc/Fe1f04pV+uyGV2mlsHIqW+ZYnIOUUE07Q 3sJE4GJ6r3UsvDDms9yl/K+R
X-CM-Analysis: v=2.4 cv=I7afRMgg c=1 sm=1 tr=0 ts=685126cf a=y7GQG8cVTJWmfFIGl7BB1w==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=bDN84i_9AAAA:8 a=cm27Pg_UAAAA:8 a=EB4qVX10em35FUJHe8YA:9 a=QEXdDO2ut3YA:10 a=J2PsDwZO0S0EpbpLmD-j:22
Message-ID: <804b4a1c-7171-436d-8e74-5f8a1c40f965@jjverkuil.nl>
Date: Tue, 17 Jun 2025 10:26:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] media: v4l2-dev: implement wrap-around search in
 devnode_find
To: Ricardo Ribalda <ribalda@chromium.org>,
 Haipeng Jiang <haipengjiang@foxmail.com>
Cc: bartosz.golaszewski@linaro.org, hljunggr@cisco.com, hverkuil@xs4all.nl,
 linux-media@vger.kernel.org, make24@iscas.ac.cn, mchehab@kernel.org,
 sebastian.fricke@collabora.com, viro@zeniv.linux.org.uk
References: <CANiDSCvB+qeBW7aPvBo_--J8gw3s3auhmy78VtkmMRReyg0-wQ@mail.gmail.com>
 <tencent_F17FCCD7216F8C3E86E3BF032289559E9409@qq.com>
 <CANiDSCtn7o4SvTPx76s7DA87Nyop-fGJzV4k6uUS9=EF0aLA1A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <CANiDSCtn7o4SvTPx76s7DA87Nyop-fGJzV4k6uUS9=EF0aLA1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

On 16/06/2025 08:40, Ricardo Ribalda wrote:
> On Sat, 14 Jun 2025 at 08:35, Haipeng Jiang <haipengjiang@foxmail.com> wrote:
>>
>> Moved wrap-around search logic into devnode_find() to avoid redundant
>> lookups when nr=0. Returns -ENOSPC when device node numbers are
>> exhausted.
>>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
>> Signed-off-by: Haipeng Jiang <haipengjiang@foxmail.com>
>> ---
>> Changes in v2:
>> - Implemented wrap-around search logic directly in devnode_find()
>>
>>  drivers/media/v4l2-core/v4l2-dev.c | 20 +++++++++++++++-----
>>  1 file changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
>> index c369235113d9..39e175d529a4 100644
>> --- a/drivers/media/v4l2-core/v4l2-dev.c
>> +++ b/drivers/media/v4l2-core/v4l2-dev.c
>> @@ -138,10 +138,22 @@ static inline void devnode_clear(struct video_device *vdev)
>>         clear_bit(vdev->num, devnode_bits(vdev->vfl_type));
>>  }
>>
>> -/* Try to find a free device node number in the range [from, to> */
>> +/* Try to find a free device node number in the range [from, to>, wrapping */
>>  static inline int devnode_find(struct video_device *vdev, int from, int to)
>>  {
>> -       return find_next_zero_bit(devnode_bits(vdev->vfl_type), to, from);
>> +       int ret;
>> +
>> +       ret = find_next_zero_bit(devnode_bits(vdev->vfl_type), to, from);
>> +
>> +       if (ret == to) {
>> +               if (from == 0)
>> +                       return -ENOSPC;
>> +               ret = find_next_zero_bit(devnode_bits(vdev->vfl_type), from, 0);
>> +               if (ret == from)
>> +                       return -ENOSPC;
>> +       }
>> +
>> +       return ret;
>>  }
>>
> 
> The code is correct, but I would have implemented it a bit differently
> to avoid indentation level.
> Probably nitpicking.
> 
> ret = find_next_zero()
> if (ret != to)
>   return ret;
> if (from == 0)
>    return -ENOSPC;
> ret = find_next_zero()
> if (ret == from)
>   return -ENOSPC
> return ret;
> 
> As I previously said, find_next_zero_bit is really fast, so there is
> no big harm to run it twice even if it is not needed. Up to the
> maintainer to decide if they need the patch or not :)

I don't see a compelling reason to take this patch. It is a very slight improvement
if you run out of available minor numbers, which is exceedingly rare. And you have
bigger problems if you hit that.

So I'm dropping this patch, it just makes the code longer without any real benefits.

Sorry,

	Hans

> 
> Thanks
> 
> 
> 
>>  struct video_device *video_device_alloc(void)
>> @@ -995,9 +1007,7 @@ int __video_register_device(struct video_device *vdev,
>>         /* Pick a device node number */
>>         mutex_lock(&videodev_lock);
>>         nr = devnode_find(vdev, nr == -1 ? 0 : nr, minor_cnt);
>> -       if (nr == minor_cnt)
>> -               nr = devnode_find(vdev, 0, minor_cnt);
>> -       if (nr == minor_cnt) {
>> +       if (nr == -ENOSPC) {
>>                 pr_err("could not get a free device node number\n");
>>                 mutex_unlock(&videodev_lock);
>>                 return -ENFILE;
>> --
>> 2.46.2.windows.1
>>
> 
> 


