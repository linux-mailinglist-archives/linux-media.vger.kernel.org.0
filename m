Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B1C29EDFA
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 15:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725828AbgJ2OPO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 10:15:14 -0400
Received: from foss.arm.com ([217.140.110.172]:38064 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgJ2OPO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 10:15:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62125139F;
        Thu, 29 Oct 2020 07:15:13 -0700 (PDT)
Received: from [10.57.54.223] (unknown [10.57.54.223])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A0533F719;
        Thu, 29 Oct 2020 07:15:11 -0700 (PDT)
Subject: Re: [PATCH 00/18] Add Hantro regmap and VC8000 h264 decode support
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Mark Brown <broonie@kernel.org>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <d4d080658113ad97816eda9262736e5fcc7b017c.camel@collabora.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <0dd9fb9d-3f33-b9b0-a7a8-6d3111e92d64@arm.com>
Date:   Thu, 29 Oct 2020 14:15:10 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d4d080658113ad97816eda9262736e5fcc7b017c.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-10-29 13:07, Ezequiel Garcia wrote:
> Hello Adrian,
> 
> On Mon, 2020-10-12 at 23:59 +0300, Adrian Ratiu wrote:
>> Dear all,
>>
>> This series introduces a regmap infrastructure for the Hantro driver
>> which is used to compensate for different HW-revision register layouts.
>> To justify it h264 decoding capability is added for newer VC8000 chips.
>>
>> This is a gradual conversion to the new infra - a complete conversion
>> would have been very big and I do not have all the HW yet to test (I'm
>> expecting a RK3399 shipment next week though ;). I think converting the
>> h264 decoder provides a nice blueprint for how the other codecs can be
>> converted and enabled for different HW revisions.
>>
>> The end goal of this is to make the driver more generic and eliminate
>> entirely custom boilerplate like `struct hantro_reg` or headers with
>> core-specific bit manipulations like `hantro_g1_regs.h` and instead rely
>> on the well-tested albeit more verbose regmap subsytem.
>>
>> To give just two examples of bugs which are easily discovered by using
>> more verbose regmap fields (very easy to compare with the datasheets)
>> instead of relying on bit-magic tricks: G1_REG_DEC_CTRL3_INIT_QP(x) was
>> off-by-1 and the wrong .clk_gate bit was set in hantro_postproc.c.
>>
>> Anyway, this series also extends the MMIO regmap API to allow relaxed
>> writes for the theoretical reason that avoiding unnecessary membarriers
>> leads to less CPU usage and small improvements to battery life. However,
>> in practice I could not measure differences between relaxed/non-relaxed
>> IO, so I'm on the fence whether to keep or remove the relaxed calls.
>>
>> What I could masure is the performance impact of adding more sub-reg
>> field acesses: a constant ~ 20 microsecond bump per G1 h264 frame. This
>> is acceptable considering the total time to decode a frame takes three
>> orders of magnitude longer, i.e. miliseconds ranges, depending on the
>> frame size and bitstream params, so it is an acceptable trade-off to
>> have a more generic driver.
>>
> 
> Before going forward with using regmap, I would like to have a sense
> of the footprint it adds, and see if we can avoid that 20 us penalty.
> 
> I'd also like to try another approach, something that has less
> memory footprint and less runtime penalty.
> 
> How about something like this:
> 
> #define G1_PIC_WIDTH 4, 0xff8, 23
> #define ...
>                                   
> struct hantro_swreg {
>          u32 value[399 /*whatever size goes here*/];
> };
>                                                                                   
> void hantro_reg_write(struct hantro_swreg *r,
>                        unsigned int swreg, u32 mask, u32 offset, u32 new_val)
> {
>          r->value[swreg] = (r->value[swreg] & ~(mask)) |
>                            ((new_val << offset) & mask);
> }
> 
> Which you can then use in a very similar way as the current proposal:
> 
> hantro_reg_write(&swreg, G1_PIC_WIDTH, width);
> 
> The first advantage here is that we no longer have any
> footprint for the fields.
> 
> The ugly macros for "4, 0xff8, 23" can be auto-generated from
> existing vendor headers, when possible, so that shouldn't
> bother us.
> 
> The register set is "flushed" using _relaxed, but it
> could be still costly.
> 
> If that is indeed costly, perhaps we can avoid writing
> the entire set by having a dirty bit somewhere.
> 
> In any case, it's worth exploring our options first, I think.

Or maybe the regmap API itself deserves extending with a "deferred" 
operating mode where updates to the cached state can be separated from 
committing that state to the underlying hardware.

...which, after a brief code search out of curiosity, apparently already 
exists in the form of regcache_cache_only()/regcache_sync(), so there's 
probably no need to reinvent it :)

Robin.

> 
> PS: Another option is to just fork RK3399 to its
> own driver and call the day, given how different it is :)
> 
> Thanks!
> Ezequiel
> 
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 
