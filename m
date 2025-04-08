Return-Path: <linux-media+bounces-29606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DC3A7FCB9
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 12:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99FFE3A63DE
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159ED267B10;
	Tue,  8 Apr 2025 10:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSgif8ro"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5742266EFA;
	Tue,  8 Apr 2025 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108938; cv=none; b=iugQwUPjBchb+t0i6PmmX4VvSAQuZajxJ2WlaR0PRnCtDgRQjCqMRxfvYBSOK3LujfJPCTfryGqfqJqU5ElXqjTDNPDr7fUc1NvbyBJJQAPGWoCqAjrxOJdjluTHDOG10zx9aKSKo+4iiavTDN5FTEko2D8bieTgDDEQVIypg5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108938; c=relaxed/simple;
	bh=KF6FPa5ukU03kNzrVnuzq3Y1dL14x0ThIwInftlnjlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHPJ7P01l0cABAKShTxV100gD2lfNpX/karbT8NrGpXOV/RrJHq3JUiHoMq/FTvwTis6mS8APE0HpHPtRjHbRrzRt9bc6FMmWl9Y69jMEhXQhsgqlrfOVJHxdjMfRnK+rxfAPl+CGWRFDd58o49nX06iVNN+eze9PPbPvP7EOVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSgif8ro; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bf1d48843so47156721fa.2;
        Tue, 08 Apr 2025 03:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744108934; x=1744713734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+CyhRhd2dM84GfelfuAF9y0FVmQr9y2b3jxxIDrknhc=;
        b=lSgif8ro4dSmJPl6F2RepaTAfTQ1rb3jC9VwlTYNO4wE9AeUxAEJVGiCA9InOOPP/M
         OOXO+rnt32yWeRK8WGmjEhG5fJF1brlfhDq6UxCQE1U7Ft3nU3go5lTwxx/yqytyXQM+
         crenm8e9wmi4d5fNmEH5qXIaeg7ow4zp5YhYiiKySkIHjZMMmSjjDOgDFB1zcI3fRrta
         9jTJH/GueDLQCc4NodIv9qKMDWJ+CUytGIM8ioFaUcmyoWC9Y0RoZteOy00Fl3nnvfTJ
         +8ZIs89LReaGjYBn6UyVTEE0p7paD3aFFZ1jDcrk1YL8BPT6DmQpdYM7IfJMOhXQWNWz
         ekYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108934; x=1744713734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+CyhRhd2dM84GfelfuAF9y0FVmQr9y2b3jxxIDrknhc=;
        b=ZA/QDQRH+CHygUPsxV9wWrq89jd98+9o4B1G/vUH9fb/2C6mGmnGbSBIAoz/p25V5j
         Gxic+0jyK9R2WLvtCnpbDhUxpAvUkNbrhguqw3clbuXE/w3Dql8UdGYBDpfl/vcgUdpc
         W4wTw3kqqyD/HFMhIBLjObZdVlvqM9QiaR1by2leKU+tZOJvPZykXL+HjkNjGs3zLHfA
         wq1YjF6suqgjdcCHDdhW3HcMdN3iCIXtkUfh1JVbVOpYzYpGsH8h4QJissAs/FJuzxfC
         9wJclxRlDCeOdReFQZMTuHRt2b8F1K31ZT1R2vlT7+nmmEZ+r2JVu/SedYH1QL5Z6rtA
         9bCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxHmfjTj9eOkykl1LOZBLZLIryKX3t/F8U+iizdxX+g4iGJwY4XnGUO5tvJgtE3AYw0FVCSx+UKXIc8gY=@vger.kernel.org, AJvYcCWzdu6Vpdf7kmv/GXIoWG5boEXIKYBVTmQEwa36lwVFk16mkfb7FT49kTnxUsdOdeTo6gyTz6akVCaAfr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSQ/DufGZuNA6Y4Y1EwCII0cWAwfIElJm7HxWMyd3O0lyZLw5
	xhdGJIv93E6KVDCWuSMx0xqXzJCYMqgr56tGMG9JF/+FI6Q46lOD
