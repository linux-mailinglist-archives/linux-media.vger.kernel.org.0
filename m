Return-Path: <linux-media+bounces-12893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88457902AEE
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 684301C21D22
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 21:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC4414EC73;
	Mon, 10 Jun 2024 21:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nC+8MkkR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A0142E62
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 21:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718056351; cv=none; b=gyic9cKuoZ4cQjLZf48f/K19Mz2AVOfYdy0QB02lZSFj/JviICILX8IqwL9L8Jcr8vw5oCs4CxEtQpaQHd6OymjlLBPROWuKdPrrW/1rRf33nm/B6hzAZjK3f69dOYkZMgbEvASU1Swidn83bKhmXVjUq7W6jYqZFu8PLmqeyzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718056351; c=relaxed/simple;
	bh=gmcqo4mZQVYUP8msDqMkp5FlW36i1BK9aU0wcAftSSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oq4CX8YRlHMRoCzni5aUImSlpezvKOEaLtxYgYSnpY6a1izSuZSZhFDCmbKLnkarMIaOyp3kYt6cRA4L2G+FW9oaT0k9Lgw4rCB9SqLIFT56NBkjD/jcHhJaJO8ox8ZtP04iBgMd90/55kqmAi4k/Vf/aMnbnrddrAnBKY9sBwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nC+8MkkR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso5494540e87.3
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 14:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718056348; x=1718661148; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MeA9AyChYLDPZo5d1TS51emX8dw5ttciiCSkWSyJMyg=;
        b=nC+8MkkRa5MX0PqKjvt+EV9EMh/o8dvTo6+ZtCRjq5N7+9mKv420YkIs8lf+MjDoSR
         nbPFmkfTnu4mg3fe+Ecx/TbpAx14KKIEwLv+gosWuzTNri9lRnrrrYYRUFyOBwgJLnYG
         ebtImK3z944krBUOjWzgeq5uOia2Mpx2vMtMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718056348; x=1718661148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MeA9AyChYLDPZo5d1TS51emX8dw5ttciiCSkWSyJMyg=;
        b=RzwluVG4153WNNOIizy5eekhVN/xn84rcOg3KxonASs0bOFFUk9ewsmY/hORGo4q2b
         1AecjUGzgND6n1KieyWfLFSd/y+7sTJdUzldo8p5NTFdXFB+DlmcK+Uq04EQyZLKIQBW
         yEknq64e1waoNExlJujNh9hs4Hp8VIuPbNsuD4CschAbScVHLkL0+8iZpW86IMWvIBk4
         WKHsXLPohVoaUYvdGEjsKoxV9U+Rj41opxRSgXBKI6YeXDyrZ9VzAvvZ6kOYZgaMtyvg
         Ja9FBXuHjUQ9LHKTN2DZ8CtJekC9FAYkNRxCr1LxbrGpwczs3KJ1qxH4LIcL7JIqRj9s
         UGCw==
X-Forwarded-Encrypted: i=1; AJvYcCXKx3U7+FQwyrZX5Z6w0v2dEZKEsQ6aN4RUBOtE4gwoSnRmsiZV//yDpPWt6keryREH3IrUTCpfB82Dv7w/Fw/Rqr4Ky8+7gK6Hl90=
X-Gm-Message-State: AOJu0YzJY+vx1o3YlmRMZFSwnBzugCII3IpOe7Cf4AIG8VgYD1dSs+Gn
	Kanbv/gmz5LkyAvUXlawy9aPxkZwil4ZXhiisoW8gDz4zZ3BWgTQ+T3IUwgahbneteQkjAdkrOo
	HA6Eb
X-Google-Smtp-Source: AGHT+IGm3/MlK4xSvWFliz9pbQJUcFLqVZdQMUENkBIb+8FibniIc836B7YDzsZJjekH+k2pUNJ5SQ==
X-Received: by 2002:a05:6512:31d4:b0:52c:8fba:e2a1 with SMTP id 2adb3069b0e04-52c8fbae3d6mr1586160e87.18.1718056347870;
        Mon, 10 Jun 2024 14:52:27 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f2f8bd62esm70909866b.141.2024.06.10.14.52.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 14:52:27 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6f0e153eddso269025366b.0
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 14:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxzINqHJllbhsThtelebT3wLfoAq0RqpcDrVlAAA2KAuh8MCJebDkEVJRpK/yfu1Q6V78zzyk42dC9iuq4/KKRt2zkdGXe6fMSXrU=
X-Received: by 2002:a17:907:1006:b0:a6e:f52a:c34f with SMTP id
 a640c23a62f3a-a6ef52ac3fbmr547977766b.18.1718056332086; Mon, 10 Jun 2024
 14:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-3-2f7bc0ee2030@chromium.org> <20240610141402.GB13744@pendragon.ideasonboard.com>
