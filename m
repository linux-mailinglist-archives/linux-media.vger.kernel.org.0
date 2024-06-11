Return-Path: <linux-media+bounces-12932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ABF9035F2
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 10:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BD801F27243
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 08:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57347174EE1;
	Tue, 11 Jun 2024 08:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lkhatxar"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE50174EC3
	for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 08:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094175; cv=none; b=sQKHYBQa6ldbESJqHdJf9ZpJd0HCS28HsgpzoDinnrrRDRwDcvuA232IsspGhSgNIVFmeBr41iVpWGvVLidiCCDB4kWBJMmO93orltqHTy7IqqA1Czc7alhRMA58x70ZrK96CMrN8IB6So3tpLaduq49sBpY+JlzHAd48SY44Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094175; c=relaxed/simple;
	bh=2XAFiadYrV3QUNrS4ge3SZ4AfiKx6M85T5QxAY2S2vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HSZfxhwbGsZfUBbQDjGLeXsdtOu7edQpbbeKAllKQO3nEs2WDHgCapY3/i3tVubqoQzlTKNxdg7rKZp8d+cpM9uvW4cnKi8rb0AGTdsLZObeWxE1KIt8KqIJ5m4dBJSbi6j6mhx2MC8FJYoArZP2X2qmLfjgHYev6o1ol2wztQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lkhatxar; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc27cfb14so4597304e87.0
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 01:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718094171; x=1718698971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NwKyuq+nR/2yqMTGVhsfCBfUIKD3cD0xRRIgm5IZyDs=;
        b=lkhatxarcHoCwK6/XibpQaLekwyC4JPrHgf9wQGrJGGPQamnoY7P3ojEpvWj77YotP
         IFikZktRUfgA3nYsWAnKP1pZgR0qN00wWZy57QahNCydN+vjQh3Ahs2L1VkVJUM2tlKP
         v/ZORLbjq69gF3mB2g/fsVVf1GYcvbelDSEXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718094171; x=1718698971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NwKyuq+nR/2yqMTGVhsfCBfUIKD3cD0xRRIgm5IZyDs=;
        b=QSfveEdtQfNycuFRyklLUBUpKGTdyGGNSECvBWOJEDii77Pw5k4GL+hQiQo0Cb2ge4
         J8ocSLum3fjJ4yTV9Hx1KgVD3+HHZ+0BBsoWV5ber0fRmIRsNw1KMGna0SZVyOK0c8qX
         uqJeC1fWHHT+75a02L7oQAkAPi8OzcqAGQX7K2Gl7f36gaxsS8GCG6uiUfod39+BLNIo
         gyD4Onsc0JARWZ+O44yNSWTbT2YJ/OMG/jN+5mHskoPJ+ZCvT5TUOEnRQfY3GjSwXwNi
         9CKaLDI2CwyiMZM4sJTRCkHxHyijq/jpeW6H3YInH+b4ymYMn6+BNwEht9ugM4fc2O6g
         hoow==
X-Forwarded-Encrypted: i=1; AJvYcCUg2X9FoECdiMRVibT3Bcl+n2SNemkjVGjnp7JbZ/STSrzLtIV+7T733MBcljt4G1CwGYJm6FmKY8tSI6ZwtnJH4AH7id0X10Xd+pA=
X-Gm-Message-State: AOJu0YzyPvNEMKSSoyX+dtvqJqCsRhHvC0fqGcAL6honRPy74To21TRm
	nVj8OSPO1PdcDToeDYV3yUEpn88+32KI+h5b/BAz4E1mFCxlMMBHvbUqo3uG6Ky1AdkQ7TLOd8F
	ETdOu
