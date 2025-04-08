Return-Path: <linux-media+bounces-29587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E7A7F7D7
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 10:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FCDA3AD602
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 08:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55931263F4D;
	Tue,  8 Apr 2025 08:28:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC66F26158A;
	Tue,  8 Apr 2025 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100897; cv=none; b=OpkqDmOIuICGxv+5dyPv6stSeIkG6pefPrg2N1q0S1tPXmoCMCv+qL+UiuPCfugzn4c065hB02ad+lVOKYYfJ/Q/2CrveWsP+6beYFY5jQb4Tvsb7agMNA7l6CRX3eGWR1sWxCPj4TbB6/HoefvMch1hVywuPc0ththMuCpXlao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100897; c=relaxed/simple;
	bh=EkKiSAtgFr61y35dU/f1mICxwqmrAazqIVX6h5yiewk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ry4rtvYBWFr7kNPhki7SAA00wUWQu1jpw7zgrejd2ykNzRC5cXqeJde1EiUSTTxH8SrQSHxDzpj6LXSSX+abCvpfhgYUoMz5mmfbUQ5Thn54xlgR9Y/V6dW+zAj+owht7EnMUgDsm3LgnL3xxRF9IEMhK7XSVTld5pABgkKEpws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC28C4CEED;
	Tue,  8 Apr 2025 08:28:12 +0000 (UTC)
Message-ID: <35d34100-7013-4acb-a5a6-3408e0f45d9d@xs4all.nl>
Date: Tue, 8 Apr 2025 10:28:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/12] media: rkvdec: Add get_image_fmt ops
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Alex Bee <knaerzche@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
 <20250225-rkvdec_h264_high10_and_422_support-v7-9-7992a68a4910@collabora.com>
 <e6b99109-bd35-46ff-a4e2-eb69b549dcbc@xs4all.nl>
 <77bdada5dce991842e377759c8e173ada115694f.camel@collabora.com>
 <47c0011f-693d-4c94-8a1b-f0174f3d5b89@xs4all.nl>
 <19a11d429d9078b82f27e108aa5ac80cc4041bef.camel@collabora.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <19a11d429d9078b82f27e108aa5ac80cc4041bef.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/04/2025 16:59, Nicolas Dufresne wrote:
> Le lundi 07 avril 2025 à 16:17 +0200, Hans Verkuil a écrit :
>> On 07/04/2025 15:52, Nicolas Dufresne wrote:
>>> Le lundi 07 avril 2025 à 13:09 +0200, Hans Verkuil a écrit :
>>>> On 25/02/2025 10:40, Sebastian Fricke wrote:
>>>>> From: Jonas Karlman <jonas@kwiboo.se>
>>>>>
>>>>> Add support for a get_image_fmt() ops that returns the required image
>>>>> format.
>>>>>
>>>>> The CAPTURE format is reset when the required image format changes and
>>>>> the buffer queue is not busy.
>>>>>
>>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
>>>>> ---
>>>>>  drivers/staging/media/rkvdec/rkvdec.c | 49 +++++++++++++++++++++++++++++++++--
>>>>>  drivers/staging/media/rkvdec/rkvdec.h |  2 ++
>>>>>  2 files changed, 49 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
>>>>> index 70154948b4e32e2c439f259b0f1e1bbc8b52b063..5394079509305c619f1d0c1f542bfc409317c3b7 100644
>>>>> --- a/drivers/staging/media/rkvdec/rkvdec.c
>>>>> +++ b/drivers/staging/media/rkvdec/rkvdec.c
>>>>> @@ -111,15 +111,60 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>>>>>  {
>>>>>  	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
>>>>>  	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
>>>>> +	struct v4l2_pix_format_mplane *pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
>>>>> +	enum rkvdec_image_fmt image_fmt;
>>>>> +	struct vb2_queue *vq;
>>>>> +	int ret;
>>>>> +
>>>>> +	if (desc->ops->try_ctrl) {
>>>>> +		ret = desc->ops->try_ctrl(ctx, ctrl);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +	}
>>>>> +
>>>>> +	if (!desc->ops->get_image_fmt)
>>>>> +		return 0;
>>>>>  
>>>>> -	if (desc->ops->try_ctrl)
>>>>> -		return desc->ops->try_ctrl(ctx, ctrl);
>>>>> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
>>>>> +	if (ctx->image_fmt == image_fmt)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, image_fmt))
>>>>> +		return 0;
>>>>> +
>>>>> +	/* format change not allowed when queue is busy */
>>>>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>>>>> +			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>>>> +	if (vb2_is_busy(vq))
>>>>> +		return -EINVAL;
>>
>> Looking closer, this code is just wrong. It does these format change
>> tests for any control, so if more controls are added in the future, then
>> those will be checked the same way, which makes no sense.
> 
> "Just wrong" should be kept for code that is semantically incorrect,
> just a suggestion for choice of wording.

