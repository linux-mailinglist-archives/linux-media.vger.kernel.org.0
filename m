Return-Path: <linux-media+bounces-45148-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0EBF7CD7
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 18:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE177545D98
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10C1346D9D;
	Tue, 21 Oct 2025 16:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZY8hmFpg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDE8274B56
	for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761065844; cv=none; b=W6UxVyhfKRjetAqKGCr/qfWQnZJqjMCD8xjyQd4+rSVu14rkwd/wvRPET1/go4Jtu0QPpCnZof9Ny7xAf1QKLAXWcj63lAxGv786pAY/z3jE2Tx447OZCQMKdUjSCK2pXxKjIGf1RZ3iBmqQFJyPVdikNORY42GU5bODIkMxpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761065844; c=relaxed/simple;
	bh=G6YohIT+fs9B/+IJtYe9Q8CE/mpoodxFwGuynaMq7AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBMJUpNAoDd5OraWyBSy1bzMcJG680zfsf19M0tD7DBimPilXkOIjZYbYiw1VNv4nXfByCxzEEIPBuJIjvIbT6TESGq7Krhiyfx5RjSHCshGuZSEMvvSzebzzIfHTekUpstSesCoy/8VP+VYPQm7SMs70Y8ZdlBPeOSLpqyk6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZY8hmFpg; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77f5d497692so7142616b3a.1
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761065841; x=1761670641; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jAGSW6q4wKZt8ryYTbIpdoRikyV0yafrAaOHao5ZM9A=;
        b=ZY8hmFpg+SdTBIsqh/7t6gGoB3ZZIoq5LPFkiy20d48GQ3nAkxw4kVC/wieK6S/Qwn
         mNVOMhL1CWYw3QdI78SZ4+gTbQ+FQX6TtRf0AwGckh2eJFfCYoOpD/PEzMg/PbyAWkrf
         ymM23FhJH7bWA3rfj38OvEGZkufrQ3fZnFV2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761065841; x=1761670641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAGSW6q4wKZt8ryYTbIpdoRikyV0yafrAaOHao5ZM9A=;
        b=oqDA/I/59cRwOJ+zASi/ad2lwS7noTJS2NfuEyZIC7Z3pf68vgEYj0fJHFwaaRJ/fC
         F1NlAT9HzHIMJcHjfr9kHU70Wk/ySDSdJuauXt2/5IqICaFh2GbNgH10/9kZK6rGh83G
         3cBovZzIStafrMd9gNVMpM4OzUTjbS4N9Qc0B+xVZtoG/rYl1TZGAnqonJ/drsjaXzxj
         jq37FUWrEwQjJZxHzUz9q4tQT0vEywDsli0oTXC0PD4cEnJQiniNogZu7ZxAjt47l4Fm
         jp4xlZN8mSD8RkqKYjatVIF1eKAP1r47yeRySe5hg6412UtReZYofK4cuvgn2kTt836V
         cAng==
X-Forwarded-Encrypted: i=1; AJvYcCVpc8MPkPS2JunbkkFQRdwEsw1OMoZIZiuy0DhnDN4/JG54glF7WJZeTr0IiBXA5RazYzVkIBMtJ8xJjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK2sGeLPT/XfVWUdV1mudUysw4o8VrJxo4zFsgoJ5aa4qOQ92n
	zBHR8sukLkn4vVaXGVx6Oxp4Y5Kaxdme3hhbDDgZG2fs6vm3RTx99lG/z+E108pUMOvkJpvPXr+
	zWz+RIA==
X-Gm-Gg: ASbGncsKyrElhG6iBsFMWV2s5Cij1Hj29Ezr+BJe0E88KFIPXFJ4kxaryRYmnDO4mGd
	kZ3/+AGrZDJNx6x94p1rnWIZpAmMHuF/0dpfhyNCg57SrOkIHYrYOwZfLTyQFbGOUuJw9MpiDrZ
	v3g3tnxsDQ1hW0TeWpU90v35zk+Hj7cI1qGRm0bYALT82IYRZ56pjLflBhntsCOccGR2bgc0Dwm
	HaS0q/FmkOR3WCpBBCxevgn1nVx09vRc48SZuIOIEyHCRMqNCFbgLc0bwLOtoJkFAdZFFOKmjul
	ZTDuItTAWDU0QEIBs75kq3o+nD31m6qP7zwnu8gzLF1up9nuGxB4igKmB8BLVkojpJtUXAnEHAM
	7gyht7p4hyToVOWRknBY/FsGoznaNiEz36zeYhWlbpweH3l18cKnLHebXfcg6BaA8Eiz99Wm0/h
	6TlR9dX+OKc8DCNNzpsMoD31JpSlO3W1LhJjBWjtco1g==
