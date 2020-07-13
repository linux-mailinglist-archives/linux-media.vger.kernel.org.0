Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D4E21D773
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2020 15:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbgGMNpd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jul 2020 09:45:33 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:41681 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728950AbgGMNpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jul 2020 09:45:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id uylrjEcO05flquyluj0vql; Mon, 13 Jul 2020 15:45:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594647930; bh=55qKzuUVLIDKWl3ypb4HXUPqMSZ9yHHADOpO7HsTkww=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TQQYk3fKebd82NCcOHsoHdy/yAkCBVa5cap1ndHUR4/WFRJjdzipBx/L/YTI8L3lb
         SgkqDuNGrFceln8TNbozELpVBIYXNa8adPRup/f2Qedbvs9VUNmVdkL2pyA/YVHMot
         ld9DWAebROY4Zz9wOYxNIK18JAFktykTbaBEbs4TV9ozuruGLeYwsvyIxQUrn0dFAU
         NUaI1kpauAFyYNO0T9uRH2I9ixudQRi4F3AdUNPA4hJhGH+WpOCnG06Kheb9PaF0tK
         z7VExRQhi/9Tj6fiE1TmiFasyQR88kQPvRUlYlGdpWgyxbDzrDzOuOnGffu2YffuNf
         KRpD7K8zh04vg==
Subject: Re: [PATCH v3] media: videobuf2: Print videobuf2 buffer state by name
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20200710125129.159710-1-ezequiel@collabora.com>
 <20200710130010.160712-1-ezequiel@collabora.com>
 <cf01d95f-d9fb-5b0f-a81e-e97d3deabb18@xs4all.nl>
 <2e6b728bf8360a06025a1057568102ed40919bb7.camel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <afc88186-1381-4379-c145-fa47da28380e@xs4all.nl>
