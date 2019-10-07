Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB63ECDD69
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 10:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfJGIdK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 04:33:10 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55185 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727201AbfJGIdK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 04:33:10 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HORviKciZjZ8vHORwi5MFm; Mon, 07 Oct 2019 10:33:07 +0200
Subject: Re: [PATCH v2 3/6] media: v4l2-mem2mem: add
 stateless_(try_)decoder_cmd ioctl helpers
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
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <cce04c8e-8211-0fdc-bd62-650aceeb3af1@xs4all.nl>
Date:   Mon, 7 Oct 2019 10:32:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2840939.OS9t7MgvnY@jernej-laptop>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGHd6OSD1FLSR8tNZsbhbHQNPfX75M0V7RaZdh19iAF3oqzeutMCalTO38S5dEhgGLX4RNVSgPgzT3/UuWcy7gPiwkkXJDytiGnBYCQOsv9aYCkRfAj2
 MnYF7yhdMrsRfwMYHBnn7TT/zRAtesy3YXAS248gZ38hAQybYnicKDyYEslBpaTrafJDsw7kwYi3dDSqZgVsPR3r5NKOG+bhH4pAPq2wfjxLDhcnSQUefHpl
 jHy7W1K6AhV1be+LnTLlP+yPDB6sMQxo3zpMvyqoNWFrO7FT4Dkzfgq4lpRWeLxSHccktEbx1Jdh70nkHglrJGvjHUaZTWjLmH3z/I6bsGQMidN4NLUX6pcm
 wf8Q3QejyUWYH1TsrAQ5dqw8D5ZMY2ryWhjTjrQgBynEaA7D2b7Ke9xqIZ3P8nJDLUhnV0h4XudXF3q8VCUu+wEKR4AhhpkmGvB/IlgSpGE8g5KD/qeBW/Gg
 tcJi6TZnMAthHh0RLe0YljVcVsszECBZhT3kJE+vFyYIButqKejfe/bTuibWqAtsUbAK8lfgxSV+/kmGGicRsX3F1TIjseu1TDf94nGT0sljSmVZRmm8oL7a
 gcnIlLSGO81YeTMEY93XIXNZhEEvMoafg2K8ogCL1I20mcPT8Qqf+hA3niWEV+vYC1vkI4cz9G3aaEDERofNo2CWMNgmPboc6s8im/JwDnd5J/rOPJxnRdvS
 RWXEKvLCLpc3Wl2wATEXIhb1K2JJBB0NIpmzQd828jZhc4AS61C4NW0/zr265E02pNE2p2TyK3UK344I3/RrFiV8HRwGjqFyXb/3IjK2c6/YUYTUb48XbSUR
 kijzBakVGAIeQv672mc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/7/19 8:02 AM, Jernej Škrabec wrote:
> Dne petek, 04. oktober 2019 ob 11:21:12 CEST je Hans Verkuil napisal(a):
>> On 9/29/19 10:00 PM, Jernej Skrabec wrote:
>>> These helpers are used by stateless codecs when they support multiple
>>> slices per frame and hold capture buffer flag is set. It's expected that
>>> all such codecs will use this code.
>>>
>>> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>>> ---
>>>
>>>  drivers/media/v4l2-core/v4l2-mem2mem.c | 35 ++++++++++++++++++++++++++
>>>  include/media/v4l2-mem2mem.h           |  4 +++
>>>  2 files changed, 39 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c
>>> b/drivers/media/v4l2-core/v4l2-mem2mem.c index 19937dd3c6f6..2677a07e4c9b
>>> 100644
>>> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
>>> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
>>> @@ -1154,6 +1154,41 @@ int v4l2_m2m_ioctl_try_decoder_cmd(struct file
>>> *file, void *fh,> 
>>>  }
>>>  EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_try_decoder_cmd);
>>>
>>> +int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
>>> +					     struct 
> v4l2_decoder_cmd *dc)
>>> +{
>>> +	if (dc->cmd != V4L2_DEC_CMD_FLUSH)
>>> +		return -EINVAL;
>>> +
>>> +	dc->flags = 0;
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_try_decoder_cmd);
>>> +
>>> +int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
>>> +					 struct 
> v4l2_decoder_cmd *dc)
>>> +{
>>> +	struct v4l2_fh *fh = file->private_data;
>>> +	struct vb2_v4l2_buffer *out_vb, *cap_vb;
>>> +	int ret;
>>> +
>>> +	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, dc);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	out_vb = v4l2_m2m_last_src_buf(fh->m2m_ctx);
>>> +	cap_vb = v4l2_m2m_last_dst_buf(fh->m2m_ctx);
>>
>> I think this should be v4l2_m2m_next_dst_buf. If multiple capture buffers
>> were queued up, then it can only be the first capture buffer that can be
>> 'HELD'.
> 
> I'm pretty sure v4l2_m2m_last_dst_buf() is correct. We want to affect last job 
> in the queue, all jobs before are already properly handled by comparing 
> timestamps.

You're absolutely right.

> 
>>
>> This might solve the race condition you saw with ffmpeg.
> 
> This actually doesn't change anything. ffmpeg currently queues only one job and 
> then waits until it's executed. In this case it actually doesn't matter if 
> "last" or "next" variant is used.

Can you debug this a bit further? I don't want to merge this unless we know what's
going wrong with ffmpeg.

I suspect it is a race condition. I'll reply to patch 6/6 with more info.

Regards,

	Hans

> 
> Best regards,
> Jernej
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> +
>>> +	if (out_vb)
>>> +		out_vb->flags &= ~V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
>>> +	else if (cap_vb && cap_vb->is_held)
>>> +		v4l2_m2m_buf_done(cap_vb, VB2_BUF_STATE_DONE);
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(v4l2_m2m_ioctl_stateless_decoder_cmd);
>>> +
>>>
>>>  /*
>>>  
>>>   * v4l2_file_operations helpers. It is assumed here same lock is used
>>>   * for the output and the capture buffer queue.
>>>
>>> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
>>> index c9fa96c8eed1..8ae2f56c7fa3 100644
>>> --- a/include/media/v4l2-mem2mem.h
>>> +++ b/include/media/v4l2-mem2mem.h
>>> @@ -714,6 +714,10 @@ int v4l2_m2m_ioctl_try_encoder_cmd(struct file *file,
>>> void *fh,> 
>>>  				   struct v4l2_encoder_cmd *ec);
>>>  
>>>  int v4l2_m2m_ioctl_try_decoder_cmd(struct file *file, void *fh,
>>>  
>>>  				   struct v4l2_decoder_cmd *dc);
>>>
>>> +int v4l2_m2m_ioctl_stateless_try_decoder_cmd(struct file *file, void *fh,
>>> +					     struct 
> v4l2_decoder_cmd *dc);
>>> +int v4l2_m2m_ioctl_stateless_decoder_cmd(struct file *file, void *priv,
>>> +					 struct 
> v4l2_decoder_cmd *dc);
>>>
>>>  int v4l2_m2m_fop_mmap(struct file *file, struct vm_area_struct *vma);
>>>  __poll_t v4l2_m2m_fop_poll(struct file *file, poll_table *wait);
> 
> 
> 
> 

