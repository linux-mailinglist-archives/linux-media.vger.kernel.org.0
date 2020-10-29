Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E8129F142
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgJ2QWh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:22:37 -0400
Received: from o1.b.az.sendgrid.net ([208.117.55.133]:25127 "EHLO
        o1.b.az.sendgrid.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbgJ2QWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
        h=subject:references:from:mime-version:in-reply-to:to:cc:content-type:
        content-transfer-encoding;
        s=001; bh=TpcF+14T/6mqOqwF03OswUlyCDxtQaVGcvs2iBy2hLI=;
        b=QgRgw6ieifvgHYmnV029yMUV14HLLLPJfRjI9fZOt2l1Ri2YgABPT5wEWYiRNt6ECptN
        QX7VWP7HjNfnqZ/r37YhuijZhJOj4bRUxJ9cpwQ2GAx5Zwz46tPn7/6ylhErOmYmcmyID8
        KRpXeF4Nvi8sVOpftCoXQUDHTJTwDq2Tg=
Received: by filterdrecv-p3iad2-64988c98cc-t8x7c with SMTP id filterdrecv-p3iad2-64988c98cc-t8x7c-19-5F9AEC1B-15
        2020-10-29 16:21:47.458268234 +0000 UTC m=+502013.655851203
Received: from [192.168.10.211] (unknown)
        by ismtpd0007p1lon1.sendgrid.net (SG) with ESMTP
        id oz7KHslxSFiha_c3gSLayA
        Thu, 29 Oct 2020 16:21:46.986 +0000 (UTC)
Subject: Re: [PATCH 00/18] Add Hantro regmap and VC8000 h264 decode support
References: <20201012205957.889185-1-adrian.ratiu@collabora.com>
 <97e84bb5-972a-091d-a159-6ab1151f17ab@kwiboo.se>
 <abc0321a81a3ada8eb66d227b56249024e549021.camel@collabora.com>
From:   Jonas Karlman <jonas@kwiboo.se>
Message-ID: <4943efb9-29c2-6848-9783-514276085f2b@kwiboo.se>
Date:   Thu, 29 Oct 2020 16:21:47 +0000 (UTC)
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <abc0321a81a3ada8eb66d227b56249024e549021.camel@collabora.com>
X-SG-EID: =?us-ascii?Q?TdbjyGynYnRZWhH+7lKUQJL+ZxmxpowvO2O9SQF5CwCVrYgcwUXgU5DKUU3QxA?=
 =?us-ascii?Q?fZekEeQsTe+RrMu3cja6a0h1YAKsV6Db0j8KSuu?=
 =?us-ascii?Q?BeT9Fz3y+MIiVTUtHh2RJ1+Yb99WUU16rzvyEnS?=
 =?us-ascii?Q?6Y1aiH8vVyHfr90NTPtRI4wNcF+byq45XedrSD0?=
 =?us-ascii?Q?c3n5QoQIQPn5qJQZG7=2FJwWUPFV20SWE1xb2xvoe?=
 =?us-ascii?Q?CM=2Fq1iWWZFZonJ6wDyrAZbxnuoXV8xwzMZWsO1I?=
 =?us-ascii?Q?MjBMePNY2WynHsTGd1l9A=3D=3D?=
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Kever Yang <kever.yang@rock-chips.com>,
        Mark Brown <broonie@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Fruehberger Peter <Peter.Fruehberger@de.bosch.com>,
        kuhanh.murugasen.krishnan@intel.com,
        Daniel Vetter <daniel@ffwll.ch>, kernel@collabora.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Entity-ID: wSPGWgGSXUap++qShBI+ag==
Content-Type: text/plain; charset=us-ascii
Content-Language: sv
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-10-29 13:38, Ezequiel Garcia wrote:
> On Mon, 2020-10-12 at 23:39 +0000, Jonas Karlman wrote:
>> Hi,
>>
>> On 2020-10-12 22:59, Adrian Ratiu wrote:
>>> Dear all,
>>>
>>> This series introduces a regmap infrastructure for the Hantro driver
>>> which is used to compensate for different HW-revision register layouts.
>>> To justify it h264 decoding capability is added for newer VC8000 chips.
>>>
>>> This is a gradual conversion to the new infra - a complete conversion
>>> would have been very big and I do not have all the HW yet to test (I'm
>>> expecting a RK3399 shipment next week though ;). I think converting the
>>> h264 decoder provides a nice blueprint for how the other codecs can be
>>> converted and enabled for different HW revisions.
>>>
>>> The end goal of this is to make the driver more generic and eliminate
>>> entirely custom boilerplate like `struct hantro_reg` or headers with
>>> core-specific bit manipulations like `hantro_g1_regs.h` and instead rely
>>> on the well-tested albeit more verbose regmap subsytem.
>>>
>>> To give just two examples of bugs which are easily discovered by using
>>> more verbose regmap fields (very easy to compare with the datasheets)
>>> instead of relying on bit-magic tricks: G1_REG_DEC_CTRL3_INIT_QP(x) was
>>> off-by-1 and the wrong .clk_gate bit was set in hantro_postproc.c.
>>>
>>> Anyway, this series also extends the MMIO regmap API to allow relaxed
>>> writes for the theoretical reason that avoiding unnecessary membarriers
>>> leads to less CPU usage and small improvements to battery life. However,
>>> in practice I could not measure differences between relaxed/non-relaxed
>>> IO, so I'm on the fence whether to keep or remove the relaxed calls.
>>>
>>> What I could masure is the performance impact of adding more sub-reg
>>> field acesses: a constant ~ 20 microsecond bump per G1 h264 frame. This
>>> is acceptable considering the total time to decode a frame takes three
>>> orders of magnitude longer, i.e. miliseconds ranges, depending on the
>>> frame size and bitstream params, so it is an acceptable trade-off to
>>> have a more generic driver.
>>
>> In the RK3399 variant all fields use completely different positions so
>> in order to make the driver fully generic all around 145 sub-reg fields
>> used for h264 needs to be converted, see [1] for a quick generation of
>> field mappings used for h264 decoding.
>>
> 
> Currently, we've only decided to support H.264 decoding via he RKVDEC
> core on RK3399.
> 
> What your thoughts here Jonas, have you tested H.264 on RK3399 with
> the G1 core? If it works, what benefits do we get from enabling both
> cores?

The G1 core was working back in Dec/Jan/Feb and was used for H.264 decoding in
LibreELEC nightly images until the rkvdec h264 driver was submitted/merged.

For RK3399 and other SoCs that both contain RKVDEC and VDPU2 IP it may not be
much of a benefit. Possible for decoding multiple videos in parallel,
it is unclear to me if both IP can be used at the same time.

There are however SoCs that only have VDPU2 IP (px30/rk3326 and rk1808)
that could benefit from adding support for the VDPU2 IP, see [1].

Should I submit the rk3399 variant in similar style as the rk3399 mpeg2 decoder?
Or should I try and adopt it to be based on this series and use regmap?

[1] https://github.com/HermanChen/mpp/blob/develop/osal/mpp_platform.cpp#L80-L82

Best regards,
Jonas

> 
> Thanks!
> Ezequiel
> 
>> Any indication on how the performance will be impacted with 145 fields
>> compared to around 20 fields used in this series?
>>
>> Another issue with RK3399 variant is that some fields use different
>> position depending on the codec used, e.g. two dec_ref_frames in [2].
>> Should we use codec specific field maps? or any other suggestion on
>> how we can handle such case?
>>
>> [1] https://github.com/Kwiboo/rockchip-vpu-regtool/commit/8b88d94d2ed966c7d88d9a735c0c97368eb6c92d
>> [2] https://github.com/Kwiboo/rockchip-vpu-regtool/blob/master/rk3399_dec_regs.c#L1065
>> [3] https://github.com/Kwiboo/rockchip-vpu-regtool/commit/9498326296445a9ce153b585cc48e0cea05d3c93
>>
>> Best regards,
>> Jonas
>>
>>> This has been tested on next-20201009 with imx8mq for G1 and an SoC with
>>> VC8000 which has not yet been added (hopefuly support lands soon).
>>>
>>> Kind regards,
>>> Adrian
>>>
>>> Adrian Ratiu (18):
>>>   media: hantro: document all int reg bits up to vc8000
>>>   media: hantro: make consistent use of decimal register notation
>>>   media: hantro: make G1_REG_SOFT_RESET Rockchip specific
>>>   media: hantro: add reset controller support
>>>   media: hantro: prepare clocks before variant inits are run
>>>   media: hantro: imx8mq: simplify ctrlblk reset logic
>>>   regmap: mmio: add config option to allow relaxed MMIO accesses
>>>   media: hantro: add initial MMIO regmap infrastructure
>>>   media: hantro: default regmap to relaxed MMIO
>>>   media: hantro: convert G1 h264 decoder to regmap fields
>>>   media: hantro: convert G1 postproc to regmap
>>>   media: hantro: add VC8000D h264 decoding
>>>   media: hantro: add VC8000D postproc support
>>>   media: hantro: make PP enablement logic a bit smarter
>>>   media: hantro: add user-selectable, platform-selectable H264 High10
>>>   media: hantro: rename h264_dec as it's not G1 specific anymore
>>>   media: hantro: add dump registers debug option before decode start
>>>   media: hantro: document encoder reg fields
>>>
>>>  drivers/base/regmap/regmap-mmio.c             |   34 +-
>>>  drivers/staging/media/hantro/Makefile         |    3 +-
>>>  drivers/staging/media/hantro/hantro.h         |   79 +-
>>>  drivers/staging/media/hantro/hantro_drv.c     |   41 +-
>>>  drivers/staging/media/hantro/hantro_g1_regs.h |   92 +-
>>>  ...hantro_g1_h264_dec.c => hantro_h264_dec.c} |  237 +++-
>>>  drivers/staging/media/hantro/hantro_hw.h      |   23 +-
>>>  .../staging/media/hantro/hantro_postproc.c    |  144 ++-
>>>  drivers/staging/media/hantro/hantro_regmap.c  | 1015 +++++++++++++++++
>>>  drivers/staging/media/hantro/hantro_regmap.h  |  295 +++++
>>>  drivers/staging/media/hantro/hantro_v4l2.c    |    3 +-
>>>  drivers/staging/media/hantro/imx8m_vpu_hw.c   |   75 +-
>>>  drivers/staging/media/hantro/rk3288_vpu_hw.c  |    5 +-
>>>  include/linux/regmap.h                        |    5 +
>>>  14 files changed, 1795 insertions(+), 256 deletions(-)
>>>  rename drivers/staging/media/hantro/{hantro_g1_h264_dec.c => hantro_h264_dec.c} (58%)
>>>  create mode 100644 drivers/staging/media/hantro/hantro_regmap.c
>>>  create mode 100644 drivers/staging/media/hantro/hantro_regmap.h
>>>
> 
> 