In-Reply-To: <20240610141402.GB13744@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 10 Jun 2024 23:51:55 +0200
X-Gmail-Original-Message-ID: <CANiDSCsNdZyKMM82q9SqZ-hQH2Pch24rVCqSs=L6mFL=RbJqQg@mail.gmail.com>
Message-ID: <CANiDSCsNdZyKMM82q9SqZ-hQH2Pch24rVCqSs=L6mFL=RbJqQg@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: uvcvideo: Probe the PLF characteristics
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 10 Jun 2024 at 16:14, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Mar 18, 2024 at 11:55:25PM +0000, Ricardo Ribalda wrote:
> > The UVC 1.5 standard defines 4 values for the PLF control: Off, 50Hz,
> > 60Hz and Auto. But it does not clearly define if all the values must be
> > implemented or not.
> >
> > Instead of just using the UVC version to determine what the PLF control
> > can do, probe it.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 54 +++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 50 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 67522143c6c85..9a0b81aca30d1 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -501,12 +501,58 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> >  static int uvc_ctrl_add_plf_mapping(struct uvc_video_chain *chain,
> >       struct uvc_control *ctrl, const struct uvc_control_mapping *mapping)
> >  {
> > +     const struct uvc_control_mapping *out_mapping =
> > +                                     &uvc_ctrl_power_line_mapping_uvc11;
> > +     u8 init_val;
> > +     u8 *buf;
>
>         u8 *buf __free(kfree) = NULL;
>
> will simplify the exit paths.
>
> > +     int ret;
> > +
> > +     buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> > +     if (!buf)
> > +             return -ENOMEM;
> > +
> > +     /* Save the default PLF value, so we can restore it. */
> > +     ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, ctrl->entity->id,
> > +                          chain->dev->intfnum, ctrl->info.selector,
> > +                          buf, sizeof(*buf));
>
> That's the current value, not the default. Is that intended ?

Yes, the driver does not init the other controls to the default value.
So I'd rather be consistent.

>
> > +     /* If we cannot read the control skip it. */
> > +     if (ret) {
> > +             kfree(buf);
> > +             return ret;
> > +     }
> > +     init_val = *buf;
> > +
> > +     /* If PLF value cannot be set to off, it is limited. */
> > +     *buf = V4L2_CID_POWER_LINE_FREQUENCY_DISABLED;
> > +     ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > +                          chain->dev->intfnum, ctrl->info.selector,
> > +                          buf, sizeof(*buf));
> > +     if (ret) {
> > +             out_mapping = &uvc_ctrl_power_line_mapping_limited;
> > +             goto end;
>
> If setting the value failed you don't need to restore it, do you ?
>
> > +     }
> > +
> > +     /* UVC 1.1 does not define auto, we can exit. */
> >       if (chain->dev->uvc_version < 0x150)
> > -             return __uvc_ctrl_add_mapping(chain, ctrl,
> > -                                           &uvc_ctrl_power_line_mapping_uvc11);
> > +             goto end;
> > +
> > +     /* Check if the device supports auto. */
> > +     *buf = V4L2_CID_POWER_LINE_FREQUENCY_AUTO;
> > +     ret = uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > +                          chain->dev->intfnum, ctrl->info.selector,
> > +                          buf, sizeof(*buf));
>
> Now for the real annoying question. I've encountered quite a few devices
> that would crash when the driver tried to get/set lots of controls at
> probe time. This is why the control cache is populated the first time a
> control is queried, and not when the device is probed. I'm always
> worried when adding more control accesses at probe time that some
> devices will behave improperly.

If we encounter a device like that we could quirk it.

>
> Given the number of UVC users I tend to be on the conservative side, but
> obviously, if we were to strictly avoid new access patterns to the
> device, the driver wouldn't be able to evolve. I do like patches 4/5 and
> 5/5, so I'm tempted to take the risk and revert this series later if
> needed. That would likely make some other users unhappy if they rely on
> the heuristic.
>
> Another issue is how to get vendors to implement the power line
> frequency control correctly. With the series applied, vendors won't
> notice they're doing something wrong. Of course, they probably don't
> check the behaviour of their devices with Linux in the first place, so
> I'm not sure what we could do.

We can add the check to v4l2-compliance....

Although I would love to see a uvc-compliance tool. If the tool can be
easily run in windows/linux without a driver I guess ISP vendors will
run it to validate their code.
Right now there is no way to validate a usb camera beyond: it runs in
windows and in cheese.

>
> > +     if (!ret)
> > +             out_mapping = &uvc_ctrl_power_line_mapping_uvc15;
> > +
> > +end:
> > +     /* Restore initial value and add mapping. */
> > +     *buf = init_val;
> > +     uvc_query_ctrl(chain->dev, UVC_SET_CUR, ctrl->entity->id,
> > +                    chain->dev->intfnum, ctrl->info.selector,
> > +                    buf, sizeof(*buf));
> >
> > -     return __uvc_ctrl_add_mapping(chain, ctrl,
> > -                                   &uvc_ctrl_power_line_mapping_uvc15);
> > +     kfree(buf);
> > +     return __uvc_ctrl_add_mapping(chain, ctrl, out_mapping);
> >  }
> >
> >  static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

