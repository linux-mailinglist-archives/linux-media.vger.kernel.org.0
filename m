Return-Path: <linux-media+bounces-22937-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FCC9E994C
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 15:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1FF11888CE9
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 14:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8809C1B425C;
	Mon,  9 Dec 2024 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="br5ZaHmt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1741ACED0
	for <linux-media@vger.kernel.org>; Mon,  9 Dec 2024 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733755614; cv=none; b=cR7qvuZgH1sttjAg7jkyEVtp/QuO+DtAaEbKoRfoZZTTOXAHIQtMdmBTD2fGOEfM8Tr0C+1A4EEuZEh7Z/K0Ewk8a0lEVRLdYybX/AkPIoVWca25A22QBK67PzEmctBKwMPcw2XaSdegUt8VW1Gh/1ICGYLPTxm9R4OU0cy55tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733755614; c=relaxed/simple;
	bh=wfaCW9PKJNfdJARFyfPcnNW1uOaAzyBt79sDMe4ggF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezWv6Vz/fnzx6SP43APQT13HU4+tKNhB1tpl1D0vl3PwS7fvUjaO3ah8GD2+32ZlXqvqCDrCXnB3gRe0RsweffTnfOPp1BGz1s7ARZVca7zvtP500kNnyuauHRIBcfffVNGf+NJE5tx3z+Bo0WXGLy8P7LezBRA4NYGnvOGxY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=br5ZaHmt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2165cb60719so6546945ad.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733755612; x=1734360412; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/BY5bcYoYikTyU3Vh1QbYSB3lerrS5OmyaNA6i7z+50=;
        b=br5ZaHmtIB3w6w7qdah6TavgXBEmmU7QfDPp6LQEDcY9khPnKcahKqyONFFjmuno18
         6G+RvnH6mUPM4KW47Mo+CNNEvVMu28dKhqNVWklBExg/eW7zQ/5SHUO6L7RZKUXwab43
         U7/ihpafKG7bo45P4xULMvT+mVgljFQqI2bZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733755612; x=1734360412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BY5bcYoYikTyU3Vh1QbYSB3lerrS5OmyaNA6i7z+50=;
        b=ENgspm2ASQttBBQce2YNevGy3FL3tAlK6scYqKVGUrph8gB98YRViCZXBDdFPi4JSA
         E9WKJBAf24ty1qX5LD4xL9ykAZOvDNTAzGfWlq1BpE+Kz95qXiPNuOmnb2kVNnoFy6em
         SLlxeljRzORdFbJUzSIoUWrU7/lCHgiiDRg3pIgKx7S0b5xUv+dIXLVKuL6vjKnACPw5
         QjnGofnApqkVG/if1KF7Y468eiLh88uTfQ8RYRUc6BugdKG265st9wswYjM9fREue8xl
         pjf1whAb0e17Zf1M1D9u4EaOsJnaC8ZPbw8tqbCC6i14hVQXKOIuTLa6KMXxQ8QywsEj
         TbKg==
X-Forwarded-Encrypted: i=1; AJvYcCVdqO9U9YKEOgUP6TbQsA+T671PhX68YHDqbj7bPf4YQ8oBYdbKACC7NUQUS2OJPOyTQs3fUM19aJdAZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC3ApQpOxHeejQDl1TM2mGHqxFjF1ZFTj868rs8/Ut19HXleRO
	yaBGJENaQz76xGFiv8TFHwxpzhKHXfU8VFJk7tw7xq2z85CGGk7m7GGNIt8S9QL9HOXcePn5lUI
	=
X-Gm-Gg: ASbGncs1mSs/ube9PKDxoOAjyvlGjS3bZrQM7pAEcgutqvMHz055coqFPc4An1p1OfP
	54O8PkkJvDain8cSUNvt87EHkzOVaWlnKe2Tq5XZenRTBndxUR56r0Ce2hX3lFvrgbckJSSHNY2
	EN2mtVSgGB5lwmN43fzIVsZqHvj3VLCcilq8csecO32u2+kN7ONbX4eDWaKDk8fXhWhnSvQ7h3z
	l/gM4krZL36pNTC1oDeVIvn3kCWZmeX987zu5kAfGTRGAFhkoDqMMzTi8iH5418c3l6glYGlpt9
	aoba5iXF+bS2
