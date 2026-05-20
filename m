Return-Path: <linux-media+bounces-62215-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCHiHUZpDWquwgUAu9opvQ
	(envelope-from <linux-media+bounces-62215-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:56:54 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C35D65893DE
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 09:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5443330E6057
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2026 07:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2038436AB49;
	Wed, 20 May 2026 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1LyZ4Ra"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F323939B0
	for <linux-media@vger.kernel.org>; Wed, 20 May 2026 07:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263368; cv=none; b=Vp4WnMBK1dXhCoAv0/RG73dO71c0E6U80ujH0ToOh/wll3bCia/eltpndMsjA6aFFdKIlEBbbehGexxJhvTQ2PQO7Qgy1DUI1arj4o6ixcDvCZNoSdxbXved4ii3/jcJzGG3ph5n2cVDIkFrl/UGwmISeA6SPwy5MasNQYzvBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263368; c=relaxed/simple;
	bh=R3tEzodXKSrAB+eiYSjQm3IqiVbKxmfbbFpyekfJXFU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=bKOX7TZXVFa85rf+lG4y3STyVaOcdzYSxvl8DAJ7poiAbBPpOOG1yY+xncOMS1QIcRndsvbbb1+t1oXB4QZF1caOhEDxN9WfiS9AqvIIX4CAdeMptN3y8bd318kCnSK2Ad0j//89cvxlwUyS5VYJzRau6ZF2pZsOmgzSH8/ypSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1LyZ4Ra; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740B61F000E9;
	Wed, 20 May 2026 07:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263367;
	bh=2likVQFqclSauMfAgaKFfGfD+F4dE7LTH1cJEl8pEAY=;
	h=Date:From:Subject:To:References:In-Reply-To;
	b=U1LyZ4RaGvsb82Y2SO0m7QF7uesQoaIIIz+GDzeV2KZgZrWeKU+gfvVodwg2c1vaP
	 d9X+4dUw5xjwOsFOeklLzkOQc1valQFkFhsKJ7IMCRHQnnNO7b7VMgi+LTnPEEva10
	 fwFX7oBKscHfuJ27Mt1XdUcPvs619GXqdh2nrqOPhFKgSrvuTd9iPWp9LsQRA/vBKF
	 4HyTdtcDrc95NIuvVM/vxV7vyDisrYpyD0+sqQNhUkvG5CUEX9vEVl7QrZKbu9qOHT
	 WdjWgfIwEWN61wsME1DtTrsS2nrI9btkmCrnxZawIEOl27bgZffuGKnVYulPO2Jh0T
	 oWL1kldxuxHTA==
Message-ID: <f23cb7f6-ad98-485a-95f4-9766a1e84032@kernel.org>
Date: Wed, 20 May 2026 09:49:24 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: vivid: check vb2_is_busy before calling
 vivid_update_format_cap/out
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
References: <3016ee7c-9a4f-4fcf-b17f-0dce5bbc9260@kernel.org>
 <67cd61cb2dd1988f3ccc93e7eb1eff42014ce830.camel@ndufresne.ca>
 <655cfcf9-d015-49d3-886b-1c4a38553aab@kernel.org>
 <cdc726553b50cc1b4de91e784fe5d4b2c9c2da4c.camel@ndufresne.ca>
Content-Language: en-US, nl
In-Reply-To: <cdc726553b50cc1b4de91e784fe5d4b2c9c2da4c.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-62215-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C35D65893DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 21:29, Nicolas Dufresne wrote:
> Le mardi 19 mai 2026 à 15:30 +0200, Hans Verkuil a écrit :
>> On 13/05/2026 16:59, Nicolas Dufresne wrote:
>>> Le mercredi 13 mai 2026 à 10:52 +0200, Hans Verkuil a écrit :
>>>> The vivid_update_format_cap/out() functions must only be called if the
>>>> capture/output queue are not busy. But for several controls that is not
>>>> checked.
>>>>
>>>> Only when streaming starts will they be set to 'grabbed' and it is
>>>> impossible to change the control, but between REQBUFS and STREAMON you
>>>> are still allowed to set these controls. Since vivid_update_format_cap/out
>>>> will change the format, this can cause unexpected results.
>>>>
>>>> I suspect that this is the cause of this syzbot bug:
>>>>
>>>> https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
>>>>
>>>> But since we never have reproducers, it is hard to be certain. In any case,
>>>> these checks are needed regardless.
>>>>
>>>> Reported-by: syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
>>>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>>>> ---
>>>> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c
>>>> b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>>>> index f94c15ff84f7..e40ff999cad8 100644
>>>> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
>>>> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>>>> @@ -608,18 +608,26 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
>>>>  		tpg_s_vflip(&dev->tpg, dev->sensor_vflip ^ dev->vflip);
>>>>  		break;
>>>>  	case VIVID_CID_REDUCED_FPS:
>>>> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
>>>> +			return -EBUSY;
>>>
>>> It is unclear to me why users need to free all the buffers to enable this
>>> feature.  Should that one only be limited to not being streaming ? I believe it
>>> will only affect the HDMI DV Timings and the frame internal in params right ?
>>
>> The problem is that vivid_update_format_cap() resets the format, as you expect
>> when changing input or standard, or timing.
>>
>> This control implies a new timing, so that's why vivid_update_format_cap
>> is called. And that requires the is_busy check.
> 
> I did check again, and the timing is only changed if !vb2_is_busy(). That
> matched my first impression that the vivid_update_format_cap() just copy over
> the same information without actually changing it.
> 
>>
>> It could be implemented differently, but then this control shouldn't use
>> vivid_update_format_cap().
> 
> It would be much more elegant to separate the changes from each other yes. At
> separate between what affects the v4l2_fmt (memory allocation) and what doesn't.
> Also because its very error prone to trust vivid_update_format_cap() to not have
> any side effects.
>>
>> It's something for another time, for now I want to be consistent in always
>> checking vb2_is_busy before vivid_update_format_cap can be called.
> 
> Please add some sort of comment, so future visitors knows this code is
> illogically tied together.

I decided to make a v2, changing REDUCED_FPS to not need vivid_update_format_cap
anymore.

Regards,

	Hans

> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Nicolas
> 
>>
>> Regards,
>>
>> 	Hans
>>
>>>
>>>>  		dev->reduced_fps = ctrl->val;
>>>>  		vivid_update_format_cap(dev, true);
>>>>  		break;
>>>>  	case VIVID_CID_HAS_CROP_CAP:
>>>> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
>>>> +			return -EBUSY;
>>>>  		dev->has_crop_cap = ctrl->val;
>>>>  		vivid_update_format_cap(dev, true);
>>>>  		break;
>>>>  	case VIVID_CID_HAS_COMPOSE_CAP:
>>>> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
>>>> +			return -EBUSY;
>>>>  		dev->has_compose_cap = ctrl->val;
>>>>  		vivid_update_format_cap(dev, true);
>>>>  		break;
>>>>  	case VIVID_CID_HAS_SCALER_CAP:
>>>> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
>>>> +			return -EBUSY;
>>>>  		dev->has_scaler_cap = ctrl->val;
>>>>  		vivid_update_format_cap(dev, true);
>>>>  		break;
>>>> @@ -1116,14 +1124,20 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl
>>>> *ctrl)
>>>>
>>>>  	switch (ctrl->id) {
>>>>  	case VIVID_CID_HAS_CROP_OUT:
>>>> +		if (vb2_is_busy(&dev->vb_vid_out_q))
>>>> +			return -EBUSY;
>>>>  		dev->has_crop_out = ctrl->val;
>>>>  		vivid_update_format_out(dev);
>>>>  		break;
>>>>  	case VIVID_CID_HAS_COMPOSE_OUT:
>>>> +		if (vb2_is_busy(&dev->vb_vid_out_q))
>>>> +			return -EBUSY;
>>>>  		dev->has_compose_out = ctrl->val;
>>>>  		vivid_update_format_out(dev);
>>>>  		break;
>>>>  	case VIVID_CID_HAS_SCALER_OUT:
>>>> +		if (vb2_is_busy(&dev->vb_vid_out_q))
>>>> +			return -EBUSY;
>>>>  		dev->has_scaler_out = ctrl->val;
>>>>  		vivid_update_format_out(dev);
>>>>  		break;


