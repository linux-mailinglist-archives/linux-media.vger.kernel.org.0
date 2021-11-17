Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DACA6454536
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 11:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbhKQKyM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 05:54:12 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47338 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbhKQKyM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 05:54:12 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 28B251F45D5B
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637146272; bh=F8kJsKyO3eNjl+hyFQQSyGJyEnjC26LZMm295j7R78w=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=Tvn80Aby5gCkhmtEN9nfr7LcgoNlBfw1cLIvGsVAkalU/ruW9O41li8Qbc4IBJIRe
         QRaq9lp1xkF5bkNWQIqUKBI5xUHfQqyT0o4ZG960Hbvo0dT/egkpgx8f05aeTiYpr7
         zSukR28HiY6i2x7FnM1MFTFUJflU/6WOwgXkH8UtTNu/VPtk/CWfjEIlBdsqzpL5tQ
         iO58QPhMYl+pJBqD9um9knZKKfbDgDsJvBI1KE0ZZh03TJnsmux0mknnwxPCFvn1GZ
         sHxWBVFKgRLALmGnabagIjem07uoLpsfG3M7e9PpJmsGG9akSU7mC/mESDNtIXiWKU
         ldAjx0VMlCiIg==
Subject: Re: [PATCH v7 00/11] VP9 codec V4L2 control interface
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
 <2cd7a7f0-72d6-1a0e-b5d2-87ff809c2acd@xs4all.nl>
 <63429780-9e39-f8ab-40c2-0f1b57553850@collabora.com>
Message-ID: <ccc29c1f-e2a1-f7c9-77ad-6e9fc1a57c95@collabora.com>
Date:   Wed, 17 Nov 2021 11:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <63429780-9e39-f8ab-40c2-0f1b57553850@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi again,

W dniu 17.11.2021 o 11:49, Andrzej Pietrasiewicz pisze:
> Hi,
> 
> W dniu 17.11.2021 o 10:59, Hans Verkuil pisze:
>> On 16/11/2021 14:14, Andrzej Pietrasiewicz wrote:
>>> Hi,
>>>
>>> W dniu 16.11.2021 o 09:21, Hans Verkuil pisze:
>>>> On 16/11/2021 09:09, Andrzej Pietrasiewicz wrote:
>>>>> Hi Hans,
>>>>>
>>>>> W dniu 15.11.2021 o 22:16, Hans Verkuil pisze:
>>>>>> On 15/11/2021 18:14, Andrzej Pietrasiewicz wrote:
>>>>>>> Hi Hans,
>>>>>>>
>>>>>>> W dniu 15.11.2021 o 16:07, Hans Verkuil pisze:
>>>>>>>> Andrzej,
>>>>>>>>
>>>>>>>> Can you rebase this series on top of the master branch of
>>>>>>>> https://git.linuxtv.org/media_stage.git/ ? Unfortunately this v7 no longer
>>>>>>>> applies. Specifically "rkvdec: Add the VP9 backend" failed in a non-trivial
>>>>>>>> manner.
>>>>>>>
>>>>>>> This is a branch for you:
>>>>>>>
>>>>>>> https://gitlab.collabora.com/linux/for-upstream/-/tree/vp9-uapi
>>>>>>
>>>>>> I'm getting a bunch of sparse/smatch warnings:
>>>>>>
>>>>>
>>>>> Thanks for finding this, I will re-create the branch and let you know on irc.
>>>>> Some of the below are "false positives, namely:
>>>>>
>>>>> drivers/media/platform/omap3isp/omap3isp.h
>>>>> drivers/media/platform/qcom/venus/core.h
>>>>
>>>> Ah, sorry, I though I had filtered those out. Obviously you can ignore those.
>>>>
>>>> Please post a v8. That way the series is archived on lore. And it works better
>>>> with patchwork.
>>>
>>> Sure, no problem. Also please see below.
>>>
>>>>
>>>> Regards,
>>>>
>>>>     Hans
>>>>
>>>>>
>>>>> which are not touched by the series.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Andrzej
>>>>>
>>>>>> sparse:
>>>>>> rkvdec/rkvdec-vp9.c:190:43: warning: variable 'dec_params' set but not 
>>>>>> used [-Wunused-but-set-variable]
>>>>>> rkvdec/rkvdec-vp9.c:245:43: warning: variable 'dec_params' set but not 
>>>>>> used [-Wunused-but-set-variable]
>>>>>> SPARSE:hantro/hantro_postproc.c hantro/hantro_postproc.c:37:35: warning: 
>>>>>> symbol 'hantro_g1_postproc_regs' was not declared. Should it be static?
>>>>>>
>>>>>> smatch:
>>>>>> rkvdec/rkvdec-vp9.c:190:43: warning: variable 'dec_params' set but not 
>>>>>> used [-Wunused-but-set-variable]
>>>>>> rkvdec/rkvdec-vp9.c:245:43: warning: variable 'dec_params' set but not 
>>>>>> used [-Wunused-but-set-variable]
>>>>>> rkvdec/rkvdec-vp9.c: rkvdec/rkvdec-vp9.c:236 init_intra_only_probs() 
>>>>>> error: buffer overflow 'ptr' 90 <= 91
>>>
>>> this looks a false positive.
>>>
>>> A portion of memory pointed to by ptr is indexed with i * 23 + m,
>>> where i ranges from 0 to 3, inclusive, and m ranges from 0 to 22,
>>> inclusive if i < 3, otherwise m ranges from 0 to 20, inclusive.
>>> So the largest index value we compute equals 89 (3 * 23 + 20).
>>> Because ptr points to something that is at least 90 bytes large,
>>> 89 is a valid index and no greater index will be ever computed.
>>
>> But we do need to get rid of this smatch warning, otherwise it will pollute the
>> list of smatch warnings.
>>
>> I was looking at the code and wonder if it wouldn't make more sense to
>> move writing to rkprobs->intra_mode[i].uv_mode[] into a separate for loop:
>>
>>          for (i = 0; i < ARRAY_SIZE(v4l2_vp9_kf_uv_mode_prob); i++)
>>                  rkprobs->intra_mode[i / 23].uv_mode[i % 23] = 
>> v4l2_vp9_kf_uv_mode_prob[i];
>>
>> Wouldn't that do the same as the current code? It looks simpler as well.
>>
> 
> I think it would, but I would slightly change the loop:
>
>      for (i = 0; i < ARRAY_SIZE(v4l2_vp9_kf_uv_mode_prob); i++) {

actually, sizeof(v4l2_vp9_kf_uv_mode_prob)



>          const u8 *ptr = (const u8 *)v4l2_vp9_kf_uv_mode_prob;
> 
>          rkprobs->intra_mode[i / 23].uv_mode[i % 23] = ptr[i];
>      }
> 
> because v4l2_vp9_kf_uv_mode_prob is actually a u8[10][9].
> 
> I will make such a change locally and test whether it causes regressions.
> 
> Once I confirm it works (and I expect I will) would you like me to post a v9,
> only reply to the changed patch with its updated version or do you want to make 
> this change yourself?
> 
> Andrzej

