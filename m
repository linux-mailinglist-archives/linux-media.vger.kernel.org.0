Return-Path: <linux-media+bounces-48535-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CD5CB21A4
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 07:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3290A300A287
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 06:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6E0311C3B;
	Wed, 10 Dec 2025 06:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ia85/TRk"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514FF1F584C
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 06:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765348871; cv=none; b=rf/Yrlja54wnXPfopyoJkGxwzhXJPElDbi+4l2B0g+A1EnsO75SO4iE+T+FuD2uxTzI2o6q51sPkIZEUKjXsFcHOAcVg698CJFx5zlhDHXIniRCu8aTrZZteXNephYBg3hfjT1bJCfBSXtzafFaYYdaKES9XfW6UITeX3fT5PyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765348871; c=relaxed/simple;
	bh=l0y1EtpDQDcSRi7FywXxflPf4vaeqK2pwN4wBxYg2Rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYL7U5rJA99DqvM6tFtQO+Buz53fRgQ5zvZiIbR8d9SnsubvnFhujhhwtvRYOsx7f9hdOYwq4HbwMw4tkIpVGQBc7AoRuBM2Q/v41hlqUBIYiPzzb0pmav3UEdwzL0eI01yja6HKjjMP1WpnLzCWEPxYiEA/u06IiLfZSzcfn4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ia85/TRk; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-597d712c0a7so6884297e87.0
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 22:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765348867; x=1765953667; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RlkNBsTMw0ANtnYwsyyj4mRPTKKhKH2KSoBXwAsQME0=;
        b=Ia85/TRk1Pn1zJtF8tZevrjorxUkg1glGX0PRgQ8BKQWBQVbUU3ixzJioCufDACs38
         923S0Qg60rezwTi/K4f2O910jdI2nQKnnDDTYHb/Ut7BUhL2NiXT2L0N2B9ZyvR/iwgj
         xF3MPpPXTnG3be/Ub5Sd9TX7d0s0QC04lHbNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765348867; x=1765953667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlkNBsTMw0ANtnYwsyyj4mRPTKKhKH2KSoBXwAsQME0=;
        b=Fk0Yd9xsi5FkNrItp/KWGFsOmlqyOv1sen4rgkjpZOj51PUh+3X0IE4owCN2ylwo8f
         M6NNJUrzGCB/6srLm2kx7xlJ2CeObqZQoc8UYtur+faQtmdDCH1vNwr1vOPPHXtbIRRf
         Qz+h3U/t+m5VdO8skGPPpNq8qS/IdWCXHF4X6JpNgzzUpZw2FHFZVGWHHCX3uioQp+Rz
         W3dSEz57h6xBkO23yTpogblYvbxV9ZDsDu0bcdBCAQf3UsLFD46OzvwBD08fTPVB0wDz
         ZdkZH5LP8Bxy2s6P+8+HNuTG9jZoKa3e0AXps2z8SiUI3hU6S4Ke3q3zvQWS+tNyKo+g
         2CBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwSTTMcb2TBT3iqZqg+2WorHifcB1jMROlY7/b4BRN76227XPgk8o92u8rbhjZyMuxmM2C01mNCYffHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy71pTwNlBAESLHVVvOtKWxQJ7tGWc1479bFBlsYyr1PSa7REK6
	JNhBXcGDbbPR+30iQN8OYRbZ9KOvMLcW8ApjbfwpQY85r3BqoipekxJRZMrhWaA1CfDvLQ11Vvb
	7mEPwog==
X-Gm-Gg: AY/fxX5I4KlCqWyZFk72RB32+lwErcHZRXTPgy4feEd/gLPHK/WZVKLBp5OMV6YVQ+3
	qJN0/eCNimCy24pJe31LSlYsSc5Thodkud/N976tnMLDu82E7ERaojTf3PUeXImyo/vsJeAgmv5
	NHMPKJFLpGOACj5RB8MB1Ewne2iwu2pzWgnv4tPKpt9q66bKblZxEL3psN/YXgAd7SOxEFIJK4m
	gck5H05nDPMCgkCZi1NAtczm50oC4YFuCJUVDFFSGhA+CpJi3KuSkk2XgeiMa6Y6Z/BsexRD+p5
	lWz0zkg1EJ3YoaPpSV7zg3hSnYWn30C2XtCupySJORDlIQqTrxbV1Z2uGdC+eIWLXdFJJ4lRxCD
	wSsKtzwgCwZOtR1k0gPlDSLZDaOVq/+uKn1iTpleBMQdnEmiBQgeUAVwZkJfo3TGBbO8KUo1P3H
	826UoQj9j3wj7MzgnYuim9EulEw3Roy/Z9UJue0B2ihkt1oDgp
