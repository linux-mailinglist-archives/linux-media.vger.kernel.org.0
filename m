Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52CE01709D9
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 21:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727466AbgBZUgr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 15:36:47 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42274 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgBZUgr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 15:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=+p7EsunDyckvjnn7uoUOj7IyahAxbevV9+nP47iItWU=; b=PsTVQeVK5MMB5wwRjEYrExEWaA
        1lEsqABgpcezNBGgPT1p7GOolDKy0OflU9a6BzxaKrNhGcfWVbAN6xuZ11bBOYm4Ne6KrWK2phYqy
        tT4mHwvThQUKuRisFlycbecA8yKIxpJenV5wWUXfKFgN6mzHck8Pb1obpiYTfjigldNarKpYQ6Y/q
        0Z4W9T7xOEW0hD8vIEH9Qc7ixTMkJ6lLXpXApqRCp/irhgXWyAxQmLO6De5lFOb6DHCgo/ueJqwNk
        eG303bUmPxpNS/6ZxLaujBeY10d2wFSRHssTX7ISCsPVyrFYm6Bw0M3HFYKFZfASOcJrwGS62J9Zj
        0cu+ombA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j73QB-00062V-Dw; Wed, 26 Feb 2020 20:36:43 +0000
Subject: Re: [PATCH v9 3/4] soc: mediatek: Move mt8173 MMSYS to platform
 driver
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        dri-devel@lists.freedesktop.org, Weiyi Lu <weiyi.lu@mediatek.com>,
        Seiya Wang <seiya.wang@mediatek.com>,
        linux-clk@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>, wens@csie.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        sean.wang@mediatek.com, frank-w@public-files.de,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        Matthias Brugger <mbrugger@suse.com>,
        linux-arm-kernel@lists.infradead.org,
        Richard Fontana <rfontana@redhat.com>,
        linux-kernel@vger.kernel.org, matthias.bgg@kernel.org,
        Daniel Vetter <daniel@ffwll.ch>
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
 <20200226105419.632771-4-enric.balletbo@collabora.com>
 <54b3cfed-92f3-54c8-05a1-90ef4c057e4c@infradead.org>
 <da1b0908ddac65d370609f35c78d4a618ac70268.camel@collabora.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <470ab4e2-ab10-19bd-aea4-9b081c9978a8@infradead.org>
Date:   Wed, 26 Feb 2020 12:36:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <da1b0908ddac65d370609f35c78d4a618ac70268.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/26/20 12:29 PM, Ezequiel Garcia wrote:
> On Wed, 2020-02-26 at 07:40 -0800, Randy Dunlap wrote:
>> On 2/26/20 2:54 AM, Enric Balletbo i Serra wrote:
>>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>>> index 2114b563478c..dcd6481a14d0 100644
>>> --- a/drivers/soc/mediatek/Kconfig
>>> +++ b/drivers/soc/mediatek/Kconfig
>>> @@ -44,4 +44,11 @@ config MTK_SCPSYS
>>>  	  Say yes here to add support for the MediaTek SCPSYS power domain
>>>  	  driver.
>>>  
>>> +config MT8173_MMSYS
>>> +	bool "MediaTek MT8173 MMSYS Support"
>>
>> Hi,
>> Can this be tristate instead of bool?
>>
> 
> Wouldn't that conflict with
> the driver being a builtin_platform_driver,
> or am I just confusing things badly?

OK, it probably would conflict.

Thanks.

>> +	depends on COMMON_CLK_MT8173
>>> +	help
>>> +	  Say yes here to add support for the MediaTek MT8173 Multimedia
>>> +	  Subsystem (MMSYS).
>>> +
>>>  endmenu


-- 
~Randy

