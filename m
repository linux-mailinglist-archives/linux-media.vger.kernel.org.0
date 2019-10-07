Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD642CDE68
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 11:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbfJGJo0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 05:44:26 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:50589 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726010AbfJGJo0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 05:44:26 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HPZ0iLENKjZ8vHPZ1i5nUm; Mon, 07 Oct 2019 11:44:24 +0200
Subject: Re: [PATCH v2 3/6] media: v4l2-mem2mem: add
 stateless_(try_)decoder_cmd ioctl helpers
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
Cc:     mchehab@kernel.org, paul.kocialkowski@bootlin.com,
        mripard@kernel.org, pawel@osciak.com, m.szyprowski@samsung.com,
        kyungmin.park@samsung.com, tfiga@chromium.org, wens@csie.org,
        gregkh@linuxfoundation.org, boris.brezillon@collabora.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
        ezequiel@collabora.com, jonas@kwiboo.se
References: <20190929200023.215831-1-jernej.skrabec@siol.net>
 <20190929200023.215831-4-jernej.skrabec@siol.net>
 <6c7eeaf1-18bb-1c7e-7938-a3eb5af100b6@xs4all.nl>
 <2840939.OS9t7MgvnY@jernej-laptop>
 <cce04c8e-8211-0fdc-bd62-650aceeb3af1@xs4all.nl>
Message-ID: <bc9e3e73-c2aa-c70e-5d81-f77d1bf898e7@xs4all.nl>
Date:   Mon, 7 Oct 2019 11:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <cce04c8e-8211-0fdc-bd62-650aceeb3af1@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfBhg/py6knYnvxMkJcNfVQ+HaYw1/5QCmKHnBYtRPv76Qm2AoD1c/Ql55QjfH0qG5LPLO1GSLVNPHUFKeJlbTOeuOz7RbyBpURJPL14hyhGGupB0RNCp
 mRKRFdLcj/L52Oxde2u3TfEr9XaNfGHsAfgV3C9SN6kvhZPBjvcMRd2eXePmKr43x76IDztL9jl7Dykw8+7wOgOqBbqyzKD/MvQMpZWjCL2WX4WiYdtGjDNW
 x3QLglAwFbVgyGcn8zmLoFn469yVAP1AmOwY58Uy7WCNxhvofVAyc1vfsn7nRUhcXIyQl4A75L9SrOVWvBmCqnQV/7UHRidLfMr8rRUgQG74dIvpwmdfLLit
 IaYQp/ZbAe8g2wf39hvt5sqMeccaLxo9liVvx9p1BplHSykj/XUSSx3kjsSxRwjidSSl2jJ+p6GRxT8Mq8NhNXihAyHMQxgRl1qwKyVg8V3uJZDNT1En7ndD
 TvT7Y3o2lD7kjTOx773li/ShhTUO03Rb0KNWN41ZondLwOtrhdk5dxRy9Eyo9e5Vhgf/SsMTasQ4t8y0FyNBURY6pCECM2eWv/PZMHLjG8zcJ52tHccbu2tH
 tY0NliwdJTMkxVb+CloozwUHKG+iE/sWOBPGHVPFZNf7GWk+VxncTNjC5dRKV2Z70y7FOkttLisWv60oWmTItcad0A7cUiU0vmc+vjIPK/aFo2CHsXfIQKwS
 n3t0r5yi3Q3mokY5rkoTseCC7cQTmcLVGgd4q0IT33WoLzcGwXvedEEybcr92xfrbIjFv49/SFv3ACNBnaGGelMyhxZZv0ps8jMRvSvrJAXWcVbVMNPcABz2
 2qJ/vX1ll17fLGgpykc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/7/19 10:32 AM, Hans Verkuil wrote:
> On 10/7/19 8:02 AM, Jernej Škrabec wrote:
>> Dne petek, 04. oktober 2019 ob 11:21:12 CEST je Hans Verkuil napisal(a):
>>> On 9/29/19 10:00 PM, Jernej Skrabec wrote:
>>>> These helpers are used by stateless codecs when they support multiple
>>>> slices per frame and hold capture buffer flag is set. It's expected that
>>>> all such codecs will use this code.
>>>>
>>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>>>> ---
>>>>
>>>>  drivers/media/v4l2-core/v4l2-mem2mem.c | 35 ++++++++++++++++++++++++++
>>>>  include/media/v4l2-mem2mem.h           |  4 +++
>>>>  2 files changed, 39 insertions(+)
>>>>
>>>> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c
>>>> b/drivers/media/v4l2-core/v4l2-mem2mem.c index 19937dd3c6f6..2677a07e4c9b
>>>> 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
>>>> @@ -1154,6 +1154,41 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file
>>>> *file, void *fh,> 
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
>>>>
>>>> +int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
>>>> +					     struct 
>> v4l2_decoder_cmd *dc)
>>>> +{
>>>> +	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
>>>> +		return -EINVAL;
>>>> +
>>>> +	dc->flags = 0;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
>>>> +
>>>> +int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
>>>> +					 struct 
>> v4l2_decoder_cmd *dc)
>>>> +{
>>>> +	struct v4l2_fh *fh = file->private_data;
>>>> +	struct vb2_v4l2_buffer *out_vb, *cap_vb;
>>>> +	int ret;
>>>> +
>>>> +	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>> +
>>>> +	out_vb = v4l2_m2m_last_src_buf(fh->m2m_ctx);
>>>> +	cap_vb = v4l2_m2m_last_dst_buf(fh->m2m_ctx);
>>>
>>> I think this should be v4l2_m2m_next_dst_buf. If multiple capture buffers
>>> were queued up, then it can only be the first capture buffer that can be
>>> 'HELD'.
>>
>> I'm pretty sure v4l2_m2m_last_dst_buf() is correct. We want to affect last job 
>> in the queue, all jobs before are already properly handled by comparing 
>> timestamps.
> 
> You're absolutely right.
> 
>>
>>>
>>> This might solve the race condition you saw with ffmpeg.
>>
>> This actually doesn't change anything. ffmpeg currently queues only one job and 
>> then waits until it's executed. In this case it actually doesn't matter if 
>> "last" or "next" variant is used.
> 
> Can you debug this a bit further? I don't want to merge this unless we know what's
> going wrong with ffmpeg.
> 
> I suspect it is a race condition. I'll reply to patch 6/6 with more info.

I've decided to make a v3 of this series. There are major locking issues with this
and this will require a bit of rework.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Best regards,
>> Jernej
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>> +
>>>> +	if (out_vb)
>>>> +		out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
>>>> +	else if (cap_vb && cap_vb->is_held)
>>>> +		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_decoder_cmd);
>>>> +
>>>>
>>>>  /*
>>>>  
>>>>   * v4l2_file_operations helpers. It is assumed here same lock is used
>>>>   * for the output and the capture buffer queue.
>>>>
>>>> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
>>>> index c9fa96c8eed1..8ae2f56c7fa3 100644
>>>> --- a/include/media/v4l2-mem2mem.h
>>>> +++ b/include/media/v4l2-mem2mem.h
>>>> @@ -714,6 +714,10 @@ int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file,
>>>> void *fh,> 
>>>>  				   struct v4l2_encoder_cmd *ec);
>>>>  
>>>>  int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
>>>>  
>>>>  				   struct v4l2_decoder_cmd *dc);
>>>>
>>>> +int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
>>>> +					     struct 
>> v4l2_decoder_cmd *dc);
>>>> +int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
>>>> +					 struct 
>> v4l2_decoder_cmd *dc);
>>>>
>>>>  int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
>>>>  __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);
>>
>>
>>
>>
> 

