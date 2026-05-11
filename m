Return-Path: <linux-media+bounces-61168-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLqXGSUiAmocoAEAu9opvQ
	(envelope-from <linux-media+bounces-61168-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 20:38:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8430514888
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 20:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59FE8302C5C6
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 18:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1751947D925;
	Mon, 11 May 2026 18:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIp2asCT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80790355F35;
	Mon, 11 May 2026 18:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778524423; cv=none; b=aqamUK1SnEix1ItENq19hsXCHISQ5Gfm1MLkYpYXTDOw4t6jl66nUAgoa+W9Xsch0jtB7clwTinHYsB32JKAP5ktZKNEA6bNrW8DE/yHYYjATYidyKq6NY1Uk/ZHvPJFIYjLsHoCL2Jxak3Twq/XeHEVFx3Ezjlg75DDDOsx+zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778524423; c=relaxed/simple;
	bh=MjQ2U7rtbh77tgtfk9DmrOc/CTtC5+Z5CLWJfQ/jwLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DUXukjO1AVgIbrb3aanU3w5Twq3ADuqElg3skK6TXyzvGJDxntHo8pCS6pz+wLbziaTNDG5kf5zh5nkotmdMP0+8jXWWWWoHY1zf2b3qIQcftVIfKyn5cIIVhKKv9s2Przdbx3WbHRKo3vg6mnzHNR1wiKfXljpDzmSehIs5XWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIp2asCT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7552EC2BCC9;
	Mon, 11 May 2026 18:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778524423;
	bh=MjQ2U7rtbh77tgtfk9DmrOc/CTtC5+Z5CLWJfQ/jwLU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VIp2asCToy2fmlUQxV0BMuliOUUM6KRqR97JWwtZLLcSJXsfizfOms5LNyp/ZhMvG
	 qWsO4UuM2EMZZwCxcNctPNc2JbHJDXLIU8FNMNBZKoRN/ZifSiy8Dn9dptlGJG5Lax
	 KxoSWsSzAUmcNjVsbkjQN5J9+r2j9IqhsOzCr2Dapm9/LUr2sdYsrwSwcDiXqRzT6I
	 /MBkL24JRfLfTBRknv1sWEw2WJb6dk6RzNkomKvsmRS9rfrJQaHNEjKTojFTCg5R5i
	 sra5zweX9U0LE9ugp7flFuBpRMQe6Eu1zeHKWL90Qs9nGCp2Xr+OilGNLATDyEfnig
	 +ms2URE9rFxWg==
Message-ID: <2edd1e71-d345-4c91-92f0-15d39299f0b9@kernel.org>
Date: Mon, 11 May 2026 20:33:39 +0200
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
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CANiDSCs9gby6bNBCRmxT15D8c-nksdUmwH8iUDAsiV1tmQTM3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E8430514888
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61168-lists,linux-media=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Hi,

On 11-May-26 18:50, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 11 May 2026 at 18:07, Hans de Goede <hansg@kernel.org> wrote:
>>
>> Hi,
>>
>> On 23-Mar-26 14:10, Ricardo Ribalda wrote:
>>> Some UVC 1.1 cameras running in fast isochronous mode tend to spam the
>>> USB host with a lot of empty packets. These packets contain clock
>>> information and are added to the clock buffer but do not add any
>>> accuracy to the calculation. In fact, it is quite the opposite, in our
>>> calculations, only the first and the last timestamp is used, and we only
>>> have 32 slots.
>>>
>>> Ignore the samples that will produce less than MIN_HW_TIMESTAMP_DIFF
>>> data.
>>>
>>> Fixes: 141270bd95d4 ("media: uvcvideo: Refactor clock circular buffer")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>> ---
>>>  drivers/media/usb/uvc/uvc_video.c | 18 ++++++++++++++++--
>>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
>>> index dcbc0941ffe6..e1a4e84d6841 100644
>>> --- a/drivers/media/usb/uvc/uvc_video.c
>>> +++ b/drivers/media/usb/uvc/uvc_video.c
>>> @@ -544,6 +544,19 @@ static void uvc_video_clock_add_sample(struct uvc_clock *clock,
>>>       spin_unlock_irqrestore(&clock->lock, flags);
>>>  }
>>>
>>> +static inline u16 sof_diff(u16 a, u16 b)
>>> +{
>>> +     u32 aux;
>>> +
>>> +     a &= 2047;
>>> +     b &= 2047;
>>> +     if (a >= b)
>>> +             return a - b;
>>> +
>>> +     aux = a + 2048;
>>> +     return (u16)(aux - b);
>>> +}
>>> +
>>>  static void
>>>  uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>>                      const u8 *data, int len)
>>> @@ -664,12 +677,13 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
>>>       sample.dev_sof = (sample.dev_sof + stream->clock.sof_offset) & 2047;
>>>
>>>       /*
>>> -      * To limit the amount of data, drop SCRs with an SOF identical to the
>>> +      * To limit the amount of data, drop SCRs with an SOF similar to the
>>>        * previous one. This filtering is also needed to support UVC 1.5, where
>>>        * all the data packets of the same frame contains the same SOF. In that
>>>        * case only the first one will match the host_sof.
>>>        */
>>> -     if (sample.dev_sof == stream->clock.last_sof)
>>> +     if (sof_diff(sample.dev_sof, stream->clock.last_sof) <=
>>> +         (MIN_HW_TIMESTAMP_DIFF / stream->clock.size))
>>>               return;
>>
>> If I understand things correctly then uvc_video_clock_update() uses
>> first->host_time + some correction time. But you might end up not
>> storing a sample for the very first isochronous USB packet of a frame
>> because of this new check.  Which means that the first->host_time used
>> as a starting point for the timestamp just has become inaccurate ?
> 
> In UVC 1.5 All the ISOC packets have the same dev_sof and dev_stc.
> So this check will avoid adding a whole frame into the timestamp
> circular buffer when running at more than 320 Hz (1/(0.1/32))
> 
> In UVC 1.1 all ISOC packets have the same dev_stc but different dev_sof.
> This check will avoid adding some of those packets into the circular
> buffer, but the accuracy will not be lost. We will use the data from
> the neighbour packets (even from previous frames) to recover the sof.
> 
> The biggest winner for this patch is UVC 1.1, which will have much
> more accurate timestamps, because the distance between the first and
> last will be bigger (as in uvc1.5)

