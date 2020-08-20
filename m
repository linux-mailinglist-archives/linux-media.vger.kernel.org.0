Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F77C24BAB5
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 14:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730254AbgHTMQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 08:16:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:58488 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729684AbgHTMQS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 08:16:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id EDA2529A779
Subject: Re: [PATCH v2 05/14] media: staging: rkisp1: params: upon stream
 stop, iterate a local list to return the buffers
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-6-dafna.hirschfeld@collabora.com>
 <695451da-c7af-a12c-f308-c45675b8f3aa@collabora.com>
 <33ed026c-f014-0fff-2f19-afc1548e80f2@xs4all.nl>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <d0dadf49-d250-19b0-e165-994587b2f03d@collabora.com>
Date:   Thu, 20 Aug 2020 09:16:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <33ed026c-f014-0fff-2f19-afc1548e80f2@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/20/20 6:27 AM, Hans Verkuil wrote:
> On 17/08/2020 23:47, Helen Koike wrote:
>> Hi Dafna,
>>
>> On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
>>> The code in '.stop_streaming' callback releases and acquire the lock
>>> at each iteration when returning the buffers.
>>> Holding the lock disables interrupts so it should be minimized.
>>> To make the code cleaner and still minimize holding the lock,
>>> the buffer list is first moved to a local list and
>>> then can be iterated without the lock.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>
>> lgtm
>>
>> Helen Koike <helen.koike@collabora.com>
> 
> Missing 'Acked-by:' tag?

Ops, yes

Acked-by: Helen Koike <helen.koike@collabora.com>

> 
> Hans
> 
>>
>> Thanks
>> Helen
>>
>>> ---
>>>  drivers/staging/media/rkisp1/rkisp1-params.c | 31 +++++++-------------
>>>  1 file changed, 11 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
>>> index 0c2bb2eefb22..6a76c586e916 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
>>> @@ -1477,32 +1477,23 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>>>  {
>>>  	struct rkisp1_params *params = vq->drv_priv;
>>>  	struct rkisp1_buffer *buf;
>>> +	struct list_head tmp_list;
>>>  	unsigned long flags;
>>> -	unsigned int i;
>>>  
>>> -	/* stop params input firstly */
>>> +	INIT_LIST_HEAD(&tmp_list);
>>> +
>>> +	/*
>>> +	 * we first move the buffers into a local list 'tmp_list'
>>> +	 * and then we can iterate it and call vb2_buffer_done
>>> +	 * without holding the lock
>>> +	 */
>>>  	spin_lock_irqsave(&params->config_lock, flags);
>>>  	params->is_streaming = false;
>>> +	list_cut_position(&tmp_list, &params->params, params->params.prev);
>>>  	spin_unlock_irqrestore(&params->config_lock, flags);
>>>  
>>> -	for (i = 0; i < RKISP1_ISP_PARAMS_REQ_BUFS_MAX; i++) {
>>> -		spin_lock_irqsave(&params->config_lock, flags);
>>> -		if (!list_empty(&params->params)) {
>>> -			buf = list_first_entry(&params->params,
>>> -					       struct rkisp1_buffer, queue);
>>> -			list_del(&buf->queue);
>>> -			spin_unlock_irqrestore(&params->config_lock,
>>> -					       flags);
>>> -		} else {
>>> -			spin_unlock_irqrestore(&params->config_lock,
>>> -					       flags);
>>> -			break;
>>> -		}
>>> -
>>> -		if (buf)
>>> -			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>> -		buf = NULL;
>>> -	}
>>> +	list_for_each_entry(buf, &tmp_list, queue)
>>> +		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>>  }
>>>  
>>>  static int
>>>
> 
