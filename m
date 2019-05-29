Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E322E2CB
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 19:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfE2REs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 13:04:48 -0400
Received: from mga05.intel.com ([192.55.52.43]:52303 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbfE2REs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 13:04:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 29 May 2019 10:04:47 -0700
X-ExtLoop1: 1
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.254.17.80]) ([10.254.17.80])
  by orsmga004.jf.intel.com with ESMTP; 29 May 2019 10:04:46 -0700
Subject: Re: [PATCH v2 10/11] media: aspeed: fix an incorrect timeout checking
 in mode detection
To:     Eddie James <eajames@linux.vnet.ibm.com>,
        Eddie James <eajames@linux.ibm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:     linux-aspeed@lists.ozlabs.org, linux-media@vger.kernel.org
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
 <20190524231725.12320-11-jae.hyun.yoo@linux.intel.com>
 <50abcb27-30af-9dfc-3a53-4261832f272d@linux.vnet.ibm.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b28ff2a7-337d-bbb5-4177-9e0473f18102@linux.intel.com>
Date:   Wed, 29 May 2019 10:04:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <50abcb27-30af-9dfc-3a53-4261832f272d@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/29/2019 7:03 AM, Eddie James wrote:
> 
> On 5/24/19 6:17 PM, Jae Hyun Yoo wrote:
>> There is an incorrect timeout checking in mode detection logic so
>> it misses resolution detecting chances. This commit fixes the bug.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> v1 -> v2:
>>   New.
>>
>>   drivers/media/platform/aspeed-video.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c 
>> b/drivers/media/platform/aspeed-video.c
>> index 67f476bf0a03..b05b073b63bc 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -735,7 +735,7 @@ static void aspeed_video_get_resolution(struct 
>> aspeed_video *video)
>>       do {
>>           if (tries) {
>>               set_current_state(TASK_INTERRUPTIBLE);
>> -            if (schedule_timeout(INVALID_RESOLUTION_DELAY))
>> +            if (!schedule_timeout(INVALID_RESOLUTION_DELAY))
>>                   return;
> 
> 
> schedule_timeout returns 0 when the timer has expired otherwise the 
> remaining time in  jiffies will be returned. So if it was interrupted 
> (timer did not expire and it returns non-zero) then we should return, 
> rather than keep trying. So I think it was correct before. Thanks, Eddie

I thought that there is an explicit waking up case of this waiting
before the delay expires but I checked code again that there isn't. So
yes, you are right. Will drop this change from this series.

Thanks for the review!

Regards,
Jae
