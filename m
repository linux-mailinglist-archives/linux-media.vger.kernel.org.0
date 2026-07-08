Return-Path: <linux-media+bounces-66969-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SAIlC34tTmqnEgIAu9opvQ
	(envelope-from <linux-media+bounces-66969-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 12:59:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B0472497C
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 12:59:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=iQVX82Vt;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66969-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66969-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 61EAF300BC78
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 10:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB7AE42B332;
	Wed,  8 Jul 2026 10:58:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A94B42CAE2
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 10:57:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508275; cv=none; b=eDrn5KjKaUh03vC5B2hP9aQQAYGQtLMkfzn8/vuzw3dc8itopX+PNehZUDki9NZ/TrTuFIkSuAgn8n3vwatrpr3SVbJjvNk3jGKD8LTxR1cINgfgrEvWpif5unt/jSvJ7/bHYjaUEDSNImww8f+Drl/5Y4oNn56xqwT1Qdd7BWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508275; c=relaxed/simple;
	bh=Xrk4cldUp40oD1vyTM24zti6w0HHmRpbVxee+5RCD40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SC8yKUstuBkEnumPVZDNbiIgA9j6+9GlmgRNnyDLwzQ/P1Rram2De5Fl5wyUov0LmVQp5lQa9x4B8h2qOoc1v9jBcp92KBGDzUaWr72ji5xXLjiab84BLuG4gFTn+R8ydGz61oftAeSKQUomQ9DZUccbaogC3tKNOhNmnPUlTMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iQVX82Vt; arc=none smtp.client-ip=209.85.208.44
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso999354a12.3
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 03:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783508261; x=1784113061; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjDc0BnaWi67pot4LFN2OO3lfo1OPzksV28/c8Gqg3k=;
        b=iQVX82VtHl7Jt7NAiEj1Kh+SkkZAmgkn/muZy/c8ajYww3J9ICaaSaGM8q0xtS+Dby
         w1UDl5sNl8dEU1RH2Y8WV+XAqKRTkxV8VrY2CsTZkSvEdmiXDOlo2Sr4VDM3toAg5WLj
         nqyzeAUbgPnFEy9V2AN7ROoglr4ndrYmQjXO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783508261; x=1784113061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjDc0BnaWi67pot4LFN2OO3lfo1OPzksV28/c8Gqg3k=;
        b=JPql7vyvgoiWh4I/0t906ykYPblp4+u5TnEBzXU5r0MXMT2GZ4KSptBo/2LobSTXnX
         12P9ESzAPqU167XbaQT0dYqZtTo2nknjY+e1gpTb1m+USDrQXpA0TzKwHo5PUS1YXRAs
         uWUDBVxuOZNWN0HBdH3OeggGNMbXOta9jzlf+f9oKB8DQb0YO1ftHVsG/EQ+GNN7KHE+
         PmEcg/Q4BHfxAbs2DQbj2PYkC7FVu3xLoownm4pABF1n/2OUPLpYyz9ygQqRUFN6Ix52
         mZ/Ush+jWf2aDDgCXX9f9bXtIrB24OoOh1bCwwwFcQXFrf/Trn33EIVvsZSlm46VKwGH
         eGmw==
X-Forwarded-Encrypted: i=1; AHgh+RofJj25AAjGVwAmXWyWgooNcuFjXz5nq3ozXqZ3kueEqRFsAWYFNKyV52ZWwdEEDik5w9lrSVwMucVabg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyJoiP2Kvy7AHmU1W0bRNkbWWdD7H+mQ4cngezUeq1NEVCeHod
	5K4otMQcYFTqhcujRuIuw7EBCHF34nyKQJ3tXMtzKQGEw96I7roOuhZDIvCZQOO+cz3oJEg6WxZ
	R2iTqCQ==
X-Gm-Gg: AfdE7ckyNsUBUkPuUZlydA+2pfCOVVbmfh6lZnbyyPU/zDnyNzNMG2570Mf41woo0wy
	p5q2gTl0PxRUQaLuV0mR07xymF26gRfJzxEjEmrIkvxMzafoUvg+nmDc6pcYhlFKY2CPwNzby4R
	hSgoeX00B20pIbkNhGxuP9j4u2tlz6S+leZ3rf+gY9DDV1Jl4tVHXqHkhFcbvW0r9hTIe1iqX8g
	DDBRKktTp0W0oqOQbp8m6pPJpDwNyCNs1pMCYXti3x/I+uzPiMHcGllLrngcccTj7CH3jOnWKIW
	eay03gRol9XSZ3BQSHfSDABQeO+CzK8YIbCWjwU4n9kwxJsQGI19fM6awD4y896AI6JLcOddrbP
	0tZj48mfEEiTc2i9iJiCbd4yxSy/h7txJ6Lb5niWmNu00pZjvDp4kM/jan4NxK4TklH9pp9B7+w
	YmdwhAdxRj5T3Vd8oPywBpVGWRKX/c9zkkNJDZnyOIHchis6l4qA==
X-Received: by 2002:a17:906:138e:b0:c12:4ddd:ade1 with SMTP id a640c23a62f3a-c15ce013f86mr73978766b.4.1783508261113;
        Wed, 08 Jul 2026 03:57:41 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d76e9dbfsm41667566b.57.2026.07.08.03.57.39
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:57:39 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1268d56234so69549466b.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 03:57:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro1bcW6OX/4yppUz3vp1bziRfhBajUVtjUliToddRNDF/Xzw8wrerBJv7+A0pZ6hRSEszJvpw95tqZTvQ==@vger.kernel.org
X-Received: by 2002:a17:907:1c06:b0:c15:bad1:f41f with SMTP id
 a640c23a62f3a-c15ce1cd0e0mr97023366b.53.1783508258464; Wed, 08 Jul 2026
 03:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-uvc-racemeta-v2-0-10e91d2afba0@chromium.org>
 <20260629-uvc-racemeta-v2-1-10e91d2afba0@chromium.org> <a0e4d412-f0bf-4415-9e4b-2c6347bf8c69@kernel.org>
 <CANiDSCtv_ZmTWUzbuxuEy0JmLmFs2Wqj31O3neGZ4ee=p065-g@mail.gmail.com>
 <5327bf8c-270e-4650-8f44-6026dce36457@kernel.org> <CANiDSCskW6qhuGsDj2JN9UqAobAzqxEn7bKxVLZKEpEi0P9bWA@mail.gmail.com>
 <15b919c9-158a-45ca-8566-bf20447d397c@kernel.org>
In-Reply-To: <15b919c9-158a-45ca-8566-bf20447d397c@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 8 Jul 2026 12:57:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCuO5aEApqHxy6uqZheza7hgdOkH38sY5YhO_xAxSYAJbg@mail.gmail.com>
X-Gm-Features: AVVi8CeOlli0KBxwF8aPq2M2VgI50A3F6AX3eKfd8uoNM9xAjepwey66fA_9Xys
Message-ID: <CANiDSCuO5aEApqHxy6uqZheza7hgdOkH38sY5YhO_xAxSYAJbg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Fix race condition for meta
 buffer list
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66969-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:guennadi.liakhovetski@intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:from_mime,chromium.org:email,chromium.org:dkim,vger.kernel.org:from_smtp,mail.gmail.com:mid,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,quotefancy.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29B0472497C

Hi Hans

On Wed, 1 Jul 2026 at 17:30, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi Ricardo,
>
> On 30-Jun-26 16:10, Ricardo Ribalda wrote:
> > Hi Hans,
> >
> > On Tue, 30 Jun 2026 at 15:21, Hans de Goede <hansg@kernel.org> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 30-Jun-26 12:17, Ricardo Ribalda wrote:
> >>> Hi Hans,
> >>>
> >>> Thanks for the prompt reply.
> >>>
> >>> On Tue, 30 Jun 2026 at 11:47, Hans de Goede <hansg@kernel.org> wrote:
> >>>>
> >>>> Hi Ricardo,
> >>>>
> >>>> On 29-Jun-26 19:31, Ricardo Ribalda wrote:
> >>>>> queue->irqueue contains a list of the buffers owned by the driver. The
> >>>>> list is protected by queue->irqlock. uvc_queue_get_current_buffer()
> >>>>> returns a pointer to the current buffer in that list, but does not
> >>>>> remove the buffer from it. This can lead to race conditions.
> >>>>>
> >>>>> Inspecting the code, it seems that the candidate for such race is
> >>>>> uvc_queue_return_buffers(). For the capture queue, that function is
> >>>>> called with the device streamoff, so no race can occur. On the other
> >>>>> hand, the metadata queue, could trigger a race condition, because
> >>>>> stop_streaming can be called with the device in any streaming state.
> >>>>>
> >>>>> We can solve this issue introducing a flag, stream->meta.in_flight,
> >>>>> protected with a spinlock. When there is a buffer in flight that can
> >>>>> write into metadata the flag is raised, notifying the stop streaming
> >>>>> that it needs to wait.
> >>>>>
> >>>>> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>>> Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
> >>>>> Cc: stable@vger.kernel.org
> >>>>> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> >>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>
> >>>> First of all thank you for looking into fixing this.
> >>>>
> >>>> I'm sorry, but this feels more like a band-aid then a proper fix.
> >>>>
> >>>> How about adding a started bool to struct uvc_streaming which gets
> >>>> set to 1 by uvc_video_start_streaming() and 0 by uvc_video_stop_streaming().
> >>>>
> >>>> And then call uvc_video_stop_streaming() from either
> >>>> uvc_stop_streaming_video() or uvc_stop_streaming_meta()
> >>>> depending on which one gets called first ?
> >>>>
> >>>> With a mutex protecting the started bool and being held
> >>>> over calling uvc_video_stop_streaming() ?
> >>>>
> >>>> So stop the actual hw streaming when either of the
> >>>> 2 possible /dev/video0 nodes gets its vb2_ops.stop_streaming
> >>>> callback called?
> >>>>
> >>>> And to this before draining the buffer queue.
> >>>>
> >>>> That seems cleaner then this approach?
> >>>
> >>> Assuming /dev/video0 is the video node and /dev/video1 is the meta device.
> >>>
> >>> Currently, we support something like:
> >>>
> >>> 1) yavta -c /dev/video0 &
> >>> 2) yavta --capture=2 /dev/video1
> >>> 3) yavta --capture=2 /dev/video1
> >>> 4) kill %1
> >>>
> >>>
> >>> If I understood correctly, your proposal would cause the camera to
> >>> stop streaming when step 2 completes.
> >>
> >> Yes. But this very much feels like a case of:
> >>
> >> https://quotefancy.com/media/wallpaper/1600x900/5523002-Henny-Youngman-Quote-The-patient-says-Doctor-it-hurts-when-I-do.jpg
> >
> > We have a similar joke in Spanish:
> > Doctor, doctor, it hurts here, here, here, here, here. What do I have?
> > A broken finger :P
> >
> >>
> >>> I think this risks breaking use cases.
> >>
> >> That would have to be some rather convoluted use-case.
> >
> > I believe we have a similar scheme to test the metadata node in
> > ChromeOS... but we can change that.
>
> That seems unlikely? Either I would expect some app/lib/dameon to
> do a quick test stream for a few frames at init time to determine metadata
> support, in which case I would expect streaming on both queues to get
> stopped after the quick test.
>
> Or testing is delayed till the first real start-streaming moment in which
> case it makes no sense to stop + restart the metadata queue. What I guess
> may happen is stopping the metadata queue when it does not generate any
> data for a few frames, assuming there simply is no metadata support.
>
> Hmm, that might actually be a troublesome case.
>
> > My worry is the outside apps that we do not control.
>
> Ack, thinking more about this, this might be more likely then
> I assumed in the non metadata available case, see above.
>
> So I'm no longer really convinced of my own proposal.
>
> >> IMHO the simplicity of fixing the race you're trying to fix is
> >> worth the userspace regression risk (which I deem low).
> >>
> >> Worst case we revert the fix and go back to the drawing board.
> >
> > Are you concerned of this asymmetric behaviour, or do you think that it is fine?
> >
> > open /dev/video0 (streaming starts)
> > open /dev/video1
> > close /dev/video1 (streaming stops)
> > open /dev/video1 (streaming still off)
> >
> >
> > vs
> >
> > open /dev/video0 (streaming starts)
> > open /dev/video1
> > close /dev/video0 (streaming stops)
> > open /dev/video0 (streaming resumes)
>
> That second one actually is broken already, we don't flush
> the metadata queue on streaming stop on the regular queue, so
> it will possibly contain a half-filled metadata buffer which
> we then continue to append to with fresh metadata. So any
> multi-packet metadata will get corrupted for the first frame
> in the second stream start in that case.

