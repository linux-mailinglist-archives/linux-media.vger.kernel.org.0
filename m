Return-Path: <linux-media+bounces-22350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CB69DE7DF
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 14:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322EA280405
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 13:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62DF19F47E;
	Fri, 29 Nov 2024 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b5X8K1bZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF8819E97F
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732887730; cv=none; b=JdveuAtxO5qP7STASIrsY9JSTb0l1/DI1+c86//QvLSsMLvm0Q4LV2bV3hQwZC2RXfIHOE1WW2Ndz6+DDVMpm68Xu6Gm/jb0+ahkxjCgouyeH4llCuKCWbyKDzcqtfvfjHXLfF7Ipaz2YT6dp8IexPSxxDWVGb8SRDXwn5beqzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732887730; c=relaxed/simple;
	bh=sVgv3ksXvpteRZEYd8JPzQOo44HSIW5lgB3anwK3PPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbQX/G7nVpDH5DMEBMWkIMGbLyNd15bhdszfaR+I2ilN+hzigLNqUAGEVAGlbrcq/bSXlyFjX8W0ABBl1sikFrT8Ug2QZRequSTPsbl5DqaAla02noSJvIeE1MEP5wFtGypBE+cLb3THGruq4GLY5JAT8AnXDMgLkRzUhVOUAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b5X8K1bZ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea9739647bso1247481a12.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 05:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732887728; x=1733492528; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSFitEdT2rCfLfdfH1IWUyxop2r79Nc9DFx17hzOekQ=;
        b=b5X8K1bZb9NQvrBDgWEG70H1ExXkhn+NX7bsQ4ecyaOAFsSu7Z4pYzGhFpwfew3uqn
         SC3O6CVPQf01MexS8kBxP9Dv4Wqxco9Jr0r1o5qzEO9CZEcsummyvOWNYuLHM45ypxzp
         HebonG6it0tkRt/q29lq/RM8uGbtBpSHxjqBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732887728; x=1733492528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSFitEdT2rCfLfdfH1IWUyxop2r79Nc9DFx17hzOekQ=;
        b=ZWd0rLCAhEXojcaoHJjDeuF3x2eu5dRFqC0qVBAOfPUUKP+x+Ay6bH4HnDVcwBN0v1
         hFbp8DEJRnbDsOxCSS2UoSsNOehaBTzIhUsV3oDO7AoTYO6uw9LA5U3v+Y5mqF8TrY0h
         XKvMVun5szYECgClcBEM29BWGZkrZ1/k1xclrf8GGrejFeXh2LhHxUaZjExLErGtauD5
         IsLauh0s7pHQx7WtaK85eXXnxX093u2WYxTSA70d31pdo0P3CLQsh6cQOJNE7k8u2JeN
         wjQWtP5K9mIGZhPRoB+3Wt/DiqxsSicyltvVXgFAbw1b4XOI+A89k7dhcQuU3d47Jjx3
         1JVg==
X-Forwarded-Encrypted: i=1; AJvYcCUqd8BvbIigyIYGeEdhnok/bxOP9lVX6dsBXKTWCJoccGMk+kr0b21K0jLV7OSsmZuY9a1gZGOipPFwWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0R8eTLm4js1M+IAncEepEsue0AJ2bYhsm9qxsiDRU4/JPrW4
	xCA7ajw1sYhNlJWdmKxKpLFEYnL6bM56UH1hQpt4ntsBaCm2ebSra+myQZHhyFHKLMmikt294jk
	=
X-Gm-Gg: ASbGncsz8M7chb5fqKUpoLAd3WhVT37gIUVzL3fELTJ+lkfF3dE3JvNlwNyh6+ekpfU
	eXtNEFsHjaG0cltBGBz2G+ZpyadQlyDKrZDJ0BmELKbhjWQIGZDlAqz9lhCMEb1hCivCiHPUr5Z
	I3ZQHjLz3a2BBwEirJ8Y1FD/dDAFjCkdrW24ezQSavpiHkbW4dsvXjvEQdWXSYqi71Jp/zAYl+y
	DxUvsHDO9ugzQEjpfo6XgDm+46ZuJe9OW5fEaAYLisDPfBxVJa+9AQXJ42ec//GZPYuOQJtMmHL
	49OlEf5Sjnqu
X-Google-Smtp-Source: AGHT+IGSnXTjzfwrnbceVwl0yfm0mmXQh2hdkfMbIjbEd6ZLv5jnFITwAPwfxXySwoNysgAzVeNSUw==
X-Received: by 2002:a05:6a21:3397:b0:1e0:bedf:5911 with SMTP id adf61e73a8af0-1e0e0ae8b97mr17078237637.22.1732887727347;
        Fri, 29 Nov 2024 05:42:07 -0800 (PST)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c3b6ee3sm3037388a12.85.2024.11.29.05.42.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 05:42:05 -0800 (PST)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ea8b039ddcso1348199a91.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 05:42:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRBMLLF5vU7HZJ0CV1yNs8GYahr10lZ5Gf6EaZ5+BZuHNmMTH/7yJX4BbXeob6cz0a9J7FarEwUgARpQ==@vger.kernel.org
