Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5214982A4
	for <lists+linux-media@lfdr.de>; Mon, 24 Jan 2022 15:44:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232037AbiAXOoD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jan 2022 09:44:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbiAXOoD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jan 2022 09:44:03 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA68CC06173B
        for <linux-media@vger.kernel.org>; Mon, 24 Jan 2022 06:44:02 -0800 (PST)
Received: from [IPv6:2a00:c281:1137:e00:5903:19ba:8e99:7984] (unknown [IPv6:2a00:c281:1137:e00:5903:19ba:8e99:7984])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0DDFD1F43871;
        Mon, 24 Jan 2022 14:43:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1643035440;
        bh=jPAzy1ewDSNoKBjRpfOQQoe2kl5I2JwThADGY/r2Snc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KN2J5dABfn9ac/Negk9KnKkxmCncc4701TjTm1QGlgOn6EH4FWj2NGSh5UGrFBUmD
         qaD97+BW8t9JIWXEqS8UFznRVWvUH1aXQIu1zB2x5rb2qJADNHtv89i/ZRSL50UKvl
         Hx6IprdnR6WD6arDdxxYHIuuv03BAoK5QVCLFwkTuJaehYpkd3MLnkyYm0Wse+zHWC
         y5eJcqNFHnwDDRSxxnPXG1GVdfpLZmJrEbwXvnCh6BGaVpdsp5YQGqMaFP86wisr5V
         8qbCCzo3y8jxw5RznPlVcTnjrQd38NWlrmcMzI6M/1muvSCbjmXeg3/8zFDqRJ9SBO
         Ddaels9tkXLmQ==
Subject: Re: [PATCH 3/3] media: stk1160: use dma_alloc_noncontiguous API
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, ribalda@chromium.org, tfiga@chromium.org,
        senozhatsky@google.com, hch@lst.de, kernel@collabora.com
References: <20220111065505.6323-1-dafna.hirschfeld@collabora.com>
 <20220111065505.6323-4-dafna.hirschfeld@collabora.com>
 <Yd16PXCDGwF5V7aK@eze-laptop>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <7f64ed7f-5076-1d22-1922-9d39515125a0@collabora.com>
Date:   Mon, 24 Jan 2022 16:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yd16PXCDGwF5V7aK@eze-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11.01.22 14:38, Ezequiel Garcia wrote:
> Hi Dafna,
> 
> Very nice work.
> 
> I specially like all the testing that you mentioned in the cover-letter.
> 
> Back in the day, there were a few users trying to use STK1160 (Easycap)
> with Beaglebone boards, without success due to lack of USB throughput.

Hi, what do you mean by "USB throughput" ?
I see that the FPS does not change with this patchset and stands on about 25 frames/sec
So this patchset only improve cpu time.

> 
> If anything else, I think it's good to see additional noncontiguous API users.
> 
> On Tue, Jan 11, 2022 at 08:55:05AM +0200, Dafna Hirschfeld wrote:
>> Replace the urb buffers allocation to
>> use the noncontiguous API. This improve performance
>> on Arm.
>> The noncontiguous API require handling
>> synchronization.
>> This commit is similar to the one sent to
>> uvc: [1]
>>
>> [1] https://lkml.org/lkml/2021/3/12/1506
>>
> 
> This commit description needs lots of attention. In particular,
> please add the test results here.
> 
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> ---
>>   drivers/media/usb/stk1160/stk1160-v4l.c   |   3 +
>>   drivers/media/usb/stk1160/stk1160-video.c | 109 +++++++++++++---------
>>   drivers/media/usb/stk1160/stk1160.h       |  10 ++
>>   3 files changed, 79 insertions(+), 43 deletions(-)
>>
> [..]
>> @@ -501,7 +524,7 @@ int stk1160_alloc_isoc(struct stk1160 *dev)
>>   
>>   free_i_bufs:
>>   	/* Save the allocated buffers so far, so we can properly free them */
>> -	dev->isoc_ctl.num_bufs = i+1;
>> +	dev->isoc_ctl.num_bufs = i;
> 
> This looks like a separate fix, similar to 1/3 ?
> 
>>   	stk1160_free_isoc(dev);
>>   	return -ENOMEM;
>>   }
>> diff --git a/drivers/media/usb/stk1160/stk1160.h b/drivers/media/usb/stk1160/stk1160.h
>> index 1ffca1343d88..52bea7815ae5 100644
>> --- a/drivers/media/usb/stk1160/stk1160.h
>> +++ b/drivers/media/usb/stk1160/stk1160.h
>> @@ -16,6 +16,8 @@
>>   #include <media/videobuf2-v4l2.h>
>>   #include <media/v4l2-device.h>
>>   #include <media/v4l2-ctrls.h>
>> +#include <linux/usb.h>
>> +#include <linux/usb/hcd.h>
>>   
>>   #define STK1160_VERSION		"0.9.5"
>>   #define STK1160_VERSION_NUM	0x000905
>> @@ -87,6 +89,9 @@ struct stk1160_buffer {
>>   struct stk1160_urb {
>>   	struct urb *urb;
>>   	char *transfer_buffer;
>> +	struct sg_table *sgt;
>> +	struct stk1160 *dev;
>> +	dma_addr_t dma;
>>   };
>>   
>>   struct stk1160_isoc_ctl {
>> @@ -190,3 +195,8 @@ void stk1160_select_input(struct stk1160 *dev);
>>   
>>   /* Provided by stk1160-ac97.c */
>>   void stk1160_ac97_setup(struct stk1160 *dev);
>> +
>> +static inline struct device *stk1160_get_dmadev(struct stk1160 *dev)
>> +{
>> +	return bus_to_hcd(dev->udev->bus)->self.sysdev;
> 
> This function looks truly horrible, is there no other way to get the device ?
> 
> I suppose this function return something different than (struct stk1160*)dev->dev ?

I remember I tried using this device and got an error that it is not cable of doing dma
allocations or something like that. The function "stk1160_get_dmadev" is a copy-paste from the
uvc equivalent:

static inline struct device *uvc_stream_to_dmadev(struct uvc_streaming *stream)
{
         return bus_to_hcd(stream->dev->udev->bus)->self.sysdev;
}

Thanks,
Dafna

> 
> Thanks,
> Ezequiel
> 