Luckily for us, it is currently "kind of" working.

uvc_stop_streaming_video() -> uvc_video_stop_streaming() ->
uvc_video_stop_transfer() -> usb_poison_urb()

This usually (though I do not think always) forces an -ENOENT at the
URBs callback:

uvc_video_complete() -> uvc_queue_cancel(qmeta) -> uvc_queue_return_buffers()

I will send a patch to explicitly call uvc_queue_return_buffers(qmeta)
in uvc_stop_streaming_video() so we don't have to rely on this
implicit behavior.

But I have a question: Do we *really* need to call
__uvc_queue_return_buffers() from uvc_queue_cancel() if it is properly
handled in uvc_stop_streaming_video()?

A side effect of relying on the URB cancellation is that we end up
performing one flush per URB, which is not really needed. For example:

41 (1) [-] none 176 5500 B 15166.417603 15166.449738 16.665 fps ts mono/SoE
42 (2) [-] none 177 5478 B 15166.477640 15166.509783 16.656 fps ts mono/SoE
43 (3) [-] none 178 5522 B 15166.537639 15166.569758 16.667 fps ts mono/SoE
44 (4) [E] none 0 0 B 0.000000 15166.599067 -0.000 fps ts mono/SoE
45 (5) [E] none 0 0 B 0.000000 15166.599115 0.000 fps ts mono/SoE
46 (6) [E] none 0 0 B 0.000000 15166.599125 0.000 fps ts mono/SoE
47 (7) [E] none 0 0 B 0.000000 15166.599133 0.000 fps ts mono/SoE
48 (0) [E] none 0 0 B 0.000000 15166.599141 0.000 fps ts mono/SoE
49 (1) [E] none 0 0 B 0.000000 15166.599148 0.000 fps ts mono/SoE
50 (2) [E] none 0 0 B 0.000000 15166.599157 0.000 fps ts mono/SoE
51 (3) [E] none 0 0 B 0.000000 15166.599167 0.000 fps ts mono/SoE
52 (4) [E] none 0 0 B 0.000000 15166.599177 0.000 fps ts mono/SoE
53 (5) [E] none 0 0 B 0.000000 15166.599187 0.000 fps ts mono/SoE
54 (6) [E] none 0 0 B 0.000000 15166.599197 0.000 fps ts mono/SoE
55 (7) [E] none 0 0 B 0.000000 15166.599224 0.000 fps ts mono/SoE
56 (0) [E] none 0 0 B 0.000000 15166.599234 0.000 fps ts mono/SoE
57 (1) [E] none 0 0 B 0.000000 15166.599243 0.000 fps ts mono/SoE
58 (2) [E] none 0 0 B 0.000000 15166.599253 0.000 fps ts mono/SoE
59 (3) [E] none 0 0 B 0.000000 15166.599261 0.000 fps ts mono/SoE
60 (4) [E] none 0 0 B 0.000000 15166.599269 0.000 fps ts mono/SoE
61 (5) [E] none 0 0 B 0.000000 15166.599278 0.000 fps ts mono/SoE
62 (6) [E] none 0 0 B 0.000000 15166.599462 0.000 fps ts mono/SoE
63 (7) [E] none 0 0 B 0.000000 15166.599485 0.000 fps ts mono/SoE
64 (0) [E] none 0 0 B 0.000000 15166.599497 0.000 fps ts mono/SoE
65 (1) [E] none 0 0 B 0.000000 15166.599510 0.000 fps ts mono/SoE
66 (2) [E] none 0 0 B 0.000000 15166.599521 0.000 fps ts mono/SoE
67 (3) [E] none 0 0 B 0.000000 15166.599528 0.000 fps ts mono/SoE
68 (4) [E] none 0 0 B 0.000000 15166.599538 0.000 fps ts mono/SoE
69 (5) [E] none 0 0 B 0.000000 15166.599548 0.000 fps ts mono/SoE
70 (6) [E] none 0 0 B 0.000000 15166.599557 0.000 fps ts mono/SoE
71 (7) [E] none 0 0 B 0.000000 15166.599567 0.000 fps ts mono/SoE
72 (0) [E] none 0 0 B 0.000000 15166.599576 0.000 fps ts mono/SoE

