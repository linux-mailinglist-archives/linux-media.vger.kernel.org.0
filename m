Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E129A78821A
	for <lists+linux-media@lfdr.de>; Fri, 25 Aug 2023 10:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbjHYIdf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Aug 2023 04:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbjHYIdc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Aug 2023 04:33:32 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0CE19AC
        for <linux-media@vger.kernel.org>; Fri, 25 Aug 2023 01:33:29 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 3ABA986A21;
        Fri, 25 Aug 2023 10:33:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1692952407;
        bh=uL3+NdgqEspH8DbPlAWPtf7vOIH91em+1BkCp/5VpCs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DtoWdeP0E615G1vQwYXYuMsCeYDe1TCqOFi83xmoAWGjbqqqhczbaYd1TKWB92sIA
         Fc0bI0hbUgMlB5Ar/CX02eUaJKXc3suYfjU4eCamGaXW9tBK1disn2TCeIInhErAzJ
         dgnSsZ7opUzSGWVZaWwCEefC4Xh0U6QsBqNXpnLNNfaGFj/kBZsAGEkuc65ca/5Zv9
         DXDw8HbIr0SmtDFz16GvDMUzJRF46ifqBTl0Hcs+vORr880Lcwywj5/5R4jR5uMk1M
         c8HQAj/Y5gCOsWnzZZRenf7aS4MS2zAqMAcgjq/0yfuyYZCQOlbCo8YSzT+C8AwmfS
         zubKq6g/+ojSg==
Message-ID: <f6f55f46-bd6e-4dde-4484-86d1c385c8fe@denx.de>
Date:   Fri, 25 Aug 2023 10:33:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] media: hantro: Check whether reset op is defined before
 use
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
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAGXv+5GQFtCAYbfSbEJeHA4Os0O6WuD64V-xcZ9uDD33HbuhhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/25/23 09:09, Chen-Yu Tsai wrote:
> On Thu, Aug 24, 2023 at 9:08 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 8/24/23 12:39, Adam Ford wrote:
>>> On Wed, Aug 23, 2023 at 8:39 PM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> The i.MX8MM/N/P does not define the .reset op since reset of the VPU is
>>>> done by genpd. Check whether the .reset op is defined before calling it
>>>> to avoid NULL pointer dereference.
>>>>
>>>> Note that the Fixes tag is set to the commit which removed the reset op
>>>> from i.MX8M Hantro G2 implementation, this is because before this commit
>>>> all the implementations did define the .reset op.
>>>
>>> I am surprised I didn't have issues when I was testing the 8MQ and
>>> 8MM, but this makes sense.
>>
>> You need to trigger the VPU watchdog to trigger the crash, that means
>> you have to get the VPU into some weird state where it fails to decode
>> frame. Then it triggers the reset and ... boom.
>>
>> See this patch, that contains a gstreamer invocation to generate such
>> trigger condition input data:
>>
>> [PATCH] media: verisilicon: Do not enable G2 postproc downscale if
>> source is narrower than destination
>>
>> "
>> To generate input test data to trigger this bug, use e.g.:
>> $ gst-launch-1.0 videotestsrc !
>> video/x-raw,width=272,height=256,format=I420 ! \
>>                    vp9enc ! matroskamux ! filesink location=/tmp/test.vp9
>> To trigger the bug upon decoding (note that the NV12 must be forced, as
>> that assures the output data would pass the G2 postproc):
>> $ gst-launch-1.0 filesrc location=/tmp/test.vp9 ! matroskademux !
>> vp9parse ! \
>>                    v4l2slvp9dec ! video/x-raw,format=NV12 ! videoconvert
>> ! fbdevsink
>> "
> 
> Does it completely recover afterwards? In my previous trials the hardware
> ended up in some bizzare state: while decoding succeeds, the output's md5sum
> didn't match up.

Have you got a testcase that triggers this, one I can try ?

I am not entirely sure whether this is happening here as well or not, 
but I can imagine that the power domain went down and back up between 
tests, so the VPU would be power cycled (and therefore reset) that way. 
So, I think it is worth testing that.