X-Google-Smtp-Source: AGHT+IHtjtG28rQ/mgm1crHiF/SiNabqV0p8FcK2g31ShUqn7tHfTbgbEfd98awLnb0iOX6izh60rw==
X-Received: by 2002:a17:902:dad1:b0:216:5b64:90f6 with SMTP id d9443c01a7336-2166a07df0amr9915165ad.45.1733755612296;
        Mon, 09 Dec 2024 06:46:52 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c389d5dsm40680665ad.243.2024.12.09.06.46.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:46:51 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef83c68b47so1489219a91.0
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2024 06:46:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbhwUajs1XO173tDL3/gHTO69bhvhwl5ggjUnTx5q6EJOA9quvRfiAiL4t2VQica2IvrcfpD1KyCP+AA==@vger.kernel.org
X-Received: by 2002:a17:90b:53d0:b0:2ee:ed1c:e451 with SMTP id
 98e67ed59e1d1-2efcf1484b6mr1271828a91.15.1733755610316; Mon, 09 Dec 2024
 06:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
 <20241114-uvc-roi-v15-14-64cfeb56b6f8@chromium.org> <1cac4857-c261-461f-9749-8c8c68a0db07@redhat.com>
In-Reply-To: <1cac4857-c261-461f-9749-8c8c68a0db07@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 9 Dec 2024 15:46:38 +0100
X-Gmail-Original-Message-ID: <CANiDSCsN8UjxnCWmvuKzXnvSFY6YO02N24ha6W4PNTkUVZTzHg@mail.gmail.com>
X-Gm-Features: AZHOrDkJnrHyC4xzyb2bm7dfdIkKr36449JL3-XBxamAiy7PTjRYXhxOEG79O80
Message-ID: <CANiDSCsN8UjxnCWmvuKzXnvSFY6YO02N24ha6W4PNTkUVZTzHg@mail.gmail.com>
Subject: Re: [PATCH v15 14/19] media: uvcvideo: Use the camera to clamp
 compound controls
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ricardo Ribalda <ribalda@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Dec 2024 at 15:05, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 14-Nov-24 8:10 PM, Ricardo Ribalda wrote:
> > Compound controls cannot e reliable clamped. There is plenty of space
> > for interpretation for the device manufacturer.
> >
> > When we write a compound control, let the camera do the clamping and
> > return back to the user the value used by the device.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 0dae5e8c3ca0..72ed7dc9cfc1 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2339,6 +2339,18 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
> >
> >       ctrl->dirty = 1;
> >       ctrl->modified = 1;
> > +
> > +     /*
> > +      * Compound controls cannot reliable clamp the value when they are
> > +      * written to the device. Let the device do the clamping and read back
> > +      * the value that the device is using. We do not need to return an
> > +      * error if this fails.
> > +      */
> > +     if (uvc_ctrl_mapping_is_compound(mapping) &&
> > +         uvc_ctrl_is_readable(V4L2_CTRL_WHICH_CUR_VAL, ctrl, mapping))
> > +             uvc_mapping_get_xctrl_compound(chain, ctrl, mapping,
> > +                                            V4L2_CTRL_WHICH_CUR_VAL, xctrl);
> > +
>
> I do not believe that this actually works / does what you want it to do.
>
> At this point we have only updated in memory structures for the control
> and not send anything to camera.
>
> Querying the control to return the actual achieved values to userspace
> only makes sense after uvc_ctrl_commit() has succeeded, unless I am
> missing something ?

You are absolutely correct. Sorry about that.

Let's drop it for now.

Thanks!

>
> Regards,
>
> Hans
>
>


-- 
Ricardo Ribalda

