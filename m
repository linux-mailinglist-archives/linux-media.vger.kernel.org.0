Return-Path: <linux-media+bounces-45145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D662BF79CA
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 18:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 25DB3501F52
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A351345CD2;
	Tue, 21 Oct 2025 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SR8jrrOh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B45343D9B
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 16:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761063375; cv=none; b=gmjBEjLNFsw8zenZPz6xYQwv3ruTR71Z7fpKLEKiut5dIcLbE2izCj0TSIl5eFW0En9fig3eQQ1uvnmvQjL8TsiBltX7NDLAFsb+k47wc2XY/luqvxjnd//h9QPKAmCn0DP+WdvZrcfRzu71JuMtNTGQjPkQrBtB9cLJnL2GZJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761063375; c=relaxed/simple;
	bh=Zq8iZc6Eo3c5hTIu5jsoB64J7Z71E2l4DV/FakgrlbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Urf55WXFoaXR6jSOv+E36bk/p/8XYyvlOvc2GImLzZVgXXT5X3ZltGcik5bOELt0bwmiF+3sAru9HMsSWcubC4kQAddMyZq6ZOTAiw2DrW1rRE1BHpP84aKioHr0DK5255hFGlO0QfJn6bBoXr3gpIXSDFzTSqu5gkI0+Js+cjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SR8jrrOh; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7930132f59aso7744621b3a.0
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761063372; x=1761668172; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SXEEfWLImx3JUqZZ/tH4v4lMv+RtTDD2xX9HGJ/Xm8k=;
        b=SR8jrrOhfhNoEe7ssq8n5hKtHcs3662VlcWb3iyEvaZqAjeAV9P7Khh1IkJyUtXdy0
         zXQShpL+9srRa0sIlAq9EbTHhkpAU+wIQLxJM15RP/H2gB7HYcEeAZgeai8xfNWgqR9H
         oHYd54sBmkQtPgmcXiOwtkEdA7WYvGg94o/88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761063372; x=1761668172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXEEfWLImx3JUqZZ/tH4v4lMv+RtTDD2xX9HGJ/Xm8k=;
        b=eAhAGr0DlGzjwBpcESJTq0Xgpb9bNc0pbrBdWGXgFmNV3BO2wI+RwX0yXooGCro9Y1
         y84l3w7Hw/bAPiiyOB+ehoLRhgzxNzKMjI6Tck5y8Gx8eoqN3NTw1UaY7bATT7N4TNI6
         JWdtlSd2BdX5aAYYXvRMdifiphED4ye0boE7krQCXJsVOTF6DpulVbczGD4Oih9AolRA
         4gyFjYm1OpDBv3Dr2sDP/y4H+Mxs6SffMtzfcN7v3+PMiy9gnXRhrPB3x0LEEtw7wWhg
         OAgDQ50ST0miygJS0wyWaat0Cll+OVf8Dwu2G4iG9Se6AlBHqXSOnKgyQJ0o5r/rFQFJ
         z0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIcbkR0rtOk4DvI4AO0ScSWvF+nRxfM3zfNI3BSdyCkz1v7mGm9kiDZR9mHJ06OjHKPkaB0x0lHD8NDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5m6El6rKx6Ep7y7UvaWOKDShaClwPx9BIvVVIrSflTco1Lf05
	7U/gDAzPbutw6PqVUfWiGFcFTxzYx47gc6GMPUk5EemPJy2iuw2yFrbKUY0uVkMCI45tO8n+Ws4
	JGXpxvQ==
