Return-Path: <linux-media+bounces-62146-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGlsIURnDGo9hAUAu9opvQ
	(envelope-from <linux-media+bounces-62146-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:36:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2857FCA7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 15:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D2CF9300D690
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 13:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81B6348C4E;
	Tue, 19 May 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTLUQRMq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9E3348C45
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779197404; cv=none; b=OaJTJeLQQWknR5ePCP4FCgFxw2sBk0jd8sZ1uDzFK+v1NuSEKw7Ozz6NVuxE+k4p5L43QqB3/o8mAO2+1CdXsw/IXwDMpPlveidTId5vQ4qHOZpsApgswLGa6M8A7pm0BgDjBjLvS2pfey/PmOPQhtMNO0yBTLSA1jVVZSvKlDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779197404; c=relaxed/simple;
	bh=Qk0YPdXadh6gnxCFGgWURqYt9B9xWapoQxKMXj0j7X0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=FZMQSNF/52HueGlZl12DpVGzi/q7AdC+L0MErrUEyUjrGjeAdJ/ILZ99KGlQNuvzjShJyZOwUi72RMJyrHocNrjMv0uiEdMfV2mx9nZ60b6oaZ8XojWLOuSpfL1awBOlWGHNDZxjZrd0VaG3zU81KweW6J6Jv7bj4SEqMvH/1dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTLUQRMq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6E2C2BCB8;
	Tue, 19 May 2026 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779197404;
	bh=Qk0YPdXadh6gnxCFGgWURqYt9B9xWapoQxKMXj0j7X0=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=gTLUQRMqgkuxHpTV/r9iYqk/XhiO3In+q/HzrGX8yL/+FZV8g2vxuheyh8/fU7G+O
	 SsCSjXjwEAReLWrPxD41vZ0WgDl/UHLlrF+Ub4rihUakPeY3/RcD25BweyJxfWxHlR
	 Y26PlcNzX44L9pKJTl22jf47YHl+mQP9e/SQAOQf//F4bwxdClHceOnCMsjTbzIA5a
	 1BdW9YZMiuXA8K0UbQiTLfr+ud8rzJ4UET7T+qYEvyWzKw8YsLU5moTaO1/L90hIbp
	 iiN+8qcQDBzR3b1RCK6G8+odL6Ma7VeHE9YtFAEkZpxkQS+bSu9VzZFai0ZmH4tMwa
	 8iSZBQXwkQ4AA==
Message-ID: <655cfcf9-d015-49d3-886b-1c4a38553aab@kernel.org>
Date: Tue, 19 May 2026 15:30:02 +0200
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
Content-Language: en-US, nl
In-Reply-To: <67cd61cb2dd1988f3ccc93e7eb1eff42014ce830.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-62146-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,syzkaller.appspot.com:url]
X-Rspamd-Queue-Id: 01D2857FCA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/05/2026 16:59, Nicolas Dufresne wrote:
> Le mercredi 13 mai 2026 à 10:52 +0200, Hans Verkuil a écrit :
>> The vivid_update_format_cap/out() functions must only be called if the
>> capture/output queue are not busy. But for several controls that is not
>> checked.
>>
>> Only when streaming starts will they be set to 'grabbed' and it is
>> impossible to change the control, but between REQBUFS and STREAMON you
>> are still allowed to set these controls. Since vivid_update_format_cap/out
>> will change the format, this can cause unexpected results.
>>
>> I suspect that this is the cause of this syzbot bug:
>>
>> https://syzkaller.appspot.com/bug?extid=dac8f5eaa46837e97b89
>>
>> But since we never have reproducers, it is hard to be certain. In any case,
>> these checks are needed regardless.
>>
>> Reported-by: syzbot+dac8f5eaa46837e97b89@syzkaller.appspotmail.com
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> index f94c15ff84f7..e40ff999cad8 100644
>> --- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> +++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
>> @@ -608,18 +608,26 @@ static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
>>  		tpg_s_vflip(&dev->tpg, dev->sensor_vflip ^ dev->vflip);
>>  		break;
>>  	case VIVID_CID_REDUCED_FPS:
>> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
>> +			return -EBUSY;
> 
> It is unclear to me why users need to free all the buffers to enable this
> feature.  Should that one only be limited to not being streaming ? I believe it
> will only affect the HDMI DV Timings and the frame internal in params right ?

The problem is that vivid_update_format_cap() resets the format, as you expect
when changing input or standard, or timing.

This control implies a new timing, so that's why vivid_update_format_cap
is called. And that requires the is_busy check.

It could be implemented differently, but then this control shouldn't use
vivid_update_format_cap().

It's something for another time, for now I want to be consistent in always
checking vb2_is_busy before vivid_update_format_cap can be called.

Regards,

	Hans

> 
>>  		dev->reduced_fps = ctrl->val;
>>  		vivid_update_format_cap(dev, true);
>>  		break;
>>  	case VIVID_CID_HAS_CROP_CAP:
>> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
>> +			return -EBUSY;
>>  		dev->has_crop_cap = ctrl->val;
>>  		vivid_update_format_cap(dev, true);
>>  		break;
>>  	case VIVID_CID_HAS_COMPOSE_CAP:
>> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
>> +			return -EBUSY;
>>  		dev->has_compose_cap = ctrl->val;
>>  		vivid_update_format_cap(dev, true);
>>  		break;
>>  	case VIVID_CID_HAS_SCALER_CAP:
>> +		if (vb2_is_busy(&dev->vb_vid_cap_q))
>> +			return -EBUSY;
>>  		dev->has_scaler_cap = ctrl->val;
>>  		vivid_update_format_cap(dev, true);
>>  		break;
>> @@ -1116,14 +1124,20 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl
>> *ctrl)
>>
>>  	switch (ctrl->id) {
>>  	case VIVID_CID_HAS_CROP_OUT:
>> +		if (vb2_is_busy(&dev->vb_vid_out_q))
>> +			return -EBUSY;
>>  		dev->has_crop_out = ctrl->val;
>>  		vivid_update_format_out(dev);
>>  		break;
>>  	case VIVID_CID_HAS_COMPOSE_OUT:
>> +		if (vb2_is_busy(&dev->vb_vid_out_q))
>> +			return -EBUSY;
>>  		dev->has_compose_out = ctrl->val;
>>  		vivid_update_format_out(dev);
>>  		break;
>>  	case VIVID_CID_HAS_SCALER_OUT:
>> +		if (vb2_is_busy(&dev->vb_vid_out_q))
>> +			return -EBUSY;
>>  		dev->has_scaler_out = ctrl->val;
>>  		vivid_update_format_out(dev);
>>  		break;


