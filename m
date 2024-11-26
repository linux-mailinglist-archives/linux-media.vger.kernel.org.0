Return-Path: <linux-media+bounces-22104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F4D9D9B51
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 17:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEBDD28283D
	for <lists+linux-media@lfdr.de>; Tue, 26 Nov 2024 16:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A181DA2E0;
	Tue, 26 Nov 2024 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eBTkB7MA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170CBE46
	for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732638156; cv=none; b=hsR4JdCHaj2X4yaFRjo0YfARWYRaTy22WMBUVXBOcY/7rZoHc6d4x3oOfTlsekKMckytyZEAcEsEQRynzxgjyU8VRAFXV1K4ywRHPLXxPBml8j6wqcNOFuDGWtTFl5JozhWVmMnGaBB4Wp2NRQyWU/bbvcmTx3P/bnitxLnUtQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732638156; c=relaxed/simple;
	bh=vWFkOWcgwAJv/P2pHxbB9fGdkWgCeOsfCf82LJlSkeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCgcsDhW2nOFNOk5dw6tuV+Nc0zizqkbbP3GOvOR022qPhLOym5lL2L5gF24F0Y9O9BqT6983fb5x9xtBM/vOgvGHW5ah+e+t/o8tMs1LbtVk9v3ftuXHD+ocDWc6+A0ySNZnyUDAt0eTPPBkCb3Xs+jVfgc/g1WIGaJj5TsiJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eBTkB7MA; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21278f3d547so44658445ad.1
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732638154; x=1733242954; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6RSzfcpNI+kLawT4M59dF46EWCQ5pC9Q0V0jBClbuUc=;
        b=eBTkB7MAtYbO3KLJ8TOY8v346yjT1d2R9bj+vQoWmlP2rjyq6tpQUSUwS3WexaEPVY
         DgWtAWYCQcZaLNTjX8sq8PNHplMbxzFaTgNdgOQEy8J7+BDz6VXsQQlSRR4jYxGo7oHh
         ydjahRJz1UVzlsZlf2+eewrVQxRO/AexeS/bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732638154; x=1733242954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RSzfcpNI+kLawT4M59dF46EWCQ5pC9Q0V0jBClbuUc=;
        b=oD3o0WxXZFIJzeNyH+riWQiO1EBmopu/d1E3LYFpBtBXBYcsA2SyOTURuskh2Nfi2v
         Y5YXe5i73I/tzqpskdzvZX7nh6AwBPcdVpe61vk5pZGwvEt2lZ1x7ysSPnDo/RcV5k0N
         4vMD3Q7u2Tjj1HbNPMk3TEzmX70bplDfzm/MSEWGIM2Db1TEqgIZyhpjZV3OE4BBVz+S
         OIIV3wS7SWUxvvQ/PI3l5EKAvpki3ZlSH4GZ4B8wd2jNeJRjUkZq5IuGLBLSqgAwuDdQ
         7naelr54//hYCRWev9XxNUiBS9EO/j4Jas+njDcobqMSZTqZT1gY5corR4e0/7Xzyrup
         zLMA==
X-Forwarded-Encrypted: i=1; AJvYcCWVX2nErWNHdgAP3Cz5YN77CkV8um9tCkvisn5NuYb/5lpI7rcxnXviuSWf4vxhmkc6SVTr34yzdqWPHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9WaM6qqU5uEtVH3WJPU72sE5kv1GYkBS24q4VpUhEjfPVaWpc
	8+JIcqBfbeV3fLBWPJjVc8R97SPg5ADL45u2AfZX7CMcPnpKu/c9YMjWC+GlJyAru110z7c+Lsk
	=
X-Gm-Gg: ASbGnctcjy6nT7scDZ8IbIJfB5rSCbMLTJB3ykJp7HHUl44t8ZJUlj559KIjDWYfPlK
	LiNyHzCGRPBW3WzjgDXV/i6hrCoVmfhPYRWIVz63F4VCFQrzLlvXVo89qieYkyxAkxzb2cQ1yGn
	XjM1a7/x8NgzBQsf1XCqBjXhEaMYUqSed8dIOZtqaj5n53jpDlX5Gz8NfKJwX5+MDtDkItC9AyW
	Q5io0E0+e/CubfrLOXiDFxVxBt2+a3p5MYDrVKjBHqN5opXTMZfp8eQDLSK33vfuH4DGUNaZT/U
	J1/v7nSWaZWW7dJT
