Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF976418EA1
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 07:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbhI0F0i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 01:26:38 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42903 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbhI0F0h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 01:26:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632720300; h=Message-ID: References: In-Reply-To: Subject:
 To: From: Date: Content-Transfer-Encoding: Content-Type: MIME-Version:
 Sender; bh=tdIC6J5oq2rz3aeFEM/CkAoed670O42766gLqKYdVTs=; b=ZfEkYbRZyzx6K3TsD6P56e9kOezR9w/iGhMXXbeMbjMqpyrDF1DL7UdxKjOJzLPAkoh1T5of
 wOnhVm4hslRHeqNdtBcCEKbl8P4vmFMOzXBWygfdTJ9Db4RTPNwRpdNpAWWNlcS+Mc+J8C57
 JEyYHFerDdHnm6bYhDU/AUQ/Ty4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615155ab47d64efb6d983603 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Sep 2021 05:24:59
 GMT
Sender: mansur=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3DD3DC4360D; Mon, 27 Sep 2021 05:24:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mansur)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 15DB2C4338F;
        Mon, 27 Sep 2021 05:24:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Sep 2021 10:54:57 +0530
From:   mansur@codeaurora.org
To:     undisclosed-recipients:;
Subject: Re: [V3] venus: vdec: decoded picture buffer handling during reconfig
 sequence
In-Reply-To: <78dec463-5e75-18d7-b74e-154f00b8a7b2@linaro.org>
References: <20210825110841.12815-1-mansur@codeaurora.org>
 <78dec463-5e75-18d7-b74e-154f00b8a7b2@linaro.org>
