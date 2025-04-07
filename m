Return-Path: <linux-media+bounces-29528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CBA7E3BE
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 17:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0512B7A1D07
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8230516D32A;
	Mon,  7 Apr 2025 15:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="l9wrbtph"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17371CAA8D
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038489; cv=none; b=ct1zzFMKEnEZ11KLFnFe5DskZyk0nkVVuA3Qbs8StSrMB7WWhqKeLVvmZ26hrnVX/rQoTU5tJ/zam6okxJs9aqRVGEBoNY38GOFEUBz9QRSK2qNOsxsnJ+z3BzysIPldwAmgwXnNVbHIC4IjbBJ3xwBLV3KIXkao6LJIKjyAEH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038489; c=relaxed/simple;
	bh=9ywssobLUS7opFFvYH219PgxdBbxWGMuqau2QH9Vwcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVb7uiNHp0f58zFmqFLoBgZi8xoG3VfnaUHTuJl1Fol71ZUSLQIG3KPiPVXarWgAS5rOfDblFypeOMX5jcbSexgQusZ3gmn+DVuB7N0+28JMT/uG8tfhCiB0N9ltD9cTzwLzi/KmEGwuYcP3euUVFNss660FK5hhqR7u8mmaF6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=l9wrbtph; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1744038479;
 bh=yfiUG7YDzCPnO51CT5r9XyWAgJX3RxStPM+stWziErk=;
 b=l9wrbtphE4LPk/TeFrPb/c14n2LPDQ6aCvFGl4xyf38b7Wc8Gc55gpnK0Y3KuoK80X+HASsdC
 xT/Cp3qavx8v3obmHS/JklKgmThM1A8AQNDDCE69c/4O71F+BUUUZwyRIqvP3vR0HLKuvLfMFQt
 s5zl1XyYpSUMHtxF62b1yl0JGjBuSFuLb8GjI5AnpebKUK1U50Jj/O991jwuPRxRGaRjh4CeW1+
 gpDqthvfq2EnNbNp/K9vh5www3AYL2rQL1Vu5aoDPRBzNRXDXXgm1m0r0TfJXxh80rPgW1T/8yL
 WC1n9Yl4KiLPVsCpt/uZc3uac64zRH9bWStlWfmFnYXg==
X-Forward-Email-ID: 67f3ea45fa8ccfb37ffb076e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <cc53dbbf-405b-452b-b007-00588d6c8839@kwiboo.se>
Date: Mon, 7 Apr 2025 17:07:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/12] media: rkvdec: Add get_image_fmt ops
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Alex Bee <knaerzche@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
 <20250225-rkvdec_h264_high10_and_422_support-v7-9-7992a68a4910@collabora.com>
 <e6b99109-bd35-46ff-a4e2-eb69b549dcbc@xs4all.nl>
 <77bdada5dce991842e377759c8e173ada115694f.camel@collabora.com>
 <47c0011f-693d-4c94-8a1b-f0174f3d5b89@xs4all.nl>
 <19a11d429d9078b82f27e108aa5ac80cc4041bef.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <19a11d429d9078b82f27e108aa5ac80cc4041bef.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-04-07 16:59, Nicolas Dufresne wrote:
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
> 
>>
>> These tests belong to the actual control that you 'try'. In this case
>> rkvdec_h264_validate_sps(). This function already checks the width and
>> height, but it should also check the image format. It is all in the
>> wrong place.

Keep in mind that rkvdec_try_ctrl and rkvdec_s_ctrl are only used for
CID_STATELESS_H264_SPS (and in future also CID_STATELESS_HEVC_SPS) not
any other control, so this is already in the correct place?

Maybe the naming of the functions are too generic, they could be named
rkvdec_sps_try_ctrl and rkvdec_sps_s_ctrl or similar if that makes more
sense?

Regards,
Jonas

> 
> We can do that too. Though, this was generalized since once you enable
> the other codecs, you endup with code duplication. I know this series
> is an extract from a larger one.
> 
> So let's suggest to make a helper that combines rkvdec_is_valid_fmt()
> and the busy check. Though on that, please reply to my comment below
> (which you skipped).
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


