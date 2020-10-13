Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6B6428C8C7
	for <lists+linux-media@lfdr.de>; Tue, 13 Oct 2020 08:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389693AbgJMGrc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Oct 2020 02:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389346AbgJMGrc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Oct 2020 02:47:32 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D8AC0613D0;
        Mon, 12 Oct 2020 23:47:32 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aratiu)
        with ESMTPSA id 7652F1F44489
From:   Adrian Ratiu <adrian.ratiu@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/18] Add Hantro regmap and VC8000 h264 decode support
In-Reply-To: <97e84bb5-972a-091d-a159-6ab1151f17ab@kwiboo.se>
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <97e84bb5-972a-091d-a159-6ab1151f17ab@kwiboo.se>
Date:   Tue, 13 Oct 2020 09:48:29 +0300
Message-ID: <87r1q28vuq.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

On Mon, 12 Oct 2020, Jonas Karlman <jonas@kwiboo.se> wrote:
> Hi, 
> 
> On 2020-10-12 22:59, Adrian Ratiu wrote: 
>> Dear all,  This series introduces a regmap infrastructure for 
>> the Hantro driver which is used to compensate for different 
>> HW-revision register layouts.  To justify it h264 decoding 
>> capability is added for newer VC8000 chips.   This is a gradual 
>> conversion to the new infra - a complete conversion would have 
>> been very big and I do not have all the HW yet to test (I'm 
>> expecting a RK3399 shipment next week though ;). I think 
>> converting the h264 decoder provides a nice blueprint for how 
>> the other codecs can be converted and enabled for different HW 
>> revisions.   The end goal of this is to make the driver more 
>> generic and eliminate entirely custom boilerplate like `struct 
>> hantro_reg` or headers with core-specific bit manipulations 
>> like `hantro_g1_regs.h` and instead rely on the well-tested 
>> albeit more verbose regmap subsytem.   To give just two 
>> examples of bugs which are easily discovered by using more 
>> verbose regmap fields (very easy to compare with the 
>> datasheets) instead of relying on bit-magic tricks: 
>> G1_REG_DEC_CTRL3_INIT_QP(x) was off-by-1 and the wrong 
>> .clk_gate bit was set in hantro_postproc.c.   Anyway, this 
>> series also extends the MMIO regmap API to allow relaxed writes 
>> for the theoretical reason that avoiding unnecessary 
>> membarriers leads to less CPU usage and small improvements to 
>> battery life. However, in practice I could not measure 
>> differences between relaxed/non-relaxed IO, so I'm on the fence 
>> whether to keep or remove the relaxed calls.   What I could 
>> masure is the performance impact of adding more sub-reg field 
>> acesses: a constant ~ 20 microsecond bump per G1 h264 
>> frame. This is acceptable considering the total time to decode 
>> a frame takes three orders of magnitude longer, 
>> i.e. miliseconds ranges, depending on the frame size and 
>> bitstream params, so it is an acceptable trade-off to have a 
>> more generic driver. 
> 
> In the RK3399 variant all fields use completely different 
> positions so in order to make the driver fully generic all 
> around 145 sub-reg fields used for h264 needs to be converted, 
> see [1] for a quick generation of field mappings used for h264 
> decoding. 
> 
> Any indication on how the performance will be impacted with 145 
> fields compared to around 20 fields used in this series? 

I'm aware of the RK3399 bigger layout divergence and have some 
commits converting more of the reg fields, but not all that is 
required for h264 on rk3399. I haven't seen a huge perf 
degradation but more measurements are needed, basically it depends 
on how often we go from writing a reg once to multiple times due 
to splitting.

I tried some benchmarks using regmap caching (both the default 
backends provided by the regmap subsystem, and a custom one I 
wrote) but they were not helping, perhaps if we had more fields 
then that would have more of an impact.

(btw some good news is I'm having a RK3399 SoC in the mail for an 
unrelated project and expect to receive it soon :D)

IMO there will always be a trade-off between optimizing the driver 
to squeeze the most perf out of the HW, eg optimize reg writes at 
low microsec level (which I think here is unnecessary) and making 
it more generic to support more HW.

