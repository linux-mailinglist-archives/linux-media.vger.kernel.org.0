Return-Path: <linux-media+bounces-22321-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D19DC270
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21E2164B35
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 10:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6580C1990C1;
	Fri, 29 Nov 2024 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="doOynHnx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1119884C
	for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732877984; cv=none; b=qT6n6kYUWonQ9IdlpWTh3AaqwwahZE/d5VXFyau4KcPUCR0dH6ZqM3KsIA0vdBnEvZnqZypMS8R+rebSaMl9HWyzDSysA1VYJcrzbsPl1JGKiBjkDA2nyf/rMh31ckB0dwau4TIAa5KU2OgXiJim1/7TGyq08xdBShnYnmR4kuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732877984; c=relaxed/simple;
	bh=LvK9ek1qytL/0nRFg8sPALh26iCrGrpMHaJkB3WI40c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwQDr0tX3pxjIdKmXbY/j1sikks1nWVH9iwin+25b8yTUvC/FYvHHOhVib3yabEaSpJSg1z21Hnwv6NSYWSMlTl88kWE+6DoQCFRRo/fjIsSNzxyWbXrewr8mF2R4JzmTYDqblT5/9RsyY3f1Q/rwgmzPPdDXQLlhJ83rDto6EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=doOynHnx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-212776d6449so16281045ad.1
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 02:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732877981; x=1733482781; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDjy0MV4148joBtQzxlgNjU2q8U1MtS3upsI0Kv1yqg=;
        b=doOynHnx/XTR/ellalePOVu9++vbWkm9dkPJOWvhkaykIgcBHG+FvfS2LtfWP0Cown
         50EI51/FKhId73hd8mm565cyLb/KjeCejAI/kRvyAtgVxs/dPKReaE1l4YRE1KkjbQDE
         VvQZAj5ih61H26CohodOLgpdMLO6GuRghQabE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732877981; x=1733482781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDjy0MV4148joBtQzxlgNjU2q8U1MtS3upsI0Kv1yqg=;
        b=I3a3ScKjQGcNzQAm3Ya6nvLEHKubz60ed+1A6Unvz5tSvV4IXOTC97rVSgDxkRu8Na
         DuGZdYXEeIn7wJUMHsziV5oE/TKBzsr+CV9i5EsTsrtbR2Zix/lY6ngdyXd1DWHSABL9
         IYecC7gINgwWydWjorQ8GlkvAIjd6ayOVLcsoextwNhas3esHhP4fosez9nlnR8rX2VA
         rFevIHPjMgffP0nU4rsVPKyr+zJLzsoI95B03pzGFemkehjs0KIEXKV9hNCKD6BMQguE
         WnOytrZBfamO+iAweroZDB0sDea8BPlIOYLsZNLNc6G71HN1Tq1o6CXItDDp2qOoesK+
         LVVA==
X-Forwarded-Encrypted: i=1; AJvYcCUqm8fFeDlIiqcySQgOkM8N7wYIm9mWTk0hweY1xl3qKlxRuBgJhJa7riRQ8BEHsOq3eMqk0KSg57C0mw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/K/t/zFtUCq3tPqGYQl65Gkvujk1AUqlXAOdtEIxkIggHj1hi
	pQl49bdMYt3ko7C2kYQ3G/YlkCwym72xHwxfKuf5Fb0p95Qyc4mF9jZm3KVu5Q4MxXLadibp8aw
	=
X-Gm-Gg: ASbGncthmrH60kFeX6Oa+ynpKtb0nYdZULvy11ZIfYNNreq3kFF5aU+ILO+xK0PROvh
	9OxTozL1ZFTP1BJYEZsS83n9dV/2q6Ky/wkzypSJj8t39YtTYhhJ1QMn0W1FhwYpg4ctYVSZsrm
	+294rfbG9+LfKgHRLS+79GroCRCfaEDsyrNHwRUAF6G7Cw8u2wZl7SqT3PzhUPBYzbiPpmcZkaT
	ELMTlCDtE9jIG2DyF0GcXKcRmVmytF51Aw0faADeqK26yUcCgXnr7VGCf5fSUbxsmVBFKgnty79
	MBzsenoS5KHC95Sp
X-Google-Smtp-Source: AGHT+IF18dxFWg65uh0TgTtwM5TzcMq91MFiDOt4EUoDquGWD64jjsuCo+81tcspfA0E8/DlRT5l0g==
X-Received: by 2002:a17:902:db0e:b0:20b:861a:25c7 with SMTP id d9443c01a7336-21501e5afa8mr147582365ad.54.1732877981273;
        Fri, 29 Nov 2024 02:59:41 -0800 (PST)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521906561sm28247925ad.61.2024.11.29.02.59.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 02:59:40 -0800 (PST)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2126408cf31so11062435ad.0
        for <linux-media@vger.kernel.org>; Fri, 29 Nov 2024 02:59:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0ibbaKsTTi8HVJYgkk/HNhpyUTauUSxfsBNdNQE+EEB9tjY60M67MxepeMCUcUoeonn/DO7TB8u26zw==@vger.kernel.org
