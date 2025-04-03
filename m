Return-Path: <linux-media+bounces-29334-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350DA7A714
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 17:40:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A8161896BFB
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 15:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF63E250C02;
	Thu,  3 Apr 2025 15:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="joHnnUBd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8BA24EF7E
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694763; cv=none; b=VAXmLk2DlTeYkhyJu/p8e2nufVo9wkFK7rXQV+lorEBzvxrW6esRb1NxZAIKjQJsgQt+qUSzIT5GBGAH0ZLj0ipHFqNGDrWgT0dA0N2ka093cof3ClQ+4GgfpzDbXJjjFxRB1rhSFw0tX+gPqNDe/e7/aWu9lxz0F038XtMHPEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694763; c=relaxed/simple;
	bh=10QDs9qXQVng9pe+sUzuOZ6MTSVuL9AVDg43J4IZmhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J21tDsqc3DC4g2gAcwGBxDpVHSaAO+xwNXW1vVBx5oxOkMWpDBxe0K7UAR7NiSsKmHFKUXEbHKCJhE32G2P+90Wv6eRbsLcRnn7KFxQ9mbevjcRknejUjTEKUs2SAtneciyjxu/C6P0O+jObWFttclw8M5dMOqObLq2mtR6ZmBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=joHnnUBd; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3061513d353so11090311fa.2
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743694754; x=1744299554; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9/aNhmOrBtP2HoJkNMXdPHYg3S31n+NGQYiLc+31j50=;
        b=joHnnUBdTL5fbGrfkiRgQVrLX37EmpAPOZgvQnouXLnr0sBcuLPtqkUz92UVHz55xE
         IU6+KNmi3jiWU8n/emNmDe4Xo+f0aJSbpP9Ls9jvdR1AdIE5CmKmf1LBOdrbWnjKsy5E
         eJUwMTW+6WeYX/7dZOH0csJKlfh5Plg8cIKiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743694754; x=1744299554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/aNhmOrBtP2HoJkNMXdPHYg3S31n+NGQYiLc+31j50=;
        b=NdagUMzs5l5oFz446hM0XIeNdqGYSQ2Z9WFYmzrsSryyO/bkKh3KddpdeWoJGMAUqo
         +ZkTcNkPrc3uiMj4C9FOoU2yLTq1bS4B2T8swbvpqtayVQgzJc4koM0aOppuN85mWYh0
         xoYscajNGNSke3tIefVTcXAKLVuM7PAvgWSuP1gS+0vH3G0r+MPydTBcW8953pDaMLWK
         vgeCEZHXs+I5Os2Yi+zncNpsWLAboAlk1ioMKNzrAaKmjQiQKUvgZFQfB0iLJGXaisDW
         hVh2Ue9/aOe4GsTT2V8McT0mRFFoukt2Nxyo+LOTly/Q7vA4XRCZljFh0sZ9CqhAlISS
         WB7w==
X-Forwarded-Encrypted: i=1; AJvYcCUBsx1dP/41LCzDTPqxcEEyVRvE3OFI88O5GfsgzufRWawTtih6qJ7bPlNt6jATpPMGoQ8rj5u2FAS4Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0KYY1OMUNSz9J4xTL8+BX2Y61VjEws9T3eWwmwyiktFDEtIN2
	50qAmAaVhzIzMCZ8nju8oDnJtdyM3NEO6zKiKDRmJq3PH4/UqSI9vLlJoT31e/AzTJNLVHvu5DQ
	=
