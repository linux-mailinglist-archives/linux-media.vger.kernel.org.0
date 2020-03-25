Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDF2192C7D
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 16:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727677AbgCYP3S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 11:29:18 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:51057 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726102AbgCYP3S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 11:29:18 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id H7xijfeSKBr2bH7xljIHs8; Wed, 25 Mar 2020 16:29:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585150155; bh=WdXxtpAu7Qy0dGjk7oDPYMFVBNZV4Al73YxfsmMk6Ik=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wA7Kt/YD9qCqA9K5RJ7UzomtDMEAsGDmVqAZPf4CDNxmSsSJSFYAV9j/NKQU4gDK0
         C9Qq53pvEHMyxK9/kR5WL34wOv5fHhxb5xXZar0AkOuIR27XXfxj+gm22CSiUqrOTB
         AV2D7TDAwULbiHQoOtrB9oJHTc+aaM53j1upVAZQnuMlEmXXl4kpStbxJ9ntWjexnt
         ZelOwky4R24PT80X1w4vtm9+TQ9kxJXFwNhxawMztP0NiGOTJjuJCnFJ22xycCVgFG
         hVBUHVvhfc+37AKJST/n1uR5RZFRC1p7lLm1uq+IX3votvsG/MkTX2sV5kGXIxTK7r
         MhuBwvZ7oqbHA==
Subject: Re: [PATCH v2 3/8] hantro: Use v4l2_m2m_buf_done_and_job_finish
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Rob Herring <robh@kernel.org>
References: <20200318132108.21873-1-ezequiel@collabora.com>
 <20200318132108.21873-4-ezequiel@collabora.com>
 <13b1efe1-8b52-070b-cf11-b230bd405d3e@xs4all.nl>
 <0a8f6d97e6869ff694aedd67a3176217a885c938.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <50d764ec-1c15-99bd-192b-9aa6ae5bf368@xs4all.nl>
Date:   Wed, 25 Mar 2020 16:28:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0a8f6d97e6869ff694aedd67a3176217a885c938.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAwLaPPmqQFPbd5FOJJRJcEy4huCHCeranRD3okAXOel+Y8Rvf2TToDPTWdTWuY/kl/h8TamrSb8wbvFLOu3WmeHZw/8KJu70r9dMKKsVFOMuVioxFzP
 UBubyswnwHXyeZrkyEdZQRHRaNW4l00P0tfZIyUThJ+vmMKm+sJFi3GRNyxk3bzTzXMK21DQSgmgxXZHQ+nAHAAtVuwGg697X+QQ48yHBHERPEUc8XXoAyrY
 nhTpLr2l77tLE5OV/AL7qPW9f7FoOuBzmiNP5mTG50lUTbhmUmlFxFZHtwmC6css66acAiIW+5RxcrUI133nub2k6IY2fWlsLNLrfsMwX/N4i23qoPcHX+d3
 7x3rlMVtFrk1jNnXsnr4CYySKi83la9H/oiNh3bqjG8Gb6VLVsRkdiCGdWoTIJWRMfxUB+PvnpsmianyOEI8+PHehR6U8iOBIOTe5rBgWG0/LiGdq0eM65y7
 W2UayCjIML1eiDfvLQOJREsQSggRGH/wZCNIypYinZSm57DUdovJ7bWst9A58AQdunz3bWgQUgXYYs87
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/25/20 3:02 PM, Nicolas Dufresne wrote:
> Le mercredi 25 mars 2020 à 09:22 +0100, Hans Verkuil a écrit :
>> On 3/18/20 2:21 PM, Ezequiel Garcia wrote:
>>> Let the core sort out the nuances of returning buffers
>>> to userspace, by using the v4l2_m2m_buf_done_and_job_finish
>>> helper.
>>>
>>> This change also removes usage of buffer sequence fields,
>>> which shouldn't have any meaning for stateless decoders.
>>
>> Uh, why remove this? For one, doesn't this cause fails in v4l2-compliance?
>> Also, while I agree that it is not terribly useful, it doesn't hurt, does it?
>>
>> And the V4L2 spec makes no exception for stateless codecs with respect to the
>> sequence field.
>>
>> Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> The spec also does not say what it means either. As an example, you
> have spec for ALTERNATE interlacing mode that changes the meaning of
> the sequence, but not for alternate H264 fields (which cannot be part
> of the format, since this changes often). We also don't have spec for
> the the sequence behaviour while using HOLD features.

