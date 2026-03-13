Return-Path: <linux-media+bounces-55763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INXmCsJUtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:17:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D156288A0B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 19:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 306DE304AD22
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AA8346E60;
	Fri, 13 Mar 2026 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SVE1atvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF734FF6C
	for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773425826; cv=none; b=ovVwvD9M6TQdEsmElJG+CbG1NbE3CqojEJlgYlimqRrV/+h7DrTpT/PhAjSUmOUZLsVfG/DAahivvUG1yCMCicPMITBX++OCp0AA4wVC0bResJw6pc5y+RgICX0zLBUcmqLZH4F+ZXBJ7JHXpNGyZt3S1JDghPD9AJKXkh9Qnmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773425826; c=relaxed/simple;
	bh=1I4OeSvYuWVPMCc2ZgoVl4drcdQOvpIvmjAIjANT1II=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/PxsZwkwMe4H11o3UZBulvEGj1gWlJOOvOzlrMH6Imp5+7vy3xvkRzor59vtKEqu6UCsihF7zBfYqkyQXvyEeL5Y2ibE2IQLUiwW1e+Ju4UJLeKyzlHe8Vu9rfqtpwpXlBFe6CM4CWImjJqNQCv6smrv2jDUordXIXHXL8csFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SVE1atvQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-661568ce781so3691999a12.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 11:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773425823; x=1774030623; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wl990qar/hDIv8CWxr9LHLIPZcrBtVlSFmkmWMSWE/Y=;
        b=SVE1atvQy3bycJdeUTjDP5JXa5x81432F7twIxrRTB5mpPX+Cq6h75YOnKJwO6fVMD
         HRgRrQzIUffFv1pZWJ+AUxOK5Vr/UNoYnXVbpMZfInDXHg9aU8jS3/KLHUBdk/PFopBn
         u03J5v5v1cZiRyvRsDsHhcks1RhsxvgIjyRPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773425823; x=1774030623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wl990qar/hDIv8CWxr9LHLIPZcrBtVlSFmkmWMSWE/Y=;
        b=rdJG/zDI3nMN6dDu6opvZAFaGI1W3leRPwEK9FAYRVk2KXYCJeSnFNO40/5Y7zQ+LD
         5893Jl2cC3I6meCU5miIegfMlaAEDVu71/C4AOPBFHtYg/5dPn3SDV28JaO7jMfD8fXV
         w0CLaJ7BfoJuISmTBGK4fPDx+EDdoAHhL3CUzBVP6i/n7xlJBYFBWD/Pck6wu6qtodAS
         XNViWu2VleNkrL3rU5s21qcaFKMhjpFHfmx8+iWNWfniiG7QSLlmrxH54Gp5DyUPTg0x
         hD0Xvb67aLtXbhgx9nmFX3gbLBDPD8bsbFcIZD5/s8kLdspGoGcWaRlKvSHydEHOQVif
         WU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMy6TPm6AZqeNwkzhbo1nD2klGp6MdTEhrYEfQ2u6EvAVFC2oWlyfkfd7aO2gtipPizkt/S4MIugo94g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCX2g7E7cuAkTntBaXNGZrSfPdtj/yzrsTKPkBMOOagv1mXJlv
	oz+K5G0DuRwsieDr4TNSYD4fM9nQ1U18GViFsX43XoupAJoYvE6sd90uSUu2NT/U/67yUH8bCbx
	/FlZdNg==
X-Gm-Gg: ATEYQzytHWQYQDV/n0/Nv3jS1JpM3F8gvVf9jvYU3cNRN7dT1gFHCeNiMAWY/3tdKRz
	qA4fPSD5HoLXcX6nWs91wRUklIKcgo7w9fr7dM1G1Lym1avd9+Jzlb+aeAjcWbcYogzTz1w/tmn
	7wF3tn0IT9NF1YQUNhXBQfBGcK7ZgtpuQfbLfyhXPUjX+VSx5J8dVfqNivL749ApLAFZb9BZR3p
	HmvjFzDyEToERdiO1Z/qRYgmNBV/3cdnwcZtIUISEoWK1dU1HKRhLm5AyQYh2EhsclvXt2lKqtM
	uUE2TUpamriZiQyi0UKVyMV0nw1zZrW4yGXndCDYwXhhSF1KRp9+I5j9giTrL7x0Z7jIobWeHiH
	+8Xu/GtpsnHjMPV0rOpAU8sqkzrquBque1F4H1CdLoqnfiF4xaaGUQEKIVN+mF2kpk2KwtmTo/6
	DCS8N605VlfTq7uVdQOVZoUNIcKnDZ2P6xgJTn7pHVUpVq9dTemaXEvPyVqvcg
