Return-Path: <linux-media+bounces-56528-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOPqHe1HvWlr8gIAu9opvQ
	(envelope-from <linux-media+bounces-56528-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:13:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE72DAC6E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 14:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CDBD301EA11
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 13:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFCC3B8BDD;
	Fri, 20 Mar 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="btJjoTno"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842E23A759D
	for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012386; cv=none; b=CrNyTqRFv5mWalOEauh+obAqkOCl6dJi23Sn1ggAP90ymuNOSfpXJoVNzpiAdZp0xgRoEbHF7FePGzpA/T5Nat+xye7548Ba6tNPyEE+SIITPgcr6kqmew5hhvTSYPe63H6hNqZDp0uYIZEJjQmnpT4ZaHj0LPuf187oGShV53A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012386; c=relaxed/simple;
	bh=U4yedSAWSx0b9LHB7ffjCeFqOg1BU+VNbUw0GgYioQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrLOIGqbognP7RQ1va3CHSK7gkuuFvIOOse9ly+bK4z2RfJkScLrxWuSIU8z5rhfPDr4lfLPJltVbZ2HHanuPrREij+76BsZZwBWg3UgrzKu28QoBNdrhrdekPIy4fBOxcMUsn6vDSKfBZnKdnrrQJpczPs8TvZ0UrsmdSrpC7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=btJjoTno; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so2776603a12.0
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774012382; x=1774617182; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GrXxQ9x8f5Lw1bFjkJKyulRzxTZUObG6D/r8j3xC/p4=;
        b=btJjoTnomvNa0JO0Buh5A5ayGl6pXYn6tRe1LeHCsuPih7Uhh+dwSqrsKGo9H4dDNk
         vZyQTQB8IP8WmsN28FBIfZ2FdZkOEVxIMIS6twtC9RUKX0ztJxv21G+3xfX/OXsfD0rg
         qQ1FYLKny56N8Wb/ArHbo1sErvv55npY051Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774012382; x=1774617182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrXxQ9x8f5Lw1bFjkJKyulRzxTZUObG6D/r8j3xC/p4=;
        b=BXS3jJMmOKd0sQnMp0G1pDyc4r40bhh19tgXdSIIMfAEPxvNoKUtUPcj2U0Nn4K4t6
         paXhhiURHjbhz4DIyspwvlPl7GCewGF6EBAGOe7bWVPtYOnxAUVlsb3GYpjsqagWhXD4
         M8UQvk9mW9cjo2/cD8zdPBKiDSnBRlJwWokgfscesfSVINO2HII00GZ7o/1ErLsPyqwd
         kFiv0mlD1Xw7b0RsrZoa8RKHCOzyz7XbhlH02Z/LQfpijOOdhlkrqXXmvOvSoiYGP3k5
         T9WeQbS9EgYs2kiBYx7spctjt/m9C7cgBMeroG7IYd+QkSJ7c0DKgnO0KW8duNDrK4/u
         9zCg==
X-Forwarded-Encrypted: i=1; AJvYcCXaG1z3V4MZOiyguTT1EflYRoGGzmdFG9fU9h4wz9QbASTrx9UCCxt4TXaccsAFVo9hFEzNvylVPaLUbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxauKJJfmM1fHiu5SVxfR3wjkgy1iyfnyrZMKdyomfyztwkpJ2U
	NBe0WlXNwvQlXbJTNTa+3hK3dTekH2aoTk8ySEqAHRGWvum+xWIs31kuKlYeYOvZXA0Q1IaQCf0
	FDhS1Tol+
X-Gm-Gg: ATEYQzyi/KQ894m4cD1rFo+5crwni/ER19qqEk40PBNa+xUMO0BcN1h2niP4jh33c69
	ISV4HaGmJt3MzpKFoHzrOvHHB7wul7cZsnPj1FQ0YlEfmZQVfJnmxKGY21NcS5NzkWcIiyLiqgT
	vtbTBt+RUJnohm+VkyK/u/rTKv7V8oiSUZEYxWlA1JcA4NUoFjfmetKaCr3zAu4mlkeQVRwEjd+
	LMa1fO+4GP3yrAeR/h8hwxcCWBwkrp+ygksvrtJVu1Pe1g+SeyRQriM2OPQlqyCGWm9KZnli/DK
	wK/B4D98NqcQ71TH5e1IGfrWw5asX3ECPBB3SlT5OwuZn6NwQycWBcQ4wYpLINZpeQWBd/kSyVK
	YormdfvuUUUX+NMf+V2cSqGTmBAgeVjF0ywkS8w71WC+6r22LBv/eBS5DoJ+J16MR4EQ24ckhln
	CIp63Dx7V94+qFvwEDthUAb9jUFK/rTqeNQkgP6PDcZSGB9+LmX811UqDr81rD
X-Received: by 2002:a17:906:37c9:b0:b97:9076:f84f with SMTP id a640c23a62f3a-b982f37d496mr186890666b.45.1774012382411;
        Fri, 20 Mar 2026 06:13:02 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832fd7147sm158237566b.27.2026.03.20.06.13.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 06:13:01 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-667cc4ec065so3021381a12.1
        for <linux-media@vger.kernel.org>; Fri, 20 Mar 2026 06:13:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2g8D+iBf+uHRCU1ZJTAwpS8Iu1DL+bCwZVPja4RjnjbcV2kgTKljMtgojbNM0YaHwvo0SgRNkt4e7tA==@vger.kernel.org
X-Received: by 2002:a17:907:8d85:b0:b98:e38:559e with SMTP id
 a640c23a62f3a-b982f3ddce0mr203673066b.54.1774012380401; Fri, 20 Mar 2026
 06:13:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-uvc-fid-v3-0-c793354469b5@chromium.org>
 <20260316-uvc-fid-v3-2-c793354469b5@chromium.org> <19945fe0-fb8e-4c20-a2d8-2fc8273b0978@kernel.org>
In-Reply-To: <19945fe0-fb8e-4c20-a2d8-2fc8273b0978@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 20 Mar 2026 14:12:47 +0100
X-Gmail-Original-Message-ID: <CANiDSCtpXMQvTL3dbMMUDsg6ewBWcOOMqa89R17=k4dXT5Yq0A@mail.gmail.com>
X-Gm-Features: AaiRm531Q9TTzcESrBmDUCIZ4stmnP9bo30ZzOqpdqeHW3oSUA8xVl--eV2-8po
Message-ID: <CANiDSCtpXMQvTL3dbMMUDsg6ewBWcOOMqa89R17=k4dXT5Yq0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] media: uvcvideo: Fix sequence number when no EOF
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yunke Cao <yunkec@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56528-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4BAE72DAC6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Hans