X-Google-Smtp-Source: AGHT+IGAJIVA4ysdFSkLQp8LNdKlHia5WxsursDsslNO/1HKtiUIu4EmiTjaFA7Tvp2Sgx0h8Nn5Bw==
X-Received: by 2002:a05:6a00:929f:b0:77f:620f:45ac with SMTP id d2e1a72fcca58-7a220a43630mr23019046b3a.2.1761065840500;
        Tue, 21 Oct 2025 09:57:20 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com. [209.85.214.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff15b0csm11867442b3a.2.2025.10.21.09.57.19
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 09:57:19 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27eec33b737so87682295ad.1
        for <linux-media@vger.kernel.org>; Tue, 21 Oct 2025 09:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfxPGFh6427mbBNK4BICEu2URK2IzIZ1Lz1zGt9sHCsW+1Y4px69feNOpm5f/Kzwg8MzXc7bhgabzpdg==@vger.kernel.org
X-Received: by 2002:a17:902:f605:b0:26a:8171:dafa with SMTP id
 d9443c01a7336-290c9cbb0damr224548565ad.21.1761065838849; Tue, 21 Oct 2025
 09:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-uvc-grandstream-v2-1-6a74a44f4419@chromium.org> <20251021164443.GA727@pendragon.ideasonboard.com>
In-Reply-To: <20251021164443.GA727@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 21 Oct 2025 18:57:00 +0200
X-Gmail-Original-Message-ID: <CANiDSCsC6SgYJ-jSswPaeAw8RkxjZN4n23X35XbntNGcUsuRJQ@mail.gmail.com>
X-Gm-Features: AS18NWBUR2nh2BzwxnfnsMF19OfNSg3PVqZY-4xsxgcHOprFv4QmBZeGn7uF0gM
Message-ID: <CANiDSCsC6SgYJ-jSswPaeAw8RkxjZN4n23X35XbntNGcUsuRJQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Use heuristic to find stream entity
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, Angel4005 <ooara1337@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Tue, 21 Oct 2025 at 18:44, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Tue, Oct 21, 2025 at 10:36:17AM +0000, Ricardo Ribalda wrote:
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
>
> As far as I understand, the reason why we can't find the streaming
> interface here is because we have set the streaming output terminal ID
> to UVC_INVALID_ENTITY_ID, due to the extension unit being previously
> registered with the same ID. We're therefore adding a workaround on top
> of another workaround.
>
> Looking at the UVC descriptors for this camera, ID 4 is shared between
> an extension unit with GUID ffe52d21-8030-4e2c-82d9-f587d00540bd and the
> streaming output terminal. That GUID is apparently a Logitech GUID
> (according to https://github.com/soyersoyer/cameractrls/blob/c920e/cameractrls.py).
> I don't know if the XU actually works in that camera, but it could be
> useful to keep it functional.
>
> I think we could make the handling of non-unique IDs more clever. If an
> output streaming terminal and a unit share the same ID, we could
> allocate an unused ID for the output streaming terminal, and patch the
> bTerminalLink of the stream headers accordingly. The ID remapping should
> not cause other issues, as
>
> - streaming output terminals have no controls, so the ID isn't used to
>   reference controls
>
> - the units graph is build from sink to source, with UVC descriptors
>   containing the IDs of source units, so streaming output terminals are
>   never referenced by ID from descriptors except for the bTerminalLink.
>
> This would produce a valid graph without duplicated IDs in this case.

I will try to work on a solution like you propose in this kernel
cycle, but I do not feel very confident about landing that big change
in "fixes" without being in linux-next for a couple of weeks. I'd
rather go for a simple solution that fixes the regression.

With this fix, the media controller topology looks identical as before
we introduce the bug, so we do not lose any functionality.

So if you agree I think the safest path is to land this fix in fixes
now. And try to get a better logic landed in next in this kernel
cycle.

What do you think?

Regards!


>
> > +
> >       return NULL;
> >  }
> >
> >
> > ---
> > base-commit: ea299a2164262ff787c9d33f46049acccd120672
> > change-id: 20251021-uvc-grandstream-05ecf0288f62
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