X-Received: by 2002:a05:6402:1d4b:b0:660:f609:2eca with SMTP id 4fb4d7f45d1cf-663babff58dmr2579187a12.18.1773425822573;
        Fri, 13 Mar 2026 11:17:02 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66350992e88sm1567091a12.24.2026.03.13.11.17.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 11:17:01 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-661568ce781so3691913a12.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2026 11:17:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnexBdPC6Wr9cGpCI142HxQnUfMuNhqABBwt2pxmaWFyZ8xhWDK/Fqu6WLevsu5wCzYG+6WeOIKYw24Q==@vger.kernel.org
X-Received: by 2002:a17:906:ca17:b0:b8e:7dcb:7f1b with SMTP id
 a640c23a62f3a-b9765063e85mr217646466b.21.1773425819780; Fri, 13 Mar 2026
 11:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310-uvc-fid-v1-1-5e37dc3c7024@chromium.org> <20260313165105.GE275549@killaraus.ideasonboard.com>
In-Reply-To: <20260313165105.GE275549@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 13 Mar 2026 19:16:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCuLvB3DHdUhVW-yEEcHnAmLTykSqHywccqe0Os3h7V-dg@mail.gmail.com>
X-Gm-Features: AaiRm50JozNIHy8Tb7uVQAce09HaSzO4NmCJR4zcbLL8j0E7Fu2GMdmmfLdXyck
Message-ID: <CANiDSCuLvB3DHdUhVW-yEEcHnAmLTykSqHywccqe0Os3h7V-dg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix buffer sequence in frame gaps
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55763-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9D156288A0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent

On Fri, 13 Mar 2026 at 17:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Mar 10, 2026 at 11:54:24AM +0000, Ricardo Ribalda wrote:
> > In UVC, the FID flips with every frame. For every FID flip, we increase
> > the sequence number. Userpace use that information to figure out if
> > there has been a gap between frames.
> >
> > Now, we only update the sequence number on the first FID flip, which
> > results in frames being incorrectly numbered just after a frame gap.
>
> The sequence number is increased on every FID flip. I assume you mean
> that we don't set the buffer sequence number in some cases. "on the
> first FID flip" doesn't seem right. Could you please improve the commit
> message to describe more clearly what the problem is ?

Will do my best in v2 :)

>
> > This patch rewrites the sequence number of the buffer in those
> > situations.
> >
> > Cc: stable@kernel.org
> > Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 40c76c051da2..ec769a504569 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1176,6 +1176,14 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >               stream->sequence++;
> >               if (stream->sequence)
> >                       uvc_video_stats_update(stream);
> > +
> > +             /*
> > +              * If we have not received any data and FID flips, update the
> > +              * sequence number of the buffer to tell userspace exactly
> > +              * where the frame gap is.
> > +              */
> > +             if (buf && !buf->bytesused)
> > +                     buf->buf.sequence = stream->sequence;
>
> Do we still need to set buf->buf.sequence below ? And how about the
> buffer timestamp, isn't it also not set in the case that this patch
> addresses ?

Yep, it makes more sense to move the whole buffer init here. Let me do
that and add a comment explaining why it also works if the hardware
does not set the FID properly.

Thanks!

>
> >       }
> >
> >       uvc_video_clock_decode(stream, buf, data, len);
> >
> > ---
> > base-commit: a7da7fb57f2a787412da1a62292a17fa00fbfbdf
> > change-id: 20260310-uvc-fid-e1e55447b6f1
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

