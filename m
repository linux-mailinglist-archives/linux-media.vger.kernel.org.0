Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E35330F0A
	for <lists+linux-media@lfdr.de>; Mon,  8 Mar 2021 14:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbhCHNV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Mar 2021 08:21:26 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:4233 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbhCHNVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Mar 2021 08:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1615209675; x=1646745675;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=SdGj/2e8hD0ZLGVAp6OmEj/GguEWqv5OusTQHgDXn4E=;
  b=bvByUikb2C5KCB3inSCBTJuAvSm//hK/V5amGNRQqi0wiwxJItIu4v7x
   YvKMFdVon5b+TjHa8DcfN+E4ycEgesZYCzdydmYfcLucuAtSo7M81crD0
   vQEtW92cqBbk9s4qUWpxaqDNVvv/pieXARjK3kdGjnBZqRMmG+DNo7H/f
   DrqsySQxZ94nFXZxn1BvAy0ibG5ZRwSq0Zy+3mmCgf67jzeudDRvvnOS/
   d5kqIQB0PPlFyn8C8X6xeH085PSvsioCge7oll0eQueUiV1zzhD3QhqO9
   pYPoZGkJK/1O9/B7TmyA8ce8wOOWGxKBcHic826jpU5Qj0gqjn7TB/9ay
   Q==;
IronPort-SDR: miOQMZtEodTgqx6yL9XAhbXXVX0p32zHuwMqp+Zg0QOlJZIq8/NOlkUXp2XJhCcw7ZtvGRuzYU
 6SbvlV22hebFBiibiL453vYn/9FnO9B2+8kEZBY3V+9g1J9ClRUXeeYoWK5k+aKrDN9uBsM93M
 FXHZfrztaxRrein5LiMKMK1H1kXB9+Ku4CnHiEYQXgqdlI3uAmvEyyZG9SLxmBi1vfuzvOQx3L
 rj8w5ZLkgP/Ue0DBp8gwd2ecXTuIxNKhmz8l+W83SmU2tFr7/V6T2A5Ys7Pxm3mYlR9Mrw2lcO
 1Lg=
X-IronPort-AV: E=Sophos;i="5.81,232,1610434800"; 
   d="scan'208";a="109143115"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Mar 2021 06:21:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 8 Mar 2021 06:21:13 -0700
Received: from [10.171.246.58] (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 8 Mar 2021 06:21:12 -0700
Subject: Re: [PATCH 7/7] ARM: dts: at91: sama5d4: add vdec0 component
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
CC:     <kernel@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-media@vger.kernel.org>,
        linux-rockchip <linux-rockchip@lists.infradead.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
 <20210305183924.1754026-8-emil.l.velikov@gmail.com>
 <915739c6fc01f17b00c4fac8b7fede1f25396286.camel@collabora.com>
 <CACvgo51peuKsuqx-NwZSWU4Ys1q5MuXb=BRx7GLo3tkWH+vb0w@mail.gmail.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <2e921a53-def3-ed3a-6240-b81ea3ddf946@microchip.com>
Date:   Mon, 8 Mar 2021 14:21:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACvgo51peuKsuqx-NwZSWU4Ys1q5MuXb=BRx7GLo3tkWH+vb0w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Emil,

So nice to see this support! Thank you so much for handling that.

Little comments below...

On 08/03/2021 at 14:07, Emil Velikov wrote:
>   Hi Ezequiel,
> 
> Thanks for the prompt reply
> 
> On Sat, 6 Mar 2021 at 11:25, Ezequiel Garcia <ezequiel@collabora.com> wrote:
>>
>> (adding another Nicolas)
>>
>> Hi Emil,
>>
>> Thanks a lot for the patch.
>>
>> On Fri, 2021-03-05 at 18:39 +0000, Emil Velikov wrote:
>>> From: Emil Velikov <emil.velikov@collabora.com>
>>>
>>> The SoC features a Hantro G1 compatible video decoder.
>>>
>>> Cc: Ezequiel Garcia <ezequiel@collabora.com>
>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linux-rockchip@lists.infradead.org
>>> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
>>> ---
>>>   arch/arm/boot/dts/sama5d4.dtsi                |   9 ++
>>
>> Usually device-tree changes go to their own patch.
>>
>> The new compatible string "atmel,sama5d4-vdec" needs

Nitpicking: I would use "microchip,sama5d4-vdec". We tend to use the 
microchip name for new DT bidings and compatibility strings.

>> an update to the DT bindings, see Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
>> for an example.
>>
>> DT bindings change should also go to a separate
>> patch, see Documentation/devicetree/bindings/submitting-patches.rst.
>>
> Will do. Thanks
> 
>>>   arch/arm/configs/sama5_defconfig              |   3 +
>>
>> Better if config changes are a separate patch.
>>
>> But also, the driver is in staging and we haven't enabled
>> in ARM64 defconfig. Let's leave that decision to the machine
>> maintainer to decide.
>>
> Makes sense. Will keep it separate patch for completeness sake, with
> explicit note.
> ARM/Microchip (AT91) SoC maintainers will be in CC list and will defer
> the decision to them.

I'm fine with having a "staging" component. Maybe add the hantro vdec as 
a module instead.

Best regards,
-- 
Nicolas Ferre
