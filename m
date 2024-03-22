Return-Path: <linux-media+bounces-7582-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3396886826
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 09:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81AF728282D
	for <lists+linux-media@lfdr.de>; Fri, 22 Mar 2024 08:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A78914ABC;
	Fri, 22 Mar 2024 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RPyDmw9G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FF2171C9
	for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 08:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711095780; cv=none; b=U+XOFDMSwKhZu+5yk7x8cMleNE6YsFGHKgti26DC7Nk8naMMd7JpLXt4o8kKvqKLoqhg3tr/f6VlONchbb9PUseXtPlBTOsWcDwID69DoXvtNVhsMHf5wt9nQp+4qbjHnGTryIqu8TpGjDCY0oNGCVFPv0WGCHGP2KAkj/7HRwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711095780; c=relaxed/simple;
	bh=fpCoiLmXxI9qiJhzsLseFGJE1mlYGa6QJuto7FOwQ7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xgqge1wy2IEaqg/c1RAb2Ey2pgtZ6fNhof9V9GkYsAU+9SCx2U7/my4J0AEIZ9Ty/1vfk0cUGLkNUEYJvu+dEm/C3sunikIViqp6NmWPSGhn474kidKbk2QryN15l3eecjklvnUeBia3WMHnAkDOcr9ZdfIOHO97zvTjV1SY0kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RPyDmw9G; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-789db18e169so141809585a.1
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711095777; x=1711700577; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ob+YyW8fixoBQX9n6g1bpmXJDOp1r9Uolwp6GpqIv4=;
        b=RPyDmw9Gp88AANEc270UUeILYJKls/v1L3/wOvgB+hTwN/Pqh6AhV2ZZO1fLSh8ZCF
         xxPZIRT5Qa9kbKoZAYCHuPVNF98MYEpXpqegQy/P69lOrTplguamzhbecI+8DPrjHJZM
         bJ1YVlZzN+i4KjVQJEt9tf/udg2IT/mzOlu/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711095777; x=1711700577;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ob+YyW8fixoBQX9n6g1bpmXJDOp1r9Uolwp6GpqIv4=;
        b=Wo6jOLkkl9CdfLhn2WT9EQ0zR/nzZEWJm0OgGOdoImlG8WKEwKLtExxTWzjGropslS
         6rwK7kTe8pbq2vQuOzkGzX9sDhWF72jJTg2brZ2MgnvHCkf46F3c5VQCaZav2TwHWc4w
         SQjOEl4rp6LDIg84FjYtqRO6j4oaohPTxj6lb+GV5f4Qihp9pFV6CNB+ntfA5LOkWNvZ
         187cpakK4RT1O396v3U9MBDBVv5hsC+q7WLVGhXCal+6i6y2VuqOD8pQyUO885YU0bO0
         iyIWP4hIhS1q5N0ThOfE3g9soPcXJnbsvBuUXvZ/4jC23pJMFGATPu+anj7zQaqlfWpI
         iXxg==
X-Forwarded-Encrypted: i=1; AJvYcCXx2VQU1AdfFr1g4OPAV75V0+85Oc2bTmOVTU8f2hpeOgWYGssXylSecrJToQrg4zQQy1WE7ANuR55pv4QtaAbnBr9GzdwfLbnQjG8=
X-Gm-Message-State: AOJu0YzLn//6RcscgbZwj5EMZ7vLVq+/XpkMGB2pZ+IVQti1JjMG10Lz
	OwPyt40XKiSvlA5a8zp3EP6ZxeSmXL4M809FTjYI+2SOWCUIa1HMut9ROZHaBAaC9NjwYZQwJQA
	=
X-Google-Smtp-Source: AGHT+IF4I8TFA4fjVkh5s3A8ZT/X1pftfJla8nnIB7wgl9wrbsF7K7bIAKqRNDEovkKEH4dJbgjstA==
X-Received: by 2002:a05:620a:2912:b0:78a:3a95:8052 with SMTP id m18-20020a05620a291200b0078a3a958052mr1148074qkp.5.1711095777489;
        Fri, 22 Mar 2024 01:22:57 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id a12-20020a05620a02ec00b00789fa326156sm590798qko.82.2024.03.22.01.22.56
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 01:22:56 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6963cf14771so17180866d6.3
        for <linux-media@vger.kernel.org>; Fri, 22 Mar 2024 01:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWH9xxBflg1FfDGCGUTUko+ReoxUWr5WJ1zU/imR6N6nMEvX7Gdzol5vAYLIUVC28+BNQKGWQgnnBKSS7AM5eDLAF3bc0/a50C2/NI=
X-Received: by 2002:a05:6214:1c0c:b0:691:873a:7753 with SMTP id
 u12-20020a0562141c0c00b00691873a7753mr1427986qvc.38.1711095776052; Fri, 22
 Mar 2024 01:22:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220920-resend-hwtimestamp-v9-0-55a89f46f6be@chromium.org>
 <20220920-resend-hwtimestamp-v9-2-55a89f46f6be@chromium.org> <20240321232602.GB20938@pendragon.ideasonboard.com>
In-Reply-To: <20240321232602.GB20938@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 22 Mar 2024 09:22:39 +0100
X-Gmail-Original-Message-ID: <CANiDSCt7Y4v3MUCoVyuzwLg6rq1=4MTUGtJ1+HkMMRY7sfjYjA@mail.gmail.com>
Message-ID: <CANiDSCt7Y4v3MUCoVyuzwLg6rq1=4MTUGtJ1+HkMMRY7sfjYjA@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] media: uvcvideo: Ignore empty TS packets
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

Hi, I added some minor modifications, hope that it is fine with you.

