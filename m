Return-Path: <linux-media+bounces-32034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A6AAFB1E
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 15:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FB5A3B4CF9
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 13:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E26122A7E8;
	Thu,  8 May 2025 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/ba1v7q"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148A17F477
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 13:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710326; cv=none; b=GQxQozqrDsH+KJ8+KeESX6P9+79nMx7s/M8fd5ZpqfyyI/abjMVwlUeSGCoTLT1pW4gTw/orTWM0aA1WldKvegvQAOCERk/qlW2Fxrjzo2omeEtReFKVJblF9Y9jJb9lFoKmy/s3KWQkAJtiZUciwCHresyikg+V4ShHrd9k4ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710326; c=relaxed/simple;
	bh=W7R2W+HGwaOU6KXHWl2UWLPNhw7Otc/RRAtwobGk9ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KORR07QNQ0Wy/eaYoQwK8Yt8/Qmc3humh2Kz3Vx6ZQy400i3def8TJnldYsxV2o3ibAvvr/TjiPVL2acnYUzGMA1fHl5ucyuRMQyU3Mxnpuc4NVh5S7e3S2ngHyc2d3GbHHfTF1zWfGtf0gC4yB8uVPoFjiqkcdWY6fXVKYIjbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/ba1v7q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746710324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6xOX054sXenbyfHXykTuJA03aPocYLq5zEpHsINXa4=;
	b=X/ba1v7qTIMo4KWMwD444+oVgif9WSYgRODgcuF+K3LmxTgpC0Ghk6bRqsesb+YkxWxLe6
	E4XFpZn50S5IKCiTaol7E/LUOp6wkWzUD3yEBlmKXA2LX23iyhMzB5tO+qHrzQS19DMOrf
	p8iWp5o0c8L/2MkklJWjAGlYnlDwMDo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-qJeoddoGN4i9edaIUJqAJA-1; Thu, 08 May 2025 09:18:40 -0400
X-MC-Unique: qJeoddoGN4i9edaIUJqAJA-1
X-Mimecast-MFC-AGG-ID: qJeoddoGN4i9edaIUJqAJA_1746710320
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-acb94dbd01fso113874666b.1
        for <linux-media@vger.kernel.org>; Thu, 08 May 2025 06:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710319; x=1747315119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6xOX054sXenbyfHXykTuJA03aPocYLq5zEpHsINXa4=;
        b=Pp+uqCjcHkpib/ISUroqXW7jcDGV0XFk+fF5e1a1x4VTxMQSH0GQmik4/ZCD8SDa1/
         nIpncB6EzEiK25wTRPiUK/Z8VqjOlRdua5KDSTJ/wSKcVl2hJByB+zOSwx7qBTfkEUBB
         iTUx9kpqedPDskbfluDmMN8UeYR+Vv64F4ek7zmwIJL1ajpa8lvvP70kXiYQh3tPYySx
         ibGoUKVe7HNW21zjuQi5nb/wzf/glh482eEv2yYvcd60f2D9ljW3ujP/pcJZZ9IWuiKu
         4Y3sYAGh4GV1fecw3+Yv95V/gYnUtKRP5NtMKnGv1MDtIxBOL/YUUIYo77zelUI6drxz
         oD8g==
X-Forwarded-Encrypted: i=1; AJvYcCVCztCcYuj7WkLkTAqPV/kE3vI/VXJt8u6MHkl2OEpQLEi52/vFvlwbgvhAFhiOqokFg/Ft+2TcI9AkTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+5zn2D1H+jcuHNVot3PKZWfVXlcMTxTS4GF5X67/bnn13Lfx
	bbiP4C1tnC2TkPnjAQbUkOxFacCUyUUJMV3oNrH/s9Nqjnj2zu9zAtZcsaplRHz6pGa7U/1mIme
	4BA7zquwCqWIUZ59CVGuwpkO5PxmKDZFruonGFBONbnvF5q1ntXpzcA/DhkV0
X-Gm-Gg: ASbGncvoDHCZMzzRx8iYFhKkrLtKobFitPdrYtHYkbeLrg90x1To0S4e/PMAuYfu+Js
	UmBuW9TIeluQVhO2lNjnZrS/udsjJgjc3O3WTjWD8W1FFrm8F1stAy7DaC+c+MbbUVEGu6xS/Sk
	yQt5r9BaaZk4NE92hJtdqvbjT59wr00F2QIFSwjWaFRDjKxoDIyw5i2HhRBjVY6hHW+gsQ/rrsw
	/dV7RpaXfUMhJxcavLLRvVw9863wthT3SZxT0vKoWlkraXSctpxTWx3BAMKxqI9v21E98jUUGEU
	RsB+S5S7Sjae8ZfhPuAr6SRppD2OIBclbgUkrUKWJA6aoFrMUAgXMMT15TwEycxDMRtbvJ0xWI1
	sizdRWqdCdtQbXssYs26oBd2yRCNhGZBCR4HXRM/SzCX3Y1Zb37Li3H4Q76qlNg==
X-Received: by 2002:a17:907:7fa5:b0:ac7:c7cd:ac39 with SMTP id a640c23a62f3a-ad1e8ce1984mr600776366b.24.1746710319592;
        Thu, 08 May 2025 06:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjQisuRmo1A3ga06FkdeW6dRFUyT4fgAX707T6Omh7wPCOe7z/c9yRleLjQ2hsSAoTmaM+oQ==
X-Received: by 2002:a17:907:7fa5:b0:ac7:c7cd:ac39 with SMTP id a640c23a62f3a-ad1e8ce1984mr600773566b.24.1746710319159;
        Thu, 08 May 2025 06:18:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540478sm1081647966b.169.2025.05.08.06.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:18:37 -0700 (PDT)
Message-ID: <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
Date: Thu, 8 May 2025 15:18:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 8-May-25 10:34 AM, Andy Shevchenko wrote:
> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>> driver.
>>
>> Besides avoiding code duplication the int3472 version of the code also
>> supports more features, like mapping the powerdown GPIO to a regulator on
>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
> 
> ...
> 
> Don't you need the Kconfig(s) update to have proper dependencies all
> over these cases?

Yes I do, I thought about doing this already but forgot to actually
do it, thank you for catching this.

When I've some time for it I'll prepare a v2 of just this patch
addressing this and your s/then/than/ remark.

Since you and Sakari are happy with them patches 1-5 can be picked up
and merged by Ilpo as is, so I do not plan to send a v2 of those.

> Otherwise I am fully in favour of this change and the series as a whole, thanks!
> 
> ...
> 
>> +       /*
>> +        * On atomisp the _DSM to get the GPIO type must be made on the sensor
>> +        * adev, rather then on a separate INT3472 adev.
> 
> rather than
> 
> (FWIW, it's your typical mistake, it's something like the 10th time I
> noticed it :-)

Yeah, I'll try to remember to double check for this spelling mistake
myself, but I'm afraid I'll probably never learn. We have something
somewhat similar to than vs then in Dutch and I even do it wrong there :)

Regards,

Hans



