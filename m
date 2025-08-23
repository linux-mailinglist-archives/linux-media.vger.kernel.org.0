Return-Path: <linux-media+bounces-40834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA0EB32C0E
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 23:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F1A85A3B08
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 21:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755062EA47E;
	Sat, 23 Aug 2025 21:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/2L1u93"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEF81B041A
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 21:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755983534; cv=none; b=BP4JGT5HJ3J8r8o8WKJQXjCEUYiXcM70IQqt9rgZVZXzCQrS+z1wujJ3kI2uVZlyDJ6JIMkOW7v0NA2K0GRPaL6Hh1mtgcfz0Tjpt53/+KMJvM3TMieB6mIGGou4MHZNoM5UWfd6EexF0MQiF9xrYNwVKMWrBmJcU7PtAgZQJc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755983534; c=relaxed/simple;
	bh=Gqw5uwmtSd815MyRJR8ZCZ2nqUYq4jnii/8Qgr4CHmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jdDsT6wzn5X9wWSmNhTHSRJ+lKOFELMpkGr5umjjk8OnXcQQZoogxnD63ZoByhCT7GaA8Io9tLCxD4ahVDAcXJ62HdNkfW3kRzpfZ3hmInVUbV9dEf+I62yXPCEjzTE89lcbBd3Z0Hi4T/K04acllHIloVk6gRFmY605LAsaLmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/2L1u93; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce5095c90so269381e87.0
        for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 14:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755983531; x=1756588331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHdzu5eJx5n5PHvCw/M0ug77gC6yk+iDuxwlLVrNep8=;
        b=a/2L1u93OyCUafOjlJcgfEfrqhyOS7Rj0sUt1TB9YEM6uATmJALJc8rLSozfKWnUgg
         wDrEz/j4q3Kt2a7UHTVrKY5M8eE1IGHMQfoEe92uuJFPZMBls6Nw4ch689HggJ4x1qkV
         Vwa3WhdGHeUa1bGU1EG/Ur2nvN//c+INGBmCabzl7yEiX5MsGl6BwtcDqyFDfq2FtazJ
         zrpE31LaDEIaPFXCnzh3rVumINUoPl8sfbWfFtu4imK+fVjqlkU6A1lsDVlyAGK5xdlt
         7K1rrGs9hlM3S+AeigaCeOqF4x2fOwVgYt1W+SDADZzEMRWIo9Yn1iIpKeKnPTKQkMCh
         /n5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755983531; x=1756588331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aHdzu5eJx5n5PHvCw/M0ug77gC6yk+iDuxwlLVrNep8=;
        b=dmK5AR5tFVuvmhcQxJUsi4V2GIJnvm1ZxfndbrvtIKsc5VrAislzL6YbAXfJCLLjTQ
         bhG7v8HDEn0CoyqzEaRIKbYACIEA/s//vZBR5d4Es9Eb3mnSjXnQLniQlOSTRNnOO2gI
         pqgx0AjhpbvKqyyqZs/7Ylp6UGO2hmi1ZAHXQfarW6LVN0lqhymllA+mFeGAw1RbMbIJ
         TlSr1SCqHYegtNq05sWXodBATA2QpC3bL3u8jjr6fYkeVPn0Dx8lz05ER4eQXeh3vQSt
         rkt47W6npzbifqD3aSEoNW6QeS9qnzkHpshjwYGH33XK7C/nadUCnaZGLnBMLSLTOcJh
         V/mA==
X-Forwarded-Encrypted: i=1; AJvYcCWsBVBKarZdeVD3M6Wxl2q2dFSV8RDJxN05mPtKvLfgp1N1k3EVJRlTAsDUkwwICPf4v99n6RwnTPP0sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7xbD1CD28bavr71NvG4L8/bIdzhORXXo17mSGLLv/8xvIzUHw
	+nRoV9HnZU0bbE3k8IFXExLD5LbSDzVFekl8DbJL70kjldMxNxNhtXwJfstIuZYCc7c=
