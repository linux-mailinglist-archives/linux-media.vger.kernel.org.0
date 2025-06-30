Return-Path: <linux-media+bounces-36291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF295AEDEC6
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 961E23A43FB
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A9728C5DC;
	Mon, 30 Jun 2025 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h33Sp5Qx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683E28B7EF;
	Mon, 30 Jun 2025 13:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289162; cv=none; b=nLwkbq7mSyNTrgsansVPwpA0adFSiYYbSjypY0mG7hCd9ZY7AU0YHvTqGQtILY3zQtOuDimznSHUr42gFlxc1yyK5zZN8KKsT21YLZ4furrWuahcr+XjELXcLjE+up7K4EyGjLVgV5E72nhhRSuiexv/yCzH67Kw0GgvwyyEEjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289162; c=relaxed/simple;
	bh=3vlsjbDTvmQj/WsIY9zNqu7qPR25a3VdjKTxsAo4JcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YahRCPSiP1cHj+q9+A247xlOirPRQq0vwoz9yIfQFWV/69XaLDoU+ocXScFBig8SWoxICBVlQGW4p/PSBIBAs65cEQ8WXq3CLw8n0YX7OQ5xhZAF8XSUCz3EdZA84moe7D3dimo9pbz8lP//ZF7JQwSgGFiUIHsx+Xzvy9iCcRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h33Sp5Qx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173A7C4CEEF;
	Mon, 30 Jun 2025 13:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751289161;
	bh=3vlsjbDTvmQj/WsIY9zNqu7qPR25a3VdjKTxsAo4JcA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h33Sp5QxfDssCYKqP6zwmKoDczTMqZw7E4KoMEuTvjhT95l3JXcHXs0RyFXIKUeJB
	 vmTwGkIvJt2v/lOS6/kKJLYBcBgzkv+2LfufW/7Yh5QWrskzBqIQ0+rJT6cZN4XcD5
	 3BmBkmRR4XM/+qno3oo53feJJnSm4NiqESIQiPlwTQIEOAy5brUlXe2asj11mEf1aJ
	 LkzfgJNMbg9y0VU+RMctXjI0aujILfrjeRPPkmgYoYIPIgqCpw/fXdnM9ubrsbaFta
	 69lJdGf3cUOqFFn5BTLkfOVlSebzwr8An6qTu7mFQgOGDAIvhBwMgCY6JVUQDxKhwm
	 Isbf8CY1aMG/A==
Message-ID: <d449ae59-11a2-436e-a51c-cf2fa3657ba2@kernel.org>
Date: Mon, 30 Jun 2025 15:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] media: uvcvideo: Split uvc_stop_streaming()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Ricardo Ribalda
 <ribalda@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-3-250286570ee7@chromium.org>
 <04e10cfa-f1b1-4327-b0ca-c66f8450d42f@xs4all.nl>
 <c97af8e7-5c11-45f4-838c-d934b0a379c1@kernel.org>
 <20250630131004.GF20333@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250630131004.GF20333@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Jun-25 3:10 PM, Laurent Pinchart wrote:
> On Mon, Jun 30, 2025 at 02:59:05PM +0200, Hans de Goede wrote:
>> On 17-Jun-25 11:27 AM, Hans Verkuil wrote:
>>> On 16/06/2025 17:24, Ricardo Ribalda wrote:
>>>> uvc_stop_streaming() is used for meta and video nodes. Split the function
>>>> in two to avoid confusion.
>>>>
>>>> Use this opportunity to rename uvc_start_streaming() to
>>>> uvc_start_streaming_video(), as it is only called by the video nodes.
>>>>
>>>> Reviewed-by: Hans de Goede <hansg@kernel.org>
>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>> ---
>>>>  drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
>>>>  1 file changed, 15 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
>>>> index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
>>>> --- a/drivers/media/usb/uvc/uvc_queue.c
>>>> +++ b/drivers/media/usb/uvc/uvc_queue.c
>>>> @@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
>>>>  		uvc_video_clock_update(stream, vbuf, buf);
>>>>  }
>>>>  
>>>> -static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
>>>> +static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
>>>>  {
>>>>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>>>>  	struct uvc_streaming *stream = uvc_queue_to_stream(queue);
>>>> @@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
>>>>  	return ret;
>>>>  }
>>>>  
>>>> -static void uvc_stop_streaming(struct vb2_queue *vq)
>>>> +static void uvc_stop_streaming_video(struct vb2_queue *vq)
>>>>  {
>>>>  	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>>>>  
>>>>  	lockdep_assert_irqs_enabled();
>>>>  
>>>> -	if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
>>>> -		uvc_video_stop_streaming(uvc_queue_to_stream(queue));
>>>> +	uvc_video_stop_streaming(uvc_queue_to_stream(queue));
>>>> +
>>>> +	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
>>>> +}
>>>> +
>>>> +static void uvc_stop_streaming_meta(struct vb2_queue *vq)
>>>> +{
>>>> +	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
>>>> +
>>>> +	lockdep_assert_irqs_enabled();
>>>>  
>>>>  	uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
>>>>  }
>>>> @@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
>>>>  	.buf_prepare = uvc_buffer_prepare,
>>>>  	.buf_queue = uvc_buffer_queue,
>>>>  	.buf_finish = uvc_buffer_finish,
>>>> -	.start_streaming = uvc_start_streaming,
>>>> -	.stop_streaming = uvc_stop_streaming,
>>>> +	.start_streaming = uvc_start_streaming_video,
>>>> +	.stop_streaming = uvc_stop_streaming_video,
>>>>  };
>>>>  
>>>>  static const struct vb2_ops uvc_meta_queue_qops = {
>>>>  	.queue_setup = uvc_queue_setup,
>>>>  	.buf_prepare = uvc_buffer_prepare,
>>>>  	.buf_queue = uvc_buffer_queue,
>>>> -	.stop_streaming = uvc_stop_streaming,
>>>> +	.stop_streaming = uvc_stop_streaming_meta,
>>>>  };
>>>
>>> I think there should be a comment stating that the metadata stream
>>> expects that video is streaming, it does not start streaming by itself.
>>>
>>> Something like:
>>>
>>> 	/*
>>> 	 * .start_streaming is not provided here. Metadata relies on
>>> 	 * video streaming being active. If video isn't streaming, then
>>> 	 * no metadata will arrive either.
>>> 	 */
>>>
>>> It's unexpected that there is no start_streaming for metadata, so a
>>> comment wouldn't hurt.
>>
>> I've added this comment while merging this series and I've now pushed
>> the entire series to uvc.git/for-next .
>>
>> BTW it seems that both uvc.git/next and uvc.git/for-next are in
>> use now?  With uvc.git/next seemingly following media-commiters/next ?
> 
> As far as I understand, some jobs in the media CI use the next branch,
> for instance the bisect job that tries to compile every commit uses the
> next branch as a base. We therefore need to keep the next branch
> up-to-date, mirroring upstream.

Ok, so we have the next branch mirroring upstream and then we
use for-next to merge new patches as I've just done ?

Regards,

Hans




