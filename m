Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E0416FAAA
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 10:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgBZJYM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 04:24:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49712 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgBZJYM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 04:24:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 0209328DB54
Subject: Re: [PATCH v8 0/6] arm/arm64: mediatek: Fix mmsys device probing
To:     CK Hu <ck.hu@mediatek.com>
Cc:     mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
        mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
        Richard Fontana <rfontana@redhat.com>,
        laurent.pinchart@ideasonboard.com, ulrich.hecht+renesas@gmail.com,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-clk@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org,
        Allison Randal <allison@lohutok.net>,
        mtk01761 <wendell.lin@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        p.zabel@pengutronix.de, frank-w@public-files.de,
        Seiya Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
        Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
        linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
        Matthias Brugger <"matthias. bgg"@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <mbrugger@suse.com>,
        Fabien Parent <fparent@baylibre.com>, sboyd@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rdunlap@infradead.org, linux-kernel@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>, matthias.bgg@kernel.org
References: <20200220172147.919996-1-enric.balletbo@collabora.com>
 <1582259996.1846.7.camel@mtksdaap41>
 <7a87b486-1622-7f27-f5af-427b94a14c00@collabora.com>
 <1582277229.25992.9.camel@mtksdaap41>
 <1393a8c5-065f-cccb-2563-8b159c951d4b@suse.com>
 <1582283518.5889.10.camel@mtksdaap41>
 <6deab0a4-44a6-a15f-ac01-374f818b267c@collabora.com>
 <6eb9da70-9a0c-27fc-6c31-3ac62ede5a35@suse.com>
 <d9ad35c0-57df-ebb2-67e8-4aae55dd2fcb@collabora.com>
 <1582523544.25316.2.camel@mtksdaap41>
 <688f6c85-0063-9458-858c-de7bbfb8a530@collabora.com>
 <1582695176.8324.4.camel@mtksdaap41>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6355f1fd-b929-730e-e0f6-96dd5100e3f9@collabora.com>
Date:   Wed, 26 Feb 2020 10:24:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582695176.8324.4.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi CK,

On 26/2/20 6:32, CK Hu wrote:

[snip]

>>
>> How do you see move mmsys to drivers/soc/mediatek and instantiate the clk and
>> mediatek-drm driver
>>
>>  mmsys: syscon@14000000 {
>>  	compatible = "mediatek,mt8173-mmsys", "syscon", "simple-mfd";
>>  	reg = <0 0x14000000 0 0x1000>;
>>  	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>>
>> 	clock-controller {
>> 		compatible = "mediatek,clk-mt8173-mm"
>> 		assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
>> 	 	assigned-clock-rates = <400000000>;
>>  		#clock-cells = <1>;
>> 	};
>>
>> 	display-subsystem {
>> 		compatible = "mediatek,display-subsystem";
>> 	};
>>  };
>>
> 
> Let's start with the simple definition.
> 
> mmsys: syscon at 14000000 {
> 	compatible = "mediatek,mt8173-mmsys", "syscon";
> 	reg = <0 0x14000000 0 0x1000>;
> 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
> 	assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
> 	assigned-clock-rates = <400000000>;
> 	#clock-cells = <1>;
> };
> 
> When we break clock control to a sub device of mmsys, the reason is that
> 'Linux' generally categorize clock controller to a device. When we break
> display control to a sub device of mmsys, the reason is that 'Linux'
> generally categorize display controller to a device. All these seems
> software-oriented reason, so I think we do not break any sub device and
> keep mmsys simple.
> 
> When I search of_clk_add_provider(), I find that not all clock provider
> code is in drivers/clk. Maybe when a clock controller is not an
> independent device, the driver code of clock controller could be placed
> within the device driver it belonged to. We could place mmsys driver in
> drivers/soc/mediatek/, and it control the clock, routing, fake engine,
> memory delay,.... I would like drm driver to be placed in
> drivers/gpu/drm/ because display function block, such as OVL, does not
> belong to mmsys device. And finally let mmsys driver to probe
> mediatek-drm driver.
> 

You can apply the same reasoning in the clk subsystem, not all the drivers in
drivers/clk are pure clock controllers, some of them are already
system-controller or "simple-mfd" and some of them even instantiate other
subdrivers via the platform register API.

Note that moving clk-<chip>-mm drivers to drivers/soc/mediatek will imply move a
lot of code, I'll focus only on mt8173 for now because is the only platform I
can really test. Let me prepare a v9 and lets see how looks like.

Thanks,
 Enric

> Regards,
> CK

[snip]
