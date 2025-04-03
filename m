Return-Path: <linux-media+bounces-29291-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B721DA79D87
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 09:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F76318977F0
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 07:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DEE241668;
	Thu,  3 Apr 2025 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TvuPARe3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC8DDA9
	for <linux-media@vger.kernel.org>; Thu,  3 Apr 2025 07:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667166; cv=none; b=fSnMmLwQWj6Ep1HduFs5S+qdtRgo+gOyX+DB5pFqADCSdwPEe3iRlptGNhlYCyFYzwgWZkXDu4Rvwd87b+HGQK/4jarygc967H9X3oMKR6Esw8TcT2TTR5Uvas9Est6Dtv7GqzGCQown+8OPvEH5zRKxVCorfA94RkkJPJf6sEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667166; c=relaxed/simple;
	bh=kBIqwYp+0OoHkcTQzAgsD+dEZ+4mg3cDogdBCyvQ+KE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mk+lCjtJhHU2w/GGfxw/d7kAkzqfHOFmmlu/F5HefStSybeGVHnJfBduyNgUioyhKVYeT58s+odCM6tj9K/CiB7JslWxTHrn1FGfzbiJpTMzZdk6bf31Z4ViOS3l9dFAM4kNoi3ay+Yn8XM1D8qGvK1H55WKZXnOwM/lyhmZskc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TvuPARe3; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b0d638e86so671581e87.1
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 00:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743667163; x=1744271963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pQ3zw43gKxJ1YlZXX9E0k3Czk4zWzQQQoC/QeCSB+uw=;
        b=TvuPARe35b6eYmgIm2Vmu7+o0jfyw1li77qwYXxScuGVkFhgrNulqjSoLyaYWdcdsV
         A5qb0E4mv9Ij9RwXN5UrBdrvGQrmdQydNo4LaOdSzYFgXXUuk6XApzBax8v3/7exbEQA
         E74w3NrJSkpkwNC/TgezMtY7yxSEyJQzc9zio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743667163; x=1744271963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQ3zw43gKxJ1YlZXX9E0k3Czk4zWzQQQoC/QeCSB+uw=;
        b=hflF6NB/o5BlOn8OQXQz4LJmUaFJS6Yb0NEcrM20tn7cnHN/FHszHaQIili/aAFAiT
         O2XRPmHJpTHTJs7IiOAHSM/PeHcpGxk3QDYOYhmsJF2cXDRU3xZIlTOWrVsmmAMq3rsQ
         aX1KVaWkz7Ug58F2ZdFMvEJJlwq4q6JG01c87symQE02hewZWnwUkH3pDJ6g+pO9U4j9
         lnmGuxT2be3CGSUBuaANAQYKz8/1DkPOc3l4Ll5/NlqOqtVNRb1Ga23OQLI2P1VmGs3M
         g3YKgnk0lpQX7abi5uR0CRpl2VD9mxQqo3Va3p52iJ+H0/fPmIBWf9gZnxYj1i6IjmIM
         foiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGnOvDokn8YMWYPRWCaX9w3uBy+yIWVdZsWwwq2uL5LZPYF+6vCqd27Jw2Lg/ZtWoJJLwcoZTKTIs/jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBvB00zs9Clfzi0GjkOKjeVdoT2lWofDvWmgjLCp++apc5FNj9
	kzi+bD5GKvwPKJAwU+s9GIcAX7al2UgamL11xlR1E6kerG9569sYoNxhoCyCSUp976mfkRDyRNQ
	=
X-Gm-Gg: ASbGncuptRRe39NB1BNvW7y49VeSV5Ow/ZHp0Prw7b1kCma9o3oa7P5tDqcbDy7AL+Y
	yFydiCEcd3XMznxlmANkxiue3AKSgBK/H/VW9GXDFnWcWbriNyoUEjw+AcnCtFsydoDCIKa1khP
	aGakgcJLHSwAm9Hxm7TLYQsl5RnaiRWaoFpJZJRkXkARy4ctyGFgTHKnYBXxS0oo8JFJKuaZUki
	M8QPHPYe81N4+1bXS/FwXi/HCzxxS9f4hJ0oMP+ftmENbFWPFiU1XHsD0hmr9GkHos9eZA1ww2b
	7V2faqeKhcbfcwqLQmT5towSFZ7DKNKJC+DtxZSeIOVaMGuT4Ff1NwMhN7s6S6K1L9aYnpOXkcv
	hAzRrH3uqLDg=
X-Google-Smtp-Source: AGHT+IGIaWBJrQIdCd2OyKQxlaEcJmXA34LRamgf8zlsMIG9UPVeLcJjoaNaQhd8KrIp/sTKNiyTtQ==
X-Received: by 2002:a05:6512:b15:b0:54a:f66b:e938 with SMTP id 2adb3069b0e04-54c1d8f450dmr453392e87.45.1743667162449;
        Thu, 03 Apr 2025 00:59:22 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e663d9asm74424e87.210.2025.04.03.00.59.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 00:59:21 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so5429001fa.0
        for <linux-media@vger.kernel.org>; Thu, 03 Apr 2025 00:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvhoNAoTRozxUQzrfdJunVMxQya0GrmmM7VGHgPJfxdccyDdBv+QiBP1kBKkKhp1+NP6Jz2AfiUovSQA==@vger.kernel.org
