Return-Path: <linux-media+bounces-21332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4B99C5F1D
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 18:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AA1C281D71
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 17:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89918219E48;
	Tue, 12 Nov 2024 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VlqhZfrh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E5219E2E
	for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731432688; cv=none; b=k/tjc9ygMmWulU5304r97pUSqBKSEm0ues9XsdE4EUlns5tuNvHgksgSY5fQ36ZRTKlx4ENQKvcUAqtC/xmmlam+ohcy7+HwpVaeKOHJcVOSfy6UJczjpvKgJjhNxv1c6/J8p1VNydTZWOKE+x/smXVT9MTb6oQDDIInXeK3xVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731432688; c=relaxed/simple;
	bh=ycVEup3OHbZpb8QT5+l0bFBNjeJ1pj3efCUYGy/ltCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkWx4HMzOPeCbqQmoYN6h/4sG+RmyHb1wzxMIjrD8kc2FaMKWoX6uHvONiFGrIBlIa2lfuBFpzwWszX59Ft0LEBClOBSU88oGduFecB8LdL0Sl0KLD/Y67tVB1Kqqu0EZfu6fj85fjbozeRIFANTS0hnCU1N7YlQ0No6xjuxTXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VlqhZfrh; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so4620025a91.2
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731432686; x=1732037486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fI0dnkfI30Hz4AiV9HLb+qwYWhV2B4MukkmqKKi0GYY=;
        b=VlqhZfrhYQKwkB7m7BkO27w4ImsV5vLUNSKz6odStlMYTID38Lq3wYkyv+FVPoAYJk
         hSuRHYyYD+Zg6EsyxBABKsiwZTu9DPKkrVrJqHEvzmq5xcXM9w+2Qd93v0X3ltDheUr2
         ytnni6c0kxKIvYiEb2L2/WfXnv3VHbESs6ccw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731432686; x=1732037486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fI0dnkfI30Hz4AiV9HLb+qwYWhV2B4MukkmqKKi0GYY=;
        b=XqL55qcUwZ1kp0e+Llny2qttMQDXS2AD9KxxSB/j1cbX7irwtsolmFQeAGcH/Rt+Hs
         5SLFEWtI8E3bCf5WYrtGY9atVbkj77v+GBXF4s+V8xza/kSDnRivWlHGmf6GLXredu58
         dYjIyV7U1U97cBnmOD6WsAN33wdrc9whL5Je1cVhpWdLOdDC600YXs1c7qBfQdJelI5k
         0Pnu2nPOQM0TZWjzGaujGeLBxVVzYQ0icWqnj49rfZkaCeOV2ZLAWka8xyvhPD0hV1BN
         2BUiwm0gi2ZkFE4Po4v2Jsc7caAmHvz0yRyTpnubB4Xr3E5n0/3+jWKxz3S8qqRAcYVC
         hEZw==
X-Forwarded-Encrypted: i=1; AJvYcCXJFJOWdvUGeoKGPr88RMo9j21+T5twdV0g5qTt7fXvsGKwpkAnf2X2Dv4wshpThgCGNTqfhTawf2pHTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdKR3YY3TDh7bgFR5cLSkcvIxWhJy7nrTllsrgK1itYyiv7bM
	3AxNEGg7Mq193m/B1ot96xXidMARVRFuO0Lq4PYW+PQD/9P+flLwwKEyZilfegNiqeOSktz37rM
	=
X-Google-Smtp-Source: AGHT+IF1Kf8tlJz35rjIyn5gRSqP1rIuDJN8I2cyt/Hvk8xYmLtkcIkiXuuzIw6eaHWEq2jxIRBYNw==
X-Received: by 2002:a17:90b:43:b0:2d8:e524:797b with SMTP id 98e67ed59e1d1-2e9e4bed427mr4779669a91.18.1731432685856;
        Tue, 12 Nov 2024 09:31:25 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e6c368sm96778265ad.240.2024.11.12.09.31.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 09:31:25 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e9b4a5862fso3390390a91.1
        for <linux-media@vger.kernel.org>; Tue, 12 Nov 2024 09:31:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNjSfeKT8yYOkc1Y1yESxum61QGVPqKZfskDuSIqTY37lKPXLy1ze/kO28wkc3ETu4Lp2UYe+cvYEeaw==@vger.kernel.org
X-Received: by 2002:a17:90b:3e8c:b0:2e0:cac6:15f7 with SMTP id
 98e67ed59e1d1-2e9e4930710mr4676383a91.0.1731432684259; Tue, 12 Nov 2024
 09:31:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org> <a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com>