Good catch. Sending a new version.

Hope that is less broken :P

On Fri, 20 Mar 2026 at 13:17, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 16-Mar-26 14:30, Ricardo Ribalda wrote:
> > If the driver could not detect the EOF, the sequence number is increased
> > twice:
> >  1) When we enter uvc_video_decode_start() with the old buffer and FID has
> >    fliped => We return -EAGAIN and last_fid is not flipped
> >  2) When we enter uvc_video_decode_start() with the new buffer.
> >
> > Fix this issue by saving last_fid on the first FID flip.
> >
> > Cc: stable@kernel.org
> > Fixes: 650b95feee35 ("[media] uvcvideo: Generate discontinuous sequence numbers when frames are lost")
> > Reported-by: Hans de Goede <hansg@kernel.org>
> > Closes: https://lore.kernel.org/linux-media/CANiDSCuj4cPuB5_v2xyvAagA5FjoN8V5scXiFFOeD3aKDMqkCg@mail.gmail.com/T/#me39fb134e8c2c085567a31548c3403eb639625e4
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 9e06b1d0f0f9..3e6ded69388f 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -1254,6 +1254,12 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
> >               uvc_dbg(stream->dev, FRAME,
> >                       "Frame complete (FID bit toggled)\n");
> >               buf->state = UVC_BUF_STATE_READY;
> > +
> > +             /*
> > +              * If the EOF detection has failed, we need to save the last_fid
> > +              * to avoid increasing the sequence number twice.
> > +              */
> > +             stream->last_fid = fid;
>
> AFAICT, there is still a problem after this patch:
>
> 1. We have an incomplete frame, so no EOF, first run through
> uvc_video_decode_start()
>
> 2. We hit the first if (stream->last_fid != fid) check do
> stream->sequence++ . And after patch 1/2 we do NOT update
> "buf->buf.sequence = stream->sequence" because buf->bytesused != 0
> (which is good, the incomplete frame should not get the new
> sequence-no).
>
> 3. Still first run through uvc_video_decode_start() we hit the:
> if (fid != stream->last_fid && buf->bytesused != 0) check further
> down, update "stream->last_fid = fid" (after this patch) and
> return -EAGAIN.
>
> 4. Second run through uvc_video_decode_start() the first
> if (stream->last_fid != fid) check no longer triggers, we
> don't increase the sequence-no (good) but we also do not
> set "buf->buf.sequence = stream->sequence" for the new buffer
> we are called with on the second run!
>
> So the combination of these 2 fixes is broken.
>
> Regards,
>
> Hans
>
>


-- 
Ricardo Ribalda

