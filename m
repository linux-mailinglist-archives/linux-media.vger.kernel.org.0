Return-Path: <linux-media+bounces-24324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC30A03B44
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95EAB1656C8
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 09:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DD91E2007;
	Tue,  7 Jan 2025 09:35:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E869A1DB34E;
	Tue,  7 Jan 2025 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736242509; cv=none; b=JhLdm6U1cjchQw0HSTY0csFM/+zI9cHOJWOGm1xLvABFmE8/rFmzlUqi4fSbCC5bzXkQlTLN3ns0g6QNCnk1mhfFghBCN/DGtFmj3dCxKqrLx1gBbW2moJHqNNo6U3sOMa/qOj+VDK1fJkYRmRA4M0mVoTGq+2VJ8a6YrFpaleY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736242509; c=relaxed/simple;
	bh=j0fQz8+xElL/BxYpfAtRe5EfCLxi7fA6VFv4C2qW7Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0rAX+nFzcrpqnNeYxcr9g2n0/WFIOUo7Cbzqi5aybsPFyI4r4spFyjUSbMNXzbLw94hMYrJV7gl3G9I7jGBAWLliEVacC6Cu9wzhBeNTy+xUpLjlcwWE4WNwY4rAyXLwLqpCg7J+BAspujZRW/Mtzhxnn5SKNmoXQi+ZVFvGpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F649C4CEE0;
	Tue,  7 Jan 2025 09:35:06 +0000 (UTC)
Message-ID: <9f089225-9c4a-4510-8b0c-da5ba9812a3d@xs4all.nl>
Date: Tue, 7 Jan 2025 10:35:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] media: venus: vdec: Make the range of us_per_frame
 explicit
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-arm-msm@vger.kernel.org
References: <20250106-fix-cocci-v4-0-3c8eb97995ba@chromium.org>
 <20250106-fix-cocci-v4-6-3c8eb97995ba@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250106-fix-cocci-v4-6-3c8eb97995ba@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/01/2025 14:40, Ricardo Ribalda wrote:
> Fps bigger than 0.000232829 fps, this fits in a 32 bit us_per_frame.
> There is no need to do a 64 bit division here.
> Also, the driver only works with whole fps.
> 
> Found by cocci:
> drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 6b8906ced6bc..88f6b5a3a4fe 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  	struct venus_inst *inst = to_inst(file);
>  	struct v4l2_captureparm *cap = &a->parm.capture;
>  	struct v4l2_fract *timeperframe = &cap->timeperframe;
> -	u64 us_per_frame, fps;
> +	u64 us_per_frame;
>  
>  	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>  	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> @@ -486,10 +486,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  	if (!us_per_frame || us_per_frame > USEC_PER_SEC)
>  		return -EINVAL;
>  
> -	fps = (u64)USEC_PER_SEC;
> -	do_div(fps, us_per_frame);
> -
> -	inst->fps = fps;
> +	inst->fps = USEC_PER_SEC / (u32)us_per_frame;

This still allows for an fps value of USEC_PER_SEC if us_per_frame is 1.

Looking at where inst->fps is used I see:

drivers/media/platform/qcom/venus/pm_helpers.c: return mbs * inst->fps;
drivers/media/platform/qcom/venus/venc.c:       frate.framerate = inst->fps * (1 << 16);

(mbs is at most 512x512)

So if fps is USEC_PER_SEC those calculations will wrap around.

What is the real maximum fps that the HW can handle?

Stan? Bryan? It would be nice if there is a proper sanity check here.

Regards,

	Hans


>  	timeperframe->numerator = 1;
>  	timeperframe->denominator = inst->fps;
>  
> 