In-Reply-To: <a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 12 Nov 2024 18:31:11 +0100
X-Gmail-Original-Message-ID: <CANiDSCtecYwfzSGDOHAtkdSrDb5WjtxAQMikH=tLPqngGXbBkw@mail.gmail.com>
Message-ID: <CANiDSCtecYwfzSGDOHAtkdSrDb5WjtxAQMikH=tLPqngGXbBkw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a subdevice
To: Hans de Goede <hdegoede@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Yunke Cao <yunkec@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Mon, 11 Nov 2024 at 13:59, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Ricardo, Et al.,
>
> On 8-Nov-24 9:25 PM, Ricardo Ribalda wrote:
> > Some notebooks have a button to disable the camera (not to be mistaken
> > with the mechanical cover). This is a standard GPIO linked to the
> > camera via the ACPI table.
> >
> > 4 years ago we added support for this button in UVC via the Privacy control.
> > This has two issues:
> > - If the camera has its own privacy control, it will be masked
> > - We need to power-up the camera to read the privacy control gpio.
>
> Thinking more about this I think we need to start with looking at the userspace
> API for privacy controls, define how we want that to look and then go from
> there.
>
> The reason I'm writing this is because due to my work in drivers/platform/x86
> (pdx86) on EC / ACPI / WMI drivers for non chromebooks I am aware of at least
> 4 different methods camera on/off (aka privacy) toggles are being reported
> to userspace at the moment. Adding a v4l2-ctrl on a subdev instead of directly
> on /dev/video# would be adding a 5th method which seems highly undesirable.
>
> Instead I would like to first focus on fixing these userspace API
> inconsistencies agreeing on a single API we want to use everywhere
> going forward. We don't need to fix all drivers at once, but IMHO we
> should agree on what the API should look like and document that and
> any future drivers implementing camera privacy control related code
> then must use the new API.
>
> Lets start with the 3 APIs I'm currently aware of:
>
> 1. uvcvideo driver exporting V4L2_CID_PRIVACY on /dev/video#
> uvcvideo seems to be the only user of this CID (i)
>
> 2. pdx86 drivers exporting an input evdev with EV_SW,
> SW_CAMERA_LENS_COVER. This is somewhat of a special case
> for some Dell laptops with an electro-mechanical shutter
> operated by the EC. But this is not also used by
> hp-wmi.c where it does not necessarily indicate the
> status of a mechanical cover, but also possibly simply
> disconnecting the camera from the USB bus.
>
> 3. pdx86 drivers exporting an input evdev with EV_KEY,
> KEY_CAMERA_ACCESS_ENABLE, KEY_CAMERA_ACCESS_DISABLE
> These KEY codes are based on offical the HUTRR72 HID/HUT
> extension and as such may also be send by USB/I2C/BT HID
> devices.
>
> The only user outside of hid-input.c is the recently added
> drivers/platform/x86/lenovo-wmi-camera.c driver and I'm
> wondering if that should not use SW_CAMERA_LENS_COVER
> instead. I'll ask the driver author about how this
>
> 4. pdx86 drivers exporting an input evdev with EV_KEY,
> KEY_CAMERA. Note this 4th method lacks information on if
> the camera was enabled or disabled. In many cases this
> is send to indicate that the EC has either dropped
> a UVC camera of the bus, or added it to the bus.
> Ideally we would have some helper checking for internal
> UVC camera presence and turn this into 2 or 3.
>
> TL;DR: it a mess.
>
> Circling back to this patch-set, note how 3 of the 4
> currently in use variants today use in input evdev.
>
> I think that using an input evdev (shared with the
> snapshot button if present) will give us a nice out for
> the power-management issue with the V4L2_CID_PRIVACY,
> while at the same time giving a nice opportunity to
> standardize on a single userspace API.
>
> My proposal would be to standardize on SW_CAMERA_LENS_COVER
> I realize that the GPIO does not always indicate a lens
> cover, but the resulting black frames are the same result
> as if there were a lens cover and looking at:
>
> https://support.hp.com/ie-en/document/ish_3960099-3335046-16
>
> and then the second picture when expanding "Locate and use
> the webcam privacy switch" that does look like it may be
> an actual cover which reports back its state through a GPIO.
>
> The reason why I'm not in favor of using
> KEY_CAMERA_ACCESS_ENABLE + KEY_CAMERA_ACCESS_DISABLE is that
> looking at the HUTRR72 it talks about:
> "Enables programmatic access to camera device"
> which suggests that it is a request to the OS / desktop-
> environment to block camera access at the software level,
> rather then reporting back that a hw-level block is in place.
>
> And since these may be used by any HID device we are not of
> control in how these will be used.
>
> Ricardo, what do you think of instead of using a v4l-subdev,
> using an input evdev (shared with the existing one) reporting
> SW_CAMERA_LENS_COVER ?  The v4l-subdev approach will need
> userspace changes anyways and if we are going to make userspace
> changes we might as well use the best API available.

I just sent a patchset using SW_CAMERA_LENS_COVER

I guess the internal uvc privacy (UVC_CT_PRIVACY_CONTROL) shall NOT be
converted to evdev:
- If we do so, we cannot differentiate external gpio and internal, for
devices that have both
- There is no warranty that we will get a uvc_event when the control
changes, so we would have to constantly poll the device

Regards!



>
> One downside of going the evdev route is that it is a bit
> harder for userspace to map the evdev to a camera:
>
> 1. For the various WMI interfaces this already is impossible,
> and just to show a notification it is not necessary (using
> an external cam will make things weird though).
>
> 2. For UVC cameras mapping the evdev to the /dev/video#
> node can still be done by looking if they share a parent
> USB interface. This is e.g. already done in apps like
> xawtv looking at the PCI parent to pair up /dev/video#
> for video capture with the ALSA interface exposed for
> sound by bttv cards.
>
> 3. We can maybe do something at the media-controller
> level to help userspace linking a camera to its evdev node.
> This would also be helpful for the existing WMI interfaces.
>
> Regards,
>
> Hans
>
>
>
> i) With the exception of drivers/media/pci/intel/ivsc/mei_csi.c
> which has a V4L2_CID_PRIVACY control which always reads 0, so
> I guess we can / should probably drop that.
>
>
>
> p.s.
>
> I do plan to also get back to you on the actually powermanagement
> discussion. But only so many hours in a day, so it will probably
> be a couple of days.
>
>


--
Ricardo Ribalda

