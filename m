Return-Path: <linux-media+bounces-29659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2969DA81331
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 19:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 132481BA6399
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 17:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76CD22FF4D;
	Tue,  8 Apr 2025 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="nBmi9Mh6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A791B422A
	for <linux-media@vger.kernel.org>; Tue,  8 Apr 2025 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131730; cv=none; b=rfGbT6jQtZiOouruQmovRX5he5Bb8YB33emZ0yZLcvyQvwl2c/j0kNuhi1Rfy1LI2Lg9xX8TLOaiiNIScs/7OL08BnjqVZ4MCADqAO7Nx3qrSu+8mktVoObxvkJCNWrxJiytQW5G1dhkMgO0Doo780PYff23o80xKh1bNUA4LII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131730; c=relaxed/simple;
	bh=1EOqAN8mLnDIV+vOFF6TgpJg2um8RiXb4zTvP7F6XYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLjlTIS3pwd7fTsJpbTy5+uKoMETKuZUVYz5737L00avIh7I2IbirIDwVO8Eu65Y4FQC3qreD/xrCFY2EIZhYh6KBudH2DtuZrTQyLagbaZP5iwHla6sVLN8NsKfTnIQig17p9AC1kkS2CCJsGZNzf6dv2My8a2YxMzoYgZK4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=nBmi9Mh6; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1744131719;
 bh=HTTJSiprsg9sldw27hi8LrrBZUv0++vf1RsEIB9TgTE=;
 b=nBmi9Mh6FlVwUzskp8yu5c/Se0IAiFRCvekUa6xGhakirE5IwxKV6/YacyLZS/w4IHKIx26bG
 ctqmIIy/TmFKnJLNKHs/bvQN5o7tgO08Vp8iSEyPLknsS/uXllpp6ZA1FWKrYiejmxeM2MW2nvP
 V9cvZ/r6kn3fPa/Ts31lNnGNSloVXvql/Uxpg1EBXNXqj0iIR3S/YVH3qUkRSrp9Ie7rmhMSnKU
 NMvp8pxTf1ODud59svZHGMaFGnFfzHaHSOQPhPC/YGS28AOwlUqpMf45L1Vw4s7pTBs20ZO1h5F
 zRiBZ7bfk2HvSATMpxIxhr43GUVhsDebg01IPUo9xoRg==
X-Forward-Email-ID: 67f55683ba63fca1da407a77
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.1
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a06664a8-a346-4a57-b3d3-bae95958fc7f@kwiboo.se>
Date: Tue, 8 Apr 2025 19:01:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/12] media: rkvdec: Add get_image_fmt ops
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
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
 Dan Carpenter <dan.carpenter@linaro.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250225-rkvdec_h264_high10_and_422_support-v7-0-7992a68a4910@collabora.com>
 <20250225-rkvdec_h264_high10_and_422_support-v7-9-7992a68a4910@collabora.com>
 <e6b99109-bd35-46ff-a4e2-eb69b549dcbc@xs4all.nl>
 <77bdada5dce991842e377759c8e173ada115694f.camel@collabora.com>
 <47c0011f-693d-4c94-8a1b-f0174f3d5b89@xs4all.nl>
 <19a11d429d9078b82f27e108aa5ac80cc4041bef.camel@collabora.com>
 <35d34100-7013-4acb-a5a6-3408e0f45d9d@xs4all.nl>
 <1747c9d2f653a07418422157f4b1613246f39a6c.camel@collabora.com>
 <5cd6e8d3-fa51-4225-a3b8-9727cfd95062@xs4all.nl>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <5cd6e8d3-fa51-4225-a3b8-9727cfd95062@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2025-04-08 16:32, Hans Verkuil wrote:
