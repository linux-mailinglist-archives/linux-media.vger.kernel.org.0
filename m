Return-Path: <linux-media+bounces-24349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3568DA044D3
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 16:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C434C7A10A5
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 15:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C3C1EF0BC;
	Tue,  7 Jan 2025 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RF8fxm0H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923BE1F2380
	for <linux-media@vger.kernel.org>; Tue,  7 Jan 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264256; cv=none; b=r1kv/63HHUdeYHASGQ3/00cGbQnScav9ZQTuuRxg5owKwNC8AjOYwRfD+e5USvcAQf710W00PzLo8tSEb2W5VgK7XV2DrTdbnraBxDWrt2XZBqFACNKmSkOSYm/0fMwHAr3fVRcznv/Nl9c1c+4LtEmC4QMxcqSlqcEFshz7WrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264256; c=relaxed/simple;
	bh=BCsb1kSwUp1vuhRYnHGlXYZ6tyWpfkR56OCbLAVjSWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fECPtCQJ2RXIAt8JN6oo3b6njIxwvvd1eHsyvHK7UPJOZxxja8SEBGkEvu5+L2hLpUrdcXbwPCrYHx8vFWYmYH/Whyy6VzYXv8pRzLK1pmHtrtNYWPrp45pGkfNjZDtbXzIdPJbEOnmrdOl+iJEyGqtB8h86HVOBYMiCMy/4Qbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RF8fxm0H; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3003e203acaso157578361fa.1
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736264250; x=1736869050; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UqyIWgBkZrzOFnuC65SFhI6AeXb3cc/pajMNc7TqLSk=;
        b=RF8fxm0HX2Gay5weLR9ajwvjUP5dwUDjedjU4aSrhvj7/3IsQzHThEqn6C36GWnmpa
         TsK/u3sKWoD8bF9whejWhunIFQxmAXLc0Qrxuk+YHT59aDTzYcEzcYBLAZampkiEd9Sn
         lsPfwGI8LCrNL9j6FIBf1S0eNUTe6u6+94eCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264250; x=1736869050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqyIWgBkZrzOFnuC65SFhI6AeXb3cc/pajMNc7TqLSk=;
        b=jHm+rjL3oSGYWkD0+XHwxtE35iufKEJKzSfvLi9CA6Qs3v3ley1v+dBAIbvR2S5kmQ
         4uEeuIyIspmyWRdAQpKMEUNKx8nCGmrqU968NQxuEsrx9J/psdCwDVZ2EGIO76iOHusB
         HWNhjTh05Mrea1DwIGTULFPo4Gll3Sge3p28Uod9c9L8ZXBb+vx1FY9HCsbjEGj8xmoC
         WW/M7E+zka0v6BjX1G14caZNy9R239Lm4fmM3uH7IfTTTvhGHjOEHnidVHrtiyJs5cLs
         2KOXyDWhnGj5+gAqgPsuTR5b+z88Fjbt+reAbumJO1DC3ExA7WjG1FpjG2YAfoBIRiW0
         PGIw==
X-Forwarded-Encrypted: i=1; AJvYcCUYMFutbAlorsIcmE3ICrrmo3k3gbl2TdDIWLFC77xrkhK90cVEpIu6aLjqBic2YOHfZWniJtkdfgKYbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMwAE7GB1ZfQpE1TV783LmMpsIKq8ZYI7oz76eON2SY54YkqXw
	KsNk4PZORx2o8cO3sK+gkyrZV1XdTCBRWil7qqdZsJbC4mAGLeNWPpaJx3iWsYoRAvRzXqKcnAq
	d/Q==
X-Gm-Gg: ASbGncvI6Ut/Oej47VnJUtenxVb7NrndCa3id+jDtNnELkY108D0oG8VQQotAc6Vndv
	f+9uiA0NgdzkCbRWArXm4M0dQw7r5lambQKfVoOMFRaZCFrmBzyGT6lEGzkszkzst8nxnvni2hn
	26rs8+zMZ5fBOyURYZnFFDNDlwmsjfMphOqFN/mZzoB/6tffiON/Jo4KVcpDa7J1R6bDnY146HH
	FZ7SZqoqcU/jgHOd6+xI9X9HMAPK/sxUQpl6cWIt9GWsTrOfDWycsqIbAXd/3b3Za9ReRDjcNit
	tVFvjMtXrru0MYJzHPw=