X-Google-Smtp-Source: AGHT+IHev3mQJhzCD+EGfZgAh94c+CIdW/9cu5w+2/nKWlcxQdZHh3DX7S/Iae1AT1yZFlDkUZD6sA==
X-Received: by 2002:a05:6512:1092:b0:52c:8ed1:21fe with SMTP id 2adb3069b0e04-52c8ed1223cmr2976317e87.53.1718094171320;
        Tue, 11 Jun 2024 01:22:51 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8162ccbcsm1348746e87.191.2024.06.11.01.22.50
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 01:22:50 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebdfe261f9so33491781fa.1
        for <linux-media@vger.kernel.org>; Tue, 11 Jun 2024 01:22:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVePkNm2O3xmvVEzSRP2aUwl8BlwGlyIZpKpWvxAx7PrOWmxMDasN8Q3cZgBMA5wgX/G7ZGm5qO4hSR8udhLpDUksaJMsK+dDhG+4c=
X-Received: by 2002:ac2:5e67:0:b0:52c:83f6:1141 with SMTP id
 2adb3069b0e04-52c83f61df0mr4769880e87.39.1718094170412; Tue, 11 Jun 2024
 01:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-3-2f7bc0ee2030@chromium.org> <20240610141402.GB13744@pendragon.ideasonboard.com>
 <CANiDSCsNdZyKMM82q9SqZ-hQH2Pch24rVCqSs=L6mFL=RbJqQg@mail.gmail.com> <20240610234750.GC31989@pendragon.ideasonboard.com>
In-Reply-To: <20240610234750.GC31989@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Jun 2024 10:22:39 +0200
X-Gmail-Original-Message-ID: <CANiDSCt9N4d889DRtns_6c-66qb9ZSLWsWEhUNNuPBZ4-mY_tQ@mail.gmail.com>
Message-ID: <CANiDSCt9N4d889DRtns_6c-66qb9ZSLWsWEhUNNuPBZ4-mY_tQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: uvcvideo: Probe the PLF characteristics
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Tue, 11 Jun 2024 at 01:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Mon, Jun 10, 2024 at 11:51:55PM +0200, Ricardo Ribalda wrote:
> > On Mon, 10 Jun 2024 at 16:14, Laurent Pinchart wrote:
> > > On Mon, Mar 18, 2024 at 11:55:25PM +0000, Ricardo Ribalda wrote:
> > > > The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
> > > > 60Hz and Auto. But it does not clearly define if all the values must be
> > > > implemented or not.
> > > >
> > > > Instead of just using the UVC version to determine what the PLF control
> > > > can do, probe it.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_ctrl.c | 54 +++++++++++++++++++++++++++++++++++++---
> > > >  1 file changed, 50 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > index 67522143c6c85..9a0b81aca30d1 100644
> > > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > > @@ -501,12 +501,58 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> > > >  static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
> > > >       struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> > > >  {
> > > > +     const struct uvc_control_mapping *out_mapping =
> > > > +                                     &uvc_ctrl_power_line_mapping_uvc11;
> > > > +     u8 init_val;
> > > > +     u8 *buf;
> > >
> > >         u8 *buf __free(kfree) = NULL;
> > >
> > > will simplify the exit paths.
> > >
> > > > +     int ret;
> > > > +
> > > > +     buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> > > > +     if (!buf)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     /* Save the default PLF value, so we can restore it. */
> > > > +     ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> > > > +                          chain->dev->intfnum, ctrl->info.selector,
> > > > +                          buf, sizeof(*buf));
> > >
> > > That's the current value, not the default. Is that intended ?
> >
> > Yes, the driver does not init the other controls to the default value.
> > So I'd rather be consistent.
>
> I'm fine with that, let's update the comment to "Save the current PLF
> value".

done in my tree, if there is a v3 I will fix it, otherwise you are
free to modify it if you want ;)


