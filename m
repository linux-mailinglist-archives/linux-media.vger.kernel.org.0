Return-Path: <linux-media+bounces-29612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A060A801FE
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 13:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 546D319E2031
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 11:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656CD266EFB;
	Tue,  8 Apr 2025 11:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpBybT3B"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A4F19AD5C;
	Tue,  8 Apr 2025 11:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112410; cv=none; b=IFHDVZSCUmVB//pmpj5mV7dmnk4oBm82Wa/7orXG27pkn3GC97qiDWlidiUSCOgYN63zJtz5joK/2ebMeQG2D2aOgSEAIiSYQdqWI+L6YQ8/m/EXOOF93J3ZZZQIYLo2RoNhbPjTnFTQfBF+aYA6HL9Vc8vgoy6OHSRreQ1dEcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112410; c=relaxed/simple;
	bh=jiJl3g2rDGZpRIK68KphkciUTwSrpVYaq4rdMAAVX3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eG5axdBaw+5VTCTFX3adp3TADSPT7E8mhxxI+Nqwkq5zuHwmAJopYkkK3iVqPeh1yM8O82OXNStxOqpxA0E59hVow7D189V+9/F047s98h8O8JyhfwTsz6cQH2s+xEC4I1jj4cr1IwxzED0ywE12+mf6mIDccOvAk8/5hEM3vJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpBybT3B; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bfed67e08so53991281fa.2;
        Tue, 08 Apr 2025 04:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744112407; x=1744717207; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=67NftCNQ0Jmfg7nFb64UJxbIY790WX71imhaz5ksjgs=;
        b=kpBybT3Bx26QRLDlMRpxMJvh1Jt0/FZAhCQTO/qPmj25TzGH5VKdIUAss/8/xXoKvq
         Y11DksTVYzBv7Jic+PtD48VOkoyZhxOFU6ORVYChcIF4xKDcGqQsOlnGhgFyK3NlvVGA
         z6coaSHzSdtVBrwcVYHF72d6yIthLASDMKJaET+8imWxJOkCpfs2wrRijuqNPjw6UQno
         X2Isvhi35fbEB7vqyJrYmBMc5oB2NS+90wejlNHytkJgnorM+GIo9cuagDWM3REsr36t
         URvXcUZTtt8C6S1VaZ9UiT4r/BY3807qWQtlNX361tLh6hAPlaCaTyaA5tYuTC6ait7x
         ud3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744112407; x=1744717207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=67NftCNQ0Jmfg7nFb64UJxbIY790WX71imhaz5ksjgs=;
        b=Pdam8tZBLa/ZCs0HgUBbgwMT33++Ndt6fSxm+RynnAOxftOwXf1eySIowXsW2krsvI
         9zHYnmqjcDru3zFTYarBrOVyfkPh6S48/3AmOS1FSIfWmxOQPhEGtdJ0awLIq6YfwB+n
         shg7sHNKl/icZ/eGKEZke5Bvu8rc9fLTBoIsoeV3IF3Rxj3EQw8qDwqyM/vN4fcYmNwC
         +m2IAtVZI/KGpTlH+X7t8XEiGyHZrEskHozZrq/VXCQ3yuDPfxwxMLmxPy9g9Urqy3T7
         dktncis5F0bspWrYyZSYLRX5vR/d4ZViUD5bob5zSvZExWOliB4mXlSG0MC6Ml2jmF0E
         a7Pw==
X-Forwarded-Encrypted: i=1; AJvYcCUmd/qqQGyx6cptwNYF+e5V/tUMx++jIpPl0YXeMWJwCHOm7dnhQJct5WPsbJqnKJTkxvcNq4XY49uJoow=@vger.kernel.org, AJvYcCWLWOB+l5swSrQ+c73sjv3xSJPTO0+ADzsCmMf1pK8h9+snc1Lc/i9T4Wp6N+VvuruJJpb74ePQmZW/t5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2vvynFFNfcfZD2bXlI/GaITSjAIlOD3rX/ZNqipR2qEblF5q
	pgeANvENHPl7I+igsPN+l5JjZbw4tEMpREaHwV86ZY9Rn/IneMdv
X-Gm-Gg: ASbGncthta4rG7gbxIvE3bzU6sSMcHCdQvLubUe/nffApMvpvhkk/x3Z/QB2JHv51aG
	u11xsPxPpME3m7LnABDOYMiLbVpGpIKGscE3+jIEyO6cdxjrrPzoVqPrtunmrzIxzBkIGdmlexb
	8JQqi31qLIZdh3QXw+WP3lt2ZzQGMossp0hAEVj02efwZ1hHa6ScYocA6LWiqb3biOFD7WyF6M5
	Xdy6pGfF1p6g6qL3oA+KTt59AsLp6pZ3/HOxd1t6BosK+LT/j+S4+lYvaB4mn3KqbUr/NHx6B/k
	z54+7cImirPTDTRoSD078lIZEXcjp0ebgGSbPSLygXqhoc6+0inM5K5yntbzAWXNry/W
