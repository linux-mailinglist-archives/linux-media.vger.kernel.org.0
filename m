Return-Path: <linux-media+bounces-23809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4F9F7F39
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 17:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0244D161682
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDF3226175;
	Thu, 19 Dec 2024 16:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dycmBBR+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA920766B
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734625104; cv=none; b=gDjZABH8K08WMsV78pizYoitr1xiKvaw9+r4nTmuucXjcgSqjJo2SVOldh6IByq6WUTjWsWx1Y2qBju8qDfwK3cpDpS903vSDGYGtOx0rG85QO3tw4tIOknTMvmL6CaY4QEvXtVrxSXh9csSVCiWKB1AnnYQsn+HDOjSZTFd4oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734625104; c=relaxed/simple;
	bh=uTZFsRn7kt8qKTVoNv+O1sUXx+v14Cuv/BmFYEPr3F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2NCHgGgosFv1evaOyfi+OJi3ChOhSylgT6LYAAbGWpiWgYDXkuGucc4PUh/cCl2J9AFG91YgOV2z0lAHdJGkTukz+bnhXpcFwOXL34HVmTyZvCQRPGUuTYaOpbnK7nU37h8Hme1bon7iIuMWBJTVTkznnpo8grKNAwYk8X4ZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dycmBBR+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2164b662090so9012645ad.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 08:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734625102; x=1735229902; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QDA1yRSVBsaxAkSM9mFGgaJ8i6n4xmmn2YiM5VaISNE=;
        b=dycmBBR+vcTYgUDTKf6lz7eIMypFhx5p+4eVfifsrFS0ivl+WUNqvKCWNz/aDuwSKN
         7iet9f6M5Ent3fNkT4fvgtE8fqgQP0hxFj5/oeSoKUHrFic5v62dub8uDqSPPWdgv4k7
         C/2xxTjKimk3GFG5ru8cyyDqW9tG3So9H31Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734625102; x=1735229902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QDA1yRSVBsaxAkSM9mFGgaJ8i6n4xmmn2YiM5VaISNE=;
        b=VhvDJFEO8BHcmLRM5/4xgvn8EYefYXVEbuD7Mi4phnPrJ56eRvuAlP8FUHu/cDf6rs
         fjLGCBBxZgLW45cAUfFaqYzwjegD2Il5pmUMaoJcwZe9HPOCHgOyPLG08zNpHTdMJU3y
         qpOJaVu1OV9xiB1HLTA/5yrlPSc9YBFb+RY85uyMBdAQIRs6OjlSiRmr6+JLPVYP0Gmi
         bH/CarlbWztfSNAkb3Px9WVeAkSvS8pBqoqHIe9XLwtiMcU8fbfa74B7Y8fiLxsQDLgX
         fxN+8+9zYC6tcKsFRCcys6Kv7tnVjs8tMcyRo/s9teBqVAOUo2omPATiiWj61sfV0RWa
         wL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfpUevzBCXKJAGP+GgosakPMhVBPvOwlvVcMqKRXdP+bZREP3O5txxAhbO9MUsbxGa/0gcVB1OteVbcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWrkqzRgNIMNdAqSbLc9QW+eI2BHMJDqBr49biPc0+RaNsF6Q
	+cGrp/fpV59EEMlMzwnUIv2JFclOlQvEJ4n8uEaa3bMt+d2DZHOwGv4CWezv9MRvJgj9Ilyp5fQ
	=
X-Gm-Gg: ASbGnctbx6cJbSaGqpmYwUoemb88M9sH2Oj/AwelfL79CUfaLswOuIbWSyc615Oq8WF
	IZ+7HvILrKvPAVEbHapvxHrOHSRabHgOKF2/TA9Y/csbZPP5CYCaz6C4OrJHTer3P/wJv6yrNi7
	tpgTd+OHSpec1z6BX0+rEvtlfyPqdSssSDzt4PKGqfYlqAxMtIaJ2PbHSkZ2tEYEIqjeSS4NclL
	o5NDNZp8Xqv+DfeyRvF0ZBxjiwZydA2eEke4Vr7H7oMIbM3IQkOF3OA5F/QHyEomBd4w6KHF/mW
	aDNVW2m7Y5q7JVhQoWZbD/I=