X-Gm-Gg: ASbGnctMgbs3ZhKjDhxpil7m1xE8DvFMfvZHaGNyuVgMm69dbUXs6neZoR4oYsjwNXA
	Hf1y7J2ZXkC1367weiJates1zvDKNvJmJfZwkrDzpwbS+T/fevTpPQxHYBN84Se6BTPsL+WwHeX
	0YAJvA1W1ywrjWYlCaG0jQ1ZoxALdcczmX6yg6zbSMmQFhkzgghJPjx6E8BCEHhysdP/B9JezhU
	Y/zlyg1fuxhDtCinmi60IMe3Xe30frZDTT4Na/e6Y21rDnF5E61FWxYKE9JYmjhakIfvMvehi66
	KmUQ+M4hlMYuraCAaR7hbLKNh0Txq3Bffuu/tKP3sWV0FSPOL+5sqr5Zx6ed3ROfvPmoNYgEH1w
	r+M6ooi1sQXQfSG2PfQ39Iu8NJFXCjvAVjDpRjc4DGyhCrZMi1iQhuLWDY2Qdse30cw6Mfc0bCq
	BtjS0AZs5Pj/D8W6xH2kfldJFT+ZKQAMago/3FxcqPLb+3KiVWex3E
X-Google-Smtp-Source: AGHT+IE+/ZlsbAhoyYsR8Jc46JuC/lMq2IXwqMl0pK5NKhDalbMyUOS9fmTsZsRxYBr8dqxUyT8awg==
X-Received: by 2002:a17:90b:3e43:b0:334:2a38:2a05 with SMTP id 98e67ed59e1d1-33bcf86b628mr24223309a91.8.1761063372111;
        Tue, 21 Oct 2025 09:16:12 -0700 (PDT)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5df925c4sm11578326a91.18.2025.10.21.09.16.10
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 09:16:10 -0700 (PDT)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a213c3c3f5so7466967b3a.3
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 09:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXblGLpPQaS41o0LSGYCWhj16BSF1WVM11hB7BodL/hLjQtdwTsoCGUY9zgNwrw+naKgjRmFzP6iOhPuA==@vger.kernel.org
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id
 d9443c01a7336-290c9cf8e7fmr223158245ad.12.1761063369954; Tue, 21 Oct 2025
 09:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-uvc-grandstream-v2-1-6a74a44f4419@chromium.org> <b282f6ef-fd91-44ea-bf51-187cf2c56fc6@kernel.org>
In-Reply-To: <b282f6ef-fd91-44ea-bf51-187cf2c56fc6@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Oct 2025 18:15:54 +0200
X-Gmail-Original-Message-ID: <CANiDSCvr-BR7wZVK2gW0wYEQjyFHTpZv7nnR4JVi6bMUyGNCoQ@mail.gmail.com>
X-Gm-Features: AS18NWDmZAnceyCVjQ_kSBGA-M4GHuvSkJw28yjWvXcX-dRpnIvp7ZCUnBJsf9k
Message-ID: <CANiDSCvr-BR7wZVK2gW0wYEQjyFHTpZv7nnR4JVi6bMUyGNCoQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Use heuristic to find stream entity
To: Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, Angel4005 <ooara1337@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans(es)