X-Google-Smtp-Source: AGHT+IGIhtR3LkWY9oRMDtjnfHDNZzKLVFDfSSPLrFWPa7/cI/sqS39Ny1W7ow2wSZFcIGp+ADMp3w==
X-Received: by 2002:a05:651c:1a0a:b0:300:3a15:8f1f with SMTP id 38308e7fff4ca-304685c2ef9mr243402511fa.32.1736264250350;
        Tue, 07 Jan 2025 07:37:30 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad99381sm59499731fa.26.2025.01.07.07.37.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 07:37:29 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024ecc33dso1934815e87.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jan 2025 07:37:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU3V66+uyU9k1jdqBml32RVimWRtjAcQbm1xXEEc/GA9CLZ1obvIgGBaZjb0mGcny4cm7gCzY7ie5qCdQ==@vger.kernel.org
X-Received: by 2002:a05:6512:304e:b0:540:c349:a81b with SMTP id
 2adb3069b0e04-542295978a2mr16490670e87.48.1736264248993; Tue, 07 Jan 2025
 07:37:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107-uvc-eaccess-v3-1-99f3335d5133@chromium.org> <a2b7d3b1-8dc7-4523-bd9b-f90d584f3621@xs4all.nl>
In-Reply-To: <a2b7d3b1-8dc7-4523-bd9b-f90d584f3621@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 7 Jan 2025 16:37:16 +0100
X-Gmail-Original-Message-ID: <CANiDSCu7zeSTSz94LpXiu1xv0URLJqDCTO80pw3ORa_BX5sq4Q@mail.gmail.com>
X-Gm-Features: AbW1kva2vTQwLtThG7SFb-knRxDb4MOVen7x9R8LKwrIW-K_zmT0z_-QxlHUn3w
Message-ID: <CANiDSCu7zeSTSz94LpXiu1xv0URLJqDCTO80pw3ORa_BX5sq4Q@mail.gmail.com>
Subject: Re: [PATCH v3] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Tue, 7 Jan 2025 at 16:32, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 07/01/2025 16:23, Ricardo Ribalda wrote:
> > To implement VIDIOC_QUERYCTRL, we need to know the minimum, maximum,
> > step and flags of the control. For some of the controls, this involves
> > querying the actual hardware.
> >
> > Some non-compliant cameras produce errors when we query them. Right now,
> > we populate that error to userspace. When an error happens, the v4l2
> > framework does not copy the v4l2_queryctrl struct to userspace. Also,
> > userspace apps are not ready to handle any other error than -EINVAL.
> >
> > One of the main usecases of VIDIOC_QUERYCTRL is enumerating the controls
> > of a device. This is done using the V4L2_CTRL_FLAG_NEXT_CTRL flag. In
> > that usecase, a non-compliant control will make it almost impossible to
> > enumerate all controls of the device.
> >
> > A control with an invalid max/min/step/flags is better than non being
> > able to enumerate the rest of the controls.
> >
> > This patch makes VIDIOC_QUERYCTRL return 0 in all the error cases
> > different than -EINVAL, introduces a warning in dmesg so we can
> > have a trace of what has happened and sets the V4L2_CTRL_FLAG_DISABLED.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Hi 2*Hans and Laurent!
> >
> > I came around a device that was listing just a couple of controls when
> > it should be listing much more.
> >
> > Some debugging latter I found that the device was returning -EIO when
> > all the focal controls were read.
> >
> > Lots of good arguments in favor/against this patch in the v1. Please
> > check!
> >
> > Without this patch:
> > $ v4l2-ctl --list-ctrls
> >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> >
> > With this patch:
> > $ v4l2-ctl --list-ctrls
> >                   auto_exposure 0x009a0901 (menu)   : min=0 max=3 default=3 value=3 (Aperture Priority Mode)
> >          exposure_time_absolute 0x009a0902 (int)    : min=50 max=10000 step=1 default=166 value=166 flags=inactive
> >      exposure_dynamic_framerate 0x009a0903 (bool)   : default=0 value=0
> > error 5 getting ext_ctrl Focus, Absolute
> > error 5 getting ext_ctrl Focus, Automatic Continuous
> >    region_of_interest_rectangle 0x009a1901 (unknown): type=107 value=unsupported payload type flags=has-payload
> > region_of_interest_auto_control 0x009a1902 (bitmask): max=0x00000001 default=0x00000001 value=1
> > --
> > ---
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
> >  drivers/media/usb/uvc/uvc_ctrl.c | 41 ++++++++++++++++++++++++++++++++--------
> >  1 file changed, 33 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4e58476d305e..d69b9efa74d0 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1280,6 +1280,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> >       return ~0;
> >  }
> >
> > +#define MAX_QUERY_RETRIES 2
> > +
> >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >       struct uvc_control *ctrl,
> >       struct uvc_control_mapping *mapping,
> > @@ -1305,19 +1307,42 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >               __uvc_find_control(ctrl->entity, mapping->master_id,
> >                                  &master_map, &master_ctrl, 0);
> >       if (master_ctrl && (master_ctrl->info.flags & UVC_CTRL_FLAG_GET_CUR)) {
> > +             unsigned int retries;
> >               s32 val;
> > -             int ret = __uvc_ctrl_get(chain, master_ctrl, master_map, &val);
> > -             if (ret < 0)
> > -                     return ret;
> > +             int ret;
> >
> > -             if (val != mapping->master_manual)
> > -                             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > +                     ret = __uvc_ctrl_get(chain, master_ctrl, master_map,
> > +                                          &val);
> > +                     if (ret >= 0)
> > +                             break;
> > +             }
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d querying master control %x\n",
> > +                                           ret, master_map->id);
> > +             } else if (val != mapping->master_manual) {
> > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
> > +             }
> >       }
> >
> >       if (!ctrl->cached) {
> > -             int ret = uvc_ctrl_populate_cache(chain, ctrl);
> > -             if (ret < 0)
> > -                     return ret;
> > +             unsigned int retries;
> > +             int ret;
> > +
> > +             for (retries = 0; retries < MAX_QUERY_RETRIES; retries++) {
> > +                     ret = uvc_ctrl_populate_cache(chain, ctrl);
> > +                     if (ret >= 0)
> > +                             break;
> > +             }
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d populating cache of control %x\n",
> > +                                          ret, mapping->id);
>
> Is ctrl->name available here? It's a pain to translate the
> control id to a specific control, if you log the name, then you
> immediately know which control it is. Ideally both the id and name
> are logged.