X-Received: by 2002:a05:651c:1478:b0:30d:e104:a497 with SMTP id
 38308e7fff4ca-30f021ae014mr5251721fa.41.1743667161105; Thu, 03 Apr 2025
 00:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-uvc-eaccess-v6-1-bf4562f7cabd@chromium.org> <332fce27-8a11-4c70-9753-1da968c3e45a@xs4all.nl>
In-Reply-To: <332fce27-8a11-4c70-9753-1da968c3e45a@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 3 Apr 2025 09:59:08 +0200
X-Gmail-Original-Message-ID: <CANiDSCsGH5SM-odxUbGnT0pOKvX+J2tsSqF_7ightF_TqwHJ_g@mail.gmail.com>
X-Gm-Features: AQ5f1Jpx5ERt4Z14SS3nIQREy9ENmA-oiCBv2P2PlFS77sONYcyvizK2h_rSXpY
Message-ID: <CANiDSCsGH5SM-odxUbGnT0pOKvX+J2tsSqF_7ightF_TqwHJ_g@mail.gmail.com>
Subject: Re: [PATCH v6] media: uvcvideo: Set V4L2_CTRL_FLAG_DISABLED during
 queryctrl errors
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hdegoede@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Apr 2025 at 09:01, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 10/03/2025 14:21, Ricardo Ribalda wrote:
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
>
> This output still refers to the result from the v1 patch (I think).
> Can you redo this test with this v6 applied? You probably want to update these
> comments anyway.

I do not have access to the broken device right now. But I will fake a
-EIO error.

>
> > --
> > ---
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
> >  drivers/media/usb/uvc/uvc_ctrl.c | 46 +++++++++++++++++++++++++++++++++-------
> >  drivers/media/usb/uvc/uvcvideo.h |  2 ++
> >  2 files changed, 40 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 4e58476d305efddac331417feda8cb064e340a13..4b282ac714220b26581fe468d9ecb1109a28483f 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1280,6 +1280,8 @@ static u32 uvc_get_ctrl_bitmap(struct uvc_control *ctrl,
> >       return ~0;
> >  }
> >
> > +#define MAX_QUERY_RETRIES 2
>
> As you mentioned in the commit log, trying more times didn't make a difference.
> Add that as a comment here as well, it is good to have that documented in the code.
>
> > +
> >  static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >       struct uvc_control *ctrl,
> >       struct uvc_control_mapping *mapping,
> > @@ -1305,19 +1307,44 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
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
>
> This retries regardless of the error code. Isn't a retry only needed for -EIO?
> Are there other error codes that need a retry? Or, perhaps easier, are there
> errors codes for which a retry is *not* appropriate? E.g. -EACCESS, -ERANGE.

So far I have only seen -EIO, so i will start with -EIO, if we see
other behaviour we can fix this later.


>
> > +             }
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: Error %d querying master control %x (%s)\n",
> > +                                          ret, master_map->id,
> > +                                          uvc_map_get_name(master_map));
>
> Shouldn't you mark this control as disabled and return here instead of
> continuing?

Do you mean marking as disabled the master control or the actual control?

I think there might be cases where the master control is "disabled",
but the actual control works.
Semantically could be similar to cameras that do not have the
master_control, and we support that usecase today.

I am marking the master_map as disabled.

>
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
>
> Same question about the error code as above.
>
> > +             }
> > +
> > +             if (ret < 0) {
> > +                     dev_warn_ratelimited(&chain->dev->udev->dev,
> > +                                          "UVC non compliance: permanently disabling control %x (%s), due to error %d\n",
> > +                                          mapping->id,
> > +                                          uvc_map_get_name(mapping), ret);
> > +                     mapping->disabled = true;
> > +             }
> >       }
> >
> >       if (ctrl->info.flags & UVC_CTRL_FLAG_GET_DEF) {
> > @@ -1325,6 +1352,9 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
> >                               uvc_ctrl_data(ctrl, UVC_CTRL_DATA_DEF));
> >       }
> >
> > +     if (mapping->disabled)
> > +             v4l2_ctrl->flags |= V4L2_CTRL_FLAG_DISABLED;
> > +
> >       switch (mapping->v4l2_type) {
> >       case V4L2_CTRL_TYPE_MENU:
> >               v4l2_ctrl->minimum = ffs(mapping->menu_mask) - 1;
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 5e388f05f3fcaf0e4c503a34745d05837ecb0184..63687d7e97738a50d037b1f456f5215241909c13 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -129,6 +129,8 @@ struct uvc_control_mapping {
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
> > base-commit: c2b96a6818159fba8a3bcc38262da9e77f9b3ec7
> > change-id: 20241213-uvc-eaccess-755cc061a360
> >
> > Best regards,
>
> Regards,
>
>         Hans


Thanks :)


-- 
Ricardo Ribalda