X-Google-Smtp-Source: AGHT+IHPlIjlLZ/BdNNiUrdj17zO3nTr5v/74ZxppHLlsNY5OwPMmbnqiiNnr9f6guWeXRe+GXOY0w==
X-Received: by 2002:a17:902:ce8a:b0:211:e99c:833b with SMTP id d9443c01a7336-2129f760bd4mr242532915ad.13.1732638153869;
        Tue, 26 Nov 2024 08:22:33 -0800 (PST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8f754sm86287595ad.57.2024.11.26.08.22.32
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 08:22:32 -0800 (PST)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-724e1b08fc7so4076596b3a.0
        for <linux-media@vger.kernel.org>; Tue, 26 Nov 2024 08:22:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7+L2OLdwXSMFEVjQ/fcXgWmvslacX9tDcizFV0w3YvSF2ePMnpSm626VlT6e5EZfXUSBJ6KIXa4QyXA==@vger.kernel.org
X-Received: by 2002:a05:6a00:10c8:b0:71e:47a2:676 with SMTP id
 d2e1a72fcca58-724df5d58ffmr21457925b3a.6.1732638151671; Tue, 26 Nov 2024
 08:22:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <5b5f3bb7-7933-4861-be81-30345e333395@redhat.com> <CANiDSCta62P5+1aR9Ks8c6sd3_grCV3C+Le=UjKGkiohyf0R2g@mail.gmail.com>
 <55c76c99-dc86-41b2-84c6-d2e844530f67@redhat.com> <CANiDSCtvLB=tWb7ZCFCw9gn26R2xHnOf=yTLj+M_4AuQKYvgOQ@mail.gmail.com>
 <9779fcb0-e28d-4651-b04c-ca492e30c452@redhat.com>
In-Reply-To: <9779fcb0-e28d-4651-b04c-ca492e30c452@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 26 Nov 2024 17:22:20 +0100
X-Gmail-Original-Message-ID: <CANiDSCsY_uCRyO2NAmxob12=DSa3h+CXg_MaMWLrjMFz1_Ru-g@mail.gmail.com>
Message-ID: <CANiDSCsY_uCRyO2NAmxob12=DSa3h+CXg_MaMWLrjMFz1_Ru-g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a subdevice
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi

On Mon, 25 Nov 2024 at 15:02, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo,
>
> On 25-Nov-24 2:39 PM, Ricardo Ribalda wrote:
> > On Mon, 25 Nov 2024 at 13:25, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi Ricardo,
> >>
> >> On 9-Nov-24 5:29 PM, Ricardo Ribalda wrote:
> >>
> >> <snip>
> >>
> >>>> I have been discussing UVC power-management with Laurent, also
> >>>> related to power-consumption issues caused by libcamera's pipeline
> >>>> handler holding open the /dev/video# node as long as the camera
> >>>> manager object exists.
> >>
> >> <snip>
> >>
> >>>> Here is what I have in mind for this:
> >>>>
> >>>> 1. Assume that the results of trying a specific fmt do not change over time.
> >>>>
> >>>> 2. Only allow userspace to request fmts which match one of the enum-fmts ->
> >>>>    enum-frame-sizes -> enum-frame-rates tripplet results
> >>>>    (constrain what userspace requests to these)
> >>>>
> >>>> 3. Run the equivalent of tryfmt on all possible combinations (so the usaul
> >>>>    3 levels nested loop for this) on probe() and cache the results
> >>>>
> >>>> 4. Make try_fmt / set_fmt not poweron the device but instead constrain
> >>>>    the requested fmt to one from our cached fmts
> >>>>
> >>>> 5. On stream-on do the actual power-on + set-fmt + verify that we get
> >>>>    what we expect based on the cache, and otherwise return -EIO.
> >>>
> >>> Can we start powering up the device during try/set fmt and then
> >>> implement the format caching as an improvement?
> >>
> >> Yes, actually looking at how complex this is when e.g. also taking
> >> controls into account I think that taking small steps is a good idea.
> >>
> >> I have lately mostly been working on sensor drivers where delaying
> >> applying format settings + all controls to stream-on is normal.
> >>
> >> So that is the mental model I'm applying to uvc here, but that might
> >> not be entirely applicable.
> >>
> >>> Laurent mentioned that some cameras missbehave if a lot of controls
> >>> are set during probing. I hope that this approach does not trigger
> >>> those, and if it does it would be easier to revert if we do the work
> >>> in two steps.
> >>
> >> Ack, taking small steps sounds like a good plan.
> >>
> >> <snip>
> >>
> >>>> This should also make camera enumeration faster for apps, since
> >>>> most apps / frameworks do the whole 3 levels nested loop for this
> >>>> on startup, for which atm we go out to the hw, which now instead
> >>>> will come from the fmts cache and thus will be much much faster,
> >>>> so this should lead to a noticeable speedup for apps accessing UVC
> >>>> cameras which would be another nice win.
> >>>>
> >>>> Downside is that the initial probe will take longer see we do
> >>>> all the tryfmt-s there now. But I think that taking a bit longer
> >>>> to probe while the machine is booting should not be an issue.
> >>>
> >>> How do you pretend to handle the controls? Do you plan to power-up the
> >>> device during s_ctrl() or set them only during streamon()?
> >>> If we power-up the device during s_ctrl we need to take care of the
> >>> asynchronous controls (typically pan/tilt/zoom), The device must be
> >>> powered until the control finishes, and the device might never reply
> >>> control_done if the firmware is not properly implemented.
> >>> If we set the controls only during streamon, we will break some
> >>> usecases. There are some video conferencing equipment that do homing
> >>> during streamoff. That will be a serious API breakage.
> >>
> >> How to handle controls is a good idea.
> >>
> >> Based on my sensor experience my initial idea was to just cache them
> >> all. Basically make set_ctrl succeed but do not actually do anyhing
> >> when the camera is not already powered on and then on stream-on call
> >> __v4l2_ctrl_handler_setup() to get all current values applied.
> >>
> >> But as you indicate that will likely not work well with async controls,
> >> although we already have this issue when using v4l2-ctl from the cmdline
> >> on such a control and that seems to work fine.
> >
> > -----
> >> Just because we allow
> >> the USB connection to sleep, does not mean that the camera cannot finish
> >> doing applying the async control.
> >>
> > Not sure what you mean with this sentence. Could you explain it
> > differently? Sorry
> >
> >> But I can see how some cameras might not like this and having 2 different
> >> paths for different controls also is undesirable.
> >>
> >> Combine that with what Laurent said about devices not liking it when
> >> you set too much controls in a short time and I do think we need to
> >> immediately apply ctrls.
> >>
> >> I see 2 ways of doing that:
> >>
> >> 1. Use pm_runtime_set_autosuspend_delay() with a delay of say 1 second
> >> and then on set_ctrl do a pm_runtime_get_sync() +
> >> pm_runtime_put_autosuspend() giving the camera 1 second to finish
> >> applying the async ctrl (which might not be enough for e.g homing) +
> >> also avoid doing suspend + resume all the time if multiple ctrls are send
> >
> > What about 1.5:
> >
> > during s_ctrl():
> > usb_autopm_get_interface()
> > if the control is UVC_CTRL_FLAG_ASYNCHRONOUS.
> >        usb_autopm_get_interface()
> > set the actual control in the hardware
> > usb_autopm_put_interface()
> >
> > during uvc_ctrl_status_event():
> >    usb_autopm_put_interface()
>
> How do we match this to the usb_autopm_get_interface()
> call ? At a minimum we would need some counter to
> track pending (not acked through status interrupt urb)
> async control requests and only do the put() if that
> counter >= 1 (and then decrease the counter).
>
> We don't want to do unbalanced puts here in case of
> buggy cameras sending unexpected / too many
> ctrl status events.
>
> > during close():
> >    send all the missing usb_autopm_put_interface()
>
> Except for my one remark this is an interesting
> proposal.

I have just upload a patchset implementing this. I tried
v4l2-compliance and using the camera app.

I think it looks promissing

Shall we move the discussion there?

https://lore.kernel.org/linux-media/20241126-uvc-granpower-ng-v1-0-6312bf26549c@chromium.org/T/#t


>
> Maybe also do a dev_warn() if there are missing
> usb_autopm_put_interface() calls pending on close() ?
>
> > This way:
> > - we do not have an artificial delay that might not work for all the use cases
> > - cameras with noncompliant async controls will have the same PM
> > behaviour as now  (will be powered on until close() )
> >
> > We do the same with the rest of the actions that require hardware access, like:
> > https://lore.kernel.org/linux-media/20220920-resend-powersave-v5-2-692e6df6c1e2@chromium.org/
> >
> > This way:
> > - Apps that do not need to access the hardware, do not wake it up, and
> > we do not break usecases.
> >
> > Next steps will be:
> >  - cache the formats
> >  - move the actual set_ctrl to streamon... but if we can do that I
> > would argue than we can move completely to the control framework.
>
> Right I had forgotten that the UVC driver does not use the control
> framework. I think moving to that would be a prerequisite for moving
> the set_ctrl to stream_on.
>
> Regards,
>
> Hans
>


--
Ricardo Ribalda