X-Google-Smtp-Source: AGHT+IF8P1N9OvyCkNOnfTclmlOS+Sd39TExIvlw5YdnuNT+Zhl6qz1mwtl1t5POKPI04M0fEU9/kg==
X-Received: by 2002:a2e:bcd0:0:b0:30b:a92c:7dd9 with SMTP id 38308e7fff4ca-30f0a12b9ddmr51794411fa.17.1744112406766;
        Tue, 08 Apr 2025 04:40:06 -0700 (PDT)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce83fsm18592071fa.108.2025.04.08.04.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 04:40:06 -0700 (PDT)
Message-ID: <a02fca0e-bb67-4fe6-9ba4-24c82a4bbcc1@gmail.com>
Date: Tue, 8 Apr 2025 14:40:05 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z90qM33DvkTMGg_x@mva-rohm>
 <20250321104100.GC25483@pendragon.ideasonboard.com>
 <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>
 <20250408101252.GB31475@pendragon.ideasonboard.com>
 <3d8546b9-92bd-40da-a61a-4534ba7779db@gmail.com>
 <Z_T8N8aHR-2OzHAO@kekkonen.localdomain>
 <6f6a0ade-09fd-49eb-a8ae-ac8849b8ce92@gmail.com>
 <Z_UDmqZoPtybJr95@kekkonen.localdomain>
 <20250408111613.GC31475@pendragon.ideasonboard.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250408111613.GC31475@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 14:16, Laurent Pinchart wrote:
> On Tue, Apr 08, 2025 at 11:08:10AM +0000, Sakari Ailus wrote:
>> Moi,
>>
>> On Tue, Apr 08, 2025 at 01:42:12PM +0300, Matti Vaittinen wrote:
>>> On 08/04/2025 13:36, Sakari Ailus wrote:
>>>> Hei Laurent, Matti,
>>>>
>>>> On Tue, Apr 08, 2025 at 01:26:42PM +0300, Matti Vaittinen wrote:
>>>>> On 08/04/2025 13:12, Laurent Pinchart wrote:
>>>>>> Hi Sakari,
>>>>>>
>>>>>> On Tue, Apr 08, 2025 at 08:48:45AM +0000, Sakari Ailus wrote:
>>>>>>> On Fri, Mar 21, 2025 at 12:41:00PM +0200, Laurent Pinchart wrote:
>>>>>>>> On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
>>>>>>>>> When fwnode_for_each_available_child_node() is used on the device-tree
>>>>>>>>> backed systems, it renders to same operation as the
>>>>>>>>> fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
>>>>>>>>> does only iterate through those device-tree nodes which are available.
>>>>>>>>
>>>>>>>> This makes me wonder why the OF backend implements
>>>>>>>> fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
>>>>>>>> Is that on purpose, or is it a bug ?
>>>>>>>
>>>>>>> I discussed this with Rafael and he didn't recall why the original
>>>>>>> implementation was like that. The general direction later on has been not
>>>>>>> to present unavailable nodes over the fwnode interface.
>>>>>>>
>>>>>>> So I'd say:
>>>>>>>
>>>>>>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>>>>
>>>>>>> We should also change the documentation of the fwnode API accordingly.
>>>>>>
>>>>>> Does that also mean that the fwnode_for_each_available_child_node()
>>>>>> function will be dropped ? It's used by few drivers (5 in addition to
>>>>>> the thp7312 driver, plus 3 call sites in drivers/base/core.c), so a
>>>>>> patch series to drop it should be easy.
>>>>>>
>>>>>
>>>>> I assume the fwnode_for_each_available_child_node() still makes sense for
>>>>> ACPI backed users, no?
>>>>
>>>> Not really (see my earlier explanation in
>>>> <Z9mQPJwnKAkPHriT@kekkonen.localdomain>).
>>>
>>> I capture that the _named_ available nodes don't have value as ACPI names
>>> aren't really what is expected by the _named_ callers. What I didn't pick is
>>> that the fwnode_for_each_available_child_node() - which should iterate all
>>> available child nodes ignoring the name - wouldn't be useful.
>>
>> Fair enough. I don't think we need to support enumerating unavailable ACPI
>> device nodes in this API. I'd indeed change the behaviour so that only
>> available nodes are enumerated. I can post a patch for that.
> 
> Unless there's a specific reason against it that I wouldn't be aware of,
> I would also very much favour merging the fwnode_for_each_child_node()
> and fwnode_for_each_available_child_node() functions into a single one
> that only enumerates available nodes, with a consistent behaviour across
> all backend. Having fwnode_for_each_child_node() return unavailable ACPI
> nodes but not unavailable DT nodes would be really confusing.

Absolutely no objections.

Yours,
	-- Matti

