Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA2878E136
	for <lists+linux-media@lfdr.de>; Wed, 30 Aug 2023 23:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjH3VLU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Aug 2023 17:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240827AbjH3VLU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Aug 2023 17:11:20 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2783122
        for <linux-media@vger.kernel.org>; Wed, 30 Aug 2023 14:10:46 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C40FF8653E;
        Wed, 30 Aug 2023 21:13:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1693422794;
        bh=iJcxC90YyG5/9K2N2+mHTpn6H9rjmnVg9+CaTDZAAEo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=i5xMegFR3yNwi9oxKopJn1G8iPZSOxqStFrozyNYTMt3ts6kQ59pzg69TZkH6jVYL
         LbISxAC35Zv5cRnmfe74eI16Qm8CLS2XRA22ehhiXeeXjrFzqAfp9y7iPWN71shmgR
         ztW/x1e2QEG2QCfdEmvtzxVb0Lvf8RHdEEjFfVBDv1ANkwXK0uoqiTRxPG3o+lq6GG
         AxNj/skIbsAkSG4i0YqO5AdtUWM1j+7fLknv4uUbb+c3u6f3HMu1LYbAUVkXtSU6C6
         cyzmuUczX0UWmPScOiGMQM6+6KDQo1ALca9OH+ojxWDLJfgG6chzvNwGoKI+aWMbhE
         gKulGasEGnWZA==
Message-ID: <3a5ef85d-ee82-a1aa-1bf0-9fcb5efec833@denx.de>
Date:   Wed, 30 Aug 2023 21:13:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] media: hantro: Check whether reset op is defined before
 use
Content-Language: en-US
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-rockchip@lists.infradead.org
References: <20230824013858.303105-1-marex@denx.de>
 <CAHCN7xLDmMv7T_fT7vY3iq+KMWuPM9tBP_2AJ-X04L7ZTRWPOw@mail.gmail.com>
 <80d9a66f-c703-6057-e084-1a6d2214d775@denx.de>
 <CAGXv+5GQFtCAYbfSbEJeHA4Os0O6WuD64V-xcZ9uDD33HbuhhQ@mail.gmail.com>
 <f6f55f46-bd6e-4dde-4484-86d1c385c8fe@denx.de>
 <CAGXv+5EJ1asWymfjNcyLANSgQdJPcjT6MXUVwTYOEQ3PtVtXBQ@mail.gmail.com>
 <a445f1fc-6b38-e58b-a3ca-81c05e19f66e@denx.de>
 <CAGXv+5ESeqzzGAooMUFLiwJEzLneTRDbLggyzTFeq32NzDDUiw@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAGXv+5ESeqzzGAooMUFLiwJEzLneTRDbLggyzTFeq32NzDDUiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/30/23 05:38, Chen-Yu Tsai wrote:
> On Sun, Aug 27, 2023 at 5:44 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 8/25/23 10:52, Chen-Yu Tsai wrote:
>>> On Fri, Aug 25, 2023 at 4:33 PM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 8/25/23 09:09, Chen-Yu Tsai wrote:
>>>>> On Thu, Aug 24, 2023 at 9:08 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>
>>>>>> On 8/24/23 12:39, Adam Ford wrote:
>>>>>>> On Wed, Aug 23, 2023 at 8:39 PM Marek Vasut <marex@denx.de> wrote:
>>>>>>>>
>>>>>>>> The i.MX8MM/N/P does not define the .reset op since reset of the VPU is
>>>>>>>> done by genpd. Check whether the .reset op is defined before calling it
>>>>>>>> to avoid NULL pointer dereference.
>>>>>>>>
>>>>>>>> Note that the Fixes tag is set to the commit which removed the reset op
>>>>>>>> from i.MX8M Hantro G2 implementation, this is because before this commit
>>>>>>>> all the implementations did define the .reset op.
>>>>>>>
>>>>>>> I am surprised I didn't have issues when I was testing the 8MQ and
>>>>>>> 8MM, but this makes sense.
>>>>>>
>>>>>> You need to trigger the VPU watchdog to trigger the crash, that means
>>>>>> you have to get the VPU into some weird state where it fails to decode
>>>>>> frame. Then it triggers the reset and ... boom.
>>>>>>
>>>>>> See this patch, that contains a gstreamer invocation to generate such
>>>>>> trigger condition input data:
>>>>>>
>>>>>> [PATCH] media: verisilicon: Do not enable G2 postproc downscale if
>>>>>> source is narrower than destination
>>>>>>
>>>>>> "
>>>>>> To generate input test data to trigger this bug, use e.g.:
>>>>>> $ gst-launch-1.0 videotestsrc !
>>>>>> video/x-raw,width=272,height=256,format=I420 ! \
>>>>>>                      vp9enc ! matroskamux ! filesink location=/tmp/test.vp9
>>>>>> To trigger the bug upon decoding (note that the NV12 must be forced, as
>>>>>> that assures the output data would pass the G2 postproc):
>>>>>> $ gst-launch-1.0 filesrc location=/tmp/test.vp9 ! matroskademux !
>>>>>> vp9parse ! \
>>>>>>                      v4l2slvp9dec ! video/x-raw,format=NV12 ! videoconvert
>>>>>> ! fbdevsink
>>>>>> "
>>>>>
>>>>> Does it completely recover afterwards? In my previous trials the hardware
>>>>> ended up in some bizzare state: while decoding succeeds, the output's md5sum
>>>>> didn't match up.
>>>>
>>>> Have you got a testcase that triggers this, one I can try ?
>>>>
>>>> I am not entirely sure whether this is happening here as well or not,
>>>> but I can imagine that the power domain went down and back up between
>>>> tests, so the VPU would be power cycled (and therefore reset) that way.
>>>> So, I think it is worth testing that.
>>>
>>> This was last year while I was writing HEVC decoding code for Chromium.
>>> IIRC the SAODBLK_A_MainConcept_4 test vector from the official HEVC test
>>> suite does cause our stack to crash, but Gstreamer seemed to handle it
>>> OK. It could be that the Chromium decoder stack is passing bad values to
>>> the decoder.
>>
>> That can be easily tested with ftrace enabled. I was just tracking down
>> an issue with gstreamer and added the following patch to the hantro
>> driver. Then:
>>
>> echo > /sys/kernel/debug/tracing/trace
>> <run fail test>
>> cat /sys/kernel/debug/tracing/trace > /tmp/fail.trace
>> echo > /sys/kernel/debug/tracing/trace
>> <run pass test>
>> cat /sys/kernel/debug/tracing/trace > /tmp/pass.trace
>> # remove time stamps etc.
>> diff /tmp/{fail,pass}.trace
>>
>> You should see whether some register programming differs between
>> gstreamer and chromium.
> 
> I ended up using VISL to compare the controls set. I did find a bug.
> It still hard hangs after a couple frames, so I guess I'd need to use
> your method, but do printk instead.
> 
> BTW, I wonder if we shouldn't add a reset op, if only just to stop the
> hardware? That is, do the same two register writes as in the Hantro G2
> interrupt handler.

You mean these two ?

38         vdpu_write(vpu, 0, G2_REG_INTERRUPT);
39         vdpu_write(vpu, G2_REG_CONFIG_DEC_CLK_GATE_E, G2_REG_CONFIG);

As far as I understand this, that only clears IRQ and gates the clock 
off, but it doesn't reset the IP state, does it ?
