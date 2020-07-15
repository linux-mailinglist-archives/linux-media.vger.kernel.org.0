Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB36220652
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 09:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729379AbgGOHgT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 03:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729336AbgGOHgS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 03:36:18 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EEAC061755
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2020 00:36:18 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 26F0A2A4369
Subject: Re: [PATCH 4/4] media: staging: rkisp1: cap: in stream start, replace
 calls to rkisp1_handle_buffer with rkisp1_set_next_buf
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200714123832.28011-1-dafna.hirschfeld@collabora.com>
 <20200714123832.28011-5-dafna.hirschfeld@collabora.com>
 <01c025b1-6d8d-0c24-1303-848ce0438c75@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <4fe827dc-f240-dc20-59a2-4855e6edbfeb@collabora.com>
Date:   Wed, 15 Jul 2020 09:36:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <01c025b1-6d8d-0c24-1303-848ce0438c75@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 14.07.20 17:11, Helen Koike wrote:
> Hi Dafna,
> 
> Thanks for the patch, just a small thing below.
> 
> On 7/14/20 9:38 AM, Dafna Hirschfeld wrote:
>> The function 'rkisp1_stream_start' calls 'rkisp1_handle_buffer'
>> in order to update the 'buf.curr' and 'buf.next' fields and
>> configure the device before streaming starts. This cause a wrong
>> increment of the debugs field 'frame_drop'. This patch replaces
>> the call to 'rkisp1_handle_buffer' with a call to
>> 'rkisp1_set_next_buf'.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-capture.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> index 7f400aefe550..c05280950ea0 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
>> @@ -916,7 +916,7 @@ static void rkisp1_stream_start(struct rkisp1_capture *cap)
>>   	cap->ops->config(cap);
>>   
>>   	/* Setup a buffer for the next frame */
>> -	rkisp1_handle_buffer(cap);
>> +	rkisp1_set_next_buf(cap);
> 
> You should also protect with the cap->buf.lock, or move the lock protection to rkisp1_set_next_buf() and update patch 2/4.

I am not sure if protection here is needed. The streaming is not enabled yet, so
it is promised that we don't run the isr in parallel and ioctls are already synchronized by the framework
so I think it is safe not to use locking here , but I'm not sure actually.

Thanks,
Dafna


> 
> Regards,
> Helen
> 
>>   	cap->ops->enable(cap);
>>   	/* It's safe to config ACTIVE and SHADOW regs for the
>>   	 * first stream. While when the second is starting, do NOT
>> @@ -931,7 +931,7 @@ static void rkisp1_stream_start(struct rkisp1_capture *cap)
>>   		/* force cfg update */
>>   		rkisp1_write(rkisp1,
>>   			     RKISP1_CIF_MI_INIT_SOFT_UPD, RKISP1_CIF_MI_INIT);
>> -		rkisp1_handle_buffer(cap);
>> +		rkisp1_set_next_buf(cap);
>>   	}
>>   	cap->is_streaming = true;
>>   }
>>
