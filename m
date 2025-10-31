Return-Path: <linux-media+bounces-46079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AC3C25932
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 15:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21C9B3B1053
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 14:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA82A346791;
	Fri, 31 Oct 2025 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kl7HWuRT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC3242D8A
	for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761920760; cv=none; b=cF0qCVGkr4L5ylfyBiC0U4doArLrJFmwUoI50qlYm+Dlf5rxQHeIQ4EOld6klqCv4yIJpmzxfg1Xi9FWG3OFW69lEMpfoIC9JFqhZ/gW92jGUF2lEGjaDkjS3YlPDQOxtC8knzS0ajHK4EifVU1GWX0Qp7VorzJ+QtnfU9MmBNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761920760; c=relaxed/simple;
	bh=0P+F2pj6rMxopEe02IOSt8nQNmwvfwkoObhEJB3pYbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLXcSkl65ZJciUckaAlB5j/upuSmHQxlh+tCNZVCXrFR4nxM7u3dieLE4297FCGMK/JxP3Mb7h7MDbrBX/ld53uSICPfKeGHfb3DOPf1qrGU8A6iayUkrmPh/4NxCUz4vPrlaRBkzWBBEOtgg8QlR9i5mhMWGPdh65xgVGMFcgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kl7HWuRT; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d855ca585so504761666b.0
        for <linux-media@vger.kernel.org>; Fri, 31 Oct 2025 07:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761920756; x=1762525556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5h/FmLWynjYcK6lhVjktkjjOqFftPqndk2RXWUnWT+k=;
        b=kl7HWuRTCetGv8nlqIHeFNBEhlDNk3wZPuqCds+BypXR4pQmRmZPK3KZ+tAUQnK3kE
         wvWfWRnOcFqwamlSW55xViJtnciNxEpdsxm1M6jG0OuoLEN2Zwx/O6lDGtwj6MHsMZlx
         86H30BK770B9FczDlW3gebtJ649Ae8I1v+9L4XUaGzdk5RVw/AGh/2+lSlhDKORKsepk
         wQQ/Y5n52tU0PxMkO0z4AWeLOhTmH5Q/5bdkBGi/VcIH8sfMYQAbHwidQV0h9K7k2YyR
         BzyelbCoe4ooFKNbcnelIIDZ7fS+9Li388perEad4Ubpg5MsjJysF02Lr3KxUP8usS5V
         hVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761920756; x=1762525556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5h/FmLWynjYcK6lhVjktkjjOqFftPqndk2RXWUnWT+k=;
        b=qZ3IROttgRt0RS3b2ElAdARUyz6T0ATk49fQI1lMvybz9aUdt5RMa7PyY3CJVmvBtm
         7pLJmw1uCzLnsFXy1wNNwZ4Uhx1E6IRtieWVStlLWcUmtEzacbq8FyumoslSzpOJfLq7
         CVonSkZoosdQagYrptR1i3OqUVLe8JQDWjHR0O6KowswJYX87rpVr0C0Q0AuF06/OUat
         YoBmnXPZZSQcEVhWamsjK09bdFrr/fKDfo26dI1OU3rKdp4JwBaKIRbt461DIWQPqs52
         kcOcvARxUvjFait5XNpw1vV5Le8TOhXfupUpDjj5udtm57rRAvQ1Sbh5S5uc1QZqNXvu
         J5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWOT0QX0nw7mRrFNz21rDRc6wqf1g/Jw1Z3KZ3eiHL5E2eOPiektb03tyN8lLyiKox3e7TINYKnsA5Adg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+KIt6qh4Trl8TfofwrNa2QJCUX1qmxL786Cm92k85E6pxqmNn
	Lh3PRqQwpcDvPWVBvLWyTQlFuX7y0lq2fvVLVk9N4Xj446E+t2Urr6DJ
X-Gm-Gg: ASbGncuDLmoK8ILUeOxxRp8GngNBTNbRuizJ+d3lak9cH3ZBw2GuetbmkcdSdjxY6sS
	fw8MQ8VFLdbptmy7jve7shTXQZ2AV+mZjzphaB7bpd3KvKtvJNndt5c48v5wnfFFrOcY5pyjkjX
	0d6uH0BDxA0Q3ZVerBgjvOKgtpzigtmvDScQaiVoS5vgxVgNH2Ou6lbZOsaFJ511d20Dpa0RaBa
	2gARqtdiKLKdViI17r21ZCq3ZO7Cz6HysAzDmEzgQpsQqqJrhoIie+goWls4wtuBBh/ZsRTxIPl
	hVyX1Dg+A8DEcB6r5jkgnFiMhamgSUfvyINouOKZ/+u+WoeJfERVqvmR9FMQnyJxdGgZXRRPKbS
	w0u4aqef6pyXInLhisJyzAozEh7izZ98eSlYwlANacpaGh4+4isPyw9Gr493K0FhwCPWew6NFyP
	z5bCf1NdUT9Codn0NHFvlb9Vrm3XBhRkMiY9B1WfU2qZqZFSgj2la0cxibPFBH8Q==
X-Google-Smtp-Source: AGHT+IFBy7LzGMmlfFDncU1ot07co3mSRPrnAmgxqRU3f9qcKEQKE2+1GCYx65P+4h3D3xNEchjlDA==
X-Received: by 2002:a17:906:c210:b0:b57:8477:8754 with SMTP id a640c23a62f3a-b7070191729mr288848166b.21.1761920755828;
        Fri, 31 Oct 2025 07:25:55 -0700 (PDT)
Received: from ?IPV6:2a00:1370:8180:d0cf:85f5:d5bc:7d26:fc39? ([2a00:1370:8180:d0cf:85f5:d5bc:7d26:fc39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077ce927csm186746966b.63.2025.10.31.07.25.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 07:25:54 -0700 (PDT)
Message-ID: <05582ebc-fbe2-4b54-bdae-ab61fb0894ea@gmail.com>
Date: Fri, 31 Oct 2025 17:25:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: On https://syzkaller.appspot.com/bug?extid=a6969ef522a36d3344c9
 again
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?UTF-8?Q?Maximilian_B=C3=B6hm?= <maximilian.boehm@elbmurf.de>,
 linux-media@vger.kernel.org
References: <cea19615-2251-45a3-8458-726a92573418@yandex.ru>
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <cea19615-2251-45a3-8458-726a92573418@yandex.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Dmitry Antipov <dmantipov@yandex.ru> says:
> Hello all,
> 
> any ideas on really closing https://syzkaller.appspot.com/bug?extid=a6969ef522a36d3344c9?
> AFAICS it was claimed to be fixed in 2c98b8a3458df03abdc6945bbef67ef91d181938 but later
> reverted in fde18c3bac3f964d8333ae53b304d8fee430502b, so an original issue still may
> be reproduced (although syzbot assumes that it's fixed).
> 
> Dmitry
> 

I barely remember details about this bug. IIRC fix caused failure of 
some real HW and I had to revert it.


Looks like syzkaller is unable to reproduce this bug anymore, so I 
guess, it was (?) somehow fixed


With regards,
Pavel Skripkin