I hate it that the spec changes the sequence meaning for FIELD_ALTERNATE,
I always thought that that made drivers unnecessarily complicated. Unfortunately,
this is something we inherited.

Currently the spec says for sequence:

"Set by the driver, counting the frames (not fields!) in sequence. This field is set
 for both input and output devices."

The only thing missing here is that it should say that for compressed formats this
counts the buffers, since one buffer with compressed data may not have a one-to-one
mapping with frames.

This description for 'sequence' was never updated when compressed data formats were
added, so it is a bit out of date.

> 
> I'm worried we are falling into the test driven trap, were people
> implement features to satisfy a test, while the added complexity don't
> really make sense. Shouldn't we change our approach and opt-out
> features for new type of HW, so that we can keep the drivers code
> saner?

Why wasn't the existing code in this patch sane? Sure, we can change the spec, but
then 1) all existing drivers need to be updated as well, and 2) v4l2-compliance needs
to be changed to test specifically for this class of drivers and ensure that for those
the sequence field is set to 0. Not to mention introducing an exception in the uAPI
where the sequence field suddenly isn't used anymore.

Frankly, I would prefer that the whole sequence handling is moved to videobuf2-v4l2.c.
It really doesn't belong in drivers, with the exception of incrementing the sequence
counter in case of dropped frames.

I think I suggested it when vb2 was being designed, but at the time the preference
was to keep it in the driver. Long time ago, though.

And another reason why I want to keep it: I find it actually useful to see a running
counter: it helps keeping track of how many buffers you've processed since you started
streaming.

Finally, the removal of the sequence counter simply does not belong in this patch.

Regards,

	Hans

> 
>>
>> Regards,
>>
>> 	Hans
>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> ---
>>>  drivers/staging/media/hantro/hantro_drv.c | 27 ++++++++---------------
>>>  1 file changed, 9 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
>>> index 0b1200fc0e1a..ec889d755cd6 100644
>>> --- a/drivers/staging/media/hantro/hantro_drv.c
>>> +++ b/drivers/staging/media/hantro/hantro_drv.c
>>> @@ -94,32 +94,23 @@ static void hantro_job_finish(struct hantro_dev *vpu,
>>>  			      unsigned int bytesused,
>>>  			      enum vb2_buffer_state result)
>>>  {
>>> -	struct vb2_v4l2_buffer *src, *dst;
>>>  	int ret;
>>>  
>>>  	pm_runtime_mark_last_busy(vpu->dev);
>>>  	pm_runtime_put_autosuspend(vpu->dev);
>>>  	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
>>>  
>>> -	src = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>>> -	dst = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>>> -
>>> -	if (WARN_ON(!src))
>>> -		return;
>>> -	if (WARN_ON(!dst))
>>> -		return;
>>> -
>>> -	src->sequence = ctx->sequence_out++;
>>> -	dst->sequence = ctx->sequence_cap++;
>>> -
>>> -	ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
>>> -	if (ret)
>>> -		result = VB2_BUF_STATE_ERROR;
>>> +	if (ctx->buf_finish) {
>>> +		struct vb2_v4l2_buffer *dst;
>>>  
>>> -	v4l2_m2m_buf_done(src, result);
>>> -	v4l2_m2m_buf_done(dst, result);
>>> +		dst = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
>>> +		ret = ctx->buf_finish(ctx, &dst->vb2_buf, bytesused);
>>> +		if (ret)
>>> +			result = VB2_BUF_STATE_ERROR;
>>> +	}
>>>  
>>> -	v4l2_m2m_job_finish(vpu->m2m_dev, ctx->fh.m2m_ctx);
>>> +	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
>>> +					 result);
>>>  }
>>>  
>>>  void hantro_irq_done(struct hantro_dev *vpu, unsigned int bytesused,
>>>
> 

