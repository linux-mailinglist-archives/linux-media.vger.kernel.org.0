Return-Path: <linux-media+bounces-61308-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL/iKTFoA2qa5gEAu9opvQ
	(envelope-from <linux-media+bounces-61308-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:49:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 260A75262DA
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 19:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF74B303816D
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 17:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355BE33B6E8;
	Tue, 12 May 2026 17:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIMLK2rK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9993833B970;
	Tue, 12 May 2026 17:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607909; cv=none; b=VMIfik/77roMgn+ehczRzaCgaoAzCe83JcFoX0stRaFlVw4S+bWodL7j/qDnuwiawki7XDfTIxcTpLnpQT1PkHQbP6m1lDxCOcdnxL88DM46GyjhwyLWSepdiBIQgdrV+iJA8Do8HfJ/zxVvpdqUoi3/z3MQWHJhXzo1hAMMPwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607909; c=relaxed/simple;
	bh=KuiGVqX188w3SjAg4/tvzqFsSV8wce7vrc7dEWg9nw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shPy7QQwqnVnxrc6gN18QvM6MdwJ+KnZt3rjAwdXQOJry58ii7S+DeYtsBicHzo9alBMq39muDIP7+1m0hsLrGCjp3JWhRx4M3iWt5muS/wKwQ5sKNWpR+AWY0yl0Bik9XGC+DuBBTp+bNS3bIvZFAsd+LYScw8Gua8p9+Oo6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIMLK2rK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05662C2BCF5;
	Tue, 12 May 2026 17:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778607909;
	bh=KuiGVqX188w3SjAg4/tvzqFsSV8wce7vrc7dEWg9nw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PIMLK2rKlda4GCakCXvpmYOQVO7XiwSin8JUVDd3HqtyRmnMDgm1yI+okzruJwXAq
	 mxs5GbLD/9GCMtFw1KsnaRpQtZLhGCqMHBK8+8yqcEYJ0ZLMxWNEtUZ1uCdnmaI/Iq
	 EsdUXcGC1JZRqXTr5oAF2/8P0a604CWb0H4C7P/FDrmytCs6fjbhqct/Frn8czuTT7
	 7/qyLSXdcDbywtnZ8pov8OVP1ltfVvqGEryzvNmklYfx8PvjXVqk0O7TfW0VLzsZMk
	 zfOMm/Vy/lEHZwZHcuVMiH0T/WZ+j0J9RnufQK2QE1W5y+GIxSK70MAGiEhl1+VWaY
	 85v5bJ+Pfgyfw==
Message-ID: <7e46f6f1-b9f7-4837-847b-18177c09cd58@kernel.org>
Date: Tue, 12 May 2026 19:45:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] media: uvcvideo: clock: Do not run expensive code
 if not needed
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512-uvc-hwtimestamp-v2-0-3c2905c733bb@chromium.org>
 <20260512-uvc-hwtimestamp-v2-5-3c2905c733bb@chromium.org>
 <cdd09883-51ec-4d6e-817e-3fd9017624d8@kernel.org>
 <CANiDSCv3gM+s_On5KtGUMk2_4VYpS2UtpUTmqfb=RszwoKY7gw@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCv3gM+s_On5KtGUMk2_4VYpS2UtpUTmqfb=RszwoKY7gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 260A75262DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61308-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hansg@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Action: no action

Hi,

