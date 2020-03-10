Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CDB17F423
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 10:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgCJJun (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 05:50:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44342 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgCJJun (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 05:50:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 54EA929595C
Subject: Re: [PATCH v11 3/5] soc: mediatek: Move mt8173 MMSYS to platform
 driver
To:     Matthias Brugger <mbrugger@suse.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, CK HU <ck.hu@mediatek.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        ulrich.hecht+renesas@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Richard Fontana <rfontana@redhat.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-clk@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
        sean.wang@mediatek.com, Houlong Wei <"houlong.w ei"@mediatek.com>,
        ARM/Mediatek SoC support <linux-mediatek@lists.infradead.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        fwll.ch@freedesktop.org, matthias.bgg@kernel.org
References: <20200302110128.2664251-1-enric.balletbo@collabora.com>
 <20200302110128.2664251-4-enric.balletbo@collabora.com>
 <158344207340.7173.8369925839829696256@swboyd.mtv.corp.google.com>
 <8bfc4350-6e92-e657-18f2-3624a2558521@collabora.com>
 <158353062701.66766.10488072352849985568@swboyd.mtv.corp.google.com>
 <CAFqH_51hL07c7z2mBSWMejKwZMkNHPVYiB7JpMPPgck0XycEug@mail.gmail.com>
 <158379424337.149997.7454036134629466675@swboyd.mtv.corp.google.com>
 <21b43196-230c-5000-546e-b90d4b6b44a3@suse.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <1c726a44-dd8a-d69e-0563-dfbbc455317e@collabora.com>
Date:   Tue, 10 Mar 2020 10:50:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <21b43196-230c-5000-546e-b90d4b6b44a3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

On 10/3/20 10:40, Matthias Brugger wrote:
> 
> 
> On 09/03/2020 23:50, Stephen Boyd wrote:
>> Quoting Enric Balletbo Serra (2020-03-06 14:09:50)
>>> Missatge de Stephen Boyd <sboyd@kernel.org> del dia dv., 6 de mar
>>> 2020 a les 22:37:
>>>>
>>>> Quoting Enric Balletbo i Serra (2020-03-06 08:30:16)
>>>>> On 5/3/20 22:01, Stephen Boyd wrote:
>>>>>> Quoting Enric Balletbo i Serra (2020-03-02 03:01:26)
>>>>>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..473cdf732fb5
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>>>>>> @@ -0,0 +1,154 @@
>>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>>> +/*
>>>>>>> + * Copyright (c) 2014 MediaTek Inc.
>>>>>>> + * Author: James Liao <jamesjj.liao@mediatek.com>
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <linux/clk-provider.h>
>>>>>>> +#include <linux/of_device.h>
>>>>>>> +#include <linux/platform_device.h>
>>>>>>> +
>>>>>>> +#include "../../clk/mediatek/clk-gate.h"
>>>>>>> +#include "../../clk/mediatek/clk-mtk.h"
>>>>>>
>>>>>> Why not use include/linux/clk/?
>>>>>>
>>>>>
>>>>> I can move these files to include, this will impact a lot more of drivers but,
>>>>> yes, I think is the right way.
>>>>>
>>>>>> But I also don't understand why the clk driver is moved outside of
>>>>>> drivers/clk/ into drivers/soc/. Commit text saying that it has shared
>>>>>> registers doesn't mean it can't still keep the clk driver part in the
>>>>>> drivers/clk/ area.
>>>>>>
>>>>>
>>>>> Actually moving this to the soc directory has been requested by CK (mediatek) as
>>>>> a change in v8. You can see the discussion in [1]
>>>>>
>>>>
>>>> I can reply there in that thread if necessary, but we shouldn't need to
>>>> force simple-mfd into DT bindings to support this. Match the compatible
>>>> string in drivers/soc/ and register devices in software for the
>>>> different pieces of this overall hardware block. If necessary, pass down
>>>> the ioremapped addresss down through device data to each logical driver
>>>> in the respective subsystem.
>>>>
>>>> So yes, it looks like an MFD, but that doesn't mean we have to change
>>>> the DT binding or put it in drivers/mfd to support that. And we don't
>>>> have to fix any problems with allowing two drivers to probe the same
>>>> compatible string.
>>>>
>>>
>>> That thread maybe has too much information and things evolved since
>>> then. Note that the final solution is not an MFD neither we change the
>>> bindings. I pointed to that thread just because CK (CK please correct
>>> me if I'm wrong) thought that the driver is not a pure clock driver
>>> and he preferred to move to drivers/soc/mediatek (in that thread, he
>>> exposes his opinion on that).  Sorry to introduce more confusion.
>>>
>>> You seem to be fine with the approach (just minor changes), so it
>>> looks to me that the only problem is if this should be in drivers/clk
>>> or drivers/soc. Honestly, this is not something I can't decide and
>>> I'll let you (the soc and clk maintainers) decide. I don't really have
>>> a strong opinion here. I don't mind move again to drivers/clk if that
>>> is what we want but let's come to an agreement.
>>>
>>
>> It's already in drivers/clk, so leave the clk part there and register
>> the clk device and any other devices by matching the compatible in
>> drivers/soc. That is my preferred solution. Can that be done?
>>
> 
> I think we can once again create a platform device in drivers/soc which matches
> the drivers/clk and then do the routing in drivers/soc. Enric any thoughts?
> 

Yes, working already on a new version.

Thanks,
 Enric

