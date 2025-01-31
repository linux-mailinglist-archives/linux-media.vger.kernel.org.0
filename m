Return-Path: <linux-media+bounces-25492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 481BCA240FB
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5E5B3AAF99
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA6031F3FEC;
	Fri, 31 Jan 2025 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iuHUCFFi"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775091F0E4B
	for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 16:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341542; cv=none; b=dQZqvUkEt5j6pA0mJkvHCPn8B5uWuG7fSGXlZ5cCd3DH+J97Zm6Nx3F+6xzeOhROKP+/G2ipllW85B8Poh6FljEhdUlvmLeYVXEIC+Qgo5xHgtqD3AdVO3yvI1JHJMIIeGzfzIDYOJZ3Ro0MSZCDACIgxmtJHHjxHcAywc2yjJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341542; c=relaxed/simple;
	bh=DszMk21nY59cZOfvdiYLLrBFh/AuWiNHwaP7mdJXbiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V9VWThYWMXi3xqc5sGntpuO+ZLBTnTiLnqh7qIpP35q+AD9mUHXSJbTRh9RXJZA98xfpd0syL5G4yKJVZr18yeoyNGnfvrqIsWzZlPnKuprBQL9q3CIuyHcXBcjfgfN7pAvVaXMq9c2EuN2KjbNKwnh00r1dbozLlpWyPENHX6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iuHUCFFi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738341539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gfm3rRgU3w6QH3ws6c7RGulHhgxBSembbBkeuZe4etQ=;
	b=iuHUCFFis2fXFBooyhIHtm3OjNXx71Sl/V+6VK+jU92C9cGMUU4XOG1OZSUdKYEfF66TlG
	Q23PDIuqeIRyDcC3AibNfBkB+KhRW6SX4kZ3kxq7UxbbtZJrZhASJEMRq36wagcEbbYjM3
	WCYHnFpnEayuCjgzsWl0lPY0ClAf4jw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-eg2Rh9v9M8yZ-YFoMBt8PQ-1; Fri, 31 Jan 2025 11:38:58 -0500
X-MC-Unique: eg2Rh9v9M8yZ-YFoMBt8PQ-1
X-Mimecast-MFC-AGG-ID: eg2Rh9v9M8yZ-YFoMBt8PQ
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4362b9c15d8so10708955e9.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jan 2025 08:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738341537; x=1738946337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfm3rRgU3w6QH3ws6c7RGulHhgxBSembbBkeuZe4etQ=;
        b=dD1do0idtlgKCiNepNb+ZTV8vkwSoqfDIhZnbYO5iw0Dx+pA4+vl1gASgk9nhZmADo
         +j3jbOwhpmseQUfsnwilka4tQSco6DzOmJZ8U6e4B0JuwFiDOUZ6/TsyQogkMUzcIDd9
         5iTWbPL8O9LTiVdQbu8QiqAjhNpfCrskeDgcNyTLvO67B9YTsr47Cj7QWrSefBTvEuho
         KvLn59iTl8KBGAjgg3rteoicbIj4LdQCktzluH+xLi4W2Ma+9D78nPsJLdNBVsKLyR54
         YIflpM7MVEd3UPhlVjR2t2q8MtJRgQWKfbTnxVjq0faEo+QIBgiLW8tz8LyiSHaXPBui
         j9WA==
X-Forwarded-Encrypted: i=1; AJvYcCUg+HS9iYEPDvMkxXHsgH5TtfNqi3l1V3f0JaNED+jaFngHSsutBwrUwdemMccCTfTaG+bePfEh+3Iqpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5gx2QScE8J0T2HsysgQVbjCpWMFP9aaPKvPuc2UvJxGy726Q
	Pf8qRA4jBKrDn3NLw82G8r+nZBjpvPZDN4Aridapyhy7SPT9QCHBB++1ZM3vrTLzeC5F7NZFgNK
	LPCssP3jyUOFW7EZOp/O+HPXEkfhkWexgOmoPXM8IJcqLvF5FizhPqhdG3mL0
X-Gm-Gg: ASbGncvNwVDPLEJKj88XaL73SH6xMugdu2y9gSCb2qGETaAftaaavLq/7bLjdJ75wxs
	zU5WsEoxCxTrdev33/qvkT1TmYiBBgjJ4Rb0nMPJnaTFk7Eqj2gJ3SHuEDavKajZk3Iyc8Hs/dt
	HJz+J4HD/xAV9bQ1DloPfta7abVe9HNsLe6blSvT9I7uuQeJ/hURks1n3fS562x6zGqzdSPbuFz
	qsWZ3CqyUzJ53ZqNrufeXSx8Wo3jxb4JrwmFey2sH7QVt8hmYObe44Ft+gEef6X1UyXdulSszsa
	m5/XXA==
X-Received: by 2002:a05:600c:5250:b0:438:ad4d:cf01 with SMTP id 5b1f17b1804b1-438dc3c2393mr115522795e9.7.1738341536959;
        Fri, 31 Jan 2025 08:38:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGQqOtKc1M0E3u7iETr9VzzKvbkOEp7zUYzbBVXmHtMN12xLQlBTH0W8YUXdK6VBGD34wORQ==
X-Received: by 2002:a05:600c:5250:b0:438:ad4d:cf01 with SMTP id 5b1f17b1804b1-438dc3c2393mr115522595e9.7.1738341536566;
        Fri, 31 Jan 2025 08:38:56 -0800 (PST)
Received: from [10.1.19.242] ([82.146.96.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1028d0sm4986073f8f.25.2025.01.31.08.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:38:55 -0800 (PST)
Message-ID: <50a8cdc0-39eb-4dd1-8f96-b333ec323b92@redhat.com>
Date: Fri, 31 Jan 2025 17:38:54 +0100
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 hverkuil-cisco@xs4all.nl,
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250131150618.6987c1c7@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 31-Jan-25 15:06, Mauro Carvalho Chehab wrote:
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

Yes I have just replied to the revert patch with my reviewed-by. Mauro
if you can pick this up and send it to Linus soon(ish) that would be
great.

Can you also please add a Cc: stable@vger.kernel.org tag while
merging it?  This will need to be backported to kernels which have
the troublesome commit.

Regards,

Hans


> 
> 
> Thanks,
> Mauro
> 


