Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900042615C4
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 18:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731432AbgIHQXF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 12:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731886AbgIHQWl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 12:22:41 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC83C09B045
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 07:40:34 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id u126so16634711oif.13
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 07:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gPcieJcPktL1nGtQ3CPYTKBD+Ta7XljCQbXl/MbV5To=;
        b=JixNYbDmOvp2/Vgm8rdPkpElXATAbUeixoOvrkRTSwCOE607vlcS1SOqEVXv5WI7dP
         EdJwGSsxWOj0EFurjaxlWrqa8RAGCNQc3Fhrf6wA38N6nKteuVuLkICNNiWJn1VNAxFA
         xM3WNXezc3a8efPrz9VV+jbriI+FyvLxYjGVBfvYVqMIrAb0KhAefvVyKParNgGbch3w
         AJqEtn0ig+RiMpls+0t3z+AbjLJkrhgNG1RXIY/BaQ0DgXNMEgbEdKTcH0T/ziCKzcke
         XzmMbfbe+evCDZd0KXn++tA01B+c9/k6/Fd0OVeuxI3mz/3DnleGbdxuSDdeE7dE+xk+
         zX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gPcieJcPktL1nGtQ3CPYTKBD+Ta7XljCQbXl/MbV5To=;
        b=HYL2F0iNm7VZF0dZDIpmDovK+aRrVWt5fejiOzqCNEKtXotBa5ZnBR4LGVZE0PbOk+
         IAIEe1ldiLfyGWAdsgQ3GYg/vejEorwphqsFlV/0Jdmv1BQtD0Al6WPlI73nB/ldY7SN
         Uz/k85JQ3509749oskPrjDm9iQAJMG6yhRw2MVGnas052R1HmRGc4yLoqHuwz95CPhPS
         KPt7SWB/9orpPY/wolABNIJEy8IGe8gymeBtd4K1+lGLroRUy7EsT0RJ62Mv5fnibl8Z
         0TPrp8/F69xflQnc2IC3wTduF7Jn8fEXSnNZcZyKRj6WiuKSExG+39dVZ6Jxi43Ktyuo
         UCwg==
X-Gm-Message-State: AOAM530U95wgC5DrcO6I/PH7pa1KYs1AhMcHbURtOgkqfVztuqPR27fu
        9FgwthMwOrjHG02aERjVNVOBzrv8L8Y4Sw==
X-Google-Smtp-Source: ABdhPJwYAeXrfUaRThbJxg8f1ht0zPXpOv6/A90yB5RmZ7nAvvTYVm3A4VMv9KuNRHEZPSmyrLx5Sw==
X-Received: by 2002:a05:6808:8e5:: with SMTP id d5mr2937201oic.33.1599576034193;
        Tue, 08 Sep 2020 07:40:34 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id t10sm3422202ooh.4.2020.09.08.07.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 07:40:33 -0700 (PDT)
Date:   Tue, 8 Sep 2020 09:40:31 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 1/2] firmware: qcom_scm: Add memory protect virtual
 address ranges
Message-ID: <20200908144031.GL3715@yoga>
References: <20200817082723.17458-1-stanimir.varbanov@linaro.org>
 <20200817082723.17458-2-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817082723.17458-2-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon 17 Aug 03:27 CDT 2020, Stanimir Varbanov wrote:

> This adds a new SCM memprotect command to set virtual address ranges.
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>


Please feel free to pick this through linux-media.

Regards,
Bjorn

> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/firmware/qcom_scm.c | 24 ++++++++++++++++++++++++
>  drivers/firmware/qcom_scm.h |  1 +
>  include/linux/qcom_scm.h    |  8 +++++++-
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 0e7233a20f34..dec8dc42a6bc 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -757,6 +757,30 @@ int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
>  }
>  EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
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
>  static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
>  				 size_t mem_sz, phys_addr_t src, size_t src_sz,
>  				 phys_addr_t dest, size_t dest_sz)
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
> index 3d6a24697761..ba45537f688b 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -77,11 +77,13 @@ extern bool qcom_scm_restore_sec_cfg_available(void);
>  extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
>  extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
>  extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
> +extern int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
> +					  u32 cp_nonpixel_start,
> +					  u32 cp_nonpixel_size);
>  extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  			       unsigned int *src,
>  			       const struct qcom_scm_vmperm *newvm,
>  			       unsigned int dest_cnt);
> -
>  extern bool qcom_scm_ocmem_lock_available(void);
>  extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
>  			       u32 size, u32 mode);
> @@ -128,6 +130,10 @@ static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
>  		{ return -ENODEV; }
>  static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
>  		{ return -ENODEV; }
> +extern inline int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
> +						 u32 cp_nonpixel_start,
> +						 u32 cp_nonpixel_size)
> +		{ return -ENODEV; }
>  static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  		unsigned int *src, const struct qcom_scm_vmperm *newvm,
>  		unsigned int dest_cnt) { return -ENODEV; }
> -- 
> 2.17.1
> 
