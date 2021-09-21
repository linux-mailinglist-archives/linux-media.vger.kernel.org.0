Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44E14134D0
	for <lists+linux-media@lfdr.de>; Tue, 21 Sep 2021 15:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233431AbhIUNt6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Sep 2021 09:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233426AbhIUNt5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Sep 2021 09:49:57 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD80C061575
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 06:48:29 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id c22so74318812edn.12
        for <linux-media@vger.kernel.org>; Tue, 21 Sep 2021 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aNTuizOqdzDW7h7h80neHzRKPQ4VEqD5lgD02Fykhis=;
        b=cwAeLQHcRd3Uq6KkyWNqKcGT6AwrJ4sheK5cgo9pLjTGusgx0FGT6Vj783nqbphwof
         nkQgjyV4+zOvSUoMbwoEEmjD+h0iR84nLwNDHrFF9sCnV33cdycDdPxmeXBMP/HMGaO2
         hJHHx9zVdMlWsyRtPnR8F2u1bFKF23Evpihm1El73VB/xjMsayPNP8gCestCG5gcGjRQ
         gkCptOwSyRCrt0NxZHMW+4p1k4BaWEDrSZo4iRT2F12yu2v4NNTnFsCECQl51UDsAYjo
         y4iJAlNfAmaCHOnTuFdtG0LOmslJDNsJyC40Tn0mj/L45OcT2v8kkVm3/jLNm8boCufG
         RG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aNTuizOqdzDW7h7h80neHzRKPQ4VEqD5lgD02Fykhis=;
        b=hjI2xue/Dy7bL17ke+N8yEdSG/STB2lv/ex3SANKRWNlE/JW9+CNMg1HwTpGJRErAN
         BTg5LAh3GHYjDALlq7aptrCTdhuZdMK/YSVE5It1o4YLjpMFJO1pnm8CW0bB8wAtX3k9
         UAtkbw/3ilKGleKYYSKspGr27QPrKgCTH/voDcqgwKlLVs0vmVlyJg63660O/yE1uRzl
         i5QnSidm+VsosjAmQ7ajuKGi7DKYV+jhjv0GKM7nWzJBYIKATJ8xgDHQMgxlDzZW3R79
         7zvyB89xL/jUGaL/VqmhYYQ87WXMQXZn76QeJD0ylyVCV6FLFx1kKNCgeHVN9CbUQfg4
         SDvA==
X-Gm-Message-State: AOAM533PP60+fvqFknY5KftHvL1ENA9u1dds8Wb5JFwmURAQ5mf9ZFHI
        SVRu+5A556lzXMLyqY/DYjf+fg==
X-Google-Smtp-Source: ABdhPJxTC4ocrnN/aqmIcIz7gSOiuc6J9ZIJPBIuge5cZv5KeVcxjyEE2ujPIUbb6GrWuK+rP9PSmw==
X-Received: by 2002:a17:906:1601:: with SMTP id m1mr35348931ejd.485.1632232037519;
        Tue, 21 Sep 2021 06:47:17 -0700 (PDT)
Received: from [192.168.1.15] (hst-221-95.medicom.bg. [84.238.221.95])
        by smtp.googlemail.com with ESMTPSA id d16sm8588731edu.8.2021.09.21.06.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 06:47:17 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [V3] venus: vdec: decoded picture buffer handling during reconfig
 sequence
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org
References: <20210825110841.12815-1-mansur@codeaurora.org>
Message-ID: <78dec463-5e75-18d7-b74e-154f00b8a7b2@linaro.org>
Date:   Tue, 21 Sep 2021 16:47:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825110841.12815-1-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mansur,

On 8/25/21 2:08 PM, Mansur Alisha Shaik wrote:
> In existing implementation, driver is freeing and un-mapping all the
> decoded picture buffers(DPB) as part of dynamic resolution change(DRC)
> handling. As a result, when firmware try to access the DPB buffer, from
> previous sequence, SMMU context fault is seen due to the buffer being
> already unmapped.
> 
> With this change, driver defines ownership of each DPB buffer. If a buffer
> is owned by firmware, driver would skip from un-mapping the same.
> 
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> 
> Changes in V3:
> - Migrated id allocation using kernel API ida_alloc_min()
> 
> ---
>  drivers/media/platform/qcom/venus/helpers.c | 50 ++++++++++++++++++++-
>  drivers/media/platform/qcom/venus/helpers.h |  2 +
>  drivers/media/platform/qcom/venus/vdec.c    |  7 ++-
>  3 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 8012f5c7bf34..f36361d346b2 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2012-2016, The Linux Foundation. All rights reserved.
>   * Copyright (C) 2017 Linaro Ltd.
>   */
> +#include <linux/idr.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
> @@ -21,6 +22,13 @@
>  #define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
>  #define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
>  
> +static DEFINE_IDA(dpb_out_tag_ida);

No global static variables please. Make it part of venus_inst structure.