> On 4/8/25 15:36, Nicolas Dufresne wrote:
>> Hi Hans,
>>
>> Le mardi 08 avril 2025 à 10:28 +0200, Hans Verkuil a écrit :
>>> On 07/04/2025 16:59, Nicolas Dufresne wrote:
>>>> Le lundi 07 avril 2025 à 16:17 +0200, Hans Verkuil a écrit :
>>>>> On 07/04/2025 15:52, Nicolas Dufresne wrote:
>>>>>> Le lundi 07 avril 2025 à 13:09 +0200, Hans Verkuil a écrit :
>>>>>>> On 25/02/2025 10:40, Sebastian Fricke wrote:
>>>>>>>> From: Jonas Karlman <jonas@kwiboo.se>
>>>>>>>>
>>>>>>>> Add support for a get_image_fmt() ops that returns the required image
>>>>>>>> format.
>>>>>>>>
>>>>>>>> The CAPTURE format is reset when the required image format changes and
>>>>>>>> the buffer queue is not busy.
>>>>>>>>
>>>>>>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>>>>>>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>>>>> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>>>>> Tested-by: Christopher Obbard <chris.obbard@collabora.com>
>>>>>>>> ---
>>>>>>>>  drivers/staging/media/rkvdec/rkvdec.c | 49 +++++++++++++++++++++++++++++++++--
>>>>>>>>  drivers/staging/media/rkvdec/rkvdec.h |  2 ++
>>>>>>>>  2 files changed, 49 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
>>>>>>>> index 70154948b4e32e2c439f259b0f1e1bbc8b52b063..5394079509305c619f1d0c1f542bfc409317c3b7 100644
>>>>>>>> --- a/drivers/staging/media/rkvdec/rkvdec.c
>>>>>>>> +++ b/drivers/staging/media/rkvdec/rkvdec.c
>>>>>>>> @@ -111,15 +111,60 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>>>>>>>>  {
>>>>>>>>  	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
>>>>>>>>  	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
>>>>>>>> +	struct v4l2_pix_format_mplane *pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
>>>>>>>> +	enum rkvdec_image_fmt image_fmt;
>>>>>>>> +	struct vb2_queue *vq;
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	if (desc->ops->try_ctrl) {
>>>>>>>> +		ret = desc->ops->try_ctrl(ctx, ctrl);
>>>>>>>> +		if (ret)
>>>>>>>> +			return ret;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	if (!desc->ops->get_image_fmt)
>>>>>>>> +		return 0;
>>>>>>>>  
>>>>>>>> -	if (desc->ops->try_ctrl)
>>>>>>>> -		return desc->ops->try_ctrl(ctx, ctrl);
>>>>>>>> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
>>>>>>>> +	if (ctx->image_fmt == image_fmt)
>>>>>>>> +		return 0;
>>>>>>>> +
>>>>>>>> +	if (rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, image_fmt))
>>>>>>>> +		return 0;
>>>>>>>> +
>>>>>>>> +	/* format change not allowed when queue is busy */
>>>>>>>> +	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>>>>>>>> +			     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>>>>>>> +	if (vb2_is_busy(vq))
>>>>>>>> +		return -EINVAL;
>>>>>
>>>>> Looking closer, this code is just wrong. It does these format change
>>>>> tests for any control, so if more controls are added in the future, then
>>>>> those will be checked the same way, which makes no sense.
>>>>
>>>> "Just wrong" should be kept for code that is semantically incorrect,
>>>> just a suggestion for choice of wording.
>>>
>>> Having vb2_is_busy in a try function (whether trying a control or a format)
>>> is simply wrong. Having these checks at a high level (i.e. being done for
>>> any control) is asking for problems in the future. It only works right
>>> now because there is just one control.
>>
>> Your main rejection argument has been that this is done for any
>> control. Jonas invalidated your argument yesterday:
>>
>>> Please elaborate how this code is just wrong, it is only called for sps
>>> ctrl, as intended, try will report an error as suggested in docs and set
>>> will reset the decoded fmt to match the new sps ctrl value.
> 
> 1) it is confusing since in this function there is no indication that there
>    is just one control.
> 2) it is not future proof in case more controls are added.
> 
> When I was reviewing this I had to dig into the code before I realized that
> there really was just one control.
> 
> So while this code is 'correct' in that it won't break, it is really hard
> to understand.

Technically this code currently support format validation for any ctrl
that passes this function, the implemented get_image_fmt() ops will
return ANY for a ctrl that does not affect the image fmt. And the
rkvdec_is_valid_fmt() will return that all image fmt is valid for ANY.

