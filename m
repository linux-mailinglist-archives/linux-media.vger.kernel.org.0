Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4384423233F
	for <lists+linux-media@lfdr.de>; Wed, 29 Jul 2020 19:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgG2RPy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jul 2020 13:15:54 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15510 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbgG2RPx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jul 2020 13:15:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596042952; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=1cULKMzNtdk8DlQ9NLAgOegKaEdRUEW58bZV9Y9kTSc=; b=JJbuoIBz6TbM/hzzvO9zloB7vzvdDfsrEExKKVslqfTmRfoA9LRyjdNiMujATAmJxwoWk05L
 60GFb/vEzzn+bzW7yVkpEHErvyC6MDYYxFFgu6FUd08OEBX3Y0IAxYcD8eZTWQW3IG+7nmhn
 q3PZGxNaOJOvDZ+MpJfuXMCYhJw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f21aebbca55a5604c5ca82a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 17:15:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E897C433CA; Wed, 29 Jul 2020 17:15:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.1.179] (cpe-76-167-231-33.san.res.rr.com [76.167.231.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D07DC433C9;
        Wed, 29 Jul 2020 17:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8D07DC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
Subject: Re: [PATCH 1/2] firmware: qcom_scm: Add memory protect virtual
 address ranges
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200709115829.8194-1-stanimir.varbanov@linaro.org>
 <20200709115829.8194-2-stanimir.varbanov@linaro.org>
 <33a63665-2f75-1b58-8a0c-3b0a8979fb85@linaro.org>
From:   Elliot Berman <eberman@codeaurora.org>
Message-ID: <46632fb9-e07e-fa40-5f13-fb45b4014e03@codeaurora.org>
Date:   Wed, 29 Jul 2020 10:15:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <33a63665-2f75-1b58-8a0c-3b0a8979fb85@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

++

On 7/24/2020 8:04 AM, Stanimir Varbanov wrote:
> Hi,
> 
> Gentle ping for review.
> 
> On 7/9/20 2:58 PM, Stanimir Varbanov wrote:
>> This adds a new SCM memprotect command to set virtual address ranges.
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  drivers/firmware/qcom_scm.c | 24 ++++++++++++++++++++++++
>>  drivers/firmware/qcom_scm.h |  1 +
>>  include/linux/qcom_scm.h    |  8 +++++++-
>>  3 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
>> index 0e7233a20f34..a73870255c2e 100644
>> --- a/drivers/firmware/qcom_scm.c
>> +++ b/drivers/firmware/qcom_scm.c
>> @@ -864,6 +864,30 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>>  }
>>  EXPORT_SYMBOL(qcom_scm_assign_mem);
>>  
>> +int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
>> +				   u32 cp_nonpixel_start,
>> +				   u32 cp_nonpixel_size)
>> +{
>> +	int ret;
>> +	struct qcom_scm_desc desc = {
>> +		.svc = QCOM_SCM_SVC_MP,
>> +		.cmd = QCOM_SCM_MP_VIDEO_VAR,
>> +		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
>> +					 QCOM_SCM_VAL, QCOM_SCM_VAL),
>> +		.args[0] = cp_start,
>> +		.args[1] = cp_size,
>> +		.args[2] = cp_nonpixel_start,
>> +		.args[3] = cp_nonpixel_size,
>> +		.owner = ARM_SMCCC_OWNER_SIP,
>> +	};
>> +	struct qcom_scm_res res;
>> +
>> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
>> +
>> +	return ret ? : res.result[0];
>> +}
>> +EXPORT_SYMBOL(qcom_scm_mem_protect_video_var);
>> +

Small nit, can you bump the function above assign_mem? It would keep order aligned with
the macros in qcom_scm.h

>>  /**
>>   * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
>>   */
>> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
>> index d9ed670da222..14da834ac593 100644
>> --- a/drivers/firmware/qcom_scm.h
>> +++ b/drivers/firmware/qcom_scm.h
>> @@ -97,6 +97,7 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>>  #define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
>>  #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	0x03
>>  #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	0x04
>> +#define QCOM_SCM_MP_VIDEO_VAR			0x08
>>  #define QCOM_SCM_MP_ASSIGN			0x16
>>  
>>  #define QCOM_SCM_SVC_OCMEM		0x0f
>> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
>> index 3d6a24697761..19b5188d17f4 100644
>> --- a/include/linux/qcom_scm.h
>> +++ b/include/linux/qcom_scm.h
>> @@ -81,7 +81,9 @@ extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>>  			       unsigned int *src,
>>  			       const struct qcom_scm_vmperm *newvm,
>>  			       unsigned int dest_cnt);
>> -
>> +extern int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
>> +					  u32 cp_nonpixel_start,
>> +					  u32 cp_nonpixel_size);

Same here.

>>  extern bool qcom_scm_ocmem_lock_available(void);
>>  extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
>>  			       u32 size, u32 mode);
>> @@ -131,6 +133,10 @@ static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
>>  static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>>  		unsigned int *src, const struct qcom_scm_vmperm *newvm,
>>  		unsigned int dest_cnt) { return -ENODEV; }
>> +extern inline int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
>> +						 u32 cp_nonpixel_start,
>> +						 u32 cp_nonpixel_size)
>> +		{ return -ENODEV; }

Same here.

>>  
>>  static inline bool qcom_scm_ocmem_lock_available(void) { return false; }
>>  static inline int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
>>
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