Thanks!!

On Fri, 22 Mar 2024 at 00:26, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Mar 15, 2023 at 02:30:13PM +0100, Ricardo Ribalda wrote:
> > Some SunplusIT cameras took a borderline interpretation of the UVC 1.5
> > standard, and fill the PTS and SCR fields with invalid data if the
> > package does not contain data.
> >
> > "STC must be captured when the first video data of a video frame is put
> > on the USB bus."
> >
> > Eg:
>
> "Some SunplusIT devices send, e.g.,"
>
> >
> > buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> > buffer: 0xa7755c00 len 000012 header:0x8c stc 00000000 sof 0000 pts 00000000
> > buffer: 0xa7755c00 len 000668 header:0x8c stc 73779dba sof 070c pts 7376d37a
>
> "while the UVC specification meant that the first two packets shouldn't
> have had the SCR bit set in the header."
>
> >
> > This borderline/buggy interpretation has been implemented in a variety
> > of devices, from directly SunplusIT and from other OEMs that rebrand
> > SunplusIT products. So quirking based on VID:PID will be problematic.
> >
> > All the affected modules have the following extension unit:
> > VideoControl Interface Descriptor:
> >   guidExtensionCode         {82066163-7050-ab49-b8cc-b3855e8d221d}
> >
> > But the vendor plans to use that GUID in the future and fix the bug,
> > this means that we should use heuristic to figure out the broken
> > packets.
>
> Because it would have been too easy otherwise of course :-)
>
> >
> > This patch takes care of this.
> >
> > lsusb of one of the affected cameras:
> >
> > Bus 001 Device 003: ID 1bcf:2a01 Sunplus Innovation Technology Inc.
> > Device Descriptor:
> >   bLength                18
> >   bDescriptorType         1
> >   bcdUSB               2.01
> >   bDeviceClass          239 Miscellaneous Device
> >   bDeviceSubClass         2 ?
> >   bDeviceProtocol         1 Interface Association
> >   bMaxPacketSize0        64
> >   idVendor           0x1bcf Sunplus Innovation Technology Inc.
> >   idProduct          0x2a01
> >   bcdDevice            0.02
> >   iManufacturer           1 SunplusIT Inc
> >   iProduct                2 HanChen Wise Camera
> >   iSerial                 3 01.00.00
> >   bNumConfigurations      1
> >
> > Tested-by: HungNien Chen <hn.chen@sunplusit.com>
> > Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 20 +++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index 4ff4ab4471fe..1f416c494acc 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -478,6 +478,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       ktime_t time;
> >       u16 host_sof;
> >       u16 dev_sof;
> > +     u32 dev_stc;
> >
> >       switch (data[1] & (UVC_STREAM_PTS | UVC_STREAM_SCR)) {
> >       case UVC_STREAM_PTS | UVC_STREAM_SCR:
> > @@ -526,6 +527,23 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       if (dev_sof == stream->clock.last_sof)
> >               return;
> >
> > +     dev_stc = get_unaligned_le32(&data[header_size - 6]);
> > +
> > +     /*
> > +      * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
> > +      * standard states that it "must be captured when the first video data
> > +      * of a video frame is put on the USB bus".
> > +      * Most of the vendors, clear the `UVC_STREAM_SCR` bit when the data is
> > +      * not valid, other vendors always set the `UVC_STREAM_SCR` bit and
> > +      * expect that the driver only samples the stc if there is data on the
> > +      * packet.
> > +      * Ignore all the hardware timestamp information if there is no data
> > +      * and stc and sof are zero.
> > +      */
>
> I'd like to expand this a bit (partly to make sure I understand the
> issue correctly):
>
>         /*
>          * STC (Source Time Clock) is the clock used by the camera. The UVC 1.5
>          * standard states that it "must be captured when the first video data
>          * of a video frame is put on the USB bus". This is generally understood
>          * as requiring devices to clear the payload header's SCR bit before
>          * the first packet containing video data.
>          *
>          * Most vendors follow that interpretation, but some (namely SunplusIT)
namely SunplusIT on some devices
>          * always set the `UVC_STREAM_SCR` bit, fill the SCR field with 0's,
>          * and expect that the driver only processes the SCR if there is data in
>          * the packet.
>          *
>          * Ignore all the hardware timestamp information if we haven't received
>          * any data for this frame yet, the packet contains no data, and both
>          * STC and SOF are zero. This heuristics should be safe on compliant
>          * devices. This should be safe with compliant devices, as in the very
>          * unlikely case where a UVC 1.1 device would send timing information
>          * only before the first packet containing data, and both STC and SOF
>          * happen to be zero for a particular frame, we would only miss one
>          * clock sample and the clock recovery algorithm wouldn't suffer from
one clock sample from many
>          * this condition.
>          */
>
> Is this correct (and fine with you) ? If so,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > +     if (buf && buf->bytesused == 0 && len == header_size &&
> > +         dev_stc == 0 && dev_sof == 0)
> > +             return;
> > +
> >       stream->clock.last_sof = dev_sof;
> >
> >       host_sof = usb_get_current_frame_number(stream->dev->udev);
> > @@ -564,7 +582,7 @@ uvc_video_clock_decode(struct uvc_streaming *stream, struct uvc_buffer *buf,
> >       spin_lock_irqsave(&stream->clock.lock, flags);
> >
> >       sample = &stream->clock.samples[stream->clock.head];
> > -     sample->dev_stc = get_unaligned_le32(&data[header_size - 6]);
> > +     sample->dev_stc = dev_stc;
> >       sample->dev_sof = dev_sof;
> >       sample->host_sof = host_sof;
> >       sample->host_time = time;
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

