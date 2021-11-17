Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D2A454478
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 10:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235808AbhKQKCd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235754AbhKQKC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 05:02:29 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48977C061570;
        Wed, 17 Nov 2021 01:59:31 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id nHirmNgQd1HGJnHiumpHcJ; Wed, 17 Nov 2021 10:59:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1637143169; bh=Q57bTarpphqLLfnykx8xjliEzWZFY1oyWctGEoHcx4c=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MoB2V/5js2Vzzg6hnXQTnSWGihk1rbOrBzXqUlU/qoXelomDUu1MMkbtSui95NMMk
         TAQCevcQ2IZ6gwaWgRGSCYirBOa4FalCkpT2q6m5Zh3EV+vCeTFJfizWcJu/jc+HYz
         z634GrynK8HBFVh8VI5hqoenE8ly0adrtVu33dKJb1hUhbly+swJ5EjttzpBu9DM2s
         +zu2Mvy5uJGGu+ST+/0jWy5XMkymp7xpFphT3yKbLTUTHLOHWlYYj0Ovw8NdilpdGK
         jK2PfyHZ8GAri7PeUhHGgGVri4FDywsmN1RY2DRQom4DOd64ntdOnMWlO0EpQ3NpDT
         zieXyq1vQlW6Q==
Subject: Re: [PATCH v7 00/11] VP9 codec V4L2 control interface
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
References: <20210929160439.6601-1-andrzej.p@collabora.com>
 <9db47ebc-cb95-872d-feb4-d6432a74f2cb@xs4all.nl>
 <29f27bad-28ae-12ff-eed6-79902bd5b722@collabora.com>
 <b8f8ee2e-ea98-4700-f4ca-f0af68c9de5c@xs4all.nl>
 <cdbbe5e6-0811-1276-1f62-fc7ad2628a30@collabora.com>
 <4da113ef-7b12-3729-0186-f746901c892a@xs4all.nl>
 <69f16bb0-4b5a-18b3-e244-60deb029d239@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <2cd7a7f0-72d6-1a0e-b5d2-87ff809c2acd@xs4all.nl>
Date:   Wed, 17 Nov 2021 10:59:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <69f16bb0-4b5a-18b3-e244-60deb029d239@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJfoI4N+VQeaXH3/XH5UsnvheyRxmRBR+FkxY+czh5yv1C5Bw3BQJm94bvBkiLAIy5gW2fB5PqOM//YNmZMfKRK9FpVOCe7+BSPBpf25mylyVsFFfknS
 q7MB71BmvNKuVBxkxU86PXjxtG+hAyggsUFRECUt4JEe9z0CFbMh5lQ0YhhW1toItPrJHbaZ+asxItagcq4namTUFNtMi9hRfJ+F1cW2qD60Mmccu7thd9PL
 TGJjFABdepRojBLVIz1zK70tQx+HKYa7ad7m0JuO8muAH4OnqgoI5NrU6Pw+YGwdlAOoy6iVaO6kw/+PDqMUrtmzbu7xfa5asa0FOaXxcc667q7lmfsNtuwp
 fwPxeffRqurCj/PH2q3+ns48PGkPXyqSws3IRCxNSz3d63E0qsuKDnDNJGs/bepYf27FYU7kHp7sowcuUVHgLn3mkijuMD8IvEUbNnsu2iBXN+Ukn0BUzziQ
 qwhaJzeGaX+RFYfjSZExFnFquIV+6KFUf+x/uKK3Hu4gvmyRVy8RVn1tSg+etGgqKZm59NIbSF39zajF39LiDIr9XblIergyEG232PhjJooXETzNLg2W3kTm
 bTBqFGycSsXIZe5OVjYRlUxHyyu7JyLPjzDFzVtbF5uHvBJ0ZozRvxwy/mrlpPDzog+b70Tvmpn1rBccscpdKEa5afszo2BaQRaDsSf05jvexJMMHd3mPQ3Z
 rJAWEsAhPzvlAv1173jln8TXMejkLKAut2xWgpvMo3rFftXmSSgbdS/GgkAnPXSxO3VzyMPHDcseL3LvHgrXhV/MnB9vnENVsHHB4d7ztGhacja2zorj+VEf
 FJ6K7gDuUtm483T3PJ0p/l/PLY92gUKBCTUQmFuwfDh3zrzuWQSpkxmUDJlyRh/b0zHNQwRm+7ZTwz8FE3VTxsdaSB48fdo4wKDQDoNFdbq7fQjftNHl8s5H
 eL6NHxm75mk3T5JP8JFvUGTyrGQ=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2021 14:14, Andrzej Pietrasiewicz wrote:
