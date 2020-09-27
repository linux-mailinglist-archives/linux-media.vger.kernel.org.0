Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B036627A079
	for <lists+linux-media@lfdr.de>; Sun, 27 Sep 2020 12:25:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgI0KZc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 27 Sep 2020 06:25:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34940 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgI0KZc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 27 Sep 2020 06:25:32 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id CF6E328D485
Subject: Fwd: Re: [PATCH v3 04/12] media: staging: rkisp1: params: avoid using
 buffer if params is not streaming
References: <771916ba-8045-3f9a-3b62-a2af7b1489de@collabora.com>
To:     Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        dafna Hirschfeld <dafna3@gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
X-Forwarded-Message-Id: <771916ba-8045-3f9a-3b62-a2af7b1489de@collabora.com>
Message-ID: <78ec2b27-665b-eff7-8c4b-53dac9608a57@collabora.com>
Date:   Sun, 27 Sep 2020 12:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <771916ba-8045-3f9a-3b62-a2af7b1489de@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Am 25.09.20 um 22:16 schrieb Tomasz Figa:
> Hi Dafna,
> 
> On Tue, Sep 22, 2020 at 01:33:54PM +0200, Dafna Hirschfeld wrote:
>> Currently, the first buffer queued in the params node is returned
>> immediately to userspace and a copy of it is saved in the field
>> 'cur_params'. The copy is later used for the first configuration
>> when the stream is initiated by one of selfpath/mainpath capture nodes.
> 
> Thank you for the patch. Please see my comments inline.
> 
>>
>> There are 3 problems with this implementation:
>> - The first params buffer is applied and returned to userspace even if
>> userspace never calls to streamon on the params node.
> 
> How is this possible? VB2 doesn't call the .buf_queue callback until streaming is started.

To my knowledge, userspace can first queue the buffers and after that start
the stream by calling 'streamon'.

> 
>> - If the first params buffer is queued after the stream started on the
>> params node then it will return to userspace but will never be used.
> 
> Why?

The first params buffer is ignored if it is queued after
selfpath/mainpath already started to stream.
This is because the buffer 'params->cur_params' is applied in function
'rkisp1_params_config_parameter' which is called when streaming
from mainpath/selfpath starts.

> 
>> - The frame_sequence of the first buffer is set to -1 if the main/selfpath
>> did not start streaming.
> 
> Indeed, this is invalid. The sequence number should correspond to the
> sequence number of the frame that the parameters were applied to, i.e. the
> parameter buffer A and the video buffer B dequeued from the CAPTURE node
> which contains the first frame processed with the parameters from buffer A
> should have the same sequence number.
> 
>>
>> A correct implementation is to apply the first params buffer when stream
>> is started from mainpath/selfpath and only if params is also streaming.
>>
>> The patch adds a new function 'rkisp1_params_apply_params_cfg' which takes
>> a buffer from the buffers queue, apply it and returns it to userspace.
>> The function is called from the irq handler and when main/selfpath stream
>> starts - in the function 'rkisp1_params_config_parameter'
>>
>> Also remove the fields 'cur_params', 'is_first_params' which are no
>> more needed.
>>
>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Acked-by: Helen Koike <helen.koike@collabora.com>
>> ---
>> changes since v2:
>> declare function 'rkisp1_params_apply_params_cfg' as static
>> to fix a warning reported by 'kernel test robot <lkp@intel.com>'
>> ---
>>   drivers/staging/media/rkisp1/rkisp1-common.h |  4 --
>>   drivers/staging/media/rkisp1/rkisp1-params.c | 50 ++++++++------------
>>   2 files changed, 20 insertions(+), 34 deletions(-)
>>
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
>> index 992d8ec4c448..232bee92d0eb 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
>> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
>> @@ -262,10 +262,8 @@ struct rkisp1_stats {
>>    * @rkisp1:		pointer to the rkisp1 device
>>    * @config_lock:	locks the buffer list 'params' and 'is_streaming'
>>    * @params:		queue of rkisp1_buffer
>> - * @cur_params:		the first params values from userspace
>>    * @vdev_fmt:		v4l2_format of the metadata format
>>    * @is_streaming:	device is streaming
>> - * @is_first_params:	the first params should take effect immediately
>>    * @quantization:	the quantization configured on the isp's src pad
>>    * @raw_type:		the bayer pattern on the isp video sink pad
>>    */
>> @@ -275,10 +273,8 @@ struct rkisp1_params {
>>   
>>   	spinlock_t config_lock; /* locks the buffers list 'params' and 'is_streaming' */
>>   	struct list_head params;
>> -	struct rkisp1_params_cfg cur_params;
>>   	struct v4l2_format vdev_fmt;
>>   	bool is_streaming;
>> -	bool is_first_params;
>>   
>>   	enum v4l2_quantization quantization;
>>   	enum rkisp1_fmt_raw_pat_type raw_type;
>> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
>> index ab2deb57b1eb..e8049a50575f 100644
>> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
>> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
>> @@ -1185,23 +1185,14 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>>   	}
>>   }
>>   
>> -void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>> +static void rkisp1_params_apply_params_cfg(struct rkisp1_params *params,
>> +					   unsigned int frame_sequence)
> 
> Should we call this _locked() since it is expected that the config_lock is
> held when called?

okey, I'll change the name.

> 
> To signify such condition, the __must_hold sparse annotation can be used.
> 
>>   {
>> -	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
>> -	struct rkisp1_params *params = &rkisp1->params;
>>   	struct rkisp1_params_cfg *new_params;
>>   	struct rkisp1_buffer *cur_buf = NULL;
>>   
>> -	spin_lock(&params->config_lock);
>> -	if (!params->is_streaming) {
>> -		spin_unlock(&params->config_lock);
>> -		return;
>> -	}
>> -
>> -	if (list_empty(&params->params)) {
>> -		spin_unlock(&params->config_lock);
>> +	if (list_empty(&params->params))
>>   		return;
>> -	}
>>   
>>   	cur_buf = list_first_entry(&params->params,
>>   				   struct rkisp1_buffer, queue);
>> @@ -1218,6 +1209,20 @@ void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>>   
>>   	cur_buf->vb.sequence = frame_sequence;
>>   	vb2_buffer_done(&cur_buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>> +}
>> +
>> +void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>> +{
>> +	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
>> +	struct rkisp1_params *params = &rkisp1->params;
>> +
>> +	spin_lock(&params->config_lock);
>> +	if (!params->is_streaming) {
> 
> Do we need this check? Wouldn't the queue be empty if params is not
> streaming?

Hi,
userspace can queue buffers before start streaming or without ever start streaming,
so if there are buffers in the queue it does not mean that the params is streaming.



> 
> Also, if we decide that we need the check, we could replace the private
> is_streaming flag with vb2_is_streaming().

right,


Thanks,
Dafna

> 
> Best regards,
> Tomasz
> 
