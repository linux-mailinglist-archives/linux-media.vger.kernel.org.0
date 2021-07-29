Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DC33DA08F
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 11:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbhG2JuN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 05:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235141AbhG2JuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 05:50:12 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 264F0C0613C1
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 02:50:09 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l11-20020a7bc34b0000b029021f84fcaf75so6400264wmj.1
        for <linux-media@vger.kernel.org>; Thu, 29 Jul 2021 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rvQg0fCV2zlqV5dQH884+MsRqdOryhfx32acXTHMR58=;
        b=vUSWb+GMFwOOz5X1tdPl9PddUA9GEN66WcViE9SPNlKNdnBIYxj1XAWr/34wPQ+w/G
         NdzhdRHMTwWvojbma9ScPYWLEm2B9Ttz2rmqvJPoqxDt1/f8o7wvKYKn8r/3/JmVAfz1
         3cBl8Bd0He+Mo/K3HLjF3y5dMt2NWGwC689jufmrAk5Lw/THB0YuDyCYWw32DmAZLbLM
         HgC3OM1XN6lSeF3QcEMnfgZg4cPhlNK3yUqJ1eRdobFsNo9ak001EnSBbNfIq+nfO6T7
         oLF7iIwTMNdpm5oOZgAq18HFvheyNWpuPyNSQq5Gg7hcYIFMyCCmwzqaR3bXMjkTo0z1
         rweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rvQg0fCV2zlqV5dQH884+MsRqdOryhfx32acXTHMR58=;
        b=O1mcpqftGJwvFR3E91kR+YBBfMwJlqIoUFLX2Rx1TdFByhs/2cflhsWZP5ff9Zkc71
         mf3iNbGncoMYzutrrDIAYTkLMCuFFfEAXb9EF+k3ZFjspKyxKFSdZJXDE+WiJTeB+F97
         2LU4dJvDAUY9CZoG2D+nKSuxuCi9KG3n75EJSVR2xZ5r4FhHYjzGuMxkXdNUTCAc1JS5
         25KG4Cc8H4uAFTlw44UUAMM6r0uXhG7AbqE/qZKPDFDO/N73Kx48hp78gKIbytBw0A+/
         oR6vZHpu/z+75yyKjRdl53JllzIXsZG+sKgBgvp7NyHsMs0NOTOm63sQRagh2muwCgJj
         ez9Q==
X-Gm-Message-State: AOAM530zansowS6SMm4Yq6M/S9JK3BJjVjkgyfmKXEpPXIwtu5fsw0yh
        I72rmv6P5jg3CT02umyqkyDnPw==
X-Google-Smtp-Source: ABdhPJx3ZQM7tvTrQdNKt+IdfvZgw+Eo/B8g6XYRPBg+pS34MTGFVDUsRKhM/yyYjBpT4TlaPBsWmQ==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr13357590wmj.28.1627552207700;
        Thu, 29 Jul 2021 02:50:07 -0700 (PDT)
Received: from [10.10.6.131] ([109.120.209.55])
        by smtp.googlemail.com with ESMTPSA id z20sm2542680wmi.36.2021.07.29.02.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 02:50:07 -0700 (PDT)
Subject: Re: [V2] venus: vdec: decoded picture buffer handling during reconfig
 sequence
To:     Mansur Alisha Shaik <mansur@codeaurora.org>,
        linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, dikshita@codeaurora.org
References: <20210715123555.26763-1-mansur@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <0c8ba82d-5d7d-bb36-5792-4ace34d7478a@linaro.org>
Date:   Thu, 29 Jul 2021 12:50:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210715123555.26763-1-mansur@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 7/15/21 3:35 PM, Mansur Alisha Shaik wrote:
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
> Changes in V2:
> - Fixed proto type warnings reported by kernel test robot
> ---
>  drivers/media/platform/qcom/venus/core.h    |  3 ++
>  drivers/media/platform/qcom/venus/helpers.c | 38 ++++++++++++++++-----
>  drivers/media/platform/qcom/venus/helpers.h | 18 ++++++++++
>  drivers/media/platform/qcom/venus/vdec.c    | 25 +++++++++++++-
>  4 files changed, 74 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 8df2d497d706..7ecbf9ed1acb 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -450,6 +450,7 @@ struct venus_inst {
>  	bool next_buf_last;
>  	bool drain_active;
>  	enum venus_inst_modes flags;
> +	u32 dpb_out_tag[VB2_MAX_FRAME];
>  };
>  
>  #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
> @@ -484,4 +485,6 @@ venus_caps_by_codec(struct venus_core *core, u32 codec, u32 domain)
>  	return NULL;
>  }
>  
> +void dpb_out_tag_init(struct venus_inst *inst);
> +
>  #endif
> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
> index 1fe6d463dc99..4d308be712d7 100644
> --- a/drivers/media/platform/qcom/venus/helpers.c
> +++ b/drivers/media/platform/qcom/venus/helpers.c
> @@ -21,14 +21,6 @@
>  #define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
>  #define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
>  
> -struct intbuf {
> -	struct list_head list;
> -	u32 type;
> -	size_t size;
> -	void *va;
> -	dma_addr_t da;
> -	unsigned long attrs;
> -};
>  
>  bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
>  {
> @@ -95,9 +87,16 @@ int venus_helper_queue_dpb_bufs(struct venus_inst *inst)
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
> @@ -110,18 +109,37 @@ int venus_helper_free_dpb_bufs(struct venus_inst *inst)
>  	struct intbuf *buf, *n;
>  
>  	list_for_each_entry_safe(buf, n, &inst->dpbbufs, list) {
> +		if (buf->owned_by == FIRMWARE)
> +			continue;
> +
> +		inst->dpb_out_tag[buf->dpb_out_tag - VB2_MAX_FRAME] = 0;

This looks wrong. The dpb_out_tag is in range of 0 .. 31, then for
dpb_out_tag = 0 you will have negative array index. Could you revisit that.

> +
>  		list_del_init(&buf->list);
>  		dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
>  			       buf->attrs);
>  		kfree(buf);
>  	}
>  
> -	INIT_LIST_HEAD(&inst->dpbbufs);