Having vb2_is_busy in a try function (whether trying a control or a format)
is simply wrong. Having these checks at a high level (i.e. being done for
any control) is asking for problems in the future. It only works right
now because there is just one control.

> 
>>
>> These tests belong to the actual control that you 'try'. In this case
>> rkvdec_h264_validate_sps(). This function already checks the width and
>> height, but it should also check the image format. It is all in the
>> wrong place.
> 
> We can do that too. Though, this was generalized since once you enable
> the other codecs, you endup with code duplication. I know this series
> is an extract from a larger one.
> 
> So let's suggest to make a helper that combines rkvdec_is_valid_fmt()
> and the busy check. Though on that, please reply to my comment below
> (which you skipped).

Absolutely, this needs a helper function.

> 
>>
>>>>
>>>> This makes no sense to me. This just tries a control, and that should just
>>>> work, regardless of vb2_is_busy(). It's a 'try', so you are not actually
>>>> changing anything.
>>>
>>> See comment below, notice that this code is only reached if the control
>>> introduce parameters that are not compatible with the current capture
>>> queue fmt. The entire function uses "success" early exit, so the
>>> further down you get in the function, the less likely your control is
>>> valid.
>>>
>>>>
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>> +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
>>>>> +{
>>
>> If there is a try_ctrl op specified, then the control framework
>> will call that first before calling s_ctrl. So any validation that
>> try_ctrl did does not need to be done again in s_ctrl.
>>
>> The same comment with try_ctrl is valid here as well: if there are
>> image format checks that need to be done, then those need to be done
>> per control and not as a generic check. If new controls are added in
>> the future, then you don't want the same checks to apply to the new
>> controls as well.
> 
> I don't think the behaviour of try_ctrl and that being embedded in set
> calls was being questioned by anyone. Can you reply to the last
> paragraph below ?
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>>> +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
>>>>> +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
>>>>> +	struct v4l2_pix_format_mplane *pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
>>>>> +	enum rkvdec_image_fmt image_fmt;
>>>>> +
>>>>> +	if (!desc->ops->get_image_fmt)
>>>>> +		return 0;
>>>>> +
>>>>> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
>>>>> +	if (ctx->image_fmt == image_fmt)
>>>>> +		return 0;
>>>>
>>>> If you really can't set a control when the queue is busy, then that should
>>>> be tested here, not in try_ctrl. And then you return -EBUSY.
>>>>
>>>> Am I missing something here?
>>>
>>> When I reviewed, I had imagine that s_ctrl on a request would just run
>>> a try. Now that I read that more careful, I see that it does a true set
>>> on separate copy. So yes, this can safely be moved here.
>>>
>>> Since you seem wondering "If you really can't set a control", let me
>>> explain what Jonas wants to protect against. RKVdec does not have any
>>> color conversion code, the header compound control (which header
>>> depends on the codec), contains details such as sub-sampling and color
>>> depth. Without color conversion, when the image format is locked (the
>>> busy queue), you can't request the HW to decode a frame witch does not
>>> fit. This could otherwise lead to buffer overflow in the HW,
>>> fortunately protected by the iommu, but you don't really want to depend
>>> on the mmu.
>>>
>>> I've never used try_ctrl in my decade of v4l2, so obviously, now that I
>>> know that s_ctrl on request is not a try, I'm fine with rejecting this
>>> PR, sending a new version and making a PR again. But if I was to use
>>> this API in userspace, my intuitive expectation would be that this
>>> should fail try(), even if its very rarely valid to check the queue
>>> state in try control.
> 
> Here, since we seem to disagree on the behaviour try should have for
> this specific validation. What you asked on first pass is to make it so
> that TRY will succeed, and SET will fail. I don't really like that
> suggestion.

Ah, no, that's not what I asked.

There are two independent issues:

1) The tests for a valid image format are done for all controls instead of
   just the control that really needs it. That's asking for problems, and
   that needs to be addressed by creating a helper function and using it
   in the relevant control code. Alternatively, just check against the
   control id in try_ctrl/s_ctrl explicitly. That's fine too, although I
   prefer a helper function.

