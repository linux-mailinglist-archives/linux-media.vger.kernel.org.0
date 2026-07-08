Return-Path: <linux-media+bounces-67032-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7YM4CmhvTmq0MgIAu9opvQ
	(envelope-from <linux-media+bounces-67032-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:40:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FB1728260
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:40:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=ZnXhBtyq;
	dmarc=pass (policy=none) header.from=chromium.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67032-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67032-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B126C3099FEB
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6963C3B27FA;
	Wed,  8 Jul 2026 15:18:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C054833E360
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:18:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523896; cv=none; b=mDiWwAWmDpPfskFBvtNRwqVckgEr7T8nPbvZdX9uQUu7th+LBDN3xR8uIU7wevIl5kY0GGrRyBbjrikGG1RsB7YOhoyoCwvA7eXcbJqkL5cTh1dgOByvbf+IbENNFydUU9flsIU/WnJ963WmaDxhUDW/rCXIhj4Gca3Ug89Q+C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523896; c=relaxed/simple;
	bh=H8v/NRHqdZ7121n28dcb9g2vGaJ/GORo4Z0EN4wChFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PM7VaNGp3PcDJaF0/w5nnGM7byq/HotJ94sF205zYsJ0pECSyCSCKY32nbbdjDrRcvoODMNthxKhIepbQTBss2IYhkG4ybpILrmCCzZdzPmsKe1pf+9fdXBwIXyzDeOOD7+7hPe269yarL+2ePA6vZmEXWxNnk3ljPDFfT6gJ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZnXhBtyq; arc=none smtp.client-ip=209.85.218.48
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15cf78d1a2so71306466b.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783523893; x=1784128693; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdrMFy/jEt5jrkgpI35n0yi23kbpoKeT5n3yCmjxUnU=;
        b=ZnXhBtyqAGRAlXBTCytgqU1uEdWAhaCgMXwK+3XKNeUMKMGP+5D89+n6UC1otG/0al
         U5RbfSV0lNbL77ORQfifRx+RaXBH6+Lsrn1MDV0ruhyQNZ1j02uqpaUM6Ic8GSIl7y29
         jd1Wj4m4k3+uA8qioAKRlNwkExs/y2VCLi8Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523893; x=1784128693;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tdrMFy/jEt5jrkgpI35n0yi23kbpoKeT5n3yCmjxUnU=;
        b=K1wxuMZU7cKlVMVocuy4RhSRcD83qU5fgl4rseOPqZTuWvBDoRoKHihbu8TNE2T46T
         9BzR73hiRumFiuqFTeCdNqRV0AmQjkccvMK+Aiv24NQ+ZeatEiKjMtApN/pTgNhOsqYx
         FJoOSIVAx/hp0tW5rcL5oV8E341k0Y334bnEOR1OJqHjcSoT7gw1XnWIMjSjeq/hCedf
         k+RSAILeyc72mVtDbR6LVrjsVwXd0w4Nenehx7c6dbPo2C603ZJs5pBnPbmVNvjlOxrd
         S8wp+WX25/02hsaZKVPKXH4qrbomFBO+Kxy3AOs9jn2SWEt0LafVf49M653mp3r/Sbrz
         n6XQ==
X-Forwarded-Encrypted: i=1; AHgh+Rorq9iydchfq00gPv4W+nXlEYG71vbJdRYmmaKUxZbuVAJ4dth7EiHlgYcITCJiS+otAy4IjdueJcZZsw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTbwy1GyC1fyYIFBm2oHR/tt0nXeVwTPCj+GcY9atDm6C4MnvT
	WrpSpLSh3yEBisIHNZLWxFfbkoy5iQWaOE9KirGrvLrl4fCV+ksoGlA4jtLDN/l1K4wgnFX5FiG
	fzf1oUQ==
X-Gm-Gg: AfdE7cmhImeW4/2RQr5F96+po9t/AZWfQfDzonPjV6O6ngOLh03QrZ48RnkPERE6igG
	HNK7b7mJncW5q69/DXY+d30WN/oBTRbjtvfZvFAdIUKz5mylzdeTp9+GQymVIRVc+GKKQXJRayC
	GHBKOExPc5AunZZlIbJQqO2THshWEOPyLEVCp+07KInBV0nKy04WUDh+fJhpXZfdhqfLodSAt5V
	1Jp+rmit5Zg9gHHqxWUh3NaIHL0Fur5FIioT9MuzJcHSamdMetC1vkSa+Jyon/QoTiYp2sDu8ue
	AehO7zkA1fT1ZOtEFaL2kJoXvFBWHRSbVDJn1g0k71Qv2nZzQ+5SBADe64QWruySRBui6m61EEF
	VLLhRcvAa8FEE0RYj/XbqOJ09AAh5eTaGgdmiiYd9xMEed+niTyJVeIm4lY3OVrjUMMWI//Bko5
	ORFNvBLgrkcmBKUk27rTgAoE3OJTbGnw8AcWlGlTB/q17Dt9YJeg==
X-Received: by 2002:a17:907:c20d:b0:c12:b226:27 with SMTP id a640c23a62f3a-c15cde8c482mr164560166b.11.1783523892892;
        Wed, 08 Jul 2026 08:18:12 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ada057dasm352709566b.50.2026.07.08.08.18.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:18:11 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15bf399d3bso97360966b.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:18:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq8WeABC2FhZY0dB83gMXT4xZMLwooXhRFDKD52EF9XhAm6wDmSW1o47Lr4pxQh29d1V7LznqV8SjV8Jw==@vger.kernel.org
X-Received: by 2002:a17:907:e153:b0:c12:61c5:c141 with SMTP id
 a640c23a62f3a-c15ce1180demr100718366b.53.1783523889597; Wed, 08 Jul 2026
 08:18:09 -0700 (PDT)
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
 <15b919c9-158a-45ca-8566-bf20447d397c@kernel.org> <CANiDSCuO5aEApqHxy6uqZheza7hgdOkH38sY5YhO_xAxSYAJbg@mail.gmail.com>
In-Reply-To: <CANiDSCuO5aEApqHxy6uqZheza7hgdOkH38sY5YhO_xAxSYAJbg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 8 Jul 2026 17:17:56 +0200
X-Gmail-Original-Message-ID: <CANiDSCsO9_VgQdb4_=cayf_jKdy6CCf=+VmJyBWrD0wwXGeXYA@mail.gmail.com>
X-Gm-Features: AVVi8CeS1jux9xKn1HjEeIbXjePrhV-PC1dyZBo-cSnSuXsrQSNSHp3Zf5PQ3JI
Message-ID: <CANiDSCsO9_VgQdb4_=cayf_jKdy6CCf=+VmJyBWrD0wwXGeXYA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-67032-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:from_mime,chromium.org:email,chromium.org:dkim,quotefancy.com:url,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49FB1728260

Hi Ricardo :P

On Wed, 8 Jul 2026 at 12:57, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Hans
>
> On Wed, 1 Jul 2026 at 17:30, Hans de Goede <hansg@kernel.org> wrote:
> >
> > Hi Ricardo,
> >
> > On 30-Jun-26 16:10, Ricardo Ribalda wrote:
> > > Hi Hans,
> > >
> > > On Tue, 30 Jun 2026 at 15:21, Hans de Goede <hansg@kernel.org> wrote:
> > >>
> > >> Hi Ricardo,
> > >>
> > >> On 30-Jun-26 12:17, Ricardo Ribalda wrote:
> > >>> Hi Hans,
> > >>>
> > >>> Thanks for the prompt reply.
> > >>>
> > >>> On Tue, 30 Jun 2026 at 11:47, Hans de Goede <hansg@kernel.org> wrote:
> > >>>>
> > >>>> Hi Ricardo,
> > >>>>
> > >>>> On 29-Jun-26 19:31, Ricardo Ribalda wrote:
> > >>>>> queue->irqueue contains a list of the buffers owned by the driver. The
> > >>>>> list is protected by queue->irqlock. uvc_queue_get_current_buffer()
> > >>>>> returns a pointer to the current buffer in that list, but does not
> > >>>>> remove the buffer from it. This can lead to race conditions.
> > >>>>>
> > >>>>> Inspecting the code, it seems that the candidate for such race is
> > >>>>> uvc_queue_return_buffers(). For the capture queue, that function is
> > >>>>> called with the device streamoff, so no race can occur. On the other
> > >>>>> hand, the metadata queue, could trigger a race condition, because
> > >>>>> stop_streaming can be called with the device in any streaming state.
> > >>>>>
> > >>>>> We can solve this issue introducing a flag, stream->meta.in_flight,
> > >>>>> protected with a spinlock. When there is a buffer in flight that can
> > >>>>> write into metadata the flag is raised, notifying the stop streaming
> > >>>>> that it needs to wait.
> > >>>>>
> > >>>>> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >>>>> Closes: https://lore.kernel.org/linux-media/20250630141707.GG20333@pendragon.ideasonboard.com/
> > >>>>> Cc: stable@vger.kernel.org
> > >>>>> Fixes: 088ead255245 ("media: uvcvideo: Add a metadata device node")
> > >>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>>>
> > >>>> First of all thank you for looking into fixing this.
> > >>>>
> > >>>> I'm sorry, but this feels more like a band-aid then a proper fix.
> > >>>>
> > >>>> How about adding a started bool to struct uvc_streaming which gets
> > >>>> set to 1 by uvc_video_start_streaming() and 0 by uvc_video_stop_streaming().
> > >>>>
> > >>>> And then call uvc_video_stop_streaming() from either
> > >>>> uvc_stop_streaming_video() or uvc_stop_streaming_meta()
> > >>>> depending on which one gets called first ?
> > >>>>
> > >>>> With a mutex protecting the started bool and being held
> > >>>> over calling uvc_video_stop_streaming() ?
> > >>>>
> > >>>> So stop the actual hw streaming when either of the
> > >>>> 2 possible /dev/video0 nodes gets its vb2_ops.stop_streaming
> > >>>> callback called?
> > >>>>
> > >>>> And to this before draining the buffer queue.
> > >>>>
> > >>>> That seems cleaner then this approach?
> > >>>
> > >>> Assuming /dev/video0 is the video node and /dev/video1 is the meta device.
> > >>>
> > >>> Currently, we support something like:
> > >>>
> > >>> 1) yavta -c /dev/video0 &
> > >>> 2) yavta --capture=2 /dev/video1
> > >>> 3) yavta --capture=2 /dev/video1
> > >>> 4) kill %1
> > >>>
> > >>>
> > >>> If I understood correctly, your proposal would cause the camera to
> > >>> stop streaming when step 2 completes.
> > >>
> > >> Yes. But this very much feels like a case of:
> > >>
> > >> https://quotefancy.com/media/wallpaper/1600x900/5523002-Henny-Youngman-Quote-The-patient-says-Doctor-it-hurts-when-I-do.jpg
> > >
> > > We have a similar joke in Spanish:
> > > Doctor, doctor, it hurts here, here, here, here, here. What do I have?
> > > A broken finger :P
> > >
> > >>
> > >>> I think this risks breaking use cases.
> > >>
> > >> That would have to be some rather convoluted use-case.
> > >
> > > I believe we have a similar scheme to test the metadata node in
> > > ChromeOS... but we can change that.
> >
> > That seems unlikely? Either I would expect some app/lib/dameon to
> > do a quick test stream for a few frames at init time to determine metadata
> > support, in which case I would expect streaming on both queues to get
> > stopped after the quick test.
> >
> > Or testing is delayed till the first real start-streaming moment in which
> > case it makes no sense to stop + restart the metadata queue. What I guess
> > may happen is stopping the metadata queue when it does not generate any
> > data for a few frames, assuming there simply is no metadata support.
> >
> > Hmm, that might actually be a troublesome case.
> >
> > > My worry is the outside apps that we do not control.
> >
> > Ack, thinking more about this, this might be more likely then
> > I assumed in the non metadata available case, see above.
> >
> > So I'm no longer really convinced of my own proposal.
> >
> > >> IMHO the simplicity of fixing the race you're trying to fix is
> > >> worth the userspace regression risk (which I deem low).
> > >>
> > >> Worst case we revert the fix and go back to the drawing board.
> > >
> > > Are you concerned of this asymmetric behaviour, or do you think that it is fine?
> > >
> > > open /dev/video0 (streaming starts)
> > > open /dev/video1
> > > close /dev/video1 (streaming stops)
> > > open /dev/video1 (streaming still off)
> > >
> > >
> > > vs
> > >
> > > open /dev/video0 (streaming starts)
> > > open /dev/video1
> > > close /dev/video0 (streaming stops)
> > > open /dev/video0 (streaming resumes)
> >
> > That second one actually is broken already, we don't flush
> > the metadata queue on streaming stop on the regular queue, so
> > it will possibly contain a half-filled metadata buffer which
> > we then continue to append to with fresh metadata. So any
> > multi-packet metadata will get corrupted for the first frame
> > in the second stream start in that case.
>
> Luckily for us, it is currently "kind of" working.
>
> uvc_stop_streaming_video() -> uvc_video_stop_streaming() ->
> uvc_video_stop_transfer() -> usb_poison_urb()
>
> This usually (though I do not think always) forces an -ENOENT at the
> URBs callback:
>
> uvc_video_complete() -> uvc_queue_cancel(qmeta) -> uvc_queue_return_buffers()
>
> I will send a patch to explicitly call uvc_queue_return_buffers(qmeta)
> in uvc_stop_streaming_video() so we don't have to rely on this
> implicit behavior.
>
> But I have a question: Do we *really* need to call
> __uvc_queue_return_buffers() from uvc_queue_cancel() if it is properly
> handled in uvc_stop_streaming_video()?

