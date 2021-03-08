Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0EA133150D
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 18:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhCHRmQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 12:42:16 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:37397 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhCHRmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 12:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1615225327; x=1646761327;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=ohLGmNuUkGlwwRVSqsoQifV5unVmEWWGUhedStY0U9g=;
  b=2FHVR/lXr/WuB5D0Vu86b423BYLUZdgBWzrCW+M1yVcoEu5ZcPE61CDZ
   cAJqNSmwV3y5+DuPA4sFq/PzKjteSJml4aB5Pz1hRdCIgYCjdDg0EoDKY
   GUJkUpVTnT8jQS53l/l0u8L1nkw7VjLtA8ITkTDHzOlU6MeCK8EU6uSy/
   N3yRfY3noW0fOtFHNjWR4xOtd7Dfkanv/QEGR0r6WYa1VBXFWYpcQMJVJ
   oyMnHA0As6Zn7ULFLHeNtf5wTPzadwcrz0sPCEZmmyrOdCbKwJguJ3rvq
   kNV5y8FwXiEI62j7YWaHAtY99pN2GTPF6NFrWPo/BoCuAh9bKZkycjgua
   A==;
IronPort-SDR: SYTwmdk/DE0R/nc9YjT9Nfa9jIa+X2iOrKlD6jjynqafwQttl9lygdhhV2gU2HjwWT3M2fpvcw
 OPwxdJAz9wzM1DTWBy7GkuDypHiZH8DsrFHTlU7I3C7fdxo3quwaJkhZHG8Cn5x1A2Ikh2HYAO
 PJ/BoGswezlUoq5N40oq0mhnQeNkXPTrU5ObK+MYEVwFM6zzQ7O84lSbtVNx9yyCvo5y9jkHW6
 mDrZauMu1eJIwbLzloKiMyYav7SBUMunbopfcLiuUbX2vK2KeZXaVN5PNhJ9dMkYDx9O3ppXWQ
 Rno=
X-IronPort-AV: E=Sophos;i="5.81,232,1610434800"; 
   d="scan'208";a="109172385"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Mar 2021 10:42:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 8 Mar 2021 10:42:05 -0700
Received: from [10.171.246.58] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 8 Mar 2021 10:42:03 -0700
Subject: Re: [PATCH 7/7] ARM: dts: at91: sama5d4: add vdec0 component
To:     Emil Velikov <emil.l.velikov@gmail.com>
CC:     Ezequiel Garcia <ezequiel@collabora.com>, <kernel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-media@vger.kernel.org>,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
 <20210305183924.1754026-8-emil.l.velikov@gmail.com>
 <915739c6fc01f17b00c4fac8b7fede1f25396286.camel@collabora.com>
 <CACvgo51peuKsuqx-NwZSWU4Ys1q5MuXb=BRx7GLo3tkWH+vb0w@mail.gmail.com>
 <2e921a53-def3-ed3a-6240-b81ea3ddf946@microchip.com>
 <CACvgo52dNRyiLDGDf8wQMKoxsCUyn3Ro=hHL7GAMtVXRdC_19A@mail.gmail.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <5d6ce808-7353-be95-7d68-a56d01833dbe@microchip.com>
Date:   Mon, 8 Mar 2021 18:42:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACvgo52dNRyiLDGDf8wQMKoxsCUyn3Ro=hHL7GAMtVXRdC_19A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/03/2021 at 16:57, Emil Velikov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, 8 Mar 2021 at 13:21, Nicolas Ferre <nicolas.ferre@microchip.com> wrote:
>>
>> Hi Emil,
>>
> Greetings Nicolas,
> 
>> So nice to see this support! Thank you so much for handling that.
>>
>> Little comments below...
>>
> 
>> Nitpicking: I would use "microchip,sama5d4-vdec". We tend to use the
>> microchip name for new DT bidings and compatibility strings.
>>
> Should i use Microchip (instead of Atmel) only for the DT bindings or
> throughout the series?

Yes, everywhere you can (Kconfig, explanation text, ...). Only keep 
Atmel/atmel where you cannot do differently or if it would require to 
modify code or move file just for this purpose.

Regards,
   Nicolas

>> I'm fine with having a "staging" component. Maybe add the hantro vdec as
>> a module instead.
>>
> Ack, will do for v2.
> 
> Thanks
> Emil
> 


-- 
Nicolas Ferre
