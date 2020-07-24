Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45A622C8B9
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 17:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgGXPEa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 11:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgGXPEa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 11:04:30 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6042C0619E5
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 08:04:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id t142so2187121wmt.4
        for <linux-media@vger.kernel.org>; Fri, 24 Jul 2020 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CwqTzUi/rsF9bmn8x3JnPsegKmJmnxCYF19O9EiQB8g=;
        b=loHVUzuSXm/GXdrjvO7AU7jZHFLrpAAJsnJpXBS5lUYxZQOZXQIF+xRvuPs3DbZJwC
         JA/atED/VBunAZuU+Lc0CUar4pSOmbdofW5NR0oU8CB/wpFeotp11dUaouQkkRyWekaV
         nvJIOGu036olMFpZ1yRHiOSXDx2dZfnlWh4Moz5+LJjRF9ftz7OV84tRwdSBiwfcwOf7
         4CQW0MLexrp3YA1UAOPs8dVXsLL0ciCmTKs2j8p8iqJw+YR1zAVO4XeUbbzVMEyJR//u
         C0Ju4QattfSL52v4YmT6xs43zp0r04a+pGzBQLd74Aa/j8JeeGgowi7oIVB2CEsO6iI7
         FaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CwqTzUi/rsF9bmn8x3JnPsegKmJmnxCYF19O9EiQB8g=;
        b=sRXGOMTFLHPCqhQZZj80dL1LqmjlVD/+9KBR0zepCcDq+WfrNmHn+NxYymGS4n6UP4
         Z+OFD9BoS2plHApjc8mhMCj2mhsWh05JhMPaseBgLRVrM9N1HgbLzVQf2VWu1DjgXf3B
         TNzIQOdlXchuQavqeUIgvHhjVhgur7FgDPcRjNBQE8P/tqm2dETZNjv6QKntqdIA+vTm
         cpEZfGrm2EW6a9gBwixrgo7fTgsviXWH7gmqJdpXWJ1eSjRG5+e+pkLKU3hldDcTlltV
         73Ejb9Tfl2MG5dNYrCw+pfxjTkqaUX+HcPQ1SYKpSu07wQv2hcjIgv2fuGmSiD1VI7k3
         n0sg==
X-Gm-Message-State: AOAM531VXC2O3u2o30mk+fqhbF85PqKk8p2VsYVnIQHgq44aBJnVxEqM
        Wwq8ULfqyPQQIfF0IzaQr7Zu4w==
X-Google-Smtp-Source: ABdhPJzl0EVy4Bj5RvkTByOZ6A7C/JVWAHmDOBveLcYBe6Hq1TeuhffCfAo09aU3U03SOlJnohe47A==
X-Received: by 2002:a05:600c:285:: with SMTP id 5mr9496156wmk.41.1595603068117;
        Fri, 24 Jul 2020 08:04:28 -0700 (PDT)
Received: from [192.168.1.4] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id m126sm407029wmf.3.2020.07.24.08.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 08:04:27 -0700 (PDT)
Subject: Re: [PATCH 1/2] firmware: qcom_scm: Add memory protect virtual
 address ranges
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>
References: <20200709115829.8194-1-stanimir.varbanov@linaro.org>
 <20200709115829.8194-2-stanimir.varbanov@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <33a63665-2f75-1b58-8a0c-3b0a8979fb85@linaro.org>
Date:   Fri, 24 Jul 2020 18:04:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200709115829.8194-2-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Gentle ping for review.

On 7/9/20 2:58 PM, Stanimir Varbanov wrote:
> This adds a new SCM memprotect command to set virtual address ranges.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/firmware/qcom_scm.c | 24 ++++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h |  1 +
>  include/linux/qcom_scm.h    |  8 +++++++-
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 0e7233a20f34..a73870255c2e 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -864,6 +864,30 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  }
>  EXPORT_SYMBOL(qcom_scm_assign_mem);
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
>  /**
>   * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
>   */
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index d9ed670da222..14da834ac593 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -97,6 +97,7 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
>  #define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
>  #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	0x03
>  #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	0x04
> +#define QCOM_SCM_MP_VIDEO_VAR			0x08
>  #define QCOM_SCM_MP_ASSIGN			0x16
>  
>  #define QCOM_SCM_SVC_OCMEM		0x0f
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index 3d6a24697761..19b5188d17f4 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -81,7 +81,9 @@ extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  			       unsigned int *src,
>  			       const struct qcom_scm_vmperm *newvm,
>  			       unsigned int dest_cnt);
> -
> +extern int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
> +					  u32 cp_nonpixel_start,
> +					  u32 cp_nonpixel_size);
>  extern bool qcom_scm_ocmem_lock_available(void);
>  extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
>  			       u32 size, u32 mode);
> @@ -131,6 +133,10 @@ static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
>  static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  		unsigned int *src, const struct qcom_scm_vmperm *newvm,
>  		unsigned int dest_cnt) { return -ENODEV; }
> +extern inline int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
> +						 u32 cp_nonpixel_start,
> +						 u32 cp_nonpixel_size)
> +		{ return -ENODEV; }
>  
>  static inline bool qcom_scm_ocmem_lock_available(void) { return false; }
>  static inline int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
> 

-- 
regards,
Stan