> +
> +enum dpb_buf_owner {
> +	DRIVER,
> +	FIRMWARE,
> +};
> +
>  struct intbuf {
>  	struct list_head list;
>  	u32 type;
> @@ -28,6 +36,8 @@ struct intbuf {
>  	void *va;
>  	dma_addr_t da;
>  	unsigned long attrs;
> +	enum dpb_buf_owner owned_by;
> +	u32 dpb_out_tag;
>  };
>  
>  bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
> @@ -95,9 +105,16 @@ int venus_helper_queue_dpb_bufs(struct venus_inst *inst)
>  		fdata.device_addr = buf->da;
>  		fdata.buffer_type = buf->type;
>  
> +		if (buf->owned_by == FIRMWARE)
> +			continue;
> +
> +		fdata.clnt_data = buf->dpb_out_tag;
> +
>  		ret = hfi_session_process_buf(inst, &fdata);
>  		if (ret)
>  			goto fail;
> +
> +		buf->owned_by = FIRMWARE;
>  	}
>  
>  fail:
> @@ -110,13 +127,19 @@ int venus_helper_free_dpb_bufs(struct venus_inst *inst)
>  	struct intbuf *buf, *n;
>  
>  	list_for_each_entry_safe(buf, n, &inst->dpbbufs, list) {
> +		if (buf->owned_by == FIRMWARE)
> +			continue;
> +
> +		ida_free(&dpb_out_tag_ida, buf->dpb_out_tag);
> +
>  		list_del_init(&buf->list);
>  		dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
>  			       buf->attrs);
>  		kfree(buf);
>  	}
>  
> -	INIT_LIST_HEAD(&inst->dpbbufs);
> +	if (list_empty(&inst->dpbbufs))
> +		INIT_LIST_HEAD(&inst->dpbbufs);
>  
>  	return 0;
>  }
> @@ -134,6 +157,7 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>  	unsigned int i;
>  	u32 count;
>  	int ret;
> +	int id;
>  
>  	/* no need to allocate dpb buffers */
>  	if (!inst->dpb_fmt)
> @@ -171,6 +195,15 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>  			ret = -ENOMEM;
>  			goto fail;
>  		}
> +		buf->owned_by = DRIVER;
> +
> +		id = ida_alloc_min(&dpb_out_tag_ida, VB2_MAX_FRAME, GFP_KERNEL);
> +		if (id < 0) {
> +			ret = id;
> +			goto fail;
> +		}
> +
> +		buf->dpb_out_tag = id;
>  
>  		list_add_tail(&buf->list, &inst->dpbbufs);
>  	}
> @@ -1365,6 +1398,21 @@ venus_helper_find_buf(struct venus_inst *inst, unsigned int type, u32 idx)
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_find_buf);
>  
> +void venus_helper_find_dpb_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf,
> +			       unsigned int type, unsigned int buf_type, u32 tag)

If this helper will return void then it should be renamed to something
like venus_helper_dpb_buf_change_owner().

> +{
> +	struct intbuf *dpb_buf;
> +
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> +	    buf_type == HFI_BUFFER_OUTPUT)
> +		list_for_each_entry(dpb_buf, &inst->dpbbufs, list)
> +			if (dpb_buf->dpb_out_tag == tag) {
> +				dpb_buf->owned_by = DRIVER;
> +				break;
> +			}
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_find_dpb_buf);
> +
>  int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
>  {
>  	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index e6269b4be3af..17c5aadaec82 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -14,6 +14,8 @@ struct venus_core;
>  bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt);
>  struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst *inst,
>  					      unsigned int type, u32 idx);
> +void venus_helper_find_dpb_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf,
> +			       unsigned int type, unsigned int buf_type, u32 idx);
>  void venus_helper_buffers_done(struct venus_inst *inst, unsigned int type,
>  			       enum vb2_buffer_state state);
>  int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 198e47eb63f4..cafdc3d8e473 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1297,6 +1297,7 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>  	struct vb2_v4l2_buffer *vbuf;
>  	struct vb2_buffer *vb;
>  	unsigned int type;
> +	struct intbuf *dpb_buf;
>  
>  	vdec_pm_touch(inst);
>  
> @@ -1306,8 +1307,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>  		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  
>  	vbuf = venus_helper_find_buf(inst, type, tag);
> -	if (!vbuf)
> +	if (!vbuf) {
> +		venus_helper_find_dpb_buf(inst, vbuf, type, buf_type, tag);
>  		return;
> +	}
>  
>  	vbuf->flags = flags;
>  	vbuf->field = V4L2_FIELD_NONE;
> @@ -1622,6 +1625,8 @@ static int vdec_close(struct file *file)
>  
>  	vdec_pm_get(inst);
>  
> +	venus_helper_free_dpb_bufs(inst);
> +	INIT_LIST_HEAD(&inst->dpbbufs);

This belongs to venus_helper_free_dpb_bufs not here.

>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
>  	vdec_ctrl_deinit(inst);
> 

-- 
regards,
Stan

-- 
regards,
Stan
