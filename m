Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B0134DFCA
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 05:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhC3D72 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Mar 2021 23:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbhC3D7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Mar 2021 23:59:19 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A648DC061762
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 20:59:18 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id x207so15222210oif.1
        for <linux-media@vger.kernel.org>; Mon, 29 Mar 2021 20:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WP0mHVRfSgD11CnMchrfyBzI0cUHCyMRSuWMrdjjb3E=;
        b=oS+vHN3g+qSDLxKdVwIPsILJhfllG3VJX86R9Sw/zDirZhoQXi4dTtiOhPAfLPhLPc
         ZWfsEMsEt6CN3Vwiwb0LqTm+Bw0LRenUPjoTHGbhGtfUqrrxGIFYfASD3LUGZngrJc2n
         pd31Dqe5Md/jTWneAL6A55QlN4Z11SdyqA5HyaLNkiNsLGGaK6bXao2TFPh1zjGfQzPF
         47qP3zpm6AuvjgPqKEMZPaFbxroFe1TUE5YxaRa7NMU4lVIj/Y+5XOWbRdrxo7D2SqJp
         knYEosz2nG0zpxBvbxWXXSh95gUQjMBpRCjqkFal0mIv1+bcqwKMXymFvhWrliFrBDyE
         38BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WP0mHVRfSgD11CnMchrfyBzI0cUHCyMRSuWMrdjjb3E=;
        b=NnbG8xU0TjLOZhdkNT7ph0vJYRSEREPs+5iStRXBrJ2DVV1z8l17LrcCWDJbPBdEA+
         k42ncrULuRIbJJJlgWca9pfocH/bMxNw1oJWXgx/D+njwN78dtiU6HAsbcHTK4TEiQQu
         CduaFBjYmFdlXr9rJY36+lM8qFOyBwpNO3BKlNdJc0DFqYRLOti8siq/LycT0WHm2mMZ
         9seGSsBnw8XXyn79fnvEhn//xRMj2RFuVPgM6PrEeBfOMH+5Fw/NrvNucvo/CfKMTjl1
         iLiVjyaTDf9viTH9+xEHTX/tOXIKq22mKstiVsidJnbxsosaoYdP9Mo7uerfEgOlZG1Q
         vL6g==
X-Gm-Message-State: AOAM5307EsyJVURp7lp6oBR5e/bpz1rlR4jYbURQTeuE/b/LQ8AScOhz
        OeeQOAgxKnOVzDAuIDc36WyL6u4aPRX3qg==
X-Google-Smtp-Source: ABdhPJwysEdD3KX+W2avFCwryY09gyAZPTrl1omxmSBc+ok+dBpO/+tPGrK5oIdfg1sKUv5kP9EbYg==
X-Received: by 2002:a05:6808:94:: with SMTP id s20mr1745468oic.25.1617076757980;
        Mon, 29 Mar 2021 20:59:17 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a6sm4804176otq.79.2021.03.29.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 20:59:17 -0700 (PDT)
Date:   Mon, 29 Mar 2021 22:59:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org
Subject: Re: [PATCH v2] media: venus : hfi: add venus image info into smem
Message-ID: <YGKiExvhfdAhTw9/@builder.lan>
References: <1616740405-5085-1-git-send-email-dikshita@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616740405-5085-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri 26 Mar 01:33 CDT 2021, Dikshita Agarwal wrote:

> Fill fw version info into smem to be printed as part of
> soc info.
> 
> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
> 
> Changes since v1:
>  adressed comments from stephen.
>  removed unwanted code.
> ---
>  drivers/media/platform/qcom/venus/hfi_msgs.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
> index 06a1908..6b6d33c9 100644
> --- a/drivers/media/platform/qcom/venus/hfi_msgs.c
> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
> @@ -6,6 +6,7 @@
>  #include <linux/hash.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
> +#include <linux/soc/qcom/smem.h>
>  #include <media/videobuf2-v4l2.h>
>  
>  #include "core.h"
> @@ -14,6 +15,10 @@
>  #include "hfi_msgs.h"
>  #include "hfi_parser.h"
>  
> +#define SMEM_IMG_VER_TBL 469
> +#define VER_STR_SZ	128
> +#define SMEM_IMG_INDEX_VENUS 14 * 128

14 is the index, 128 is the element size, so this is now an "offset".

> +
>  static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
>  			      struct hfi_msg_event_notify_pkt *pkt)
>  {
> @@ -239,15 +244,27 @@ static void
>  sys_get_prop_image_version(struct device *dev,
>  			   struct hfi_msg_sys_property_info_pkt *pkt)
>  {
> +	size_t smem_blk_sz = 0;

You shouldn't need to initialize smem_blk_sz if you check the return
value of qcom_smem_get() first.

> +	u8 *smem_tbl_ptr;
> +	u8 *img_ver;
>  	int req_bytes;
>  
>  	req_bytes = pkt->hdr.size - sizeof(*pkt);
>  
> -	if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
> +	if (req_bytes < VER_STR_SZ || !pkt->data[1] || pkt->num_properties > 1)
>  		/* bad packet */
>  		return;
>  
> -	dev_dbg(dev, VDBGL "F/W version: %s\n", (u8 *)&pkt->data[1]);
> +	img_ver = (u8 *)&pkt->data[1];
> +
> +	dev_dbg(dev, VDBGL "F/W version: %s\n", img_ver);
> +
> +	smem_tbl_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
> +				       SMEM_IMG_VER_TBL, &smem_blk_sz);

80 chars is just a guideline and this looks prettier if you avoid the
line wrap. That said, if you pick shorter names for smem_tbl_ptr and
smem_blk_sz you probably even have to worry.

> +	if ((SMEM_IMG_INDEX_VENUS + VER_STR_SZ) <= smem_blk_sz &&
> +	    smem_tbl_ptr)

In English you're trying to determine: "did qcom_smem_get() return a
valid pointer and is the item's size at least as big as we need".

So just write that in C:

	if (smem_tbl_ptr && smem_blk_sz >= SMEM_IMG_INDEX_VENUS + VER_STR_SZ)

> +		memcpy(smem_tbl_ptr + SMEM_IMG_INDEX_VENUS,
> +		       img_ver, VER_STR_SZ);

Again, please avoid the line wrap...

Regards,
Bjorn

>  }
>  
>  static void hfi_sys_property_info(struct venus_core *core,
> -- 
> 2.7.4
> 