X-Gm-Gg: ASbGncvYYj9TlxSONWG9/5cI58xxCUk7JGqZQqeaPX/SwozAMtg/hXMILw9P0XxEWN+
	pisrKxyd2SyEn+Gv/qEeruRHYVQprmyjIAIyHNUmsflrJJflvh4Hf9KB25stDDWVNfNPfn6cm6L
	fKlxesjkizzd4MlRgHJng9nr6p/G+ev2KamXsMl3xhpPVNa4L7lSxTO3FILXDRN9NrjBs5NWAeh
	IYfoviNF96hWLH4IetH1tYNE3WBWEdfAG3MqYA9um+0CfSHBIi/D9FvHUQAbauahSflS7nKbzfZ
	zOW6Ym3ZS8jMf43Ucfej9pDps9m5nZuNT2BBkWl0bu5VhIUoROtw6KZEOYT0qvaDYg8g6oQWfgH
	yCtOJ9xI=
X-Google-Smtp-Source: AGHT+IEey1sVxTeiUfIkT1sj/06wrO2YESoJikmxhNNlZ8yjncvnH7fFJ5nhLNh3ipIOMGZYql4ldw==
X-Received: by 2002:a2e:a913:0:b0:30b:f775:bae5 with SMTP id 38308e7fff4ca-30ef90cb043mr25382661fa.6.1743694754393;
        Thu, 03 Apr 2025 08:39:14 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce84asm2438921fa.99.2025.04.03.08.39.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 08:39:13 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54998f865b8so1019017e87.3
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 08:39:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEL7ZgTYNifKoN80n58SGXsuqm/CFXTuEOINVXASvh7Rer/N6TEy0z+Lv8c8f/dLgSdQaV9KhKNeWGAQ==@vger.kernel.org
X-Received: by 2002:a05:6512:4028:b0:54a:fa58:a6f4 with SMTP id
 2adb3069b0e04-54c19c5d2bamr2120839e87.24.1743694753096; Thu, 03 Apr 2025
 08:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-uvc-eaccess-v7-1-033d0c3d6368@chromium.org> <1c4b9f6c-eff5-4b83-bb4f-64e89e493f20@xs4all.nl>
In-Reply-To: <1c4b9f6c-eff5-4b83-bb4f-64e89e493f20@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Apr 2025 17:39:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCuxefGWiK19oGfZRoyZhO=+xrhkPLuX1k1Txvy+gupXUw@mail.gmail.com>
X-Gm-Features: AQ5f1JrCSbTRlpH3y8wcEYQkWJi1s8hklTmPtD5q1ETYWfOsky4aZQ2MwnUPtYE
Message-ID: <CANiDSCuxefGWiK19oGfZRoyZhO=+xrhkPLuX1k1Txvy+gupXUw@mail.gmail.com>
Subject: Re: [PATCH v7] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 15:07, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 03/04/2025 14:59, Ricardo Ribalda wrote:
> > To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
> > step and flags of the control. For some of the controls, this involves
> > querying the actual hardware.
> >
> > Some non-compliant cameras produce errors when we query them. These
> > error can be triggered every time, sometimes, or when other controls do
> > not have the "right value". Right now, we populate that error to userspace.
> > When an error happens, the v4l2 framework does not copy the v4l2_queryctrl
> > struct to userspace. Also, userspace apps are not ready to handle any
> > other error than -EINVAL.
> >
> > One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
> > of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
> > that usecase, a non-compliant control will make it almost impossible to
> > enumerate all controls of the device.
> >
> > A control with an invalid max/min/step/flags is better than non being
> > able to enumerate the rest of the controls.
> >
> > This patch:
> > - Retries for an extra attempt to read the control, to avoid spurious
> >   errors. More attempts do not seem to produce better results in the
> >   tested hardware.
> > - Makes VIDIOC_QUERYCTRL return 0 in all the error cases different than
> >   -EINVAL.
> > - Introduces a warning in dmesg so we can have a trace of what has happened
> >   and sets the V4L2_CTRL_FLAG_DISABLED.
> > - Makes sure we keep returning V4L2_CTRL_FLAG_DISABLED for all the next
> >   attempts to query that control (other operations have the same
> >   functionality as now).
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Hi 2*Hans and Laurent!
> >
> > I came around a device that was listing just a couple of controls when
> > it should be listing much more.
> >
> > Some debugging later I found that the device was returning -EIO when
> > all the focal controls were read.
> >
> > Lots of good arguments in favor/against this patch in the v1. Please
> > check!
> >
> > Without this patch:
> > $ v4l2-ctl --list-ctrls
> > User Controls
> >
> >                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
> >                        contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
> >                      saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
> >                             hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
> >         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
> >                           gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
> >            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
> >       white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
> >
> > With this patch:
> > $ v4l2-ctl --list-ctrls
> >
> > User Controls
> >
> >                      brightness 0x00980900 (int)    : min=0 max=255 step=1 default=128 value=128
> >                        contrast 0x00980901 (int)    : min=0 max=100 step=1 default=32 value=32
> >                      saturation 0x00980902 (int)    : min=0 max=100 step=1 default=64 value=64
> >                             hue 0x00980903 (int)    : min=-180 max=180 step=1 default=0 value=0
> >         white_balance_automatic 0x0098090c (bool)   : default=1 value=1
> >                           gamma 0x00980910 (int)    : min=90 max=150 step=1 default=120 value=120
> >            power_line_frequency 0x00980918 (menu)   : min=0 max=2 default=2 value=2 (60 Hz)
> >       white_balance_temperature 0x0098091a (int)    : min=2800 max=6500 step=1 default=4600 value=4600 flags=inactive
> >                       sharpness 0x0098091b (int)    : min=0 max=7 step=1 default=3 value=3
> >          backlight_compensation 0x0098091c (int)    : min=0 max=2 step=1 default=1 value=1
> > [   32.777643] usb 3-6: UVC non compliance: permanently disabling control 98091b (Sharpness), due to error -5
>
> So why isn't 'flags=disabled' listed with the sharpness control above?