> 
>>
>>>
>>>>
>>>>>
>>>>> These tests belong to the actual control that you 'try'. In this case
>>>>> rkvdec_h264_validate_sps(). This function already checks the width and
>>>>> height, but it should also check the image format. It is all in the
>>>>> wrong place.
>>>>
>>>> We can do that too. Though, this was generalized since once you enable
>>>> the other codecs, you endup with code duplication. I know this series
>>>> is an extract from a larger one.
>>>>
>>>> So let's suggest to make a helper that combines rkvdec_is_valid_fmt()
>>>> and the busy check. Though on that, please reply to my comment below
>>>> (which you skipped).
>>>
>>> Absolutely, this needs a helper function.
>>
>> In the next version, We should ake sure this is renamed, so readers
>> understand its already a helper, and is only called for specific CID.
>> Jonas comment also invalid my wrong suggestion here.
>>
>>>
>>>>
>>>>>
>>>>>>>
>>>>>>> This makes no sense to me. This just tries a control, and that should just
>>>>>>> work, regardless of vb2_is_busy(). It's a 'try', so you are not actually
>>>>>>> changing anything.
>>>>>>
>>>>>> See comment below, notice that this code is only reached if the control
>>>>>> introduce parameters that are not compatible with the current capture
>>>>>> queue fmt. The entire function uses "success" early exit, so the
>>>>>> further down you get in the function, the less likely your control is
>>>>>> valid.
>>>>>>
>>>>>>>
>>>>>>>> +
>>>>>>>> +	return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
>>>>>>>> +{
>>>>>
>>>>> If there is a try_ctrl op specified, then the control framework
>>>>> will call that first before calling s_ctrl. So any validation that
>>>>> try_ctrl did does not need to be done again in s_ctrl.
>>>>>
>>>>> The same comment with try_ctrl is valid here as well: if there are
>>>>> image format checks that need to be done, then those need to be done
>>>>> per control and not as a generic check. If new controls are added in
>>>>> the future, then you don't want the same checks to apply to the new
>>>>> controls as well.
>>>>
>>>> I don't think the behaviour of try_ctrl and that being embedded in set
>>>> calls was being questioned by anyone. Can you reply to the last
>>>> paragraph below ?
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> 	Hans
>>>>>
>>>>>>>> +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
>>>>>>>> +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
>>>>>>>> +	struct v4l2_pix_format_mplane *pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
>>>>>>>> +	enum rkvdec_image_fmt image_fmt;
>>>>>>>> +
>>>>>>>> +	if (!desc->ops->get_image_fmt)
>>>>>>>> +		return 0;
>>>>>>>> +
>>>>>>>> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
>>>>>>>> +	if (ctx->image_fmt == image_fmt)
>>>>>>>> +		return 0;
>>>>>>>
>>>>>>> If you really can't set a control when the queue is busy, then that should
>>>>>>> be tested here, not in try_ctrl. And then you return -EBUSY.
>>>>>>>
>>>>>>> Am I missing something here?
>>>>>>
>>>>>> When I reviewed, I had imagine that s_ctrl on a request would just run
>>>>>> a try. Now that I read that more careful, I see that it does a true set
>>>>>> on separate copy. So yes, this can safely be moved here.
>>>>>>
>>>>>> Since you seem wondering "If you really can't set a control", let me
>>>>>> explain what Jonas wants to protect against. RKVdec does not have any
>>>>>> color conversion code, the header compound control (which header
>>>>>> depends on the codec), contains details such as sub-sampling and color
>>>>>> depth. Without color conversion, when the image format is locked (the
>>>>>> busy queue), you can't request the HW to decode a frame witch does not
>>>>>> fit. This could otherwise lead to buffer overflow in the HW,
>>>>>> fortunately protected by the iommu, but you don't really want to depend
>>>>>> on the mmu.
>>>>>>
>>>>>> I've never used try_ctrl in my decade of v4l2, so obviously, now that I
>>>>>> know that s_ctrl on request is not a try, I'm fine with rejecting this
>>>>>> PR, sending a new version and making a PR again. But if I was to use
>>>>>> this API in userspace, my intuitive expectation would be that this
>>>>>> should fail try(), even if its very rarely valid to check the queue
>>>>>> state in try control.
>>>>
>>>> Here, since we seem to disagree on the behaviour try should have for
>>>> this specific validation. What you asked on first pass is to make it so
>>>> that TRY will succeed, and SET will fail. I don't really like that
>>>> suggestion.
>>>
>>> Ah, no, that's not what I asked.
>>>
>>> There are two independent issues:
>>>
>>> 1) The tests for a valid image format are done for all controls instead of
>>>    just the control that really needs it. That's asking for problems, and
>>>    that needs to be addressed by creating a helper function and using it
>>>    in the relevant control code. Alternatively, just check against the
>>>    control id in try_ctrl/s_ctrl explicitly. That's fine too, although I
>>>    prefer a helper function.
>>
>> This is false, this is done only the the relevant controls as explained
>> by Jonas.
> 
> See my comment above. It's not at all obvious that there is just one control,
> it is just bad coding practice. All I ask is that it is made explicit in the
> code that it is just for one control.
> 
>>
>>>
>>> 2) vb2_is_busy() does not belong in try_ctrl. 'try' should never depend
>>>    on whether buffers are allocated. You have two options here:
>>
>> I read this statement as try_ctrl cannot fail when setting an SPS while
>> the queue is active. Since you don't have rationale for it, but really
>> want to see that, we will sacrifice the symmetry of TRY/SET in the next
>> version. TRY will pass, and SET will reset the capture format if the
>> queue is not busy, and return busy otherwise. Nobody ever wanted
>> try_ctrl for stateless decoders, its not even mention in the specific
>> documentation. This is effectively option b) below.
> 
> VIDIOC_TRY_EXT_CTRLS is always available. Typically it just validates controls
> (i.e. make sure the values are in range, etc). It is really rare that drivers
> need to implement try_ctrl.
> 
> It is also called by VIDIOC_S_EXT_CTRLS: this avoids that the same validation code is
> implemented in both the try_ctrl and s_ctrl callbacks.
> 
> Unless otherwise stated, controls are independent of whether you have buffers
> allocate or are streaming, you can get/set them any time.
> 
>>
>>>
>>>    a) try_ctrl checks if the image_fmt is valid for the current format,
>>>       and it returns -EINVAL if it isn't. This requires that userspace
>>>       then selects a different format first. No call to vb2_is_busy is
>>>       needed.
>>
>> That shows you don't really know what this is about. Please read how
>> the initialization process works, up to point 2. A call to
> 
> You are absolutely right. I should know how it works, but because I rarely
> use it, I forget the details.
> 
>> S_FMT(CAPTURE) is optional. Its the driver that select the CAPTURE
>> format based on the bitstream parameters (and bitstream format /
>> CAPTURE). Everything is design with input and output in mind. The
>> application sets the input format and parameters, the driver choses the
>> output (CAPTURE queue) format. With the very strict rule that nothing
>> in the parameters that can be against the locked capture format can
>> ever be set.
>>
>> https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stateless-decoder.html#initialization
>>
>>
>>>
>>>    b) try_ctrl doesn't check image_fmt against the current format, it just
>>>       accepts any value. Instead s_ctrl does the check: if it invalid, then
>>>       it returns -EBUSY if vb2_is_busy() is true, or it updates the format.
>>
>> That contradicts slightly your answer "Ah, no, that's not what I
>> asked.". But can be done without any spec violation like option a)
>> includes.
>>
>>>
>>> I see that cedrus also has vb2_is_busy() in try_ctrl, and worse, it actually
>>> updates the capture format in the try_ctrl, which is definitely a cedrus bug
>>> (try should never have side-effects).
>>
>> I think looking at another work-in-progress driver is distraction. We
>> all know that try should not change the driver state (regardless the
>> type of try). If you are correct, then it should be fixed there too,
>> you should inform Jernej and Paul.
> 
> And I will. Cedrus is not really a work-in-progress driver, I think it should
> be moved out of staging. See the topic for the media summit.
> 
> In any case, if we can agree on the right approach for rkvdec, then I can make
> a patch for cedrus.
> 
>>
>>>
>>> The core question is whether changing the V4L2_CID_STATELESS_H264_SPS should
>>> make format changes. I can't off-hand think of any other control that does
>>> that. It is certainly not documented.
>>
>> That is also wrong, it is well documented. Its not because you don't
>> understand a problem that its by definition wrong.
> 
> It's documented in the stateless decoder doc:
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dev-stateless-decoder.html
> 
> But not with the control documentation itself:
> 
> https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/ext-ctrls-codec-stateless.html
> 
> I was looking at that, and doesn't mention it. I'll see if I can make a patch for that.
> 
>>
>>>
>>> The only control that comes close is V4L2_CID_ROTATE, and I think that control
>>> was a huge mistake. It was also never properly documented how it should behave.
>>
>> Documentation says:
>>> Rotating the image to 90 and 270 will reverse the height and
>>> width of the display window.
>>
>>> It is necessary to set the new height
>>> and width of the picture using the
>>> :ref:`VIDIOC_S_FMT <VIDIOC_G_FMT>` ioctl according to the
>>>  rotation angle selected.
>>
>> The link is confusing, but S_ and G_ share the same link. So its well
>> documented that the users must call S_FMT and manually flip the width
>> and height.
> 
> Not really, if you look at how it is implemented in various drivers, then
> they don't match this doc in at least several cases. In any case, just forget
> about this control. It's all water under the bridge.
> 
>>
>> I was never involved with that one, but its a very different approach.
>> I think its written with single queue in mind (not M2M). It means you
>> can have pending control state. This for stateless CODEC would be so
>> complex to handle. For request based driver, we should probably never
>> allow that kind of API. If you need to set a control in the future, use
>> a request. This, when that control should be applied becomes very
>> explicit and can be synchronized across multiple queues.
>>
>>>
>>> My preference is option a. Controls shouldn't change the format, it is really
>>> confusing. If you do want option b, then all drivers that use this control
>>> have to be checked first to ensure that they all behave the same, and the
>>> control documentation must be updated.
>>
>> Option b) it is, since there is no option a).
> 
> So can we agree on the following (I think):
> 
> 1) rkvdec_try_ctrl no longer checks the image_fmt. Effectively this means that there
>    is no longer any need to change rkvdec_try_ctrl in this patch.
> 
> 2) in rkvdec_s_ctrl we do the image_fmt check: if it changes, but vb2_is_busy is true,
>    then return -EBUSY, otherwise call rkvdec_reset_decoded_fmt(). This code is specific
>    for V4L2_CID_STATELESS_H264_SPS, so just make sure it is under an if/switch for that
>    control ID.

