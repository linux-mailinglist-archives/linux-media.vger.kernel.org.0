Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED0F634CD68
	for <lists+linux-media@lfdr.de>; Mon, 29 Mar 2021 11:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhC2JyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 05:54:14 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:27945 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232272AbhC2JyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 05:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1617011642; x=1648547642;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=iqjkFOT92R42EBV1+ip/OTCYxN2E0rr9W21GWrOPJW8=;
  b=GN6EXJuBnRT5xkUI2jK5E8432C/OKFPzsBvnUro8n16vcZOzeQMshlAi
   8Wn01WJWSNAFifCFXuInZYHlzwzx9rDPLSZkscGCjqPK0bQd2H/OzLG7y
   2Tozbmz9IHY95RZyFUZikiUf2G3P3wY1fu54qJ2n/X+alwhj0V8weCGqu
   aIWHiVao8dLVP6piKrJ0T5Hl4aGKjwTCqsN9/Mfra1PJH013O36fMJchp
   vIRK+t09xKVTLXqOyFAmJapY3SPB6gZxLM5XqM4hEm997feeL5T13wKYG
   oX1yMZ1w7CcAmGdKlrFlC10Z8YRGwjOUW3bE48Dec935DB0h1CI6mp8/N
   Q==;
IronPort-SDR: EoF2F1D8H+Crm52uj2dRiGS01WnW/ncbQQVWt6qQT27wItBj0vseQ0vbtuiTw1HcZ6Pn2hGTru
 iUtw7exDg2R7F3tDpNlJriU97PK7EHrqQRw0QrmWDQq1jfxGwBeDi0E3oQaJV3/eW2oinR+ZFn
 /5LK4W8KScUGTywyXB/OIzdqA7WDtPGA/YeEkbS9YtsL1c8EZPsXrmcVITXgvPxqgIhWirHajI
 fQbFxj46KE1jpa+qZlgTdbZ+SQ2AlTlGCzNodS6iBzysEdjXoTxavzN24SZYTBJyX70DUiH+Cc
 kzU=
X-IronPort-AV: E=Sophos;i="5.81,287,1610434800"; 
   d="scan'208";a="108891101"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Mar 2021 02:54:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 29 Mar 2021 02:54:02 -0700
Received: from [10.171.246.61] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Mon, 29 Mar 2021 02:54:00 -0700
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Ludovic Desroches" <ludovic.desroches@microchip.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-media@vger.kernel.org>,
        linux-rockchip <linux-rockchip@lists.infradead.org>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
 <CACvgo51uNyQgzGdW=f-0wxvjv-+OD1p7E4DJXRzu1GvnAHbcCQ@mail.gmail.com>
 <50b3b4b3-6c5b-3f1e-3499-c88574ce9f74@microchip.com>
 <YFxObibxqK23WTMf@piout.net>
 <CACvgo53V8sZ2PA0NTR1=JCqcFGBecqs7=aB4uofApOa-C0GZCA@mail.gmail.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <3aeb1924-d461-ab8b-440b-81f33a1a8213@microchip.com>
Date:   Mon, 29 Mar 2021 11:53:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACvgo53V8sZ2PA0NTR1=JCqcFGBecqs7=aB4uofApOa-C0GZCA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/03/2021 at 15:22, Emil Velikov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Greetings all,
> 
> On Thu, 25 Mar 2021 at 08:48, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
>>
>> On 24/03/2021 14:44:14+0100, Nicolas Ferre wrote:
>>> Now, when we have the tag from Rob, how to coordinate these different
>>> pieces? Will it go through the media git tree? Will we benefit from a stable
>>> branch to share or will we just have to wait for the driver to hit Mainline
>>> before adding the defconfig and DT patches?
>>>
> Thanks for the Acked-by Nicolas.
> 
>>
>> I think the defconfig and dt patches can go through at91 as soon as we
>> get Rob's ack. There is no build dependency so it can be taken at any
>> time. Worst case, we end up with a selected config option that doesn't
>> exist.
>>
> My personal preference is to merge everything in one go.
> I believe it will be easier from maintainer's point of view, plus odds
> of conflicts with the AT91 tree are close to zero.
> 
> Then again, as long as the maintainers are happy - I'm fine either way.

I'm taking defconfig 2 last patches of your series right now. No need to 
include them in subsequent versions.

For DT, I'm waiting for settlement on refined code. As indicated by 
Alexandre, changes will need to travel through arm-soc tree so we'll 
coordinate when patches are ready.

Thanks a lot! Best regards,
   Nicolas


-- 
Nicolas Ferre