Yes we do. Otherwise if userspace is locked in dqbuf and a usb error
happens, userspace will be locked forever.
Could we probably add a flag or something to avoid the 5x
__uvc_queue_return_buffers(), probably... but worth it? Nahhh


>
> A side effect of relying on the URB cancellation is that we end up
> performing one flush per URB, which is not really needed. For example:
>
> 41 (1) [-] none 176 5500 B 15166.417603 15166.449738 16.665 fps ts mono/SoE
> 42 (2) [-] none 177 5478 B 15166.477640 15166.509783 16.656 fps ts mono/SoE
> 43 (3) [-] none 178 5522 B 15166.537639 15166.569758 16.667 fps ts mono/SoE
> 44 (4) [E] none 0 0 B 0.000000 15166.599067 -0.000 fps ts mono/SoE
> 45 (5) [E] none 0 0 B 0.000000 15166.599115 0.000 fps ts mono/SoE
> 46 (6) [E] none 0 0 B 0.000000 15166.599125 0.000 fps ts mono/SoE
> 47 (7) [E] none 0 0 B 0.000000 15166.599133 0.000 fps ts mono/SoE
> 48 (0) [E] none 0 0 B 0.000000 15166.599141 0.000 fps ts mono/SoE
> 49 (1) [E] none 0 0 B 0.000000 15166.599148 0.000 fps ts mono/SoE
> 50 (2) [E] none 0 0 B 0.000000 15166.599157 0.000 fps ts mono/SoE
> 51 (3) [E] none 0 0 B 0.000000 15166.599167 0.000 fps ts mono/SoE
> 52 (4) [E] none 0 0 B 0.000000 15166.599177 0.000 fps ts mono/SoE
> 53 (5) [E] none 0 0 B 0.000000 15166.599187 0.000 fps ts mono/SoE
> 54 (6) [E] none 0 0 B 0.000000 15166.599197 0.000 fps ts mono/SoE
> 55 (7) [E] none 0 0 B 0.000000 15166.599224 0.000 fps ts mono/SoE
> 56 (0) [E] none 0 0 B 0.000000 15166.599234 0.000 fps ts mono/SoE
> 57 (1) [E] none 0 0 B 0.000000 15166.599243 0.000 fps ts mono/SoE
> 58 (2) [E] none 0 0 B 0.000000 15166.599253 0.000 fps ts mono/SoE
> 59 (3) [E] none 0 0 B 0.000000 15166.599261 0.000 fps ts mono/SoE
> 60 (4) [E] none 0 0 B 0.000000 15166.599269 0.000 fps ts mono/SoE
> 61 (5) [E] none 0 0 B 0.000000 15166.599278 0.000 fps ts mono/SoE
> 62 (6) [E] none 0 0 B 0.000000 15166.599462 0.000 fps ts mono/SoE
> 63 (7) [E] none 0 0 B 0.000000 15166.599485 0.000 fps ts mono/SoE
> 64 (0) [E] none 0 0 B 0.000000 15166.599497 0.000 fps ts mono/SoE
> 65 (1) [E] none 0 0 B 0.000000 15166.599510 0.000 fps ts mono/SoE
> 66 (2) [E] none 0 0 B 0.000000 15166.599521 0.000 fps ts mono/SoE
> 67 (3) [E] none 0 0 B 0.000000 15166.599528 0.000 fps ts mono/SoE
> 68 (4) [E] none 0 0 B 0.000000 15166.599538 0.000 fps ts mono/SoE
> 69 (5) [E] none 0 0 B 0.000000 15166.599548 0.000 fps ts mono/SoE
> 70 (6) [E] none 0 0 B 0.000000 15166.599557 0.000 fps ts mono/SoE
> 71 (7) [E] none 0 0 B 0.000000 15166.599567 0.000 fps ts mono/SoE
> 72 (0) [E] none 0 0 B 0.000000 15166.599576 0.000 fps ts mono/SoE
>
> >
> > In hindsight having the metadata queue be a fully independent
> > queue without clearly defining how start/stop on both queues
> > works and enforcing the defined behavior at the driver level
> > was a mistake.
> >
> > I'm starting to think that ideally we would simply flush both
> > queues on the stop on the regular node and not have a stop
> > queue-op on the metadata queue at all, but that is not possible
> > I'm afraid.
> >
> > So I think we do need something like this series +
> > flush metadata-queue on regular queue stop.
> >
> > I'll try to make some time to review this series as is, since
> > although the waiting solution still feels ugly it may be the
> > best we can do.
> >
> > Regards,
> >
> > Hans
> >
> >
> >
> >
> >
> > >
> > >
> > >>
> > >>> As I see it, the issue is that the camera's live capture cycle is
> > >>> controlled solely by video0. We need some kind of synchronization
> > >>> mechanism with video1 if we do not want to change the behaviour and
> > >>> risk breaking apps.
> > >>
> > >> IMHO for a device with multiple /dev/video# nodes it makes sense
> > >> to wait with actually starting streaming/DMA-engines until all
> > >> enabled queues are started and stop when the first queue is stopped.
> > >>
> > >> The problem with uvcvideo is that we do not know if the metadata
> > >> queue is going to get used at all. In hindsight we should maybe
> > >> have had some way for userspace to explictly enable/disable metadata
> > >> support.
> > >>
> > >> So we start as soon as the main video node is opened, still I think
> > >> that stopping as soon as one of the queues is stopped makes sense.
> > >>
> > >> Laurent, do you have any input here?
> > >>
> > >> Regards,
> > >>
> > >> Hans
> > >>
> > >>
> > >>
> > >>
> > >>>> p.s.
> > >>>>
> > >>>> 1. It is tempting to also apply the same approach to
> > >>>> vb2_ops.start_streaming, but allowing the meta queue to be
> > >>>> the one to start streaming will likely cause issues. E.g.
> > >>>> the streaming code assumes having a meta-queue active is
> > >>>> optional, but not the other way around.
> > >>>>
> > >>>> TL;DR: vb2_ops.start_streaming should stay as is.
> > >>>>
> > >>>> 2. While looking into this I noticed that struct uvc_streaming
> > >>>> already has an active member, but unless I'm missing something
> > >>>> that ever only gets initialized to 0. So I think that can be
> > >>>> dropped. (If you re-use this please change it to a bool, no
> > >>>> need to have it atomic while protected by a mutex).
> > >>>
> > >>> I will send a patch to fix this. Thanks for noticing :)
> > >>>
> > >>>>
> > >>>>
> > >>>>
> > >>>>> ---
> > >>>>>  drivers/media/usb/uvc/uvc_queue.c | 14 ++++++++++++++
> > >>>>>  drivers/media/usb/uvc/uvc_video.c | 30 +++++++++++++++++++++++++++++-
> > >>>>>  drivers/media/usb/uvc/uvcvideo.h  |  2 ++
> > >>>>>  3 files changed, 45 insertions(+), 1 deletion(-)
> > >>>>>
> > >>>>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > >>>>> index 3c002c8f442f..af9dbfcf6f53 100644
> > >>>>> --- a/drivers/media/usb/uvc/uvc_queue.c
> > >>>>> +++ b/drivers/media/usb/uvc/uvc_queue.c
> > >>>>> @@ -209,10 +209,24 @@ static void uvc_stop_streaming_video(struct vb2_queue *vq)
> > >>>>>  static void uvc_stop_streaming_meta(struct vb2_queue *vq)
> > >>>>>  {
> > >>>>>       struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > >>>>> +     struct uvc_streaming *stream = queue->stream;
> > >>>>>
> > >>>>>       lockdep_assert_irqs_enabled();
> > >>>>>
> > >>>>> +     spin_lock_irq(&stream->meta.irqlock);
> > >>>>> +     while (stream->meta.in_flight) {
> > >>>>> +             spin_unlock_irq(&stream->meta.irqlock);
> > >>>>> +             schedule();
> > >>>>> +             spin_lock_irq(&stream->meta.irqlock);
> > >>>>> +     }
> > >>>>> +     stream->meta.in_flight = true;
> > >>>>> +     spin_unlock_irq(&stream->meta.irqlock);
> > >>>>> +
> > >>>>>       uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> > >>>>> +
> > >>>>> +     scoped_guard(spinlock_irq, &stream->meta.irqlock) {
> > >>>>> +             stream->meta.in_flight = false;
> > >>>>> +     }
> > >>>>>  }
> > >>>>>
> > >>>>>  static const struct vb2_ops uvc_queue_qops = {
> > >>>>> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > >>>>> index fc3536a4399f..f6b55b3a3308 100644
> > >>>>> --- a/drivers/media/usb/uvc/uvc_video.c
> > >>>>> +++ b/drivers/media/usb/uvc/uvc_video.c
> > >>>>> @@ -1732,6 +1732,26 @@ static void uvc_video_encode_bulk(struct uvc_urb *uvc_urb,
> > >>>>>       urb->transfer_buffer_length = stream->urb_size - len;
> > >>>>>  }
> > >>>>>
> > >>>>> +static struct uvc_buffer *
> > >>>>> +uvc_video_get_current_meta_buffer(struct uvc_streaming *stream)
> > >>>>> +{
> > >>>>> +     struct uvc_video_queue *queue = &stream->meta.queue;
> > >>>>> +     struct uvc_buffer *buf;
> > >>>>> +
> > >>>>> +     buf = uvc_queue_get_current_buffer(queue);
> > >>>>> +     if (!buf)
> > >>>>> +             return NULL;
> > >>>>> +
> > >>>>> +     guard(spinlock_irqsave)(&stream->meta.irqlock);
> > >>>>> +
> > >>>>> +     if (stream->meta.in_flight)
> > >>>>> +             return NULL;
> > >>>>> +
> > >>>>> +     stream->meta.in_flight = true;
> > >>>>> +
> > >>>>> +     return buf;
> > >>>>> +}
> > >>>>> +
> > >>>>>  static void uvc_video_complete(struct urb *urb)
> > >>>>>  {
> > >>>>>       struct uvc_urb *uvc_urb = urb->context;
> > >>>>> @@ -1767,7 +1787,7 @@ static void uvc_video_complete(struct urb *urb)
> > >>>>>       buf = uvc_queue_get_current_buffer(queue);
> > >>>>>
> > >>>>>       if (vb2_qmeta)
> > >>>>> -             buf_meta = uvc_queue_get_current_buffer(qmeta);
> > >>>>> +             buf_meta = uvc_video_get_current_meta_buffer(stream);
> > >>>>>
> > >>>>>       /* Re-initialise the URB async work. */
> > >>>>>       uvc_urb->async_operations = 0;
> > >>>>> @@ -1778,6 +1798,12 @@ static void uvc_video_complete(struct urb *urb)
> > >>>>>        */
> > >>>>>       stream->decode(uvc_urb, buf, buf_meta);
> > >>>>>
> > >>>>> +     if (buf_meta) {
> > >>>>> +             scoped_guard(spinlock_irqsave, &stream->meta.irqlock) {
> > >>>>> +                     stream->meta.in_flight = false;
> > >>>>> +             }
> > >>>>> +     }
> > >>>>> +
> > >>>>>       /* If no async work is needed, resubmit the URB immediately. */
> > >>>>>       if (!uvc_urb->async_operations) {
> > >>>>>               ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
> > >>>>> @@ -2330,6 +2356,8 @@ int uvc_video_init(struct uvc_streaming *stream)
> > >>>>>       for_each_uvc_urb(uvc_urb, stream)
> > >>>>>               INIT_WORK(&uvc_urb->work, uvc_video_copy_data_work);
> > >>>>>
> > >>>>> +     spin_lock_init(&stream->meta.irqlock);
> > >>>>> +
> > >>>>>       return 0;
> > >>>>>  }
> > >>>>>
> > >>>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > >>>>> index b6bcee4a222f..6f1a3381d392 100644
> > >>>>> --- a/drivers/media/usb/uvc/uvcvideo.h
> > >>>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
> > >>>>> @@ -484,6 +484,8 @@ struct uvc_streaming {
> > >>>>>               struct uvc_video_queue queue;
> > >>>>>               u32 format;
> > >>>>>               u32 buffersize;
> > >>>>> +             bool in_flight;
> > >>>>> +             spinlock_t irqlock; /* Protects in_flight. */
> > >>>>>       } meta;
> > >>>>>
> > >>>>>       /* Context data used by the bulk completion handler. */
> > >>>>>
> > >>>>
> > >>>
> > >>>
> > >>
> > >
> > >
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

