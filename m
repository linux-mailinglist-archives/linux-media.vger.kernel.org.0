Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A40497301
	for <lists+linux-media@lfdr.de>; Sun, 23 Jan 2022 17:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238324AbiAWQbV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Jan 2022 11:31:21 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34872 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238314AbiAWQbU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Jan 2022 11:31:20 -0500
Received: from [IPv6:2a00:c281:1137:e00:10b6:f074:cd3:20ae] (unknown [IPv6:2a00:c281:1137:e00:10b6:f074:cd3:20ae])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9E45E1F43637;
        Sun, 23 Jan 2022 16:31:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1642955479;
        bh=md0xp/AGdMiZMYjcnuuDrbPzJyr4QBDP+UpMtq+KUNU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KSyZ96uuz/ZHBO++CzBfy9c7tKYewL5BCZ4IM03weCdTdQRCDhYCxZpQBBA8mGC0r
         QqF/BRXbjUMynu316mMPdtKERcyBtz5jBpxR8ldXFE8ZcqY8AiubPaR6TpI8ktGE6J
         Ygp1oxbHQ+t3LpT2zHRZZIjzzJ0LOmx8B8GCTGmA0lq1A0Ysd7ZsWbfCKLUj3JuJ4I
         jsus7zbLxpC5nRZx+uGmUDO9jKAKQqJWiUnNXw9QUiT35UAHz1LbV9lYkoTI/Ahkvx
         Yl49dJOdwvFGWUklzYSZFrdvyBUYPhsG6Zd6QXGnllIqUm++XXfKOOIkDm1DSyGBQk
         O9cw8HtuXl5CA==
Subject: Re: [PATCH v2] media: rkisp1: fix grey format iommu page faults
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-media@vger.kernel.org, nicolas.dufresne@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20211207115923.13639-1-dafna.hirschfeld@collabora.com>
 <164241927947.10801.12217816997308426483@Monstersaurus>
 <1f8350f4-a2dc-5405-b48b-e657124f119d@collabora.com>
 <Ye1nFVYP8/GS6UBC@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e1acdb99-759d-6efe-ec5e-c07f2cd81cda@collabora.com>
Date:   Sun, 23 Jan 2022 18:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ye1nFVYP8/GS6UBC@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 23.01.22 16:32, Laurent Pinchart wrote:
> Hi Dafna,
> 
> On Sun, Jan 23, 2022 at 11:50:26AM +0200, Dafna Hirschfeld wrote:
>> On 17.01.22 13:34, Kieran Bingham wrote:
>>> Quoting Dafna Hirschfeld (2021-12-07 11:59:23)
>>>> Currently capturing grey format produces page faults
>>>> on both selfpath and mainpath. To support greyscale
>>>> we can capture YUV422 planar format and configure the U, V
>>>> buffers to the dummy buffer.
>>>>
>>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>>> ---
>>>> This is v2 of the patch "media: rkisp1: remove support for V4L2_PIX_FMT_GREY"
>>>> In v1 I removed the grey format. In this version it is 'fixed'
>>>>
>>>>    .../platform/rockchip/rkisp1/rkisp1-capture.c | 28 ++++++++++++++-----
>>>>    1 file changed, 21 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> index 768987d5f2dd..8e982dd0c740 100644
>>>> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
>>>> @@ -249,7 +249,7 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>>>>                   .fourcc = V4L2_PIX_FMT_GREY,
>>>>                   .uv_swap = 0,
>>>>                   .write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
>>>> -               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
>>>> +               .output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>>>>                   .mbus = MEDIA_BUS_FMT_YUYV8_2X8,
>>>>           },
>>>>           /* rgb */
>>>> @@ -631,12 +631,26 @@ static void rkisp1_set_next_buf(struct rkisp1_capture *cap)
>>>>                   rkisp1_write(cap->rkisp1,
>>>>                                buff_addr[RKISP1_PLANE_Y],
>>>>                                cap->config->mi.y_base_ad_init);
>>>> -               rkisp1_write(cap->rkisp1,
>>>> -                            buff_addr[RKISP1_PLANE_CB],
>>>> -                            cap->config->mi.cb_base_ad_init);
>>>> -               rkisp1_write(cap->rkisp1,
>>>> -                            buff_addr[RKISP1_PLANE_CR],
>>>> -                            cap->config->mi.cr_base_ad_init);
>>>> +               /*
>>>> +                * In order to support grey format we capture
>>>> +                * YUV422 planar format from the camera and
>>>> +                * set the U and V planes to the dummy buffer
>>>> +                */
>>>> +               if (cap->pix.cfg->fourcc == V4L2_PIX_FMT_GREY) {
>>>> +                       rkisp1_write(cap->rkisp1,
>>>> +                                    cap->buf.dummy.dma_addr,
>>>> +                                    cap->config->mi.cb_base_ad_init);
>>>> +                       rkisp1_write(cap->rkisp1,
>>>> +                                    cap->buf.dummy.dma_addr,
>>>> +                                    cap->config->mi.cr_base_ad_init);
>>>> +               } else {
>>>> +                       rkisp1_write(cap->rkisp1,
>>>> +                                    buff_addr[RKISP1_PLANE_CB],
>>>> +                                    cap->config->mi.cb_base_ad_init);
>>>> +                       rkisp1_write(cap->rkisp1,
>>>> +                                    buff_addr[RKISP1_PLANE_CR],
>>>> +                                    cap->config->mi.cr_base_ad_init);
>>>> +               }
>>>>           } else {
>>>
>>> Looking at this function, I think I would have initialised a local array
>>> of addresses (either to zero, or to the dummy address?) to then set
>>> values when appropriate, and reduce the number of calls to
>>> rkisp1_write() to a single set of three after the processing.
>>>
>>> It might make the function simpler, and more readable, but it's more
>>> effort, and this does look like it will solve the greyscale format issue
>>> as discussed in earlier threads so I'd leave it up to you if you want to
>>> refactor.
>>
>> Hi,
>> Yes, I'll do that.
>> Interestingly I found out that the patch causing the iommu page fault is
>>
>> https://www.spinics.net/lists/linux-media/msg176089.html
>>
>> Before that patch there are no iommu page faults but the video is corrupted.
>>
>> I can't explain how I didn't find it before, I clearly remember testing the grey format.
> 
> It seems really weird indeed.
> 
> Are you getting IOMMU faults on both the main and self paths ?

Yes, both pathes. I get the page faults when checking out to this commit.
Maybe when I tested back then, the iommu was somehow disabled?

> 
>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>>>                   /*
>>>>                    * Use the dummy space allocated by dma_alloc_coherent to
> 
