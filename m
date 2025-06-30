Return-Path: <linux-media+bounces-36295-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5696BAEDEF5
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42C1D188AA16
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B901289E3D;
	Mon, 30 Jun 2025 13:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NYJUclhE"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8F2522B6
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289998; cv=none; b=RU+9vWRmzpBoFN963kAomaRoGalDdvrw2OC2CBIelypkClsuDxKJCFhAuVhL51MOmOm9te01+rLNg10uUEK/E9WvA7+PCMA0oqMg4HQR8nSkwHRrPyk2lI/PRSU0ya4mUqtOIR1TnVzaUJutfOIacqxkg0PeOQTsGr0MhKa8tUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289998; c=relaxed/simple;
	bh=M1gIl4A5i8ayEO1pxADobOUImr5L3pLVRkhSls5BvUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDc2qNZG16mJ7Mz4yHrr/v5hRjbKYebGoLNRq7lG70GtibVtkQ0/xakUw+ArZeqNOk7E3UvRMJo3mSDE8gRYKPaPJZKGLbdsURu9POMGN+1hrGfLjvX8jDqWfv/l1rtSBpnp4M/86Lak26EQCSFxuwS24R48Kvu1Lk5Ao/ZRxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NYJUclhE; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b7123edb9so21689781fa.2
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 06:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751289995; x=1751894795; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NYKy3F2tRQ3p0Wg9vlb3oxo+88BM8VahKr4/uuCEpwI=;
        b=NYJUclhEbWpXxXdRlEvRtbJ2VPNcZQof2RBVvBoZBFkst9AbFiRMiW8HVK62xt70hk
         Y35n4PblDSltHlY4/ZA7Ch5QW88IChcZclzT0WzSrERP2SQkuW5SFVjbGOWyrhT/HyB9
         4Nm1Rf+XVz35RY1U3Ux47QIVsOSibsnm7tuKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289995; x=1751894795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYKy3F2tRQ3p0Wg9vlb3oxo+88BM8VahKr4/uuCEpwI=;
        b=kkkoGBix80GNWoZKjU1XoeIhwBS7HpRb43gDyaomXPoW+dLxSqwLW4jsfteanou4sO
         5NkesGguiMnLkHAwJDq3z1GHFK6TP29RyR20u4CJhvhXkjP/dyhHK2SAkf8flIwlIIv6
         J1N6h43BFeTr/QuF6g7gUepXKxXqAhBAwDboQ9ceZFMpKVlMwKL8pg/5+efFoMUJbonz
         lPEJgb8kYJ8QRDRzvdlL+43dlJMz8owe7NMrnZ0Sz2DQ+KQsGKiAnJ8ujZx/pW2DYaQD
         UrziWUT2hTQo2JbIB5EUgdJAMGbiYBXEWBI+wqUwwv6EbouWM9pQPJ13QUtx9m52IojQ
         Pd8w==
X-Forwarded-Encrypted: i=1; AJvYcCUcJZ44Zsl0ipIauyzOyB1XHcTVVNE+fVGxqLHFOI2ShiuU18BLKbUZO2Jw/ghtPr/O+BUFBfoV8JGy9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAGmwfKZ/Ma9LkP2yQgasIjhVIPWN2oW4lELd1ExrPJe9rCZYH
	w5i25tjkCRutINp1jgCM2IoeQBXkpRvRgVB5b0sAUt1VTM+fsBW+Uu8lNPMzU24PY4z/v+XiOGs
	WDOE+UA==
X-Gm-Gg: ASbGncvp0MA0z8oAkZZALYNTG3jWqLBQ2wsgwzyrEx0VkAfMXVrDsypLKrCRI4Zg0Fl
	07JbSCNkB+2LhYAEi8cZcQ/3ef/LsYw7pgshi8BzK7nL66j7yH2YTkEmIFOiK87l24OpwVKTb2+
	K2VZSTNBsTnUcq8cTY2icv1ud8KqZwyzTMgr77B0RRNGp0OgACSAx1LfIIK4r/VbwIPP9teLStI
	BziK9ELDuG/jS+32H09CrJ0h5y8MCrTuyejvsUmdVBPBGjINC6DWWgxXKsJs6Vydn3fY1mpdoJy
	r0MWXBw3lAjgXSi6QxPlG7Zf3AHW8L0G0Jc41BW6ck0IicrzU/5nJydhtXdwJ4QqIIKSgdvnvpI
	Bc5afxM+8W251Usdv3U500ePV
