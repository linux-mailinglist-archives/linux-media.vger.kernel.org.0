Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A70FF244898
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 13:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbgHNLEc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 07:04:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41866 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgHNLEc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 07:04:32 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 92DAA29A87C
Subject: Re: [PATCH 3/3] media: staging: rkisp1: params: in 'stop_streaming'
 don't release the lock while returning buffers
To:     Tomasz Figa <tfiga@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Helen Koike <helen.koike@collabora.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
References: <20200625174257.22216-1-dafna.hirschfeld@collabora.com>
 <20200625174257.22216-4-dafna.hirschfeld@collabora.com>
 <e269f2f5-c24c-7009-e624-3545af206709@arm.com>
 <CAAFQd5AsJG=YJC4eG6+qdt_dPyr-dwcXrmujxLaHfoe9==Es1g@mail.gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <1e9097b9-ce61-448d-c00b-24f4eadb96a6@collabora.com>
Date:   Fri, 14 Aug 2020 13:04:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5AsJG=YJC4eG6+qdt_dPyr-dwcXrmujxLaHfoe9==Es1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 26.06.20 um 16:03 schrieb Tomasz Figa:
> On Fri, Jun 26, 2020 at 3:32 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> Hi Dafna,
>>
>> On 2020-06-25 18:42, Dafna Hirschfeld wrote:
>>> In the stop_streaming callback 'rkisp1_params_vb2_stop_streaming'
>>> there is no need to release the lock 'config_lock' and then acquire
>>> it again at each iteration when returning all buffers.
>>> This is because the stream is about to end and there is no need
>>> to let the isr access a buffer.
>>>
>>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
>>> ---
>>>    drivers/staging/media/rkisp1/rkisp1-params.c | 7 +------
>>>    1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
>>> index bf006dbeee2d..5169b02731f1 100644
>>> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
>>> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
>>> @@ -1488,19 +1488,13 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>>>        /* stop params input firstly */
>>>        spin_lock_irqsave(&params->config_lock, flags);
>>>        params->is_streaming = false;
>>> -     spin_unlock_irqrestore(&params->config_lock, flags);
>>>
>>>        for (i = 0; i < RKISP1_ISP_PARAMS_REQ_BUFS_MAX; i++) {
>>> -             spin_lock_irqsave(&params->config_lock, flags);
>>>                if (!list_empty(&params->params)) {
>>>                        buf = list_first_entry(&params->params,
>>>                                               struct rkisp1_buffer, queue);
>>>                        list_del(&buf->queue);
>>> -                     spin_unlock_irqrestore(&params->config_lock,
>>> -                                            flags);
>>>                } else {
>>> -                     spin_unlock_irqrestore(&params->config_lock,
>>> -                                            flags);
>>>                        break;
>>>                }
>>
>> Just skimming through out of idle curiosity I was going to comment that
>> if you end up with this pattern:
>>
>>          if (!x) {
>>                  //do stuff
>>          } else {
>>                  break;
>>          }
>>
>> it would be better as:
>>
>>          if (x)
>>                  break;
>>          //do stuff
>>
>> However I then went and looked at the whole function and frankly it's a
>> bit of a WTF. As best I could decipher, this whole crazy loop appears to
>> be a baroque reinvention of:
>>
>>          list_for_each_entry_safe(&params->params, ..., buf) {
>>                  list_del(&buf->queue);
>>                  vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>>          }
>>
>> (assuming from context that the list should never contain more than
>> RKISP1_ISP_PARAMS_REQ_BUFS_MAX entries in the first place)
> 
> Or if we want to avoid disabling the interrupts for the whole
> iteration, we could use list_splice() to move all the entries of

Hi, list_splice combines two lists together, I guess you meant list_cut_position
which cut a list into two

Thanks,
Dafna

> params->params to a local list_head under the spinlock, release it and
> then loop over the local head. As a side effect, one could even drop
> list_del() and switch to the non-safe variant of
> list_for_each_entry().
> 
> Best regards,
> Tomasz
> 
