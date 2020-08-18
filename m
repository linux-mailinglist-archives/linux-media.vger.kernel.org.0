Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8945C247E9D
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 08:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgHRGqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 02:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgHRGqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 02:46:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69EFC061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 23:46:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 6E036298A17
Subject: Re: [PATCH v2 10/14] media: staging: rkisp1: isp: add a warning and
 debugfs var for irq delay
To:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-11-dafna.hirschfeld@collabora.com>
 <9a062761-84e0-d4e8-a909-53898562649a@collabora.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <04b3fab5-5501-058c-9145-ebbbe851eb94@collabora.com>
Date:   Tue, 18 Aug 2020 08:46:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9a062761-84e0-d4e8-a909-53898562649a@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 17.08.20 um 23:48 schrieb Helen Koike:
> Hi Dafna,
> 
> On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
>> The signal RKISP1_CIF_ISP_FRAME is set when the ISP completes
>> outputting the frame to the next block in the pipeline.
>> In order to keep buffer synchronization we assume that the
>> RKISP1_CIF_ISP_V_START signal never arrives together with the
>> RKISP1_CIF_ISP_FRAME signal.
>> In case those signals arrive together then the code is not able to
>> tell if the RKISP1_CIF_ISP_FRAME signal relates to the frame of
>> the current v-start or the previous. This patch adds a WARN_ONCE
>> and a debugfs var to catch it.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-common.h | 1 +
>>   drivers/staging/media/rkisp1/rkisp1-dev.c    | 2 ++
>>   drivers/staging/media/rkisp1/rkisp1-isp.c    | 5 +++++
>>   3 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>> index 79edece6ee77..5aed0e37850a 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>> @@ -228,6 +228,7 @@ struct rkisp1_debug {
>>   	unsigned long outform_size_error;
>>   	unsigned long img_stabilization_size_error;
>>   	unsigned long inform_size_error;
>> +	unsigned long irq_delay;
>>   	unsigned long mipi_error;
>>   	unsigned long stats_error;
>>   	unsigned long stop_timeout[2];
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-dev.c b/drivers/staging/media/rkisp1/rkisp1-dev.c
>> index a0eb8f08708b..557de940286b 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-dev.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-dev.c
>> @@ -445,6 +445,8 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>>   			     &debug->img_stabilization_size_error);
>>   	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
>>   			     &debug->inform_size_error);
>> +	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
>> +			     &debug->irq_delay);
>>   	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
>>   			     &debug->mipi_error);
>>   	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
>> index 1ffe7cc7bb12..33cfad19dde2 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-isp.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
>> @@ -1118,6 +1118,11 @@ void rkisp1_isp_isr(struct rkisp1_device *rkisp1)
>>   		 */
>>   		rkisp1->isp.frame_sequence++;
>>   		rkisp1_isp_queue_event_sof(&rkisp1->isp);
>> +		if (status & RKISP1_CIF_ISP_FRAME) {
>> +			WARN_ONCE(1, "irq delay is too long, buffers might not be in sync\n");
>> +			rkisp1->debug.irq_delay++;
>> +		}
>> +	}
> 
> I was wondering, if both interrupts arrive at the same time, shouldn't we handle the
> frame before incrementing the frame_sequence?
> 
> I mean, move the code block
> 
> 	if (status & RKISP1_CIF_ISP_V_START) {...}
> 
> after this other code block
> 
> 	if (status & RKISP1_CIF_ISP_FRAME) {...}

When the two interrupts arrive together it is not clear if the frame interrupt belongs
to the current v-start or the previous one, this is why I added this debugfs var.
So it is a bit of guessing what should be done first. Maybe changing the order is generally
more correct. I discussed that with Tomasz https://patchwork.kernel.org/patch/11066513/#23544763

Thanks,
Dafna

> 
> 
> Thanks,
> Helen
> 
>>   
>>   	if (status & RKISP1_CIF_ISP_PIC_SIZE_ERROR) {
>>   		/* Clear pic_size_error */
>>
