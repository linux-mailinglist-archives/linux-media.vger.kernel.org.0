Return-Path: <linux-media+bounces-61218-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JxrLPvoAmpKygEAu9opvQ
	(envelope-from <linux-media+bounces-61218-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:46:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6A51CF37
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 10:46:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3395430230C2
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 08:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0229384244;
	Tue, 12 May 2026 08:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiyYir1Q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA4A28CF6F;
	Tue, 12 May 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575586; cv=none; b=JhqUVGoH+y9Kgt7FZQ9nVmsJAOa0RGTTkNoT7UiKRiJveWD5aV86dw2Vyoool2Gf6FFJO50DRQuUFBWmt690XEKZ4lKPMhOVZVMG4b770b+s94CpUgoJfxAwGzu8343gG5owVhHugy+UwKiaWvJSkdxtcBSnx+Vrw+wvzELSG14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575586; c=relaxed/simple;
	bh=+AztvlV5otRnrD7k2fK3sAcBwzfVK9UyUY67IRAQaK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fzo81YM8ED2PUwN6j5sn2vncf51m7dD4MY3u8X7GVKaBxdCh3+hVw3+5CVW8MOcgIkTmoXkjSl10F+MkDJda+Dle37CqTyWXuDKFN6D7RPcbFgwBlJIAhj4wt+5bJeYF3ranDY3LfTAnHUFc11MgyMRq0AqyxM6fBbZgdcKayLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiyYir1Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B49C2BCB0;
	Tue, 12 May 2026 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778575583;
	bh=+AztvlV5otRnrD7k2fK3sAcBwzfVK9UyUY67IRAQaK8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SiyYir1Qe08SqLB94XLFAP/aA+Y8lDHRNIEqp7dckUomGciPI27bKXqPZ+CR75zwi
	 +FlGYoG/VLcLOKOQWv5o0rA9ZSNc3xeDrZXuXw04pdJiyXpTE77OwpYTE1x55puOQQ
	 tV/L0wR2HExT0LSFF9GCx696X2DF4jA1OMiFeNQDnsbatytt5d8Qp2K9SYB1RueVqq
	 K4SJO3tg7xnQ1wHouMtM9dUT7+LSu5epZwDDExRdqL2nF/cq87ofZi/l9bCucs1B3q
	 IUJ5eb6NFpNaq0bLapbaTWABgtBnHTI6RN3LpFePJFpRzENY0zJlvKYXIwtsOSEu1t
	 P3BDt/n35JnUQ==
Message-ID: <7e2609ff-b751-49d3-8921-9562910b5328@kernel.org>
Date: Tue, 12 May 2026 10:46:19 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: uvcvideo: Do not add clock samples with small
 sof delta
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Yunke Cao <yunkec@google.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260323-uvc-hwtimestamp-v1-0-aa42e3865204@chromium.org>
 <20260323-uvc-hwtimestamp-v1-4-aa42e3865204@chromium.org>
 <10a08462-30ce-4a79-bb5d-001ab7f3d0d8@kernel.org>
 <CANiDSCs9gby6bNBCRmxT15D8c-nksdUmwH8iUDAsiV1tmQTM3Q@mail.gmail.com>
 <2edd1e71-d345-4c91-92f0-15d39299f0b9@kernel.org>
 <CANiDSCsoRP9vzKHPN3arKX1OZ-dyyTxgsfMC9Xxp8kE6+UStAQ@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCsoRP9vzKHPN3arKX1OZ-dyyTxgsfMC9Xxp8kE6+UStAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 89F6A51CF37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61218-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Action: no action

HI,

On 11-May-26 23:36, Ricardo Ribalda wrote:
> Hi Hans
> 
> (Hi Laurent :P)
> 
> 
> 
> On Mon, 11 May 2026 at 20:33, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi,
>>
>> On 11-May-26 18:50, Ricardo Ribalda wrote:
>>> Hi Hans
>>>
>>> On Mon, 11 May 2026 at 18:07, Hans de Goede <hansg@kernel.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 23-Mar-26 14:10, Ricardo Ribalda wrote:
>>>>> Some UVC 1.1 cameras running in fast isochronous mode tend to spam the
>>>>> USB host with a lot of empty packets. These packets contain clock
>>>>> information and are added to the clock buffer but do not add any
>>>>> accuracy to the calculation. In fact, it is quite the opposite, in our
>>>>> calculations, only the first and the last timestamp is used, and we only
>>>>> have 32 slots.
>>>>>
>>>>> Ignore the samples that will produce less than MIN_HW_TIMESTAMP_DIFF
>>>>> data.
>>>>>
>>>>> Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
>>>>> Cc: stable@vger.kernel.org
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>>  drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++++--
>>>>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>>>>> index dcbc0941ffe6..e1a4e84d6841 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_video.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_video.c
>>>>> @@ -544,6 +544,19 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>>>>>       spin_unlock_irqrestore(&clock->lock, flags);
>>>>>  }
>>>>>
>>>>> +static inline u16 sof_diff(u16 a, u16 b)
>>>>> +{
>>>>> +     u32 aux;
>>>>> +
>>>>> +     a &= 2047;
>>>>> +     b &= 2047;
>>>>> +     if (a >= b)
>>>>> +             return a - b;
>>>>> +
>>>>> +     aux = a + 2048;
>>>>> +     return (u16)(aux - b);
>>>>> +}
>>>>> +
>>>>>  static void
>>>>>  uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>>>>                      const u8 *data, int len)
>>>>> @@ -664,12 +677,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>>>>       sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
>>>>>
>>>>>       /*
>>>>> -      * To limit the amount of data, drop SCRs with an SOF identical to the
>>>>> +      * To limit the amount of data, drop SCRs with an SOF similar to the
>>>>>        * previous one. This filtering is also needed to support UVC 1.5, where
>>>>>        * all the data packets of the same frame contains the same SOF. In that
>>>>>        * case only the first one will match the host_sof.
>>>>>        */
>>>>> -     if (sample.dev_sof == stream->clock.last_sof)
>>>>> +     if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
>>>>> +         (MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>>>>>               return;
>>>>
>>>> If I understand things correctly then uvc_video_clock_update() uses
>>>> first->host_time + some correction time. But you might end up not
>>>> storing a sample for the very first isochronous USB packet of a frame
>>>> because of this new check.  Which means that the first->host_time used
>>>> as a starting point for the timestamp just has become inaccurate ?
>>>
>>> In UVC 1.5 All the ISOC packets have the same dev_sof and dev_stc.
>>> So this check will avoid adding a whole frame into the timestamp
>>> circular buffer when running at more than 320 Hz (1/(0.1/32))
>>>
>>> In UVC 1.1 all ISOC packets have the same dev_stc but different dev_sof.
>>> This check will avoid adding some of those packets into the circular
>>> buffer, but the accuracy will not be lost. We will use the data from
>>> the neighbour packets (even from previous frames) to recover the sof.
>>>
>>> The biggest winner for this patch is UVC 1.1, which will have much
>>> more accurate timestamps, because the distance between the first and
>>> last will be bigger (as in uvc1.5)
>>
>> I'm still trying to wrap my head about the whole concept of the hw
>> timestamps TBH.
>>
>> Upon reading it a couple of times I now see that when exactly we
>> take samples is not important because the actual frame time in
>> STC units is stored in buf->pts and that is supposed to be our
>> starting point. And the rest is just used to calculate
>> a factor + offset.
>>
>> At least that is what the big comment says but I'm confused by
>> the code which is supposed to implement:
>>
>>  * SOF = (SOF2 - SOF1) / (STC2 - STC1) * PTS
>>  *     + (SOF1 * STC2 - SOF2 * STC1) / (STC2 - STC1)
>>  *
>>  * or
>>  *
>>  * SOF = ((SOF2 - SOF1) * PTS + SOF1 * STC2 - SOF2 * STC1) / (STC2 - STC1)   (1)
>>
>> I think that the code tries to implement the second formula:
>>
>> We've (with some checks removed):
>>
>>         /* First step, PTS to SOF conversion. */
>>         delta_stc = buf->pts - (1UL << 31);
>>         x1 = first->dev_stc - delta_stc;
>>         x2 = last->dev_stc - delta_stc;
>>
>>         y1 = (first->dev_sof + 2048) << 16;
>>         y2 = (last->dev_sof + 2048) << 16;
>>         if (y2 < y1)
>>                 y2 += 2048 << 16;
>>
>>         y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
>>           - (u64)y2 * (u64)x1;
>>         y = div_u64(y, x2 - x1);
>>
>>         sof = y;
>>
>> Simplifying this by removing all the range-shifting
>> and using sof1/sof2 instead of y1/y2 like in the comment
>> we end up with:
>>
>>         x1 = first->dev_stc - buf->pts;
>>         x2 = last->dev_stc - buf->pts;
>>
>>         sof1 = first->dev_sof;
>>         sof2 = last->dev_sof
>>
>>         sof = ((sof2 - sof1) + sof1 * x2 - sof2 * x1) / (x2 - x1)
>>
>> Now substitute stc1/stc2 for first->dev_stc / last->dev_stc
>> and just pts for buf->pts and expand x1 + x2 we get:
>>
>>         sof = ((sof2 - sof1) + sof1 * (stc2 - pts) - sof2 * (stc1 - pts)) /
>>               ((stc2 - pts) - (stc1 - pts))
> 
> 
> 
> I think this is where your explanation goes slightly off:
> 
> x2 is actually stc2 - pts + (1UL << 31), and x1 is stc1 - pts + (1UL << 31).
> 
> Before you scream at me, look at the end of the mail! :P
> 
> 
>>
>> We can simplify the divisor here by getting rid of the pts bit
>> since the 2 "- pts" parts negate each other:
>>
>>         sof = ((sof2 - sof1) + sof1 * (stc2 - pts) - sof2 * (stc1 - pts)) /
>>               (stc2 - stc1)
>>
>> Now lets get rid of the () from expanding x1 / x2:
>>
>>         sof = ((sof2 - sof1) + sof1 * stc2 - sof1 * pts - sof2 * stc1 + sof2 * pts)) /
>>               (stc2 - stc1)
>>
>> Shuffle bringing " * pts" parts to the front:
>>
>>         sof = (sof2 * pts - sof1 * pts + (sof2 - sof1) + sof1 * stc2 - sof2 * stc1)) /
>>               (stc2 - stc1)
>>
>> Simplify:
>>
>>         sof = ((sof2 - sof1) * pts + (sof2 - sof1) + sof1 * stc2 - sof2 * stc1) /
>>               (stc2 - stc1)
>>
>> Looks a lot like the comment except there is a + (sof2 - sof1) too much
>> in there ?
>>
>> And some of the range shifting also feels wrong. As long as we're only
>> subtracting the range shifting is fine. But as soon as we start multiplying
>> variables in different shifted ranges the end result actually changes.
>>
>> Especially weird here is that we range-shift by (1UL << 31) for calculating
>> delta_stc and then *multiply* (y2 - y1) by (1ULL << 31) I guess this is
>> to compensate for the (1ULL << 31) component of x1/x2 but the first->dev_stc
>> and pts parts of x1 where never multiplied by (1ULL << 31) so these
>> are still in their original *scale*. Either we should multiply all
>> parts to go to some other fixed scale and the sof value are both range-shifted
>> by 2048 as well as multiplied by 65536, which also seems wrong to me as
>> soon as we do sof1 * stc2 or sof2 * stc1
>>
>> All in all this all feels like there are some issues lurking here and it
>> does not seem to match the comment at the top.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
> 
> Lets go back to the beggining:
> 
> SOF = ((SOF2 - SOF1) * PTS + SOF1 * STC2 - SOF2 * STC1) / (STC2 - STC1)
> 
> This is the formula for a straight line when you know two points. The
> names are super ugly, lets use something we are more used to:
> 
> y = ((y2 - y1) * x + y1 * x2 - y2 * x1) / (x2 - x1) ;
> 
> Ok. how would this look if we want x to be exactly at (1 << 31) to
> prevent unsigned underflow? ?
> 
> we just have to move things around:
> 
> delta = x - (1<<31);
> 
> new_x1 = x1 - delta = x1 - x + (1<<31)
> new_x2 = x2 - delta = x2 - x + (1<<31)
> 
> We plug this in the formula and:
> 
> y = ((y2-y1) * (1 <<31) + y1 * new_x2 - y2*new_x1) /(new_x2-new_x1);
> Which is exactly what we have.
> 
> 
> Now lets look at the scaling:
> 
>          delta_stc = buf->pts - (1UL << 31);
>          x1 = first->dev_stc - delta_stc;
>          x2 = last->dev_stc - delta_stc;
> 
> X1 and X2 are NOT scaled
> 
>          y1 = (first->dev_sof + 2048) << 16;
>          y2 = (last->dev_sof + 2048) << 16;
>          if (y2 < y1)
>                  y2 += 2048 << 16;
> 
> Y1 and Y2 is scaled 16 (ignore the +2048, the variable is mod(2048))
> 
>          y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
>            - (u64)y2 * (u64)x1;
>          y = div_u64(y, x2 - x1);
> 
> y = (SCALE16 - SCALE16)*K + SCALE16*SCALE1 - SCALE16*SCALE1; => Result
> is SCALE16
> y = div64(SCALE16, SCALE1) => Result is SCALE16
> 
> So it looks good to me. It is a painful code, but I think it is correct.

Ok, thank you for explaining this.

Regardless of the math which true me off, the actual sampling logic
is not that complicated.

Now that I realize that the exact sample moments do not matter because
buf->pts is our time-reference for the frame and not start->host_time
as my naive first reading of the code suggested this patch seems fine:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