I'm still trying to wrap my head about the whole concept of the hw
timestamps TBH.

Upon reading it a couple of times I now see that when exactly we
take samples is not important because the actual frame time in
STC units is stored in buf->pts and that is supposed to be our
starting point. And the rest is just used to calculate
a factor + offset.

At least that is what the big comment says but I'm confused by
the code which is supposed to implement:

 * SOF = (SOF2 - SOF1) / (STC2 - STC1) * PTS
 *     + (SOF1 * STC2 - SOF2 * STC1) / (STC2 - STC1)
 *
 * or
 *
 * SOF = ((SOF2 - SOF1) * PTS + SOF1 * STC2 - SOF2 * STC1) / (STC2 - STC1)   (1)

I think that the code tries to implement the second formula:

We've (with some checks removed):

        /* First step, PTS to SOF conversion. */
        delta_stc = buf->pts - (1UL << 31);
        x1 = first->dev_stc - delta_stc;
        x2 = last->dev_stc - delta_stc;

        y1 = (first->dev_sof + 2048) << 16;
        y2 = (last->dev_sof + 2048) << 16;
        if (y2 < y1)
                y2 += 2048 << 16;

        y = (u64)(y2 - y1) * (1ULL << 31) + (u64)y1 * (u64)x2
          - (u64)y2 * (u64)x1;
        y = div_u64(y, x2 - x1);

        sof = y;

Simplifying this by removing all the range-shifting
and using sof1/sof2 instead of y1/y2 like in the comment
we end up with:

        x1 = first->dev_stc - buf->pts;
        x2 = last->dev_stc - buf->pts;

	sof1 = first->dev_sof;
	sof2 = last->dev_sof

	sof = ((sof2 - sof1) + sof1 * x2 - sof2 * x1) / (x2 - x1)

Now substitute stc1/stc2 for first->dev_stc / last->dev_stc
and just pts for buf->pts and expand x1 + x2 we get:

	sof = ((sof2 - sof1) + sof1 * (stc2 - pts) - sof2 * (stc1 - pts)) /
	      ((stc2 - pts) - (stc1 - pts))

We can simplify the divisor here by getting rid of the pts bit
since the 2 "- pts" parts negate each other:

	sof = ((sof2 - sof1) + sof1 * (stc2 - pts) - sof2 * (stc1 - pts)) /
	      (stc2 - stc1)

Now lets get rid of the () from expanding x1 / x2:

	sof = ((sof2 - sof1) + sof1 * stc2 - sof1 * pts - sof2 * stc1 + sof2 * pts)) /
	      (stc2 - stc1)

Shuffle bringing " * pts" parts to the front:

	sof = (sof2 * pts - sof1 * pts + (sof2 - sof1) + sof1 * stc2 - sof2 * stc1)) /
	      (stc2 - stc1)

Simplify:

	sof = ((sof2 - sof1) * pts + (sof2 - sof1) + sof1 * stc2 - sof2 * stc1) /
	      (stc2 - stc1)

Looks a lot like the comment except there is a + (sof2 - sof1) too much
in there ?

And some of the range shifting also feels wrong. As long as we're only
subtracting the range shifting is fine. But as soon as we start multiplying
variables in different shifted ranges the end result actually changes.

Especially weird here is that we range-shift by (1UL << 31) for calculating
delta_stc and then *multiply* (y2 - y1) by (1ULL << 31) I guess this is
to compensate for the (1ULL << 31) component of x1/x2 but the first->dev_stc
and pts parts of x1 where never multiplied by (1ULL << 31) so these
are still in their original *scale*. Either we should multiply all
parts to go to some other fixed scale and the sof value are both range-shifted
by 2048 as well as multiplied by 65536, which also seems wrong to me as
soon as we do sof1 * stc2 or sof2 * stc1

All in all this all feels like there are some issues lurking here and it
does not seem to match the comment at the top.

Regards,

Hans




