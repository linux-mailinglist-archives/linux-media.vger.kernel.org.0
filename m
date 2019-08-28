Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 996AE9FC22
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 09:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfH1HpX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 03:45:23 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56950 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfH1HpX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 03:45:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7S7iS8x119347;
        Wed, 28 Aug 2019 02:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1566978268;
        bh=6awUWFtOdU1O63SCHM3c+fsnfHIDWdFPidD7RW4ydzA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=dXFZXrQn0LpYrcwwqUWffJc2W1zM23THN6BmgVe/l05NZfQHM/LAEr5yRh6RwL0Sc
         FvGCTpRXKPABXKQgbzDpBM/8W/GQrSvk/fI8CHLjV3OtwXxe5PqIqoJCDjo08+na3i
         5WzRIxyRHfkSzbjjzMAdqMkbXywtkrlcQQnfbbi0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7S7iSrs109129
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 28 Aug 2019 02:44:28 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 28
 Aug 2019 02:44:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 28 Aug 2019 02:44:28 -0500
Received: from [172.24.145.97] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7S7iOF3048604;
        Wed, 28 Aug 2019 02:44:25 -0500
Subject: Re: [PATCH v2 0/5] ARM: make DaVinci part of the ARM v5 multiplatform
 build
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
CC:     Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
References: <20190725131257.6142-1-brgl@bgdev.pl>
 <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
 <CAMRc=Me_7aw_RvU_tZnVUgduN2wWYGqJ7hQirQ2RLzxGiPujvQ@mail.gmail.com>
 <CAMRc=MdCviMA4gakqFS3+F-nU2XkdmmZbCb-m1mBJdGRHufKGg@mail.gmail.com>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <27eb964a-bc6c-3a0d-c2c4-48e908465986@ti.com>
Date:   Wed, 28 Aug 2019 13:14:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=MdCviMA4gakqFS3+F-nU2XkdmmZbCb-m1mBJdGRHufKGg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/08/19 1:03 PM, Bartosz Golaszewski wrote:
> pon., 5 sie 2019 o 10:31 Bartosz Golaszewski <brgl@bgdev.pl> napisał(a):
>>
>> czw., 25 lip 2019 o 16:57 Arnd Bergmann <arnd@arndb.de> napisał(a):
>>>
>>> On Thu, Jul 25, 2019 at 3:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>>>
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> This series makes DaVinci part of the multiplatform build for ARM v5.
>>>>
>>>> First three patches fix build errors spotted and fixed by Arnd with v1.
>>>>
>>>> The fourth patch adds necessary bits and pieces for davinci to support
>>>> multiplatform build and the last one actually adds all davinci boards
>>>> to multi_v5_defconfig.
>>>>
>>>> Tested on da850-lcdk with both multi_v5 as well as davinci_all defconfigs.
>>>>
>>>> v1 -> v2:
>>>> - added patches from Arnd that fix build errors spotted when building
>>>>   random configurations (much appreciated)
>>>> - rebased on top of v5.3-rc1
>>>
>>>> Arnd Bergmann (3):
>>>> staging: media/davinci_vpfe: fix pinmux setup compilation
>>>>  media: davinci-vpbe: remove obsolete includes
>>>>  davinci: fix sleep.S build error on ARMv4
>>>>
>>>> Bartosz Golaszewski (2):
>>>>  ARM: davinci: support multiplatform build for ARM v5
>>>>  ARM: multi_v5_defconfig: make DaVinci part of the ARM v5 multiplatform build
>>>
>>>
>>> Thanks a lot for reposting the series!
>>>
>>> I wonder how we shoud deal with the dependencies now that the two media
>>> patches got merged in the linux-media tree.
>>>
>>> It would be tempting to just merge the arch/arm/ changes, but that creates
>>> a bisection problem when the vpbe driver is enabled. I don't care
>>> about the staging driver really as that one is broken anyway, but including
>>> the "media: davinci-vpbe: remove obsolete includes" fix would be better
>>> here.
>>>
>>> Mauro, any idea for how to handle that? Should we apply an identical
>>> patch to the davinci tree, or maybe only have it the ARM tree and you
>>> drop it from your tree (I don't know if you have a rule against rebasing).
>>> Sorry for not coordinating with Bartosz before I sent the patch again
>>> earlier this week.
>>>
>>>
>>>       Arnd
>>
>> Hi Arnd,
>>
>> is there any action required from me for this series?
>>
>> Bart
> 
> Ping.

I dont think the multi-platform parts can be merged in v5.4 since we
dont have DM365 converted successfully to use clocksource driver yet.

But other parts of the series can be merged and hopefully we resolve
that pending issue for v5.5

Thanks,
Sekhar
