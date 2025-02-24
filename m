Return-Path: <linux-media+bounces-26812-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D048A41D89
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 12:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92A2B16307C
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09822261585;
	Mon, 24 Feb 2025 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RVM3v97G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E48C84FAD
	for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740396242; cv=none; b=u4n3gMgLl4oh2UcOJGczLCexG4mounm080wk/rOzdG/WfzCJU+1pSJoQjGZSUyAAiU8EsGjnJjPGQ7Hz9oWfntZitY0mZa6PXZN+YuK6IuKPhBOIti4vpIyQc4ZV1eqEUv8pBjeXwN+59Qf0OPU0o69TrTHpa/qqllysj0fXAKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740396242; c=relaxed/simple;
	bh=iPeqiTBwt5d9EN3jklisbDhamrFjyRdrOW5GFe4pCTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEWRVUj8vDjIok03/THwphHXG7gY5SwOIdtjuw5lhYaD0vdd0aN3OqBxgrucIPCDm4Q1unRBAUq1byiYojEgtumUFn4bzArob+1IthINOC/cAurTccS1lm215cnFty+5GK/n6vIZBzZObdyuT6Cxh92Dw08jZ+aQonyhCMabaSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RVM3v97G; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30a2f240156so42564491fa.3
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 03:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740396238; x=1741001038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NJDplnyqFeqBd6tbUWmOpX1A3hfk7rDRzMgSUWQoyGo=;
        b=RVM3v97GEwIszt2gNI/8lvmFOHxCIT8Nrj7Hl9HgEIpI4xxfiS3qqgU6moOFx56Lxr
         glhoJKmKyJ8m8OgkWJY00lF+jaqgyMhuoe1QzOQDItUBYqXZI/swpZxnZgOU+z+fZJfN
         rT8ZSySLPxNrIUDYiayUPtdBT0fAZn+9lv+90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740396238; x=1741001038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJDplnyqFeqBd6tbUWmOpX1A3hfk7rDRzMgSUWQoyGo=;
        b=bfEmkJGk4CNWLtKqykaUOW1tI5bu7bdE6/VmeIBMHis2LF7rlCUNJaIcd+hn0LfOo+
         Xzw+HF4E/SLQxNpnbuwQlFrMC2Kim9a+JNy6ue1avcn8Xb6ZeqfiH8SGj71sdtCGoqv6
         yZpCtzxykGr07Ag7U6IlqHwyn1l3phKJn94qMHcyUVS3HGoOA/Z7J9uXNjSVUuz+5Pvk
         UK0HRDzZoBI6zN56xFq0TzQ6HLabrXvNRyp/2+hoec6Mk/5paRqt4nu23CMywWrMV0Mg
         IpquFHXYVR5Up52SVPDWE/Ych5eOHIkziIlyDZyFr37o4wm8fGtlfKTGd3Tk2WiTN2LN
         3pag==
X-Forwarded-Encrypted: i=1; AJvYcCXBk5XcSRhRfDiD1rOVgxoMVwPqVew90oNu2CUguQgyGMqvy4kOP7MFzzO2R7lmY2ITBorYUFnnRunvUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKwTKnfY2KQimVif1vhXcSbc+PE2VXqtkTmNhX+3NI8toRyU9
	cdXkLVeGCWMW33ljuv47qLWa4fUICp7MrBK0R5kQd2EHpfYUULyUfYTyCMTm6AQpeGO3210qY/u
	L1w==
X-Gm-Gg: ASbGnct7d8kmhclFaWo0t+oFY5gpxY1pORbp5f5v02beTQC0l+XVtlcifVRdHZraaOg
	zJkFdhOSSumApxpWkDo2dEMfoaIr0+/RS7AxIDQ/CZaNiljAu3jmoesSM7AulnlQ+x0alzLrBWx
	IRidAJLbWmpuDtS062r0lKzc0rcCOtpQmPJX4gK+aNlaLy2afLxB8t0/DxfpuXpgxaH0oMMRBfJ
	wPt0abm1/DUFeMc9M8rvfAX2Mu81fEVeN7iNgaqX59tkZn55pIe8DMs+nI/M02m/n8aSaL7mqq5
	CuhmdE3uWy1DtFGoWB2tIj8M90vK+eNBNwq4rdiJRgKftb/CAhqQ2kXmc47R5D+w