Date:   Mon, 13 Jul 2020 15:45:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2e6b728bf8360a06025a1057568102ed40919bb7.camel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNuCpzRDdd8pxEaT8hShpNgbe4nuwjs7xuJH/hZPz8jeM3XjfGi2A0IYyhtU+wPlIN3cyHtbsErmG7Ay/dTAaL0ygCWb1VCgTAyWYsCI7rbT1RrP4wx0
 kSO80anfJ+QCwDjPzeCAnH2juPYPa2gKDDl9GkY+KnBTnOOSAlwD9kOHyQ4uXQfDq7Vpl6u5sS/JmYdPpToQIHHfVCM6u7dmMEsYa07SSOPP/x6EgoUnNNbs
 S+AZJ9H/xPfeLJpMt3eiApNkooFAEdiWtkDn99QQpFaC2QL5nXuly+q0vOjsP67o
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/07/2020 15:10, Ezequiel Garcia wrote:
> On Mon, 2020-07-13 at 11:31 +0200, Hans Verkuil wrote:
>> On 10/07/2020 15:00, Ezequiel Garcia wrote:
>>> For debugging purposes, seeing the state integer
>>> representation is really inconvenient.
>>>
>>> Improve this and be developer-friendly by printing
>>> the state name instead.
>>>
>>> Suggested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> ---
>>> v3:
>>> * Drop static modifier from the now local name array.
>>> v2:
>>> * Use a proper function instead of a C macro.
>>>
>>>  .../media/common/videobuf2/videobuf2-core.c   | 35 ++++++++++++++-----
>>>  1 file changed, 27 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
>>> index abaf28e057eb..d5942cd455bf 100644
>>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
>>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
>>> @@ -191,6 +191,23 @@ module_param(debug, int, 0644);
>>>  static void __vb2_queue_cancel(struct vb2_queue *q);
>>>  static void __enqueue_in_driver(struct vb2_buffer *vb);
>>>  
>>> +static inline const char *vb2_state_name(enum vb2_buffer_state s)
>>
>> Why inline? That adds nothing of value. It's too big for an inline
>> anyway and it's only used when debug is on.
>>
> 
> Yes, you're right.
> 
>>> +{
>>> +	const char * const state_names[] = {
>>
>> This really should be static, local or not. I'm not sure why you dropped
>> that. Possibly because of the inline?
>>
> 
> I was hesitant about this, as you can see. After some thought,
> it seemed a waste of space to have this array allocated statically.
> 
> Could you clarify this for me? Why do you believe it should be static?

If it is not static, then the compiler could create this array every time you
enter this function. It probably is smart enough to avoid that, but there is
no guarantee. This array is constant, will never change, so why not make it
static? I'm not really should what you waste here.

Regards,

	Hans

> 
> Thanks,
> Ezequiel
> 
>> Regards,
>>
>> 	Hans
>>
>>> +		[VB2_BUF_STATE_DEQUEUED] = "dequeued",
>>> +		[VB2_BUF_STATE_IN_REQUEST] = "in request",
>>> +		[VB2_BUF_STATE_PREPARING] = "preparing",
>>> +		[VB2_BUF_STATE_QUEUED] = "queued",
>>> +		[VB2_BUF_STATE_ACTIVE] = "active",
>>> +		[VB2_BUF_STATE_DONE] = "done",
>>> +		[VB2_BUF_STATE_ERROR] = "error",
>>> +	};
>>> +
>>> +	if ((unsigned int)(s) < ARRAY_SIZE(state_names))
>>> +		return state_names[s];
>>> +	return "unknown";
>>> +}
>>> +
>>>  /*
>>>   * __vb2_buf_mem_alloc() - allocate video memory for the given buffer
>>>   */
>>> @@ -1015,8 +1032,8 @@ void vb2_buffer_done(struct vb2_buffer *vb, enum vb2_buffer_state state)
>>>  	 */
>>>  	vb->cnt_buf_done++;
>>>  #endif
>>> -	dprintk(q, 4, "done processing on buffer %d, state: %d\n",
>>> -			vb->index, state);
>>> +	dprintk(q, 4, "done processing on buffer %d, state: %s\n",
>>> +		vb->index, vb2_state_name(state));
>>>  
>>>  	if (state != VB2_BUF_STATE_QUEUED)
>>>  		__vb2_buf_mem_finish(vb);
>>> @@ -1490,8 +1507,8 @@ int vb2_core_prepare_buf(struct vb2_queue *q, unsigned int index, void *pb)
>>>  
>>>  	vb = q->bufs[index];
>>>  	if (vb->state != VB2_BUF_STATE_DEQUEUED) {
>>> -		dprintk(q, 1, "invalid buffer state %d\n",
>>> -			vb->state);
>>> +		dprintk(q, 1, "invalid buffer state %s\n",
>>> +			vb2_state_name(vb->state));
>>>  		return -EINVAL;
>>>  	}
>>>  	if (vb->prepared) {
>>> @@ -1670,7 +1687,8 @@ int vb2_core_qbuf(struct vb2_queue *q, unsigned int index, void *pb,
>>>  		dprintk(q, 1, "buffer still being prepared\n");
>>>  		return -EINVAL;
>>>  	default:
>>> -		dprintk(q, 1, "invalid buffer state %d\n", vb->state);
>>> +		dprintk(q, 1, "invalid buffer state %s\n",
>>> +			vb2_state_name(vb->state));
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> @@ -1884,7 +1902,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
>>>  		dprintk(q, 3, "returning done buffer with errors\n");
>>>  		break;
>>>  	default:
>>> -		dprintk(q, 1, "invalid buffer state\n");
>>> +		dprintk(q, 1, "invalid buffer state %s\n",
>>> +			vb2_state_name(vb->state));
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> @@ -1915,8 +1934,8 @@ int vb2_core_dqbuf(struct vb2_queue *q, unsigned int *pindex, void *pb,
>>>  		media_request_put(vb->request);
>>>  	vb->request = NULL;
>>>  
>>> -	dprintk(q, 2, "dqbuf of buffer %d, with state %d\n",
>>> -			vb->index, vb->state);
>>> +	dprintk(q, 2, "dqbuf of buffer %d, state: %s\n",
>>> +		vb->index, vb2_state_name(vb->state));
>>>  
>>>  	return 0;
>>>  
>>>
> 
> 

