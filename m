Return-Path: <linux-media+bounces-30554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE5A9392B
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 17:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FDB1B62C22
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 15:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDB7207A11;
	Fri, 18 Apr 2025 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="cKZSTjcg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A0205E00
	for <linux-media@vger.kernel.org>; Fri, 18 Apr 2025 15:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744989129; cv=none; b=CzWOZPCLHfRs8fF8FfO4h8qOahHDiNxv9+nW6x0I6f6/N4CEqjCibWb4TuAXdGSD6h7jdqNxnlrZbOfqto0Lyz4TgjkpF0gxBQzRxd8qQlvkzwY+FSD1EXAJG9GHgiqHc+660ofei44oKPg21GIauNcidipsnS6pIR0NFimhWEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744989129; c=relaxed/simple;
	bh=mcPguKrpO7L/ms24ZzULya2onsD58fOJK8+l1yAIrRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjTjtflus5fPPNed9zxj46M0wfcXiBdATkCh1oghZ2QjW78TIPEvfSSpp9CMJNzDXEdtwoLadEPw48JSDUHYoURTFAUXf+w52Dk0OaFjoik+sFMKJkdvv3l5GhWZ+3ZX/ZxeRB9tuZnLgxOH4WUPS2amn5SKpNRxnNWktck4ePc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=cKZSTjcg; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1744989125;
 bh=gZ99nEDhjJPtKYQc2hoc52nGqWB8ytY2CleaomSYJWE=;
 b=cKZSTjcgJ4OrQac1gkQPq8uQXmYH0FQHGy4mFPUqt28HsZNtZIoLIfHbQD7OpnTMlEeHHmFFo
 8ZLbhqaCwXOauXiy3x63OBllwCxHFa10eP4guNa4ktGB5Lof3NoMgYRJDsOFFdUzsorSWVJlNnB
 kyJEsMRQtlJO+mWgvm7HDyjV3Nsnx40RGMcQXJ3PlteXezDwtyhvsIxTeyzKAY8tSL5Gv4ikygc
 SGSvRTL3j5h9BJv8z7MHLSA6NhoZTCznXIfJiH35AB/zyWSA9BN5ubod+K9OtPdpKSoAQjbgRP4
 MKzxpTPMX/TcKA40XaW5GuXFBdGIMxQS3hTlYzYMFnDQ==
X-Forward-Email-ID: 68026bbf750a8e94b92eccb3
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <4161ab9e-3be5-4738-9bbe-0dba636b838a@kwiboo.se>
Date: Fri, 18 Apr 2025 17:11:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] media: rkvdec: Add get_image_fmt ops
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250417-b4-rkvdec_h264_high10_and_422_support-v9-0-0e8738ccb46b@collabora.com>
 <20250417-b4-rkvdec_h264_high10_and_422_support-v9-3-0e8738ccb46b@collabora.com>
 <8d1c3c82-dbdc-4064-8188-bab586996302@kwiboo.se>
 <4be400281b3fe53b724025ffa837ceed777d7699.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <4be400281b3fe53b724025ffa837ceed777d7699.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nicolas,

On 2025-04-18 14:28, Nicolas Dufresne wrote:
> Le vendredi 18 avril 2025 à 08:22 +0200, Jonas Karlman a écrit :
>> Hi Nicolas,
>>
>> On 2025-04-17 23:58, Nicolas Dufresne wrote:
>>> From: Jonas Karlman <jonas@kwiboo.se>
>>>
>>> Add support for a get_image_fmt() ops that returns the required image
>>> format.
>>>
>>> The CAPTURE format is reset when the required image format changes and
>>> the buffer queue is not busy.
>>>
>>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>>> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>> Co-developed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>> ---
>>>  drivers/staging/media/rkvdec/rkvdec.c | 35 +++++++++++++++++++++++++++++++++++
>>>  drivers/staging/media/rkvdec/rkvdec.h |  2 ++
>>>  2 files changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
>>> index 7b780392bb6a63cc954655ef940e87146d2b852f..6c6fe411f48772419e1810d869ab40d168848e65 100644
>>> --- a/drivers/staging/media/rkvdec/rkvdec.c
>>> +++ b/drivers/staging/media/rkvdec/rkvdec.c
>>> @@ -72,6 +72,15 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc,
>>>  	return false;
>>>  }
>>>  
>>> +static bool rkvdec_fmt_changed(struct rkvdec_ctx *ctx,
>>> +			       enum rkvdec_image_fmt image_fmt)
>>
>> Just a small nitpick:
>>
>> Maybe this function should be called rkvdec_image_fmt_changed() and
>> could be moved closer to rkvdec_image_fmt_match() as those two are
>> related to image_fmt and not the pixfmt/fourcc.
> 
> Applied locally. With this change, may I have your Rb ?

Sure, and thanks for helping getting this old series to land :-)

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> 
> thanks,
> Nicolas
> 
>>
>> Regards,
>> Jonas
>>
>>> +{
>>> +	if (image_fmt == RKVDEC_IMG_FMT_ANY)
>>> +		return false;
>>> +
>>> +	return ctx->image_fmt != image_fmt;
>>> +}
>>> +
>>>  static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>>>  				       struct v4l2_pix_format_mplane *pix_mp)
>>>  {
>>> @@ -118,8 +127,34 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>>>  	return 0;
>>>  }
>>>  
>>> +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
>>> +	const struct rkvdec_coded_fmt_desc *desc = ctx->coded_fmt_desc;
>>> +	enum rkvdec_image_fmt image_fmt;
>>> +	struct vb2_queue *vq;
>>> +
>>> +	/* Check if this change requires a capture format reset */
>>> +	if (!desc->ops->get_image_fmt)
>>> +		return 0;
>>> +
>>> +	image_fmt = desc->ops->get_image_fmt(ctx, ctrl);
>>> +	if (rkvdec_fmt_changed(ctx, image_fmt)) {
>>> +		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
>>> +				     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>> +		if (vb2_is_busy(vq))
>>> +			return -EBUSY;
>>> +
>>> +		ctx->image_fmt = image_fmt;
>>> +		rkvdec_reset_decoded_fmt(ctx);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>>>  	.try_ctrl = rkvdec_try_ctrl,
>>> +	.s_ctrl = rkvdec_s_ctrl,
>>>  };
>>>  
>>>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>>> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
>>> index 6f8cf50c5d99aad2f52e321f54f3ca17166ddf98..e466a2753ccfc13738e0a672bc578e521af2c3f2 100644
>>> --- a/drivers/staging/media/rkvdec/rkvdec.h
>>> +++ b/drivers/staging/media/rkvdec/rkvdec.h
>>> @@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
>>>  		     struct vb2_v4l2_buffer *dst_buf,
>>>  		     enum vb2_buffer_state result);
>>>  	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
>>> +	enum rkvdec_image_fmt (*get_image_fmt)(struct rkvdec_ctx *ctx,
>>> +					       struct v4l2_ctrl *ctrl);
>>>  };
>>>  
>>>  enum rkvdec_image_fmt {
>>>
>>