X-Google-Smtp-Source: AGHT+IG4r7SdN5GpY8UPjlp/MDjV4CReHnTm/A9Cqp8ld2FUfmFA6AooHVHwre5q5Ci26pzVIgPH+A==
X-Received: by 2002:a2e:80d8:0:b0:308:f479:569a with SMTP id 38308e7fff4ca-30a599605acmr35049581fa.29.1740396238382;
        Mon, 24 Feb 2025 03:23:58 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a344c8900sm23117311fa.22.2025.02.24.03.23.57
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 03:23:58 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5461a485a72so4179402e87.0
        for <linux-media@vger.kernel.org>; Mon, 24 Feb 2025 03:23:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWmBHLqWX3Q7ltb0tagaCOmsF7bsOVyDEW1TZT8J/oiMwi26FUf4PePqTEoOg5EGc8i07N0er+2OJHHgg==@vger.kernel.org
X-Received: by 2002:a05:6512:ba6:b0:545:f70:8aa0 with SMTP id
 2adb3069b0e04-54838f4ed99mr6014303e87.33.1740396237256; Mon, 24 Feb 2025
 03:23:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-uvc-data-backup-v1-0-77141e439cc3@chromium.org>
 <20241210-uvc-data-backup-v1-2-77141e439cc3@chromium.org> <20250223171005.GC2821@pendragon.ideasonboard.com>
In-Reply-To: <20250223171005.GC2821@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 24 Feb 2025 12:23:44 +0100
X-Gmail-Original-Message-ID: <CANiDSCtRis02keF2GzVFiHk7Pw_RQNqiNG8UzY+zhD=zi8Rmiw@mail.gmail.com>
X-Gm-Features: AWEUYZnyhXAR9z1e-ywMy6jpo_WLcO79wSmtaWlareRW6cezHfwM_iMGslgQe7A
Message-ID: <CANiDSCtRis02keF2GzVFiHk7Pw_RQNqiNG8UzY+zhD=zi8Rmiw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: uvcvideo: Do not send events for not changed controls
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Feb 2025 at 18:10, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Tue, Dec 10, 2024 at 10:22:23PM +0000, Ricardo Ribalda wrote:
> > Only send events for controls that have actually changed.
> > E.g.: We are changing entities A, B and C. If we get an error while
> > we change B we do not continue setting C. But the current code sends an
> > event also for C.
>
> Does it ? If uvc_ctrl_commit_entity() fails the 'goto done' statement
> skips over uvc_ctrl_send_events().

I have no idea how that commit message ended up there :).
I mean, the code is correct (I believe), but it does not do what the
commit message says. I guess I was trying something different and
forgot to modify the commit message.

Please check v2. Sorry about that



>
> > Due to the fact that the controls are grouped by entities, and the user
> > might group them in different orders, we cannot send the events at the
> > end, but when we change an entity.
> >
> > Cc: stable@kernel.org
> > Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 7e2fc97c9f43..9496ac970267 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1669,7 +1669,9 @@ static bool uvc_ctrl_xctrls_has_control(const struct v4l2_ext_control *xctrls,
> >  }
> >
> >  static void uvc_ctrl_send_events(struct uvc_fh *handle,
> > -     const struct v4l2_ext_control *xctrls, unsigned int xctrls_count)
> > +                              struct uvc_entity *entity,
> > +                              const struct v4l2_ext_control *xctrls,
> > +                              unsigned int xctrls_count)
> >  {
> >       struct uvc_control_mapping *mapping;
> >       struct uvc_control *ctrl;
> > @@ -1680,6 +1682,9 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
> >       for (i = 0; i < xctrls_count; ++i) {
> >               ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
> >
> > +             if (ctrl->entity != entity)
> > +                     continue;
> > +
> >               if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> >                       /* Notification will be sent from an Interrupt event. */
> >                       continue;
> > @@ -1911,11 +1916,12 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
> >                                       uvc_ctrl_find_ctrl_idx(entity, ctrls,
> >                                                              err_ctrl);
> >                       goto done;
> > +             } else if (ret > 0 && !rollback) {
> > +                     uvc_ctrl_send_events(handle, entity,
> > +                                          ctrls->controls, ctrls->count);
> >               }
> >       }
> >
> > -     if (!rollback)
> > -             uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
> >  done:
> >       mutex_unlock(&chain->ctrl_mutex);
> >       return ret < 0 ? ret : 0;
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