>
> In hindsight having the metadata queue be a fully independent
> queue without clearly defining how start/stop on both queues
> works and enforcing the defined behavior at the driver level
> was a mistake.
>
> I'm starting to think that ideally we would simply flush both
> queues on the stop on the regular node and not have a stop
> queue-op on the metadata queue at all, but that is not possible
> I'm afraid.
>
> So I think we do need something like this series +
> flush metadata-queue on regular queue stop.
>
> I'll try to make some time to review this series as is, since
> although the waiting solution still feels ugly it may be the
> best we can do.
>
> Regards,
>
> Hans
>
>
>
>
>
> >
> >
> >>
> >>> As I see it, the issue is that the camera's live capture cycle is
> >>> controlled solely by video0. We need some kind of synchronization
> >>> mechanism with video1 if we do not want to change the behaviour and
> >>> risk breaking apps.
> >>
> >> IMHO for a device with multiple /dev/video# nodes it makes sense
> >> to wait with actually starting streaming/DMA-engines until all
> >> enabled queues are started and stop when the first queue is stopped.
> >>
> >> The problem with uvcvideo is that we do not know if the metadata
> >> queue is going to get used at all. In hindsight we should maybe
> >> have had some way for userspace to explictly enable/disable metadata
> >> support.
> >>
> >> So we start as soon as the main video node is opened, still I think
> >> that stopping as soon as one of the queues is stopped makes sense.
> >>
> >> Laurent, do you have any input here?
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>
> >>>> p.s.
> >>>>
> >>>> 1. It is tempting to also apply the same approach to
> >>>> vb2_ops.start_streaming, but allowing the meta queue to be
> >>>> the one to start streaming will likely cause issues. E.g.
> >>>> the streaming code assumes having a meta-queue active is
> >>>> optional, but not the other way around.
> >>>>
> >>>> TL;DR: vb2_ops.start_streaming should stay as is.
> >>>>
> >>>> 2. While looking into this I noticed that struct uvc_streaming
> >>>> already has an active member, but unless I'm missing something
> >>>> that ever only gets initialized to 0. So I think that can be
> >>>> dropped. (If you re-use this please change it to a bool, no
> >>>> need to have it atomic while protected by a mutex).
> >>>
> >>> I will send a patch to fix this. Thanks for noticing :)
> >>>
> >>>>
> >>>>
> >>>>
> >>>>> ---
> >>>>>  drivers/media/usb/uvc/uvc_queue.c | 14 ++++++++++++++
> >>>>>  drivers/media/usb/uvc/uvc_video.c | 30 +++++++++++++++++++++++++++++-
> >>>>>  drivers/media/usb/uvc/uvcvideo.h  |  2 ++
> >>>>>  3 files changed, 45 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> >>>>> index 3c002c8f442f..af9dbfcf6f53 100644
> >>>>> --- a/drivers/media/usb/uvc/uvc_queue.c
> >>>>> +++ b/drivers/media/usb/uvc/uvc_queue.c
> >>>>> @@ -209,10 +209,24 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
> >>>>>  static void uvc_stop_streaming_meta(struct vb2_queue *vq)
> >>>>>  {
> >>>>>       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> >>>>> +     struct uvc_streaming *stream = queue->stream;
> >>>>>
> >>>>>       lockdep_assert_irqs_enabled();
> >>>>>
> >>>>> +     spin_lock_irq(&stream->meta.irqlock);
> >>>>> +     while (stream->meta.in_flight) {
> >>>>> +             spin_unlock_irq(&stream->meta.irqlock);
> >>>>> +             schedule();
> >>>>> +             spin_lock_irq(&stream->meta.irqlock);
> >>>>> +     }
> >>>>> +     stream->meta.in_flight = true;
> >>>>> +     spin_unlock_irq(&stream->meta.irqlock);
> >>>>> +
> >>>>>       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> >>>>> +
> >>>>> +     scoped_guard(spinlock_irq, &stream->meta.irqlock) {
> >>>>> +             stream->meta.in_flight = false;
> >>>>> +     }
> >>>>>  }
> >>>>>
> >>>>>  static const struct vb2_ops uvc_queue_qops = {
> >>>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> >>>>> index fc3536a4399f..f6b55b3a3308 100644
> >>>>> --- a/drivers/media/usb/uvc/uvc_video.c
> >>>>> +++ b/drivers/media/usb/uvc/uvc_video.c
> >>>>> @@ -1732,6 +1732,26 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> >>>>>       urb->transfer_buffer_length = stream->urb_size - len;
> >>>>>  }
> >>>>>
> >>>>> +static struct uvc_buffer *
> >>>>> +uvc_video_get_current_meta_buffer(struct uvc_streaming *stream)
> >>>>> +{
> >>>>> +     struct uvc_video_queue *queue = &stream->meta.queue;
> >>>>> +     struct uvc_buffer *buf;
> >>>>> +
> >>>>> +     buf = uvc_queue_get_current_buffer(queue);
> >>>>> +     if (!buf)
> >>>>> +             return NULL;
> >>>>> +
> >>>>> +     guard(spinlock_irqsave)(&stream->meta.irqlock);
> >>>>> +
> >>>>> +     if (stream->meta.in_flight)
> >>>>> +             return NULL;
> >>>>> +
> >>>>> +     stream->meta.in_flight = true;
> >>>>> +
> >>>>> +     return buf;
> >>>>> +}
> >>>>> +
> >>>>>  static void uvc_video_complete(struct urb *urb)
> >>>>>  {
> >>>>>       struct uvc_urb *uvc_urb = urb->context;
> >>>>> @@ -1767,7 +1787,7 @@ static void uvc_video_complete(struct urb *urb)
> >>>>>       buf = uvc_queue_get_current_buffer(queue);
> >>>>>
> >>>>>       if (vb2_qmeta)
> >>>>> -             buf_meta = uvc_queue_get_current_buffer(qmeta);
> >>>>> +             buf_meta = uvc_video_get_current_meta_buffer(stream);
> >>>>>
> >>>>>       /* Re-initialise the URB async work. */
> >>>>>       uvc_urb->async_operations = 0;
> >>>>> @@ -1778,6 +1798,12 @@ static void uvc_video_complete(struct urb *urb)
> >>>>>        */
> >>>>>       stream->decode(uvc_urb, buf, buf_meta);
> >>>>>
> >>>>> +     if (buf_meta) {
> >>>>> +             scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
> >>>>> +                     stream->meta.in_flight = false;
> >>>>> +             }
> >>>>> +     }
> >>>>> +
> >>>>>       /* If no async work is needed, resubmit the URB immediately. */
> >>>>>       if (!uvc_urb->async_operations) {
> >>>>>               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> >>>>> @@ -2330,6 +2356,8 @@ int uvc_video_init(struct uvc_streaming *stream)
> >>>>>       for_each_uvc_urb(uvc_urb, stream)
> >>>>>               INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
> >>>>>
> >>>>> +     spin_lock_init(&stream->meta.irqlock);
> >>>>> +
> >>>>>       return 0;
> >>>>>  }
> >>>>>
> >>>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> >>>>> index b6bcee4a222f..6f1a3381d392 100644
> >>>>> --- a/drivers/media/usb/uvc/uvcvideo.h
> >>>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> >>>>> @@ -484,6 +484,8 @@ struct uvc_streaming {
> >>>>>               struct uvc_video_queue queue;
> >>>>>               u32 format;
> >>>>>               u32 buffersize;
> >>>>> +             bool in_flight;
> >>>>> +             spinlock_t irqlock; /* Protects in_flight. */
> >>>>>       } meta;
> >>>>>
> >>>>>       /* Context data used by the bulk completion handler. */
> >>>>>
> >>>>
> >>>
> >>>
> >>
> >
> >
>


-- 
Ricardo Ribalda

