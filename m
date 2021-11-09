Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A13F44A9A3
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 09:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244486AbhKIItp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 03:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244481AbhKIIto (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 03:49:44 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A0EBC061764;
        Tue,  9 Nov 2021 00:46:58 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 1D8A11F44A93
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636447617; bh=GySPsgHaKHrbESaRknpPqJF3dfnlOanZggmDxueWuAY=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=Bso2Z5D1IbJa9dLWHgk6/zlDzpD6MXQzyRIT2GOEbs9Qi31+WEwrythdC2Ao7Iabh
         Rt8akCUOB+Y9tWDh05UKiLlh6SBVzEW5ofb+twAyF1VVTHn3hbd6DmFY3AzhnTbqCx
         7S9hJ4GfBN7k5gWGJw+7KbM7J/1GdGDkMoDN0O5Qa/E52Ikjzm9qh5cm4dmZRwY/AU
         32BXQ6CzxvgmuAHriZGVppDWpxP7ffl5xIGXsY9c43hC9Jlj3jax2dPKClktF+01iY
         zPlZqLXAhYI5wSW/MAvQ7yPm5slnJ60U4Ki1Ub5CGuqLOdRGlAtErZo5+zsngvgGiy
         +QHrr+RO6+EjQ==
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     Irui Wang <irui.wang@mediatek.com>,
        houlong wei <houlong.wei@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= 
        <Andrew-CT.Chen@mediatek.com>,
        =?UTF-8?B?TWluZ2hzaXUgVHNhaSAo6JSh5piO5L+uKQ==?= 
        <Minghsiu.Tsai@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
 <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
 <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
 <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
 <c01c2c6e2351c915fb6e55b025bf2ab5c449f045.camel@mediatek.com>
 <8dfc07306b853126e8109fc953fd6388b63c65d2.camel@mediatek.com>
 <4e7ff420-f67d-5d4a-8733-f4b83d80af13@collabora.com>
Message-ID: <428f216d-cdff-e22d-b96e-f9dd9cc158e3@collabora.com>
Date:   Tue, 9 Nov 2021 10:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4e7ff420-f67d-5d4a-8733-f4b83d80af13@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 03.11.21 13:04, Dafna Hirschfeld wrote:
> 
> 
> On 03.11.21 10:19, Irui Wang wrote:
>> Hi,
>>
>> The "len" of share_buf copied should be always 8 alignment;
>> do you have other logs to prove the len is not 8 alignment when errors
>> appear?
> 
> Hi, I found out that "sizeof(mdp_ipi_comm) = 20"
> this is due to the macro #pragma pack(push, 4) in mtk_mdp_ipi.h
> 
> see [1]
> 
> [1] http://lkml.iu.edu/hypermail/linux/kernel/2109.2/04978.html
> 

Hi Irui Wang,
Any update regarding that patch?
Can you give more explanation for that errors that we see
when the buffer size is not a multiple of 8?

Thanks,
Dafna

> Thanks,
> Dafna
> 
>>>> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>>
>> On Wed, 2021-11-03 at 16:03 +0800, houlong wei wrote:
>>> Add mtk-vpu driver expert irui.wang in the loop.
>>>
>>> On Mon, 2021-10-18 at 15:07 +0800, Dafna Hirschfeld wrote:
>>>>
>>>> On 18.10.21 03:16, Alexandre Courbot wrote:
>>>>> Hi Hans!
>>>>>
>>>>> On Mon, Oct 4, 2021 at 6:37 PM Hans Verkuil <hverkuil@xs4all.nl>
>>>>> wrote:
>>>>>>
>>>>>> On 20/09/2021 19:04, Dafna Hirschfeld wrote:
>>>>>>> From: Alexandre Courbot <acourbot@chromium.org>
>>>>>>>
>>>>>>> When running memcpy_toio:
>>>>>>> memcpy_toio(send_obj->share_buf, buf, len);
>>>>>>> it was found that errors appear if len is not a multiple of
>>>>>>> 8:
>>>>>>>
>>>>>>> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>>>>>>
>>>>>> Why do errors appear? Is that due to a HW bug? Some other
>>>>>> reason?
>>>>>
>>>>> MTK folks would be the best placed to answer this, but since the
>>>>> failure is reported by the firmware I'd suspect either a firmware
>>>>> or
>>>>> hardware limitation.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> This patch ensures the copy of a multiple of 8 size by
>>>>>>> calling
>>>>>>> round_up(len, 8) when copying
>>>>>>>
>>>>>>> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access
>>>>>>> to
>>>>>>> DTCM buffer.")
>>>>>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>>>>>> Signed-off-by: Enric Balletbo i Serra <
>>>>>>> enric.balletbo@collabora.com>
>>>>>>> Signed-off-by: Dafna Hirschfeld <
>>>>>>> dafna.hirschfeld@collabora.com
>>>>>>>>
>>>>>>>
>>>>>>> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
>>>>>>> ---
>>>>>>> changes since v3:
>>>>>>> 1. multile -> multiple
>>>>>>> 2. add inline doc
>>>>>>>
>>>>>>> changes since v2:
>>>>>>> 1. do the extra copy only if len is not multiple of 8
>>>>>>>
>>>>>>> changes since v1:
>>>>>>> 1. change sign-off-by tags
>>>>>>> 2. change values to memset
>>>>>>>
>>>>>>>    drivers/media/platform/mtk-vpu/mtk_vpu.c | 15
>>>>>>> ++++++++++++++-
>>>>>>>    1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>>>>>> b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>>>>>> index ec290dde59cf..1df031716c8f 100644
>>>>>>> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>>>>>> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>>>>>> @@ -349,7 +349,20 @@ int vpu_ipi_send(struct platform_device
>>>>>>> *pdev,
>>>>>>>                 }
>>>>>>>         } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>>>>>>>
>>>>>>> -     memcpy_toio(send_obj->share_buf, buf, len);
>>>>>>> +     /*
>>>>>>> +      * when copying data to the vpu hardware, the
>>>>>>> memcpy_toio
>>>>>>> operation must copy
>>>>>>> +      * a multiple of 8. Otherwise the processing fails
>>>>>>
>>>>>> Same here: it needs to explain why the processing fails.
>>>>
>>>> Is writing 'due to hardware or firmware limitation' enough?
>>>> If not, then we should wait for mediatek people's response to
>>>> explain
>>>> if they know more
>>>>
>>>>>>
>>>>>>> +      */
>>>>>>> +     if (len % 8 != 0) {
>>>>>>> +             unsigned char data[SHARE_BUF_SIZE];
>>>>>>
>>>>>> Wouldn't it be more robust if you say:
>>>>>>
>>>>>>                   unsigned char data[sizeof(send_obj-
>>>>>>> share_buf)];
>>>>>
>>>>> Definitely yes.
>>>>
>>>> I'll send v5 fixing this
>>>>
>>>>>
>>>>>>
>>>>>> I also think that the SHARE_BUF_SIZE define needs a comment
>>>>>> stating that it must be a
>>>>>> multiple of 8, otherwise unexpected things can happen.
>>>>>>
>>>>>> You also noticed that the current SHARE_BUF_SIZE define is too
>>>>>> low, but I saw
>>>>>> no patch correcting this. Shouldn't that be fixed as well?
>>>>>
>>>>> AFAICT the firmware expects this exact size on its end, so I
>>>>> don't
>>>>> believe it can be changed that easily. But maybe someone from MTK
>>>>> can
>>>>> prove me wrong.
>>>>>
>>>>
>>>> I looked further and noted that the structs that are larger than
>>>> 'SHARE_BUF_SIZE'
>>>> (venc_ap_ipi_msg_enc_ext venc_ap_ipi_msg_set_param_ext)
>>>> are used by drivers that don't use this vpu api, so actually
>>>> SHARE_BUF_SIZE is
>>>> not too low and as Corurbot worte probably not changeable.
>>>>
>>>>
>>>> Thanks,
>>>> Dafna
>>>>
>>>>> Cheers,
>>>>> Alex.
>>>>>
>>>
>>>