Because I am unable to copy/paste. Sorry about that

xol-rev8 ~ # v4l2-ctl -l

User Controls

                     brightness 0x00980900 (int)    : min=0 max=255
step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=100
step=1 default=32 value=32
                     saturation 0x00980902 (int)    : min=0 max=100
step=1 default=64 value=64
                            hue 0x00980903 (int)    : min=-180 max=180
step=1 default=0 value=0
        white_balance_automatic 0x0098090c (bool)   : default=1 value=1
                          gamma 0x00980910 (int)    : min=90 max=150
step=1 default=120 value=120
           power_line_frequency 0x00980918 (menu)   : min=0 max=2
default=2 value=2 (60 Hz)
      white_balance_temperature 0x0098091a (int)    : min=2800
max=6500 step=1 default=4600 value=4600 flags=inactive
         backlight_compensation 0x0098091c (int)    : min=0 max=2
step=1 default=1 value=1

Camera Controls

                  auto_exposure 0x009a0901 (menu)   : min=0 max=3
default=3 value=3 (Aperture Priority Mode)
         exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250
step=1 default=156 value=156 flags=inactive
     exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=1
                        privacy 0x009a0910 (bool)   : default=0
value=0 flags=read-only
   region_of_interest_rectangle 0x009a1901 (unknown): type=107
value=unsupported payload type flags=has-payload
  region_of_interest_auto_ctrls 0x009a1902 (bitmask): max=0x00000001
default=0x00000001 value=1