X-Gm-Gg: ASbGncsQkhK6kMONmSfqIUVk4LnUEiWXHcaFTLantk6ZOPL7mscT6M61/55Opu2eGNO
	K3cBDOVtwsT7pX4WuacFo95avhkP9cEfc1hvYKa50gQhbJAP6eiA3OQeYPza+Tr7JchrWecUdKk
	baRZ5nmWUlw5p08LxtfAb+CCHud1trRx735rBAw6SDZ0+nbRFTqkcfe5/ZmbP5IMWGdH/OawjX7
	s1pLiXYnRlhYhx1IgI2TECKoD3faBQMtsA2/aLeSUUkvu4zZ7Kw8GGKYFC3U92JF/5bbjZgI4gP
	7KD89fpyaLB7FIWLdAwksz78AJorouTiwHJxazT69Y/n3R120fmebEDewXK9oIGKOXJaIGXJ8B3
	C6MHNr9nl2OIjetIksZ5h1RU55WuYqV6xFJ/HRWWyYGGH0xcsk4U3AZm5M6TgKiltvBnwE1+sud
	TzYMUVzZBmmAg=
X-Google-Smtp-Source: AGHT+IE8Umwha5zHS6ZtlE1nyOZymAZZ6q5pMY0YtJVOp17+yphtKmx5REFkd34qjktCv5U3RFTtcg==
X-Received: by 2002:a05:6512:2204:b0:55c:c971:224b with SMTP id 2adb3069b0e04-55f0cd02074mr1206159e87.2.1755983531123;
        Sat, 23 Aug 2025 14:12:11 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c9a0efsm683456e87.111.2025.08.23.14.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Aug 2025 14:12:09 -0700 (PDT)
Message-ID: <177a2b07-acc9-49a7-92a8-1169176240f8@linaro.org>
Date: Sun, 24 Aug 2025 00:12:07 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: og01a1b: Change I2C interface controls to
 V4L2 CCI
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
 Hans Verkuil <hverkuil@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Dongcheng Yan <dongcheng.yan@intel.com>,
 Jingjing Xiong <jingjing.xiong@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250822203632.159005-1-vladimir.zapolskiy@linaro.org>
 <PN3P287MB182948539FAD0BCE7E105B838B3CA@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <d6b281a5-3872-450e-b37e-10fe7ff63bcc@linaro.org>
 <aKop2YEyFJztjWFb@kekkonen.localdomain>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aKop2YEyFJztjWFb@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sakari.

On 8/23/25 23:51, Sakari Ailus wrote:
> Hi Vladimir, Tarang,
> 
> On Sat, Aug 23, 2025 at 04:33:26PM +0300, Vladimir Zapolskiy wrote:
>>>> +       { CCI_REG8(0x3667), 0x80 },
>>>> +       { CCI_REG8(0x4d00), 0x4a },
>>>> +       { CCI_REG8(0x4d01), 0x18 },
>>>> +       { CCI_REG8(0x4d02), 0xbb },
>>>> +       { CCI_REG8(0x4d03), 0xde },
>>>> +       { CCI_REG8(0x4d04), 0x93 },
>>>> +       { CCI_REG8(0x4d05), 0xff },
>>>> +       { CCI_REG8(0x4d09), 0x0a },
>>>> +       { CCI_REG8(0x37aa), 0x16 },
>>>
>>> Many registers are being written multiple times. I don't think this is
>>> helpful, so we can remove
>>>
>>> Some repeated registers I found:
>>>
>>> 0x37aa: 0x07 > 0x10 > 0x16 (written 3 times)
>>> 0x38a8: 0x70 > 0xF0 (written 2 times)
>>> 0x38c4: 0x0c > 0x09 (written 2 times)
>>>
>>> ... there are likely many more.
>>>
>>> You can simply keep the last value and remove the other entries.
>>
>> I'll check it, thank you. As I've said above it's quite out of the
>> scope for the change, but apparently it should precede the CCI change.
> 
> I guess any order is fine, just keep CCI conversion separate from the rest,
> please.
> 

This change is a clean CCI conversion plus removal of unused macro,
but I'll incorporate changes asked by Tarang and send v2 as a series.

-- 
Best wishes,
Vladimir

