Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D0FC571C03
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 16:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbiGLOOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 10:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbiGLOOR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 10:14:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A8A339B
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 07:14:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6F2D6188A
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 14:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBEDC3411C;
        Tue, 12 Jul 2022 14:14:14 +0000 (UTC)
Message-ID: <7eeafa6e-c205-ed8f-d701-35807b0cd7ae@xs4all.nl>
Date:   Tue, 12 Jul 2022 16:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCHv2] media: venus: venus_helper_get_bufreq(): req is never
 NULL
Content-Language: en-US
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <d9184cd6-6cef-0df4-5247-8119d7bdb25b@xs4all.nl>
 <7ba24360-d038-70ed-95e2-9b8261cfd428@linaro.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <7ba24360-d038-70ed-95e2-9b8261cfd428@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/12/22 15:08, Stanimir Varbanov wrote:
> Hi Hans,
> 
> Thanks for the patch!
> 
> On 7/12/22 13:47, Hans Verkuil wrote:
>> Fix a smatch error:
>>
>> drivers/media/platform/qcom/venus/helpers.c: drivers/media/platform/qcom/venus/helpers.c:678 venus_helper_get_bufreq() error: we previously assumed 'req' could be null (see line 674)
>>
>> After checking how venus_helper_get_bufreq() is called it is clear that
>> req is never NULL, so just drop the checks.
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>> index 5c1104379c49..60de4200375d 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -671,8 +671,7 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
>>  	unsigned int i;
>>  	int ret;
>>  
>> -	if (req)
>> -		memset(req, 0, sizeof(*req));
>> +	memset(req, 0, sizeof(*req));
> 
> I wonder, can we just return EINVAL if req == NULL? By that way we could
> avoid future errors.

We can, but it makes no sense for this function to be called with a NULL
pointer for req, if you do, then it is a driver bug. I.e, we don't test if
inst is NULL either.

I thought about it, but decided that it would just add unnecessary overhead
in this specific case.

If you still want this, then I can post a v3.

Regards,

	Hans

> 
>>  
>>  	if (type == HFI_BUFFER_OUTPUT || type == HFI_BUFFER_OUTPUT2)
>>  		req->count_min = inst->fw_min_cnt;
>> @@ -694,8 +693,7 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
>>  		if (hprop.bufreq[i].type != type)
>>  			continue;
>>  
>> -		if (req)
>> -			memcpy(req, &hprop.bufreq[i], sizeof(*req));
>> +		memcpy(req, &hprop.bufreq[i], sizeof(*req));
>>  		ret = 0;
>>  		break;
>>  	}
> 