On 12-May-26 15:15, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Tue, 12 May 2026 at 15:02, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi,
>>
>> On 12-May-26 14:30, Ricardo Ribalda wrote:
>>> We only save relevant samples into the circular buffer.
>>>
>>> If the data is very similar to the previous one, exit early.
>>>
>>> If the data is not going to be added, do not calculate the wall time.
>>>
>>> Suggested-by: Hans de Goede <hansg@kernel.org>
>>> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>
>> 2 nits here, first nit, this really seems to be 2 different
>> changes, IMHO it would be cleaner to have the (non trivial)
>> early-exit on raw sof match patch as a separate patch from
>> the one moving the uvc_video_get_time() call ?
> 
> ack
>>
>>> ---
>>>  drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++------
>>>  drivers/media/usb/uvc/uvcvideo.h  |  3 ++-
>>>  2 files changed, 16 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>>> index 8d0fd7003c62..ea8a76f57963 100644
>>> --- a/drivers/media/usb/uvc/uvc_video.c
>>> +++ b/drivers/media/usb/uvc/uvc_video.c
>>> @@ -524,7 +524,7 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>>>
>>>       spin_lock_irqsave(&clock->lock, flags);
>>>
>>> -     if (clock->count > 0 && clock->last_sof > sample->dev_sof) {
>>> +     if (clock->count > 0 && clock->last_sof_processed > sample->dev_sof) {
>>>               /*
>>>                * Remove data from the circular buffer that is older than the
>>>                * last SOF overflow. We only support one SOF overflow per
>>> @@ -606,6 +606,12 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>>       sample.dev_sof = get_unaligned_le16(&data[header_size - 2]);
>>>       sample.dev_stc = get_unaligned_le32(&data[header_size - 6]);
>>>
>>> +     /* If the sample sof is very similar to the previous one quit early. */
>>> +     if (stream->clock.last_sof_raw == sample.dev_sof)
>>> +             return;
>>> +
>>> +     stream->clock.last_sof_raw = sample.dev_sof;
>>> +
>>>       /*
>>>        * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
>>>        * standard states that it "must be captured when the first video data
>>> @@ -644,8 +650,6 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>>       if (stream->dev->quirks & UVC_QUIRK_INVALID_DEVICE_SOF)
>>>               sample.dev_sof = sample.host_sof;
>>>
>>> -     sample.host_time = uvc_video_get_time();
>>> -
>>>       /*
>>>        * The UVC specification allows device implementations that can't obtain
>>>        * the USB frame number to keep their own frame counters as long as they
>>> @@ -682,19 +686,23 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>>        * all the data packets of the same frame contains the same SOF. In that
>>>        * case only the first one will match the host_sof.
>>>        */
>>> -     if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
>>> +     if (sof_diff(sample.dev_sof, stream->clock.last_sof_processed) <=
>>>           (UVC_MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>>>               return;
>>>
>>> +     /* This is expensive, only do it if needed */
>>> +     sample.host_time = uvc_video_get_time();
>>> +
>>
>> I think it would be slightly cleaner to just move this call
>> to inside uvc_video_clock_add_sample() ?
> 
> If you do not mind I prefer to keep it as is.
> 
> The other uvc_video_clock (add_sample, reset, init, cleanup) are
> "content agnostic" and I would prefer to keep it that way.
> 
> Let me know if this is ok before I send v3.

I've no strong preference either way, if you prefer to keep it
here that is fine.

Regards,

Hans




>>>       uvc_video_clock_add_sample(&stream->clock, &sample);
>>> -     stream->clock.last_sof = sample.dev_sof;
>>> +     stream->clock.last_sof_processed = sample.dev_sof;
>>>  }
>>>
>>>  static void uvc_video_clock_reset(struct uvc_clock *clock)
>>>  {
>>>       clock->head = 0;
>>>       clock->count = 0;
>>> -     clock->last_sof = -1;
>>> +     clock->last_sof_processed = -1;
>>> +     clock->last_sof_raw = -1;
>>>       clock->last_sof_overflow = -1;
>>>       clock->sof_offset = -1;
>>>  }
>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>> index 0a0c01b2420f..7b8477e5a0ba 100644
>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>> @@ -522,7 +522,8 @@ struct uvc_streaming {
>>>               unsigned int size;
>>>               unsigned int last_sof_overflow;
>>>
>>> -             u16 last_sof;
>>> +             u16 last_sof_processed;
>>> +             u16 last_sof_raw;
>>>               u16 sof_offset;
>>>
>>>               u8 last_scr[6];
>>>
>>
> 
> 


