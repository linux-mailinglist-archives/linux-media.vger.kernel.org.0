Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DED13479DB
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 14:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235574AbhCXNqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 09:46:51 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:65108 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235572AbhCXNqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 09:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1616593594; x=1648129594;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=FvPDaHUzjC9xXphePPStpuKbHidSjAiCxc54TOeg7kQ=;
  b=rlAJJapFZx2kXT0BtTiqo4JtAM7BAddpw6brxH5KLeiASN65imRKYMnH
   N32hPPMjnOtVLs5b391X2GdoW/MxEQ17ydLPXBzlnDUJEFVWGAbJJrS1u
   dVwMotRI8QG5rL8J/bBq90vu8SOWudW00XRHFKR1HztWBdr7z4ifTXGGl
   mDXAHnNv5e+CAuvdjr/O6uSy9mdpCMSbpu1l6J8J6EhMrlDyA9hQBa6gx
   WPOxwOxyFjYSS5MlL0NjXAGsaBMPOoatHG3fCG1HyDuyejbWqU3iYMITn
   cyGnDhG3rypqqW/HoeYbnhqO6juLbFJ+yJPJeD9OdzjG2we8W5n3M4yGM
   g==;
IronPort-SDR: DRtHfB90mf+KI27pe5E+AvMDJgl1PYi7WKU3vUDSw7rxxgmYFlgOBL+f3Jor3JfosPHu/F94nQ
 ALtmpMiXq+v8q+NzHTCqdW8v4UUIRg/g9nlSWoUqVCz9ucYWPDfb+fgMps1C4Lx25UqjvTFFUB
 SVP6POFLhb6sh2hoLZS8avezM/SCcLYY59ljMI8r3yNB6YcdRxNZR1MkgYOrxfg53IAZkxiGc1
 Dw0+aKT7NzbXyW8MrlMcahz+sJ71+I36l22QsP/Y2txh0Tb/Qr4EwNd0PBFCyWkJndtwOWDJFM
 cYI=
X-IronPort-AV: E=Sophos;i="5.81,274,1610434800"; 
   d="scan'208";a="48709226"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Mar 2021 06:46:30 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 24 Mar 2021 06:46:26 -0700
Received: from [10.171.246.12] (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Wed, 24 Mar 2021 06:46:24 -0700
Subject: Re: [PATCH v2 00/10] Microship SAMA5D4 VPU support et al
To:     Emil Velikov <emil.l.velikov@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        devicetree <devicetree@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-media@vger.kernel.org>,
        linux-rockchip <linux-rockchip@lists.infradead.org>
References: <20210311154055.3496076-1-emil.l.velikov@gmail.com>
 <5ecf1d3b8a8f88d6387a1549faeb4f4180cf5d4b.camel@collabora.com>
 <CACvgo51uNyQgzGdW=f-0wxvjv-+OD1p7E4DJXRzu1GvnAHbcCQ@mail.gmail.com>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <50b3b4b3-6c5b-3f1e-3499-c88574ce9f74@microchip.com>
Date:   Wed, 24 Mar 2021 14:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CACvgo51uNyQgzGdW=f-0wxvjv-+OD1p7E4DJXRzu1GvnAHbcCQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Emil,

On 24/03/2021 at 13:49, Emil Velikov wrote:
> On Tue, 16 Mar 2021 at 17:23, Ezequiel Garcia <ezequiel@collabora.com> wrote:
> 
>> On Thu, 2021-03-11 at 15:40 +0000, Emil Velikov wrote:
>>> Emil Velikov (10):
>>>    media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
>>>    media: hantro: imx: reuse MB_DIM define
>>>    media: hantro: imx: remove duplicate dec_base init
>>>    media: hantro: imx: remove unused include
>>>    media: hantro: introduce hantro_g1.c for common API
>>
>> For patches 1-5:
>>
>> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>>
>>>    media: dt-bindings: Document SAMA5D4 VDEC bindings
>>
>> This one need to be reviewed by DT maintainers, I think.
>>
> Rob can you help with this one?
> 
>>>    media: hantro: add initial SAMA5D4 support
>>
>> For patch 7:
>>
>> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
>>
>>>    ARM: dts: sama5d4: enable Hantro G1 VDEC
>>>    ARM: configs: at91: sama5: update with savedefconfig
>>>    ARM: configs: at91: sama5: enable the Hantro G1 engine
>>>
>>
>> These need review from Microchip maintainers.
>>
> Alexandre, Ludovic, Nicolas
> Do you have any input of the patches or series as a whole?

The patch series looks good to me.

If needed on patches that we don't take ourselves, you can add my:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Now, when we have the tag from Rob, how to coordinate these different 
pieces? Will it go through the media git tree? Will we benefit from a 
stable branch to share or will we just have to wait for the driver to 
hit Mainline before adding the defconfig and DT patches?

> If you prefer we can drop the last two patches for the defconfig. I've
> included those for posterity.
No strong opinion on my side, except that defconfig stuff might be 
better handled in at91 + arm-soc trees because we'll have other changes 
to queue for 5.13.

> Thanks for the review Eze.
> Would you recommend that I resend the series with your R-B or it's
> better to wait for feedback from others?

Thanks a lot for this nice work. Best regards,
-- 
Nicolas Ferre
