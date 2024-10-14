Return-Path: <linux-media+bounces-19605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4399C9B4
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 14:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB25D28372F
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 12:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E27519F418;
	Mon, 14 Oct 2024 12:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NiMaVeC1"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C019E7F7
	for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907769; cv=none; b=rIgMtC6zEvb4QvtHzyb/THg+f26Lv9obU1sU30NNCtTILUn9DPMdAEakt8Z5lPGaZbEufO5ofpUqGZKYPfyoBw16dQggXzQeQ5dKuOR9SX/ALcgmlscggnPZmbe5mnKBhg41TnlCupofV/jwVHokkysHkrXoRI6NP1AHuEpEC0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907769; c=relaxed/simple;
	bh=fp4hGq2LYG+L8l80tB2UjDKZFH9O9DONZeVIQwUvfmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIsA56QnPzESJ0W42BEv70pcTK4EhE7T6o7/jYfgNawMRHKK30GP4Ik8iLZvxdpACFGt9TvWEdzOkjO9MhPW4vrujYAUwFhn0Bgy/IfUakCTZkBjegoM6NbaRPvkSHlWFIAMIerMn0jm0BVl403/3J05cX4+n0UYdHGjOuZi4qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NiMaVeC1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728907765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VinTYtg0RlHQGGVcHD0ggvc43bI3iTFnU6upGuAELTc=;
	b=NiMaVeC17XdFWR6KUI3lCf2CI45bBZ0fhF6fM+kEgEwRSyanhbDuQqeZ2ABLg5fsk973O+
	aI+/ATZmsW0zDv/t5UOgFPEtO+km0AmBfXbeEI1hLHyVcpqQAvLL5lWPwiaW0wsCwqKm4p
	pC3Rto7KOudcZeWmkUL9Wg1A1RLFT6I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-DnL32fUnOqu77ju4IH1X_w-1; Mon, 14 Oct 2024 08:09:21 -0400
X-MC-Unique: DnL32fUnOqu77ju4IH1X_w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7d2d414949so281953466b.0
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2024 05:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907760; x=1729512560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VinTYtg0RlHQGGVcHD0ggvc43bI3iTFnU6upGuAELTc=;
        b=QbukTDvKWqQYfqmkux9gL8u8mEpgQ7bO3OsvEUEf3CraT6xxq4rdybIt/AJLyIelPK
         jNOnVOSSoy0OKx3i8OWvWok5/UsLKW7szwQTDk0qLXpcU4UEcduUqGz7MOfFEwAmeeUK
         LKJjxkjg5eSDs7xJid2I6PrsZp47Vi17vRrSP/gMd9VbyvZPidkwDPWboWcrZQITkxHc
         lVGSbRu68bXCg6dtjlwvT7EzCrKzKw8LHxRkZajaSAWoVqopfmODtonrxSa+/gt5ddpc
         fSjXWLlpvOYwSMJb6ILQeUDcta3q8rIs6wwj+nUkgK/WChq3VYkIWzrEtFD/73YM3LQW
         RHvg==
X-Forwarded-Encrypted: i=1; AJvYcCWm9xzKbMzB6CFVEXEzAVcMX/QU4h2jXpp0MT87rvALNlnyQWfyoqwTyaAbEA/dWYNRbW8S+KeOmDiDDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtnGrE+qE+I1uWBEXGvgPeRef2Hha1fS912ezIFG+1vRgq0k7J
	9pVKQmHsKengPITmoU8thCWZjyqRHKh6ys0XmqriqJKWMVMBEurTuu7UtZAHIjEp4HjoD0Tiat/
	EUVKkLSkLH8+RNYV1dUTIIbNAfL4H4tF5s2eYObmNNw9ZOxe0fIidps1d6R+o
X-Received: by 2002:a17:907:1ca8:b0:a99:529d:81ae with SMTP id a640c23a62f3a-a99b95b05a8mr1089769566b.55.1728907760457;
        Mon, 14 Oct 2024 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJPTMVAa38gd41Fd3ChmIHKvceQ2cvda+nBz+b2BjY/bcO1kVMNT23OXkeYVdQpoT0X4a8Xw==
X-Received: by 2002:a17:907:1ca8:b0:a99:529d:81ae with SMTP id a640c23a62f3a-a99b95b05a8mr1089765766b.55.1728907759975;
        Mon, 14 Oct 2024 05:09:19 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a0e83f83fsm149691366b.125.2024.10.14.05.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 05:09:19 -0700 (PDT)
Message-ID: <f57c0928-9d00-4a00-825e-e0a3c35b4b7b@redhat.com>
Date: Mon, 14 Oct 2024 14:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: atomisp: mt9m114: Make it work on Asus T100TA
To: Andy Shevchenko <andy@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Robert Mast <rn.mast@zonnet.nl>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241013154056.12532-1-hdegoede@redhat.com>
 <Zw0BaCFy5j5bHeUA@smile.fi.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zw0BaCFy5j5bHeUA@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14-Oct-24 1:32 PM, Andy Shevchenko wrote:
> On Sun, Oct 13, 2024 at 05:40:52PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Since there is some interest in getting the mt9m114 camera to work on
>> the Asus T100TA:
>>
>> https://github.com/jfwells/linux-asus-t100ta/issues/4
>> https://lore.kernel.org/platform-driver-x86/e0c8c98f-64ec-4297-bbc8-de489414515c@zonnet.nl/
>>
>> I have spend some time this weekend poking at this resulting in this
>> series which makes things work somewhat.
>>
>> Note that for now this will only work if you modify the BIOS settings
>> to change the ISP to be listed as a PCI device in lspci:
>>
>> 00:03.0 Multimedia controller: Intel Corporation Atom Processor Z36xxx/Z37xxx Series Camera ISP (rev 09)
>>
>> If you do not have this in lspci then things will not work. The BIOS
>> does not allow changing this setting from its menu, so we need to
>> use the grub setup_var_3 command form a patched grub.
>>
>> Note this requires your Asus T100TA to be at the latest v314 BIOS version,
>> this has not been tested with other versions!
>>
>> Download grubia32.efi from here:
>>
>> https://fedorapeople.org/~jwrdegoede/grub-efi-setup_var/grubia32.efi
>>
>> Boot this once and then run:
>>
>> setup_var_3 6f
>>
>> If the ISP is not visible in lspci this should show 01 as value
>> for the 0x6f offset.
>>
>> Now change this to 2:
>>
>> setup_var_3 6f 02
>>
>> and then reboot. After this the ISP should be visible in lspci.
>>
>> For more details on how this works see:
>> https://hansdegoede.dreamwidth.org/25589.html
>>
>> Note this series is just a quick hack, the proper fix would be to get
>> the new drivers/media/i2c/mt9m114 standard v4l2 driver to work and
>> atomisp does support standard v4l2 drivers for a while now.
>>
>> I plan to take a shot at this as time permits, hopefully sometime
>> within a month but no promises.
> 
> LGTM, some nit-picks in the individual replies.
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Thank you.

> P.S. Can you consider my patch to apply (that removes GPL text
>      in the top comments)?

Yes I'll pick this up together with other atomisp patches
the next time I do a round of atomisp patch merging.

Regards,

Hans




