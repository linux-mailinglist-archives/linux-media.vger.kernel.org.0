Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0800D356379
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 07:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344960AbhDGFud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 01:50:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:48703 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243435AbhDGFuc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 01:50:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617774624; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IthMdNdya7OQEqf47ha0LKpydMEvCyeA+ZKXsS3z6TY=;
 b=M38dvf/Znp+/9SAdMfYnbYI7vFqOKCRgJFLFUZUMsjcIR/ViggH0r1bV1ZHr5U+bwsatnWBa
 4lN0f6V/ZNMd63y+7onpraOGlj/RV9epsXkRvSfFtiUudg08LrEpk3qr1D+55M9NIaqLtqWS
 JEQJqR7eBl7/tn7XpwkDXHG57HQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 606d48198807bcde1d0dda5c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 07 Apr 2021 05:50:17
 GMT
Sender: dikshita=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A19D8C43464; Wed,  7 Apr 2021 05:50:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: dikshita)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB9F7C433CA;
        Wed,  7 Apr 2021 05:50:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 07 Apr 2021 11:20:16 +0530
From:   dikshita@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH v2] media: venus : hfi: add venus image info into smem
In-Reply-To: <YGKiExvhfdAhTw9/@builder.lan>
References: <1616740405-5085-1-git-send-email-dikshita@codeaurora.org>
 <YGKiExvhfdAhTw9/@builder.lan>
Message-ID: <dc7d3ac8948b16f8d003828b9c4e17e7@codeaurora.org>
X-Sender: dikshita@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bjorn,

Thanks for your review comments.
I have addressed all in the latest patch v3.
couldn't think of a shorter name for variables without losing the
readability so kept as it is.

Thanks,
Dikshita

On 2021-03-30 09:29, Bjorn Andersson wrote:
> On Fri 26 Mar 01:33 CDT 2021, Dikshita Agarwal wrote:
> 
>> Fill fw version info into smem to be printed as part of
>> soc info.
>> 
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> 
>> Changes since v1:
>>  adressed comments from stephen.
>>  removed unwanted code.
>> ---
>>  drivers/media/platform/qcom/venus/hfi_msgs.c | 21 
>> +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c 
>> b/drivers/media/platform/qcom/venus/hfi_msgs.c
>> index 06a1908..6b6d33c9 100644
>> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
>> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
>> @@ -6,6 +6,7 @@
>>  #include <linux/hash.h>
>>  #include <linux/list.h>
>>  #include <linux/slab.h>
>> +#include <linux/soc/qcom/smem.h>
>>  #include <media/videobuf2-v4l2.h>
>> 
>>  #include "core.h"
>> @@ -14,6 +15,10 @@
>>  #include "hfi_msgs.h"
>>  #include "hfi_parser.h"
>> 
>> +#define SMEM_IMG_VER_TBL 469
>> +#define VER_STR_SZ	128
>> +#define SMEM_IMG_INDEX_VENUS 14 * 128
> 
> 14 is the index, 128 is the element size, so this is now an "offset".
> 
>> +
>>  static void event_seq_changed(struct venus_core *core, struct 
>> venus_inst *inst,
>>  			      struct hfi_msg_event_notify_pkt *pkt)
>>  {
>> @@ -239,15 +244,27 @@ static void
>>  sys_get_prop_image_version(struct device *dev,
>>  			   struct hfi_msg_sys_property_info_pkt *pkt)
>>  {
>> +	size_t smem_blk_sz = 0;
> 
> You shouldn't need to initialize smem_blk_sz if you check the return
> value of qcom_smem_get() first.
> 
>> +	u8 *smem_tbl_ptr;
>> +	u8 *img_ver;
>>  	int req_bytes;
>> 
>>  	req_bytes = pkt->hdr.size - sizeof(*pkt);
>> 
>> -	if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
>> +	if (req_bytes < VER_STR_SZ || !pkt->data[1] || pkt->num_properties > 
>> 1)
>>  		/* bad packet */
>>  		return;
>> 
>> -	dev_dbg(dev, VDBGL "F/W version: %s\n", (u8 *)&pkt->data[1]);
>> +	img_ver = (u8 *)&pkt->data[1];
>> +
>> +	dev_dbg(dev, VDBGL "F/W version: %s\n", img_ver);
>> +
>> +	smem_tbl_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
>> +				       SMEM_IMG_VER_TBL, &smem_blk_sz);
> 
> 80 chars is just a guideline and this looks prettier if you avoid the
> line wrap. That said, if you pick shorter names for smem_tbl_ptr and
> smem_blk_sz you probably even have to worry.
> 
>> +	if ((SMEM_IMG_INDEX_VENUS + VER_STR_SZ) <= smem_blk_sz &&
>> +	    smem_tbl_ptr)
> 
> In English you're trying to determine: "did qcom_smem_get() return a
> valid pointer and is the item's size at least as big as we need".
> 
> So just write that in C:
> 
> 	if (smem_tbl_ptr && smem_blk_sz >= SMEM_IMG_INDEX_VENUS + VER_STR_SZ)
> 
>> +		memcpy(smem_tbl_ptr + SMEM_IMG_INDEX_VENUS,
>> +		       img_ver, VER_STR_SZ);
> 
> Again, please avoid the line wrap...
> 
> Regards,
> Bjorn
> 
>>  }
>> 
>>  static void hfi_sys_property_info(struct venus_core *core,
>> --
>> 2.7.4
>> 