Message-ID: <9f09bc40e52021f89b29cfaef8e314d8@codeaurora.org>
X-Sender: mansur@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On 2021-09-21 19:17, Stanimir Varbanov wrote:
>> Hi Mansur,
>> 
>> On 8/25/21 2:08 PM, Mansur Alisha Shaik wrote:
>>> In existing implementation, driver is freeing and un-mapping all the
>>> decoded picture buffers(DPB) as part of dynamic resolution 
>>> change(DRC)
>>> handling. As a result, when firmware try to access the DPB buffer, 
>>> from
>>> previous sequence, SMMU context fault is seen due to the buffer being
>>> already unmapped.
>>> 
>>> With this change, driver defines ownership of each DPB buffer. If a 
>>> buffer
>>> is owned by firmware, driver would skip from un-mapping the same.
>>> 
>>> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
>>> 
>>> Changes in V3:
>>> - Migrated id allocation using kernel API ida_alloc_min()
>>> 
>>> ---
>>>  drivers/media/platform/qcom/venus/helpers.c | 50 
>>> ++++++++++++++++++++-
>>>  drivers/media/platform/qcom/venus/helpers.h |  2 +
>>>  drivers/media/platform/qcom/venus/vdec.c    |  7 ++-
>>>  3 files changed, 57 insertions(+), 2 deletions(-)
>>> 
>>> diff --git a/drivers/media/platform/qcom/venus/helpers.c 
>>> b/drivers/media/platform/qcom/venus/helpers.c
>>> index 8012f5c7bf34..f36361d346b2 100644
>>> --- a/drivers/media/platform/qcom/venus/helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>>> @@ -3,6 +3,7 @@
>>>   * Copyright (c) 2012-2016, The Linux Foundation. All rights 
>>> reserved.
>>>   * Copyright (C) 2017 Linaro Ltd.
>>>   */
>>> +#include <linux/idr.h>
>>>  #include <linux/list.h>
>>>  #include <linux/mutex.h>
>>>  #include <linux/slab.h>
>>> @@ -21,6 +22,13 @@
>>>  #define NUM_MBS_720P	(((1280 + 15) >> 4) * ((720 + 15) >> 4))
>>>  #define NUM_MBS_4K	(((4096 + 15) >> 4) * ((2304 + 15) >> 4))
>>> 
>>> +static DEFINE_IDA(dpb_out_tag_ida);
>> 
>> No global static variables please. Make it part of venus_inst 
>> structure.
> 	As per my understanding it is not just static global variable.
> 	We are defining the ida structure and assign to name when pass as 
> param as follows
> 	struct ida {
> 	struct idr		idr;
> 	struct ida_bitmap	*free_bitmap;
> 	};
> 	#define IDA_INIT(name)		{ .idr = IDR_INIT((name).idr), .free_bitmap = 
> NULL, }
> 	#define DEFINE_IDA(name)	struct ida name = IDA_INIT(name)
> 
> 	Any ida related API's expect pointer to this structure.
> 	If we move the variable then it might be bit difficult use ida_xxx() 
> API'same
>>> +
>>> +enum dpb_buf_owner {
>>> +	DRIVER,
>>> +	FIRMWARE,
>>> +};
>>> +
>>>  struct intbuf {
>>>  	struct list_head list;
>>>  	u32 type;
>>> @@ -28,6 +36,8 @@ struct intbuf {
>>>  	void *va;
>>>  	dma_addr_t da;
>>>  	unsigned long attrs;
>>> +	enum dpb_buf_owner owned_by;
>>> +	u32 dpb_out_tag;
>>>  };
>>> 
>>>  bool venus_helper_check_codec(struct venus_inst *inst, u32 
>>> v4l2_pixfmt)
>>> @@ -95,9 +105,16 @@ int venus_helper_queue_dpb_bufs(struct venus_inst 
>>> *inst)
>>>  		fdata.device_addr = buf->da;
>>>  		fdata.buffer_type = buf->type;
>>> 
>>> +		if (buf->owned_by == FIRMWARE)
>>> +			continue;
>>> +
>>> +		fdata.clnt_data = buf->dpb_out_tag;
>>> +
>>>  		ret = hfi_session_process_buf(inst, &fdata);
>>>  		if (ret)
>>>  			goto fail;
>>> +
>>> +		buf->owned_by = FIRMWARE;
>>>  	}
>>> 
>>>  fail:
>>> @@ -110,13 +127,19 @@ int venus_helper_free_dpb_bufs(struct 
>>> venus_inst *inst)
>>>  	struct intbuf *buf, *n;
>>> 
>>>  	list_for_each_entry_safe(buf, n, &inst->dpbbufs, list) {
>>> +		if (buf->owned_by == FIRMWARE)
>>> +			continue;
>>> +
>>> +		ida_free(&dpb_out_tag_ida, buf->dpb_out_tag);
>>> +
>>>  		list_del_init(&buf->list);
>>>  		dma_free_attrs(inst->core->dev, buf->size, buf->va, buf->da,
>>>  			       buf->attrs);
>>>  		kfree(buf);
>>>  	}
>>> 
>>> -	INIT_LIST_HEAD(&inst->dpbbufs);
>>> +	if (list_empty(&inst->dpbbufs))
>>> +		INIT_LIST_HEAD(&inst->dpbbufs);
>>> 
>>>  	return 0;
>>>  }
>>> @@ -134,6 +157,7 @@ int venus_helper_alloc_dpb_bufs(struct venus_inst 
>>> *inst)
>>>  	unsigned int i;
>>>  	u32 count;
>>>  	int ret;
>>> +	int id;
>>> 
>>>  	/* no need to allocate dpb buffers */
>>>  	if (!inst->dpb_fmt)
>>> @@ -171,6 +195,15 @@ int venus_helper_alloc_dpb_bufs(struct 
>>> venus_inst *inst)
>>>  			ret = -ENOMEM;
>>>  			goto fail;
>>>  		}
>>> +		buf->owned_by = DRIVER;
>>> +
>>> +		id = ida_alloc_min(&dpb_out_tag_ida, VB2_MAX_FRAME, GFP_KERNEL);
>>> +		if (id < 0) {
>>> +			ret = id;
>>> +			goto fail;
>>> +		}
>>> +
>>> +		buf->dpb_out_tag = id;
>>> 
>>>  		list_add_tail(&buf->list, &inst->dpbbufs);
>>>  	}
>>> @@ -1365,6 +1398,21 @@ venus_helper_find_buf(struct venus_inst *inst, 
>>> unsigned int type, u32 idx)
>>>  }
>>>  EXPORT_SYMBOL_GPL(venus_helper_find_buf);
>>> 
>>> +void venus_helper_find_dpb_buf(struct venus_inst *inst, struct 
>>> vb2_v4l2_buffer *vbuf,
>>> +			       unsigned int type, unsigned int buf_type, u32 tag)
>> 
>> If this helper will return void then it should be renamed to something
>> like venus_helper_dpb_buf_change_owner().
>  Ok.
>>> +{
>>> +	struct intbuf *dpb_buf;
>>> +
>>> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>>> +	    buf_type == HFI_BUFFER_OUTPUT)
>>> +		list_for_each_entry(dpb_buf, &inst->dpbbufs, list)
>>> +			if (dpb_buf->dpb_out_tag == tag) {
>>> +				dpb_buf->owned_by = DRIVER;
>>> +				break;
>>> +			}
>>> +}
>>> +EXPORT_SYMBOL_GPL(venus_helper_find_dpb_buf);
>>> +
>>>  int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
>>>  {
>>>  	struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>>> diff --git a/drivers/media/platform/qcom/venus/helpers.h 
>>> b/drivers/media/platform/qcom/venus/helpers.h
>>> index e6269b4be3af..17c5aadaec82 100644
>>> --- a/drivers/media/platform/qcom/venus/helpers.h
>>> +++ b/drivers/media/platform/qcom/venus/helpers.h
>>> @@ -14,6 +14,8 @@ struct venus_core;
>>>  bool venus_helper_check_codec(struct venus_inst *inst, u32 
>>> v4l2_pixfmt);
>>>  struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst 
>>> *inst,
>>>  					      unsigned int type, u32 idx);
>>> +void venus_helper_find_dpb_buf(struct venus_inst *inst, struct 
>>> vb2_v4l2_buffer *vbuf,
>>> +			       unsigned int type, unsigned int buf_type, u32 idx);
>>>  void venus_helper_buffers_done(struct venus_inst *inst, unsigned int 
>>> type,
>>>  			       enum vb2_buffer_state state);
>>>  int venus_helper_vb2_buf_init(struct vb2_buffer *vb);
>>> diff --git a/drivers/media/platform/qcom/venus/vdec.c 
>>> b/drivers/media/platform/qcom/venus/vdec.c
>>> index 198e47eb63f4..cafdc3d8e473 100644
>>> --- a/drivers/media/platform/qcom/venus/vdec.c
>>> +++ b/drivers/media/platform/qcom/venus/vdec.c
>>> @@ -1297,6 +1297,7 @@ static void vdec_buf_done(struct venus_inst 
>>> *inst, unsigned int buf_type,
>>>  	struct vb2_v4l2_buffer *vbuf;
>>>  	struct vb2_buffer *vb;
>>>  	unsigned int type;
>>> +	struct intbuf *dpb_buf;
>>> 
>>>  	vdec_pm_touch(inst);
>>> 
>>> @@ -1306,8 +1307,10 @@ static void vdec_buf_done(struct venus_inst 
>>> *inst, unsigned int buf_type,
>>>  		type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>> 
>>>  	vbuf = venus_helper_find_buf(inst, type, tag);
>>> -	if (!vbuf)
>>> +	if (!vbuf) {
>>> +		venus_helper_find_dpb_buf(inst, vbuf, type, buf_type, tag);
>>>  		return;
>>> +	}
>>> 
>>>  	vbuf->flags = flags;
>>>  	vbuf->field = V4L2_FIELD_NONE;
>>> @@ -1622,6 +1625,8 @@ static int vdec_close(struct file *file)
>>> 
>>>  	vdec_pm_get(inst);
>>> 
>>> +	venus_helper_free_dpb_bufs(inst);
>>> +	INIT_LIST_HEAD(&inst->dpbbufs);
>> 
>> This belongs to venus_helper_free_dpb_bufs not here.
>  Ok, I will remove it from here, since in free_dpb() api 
> INIT_LIST_HEAD() when list is free.
>>>  	v4l2_m2m_ctx_release(inst->m2m_ctx);
>>>  	v4l2_m2m_release(inst->m2m_dev);
>>>  	vdec_ctrl_deinit(inst);
>>> 
>> 
>> --
>> regards,
>> Stan
> 
> --
> Thanks,
> Mansur