On Tue, 21 Oct 2025 at 18:07, Hans de Goede <hansg@kernel.org> wrote:
>
> Hi,
>
> On 21-Oct-25 12:36, Ricardo Ribalda wrote:
> > Some devices, like the Grandstream GUV3100 webcam, have an invalid UVC
> > descriptor where multiple entities share the same ID, this is invalid
> > and makes it impossible to make a proper entity tree without heuristics.
> >
> > We have recently introduced a change in the way that we handle invalid
> > entities that has caused a regression on broken devices.
> >
> > Implement a new heuristic to handle these devices properly.
> >
> > Reported-by: Angel4005 <ooara1337@gmail.com>
> > Closes: https://lore.kernel.org/linux-media/CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com/
> > Fixes: 0e2ee70291e6 ("media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hansg@kernel.org>

Thanks for the prompt reply.

@Hverkil I think you are planning to push to /fixes soon. I believe
this patch should also land there.

>
> Regards,
>
> Hans
>
>
>
> > ---
> > I have managed to get my hands into a Grandstream GUV3100 and
> > implemented a new heuristics. (Thanks Yunke and Hidenori!).
> >
> > With this heuristics we can use this camera again (see the /dev/video0
> > in the topology).
> >
> > I have tested this change in a 6.6 kernel. Because the notebook that I
> > used for testing has some issues running master. But for the purpose of
> > this change this test should work.
> >
> > ~ # media-ctl --print-topology
> > Media controller API version 6.6.99
> >
> > Media device information
> > ------------------------
> > driver          uvcvideo
> > model           GRANDSTREAM GUV3100: GRANDSTREA
> > serial
> > bus info        usb-0000:00:14.0-9
> > hw revision     0x409
> > driver version  6.6.99
> >
> > Device topology
> > - entity 1: GRANDSTREAM GUV3100: GRANDSTREA (1 pad, 1 link)
> >             type Node subtype V4L flags 1
> >             device node name /dev/video0
> >         pad0: SINK
> >                 <- "Extension 3":1 [ENABLED,IMMUTABLE]
> >
> > - entity 4: GRANDSTREAM GUV3100: GRANDSTREA (0 pad, 0 link)
> >             type Node subtype V4L flags 0
> >             device node name /dev/video1
> >
> > - entity 8: Extension 3 (2 pads, 2 links, 0 routes)
> >             type V4L2 subdev subtype Unknown flags 0
> >         pad0: SINK
> >                 <- "Processing 2":1 [ENABLED,IMMUTABLE]
> >         pad1: SOURCE
> >                 -> "GRANDSTREAM GUV3100: GRANDSTREA":0 [ENABLED,IMMUTABLE]
> >
> > - entity 11: Processing 2 (2 pads, 3 links, 0 routes)
> >              type V4L2 subdev subtype Unknown flags 0
> >         pad0: SINK
> >                 <- "Camera 1":0 [ENABLED,IMMUTABLE]
> >         pad1: SOURCE
> >                 -> "Extension 3":0 [ENABLED,IMMUTABLE]
> >                 -> "Extension 4":0 [ENABLED,IMMUTABLE]
> >
> > - entity 14: Extension 4 (2 pads, 1 link, 0 routes)
> >              type V4L2 subdev subtype Unknown flags 0
> >         pad0: SINK
> >                 <- "Processing 2":1 [ENABLED,IMMUTABLE]
> >         pad1: SOURCE
> >
> > - entity 17: Camera 1 (1 pad, 1 link, 0 routes)
> >              type V4L2 subdev subtype Sensor flags 0
> >         pad0: SOURCE
> >                 -> "Processing 2":0 [ENABLED,IMMUTABLE]
> > ---
> > Changes in v2:
> > - Fix : invalid reference to the index variable of the iterator.
> > - Link to v1: https://lore.kernel.org/r/20251021-uvc-grandstream-v1-1-801e3d08b271@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..ee4f54d6834962414979a046afc59c5036455124 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -167,13 +167,26 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> >
> >  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> >  {
> > -     struct uvc_streaming *stream;
> > +     struct uvc_streaming *stream, *last_stream;
> > +     unsigned int count = 0;
> >
> >       list_for_each_entry(stream, &dev->streams, list) {
> > +             count += 1;
> > +             last_stream = stream;
> >               if (stream->header.bTerminalLink == id)
> >                       return stream;
> >       }
> >
> > +     /*
> > +      * If the streaming entity is referenced by an invalid ID, notify the
> > +      * user and use heuristics to guess the correct entity.
> > +      */
> > +     if (count == 1 && id == UVC_INVALID_ENTITY_ID) {
> > +             dev_warn(&dev->intf->dev,
> > +                      "UVC non compliance: Invalid USB header. The streaming entity has an invalid ID, guessing the correct one.");
> > +             return last_stream;
> > +     }
> > +
> >       return NULL;
> >  }
> >
> >
> > ---
> > base-commit: ea299a2164262ff787c9d33f46049acccd120672
> > change-id: 20251021-uvc-grandstream-05ecf0288f62
> >
> > Best regards,
>


-- 
Ricardo Ribalda

