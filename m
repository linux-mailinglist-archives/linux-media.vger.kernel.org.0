Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D2C22097C
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 12:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgGOKFC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 06:05:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59374 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgGOKFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 06:05:02 -0400
Received: from [IPv6:2804:14c:483:73a8::1001] (unknown [IPv6:2804:14c:483:73a8::1001])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ECE972A4AB4;
        Wed, 15 Jul 2020 11:04:54 +0100 (BST)
Subject: Re: [PATCH 4/4] media: staging: rkisp1: cap: in stream start, replace
 calls to rkisp1_handle_buffer with rkisp1_set_next_buf
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
 <20200714123832.28011-5-dafna.hirschfeld@collabora.com>
 <01c025b1-6d8d-0c24-1303-848ce0438c75@collabora.com>
 <4fe827dc-f240-dc20-59a2-4855e6edbfeb@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <a93da361-2de1-667c-2fa5-78bd65ccc6c4@collabora.com>
Date:   Wed, 15 Jul 2020 07:04:50 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4fe827dc-f240-dc20-59a2-4855e6edbfeb@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/15/20 4:36 AM, Dafna Hirschfeld wrote:
> Hi,
> 
> On 14.07.20 17:11, Helen Koike wrote:
>> Hi Dafna,
>>
>> Thanks for the patch, just a small thing below.
>>
>> On 7/14/20 9:38 AM, Dafna Hirschfeld wrote:
>>> The function 'rkisp1_stream_start' calls 'rkisp1_handle_buffer'
>>> in order to update the 'buf.curr' and 'buf.next' fields and
>>> configure the device before streaming starts. This cause a wrong
>>> increment of the debugs field 'frame_drop'. This patch replaces
>>> the call to 'rkisp1_handle_buffer' with a call to
>>> 'rkisp1_set_next_buf'.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> index 7f400aefe550..c05280950ea0 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>>> @@ -916,7 +916,7 @@ static void rkisp1_stream_start(struct rkisp1_capture *cap)
>>>       cap->ops->config(cap);
>>>         /* Setup a buffer for the next frame */
>>> -    rkisp1_handle_buffer(cap);
>>> +    rkisp1_set_next_buf(cap);
>>
>> You should also protect with the cap->buf.lock, or move the lock protection to rkisp1_set_next_buf() and update patch 2/4.
> 
> I am not sure if protection here is needed. The streaming is not enabled yet, so
> it is promised that we don't run the isr in parallel and ioctls are already synchronized by the framework
> so I think it is safe not to use locking here , but I'm not sure actually.

I was just wondering in case we re-start a stream quickly after stopping it, but since rkisp1_stream_stop() actually waits
for the hardware, so I don't think there is an issue indeed.

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> 
> Thanks,
> Dafna
> 
> 
>>
>> Regards,
>> Helen
>>
>>>       cap->ops->enable(cap);
>>>       /* It's safe to config ACTIVE and SHADOW regs for the
>>>        * first stream. While when the second is starting, do NOT
>>> @@ -931,7 +931,7 @@ static void rkisp1_stream_start(struct rkisp1_capture *cap)
>>>           /* force cfg update */
>>>           rkisp1_write(rkisp1,
>>>                    RKISP1_CIF_MI_INIT_SOFT_UPD, RKISP1_CIF_MI_INIT);
>>> -        rkisp1_handle_buffer(cap);
>>> +        rkisp1_set_next_buf(cap);
>>>       }
>>>       cap->is_streaming = true;
>>>   }
>>>
