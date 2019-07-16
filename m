Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821C46A19F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 06:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730233AbfGPEsX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 00:48:23 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53084 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfGPEsX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 00:48:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 39D9861892; Tue, 16 Jul 2019 04:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563252502;
        bh=GiCyZWigpDwDy+yS+t4Cvx/yw1g1hyCEP5LELwslBSk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A2LSovinbR42a+VHwFLtljAhj9KlNJCGKedTsdbqfAWn+Zfz6VQ2d19XMayGNtLT7
         jgGTi/Jqi1LeT/DreoycSoGA0FxVes2LwdEcwpacQDnfpvzRkGrNPolIiBtG2JrUAa
         MJg+lZxrP452Shhc4fxsI7jXA8YF8DPX2y0PyxNg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 95D2A61836;
        Tue, 16 Jul 2019 04:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563252501;
        bh=GiCyZWigpDwDy+yS+t4Cvx/yw1g1hyCEP5LELwslBSk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=U/8qGF2AYFrlexm05QwQclFWBkYOyeb0D5hpepV+p+4hkj8xt3s3ILj6RaLNlWMGU
         SQWBoChAyKTA1Ou4d07INorpyPZoUotuZfB/x8dYAVFYgKDrYw6380Lwzd5ST9Y7zI
         PTBOY6ulro0rTg9weWVOxIlraZ/ocpcEu5HasBtE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Jul 2019 10:18:21 +0530
From:   amasule@codeaurora.org
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org
Subject: Re: [PATCH v4 4/4] media: venus: Update core selection
In-Reply-To: <66c52577-fae8-9b3d-ec1d-886b97897729@linaro.org>
References: <1562078787-516-1-git-send-email-amasule@codeaurora.org>
 <1562078787-516-5-git-send-email-amasule@codeaurora.org>
 <66c52577-fae8-9b3d-ec1d-886b97897729@linaro.org>
Message-ID: <ca31e291b14a8c3494d0c49a097452ae@codeaurora.org>
X-Sender: amasule@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019-07-15 21:30, Stanimir Varbanov wrote:
> Hi,
> 
> On 7/2/19 5:46 PM, Aniket Masule wrote:
>> Present core assignment is static. Introduced load balancing
>> across the cores. Load on earch core is calculated and core
>> with minimum load is assigned to given instance.
>> 
>> Signed-off-by: Aniket Masule <amasule@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/helpers.c    | 69 
>> +++++++++++++++++++++++---
>>  drivers/media/platform/qcom/venus/helpers.h    |  2 +-
>>  drivers/media/platform/qcom/venus/hfi_helper.h |  1 +
>>  drivers/media/platform/qcom/venus/hfi_parser.h |  5 ++
>>  drivers/media/platform/qcom/venus/vdec.c       |  2 +-
>>  drivers/media/platform/qcom/venus/venc.c       |  2 +-
>>  6 files changed, 72 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>> b/drivers/media/platform/qcom/venus/helpers.c
>> index 5726d86..321e9f7 100644
>> --- a/drivers/media/platform/qcom/venus/helpers.c
>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>> @@ -26,6 +26,7 @@
>>  #include "helpers.h"
>>  #include "hfi_helper.h"
>>  #include "hfi_venus_io.h"
>> +#include "hfi_parser.h"
>> 
>>  struct intbuf {
>>  	struct list_head list;
>> @@ -331,6 +332,24 @@ static u32 load_per_instance(struct venus_inst 
>> *inst)
>>  	return mbs * inst->fps;
>>  }
>> 
>> +static u32 load_per_core(struct venus_core *core, u32 core_id)
>> +{
>> +	struct venus_inst *inst = NULL;
>> +	u32 mbs_per_sec = 0, load = 0;
>> +
>> +	mutex_lock(&core->lock);
>> +	list_for_each_entry(inst, &core->instances, list) {
>> +		if (!(inst->clk_data.core_id == core_id))
> 
> 		if (inst->clk_data.core_id != core_id)
> 
> I guess will be more readable?
> 
Yes, I will modify the check.
>> +			continue;
>> +
>> +		mbs_per_sec = load_per_instance(inst);
>> +		load = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
>> +	}
>> +	mutex_unlock(&core->lock);
>> +
>> +	return load;
>> +}
>> +
> 
> <cut>

Regards,
Aniket