Instead of delete INIT_LIST_HEAD you can do:

if (list_empty(&inst->dpbbufs)
	INIT_LIST_HEAD(&inst->dpbbufs);

>  
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(venus_helper_free_dpb_bufs);
>  
> +int venus_helper_get_free_dpb_tag(struct venus_inst *inst)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < VB2_MAX_FRAME; i++) {
> +		if (inst->dpb_out_tag[i] == 0) {
> +			inst->dpb_out_tag[i] = i + VB2_MAX_FRAME;
> +			return inst->dpb_out_tag[i];
> +		}
> +	}

Can we use kernel API for that? I think ida_alloc|free|destroy would
work nicely and also will save a lot of code lines.

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(venus_helper_get_free_dpb_tag);
> +
>  int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>  {
>  	struct venus_core *core = inst->core;
> @@ -171,6 +189,8 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst *inst)
>  			ret = -ENOMEM;
>  			goto fail;
>  		}
> +		buf->owned_by = DRIVER;
> +		buf->dpb_out_tag = venus_helper_get_free_dpb_tag(inst);
>  
>  		list_add_tail(&buf->list, &inst->dpbbufs);
>  	}
> diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
> index e6269b4be3af..ea87a552c3ca 100644
> --- a/drivers/media/platform/qcom/venus/helpers.h
> +++ b/drivers/media/platform/qcom/venus/helpers.h
> @@ -8,6 +8,22 @@
>  
>  #include <media/videobuf2-v4l2.h>
>  
> +enum dpb_buf_owner {
> +	DRIVER,
> +	FIRMWARE,
> +};
> +
> +struct intbuf {
> +	struct list_head list;
> +	u32 type;
> +	size_t size;
> +	void *va;
> +	dma_addr_t da;
> +	unsigned long attrs;
> +	enum dpb_buf_owner owned_by;
> +	u32 dpb_out_tag;
> +};
> +

If you make dpb buffer manipulations as venus_helpers you don't need to
move the prototype of the structure outside of helpers.c.

>  struct venus_inst;
>  struct venus_core;
>  
> @@ -66,4 +82,6 @@ int venus_helper_get_profile_level(struct venus_inst *inst, u32 *profile, u32 *l
>  int venus_helper_set_profile_level(struct venus_inst *inst, u32 profile, u32 level);
>  int venus_helper_set_stride(struct venus_inst *inst, unsigned int aligned_width,
>  			    unsigned int aligned_height);
> +int venus_helper_get_free_dpb_tag(struct venus_inst *inst);
> +
>  #endif
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 198e47eb63f4..ba46085301ee 100644
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
> @@ -1306,8 +1307,18 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
>  		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  
>  	vbuf = venus_helper_find_buf(inst, type, tag);
> -	if (!vbuf)
> +	if (!vbuf) {
> +		if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
> +		    buf_type == HFI_BUFFER_OUTPUT) {
> +			list_for_each_entry(dpb_buf, &inst->dpbbufs, list) {
> +				if (dpb_buf->dpb_out_tag == tag) {
> +					dpb_buf->owned_by = DRIVER;
> +					break;
> +				}
> +			}
> +		}

Please make this chuck of code a new venus_helper_find_dpb_buf()

>  		return;
> +	}
>  
>  	vbuf->flags = flags;
>  	vbuf->field = V4L2_FIELD_NONE;
> @@ -1542,6 +1553,14 @@ static int m2m_queue_init(void *priv, struct vb2_queue *src_vq,
>  	return vb2_queue_init(dst_vq);
>  }
>  
> +void dpb_out_tag_init(struct venus_inst *inst)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < VB2_MAX_FRAME; i++)
> +		inst->dpb_out_tag[i] = 0;

This initialization cycle can be moved in vdec_inst_init(), but if you
migrate to ida_xxx APIs this will be part of venus_helper_alloc_dpb_bufs()

> +}
> +
>  static int vdec_open(struct file *file)
>  {
>  	struct venus_core *core = video_drvdata(file);
> @@ -1580,6 +1599,8 @@ static int vdec_open(struct file *file)
>  
>  	vdec_inst_init(inst);
>  
> +	dpb_out_tag_init(inst);
> +
>  	/*
>  	 * create m2m device for every instance, the m2m context scheduling
>  	 * is made by firmware side so we do not need to care about.
> @@ -1622,6 +1643,8 @@ static int vdec_close(struct file *file)
>  
>  	vdec_pm_get(inst);
>  
> +	venus_helper_free_dpb_bufs(inst);
> +	INIT_LIST_HEAD(&inst->dpbbufs);
>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>  	v4l2_m2m_release(inst->m2m_dev);
>  	vdec_ctrl_deinit(inst);
> 
> base-commit: c1a6d08348fc729e59776fe22878d4ce8fb97cde
> 

-- 
regards,
Stan
