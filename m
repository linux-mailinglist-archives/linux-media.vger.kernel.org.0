Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA33431101
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 09:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbhJRHJ0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 03:09:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58514 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhJRHJ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 03:09:26 -0400
Received: from [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6] (unknown [IPv6:2a02:810a:880:f54:88bb:da86:4533:43d6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 06E181F42612;
        Mon, 18 Oct 2021 08:07:13 +0100 (BST)
Subject: Re: [PATCH v4] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
References: <20210920170408.1561-1-dafna.hirschfeld@collabora.com>
 <c59b7f40-d99e-370a-b797-5dc72979df46@xs4all.nl>
 <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <9475ac5b-79fe-da0e-ed1c-a91275cad46e@collabora.com>
Date:   Mon, 18 Oct 2021 09:07:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPBb6MW_i1_Lh2ZaF8jGjcV-4XBhjswtyKkZCk3HxKO7LX79Og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 18.10.21 03:16, Alexandre Courbot wrote:
> Hi Hans!
> 
> On Mon, Oct 4, 2021 at 6:37 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>
>> On 20/09/2021 19:04, Dafna Hirschfeld wrote:
>>> From: Alexandre Courbot <acourbot@chromium.org>
>>>
>>> When running memcpy_toio:
>>> memcpy_toio(send_obj->share_buf, buf, len);
>>> it was found that errors appear if len is not a multiple of 8:
>>>
>>> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
>>
>> Why do errors appear? Is that due to a HW bug? Some other reason?
> 
> MTK folks would be the best placed to answer this, but since the
> failure is reported by the firmware I'd suspect either a firmware or
> hardware limitation.
> 
>>
>>>
>>> This patch ensures the copy of a multiple of 8 size by calling
>>> round_up(len, 8) when copying
>>>
>>> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
>>> ---
>>> changes since v3:
>>> 1. multile -> multiple
>>> 2. add inline doc
>>>
>>> changes since v2:
>>> 1. do the extra copy only if len is not multiple of 8
>>>
>>> changes since v1:
>>> 1. change sign-off-by tags
>>> 2. change values to memset
>>>
>>>   drivers/media/platform/mtk-vpu/mtk_vpu.c | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>> index ec290dde59cf..1df031716c8f 100644
>>> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
>>> @@ -349,7 +349,20 @@ int vpu_ipi_send(struct platform_device *pdev,
>>>                }
>>>        } while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>>>
>>> -     memcpy_toio(send_obj->share_buf, buf, len);
>>> +     /*
>>> +      * when copying data to the vpu hardware, the memcpy_toio operation must copy
>>> +      * a multiple of 8. Otherwise the processing fails
>>
>> Same here: it needs to explain why the processing fails.

Is writing 'due to hardware or firmware limitation' enough?
If not, then we should wait for mediatek people's response to explain if they know more

>>
>>> +      */
>>> +     if (len % 8 != 0) {
>>> +             unsigned char data[SHARE_BUF_SIZE];
>>
>> Wouldn't it be more robust if you say:
>>
>>                  unsigned char data[sizeof(send_obj->share_buf)];
> 
> Definitely yes.

I'll send v5 fixing this

> 
>>
>> I also think that the SHARE_BUF_SIZE define needs a comment stating that it must be a
>> multiple of 8, otherwise unexpected things can happen.
>>
>> You also noticed that the current SHARE_BUF_SIZE define is too low, but I saw
>> no patch correcting this. Shouldn't that be fixed as well?
> 
> AFAICT the firmware expects this exact size on its end, so I don't
> believe it can be changed that easily. But maybe someone from MTK can
> prove me wrong.
> 

I looked further and noted that the structs that are larger than 'SHARE_BUF_SIZE'
(venc_ap_ipi_msg_enc_ext venc_ap_ipi_msg_set_param_ext)
are used by drivers that don't use this vpu api, so actually SHARE_BUF_SIZE is
not too low and as Corurbot worte probably not changeable.


Thanks,
Dafna

> Cheers,
> Alex.
> 