X-Google-Smtp-Source: AGHT+IGacxM6acHxZst67cVu+vhca3wiMk4A0UCt8a7g8CnM1NOsP7iE9nVY/gbVzq57rt30NvmiwA==
X-Received: by 2002:a17:902:c944:b0:217:9172:2ce1 with SMTP id d9443c01a7336-218d70fc314mr117453825ad.22.1734625101704;
        Thu, 19 Dec 2024 08:18:21 -0800 (PST)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com. [209.85.215.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc972fc9sm14236855ad.107.2024.12.19.08.18.20
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 08:18:20 -0800 (PST)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-801c7e6518eso618662a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 08:18:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWCm3Y31xzsIiwCXLS5CQyNyt3xLwO1bFtFNLZZr7j5koFxHe3bwoaoPmoL0D2W8ZJev5oUN2my3FMPvA==@vger.kernel.org
X-Received: by 2002:a17:90b:384f:b0:2ee:d024:e4f7 with SMTP id
 98e67ed59e1d1-2f2e8f53927mr11429044a91.0.1734625100168; Thu, 19 Dec 2024
 08:18:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org>
 <20241218232730.GF5518@pendragon.ideasonboard.com> <CANiDSCu4krUbXq_RiaP5dSZVGdA6CxmUBzxEEPqMNCS4Ar05mw@mail.gmail.com>
 <20241219144124.GB2510@pendragon.ideasonboard.com> <CANiDSCtbkitSDkk-gsb1XwKyYWeCb6pVZJQhYGQjtAyM36oTmA@mail.gmail.com>
 <20241219154103.GD19884@pendragon.ideasonboard.com> <CANiDSCshYk2OyF_p1inwSdEhMnP0OV2vStFgbMgEHJZzLcG9pg@mail.gmail.com>
 <372a4cd2-60ea-4ce8-848f-318e34d62cbf@redhat.com>
In-Reply-To: <372a4cd2-60ea-4ce8-848f-318e34d62cbf@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Dec 2024 17:18:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCubXD6NEKSB6pycgPPLNj5-e+qggMGFx_TabRoo0ePOHg@mail.gmail.com>
X-Gm-Features: AbW1kvahM4lw-QKQ2v3Wh53_G-FCGZYN5A8spVdc21LUKX1RwT0XJlNUvCi1wqA
Message-ID: <CANiDSCubXD6NEKSB6pycgPPLNj5-e+qggMGFx_TabRoo0ePOHg@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Filter hw errors while enumerating controls
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 17:05, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 19-Dec-24 4:53 PM, Ricardo Ribalda wrote:
> > On Thu, 19 Dec 2024 at 16:41, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Thu, Dec 19, 2024 at 04:35:37PM +0100, Ricardo Ribalda wrote:
> >>> On Thu, 19 Dec 2024 at 15:41, Laurent Pinchart wrote:
> >>>> On Thu, Dec 19, 2024 at 09:17:31AM +0100, Ricardo Ribalda wrote:
> >>>>> On Thu, 19 Dec 2024 at 00:27, Laurent Pinchart wrote:
> >>>>>> On Fri, Dec 13, 2024 at 11:21:02AM +0000, Ricardo Ribalda wrote:
> >>>>>>> To implement VIDIOC_QUERYCTRL, we need to read from the hardware all the
> >>>>>>> values that were not cached previously. If that read fails, we used to
> >>>>>>> report back the error to the user.
> >>>>>>>
> >>>>>>> Unfortunately this does not play nice with userspace. When they are
> >>>>>>> enumerating the contols, the only expect an error when there are no
> >>>>>>> "next" control.
> >>>>>>>
> >>>>>>> This is probably a corner case, and could be handled in userspace, but
> >>>>>>> both v4l2-ctl and yavta fail to enumerate all the controls if we return
> >>>>>>> then -EIO during VIDIOC_QUERYCTRL. I suspect that there are tons of
> >>>>>>> userspace apps handling this wrongly as well.
> >>>>>>>
> >>>>>>> This patch get around this issue by ignoring the hardware errors and
> >>>>>>> always returning 0 if a control exists.
> >>>>>>>
> >>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>>>> ---
> >>>>>>> Hi 2*Hans and Laurent!
> >>>>>>>
> >>>>>>> I came around a device that was listing just a couple of controls when
> >>>>>>> it should be listing much more.
> >>>>>>>
> >>>>>>> Some debugging latter I found that the device was returning -EIO when
> >>>>>>> all the focal controls were read.
> >>>>>>
> >>>>>> Was it transient and random errors, or does the device always fail for
> >>>>>> those controls ?
> >>>>>
> >>>>> For one of the devices the control is always failing (or I could not
> >>>>> find a combination that made it work).
> >>>>>
> >>>>> For the other it was more or less random.
> >>>>
> >>>> Are there other controls that failed for that device ? And what
> >>>> request(s) fail, is it only GET_CUR or also GET_MIN/GET_MAX/GET_RES ?
> >>>
> >>> It is a mix.
> >>>
> >>>> What's the approximate frequency of those random failures ?
> >>>>
> >>>>>>> This could be solved in userspace.. but I suspect that a lot of people
> >>>>>>> has copied the implementation of v4l-utils or yavta.
> >>>>>>>
> >>>>>>> What do you think of this workaround?
> >>>>>>
> >>>>>> Pretending that the control could be queried is problematic. We'll
> >>>>>> return invalid values to the user, I don't think that's a good idea. If
> >>>>>> the problematic device always returns error for focus controls, we could
> >>>>>> add a quirk, and extend the uvc_device_info structure to list the
> >>>>>> controls to ignore.
> >>>>>>
> >>>>>> Another option would be to skip over controls that return -EIO within
> >>>>>> the kernel, and mark those controls are broken. I think this could be
> >>>>>> done transparently for userspace, the first time we try to populate the
> >>>>>> cache for such controls, a -EIO error would mark the control as broken,
> >>>>>> and from a userspace point of view it wouldn't be visible through as
> >>>>>> ioctl.
> >>>>>
> >>>>> I see a couple of issues with this:
> >>>>> - There are controls that fail randomly.
> >>>>> - There are controls that fail based on the value of other controls
> >>>>> (yeah, I know).
> >>>>
> >>>> I was fearing there would be random (or random-looking) failures, as
> >>>> that can preclude marking the controls as broken and fully hiding them
> >>>> from userspace :-(
> >>>>
> >>>>> - There are controls that do not implement RES, MIN, or MAX, but
> >>>>> besides that, they are completely functional.
> >>>>> In any of those cases we do not want to skip those controls.
> >>>>>
> >>>>> I am not against quirking specific cameras once we detect that they
> >>>>> are broken...
> >>>>
> >>>> Hopefully there won't be too many of those, right ? Righhhht... ?
> >>>
> >>> So far I have identified 4 in a week, and I am not testing obscure
> >>> camera modules....
> >>
> >> Can you provide more information about those modules ? USB descriptors
> >> maybe, and the list of controls that fail, and how they fail ?
> >
> > These are the ones I can share now:
> >
> > "13d3:5519": Focus value out of range
> > focus_absolute 0x009a090a (int)    : min=355 max=790 step=1 default=6
> > value=500 flags=inactive
>
> Hmm this one looks like min and default are swapped ?
>
> So I guess this one needs a quirk which checks if default < min
> and in that case swaps them (the check is to avoid swapping
> with fixed fw). If these are built into chromebooks how about
> doing a fwupdate for the camera instead ?

We do fwupdate whenever possible. But some modules are not updateable.
They either: lack DFU, or the flash is read-only, or the update
process has a non acceptable fail rate.

We aim to detect compliance errors early in the development process.
V4L2-compliance now (almost) works with the uvcvideo driver. And that
helps a lot :)

I plan to add quirks for the cameras that I can test. But we still
need a solution for all the external cameras and modules that are not
in the lab.

>
> > "3277:0003": Focus returns -EIO
> > Focus Absolute and Focus, Automatic Continuous: return -EIO for at
> > least one of get_ max/min/res
> >
> > "0408:302f": Error reading AutoExposure Flags
> > UVC_GET_INFO returns invalid flags
>
> Regards,
>
> Hans
>
>
>


-- 
Ricardo Ribalda