Good point.

I added this locally. Will resend after I get more feedback on the patch.


diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d69b9efa74d0..9d7812e8572d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1320,8 +1320,9 @@ static int __uvc_query_v4l2_ctrl(struct
uvc_video_chain *chain,

                if (ret < 0) {
                        dev_warn_ratelimited(&chain->dev->udev->dev,
-                                            "UVC non compliance:
Error %d querying master control %x\n",
-                                             ret, master_map->id);
+                                            "UVC non compliance:
Error %d querying master control %x (%s)\n",
+                                             ret, master_map->id,
+                                             uvc_map_get_name(master_map));
                } else if (val != mapping->master_manual) {
                        v4l2_ctrl->flags |= V4L2_CTRL_FLAG_INACTIVE;
                }
@@ -1339,8 +1340,9 @@ static int __uvc_query_v4l2_ctrl(struct
uvc_video_chain *chain,

                if (ret < 0) {
                        dev_warn_ratelimited(&chain->dev->udev->dev,
-                                            "UVC non compliance:
Error %d populating cache of control %x\n",
-                                            ret, mapping->id);
+                                            "UVC non compliance:
Error %d populating cache of control %x (%s)\n",
+                                            ret, mapping->id,
+                                            uvc_map_get_name(mapping));
                        v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;



>
> Regards,
>
>         Hans
>
> > +                     v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
> > +             }
> >       }
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> >
> > ---
> > base-commit: c5aa327e10b194884a9c9001a751f6e4703bc3e3
> > change-id: 20241213-uvc-eaccess-755cc061a360
> >
> > Best regards,
>


--
Ricardo Ribalda