In this case a fundamental question we need to ask ourselves is if 
the RK3399 "looks like another/different-enough HW" due to its 
bigger reg shuffling to warrant a separate driver or 
driver-within-a-driver architecture instead trying to bring it 
into the fold with the others, possibly degrading perf for 
everyone. I guess we'll have to see some benchmark numbers and an 
actual h264 implementation before deciding how to proceed with 
RK3399.

> 
> Another issue with RK3399 variant is that some fields use 
> different position depending on the codec used, e.g. two 
> dec_ref_frames in [2].  Should we use codec specific field maps? 
> or any other suggestion on how we can handle such case?

Yes, codec specific fields would be one idea, but I'd try to avoid 
it if possible to avoid unnecessary field definitions.

The regmap field API and config we currently use are just a flat 
structs (see hantro_regmap.[h|c]) but it doesn't have to be like 
that. Maybe we could organize it a bit better and in the future 
have some codec-level configs going on due to the regmap subsystem 
allowing de-coupling of the API (struct regmap_field) from the reg 
defs/configs (struct reg_field).

That is just an idea of the top of my head :) Will have to think a 
bit more about how to handle that specific use case in the 
future. Thanks!

>
> [1] https://github.com/Kwiboo/rockchip-vpu-regtool/commit/8b88d94d2ed966c7d88d9a735c0c97368eb6c92d
> [2] https://github.com/Kwiboo/rockchip-vpu-regtool/blob/master/rk3399_dec_regs.c#L1065
> [3] https://github.com/Kwiboo/rockchip-vpu-regtool/commit/9498326296445a9ce153b585cc48e0cea05d3c93
>
> Best regards,
> Jonas
>
>> 
>> This has been tested on next-20201009 with imx8mq for G1 and an SoC with
>> VC8000 which has not yet been added (hopefuly support lands soon).
>> 
>> Kind regards,
>> Adrian
>> 
>> Adrian Ratiu (18):
>>   media: hantro: document all int reg bits up to vc8000
>>   media: hantro: make consistent use of decimal register notation
>>   media: hantro: make G1_REG_SOFT_RESET Rockchip specific
>>   media: hantro: add reset controller support
>>   media: hantro: prepare clocks before variant inits are run
>>   media: hantro: imx8mq: simplify ctrlblk reset logic
>>   regmap: mmio: add config option to allow relaxed MMIO accesses
>>   media: hantro: add initial MMIO regmap infrastructure
>>   media: hantro: default regmap to relaxed MMIO
>>   media: hantro: convert G1 h264 decoder to regmap fields
>>   media: hantro: convert G1 postproc to regmap
>>   media: hantro: add VC8000D h264 decoding
>>   media: hantro: add VC8000D postproc support
>>   media: hantro: make PP enablement logic a bit smarter
>>   media: hantro: add user-selectable, platform-selectable H264 High10
>>   media: hantro: rename h264_dec as it's not G1 specific anymore
>>   media: hantro: add dump registers debug option before decode start
>>   media: hantro: document encoder reg fields
>> 
>>  drivers/base/regmap/regmap-mmio.c             |   34 +-
>>  drivers/staging/media/hantro/Makefile         |    3 +-
>>  drivers/staging/media/hantro/hantro.h         |   79 +-
>>  drivers/staging/media/hantro/hantro_drv.c     |   41 +-
>>  drivers/staging/media/hantro/hantro_g1_regs.h |   92 +-
>>  ...hantro_g1_h264_dec.c => hantro_h264_dec.c} |  237 +++-
>>  drivers/staging/media/hantro/hantro_hw.h      |   23 +-
>>  .../staging/media/hantro/hantro_postproc.c    |  144 ++-
>>  drivers/staging/media/hantro/hantro_regmap.c  | 1015 +++++++++++++++++
>>  drivers/staging/media/hantro/hantro_regmap.h  |  295 +++++
>>  drivers/staging/media/hantro/hantro_v4l2.c    |    3 +-
>>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |   75 +-
>>  drivers/staging/media/hantro/rk3288_vpu_hw.c  |    5 +-
>>  include/linux/regmap.h                        |    5 +
>>  14 files changed, 1795 insertions(+), 256 deletions(-)
>>  rename drivers/staging/media/hantro/{hantro_g1_h264_dec.c => hantro_h264_dec.c} (58%)
>>  create mode 100644 drivers/staging/media/hantro/hantro_regmap.c
>>  create mode 100644 drivers/staging/media/hantro/hantro_regmap.h
>> 