>
> > > > +     /* If we cannot read the control skip it. */
> > > > +     if (ret) {
> > > > +             kfree(buf);
> > > > +             return ret;
> > > > +     }
> > > > +     init_val = *buf;
> > > > +
> > > > +     /* If PLF value cannot be set to off, it is limited. */
> > > > +     *buf = V4L2_CID_POWER_LINE_FREQUENCY_DISABLED;
> > > > +     ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > > > +                          chain->dev->intfnum, ctrl->info.selector,
> > > > +                          buf, sizeof(*buf));
> > > > +     if (ret) {
> > > > +             out_mapping = &uvc_ctrl_power_line_mapping_limited;
> > > > +             goto end;
> > >
> > > If setting the value failed you don't need to restore it, do you ?
> > >
> > > > +     }
> > > > +
> > > > +     /* UVC 1.1 does not define auto, we can exit. */
> > > >       if (chain->dev->uvc_version < 0x150)
> > > > -             return __uvc_ctrl_add_mapping(chain, ctrl,
> > > > -                                           &uvc_ctrl_power_line_mapping_uvc11);
> > > > +             goto end;
> > > > +
> > > > +     /* Check if the device supports auto. */
> > > > +     *buf = V4L2_CID_POWER_LINE_FREQUENCY_AUTO;
> > > > +     ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > > > +                          chain->dev->intfnum, ctrl->info.selector,
> > > > +                          buf, sizeof(*buf));
> > >
> > > Now for the real annoying question. I've encountered quite a few devices
> > > that would crash when the driver tried to get/set lots of controls at
> > > probe time. This is why the control cache is populated the first time a
> > > control is queried, and not when the device is probed. I'm always
> > > worried when adding more control accesses at probe time that some
> > > devices will behave improperly.
> >
> > If we encounter a device like that we could quirk it.
>
> Now we could place bets on what is less likely to scale, quirking
> devices that have a bad PLF implementation, or quirking devices whose
> firmware will crash when queried too much at probe time :-)

:)

>
> > > Given the number of UVC users I tend to be on the conservative side, but
> > > obviously, if we were to strictly avoid new access patterns to the
> > > device, the driver wouldn't be able to evolve. I do like patches 4/5 and
> > > 5/5, so I'm tempted to take the risk and revert this series later if
> > > needed. That would likely make some other users unhappy if they rely on
> > > the heuristic.
> > >
> > > Another issue is how to get vendors to implement the power line
> > > frequency control correctly. With the series applied, vendors won't
> > > notice they're doing something wrong. Of course, they probably don't
> > > check the behaviour of their devices with Linux in the first place, so
> > > I'm not sure what we could do.
> >
> > We can add the check to v4l2-compliance....
> >
> > Although I would love to see a uvc-compliance tool. If the tool can be
> > easily run in windows/linux without a driver I guess ISP vendors will
> > run it to validate their code.
>
> *without a driver* is doable with libusb but would be *lots* of work,
> basically duplicating the whole uvcvideo driver in userspace. That's not
> a project I would start, but it would be interesting.
>
> > Right now there is no way to validate a usb camera beyond: it runs in
> > windows and in cheese.
>
> Isn't the USB-IF supposed to have a compliance test suite ? Given all
> the broken devices we hear about, it must either not be very good, or
> not be used by vendors.

At least there is no public compliance test suite, and if third
parties cannot validate the results the test is not very useful.

>
> I think a compliance tool based on top of the uvcvideo kernel driver
> would already be a good step forward.
>
> > > > +     if (!ret)
> > > > +             out_mapping = &uvc_ctrl_power_line_mapping_uvc15;
> > > > +
> > > > +end:
> > > > +     /* Restore initial value and add mapping. */
> > > > +     *buf = init_val;
> > > > +     uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > > > +                    chain->dev->intfnum, ctrl->info.selector,
> > > > +                    buf, sizeof(*buf));
> > > >
> > > > -     return __uvc_ctrl_add_mapping(chain, ctrl,
> > > > -                                   &uvc_ctrl_power_line_mapping_uvc15);
> > > > +     kfree(buf);
> > > > +     return __uvc_ctrl_add_mapping(chain, ctrl, out_mapping);
> > > >  }
> > > >
> > > >  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>
> --
> Regards,
>
> Laurent Pinchart

Regards!

-- 
Ricardo Ribalda