X-Gm-Gg: ASbGncslfWsh6WY0ubzz3LAh+Uxjmgak3Cfj2bJ8GeLYWTuJDMJmhirHkxNYiz7SJCA
	a79gTYRbHhf2L5OkFH5qrX3c/EXxVTvzR5bYMQhtJMxVG8f1ChhvuB65RwWRwajnbx4IZtDfvjF
	+lI4xV1TZO94LuCRUmx04v7/RQ8tFtiedu5WRj7hYAqZHyXho2A5OCS26vhFGn0Pi7qljpTC/d7
	Nzd1QHZLQmK7JxTYhhtSr66LeeE9bI7cxPySx6oHEWcluWPArpJTv/rU25yigouPRVKO7MFPphW
	Y3jSHTwXfw6xIQOo2DKzCgXqToiqWhPVqYWippk6YAQNhoAt6GWVTT0PAQ==
X-Google-Smtp-Source: AGHT+IGb39lKVdBVUtZAlz6Az0P+SuKCnWMid+raIpiA+LlOh9DSRMzwwyahUsewbQ0j+0jav3yChQ==
X-Received: by 2002:a05:651c:30d6:b0:308:f0c9:c4cf with SMTP id 38308e7fff4ca-30f0c085ee6mr60112641fa.33.1744108933411;
        Tue, 08 Apr 2025 03:42:13 -0700 (PDT)
Received: from [172.16.183.207] ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031246a1sm19099301fa.1.2025.04.08.03.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:42:12 -0700 (PDT)
Message-ID: <6f6a0ade-09fd-49eb-a8ae-ac8849b8ce92@gmail.com>
Date: Tue, 8 Apr 2025 13:42:12 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: i2c: thp7312: use fwnode_for_each_child_node()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z90qM33DvkTMGg_x@mva-rohm>
 <20250321104100.GC25483@pendragon.ideasonboard.com>
 <Z_Ti7aQK2_OlrUee@kekkonen.localdomain>
 <20250408101252.GB31475@pendragon.ideasonboard.com>
 <3d8546b9-92bd-40da-a61a-4534ba7779db@gmail.com>
 <Z_T8N8aHR-2OzHAO@kekkonen.localdomain>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <Z_T8N8aHR-2OzHAO@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 13:36, Sakari Ailus wrote:
> Hei Laurent, Matti,
> 
> On Tue, Apr 08, 2025 at 01:26:42PM +0300, Matti Vaittinen wrote:
>> On 08/04/2025 13:12, Laurent Pinchart wrote:
>>> Hi Sakari,
>>>
>>> On Tue, Apr 08, 2025 at 08:48:45AM +0000, Sakari Ailus wrote:
>>>> On Fri, Mar 21, 2025 at 12:41:00PM +0200, Laurent Pinchart wrote:
>>>>> On Fri, Mar 21, 2025 at 10:58:27AM +0200, Matti Vaittinen wrote:
>>>>>> When fwnode_for_each_available_child_node() is used on the device-tree
>>>>>> backed systems, it renders to same operation as the
>>>>>> fwnode_for_each_child_node(), because the fwnode_for_each_child_node()
>>>>>> does only iterate through those device-tree nodes which are available.
>>>>>
>>>>> This makes me wonder why the OF backend implements
>>>>> fwnode_for_each_child_node() as fwnode_for_each_available_child_node().
>>>>> Is that on purpose, or is it a bug ?
>>>>
>>>> I discussed this with Rafael and he didn't recall why the original
>>>> implementation was like that. The general direction later on has been not
>>>> to present unavailable nodes over the fwnode interface.
>>>>
>>>> So I'd say:
>>>>
>>>> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>>>
>>>> We should also change the documentation of the fwnode API accordingly.
>>>
>>> Does that also mean that the fwnode_for_each_available_child_node()
>>> function will be dropped ? It's used by few drivers (5 in addition to
>>> the thp7312 driver, plus 3 call sites in drivers/base/core.c), so a
>>> patch series to drop it should be easy.
>>>
>>
>> I assume the fwnode_for_each_available_child_node() still makes sense for
>> ACPI backed users, no?
> 
> Not really (see my earlier explanation in
> <Z9mQPJwnKAkPHriT@kekkonen.localdomain>).

I capture that the _named_ available nodes don't have value as ACPI 
names aren't really what is expected by the _named_ callers. What I 
didn't pick is that the fwnode_for_each_available_child_node() - which 
should iterate all available child nodes ignoring the name - wouldn't be 
useful.

> I think all the *available* stuff
> should be removed from include/linux/property.h, apart from
> fwnode_device_is_availble(), which should be turned to work on struct
> device to signal its availability for device nodes only.

I am not saying I have any understanding of the uses of the 
'unavailable' nodes. As such I am not arguing over what you say here :)

Yours,
	-- Matti