2) vb2_is_busy() does not belong in try_ctrl. 'try' should never depend
   on whether buffers are allocated. You have two options here:

   a) try_ctrl checks if the image_fmt is valid for the current format,
      and it returns -EINVAL if it isn't. This requires that userspace
      then selects a different format first. No call to vb2_is_busy is
      needed.

   b) try_ctrl doesn't check image_fmt against the current format, it just
      accepts any value. Instead s_ctrl does the check: if it invalid, then
      it returns -EBUSY if vb2_is_busy() is true, or it updates the format.

I see that cedrus also has vb2_is_busy() in try_ctrl, and worse, it actually
updates the capture format in the try_ctrl, which is definitely a cedrus bug
(try should never have side-effects).

The core question is whether changing the V4L2_CID_STATELESS_H264_SPS should
make format changes. I can't off-hand think of any other control that does
that. It is certainly not documented.

The only control that comes close is V4L2_CID_ROTATE, and I think that control
was a huge mistake. It was also never properly documented how it should behave.

My preference is option a. Controls shouldn't change the format, it is really
confusing. If you do want option b, then all drivers that use this control
have to be checked first to ensure that they all behave the same, and the
control documentation must be updated.

Regards,

	Hans

> 
> Nicolas
> 
>>>
>>> Nicolas
>>>
>>>>
>>>> Regards,
>>>>
>>>> 	Hans
>>>>
>>>>> +
>>>>> +	ctx->image_fmt = image_fmt;
>>>>> +	if (!rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, ctx->image_fmt))
>>>>> +		rkvdec_reset_decoded_fmt(ctx);
>>>>>  
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>>  static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>>>>>  	.try_ctrl = rkvdec_try_ctrl,
>>>>> +	.s_ctrl = rkvdec_s_ctrl,
>>>>>  };
>>>>>  
>>>>>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>>>>> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
>>>>> index 6f8cf50c5d99aad2f52e321f54f3ca17166ddf98..e466a2753ccfc13738e0a672bc578e521af2c3f2 100644
>>>>> --- a/drivers/staging/media/rkvdec/rkvdec.h
>>>>> +++ b/drivers/staging/media/rkvdec/rkvdec.h
>>>>> @@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
>>>>>  		     struct vb2_v4l2_buffer *dst_buf,
>>>>>  		     enum vb2_buffer_state result);
>>>>>  	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
>>>>> +	enum rkvdec_image_fmt (*get_image_fmt)(struct rkvdec_ctx *ctx,
>>>>> +					       struct v4l2_ctrl *ctrl);
>>>>>  };
>>>>>  
>>>>>  enum rkvdec_image_fmt {
>>>>>
>>>
> 