X-Google-Smtp-Source: AGHT+IHs785rSuGPHHgvNJODUs3I2voMJnrr63AHffQUCtJ2yMyGXdxTgCrUDYg1CR3zuQfMKSQp2w==
X-Received: by 2002:a05:651c:12c7:b0:32b:47be:e1a5 with SMTP id 38308e7fff4ca-32cdc5270e1mr33595331fa.39.1751289994457;
        Mon, 30 Jun 2025 06:26:34 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e0c0d1sm12384631fa.28.2025.06.30.06.26.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:26:34 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so2251818e87.2
        for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 06:26:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVn1IYW4uZ6VIjx2NNmVSirYeaKxpWcNmOuh/83JQkC50IUfgYvIYNqYtJToABph1OOQdmFzROoVVyyvQ==@vger.kernel.org
X-Received: by 2002:a05:6512:b1c:b0:553:ae51:1066 with SMTP id
 2adb3069b0e04-5550b82a987mr4432157e87.12.1751289993106; Mon, 30 Jun 2025
 06:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616-uvc-fop-v4-0-250286570ee7@chromium.org>
 <20250616-uvc-fop-v4-3-250286570ee7@chromium.org> <04e10cfa-f1b1-4327-b0ca-c66f8450d42f@xs4all.nl>
 <c97af8e7-5c11-45f4-838c-d934b0a379c1@kernel.org> <20250630131004.GF20333@pendragon.ideasonboard.com>
 <d449ae59-11a2-436e-a51c-cf2fa3657ba2@kernel.org> <20250630132438.GC23516@pendragon.ideasonboard.com>
