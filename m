Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06969248DA5
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 20:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbgHRSCD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 14:02:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:38585 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726145AbgHRSCC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 14:02:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597773722; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=fCOD3kM9rO9Fr5v+nlMHtZMF2fgpmS7QVgaoW1pPtdE=;
 b=YnZpsJx3DuiLDqtvxqwWqB5dghSfKyIN1vRwzuIGjeH8XWjrUSkgBAhYsAYObVq9KKiWzDSH
 i2PMdbG97GVncuiNSFx7lavQYL0suMRRQKNSE2ZK226Acuhwi9h7hUN+TE+PLT/DlR8c/Ol2
 xk5IMeBDZFsLmlp4Ot4kYKXF+ok=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f3c17703f2ce110203ebc8e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 18 Aug 2020 18:01:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 807FAC433CA; Tue, 18 Aug 2020 18:01:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.153] (cpe-76-167-231-33.san.res.rr.com [76.167.231.33])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 834D1C433C6;
        Tue, 18 Aug 2020 18:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 834D1C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
Subject: Re: [PATCH v2 1/2] firmware: qcom_scm: Add memory protect virtual
 address ranges
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200817082723.17458-1-stanimir.varbanov@linaro.org>
 <20200817082723.17458-2-stanimir.varbanov@linaro.org>
Message-ID: <e8819e37-273c-e12a-962b-55c7f9074f71@codeaurora.org>
Date:   Tue, 18 Aug 2020 11:01:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200817082723.17458-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Elliot Berman <eberman@codeaurora.org>

On 8/17/2020 1:27 AM, Stanimir Varbanov wrote:
> This adds a new SCM memprotect command to set virtual address ranges.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>   drivers/firmware/qcom_scm.c | 24 ++++++++++++++++++++++++
>   drivers/firmware/qcom_scm.h |  1 +
>   include/linux/qcom_scm.h    |  8 +++++++-
>   3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 0e7233a20f34..dec8dc42a6bc 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -757,6 +757,30 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
>   }
>   EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
>   
> +int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
> +				   u32 cp_nonpixel_start,
> +				   u32 cp_nonpixel_size)
> +{
> +	int ret;
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_MP,
> +		.cmd = QCOM_SCM_MP_VIDEO_VAR,
> +		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
> +					 QCOM_SCM_VAL, QCOM_SCM_VAL),
> +		.args[0] = cp_start,
> +		.args[1] = cp_size,
> +		.args[2] = cp_nonpixel_start,
> +		.args[3] = cp_nonpixel_size,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +	struct qcom_scm_res res;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +
> +	return ret ? : res.result[0];
> +}
> +EXPORT_SYMBOL(qcom_scm_mem_protect_video_var);
> +
>   static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
>   				 size_t mem_sz, phys_addr_t src, size_t src_sz,
>   				 phys_addr_t dest, size_t dest_sz)
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index d9ed670da222..14da834ac593 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -97,6 +97,7 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>   #define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
>   #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	0x03
>   #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	0x04
> +#define QCOM_SCM_MP_VIDEO_VAR			0x08
>   #define QCOM_SCM_MP_ASSIGN			0x16
>   
>   #define QCOM_SCM_SVC_OCMEM		0x0f
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index 3d6a24697761..ba45537f688b 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -77,11 +77,13 @@ extern bool qcom_scm_restore_sec_cfg_available(void);
>   extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
>   extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
>   extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
> +extern int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
> +					  u32 cp_nonpixel_start,
> +					  u32 cp_nonpixel_size);
>   extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>   			       unsigned int *src,
>   			       const struct qcom_scm_vmperm *newvm,
>   			       unsigned int dest_cnt);
> -
>   extern bool qcom_scm_ocmem_lock_available(void);
>   extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
>   			       u32 size, u32 mode);
> @@ -128,6 +130,10 @@ static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
>   		{ return -ENODEV; }
>   static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
>   		{ return -ENODEV; }
> +extern inline int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
> +						 u32 cp_nonpixel_start,
> +						 u32 cp_nonpixel_size)
> +		{ return -ENODEV; }
>   static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>   		unsigned int *src, const struct qcom_scm_vmperm *newvm,
>   		unsigned int dest_cnt) { return -ENODEV; }
> 