X-Received: by 2002:a17:90b:35cb:b0:2ea:6f19:180b with SMTP id
 98e67ed59e1d1-2ee097cf0d5mr12912335a91.36.1732887724820; Fri, 29 Nov 2024
 05:42:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-2-510aab9570dd@chromium.org> <20241128222232.GF25731@pendragon.ideasonboard.com>
 <CANiDSCvyMbAffdyi7_TrA0tpjbHe3V_D_VkTKiW-fNDnwQfpGA@mail.gmail.com>
 <20241128223343.GH25731@pendragon.ideasonboard.com> <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
 <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
 <20241129110640.GB4108@pendragon.ideasonboard.com> <CANiDSCvdjioy-OgC+dHde2zHAAbyfN2+MAY+YsLNdUSawjQFHw@mail.gmail.com>
 <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl>
In-Reply-To: <e95b7d74-2c56-4f5a-a2f2-9c460d52fdb4@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 14:41:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
Message-ID: <CANiDSCvj4VVAcQOpR-u-BcnKA+2ifcuq_8ZML=BNOHT_55fBog@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 14:13, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 29/11/2024 12:54, Ricardo Ribalda wrote:
> > On Fri, 29 Nov 2024 at 12:06, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Fri, Nov 29, 2024 at 11:59:27AM +0100, Ricardo Ribalda wrote:
> >>> On Fri, 29 Nov 2024 at 11:36, Hans Verkuil wrote:
> >>>> On 28/11/2024 23:33, Laurent Pinchart wrote:
> >>>>> On Thu, Nov 28, 2024 at 11:28:29PM +0100, Ricardo Ribalda wrote:
> >>>>>> On Thu, 28 Nov 2024 at 23:22, Laurent Pinchart wrote:
> >>>>>>>
> >>>>>>> Hi Ricardo,
> >>>>>>>
> >>>>>>> (CC'ing Hans Verkuil)
> >>>>>>>
> >>>>>>> Thank you for the patch.
> >>>>>>>
> >>>>>>> On Wed, Nov 27, 2024 at 12:14:50PM +0000, Ricardo Ribalda wrote:
> >>>>>>>> If a file handle is waiting for a response from an async control, avoid
> >>>>>>>> that other file handle operate with it.
> >>>>>>>>
> >>>>>>>> Without this patch, the first file handle will never get the event
> >>>>>>>> associated with that operation, which can lead to endless loops in
> >>>>>>>> applications. Eg:
> >>>>>>>> If an application A wants to change the zoom and to know when the
> >>>>>>>> operation has completed:
> >>>>>>>> it will open the video node, subscribe to the zoom event, change the
> >>>>>>>> control and wait for zoom to finish.
> >>>>>>>> If before the zoom operation finishes, another application B changes
> >>>>>>>> the zoom, the first app A will loop forever.
> >>>>>>>
> >>>>>>> Hans, the V4L2 specification isn't very clear on this. I see pros and
> >>>>>>> cons for both behaviours, with a preference for the current behaviour,
> >>>>>>> as with this patch the control will remain busy until the file handle is
> >>>>>>> closed if the device doesn't send the control event for any reason. What
> >>>>>>> do you think ?
> >>>>>>
> >>>>>> Just one small clarification. The same file handler can change the
> >>>>>> value of the async control as many times as it wants, even if the
> >>>>>> operation has not finished.
> >>>>>>
> >>>>>> It will be other file handles that will get -EBUSY if they try to use
> >>>>>> an async control with an unfinished operation started by another fh.
> >>>>>
> >>>>> Yes, I should have been more precised. If the device doesn't send the
> >>>>> control event, then all other file handles will be prevented from
> >>>>> setting the control until the file handle that set it first gets closed.
> >>>>
> >>>> I think I need a bit more background here:
> >>>>
> >>>> First of all, what is an asynchronous control in UVC? I think that means
> >>>> you can set it, but it takes time for that operation to finish, so you
> >>>> get an event later when the operation is done. So zoom and similar operations
> >>>> are examples of that.
> >>>>
> >>>> And only when the operation finishes will the control event be sent, correct?
> >>>
> >>> You are correct.  This diagrams from the spec is more or less clear:
> >>> https://ibb.co/MDGn7F3
> >>>
> >>>> While the operation is ongoing, if you query the control value, is that reporting
> >>>> the current position or the final position?
> >>>
> >>> I'd expect hardware will return either the current position, the start
> >>> position or the final position. I could not find anything in the spec
> >>> that points in one direction or the others.
> >>
> >> Figure 2-21 in UVC 1.5 indicates that the device should STALL the
> >> GET_CUR and SET_CUR requests if a state change is in progress.
> >>
> >>> And in the driver I believe that we might have a bug handling this
> >>> case (will send a patch if I can confirm it)
> >>> the zoom is at 0 and you set it 10
> >>> if you read the value 2 times before the camera reaches value 10:
> >>> - First value will come from the hardware and the response will be cached
> >>
> >> Only if the control doesn't have the auto-update flag set, so it will be
> >> device-dependent. As GET_CUR should stall that's not really relevant,
> >> except for the fact that devices may not stall the request.
> >
> > I missed that the device will likely stall during async operations.
> >
> > What do you think of something like this? I believe it can work with
> > compliant and non compliant devices.
> > Note that the event will be received by the device that originated the
> > operation, not to the second one that might receive an error during
> > write/read.
> >
> >
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4fe26e82e3d1..9a86c912e7a2 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1826,14 +1826,15 @@ static int uvc_ctrl_commit_entity(struct
> > uvc_device *dev,
> >                         continue;
> >
> >                 /*
> > -                * Reset the loaded flag for auto-update controls that were
> > +                * Reset the loaded flag for auto-update controls and for
> > +                * asynchronous controls with pending operations, that were
> >                  * marked as loaded in uvc_ctrl_get/uvc_ctrl_set to prevent
> >                  * uvc_ctrl_get from using the cached value, and for write-only
> >                  * controls to prevent uvc_ctrl_set from setting bits not
> >                  * explicitly set by the user.
> >                  */
> >                 if (ctrl->info.flags & UVC_CTRL_FLAG_AUTO_UPDATE ||
> > -                   !(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR))
> > +                   !(ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR) || ctrl->handle)
> >                         ctrl->loaded = 0;
> >
> >                 if (!ctrl->dirty)
> > @@ -2046,8 +2047,18 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >         mapping->set(mapping, value,
> >                 uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
> >
> > -       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> > -               ctrl->handle = handle;
> > +       if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS) {
> > +               /*
> > +                * Other file handle is waiting for an operation on
> > +                * this asynchronous control. If the device is compliant
> > +                * this operation will fail.
> > +                *
> > +                * Do not replace the handle pointer, so the original file
> > +                * descriptor will get the completion event.
> > +                */
> > +               if (!ctrl->handle)
> > +                       ctrl->handle = handle;
>
> I don't think this is right: you want the completion event for async
> controls to go to all filehandles that are subscribed to that control.
>
> Which is what happens if handle == NULL (as I understand the code).
>
> Regards,

The code is correct, but the comment is not :). It should say:
 * Do not replace the handle pointer, or the originator of
 * the operation will receive an event.

The originar should NOT receive the event.
From uvc_ctrl_send_event():
/*
 * Send control change events to all subscribers for the @ctrl control. By
 * default the subscriber that generated the event, as identified by @handle,
 * is not notified unless it has set the V4L2_EVENT_SUB_FL_ALLOW_FEEDBACK flag.
 * @handle can be NULL for asynchronous events related to auto-update controls,
 * in which case all subscribers are notified.
 */



>
>         Hans
>
> > +       }
> >
> >         ctrl->dirty = 1;
> >         ctrl->modified = 1;
> >
> >>
> >>> - Second value will be the cached one
> >>>
> >>> now the camera  is at zoom 10
> >>> If you read the value, you will read the cached value
> >>>
> >>>> E.g.: the zoom control is at value 0 and I set it to 10, then I poll the zoom control
> >>>> value: will that report the intermediate values until it reaches 10? And when it is
> >>>> at 10, the control event is sent?
> >>>>
> >>>>>>>> Cc: stable@vger.kernel.org
> >>>>>>>> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> >>>>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>>>>>> ---
> >>>>>>>>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
> >>>>>>>>  1 file changed, 4 insertions(+)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> >>>>>>>> index b6af4ff92cbd..3f8ae35cb3bc 100644
> >>>>>>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> >>>>>>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> >>>>>>>> @@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >>>>>>>>       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> >>>>>>>>               return -EACCES;
> >>>>>>>>
> >>>>>>>> +     /* Other file handle is waiting a response from this async control. */
> >>>>>>>> +     if (ctrl->handle && ctrl->handle != handle)
> >>>>>>>> +             return -EBUSY;
> >>>>>>>> +
> >>>>>>>>       /* Clamp out of range values. */
> >>>>>>>>       switch (mapping->v4l2_type) {
> >>>>>>>>       case V4L2_CTRL_TYPE_INTEGER:
> >>
> >> --
> >> Regards,
> >>
> >> Laurent Pinchart
> >
> >
> >
>


-- 
Ricardo Ribalda