In-Reply-To: <20250630132438.GC23516@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Jun 2025 15:26:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCvAtKJdwLONx1crMOB5So8qgcSheEwYnxBggN3y11LkPw@mail.gmail.com>
X-Gm-Features: Ac12FXwvKUIA629DH0E0JvIObI7A8b82i8Me-5Azyiq6zhmwYQ-DqwoYZeZa2es
Message-ID: <CANiDSCvAtKJdwLONx1crMOB5So8qgcSheEwYnxBggN3y11LkPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] media: uvcvideo: Split uvc_stop_streaming()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Jun 2025 at 15:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 30, 2025 at 03:12:38PM +0200, Hans de Goede wrote:
> > On 30-Jun-25 3:10 PM, Laurent Pinchart wrote:
> > > On Mon, Jun 30, 2025 at 02:59:05PM +0200, Hans de Goede wrote:
> > >> On 17-Jun-25 11:27 AM, Hans Verkuil wrote:
> > >>> On 16/06/2025 17:24, Ricardo Ribalda wrote:
> > >>>> uvc_stop_streaming() is used for meta and video nodes. Split the function
> > >>>> in two to avoid confusion.
> > >>>>
> > >>>> Use this opportunity to rename uvc_start_streaming() to
> > >>>> uvc_start_streaming_video(), as it is only called by the video nodes.
> > >>>>
> > >>>> Reviewed-by: Hans de Goede <hansg@kernel.org>
> > >>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >>>> ---
> > >>>>  drivers/media/usb/uvc/uvc_queue.c | 22 +++++++++++++++-------
> > >>>>  1 file changed, 15 insertions(+), 7 deletions(-)
> > >>>>
> > >>>> diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
> > >>>> index 8f9737ac729546683ca48f5e71ce3dfacbae2926..3f357c2d48cfd258c26f0342007d1d12f1e01007 100644
> > >>>> --- a/drivers/media/usb/uvc/uvc_queue.c
> > >>>> +++ b/drivers/media/usb/uvc/uvc_queue.c
> > >>>> @@ -167,7 +167,7 @@ static void uvc_buffer_finish(struct vb2_buffer *vb)
> > >>>>                  uvc_video_clock_update(stream, vbuf, buf);
> > >>>>  }
> > >>>>
> > >>>> -static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> > >>>> +static int uvc_start_streaming_video(struct vb2_queue *vq, unsigned int count)
> > >>>>  {
> > >>>>          struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > >>>>          struct uvc_streaming *stream = uvc_queue_to_stream(queue);
> > >>>> @@ -186,14 +186,22 @@ static int uvc_start_streaming(struct vb2_queue *vq, unsigned int count)
> > >>>>          return ret;
> > >>>>  }
> > >>>>
> > >>>> -static void uvc_stop_streaming(struct vb2_queue *vq)
> > >>>> +static void uvc_stop_streaming_video(struct vb2_queue *vq)
> > >>>>  {
> > >>>>          struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > >>>>
> > >>>>          lockdep_assert_irqs_enabled();
> > >>>>
> > >>>> -        if (vq->type != V4L2_BUF_TYPE_META_CAPTURE)
> > >>>> -                uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> > >>>> +        uvc_video_stop_streaming(uvc_queue_to_stream(queue));
> > >>>> +
> > >>>> +        uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> > >>>> +}
> > >>>> +
> > >>>> +static void uvc_stop_streaming_meta(struct vb2_queue *vq)
> > >>>> +{
> > >>>> +        struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
> > >>>> +
> > >>>> +        lockdep_assert_irqs_enabled();
> > >>>>
> > >>>>          uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
> > >>>>  }
> > >>>> @@ -203,15 +211,15 @@ static const struct vb2_ops uvc_queue_qops = {
> > >>>>          .buf_prepare = uvc_buffer_prepare,
> > >>>>          .buf_queue = uvc_buffer_queue,
> > >>>>          .buf_finish = uvc_buffer_finish,
> > >>>> -        .start_streaming = uvc_start_streaming,
> > >>>> -        .stop_streaming = uvc_stop_streaming,
> > >>>> +        .start_streaming = uvc_start_streaming_video,
> > >>>> +        .stop_streaming = uvc_stop_streaming_video,
> > >>>>  };
> > >>>>
> > >>>>  static const struct vb2_ops uvc_meta_queue_qops = {
> > >>>>          .queue_setup = uvc_queue_setup,
> > >>>>          .buf_prepare = uvc_buffer_prepare,
> > >>>>          .buf_queue = uvc_buffer_queue,
> > >>>> -        .stop_streaming = uvc_stop_streaming,
> > >>>> +        .stop_streaming = uvc_stop_streaming_meta,
> > >>>>  };
> > >>>
> > >>> I think there should be a comment stating that the metadata stream
> > >>> expects that video is streaming, it does not start streaming by itself.
> > >>>
> > >>> Something like:
> > >>>
> > >>>   /*
> > >>>    * .start_streaming is not provided here. Metadata relies on
> > >>>    * video streaming being active. If video isn't streaming, then
> > >>>    * no metadata will arrive either.
> > >>>    */
> > >>>
> > >>> It's unexpected that there is no start_streaming for metadata, so a
> > >>> comment wouldn't hurt.
> > >>
> > >> I've added this comment while merging this series and I've now pushed
> > >> the entire series to uvc.git/for-next .
> > >>
> > >> BTW it seems that both uvc.git/next and uvc.git/for-next are in
> > >> use now?  With uvc.git/next seemingly following media-commiters/next ?
> > >
> > > As far as I understand, some jobs in the media CI use the next branch,
> > > for instance the bisect job that tries to compile every commit uses the
> > > next branch as a base. We therefore need to keep the next branch
> > > up-to-date, mirroring upstream.
> >
> > Ok, so we have the next branch mirroring upstream and then we
> > use for-next to merge new patches as I've just done ?
>
> Sounds good.

BTW the auto-mirroring from media-committers has not been enabled. Do
you want it?

>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