X-Google-Smtp-Source: AGHT+IEVoJHlXB7lbiHDBlGGQxpwJTdgAHT+XFEbqqCWHMZmXDsH1EZyfDonej7sEWbsCoIJyrLxJQ==
X-Received: by 2002:a05:6512:4022:b0:595:7a6c:7db4 with SMTP id 2adb3069b0e04-598ee4daf55mr568861e87.4.1765348866872;
        Tue, 09 Dec 2025 22:41:06 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e3b3sm6107663e87.55.2025.12.09.22.41.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:41:04 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-594330147efso7110082e87.2
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 22:41:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUlE9FunqrXlpvJx4k9asxrPnZexOlat0EN6y2Rot6eCttl7AKcMhGy4DI+kRa9LaAEFVVe+kwq4DRPZA==@vger.kernel.org
X-Received: by 2002:a05:6512:b88:b0:594:248d:afa7 with SMTP id
 2adb3069b0e04-598ee4e62f6mr513448e87.13.1765348863446; Tue, 09 Dec 2025
 22:41:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
 <20251119-uvcdynctrl-v2-5-0359ffb98c9e@chromium.org> <448fb5ce-f369-4796-b29b-ae03c1314b3a@kernel.org>
In-Reply-To: <448fb5ce-f369-4796-b29b-ae03c1314b3a@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Dec 2025 15:40:50 +0900
X-Gmail-Original-Message-ID: <CANiDSCsAY+UAvE77esA65e-b3aWrrv63wQ9KwtPBF_aH_MAcjA@mail.gmail.com>
X-Gm-Features: AQt7F2p9B9ulZdO8Xxd7IHjTKVCFFmfzPdQROCwZvniqGysPX_fW6p1uze9cyX4
Message-ID: <CANiDSCsAY+UAvE77esA65e-b3aWrrv63wQ9KwtPBF_aH_MAcjA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] media: uvcvideo: Introduce allow_privacy_override param
To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Dec 2025 at 20:58, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 19-Nov-25 8:37 PM, Ricardo Ribalda wrote:
> > Some camera modules have XU controls that can configure the behaviour of
> > the privacy LED.
> >
> > Block mapping of those controls, unless the module is configured with
> > a new parameter: allow_privacy_override.
> >
> > This is just an interim solution. Based on the users feedback, we will
> > either put the privacy controls behind a CONFIG option, or completely
> > block them.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c   | 38 ++++++++++++++++++++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_driver.c | 20 ++++++++++++++++++++
> >  drivers/media/usb/uvc/uvc_v4l2.c   |  7 +++++++
> >  drivers/media/usb/uvc/uvcvideo.h   |  2 ++
> >  include/linux/usb/uvc.h            |  4 ++++
> >  5 files changed, 71 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 57ce486f22bbc404a1f127539eb2d12373431631..d9cbb942f798dc7138608982a5d3e3ef9f8141f6 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2951,6 +2951,35 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
> >       return ret;
> >  }
> >
> > +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector)
> > +{
> > +     /*
> > +      * This list is not exhaustive, it is a best effort to block access to
> > +      * non documented controls that can affect user's privacy.
> > +      */
> > +     struct privacy_control {
> > +             u8 entity[16];
> > +             u8 selector;
> > +     } privacy_control[] = {
> > +             {
> > +                     .entity = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
> > +                     .selector = 1,
> > +             },
> > +             {
> > +                     .entity = UVC_GUID_LOGITECH_PERIPHERAL,
> > +                     .selector = 9,
> > +             },
> > +     };
> > +     int i;
> > +
> > +     for (i = 0; i < ARRAY_SIZE(privacy_control); i++)
> > +             if (!memcmp(entity, privacy_control[i].entity, 16) &&
> > +                 selector == privacy_control[i].selector)
> > +                     return true;
> > +
> > +     return false;
> > +}
> > +
> >  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >       struct uvc_xu_control_query *xqry)
> >  {
> > @@ -2995,6 +3024,15 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >               return -ENOENT;
> >       }
> >
> > +     if (uvc_ctrl_is_privacy_control(entity->guid, xqry->selector) &&
> > +         !uvc_allow_privacy_override_param) {
> > +             dev_warn_once(&chain->dev->intf->dev,
> > +                           "Privacy related controls can only be accessed if param allow_privacy_override is true\n");
>
> I would do /s/param/module parameter/ in the message here. I know it makes the message a bit
> long but I'm not sure all users will understand what kind of parameter is intended otherwise.

Ack

>
> > +             uvc_dbg(chain->dev, CONTROL, "Blocking access to privacy related Control %pUl/%u\n",
> > +                     entity->guid, xqry->selector);
> > +             return -EACCES;
> > +     }
> > +
> >       if (mutex_lock_interruptible(&chain->ctrl_mutex))
> >               return -ERESTARTSYS;
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..c292bf8b6f57e9fdacee726285f5b46e638fd317 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -35,6 +35,7 @@ unsigned int uvc_hw_timestamps_param;
> >  static unsigned int uvc_quirks_param = -1;
> >  unsigned int uvc_dbg_param;
> >  unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
> > +bool uvc_allow_privacy_override_param;
> >
> >  static struct usb_driver uvc_driver;
> >
> > @@ -2474,6 +2475,25 @@ MODULE_PARM_DESC(trace, "Trace level bitmask");
> >  module_param_named(timeout, uvc_timeout_param, uint, 0644);
> >  MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
> >
> > +static int param_set_privacy(const char *val, const struct kernel_param *kp)
> > +{
> > +     pr_warn_once("uvcvideo: " DEPRECATED
> > +                  "allow_privacy_override parameter will be eventually removed.\n");
> > +     return param_set_bool(val, kp);
> > +}
> > +
> > +static const struct kernel_param_ops param_ops_privacy = {
> > +     .set = param_set_privacy,
> > +     .get = param_get_bool,
> > +};
> > +
> > +param_check_bool(allow_privacy_override, &uvc_allow_privacy_override_param);
> > +module_param_cb(allow_privacy_override, &param_ops_privacy,
> > +             &uvc_allow_privacy_override_param, 0644);
> > +__MODULE_PARM_TYPE(allow_privacy_override, "bool");
> > +MODULE_PARM_DESC(allow_privacy_override,
> > +              "Allow access to privacy related controls");
> > +
> >  /* ------------------------------------------------------------------------
> >   * Driver initialization and cleanup
> >   */
> > diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> > index 03c64b5698bf4331fed8437fa6e9c726a07450bd..510cf47c86a62ba7fe3c7fa51be82c996cf37f9f 100644
> > --- a/drivers/media/usb/uvc/uvc_v4l2.c
> > +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> > @@ -133,6 +133,13 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
> >               return -EINVAL;
> >       }
> >
> > +     if (uvc_ctrl_is_privacy_control(xmap->entity, xmap->selector) &&
> > +         !uvc_allow_privacy_override_param) {
> > +             dev_warn_once(&chain->dev->intf->dev,
> > +                           "Privacy related controls can only be mapped if param allow_privacy_override is true\n");
>
> Same comment on the msg.
>
> > +             return -EACCES;
>
> Did you test this with uvcdynctrl? will it log the error and continue with other controls,
> or will it abort mapping controls when it hits this ?

I tested with the logitech camera and virtme-ng:
https://patchwork.linuxtv.org/project/linux-media/cover/20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org/

It is the first time that I use virtme for uvc... and it works like a charm!

Also looking at uvcdynctrl it seems to log the errors and continue.

If you have a specific test in mind I can try it next week.

>
> I agree with the change and with the -EACCES error return I'm just wondering how
> known userspace consumers of the API will react to this change.
>
> I've been thinking a bit about this and although not ideal I agree that this approach
> is likely the best way to deal with the Logitech custom privacy LED controls.
+1
>
> Regards,
>
> Hans
>
>
> > +     }
> > +
> >       map = kzalloc(sizeof(*map), GFP_KERNEL);
> >       if (map == NULL)
> >               return -ENOMEM;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 9a86d7f1f6ea022dace87614030bf0fde0d260f0..4b1a70e3100bbf2180411a865a89952a81d0f0a4 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -662,6 +662,7 @@ extern unsigned int uvc_clock_param;
> >  extern unsigned int uvc_dbg_param;
> >  extern unsigned int uvc_timeout_param;
> >  extern unsigned int uvc_hw_timestamps_param;
> > +extern bool uvc_allow_privacy_override_param;
> >
> >  #define uvc_dbg(_dev, flag, fmt, ...)                                        \
> >  do {                                                                 \
> > @@ -792,6 +793,7 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
> >                     struct uvc_xu_control_query *xqry);
> >
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle);
> > +bool uvc_ctrl_is_privacy_control(u8 entity[16], u8 selector);
> >
> >  /* Utility functions */
> >  struct usb_host_endpoint *uvc_find_endpoint(struct usb_host_interface *alts,
> > diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
> > index dea23aabbad48270c807463c1a7e1c0d1b79fc1f..70c2a7d2523611418aba363328f76667d379b571 100644
> > --- a/include/linux/usb/uvc.h
> > +++ b/include/linux/usb/uvc.h
> > @@ -49,6 +49,10 @@
> >  #define UVC_GUID_LOGITECH_PERIPHERAL \
> >       {0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
> >        0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
> > +#define UVC_GUID_LOGITECH_USER_HW_CONTROL_V1 \
> > +     {0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
> > +      0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x1f }
> > +
> >
> >  /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
> >  #define UVC_MSXU_CONTROL_FOCUS                       0x01
> >
>


-- 
Ricardo Ribalda

