Return-Path: <linux-media+bounces-36319-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D736AEE20A
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:12:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF40316C736
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5364E28DF06;
	Mon, 30 Jun 2025 15:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAuXvgUC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8FA28C5D9;
	Mon, 30 Jun 2025 15:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751296353; cv=none; b=oT2rG9/QKCrGfwRWFXMgmLpE9MEKaHReS/isnKBjFbMg1voSsYH9a+uniY8LMbVucS0qwQ0cczP9bIAZoKOJcPJhcbyrhH5SMS4HrumhKoj0yTLm81ZTOZaO+X2jb2OPNd4DcqN5v1ElN9dxx2Gr+vAPY2ZUlFATyVrJtm3LyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751296353; c=relaxed/simple;
	bh=kqQwD4dI35GDJ8LUupgJ6KuSllagGFe0S0gE3Z/ZbXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jnCFK0yDazg/Ht9AsqTbMNvvVhkthBxvL2suckp1kfxaJ8vkXX5cjiI+6121rxIMraLq0wku1V6BIw1F51S6CpxKqilkk5btyo/SA/dNOEifyDzlVMZoXlaUfLfQrodyypPh0XOtAHpF1GHE1CZKz53RD34vuRLC5e/Iu8CSSvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAuXvgUC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19D3C4CEE3;
	Mon, 30 Jun 2025 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751296353;
	bh=kqQwD4dI35GDJ8LUupgJ6KuSllagGFe0S0gE3Z/ZbXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aAuXvgUCSRPlmMdd0Ns01q3UnPR5Wvwiu2j/PzFWMG0Ed0i2E61bgpkhZSnaWnGfl
	 ETF4Yo2DPDa1fVM0Rd4Jw3wKS7XVT05iqlp20dlCGf5SXaoX2CnNfpsgVVHXECe6ui
	 d32S2kCETf1h7kQpR1wFQ3/HUMdOu3kcRK81gc8CdcYG9z6yYvSw/p8SpFZ679BkOU
	 gRp3P7K5BgU7/JO0/qfpZTIxlqlUiD3gW8YidmNhIfl5nx4Bh85q8um9j13uYfGUyE
	 5Kg2Sy0W7yH7WWgB3B2Ewgf+bhd3hftGK9XnmUp5FVHJTuJB5IIzHQCPbUFLxDIf0Q
	 4mwmvuyaKl8JQ==
Message-ID: <d541ee58-2fa5-4c1e-b744-2e080065fe39@kernel.org>
Date: Mon, 30 Jun 2025 17:12:29 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: uvcvideo: Split uvc_stop_streaming()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hans@jjverkuil.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-3-250286570ee7@chromium.org>
 <20250630141707.GG20333@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250630141707.GG20333@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Laurent

On 30-Jun-25 4:17 PM, Laurent Pinchart wrote:
> On Mon, Jun 16, 2025 at 03:24:40PM +0000, Ricardo Ribalda wrote:
>> uvc_stop_streaming() is used for meta and video nodes. Split the function
>> in two to avoid confusion.
>>
>> Use this opportunity to rename uvc_start_streaming() to
>> uvc_start_streaming_video(), as it is only called by the video nodes.
>>
>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
>>  1 file changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
>> index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
>> --- a/drivers/media/usb/uvc/uvc_queue.c
>> +++ b/drivers/media/usb/uvc/uvc_queue.c
>> @@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
>>  		uvc_video_clock_update(stream, vbuf, buf);
>>  }
>>  
>> -static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
>> +static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>>  {
>>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>>  	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
>> @@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
>>  	return ret;
>>  }
>>  
>> -static void uvc_stop_streaming(struct vb2_queue *vq)
>> +static void uvc_stop_streaming_video(struct vb2_queue *vq)
>>  {
>>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>>  
>>  	lockdep_assert_irqs_enabled();
>>  
>> -	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
>> -		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
>> +	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
>> +
>> +	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
>> +}
>> +
>> +static void uvc_stop_streaming_meta(struct vb2_queue *vq)
>> +{
>> +	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>> +
>> +	lockdep_assert_irqs_enabled();
>>  
>>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> 
> I haven't checked where it was introduced, but I think you have a race
> here. uvc_queue_return_buffers() will return all buffers currently
> sitting in the queue->irqqueue. This can race with a bunch of places in
> uvc_video.c that call uvc_queue_get_current_buffer() or
> uvc_queue_get_next_buffer(), as those functions return a buffer without
> removing it from the list.

This change just splits uvc_stop_streaming() into 2 separate
functions for uvc_queue_qops + uvc_meta_queue_qops to remove
the weird looking "if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)"
check done in the shared uvc_stop_streaming().

This patch does not make any functional changes. So if such
a race exists then that is a pre-existing problem and not
caused by this patch.

Regards,

Hans



> 
>>  }
>> @@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
>>  	.buf_prepare = uvc_buffer_prepare,
>>  	.buf_queue = uvc_buffer_queue,
>>  	.buf_finish = uvc_buffer_finish,
>> -	.start_streaming = uvc_start_streaming,
>> -	.stop_streaming = uvc_stop_streaming,
>> +	.start_streaming = uvc_start_streaming_video,
>> +	.stop_streaming = uvc_stop_streaming_video,
>>  };
>>  
>>  static const struct vb2_ops uvc_meta_queue_qops = {
>>  	.queue_setup = uvc_queue_setup,
>>  	.buf_prepare = uvc_buffer_prepare,
>>  	.buf_queue = uvc_buffer_queue,
>> -	.stop_streaming = uvc_stop_streaming,
>> +	.stop_streaming = uvc_stop_streaming_meta,
>>  };
>>  
>>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type)
> 


