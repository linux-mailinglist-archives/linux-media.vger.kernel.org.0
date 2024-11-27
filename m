Return-Path: <linux-media+bounces-22143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE40E9DA4BC
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 10:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DB271654B3
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A495192D79;
	Wed, 27 Nov 2024 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HAvXBwQC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453CA1925BF
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732699566; cv=none; b=Y8G7+e8tqWGVHwn88jDIUfUZrSdLU4fG/yDPX/zjfvjD0XKEUmvddW53bHn0N7EJMYHgX+PfdFPwf3Fx6iFujBKMTLzsWN2eO/4uvw0bby5XpkNS3TFoL4h7XLh+rOqjmxGSeW/JC+fvTFAJwSGeB7Px8dqXO5EJHhANny29X8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732699566; c=relaxed/simple;
	bh=Pr2w9P5YgFGcloq41dky7oHk7tvapxV8DUhchBmh8oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJEU/7OJNOucmRP66FqN+Fi6Qy8IVFOtv11B1o0yTXoA2flYqqVrYYzXM6xj97wwCQMFLm69BfzHn0nkt81GiKbe+7SUFDjPmBrKvY5Qcmb4tBR4am6eZx4oOihE7whCRq8ae7PJl2PsHohEoZ1frwK6nMNzh5fiMvKY/Z+KfX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HAvXBwQC; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7250906bc63so479446b3a.1
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 01:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732699563; x=1733304363; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ef33Q45NDhtM2JikV+GQsfJKYqlaYSgoxUTe9Gy8DDA=;
        b=HAvXBwQCwLOY7fYcU8fAV0O5Q82OOpELklgx5/FAKz2q+YqzyxP1q69iKZlr4ZVzNF
         LTkqtVb1xJv5A2VXl7cRlPauSdkXKJIYbhAsKjNAL6H/oD3OnCrmEvayBfbGwMm9kdXG
         49WLVTFw23+g5G2qOD9RJwIRRr0uyrhRHTRic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732699563; x=1733304363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef33Q45NDhtM2JikV+GQsfJKYqlaYSgoxUTe9Gy8DDA=;
        b=oS/rbsh3vR1eAuPSl0oXRI3sGvwHd4xtNG8yH4sYPcCd+HjsWlq+JnOrmnaUnnZugK
         05m1RTN4r/MIAbVdy5RX1g0jaQn0SQ9niTyDdjS7hCO7Ve2Fe/n+FaFAO3FEQSHLB9Hs
         CvDi/nMggd03+OBb5tNdQVOIBztKE8ZnuE9hEWalzg65JspBvl01Jvvjivj3BzdkIKg3
         /ze5R2GoTQcWNpD7Z0QXbTOM0yqOPD4DWYF39Jjrh+I4qDadZX0rzDPgvqimFbKA4wv7
         QXUMtOiA5cTKCcLx2Tsxii3Xbe93mlxXm2+7QtRD3mIAMOxkxfADkYjas41MttScJvGc
         552g==
X-Forwarded-Encrypted: i=1; AJvYcCVWNHSI+J9H9dy2glGgQeFMD8i4RGSUSgYKtYsbfn9D4wD1E2HtNvrLTa9xhsBcjMU5OCM+wSc01PIUpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR7HhNz6gP97hQ2vttvb46YQBaNh7pqGOIXsPkJF6PUWoU1CXC
	okaaXR01UGcwRyF+a7EcQZ0T0YBf4IpE203RkJJPEZNSYLC1I7GwfvNKjngk3UUZyDvIj39FSMM
	=
X-Gm-Gg: ASbGncs+HcdcGNfjVgpzUG8gtrw1Kf264Yb39k7FttgiQsCLRDPpWOfs1UdLOzNcXMB
	WumlqwSo6BhoGBOlo2my3/ztJRWwUfrgdxXCuPpxWHlMEVSL0Nqz81U/IEvnpho/u78F65TsDD5
	c8X1h2L1VQdseV3bqI5FrCHD0Oom7W31vXUc2HwUrPwNfO+gwNqADd/KO0x1SOIU+qsLpw8hKZq
	RgBPB1VqflZb9xQ7dQXn6tM22u62Fr2EbJ7uMgFqbOsTQxEyJTbscjtLFWUOMLDpcopdMqVeoof
	Og+WvZ70nM4t2ZiP
X-Google-Smtp-Source: AGHT+IFNIOP2loS3ZXD3pgtwcYJig0IJApJ2SuVkpS3OWrtImGvoZAOAzUHuc63XAy4pDOtNxc46kg==
X-Received: by 2002:a05:6a00:21cd:b0:724:e7d9:575 with SMTP id d2e1a72fcca58-7251ce4af41mr10292884b3a.13.1732699563185;
        Wed, 27 Nov 2024 01:26:03 -0800 (PST)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724eb65e2cbsm8688156b3a.96.2024.11.27.01.26.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:26:01 -0800 (PST)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7252b5d7b1dso463122b3a.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 01:26:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1nGD0SVXDCEXRgNvkN+N7zF2mbxHPgUY2ecwmG0DZ1J1jSJhbpJQ3Bife/PeVRykzye1fEVn92i9XRg==@vger.kernel.org
X-Received: by 2002:a05:6a00:3014:b0:725:37a4:8827 with SMTP id
 d2e1a72fcca58-72537a489f6mr1060353b3a.3.1732699560596; Wed, 27 Nov 2024
 01:26:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v1-0-eb8722531b8c@chromium.org>
 <20241127-uvc-fix-async-v1-1-eb8722531b8c@chromium.org> <20241127091153.GA31095@pendragon.ideasonboard.com>
In-Reply-To: <20241127091153.GA31095@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 10:25:48 +0100
X-Gmail-Original-Message-ID: <CANiDSCs36Ndyjz52aYA0SHef8JVQc=FvtDNk8xQwR=30m652Gg@mail.gmail.com>
Message-ID: <CANiDSCs36Ndyjz52aYA0SHef8JVQc=FvtDNk8xQwR=30m652Gg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: uvcvideo: Do not set an async control owned by
 other fh
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 10:12, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Nov 27, 2024 at 07:46:10AM +0000, Ricardo Ribalda wrote:
> > If a file handle is waiting for a response from an async control, avoid
> > that other file handle operate with it.
> >
> > Without this patch, the first file handle will never get the event
> > associated to that operation.
>
> Please explain why that is an issue (both for the commit message and for
> me, as I'm not sure what you're fixing here).

What about something like this:

Without this patch, the first file handle will never get the event
associated with that operation, which can lead to endless loops in
applications. Eg:
If an application A wants to change the zoom and to know when the
operation has completed:
it will open the video node, subscribe to the zoom event, change the
control and wait for zoom to finish.
If before the zoom operation finishes, another application B changes
the zoom, the first app A will loop forever.

>
> What may be an issue is that ctrl->handle seem to be accessed from
> different contexts without proper locking :-S

Isn't it always protected by ctrl_mutex?

>
> > Cc: stable@vger.kernel.org
> > Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4fe26e82e3d1..5d3a28edf7f0 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1950,6 +1950,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> >               return -EACCES;
> >
> > +     /* Other file handle is waiting a response from this async control. */
> > +     if (ctrl->handle && ctrl->handle != handle)
> > +             return -EBUSY;
> > +
> >       /* Clamp out of range values. */
> >       switch (mapping->v4l2_type) {
> >       case V4L2_CTRL_TYPE_INTEGER:
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

