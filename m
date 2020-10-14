Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755E828E4BB
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 18:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387565AbgJNQqr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 12:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727440AbgJNQqr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 12:46:47 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A2BC061755;
        Wed, 14 Oct 2020 09:46:46 -0700 (PDT)
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D14E91F45780;
        Wed, 14 Oct 2020 17:46:39 +0100 (BST)
Subject: Re: [PATCH v5 5/9] media: staging: rkisp1: remove unecessary clocks
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Collabora Kernel ML <kernel@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mark Rutland <mark.rutland@arm.com>, karthik.poduval@gmail.com,
        Johan Jonker <jbx6244@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Robin Murphy <robin.murphy@arm.com>
References: <20200722155533.252844-1-helen.koike@collabora.com>
 <20200722155533.252844-6-helen.koike@collabora.com>
 <CAL_Jsq+qB=yUtHKKujiUWrsq+W-3ggM3B_SuuDzfYEheczn=8g@mail.gmail.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <2dcdda41-bdb4-55a8-557f-8175983effb5@collabora.com>
Date:   Wed, 14 Oct 2020 13:46:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+qB=yUtHKKujiUWrsq+W-3ggM3B_SuuDzfYEheczn=8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thnaks for your reply.

On 9/22/20 11:24 AM, Rob Herring wrote:
> On Wed, Jul 22, 2020 at 9:56 AM Helen Koike <helen.koike@collabora.com> wrote:
>>
>> aclk_isp_wrap is a child of aclk_isp, and hclk_isp_wrap is a child of
>> hclk_isp, thus we can remove parents from the list.
>>
>> Also, for the isp0, we only need the ISP clock, ACLK and HCLK.
>> In the future we'll need a pixel clock for RK3288 and RK3399, and a JPEG
>> clock for RK3288.
>>
>> So with the goal to cleanup the dt-bindings and remove it from staging,
>> simplify clock names to isp, aclk and hclk.
>>
>> Assigned clocks are meant to refer to the full path in the clock tree,
>> i.e. the leaf in the tree.
>> For instance, in RK3399, the clock responsible for ACLK (ISP AXI CLOCK)
>> is aclk_isp0_wrapper.
>>
>> For reference, this is the isp clock topology on RK3399:
>>
>>  xin24m
>>     pll_npll
>>        npll
>>           clk_isp1
>>           clk_isp0
>>     pll_cpll
>>        cpll
>>           aclk_isp1
>>              aclk_isp1_noc
>>              hclk_isp1
>>                 aclk_isp1_wrapper
>>                 hclk_isp1_noc
>>           aclk_isp0
>>              hclk_isp1_wrapper
>>              aclk_isp0_wrapper
>>              aclk_isp0_noc
>>              hclk_isp0
>>                 hclk_isp0_wrapper
>>                 hclk_isp0_noc
>>  pclkin_isp1_wrapper
>>
>> Signed-off-by: Helen Koike <helen.koike@collabora.com>
>>
>> ---
>> Changes in V5:
>> - Use if/then schema as suggested by Rob Herring on
>> https://patchwork.linuxtv.org/project/linux-media/patch/20200702191322.2639681-6-helen.koike@collabora.com/#119729
>>
>> Changes in V4:
>> - update binding according to suggestion by Robin Murphy
>> on https://patchwork.kernel.org/patch/11475007/
>>
>> Changes in V3:
>> - this is a new patch in the series
>> ---
>>  .../bindings/media/rockchip-isp1.yaml         | 50 ++++++++++++-------
>>  drivers/staging/media/rkisp1/rkisp1-dev.c     |  8 ++-
>>  2 files changed, 36 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>> index 62a6b9c959498..23c677d15037a 100644
>> --- a/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>> +++ b/drivers/staging/media/rkisp1/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
>> @@ -24,20 +24,10 @@ properties:
>>      maxItems: 1
>>
>>    clocks:
>> -    items:
>> -      - description: ISP clock
>> -      - description: ISP AXI clock clock
>> -      - description: ISP AXI clock  wrapper clock
>> -      - description: ISP AHB clock clock
>> -      - description: ISP AHB wrapper clock
>> +    minItems: 3
> 
> You need maxItems here too or it will always be 3.
> 
>>
>>    clock-names:
>> -    items:
>> -      - const: clk_isp
>> -      - const: aclk_isp
>> -      - const: aclk_isp_wrap
>> -      - const: hclk_isp
>> -      - const: hclk_isp_wrap
>> +    minItems: 3
>>
>>    iommus:
>>      maxItems: 1
>> @@ -116,6 +106,34 @@ required:
>>    - power-domains
>>    - ports
>>
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: rockchip,rk3399-cif-isp
>> +then:
>> +  properties:
>> +    clocks:
>> +      maxItems: 4
>> +      minItems: 3
> 
> For a single compatible you shouldn't really have a variable number of clocks.

I'm not entirely sure how to make this separation, since isp0 and isp1 (not yet supported)
would use the same compatible.
Unless if we separate in two compatibles, but maybe this is an overhead just for an extra clock.
What do you think?

> 
>> +      items:
>> +        # isp0 and isp1
>> +        - description: ISP clock
>> +        - description: ISP AXI clock
>> +        - description: ISP AHB clock
>> +        # only for isp1
>> +        - description: ISP Pixel clock
>> +    clock-names:
>> +      maxItems: 4
>> +      minItems: 3
>> +      items:
>> +        # isp0 and isp1
>> +        - const: isp
>> +        - const: aclk
>> +        - const: hclk
>> +        # only for isp1
>> +        - const: pclk_isp
> 
> Don't you need an 'else' clause. For not rockchip,rk3399-cif-isp,
> there's no definition of what clocks there are.

There is only one compatible defined for now, rk3288 will be added later.
The idea to add if/then is to make it easier to add rk3288:

https://patchwork.kernel.org/project/linux-media/patch/20200406073017.19462-4-karthik.poduval@gmail.com/

Regards,
Helen

> 
> Rob
> 