As mentioned above, the get_image_fmt() ops currently can decide itself
if the ctrl being passed affect the image fmt or just return ANY.
Current ops return ANY for all ctrl beside STATELESS_H264_SPS.

The rational behind this separation was that the decision on image fmt
could solely be handled in the codec specific code file, as a way to
reduce any possible future issue when adding a new codec or a ctrl that
put limits on the buffer or image fmt.

Having a check and only call this for STATELESS_H264_SPS ctrl may
instead complicate things going forward, as both the common and codec
specific code will need to be changed when implementing next codec.

This also matches the way rkvdec try_ctrl() ops is currently implemented,
the decision on what ctrl it checks is decided inside the codec specific
implementation. And for me, consistency is very important ;-)

Regards,
Jonas

> 
> 3) I'll see if I can make a patch to clarify in the control documentation that setting
>    it can change the format.
> 
> 4) I'll make a patch for the cedrus driver as well to align with the approach in rkvdec.
> 
> Regards,
> 
> 	Hans
> 
>>
>> Nicolas
>>
>>>
>>> Regards,
>>>
>>> 	Hans
>>>
>>>>
>>>> Nicolas
>>>>
>>>>>>
>>>>>> Nicolas
>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>>
>>>>>>> 	Hans
>>>>>>>
>>>>>>>> +
>>>>>>>> +	ctx->image_fmt = image_fmt;
>>>>>>>> +	if (!rkvdec_is_valid_fmt(ctx, pix_mp->pixelformat, ctx->image_fmt))
>>>>>>>> +		rkvdec_reset_decoded_fmt(ctx);
>>>>>>>>  
>>>>>>>>  	return 0;
>>>>>>>>  }
>>>>>>>>  
>>>>>>>>  static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>>>>>>>>  	.try_ctrl = rkvdec_try_ctrl,
>>>>>>>> +	.s_ctrl = rkvdec_s_ctrl,
>>>>>>>>  };
>>>>>>>>  
>>>>>>>>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>>>>>>>> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
>>>>>>>> index 6f8cf50c5d99aad2f52e321f54f3ca17166ddf98..e466a2753ccfc13738e0a672bc578e521af2c3f2 100644
>>>>>>>> --- a/drivers/staging/media/rkvdec/rkvdec.h
>>>>>>>> +++ b/drivers/staging/media/rkvdec/rkvdec.h
>>>>>>>> @@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
>>>>>>>>  		     struct vb2_v4l2_buffer *dst_buf,
>>>>>>>>  		     enum vb2_buffer_state result);
>>>>>>>>  	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
>>>>>>>> +	enum rkvdec_image_fmt (*get_image_fmt)(struct rkvdec_ctx *ctx,
>>>>>>>> +					       struct v4l2_ctrl *ctrl);
>>>>>>>>  };
>>>>>>>>  
>>>>>>>>  enum rkvdec_image_fmt {
>>>>>>>>
>>>>>>
>>>>