> Hi,
> 
> W dniu 16.11.2021 o 09:21, Hans Verkuil pisze:
>> On 16/11/2021 09:09, Andrzej Pietrasiewicz wrote:
>>> Hi Hans,
>>>
>>> W dniu 15.11.2021 o 22:16, Hans Verkuil pisze:
>>>> On 15/11/2021 18:14, Andrzej Pietrasiewicz wrote:
>>>>> Hi Hans,
>>>>>
>>>>> W dniu 15.11.2021 o 16:07, Hans Verkuil pisze:
>>>>>> Andrzej,
>>>>>>
>>>>>> Can you rebase this series on top of the master branch of
>>>>>> https://git.linuxtv.org/media_stage.git/ ? Unfortunately this v7 no longer
>>>>>> applies. Specifically "rkvdec: Add the VP9 backend" failed in a non-trivial
>>>>>> manner.
>>>>>
>>>>> This is a branch for you:
>>>>>
>>>>> https://gitlab.collabora.com/linux/for-upstream/-/tree/vp9-uapi
>>>>
>>>> I'm getting a bunch of sparse/smatch warnings:
>>>>
>>>
>>> Thanks for finding this, I will re-create the branch and let you know on irc.
>>> Some of the below are "false positives, namely:
>>>
>>> drivers/media/platform/omap3isp/omap3isp.h
>>> drivers/media/platform/qcom/venus/core.h
>>
>> Ah, sorry, I though I had filtered those out. Obviously you can ignore those.
>>
>> Please post a v8. That way the series is archived on lore. And it works better
>> with patchwork.
> 
> Sure, no problem. Also please see below.
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>> which are not touched by the series.
>>>
>>> Regards,
>>>
>>> Andrzej
>>>
>>>> sparse:
>>>> rkvdec/rkvdec-vp9.c:190:43: warning: variable 'dec_params' set but not used [-Wunused-but-set-variable]
>>>> rkvdec/rkvdec-vp9.c:245:43: warning: variable 'dec_params' set but not used [-Wunused-but-set-variable]
>>>> SPARSE:hantro/hantro_postproc.c hantro/hantro_postproc.c:37:35: warning: symbol 'hantro_g1_postproc_regs' was not declared. Should it be static?
>>>>
>>>> smatch:
>>>> rkvdec/rkvdec-vp9.c:190:43: warning: variable 'dec_params' set but not used [-Wunused-but-set-variable]
>>>> rkvdec/rkvdec-vp9.c:245:43: warning: variable 'dec_params' set but not used [-Wunused-but-set-variable]
>>>> rkvdec/rkvdec-vp9.c: rkvdec/rkvdec-vp9.c:236 init_intra_only_probs() error: buffer overflow 'ptr' 90 <= 91
> 
> this looks a false positive.
> 
> A portion of memory pointed to by ptr is indexed with i * 23 + m,
> where i ranges from 0 to 3, inclusive, and m ranges from 0 to 22,
> inclusive if i < 3, otherwise m ranges from 0 to 20, inclusive.
> So the largest index value we compute equals 89 (3 * 23 + 20).
> Because ptr points to something that is at least 90 bytes large,
> 89 is a valid index and no greater index will be ever computed.

But we do need to get rid of this smatch warning, otherwise it will pollute the
list of smatch warnings.

I was looking at the code and wonder if it wouldn't make more sense to
move writing to rkprobs->intra_mode[i].uv_mode[] into a separate for loop:

        for (i = 0; i < ARRAY_SIZE(v4l2_vp9_kf_uv_mode_prob); i++)
                rkprobs->intra_mode[i / 23].uv_mode[i % 23] = v4l2_vp9_kf_uv_mode_prob[i];

Wouldn't that do the same as the current code? It looks simpler as well.

Regards,

	Hans