>
> Looking at the v4l2-ctl code I think it should just skip the 'sharpness' control and
> not list it at all. I'm actually not so sure that is the right thing to do.
>
> So try with this patch for v4l2-ctl:
>
> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> index 5b953cbd..41739294 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
> @@ -824,8 +824,6 @@ static int print_control(int fd, struct v4l2_query_ext_ctrl &qctrl, bool show_me
>         memset(&ctrl, 0, sizeof(ctrl));
>         memset(&ext_ctrl, 0, sizeof(ext_ctrl));
>         memset(&ctrls, 0, sizeof(ctrls));
> -       if (qctrl.flags & V4L2_CTRL_FLAG_DISABLED)
> -               return 1;
>         if (qctrl.type == V4L2_CTRL_TYPE_CTRL_CLASS) {
>                 printf("\n%s\n\n", qctrl.name);
>                 return 1;
>
> Regards,

User Controls

                     brightness 0x00980900 (int)    : min=0 max=255
step=1 default=128 value=128
                       contrast 0x00980901 (int)    : min=0 max=100
step=1 default=32 value=32
                     saturation 0x00980902 (int)    : min=0 max=100
step=1 default=64 value=64
                            hue 0x00980903 (int)    : min=-180 max=180
step=1 default=0 value=0
        white_balance_automatic 0x0098090c (bool)   : default=1 value=1
                          gamma 0x00980910 (int)    : min=90 max=150
step=1 default=120 value=120
           power_line_frequency 0x00980918 (menu)   : min=0 max=2
default=2 value=2 (60 Hz)
      white_balance_temperature 0x0098091a (int)    : min=2800
max=6500 step=1 default=4600 value=4600 flags=inactive
                      sharpness 0x0098091b (int)    : min=0 max=0
step=0 default=0 value=3 flags=disabled
         backlight_compensation 0x0098091c (int)    : min=0 max=2
step=1 default=1 value=1

Camera Controls

                  auto_exposure 0x009a0901 (menu)   : min=0 max=3
default=3 value=3 (Aperture Priority Mode)
         exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250
step=1 default=156 value=156 flags=inactive
     exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=1
                        privacy 0x009a0910 (bool)   : default=0
value=0 flags=read-only
   region_of_interest_rectangle 0x009a1901 (rect)   :
value=(0,0)/1924x1084 flags=has-payload
  region_of_interest_auto_ctrls 0x009a1902 (bitmask): max=0x00000001
default=0x00000001 value=1

>
>         Hans
>
> >
> > Camera Controls
> >
> >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> >          exposure_time_absolute 0x009a0902 (int)    : min=2 max=1250 step=1 default=156 value=156 flags=inactive
> >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> >                         privacy 0x009a0910 (bool)   : default=0 value=0 flags=read-only
> >    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
> >   region_of_interest_auto_ctrls 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> >
> > Emulating error with:
> > +       if (cs == UVC_PU_SHARPNESS_CONTROL && query == UVC_GET_MAX) {
> > +               printk(KERN_ERR "%s:%d %s\n", __FILE__, __LINE__, __func__);
> > +               return -EIO;
> > +       }
> > In uvc_query_ctrl()
> > ---
> > Changes in v7:
> > - Only retry on -EIO (Thanks Hans).
> > - Add comment for retry (Thanks Hans).
> > - Rebase patch
> > - Check master_map->disabled before reading the master control.
> > - Link to v6: https://lore.kernel.org/r/20250310-uvc-eaccess-v6-1-bf4562f7cabd@chromium.org
> >
> > Changes in v6:
> > - Keep returning V4L2_CTRL_FLAG_DISABLED in future control queries.
> > - Link to v5: https://lore.kernel.org/r/20250224-uvc-eaccess-v5-1-690d73bcef28@chromium.org
> >
> > Changes in v5:
> > - Explain the retry in the commit message (Thanks Laurent).
> > - Link to v4: https://lore.kernel.org/r/20250111-uvc-eaccess-v4-1-c7759bfd1bd4@chromium.org
> >
> > Changes in v4:
> > - Display control name (Thanks Hans)
> > - Link to v3: https://lore.kernel.org/r/20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org
> >
> > Changes in v3:
> > - Add a retry mechanism during error.
> > - Set V4L2_CTRL_FLAG_DISABLED flag.
> > - Link to v2: https://lore.kernel.org/r/20241219-uvc-eaccess-v2-1-bf6520c8b86d@chromium.org
> >
> > Changes in v2:
> > - Never return error, even if we are not enumerating the controls
> > - Improve commit message.
> > - Link to v1: https://lore.kernel.org/r/20241213-uvc-eaccess-v1-1-62e0b4fcc634@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 53 ++++++++++++++++++++++++++++++++++------
> >  drivers/media/usb/uvc/uvcvideo.h |  2 ++
> >  2 files changed, 47 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index cbf19aa1d82374a08cf79b6a6787fa348b83523a..b41fed364d54aefd7da72c47197cf9d9e3c1b176 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1483,14 +1483,28 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> >       return ~0;
> >  }
> >
> > +/*
> > + * Maximum retry count to avoid spurious errors with controls. Increase this
> > + * value does no seem to produce better results in the tested hardware.
> > + */
> > +#define MAX_QUERY_RETRIES 2
> > +
> >  static int __uvc_queryctrl_boundaries(struct uvc_video_chain *chain,
> >                                     struct uvc_control *ctrl,
> >                                     struct uvc_control_mapping *mapping,
> >                                     struct v4l2_query_ext_ctrl *v4l2_ctrl)
> >  {
> >       if (!ctrl->cached) {
> > -             int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > -             if (ret < 0)
> > +             unsigned int retries;
> > +             int ret;
> > +
> > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > +                     ret = uvc_ctrl_populate_cache(chain, ctrl);
> > +                     if (ret != -EIO)
> > +                             break;
> > +             }
> > +
> > +             if (ret)
> >                       return ret;
> >       }
> >
> > @@ -1567,6 +1581,7 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >  {
> >       struct uvc_control_mapping *master_map = NULL;
> >       struct uvc_control *master_ctrl = NULL;
> > +     int ret;
> >
> >       memset(v4l2_ctrl, 0, sizeof(*v4l2_ctrl));
> >       v4l2_ctrl->id = mapping->id;
> > @@ -1587,18 +1602,29 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >               __uvc_find_control(ctrl->entity, mapping->master_id,
> >                                  &master_map, &master_ctrl, 0, 0);
> >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > +             unsigned int retries;
> >               s32 val;
> >               int ret;
> >
> >               if (WARN_ON(uvc_ctrl_mapping_is_compound(master_map)))
> >                       return -EIO;
> >
> > -             ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > -             if (ret < 0)
> > -                     return ret;
> > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > +                     ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
> > +                                          &val);
> > +                     if (ret != -EIO)
> > +                             break;
> > +             }
> >
> > -             if (val != mapping->master_manual)
> > -                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d querying master control %x (%s)\n",
> > +                                          ret, master_map->id,
> > +                                          uvc_map_get_name(master_map));
> > +             } else {
> > +                     if (val != mapping->master_manual)
> > +                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             }
> >       }
> >
> >       v4l2_ctrl->elem_size = uvc_mapping_v4l2_size(mapping);
> > @@ -1613,7 +1639,18 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >               return 0;
> >       }
> >
> > -     return __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
> > +     ret = __uvc_queryctrl_boundaries(chain, ctrl, mapping, v4l2_ctrl);
> > +     if (ret && !mapping->disabled) {
> > +             dev_warn(&chain->dev->udev->dev,
> > +                      "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
> > +                      mapping->id, uvc_map_get_name(mapping), ret);
> > +             mapping->disabled = true;
> > +     }
> > +
> > +     if (mapping->disabled)
> > +             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
> > +
> > +     return 0;
> >  }
> >
> >  int uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..8e3753896d42baddcc2192057e8c5786ddd79fa8 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -134,6 +134,8 @@ struct uvc_control_mapping {
> >       s32 master_manual;
> >       u32 slave_ids[2];
> >
> > +     bool disabled;
> > +
> >       const struct uvc_control_mapping *(*filter_mapping)
> >                               (struct uvc_video_chain *chain,
> >                               struct uvc_control *ctrl);
> >
> > ---
> > base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
> > change-id: 20250403-uvc-eaccess-8f3666151830
> >
> > Best regards,
>


-- 
Ricardo Ribalda