X-Received: by 2002:a17:90b:38cd:b0:2ea:addc:9f51 with SMTP id
 98e67ed59e1d1-2ee08e5e3e0mr13083763a91.2.1732877979790; Fri, 29 Nov 2024
 02:59:39 -0800 (PST)
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
In-Reply-To: <7eeab6bd-ce02-41a6-bcc1-7c2750ce0359@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 29 Nov 2024 11:59:27 +0100
X-Gmail-Original-Message-ID: <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
Message-ID: <CANiDSCseF3fsufMc-Ovoy-bQH85PqfKDM+zmfoisLw+Kq1biAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] media: uvcvideo: Do not set an async control owned
 by other fh
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Nov 2024 at 11:36, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Laurent, Ricardo,
>
> On 28/11/2024 23:33, Laurent Pinchart wrote:
> > On Thu, Nov 28, 2024 at 11:28:29PM +0100, Ricardo Ribalda wrote:
> >> On Thu, 28 Nov 2024 at 23:22, Laurent Pinchart wrote:
> >>>
> >>> Hi Ricardo,
> >>>
> >>> (CC'ing Hans Verkuil)
> >>>
> >>> Thank you for the patch.
> >>>
> >>> On Wed, Nov 27, 2024 at 12:14:50PM +0000, Ricardo Ribalda wrote:
> >>>> If a file handle is waiting for a response from an async control, avoid
> >>>> that other file handle operate with it.
> >>>>
> >>>> Without this patch, the first file handle will never get the event
> >>>> associated with that operation, which can lead to endless loops in
> >>>> applications. Eg:
> >>>> If an application A wants to change the zoom and to know when the
> >>>> operation has completed:
> >>>> it will open the video node, subscribe to the zoom event, change the
> >>>> control and wait for zoom to finish.
> >>>> If before the zoom operation finishes, another application B changes
> >>>> the zoom, the first app A will loop forever.
> >>>
> >>> Hans, the V4L2 specification isn't very clear on this. I see pros and
> >>> cons for both behaviours, with a preference for the current behaviour,
> >>> as with this patch the control will remain busy until the file handle is
> >>> closed if the device doesn't send the control event for any reason. What
> >>> do you think ?
> >>
> >> Just one small clarification. The same file handler can change the
> >> value of the async control as many times as it wants, even if the
> >> operation has not finished.
> >>
> >> It will be other file handles that will get -EBUSY if they try to use
> >> an async control with an unfinished operation started by another fh.
> >
> > Yes, I should have been more precised. If the device doesn't send the
> > control event, then all other file handles will be prevented from
> > setting the control until the file handle that set it first gets closed.
>
> I think I need a bit more background here:
>
> First of all, what is an asynchronous control in UVC? I think that means
> you can set it, but it takes time for that operation to finish, so you
> get an event later when the operation is done. So zoom and similar operations
> are examples of that.
>
> And only when the operation finishes will the control event be sent, correct?

You are correct.  This diagrams from the spec is more or less clear:
https://ibb.co/MDGn7F3

>
> While the operation is ongoing, if you query the control value, is that reporting
> the current position or the final position?

I'd expect hardware will return either the current position, the start
position or the final position. I could not find anything in the spec
that points in one direction or the others.

And in the driver I believe that we might have a bug handling this
case (will send a patch if I can confirm it)
the zoom is at 0 and you set it 10
if you read the value 2 times before the camera reaches value 10:
- First value will come from the hardware and the response will be cached
- Second value will be the cached one

now the camera  is at zoom 10
If you read the value, you will read the cached value


>
> E.g.: the zoom control is at value 0 and I set it to 10, then I poll the zoom control
> value: will that report the intermediate values until it reaches 10? And when it is
> at 10, the control event is sent?
>
> Regards,
>
>         Hans
>
> >
> >>>> Cc: stable@vger.kernel.org
> >>>> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> >>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>>> ---
> >>>>  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++++
> >>>>  1 file changed, 4 insertions(+)
> >>>>
> >>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> index b6af4ff92cbd..3f8ae35cb3bc 100644
> >>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> >>>> @@ -1955,6 +1955,10 @@ int uvc_ctrl_set(struct uvc_fh *handle,
> >>>>       if (!(ctrl->info.flags & UVC_CTRL_FLAG_SET_CUR))
> >>>>               return -EACCES;
> >>>>
> >>>> +     /* Other file handle is waiting a response from this async control. */
> >>>> +     if (ctrl->handle && ctrl->handle != handle)
> >>>> +             return -EBUSY;
> >>>> +
> >>>>       /* Clamp out of range values. */
> >>>>       switch (mapping->v4l2_type) {
> >>>>       case V4L2_CTRL_TYPE_INTEGER:
> >
>


-- 
Ricardo Ribalda

