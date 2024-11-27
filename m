Return-Path: <linux-media+bounces-22136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D879DA441
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 09:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6138B24E7B
	for <lists+linux-media@lfdr.de>; Wed, 27 Nov 2024 08:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490B719004B;
	Wed, 27 Nov 2024 08:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PhLbLkml"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6DF1428E3
	for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 08:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732697919; cv=none; b=VBpvvpONCS52J17arqderVfFIoUZiLfd+Ltp5I/KIhW8dicpmkhkxcaCCsYeeIDbp0kBelvKqqeFFArMcmAm3xJRa2eMgzrzJcD7HucnUelTfTjdkl00s/eJ5rSAnM6pqv7wzuuaI+BlMsAPbBGKcre5e+6ukC4AP0e7Fq3kayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732697919; c=relaxed/simple;
	bh=JiHij5QSGg+4juP7Bw0Jcbhv8F9uCGy9weyzR2lagVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=toJvtEVkj1b3XXRcxYDNhrvExAvCYYTIOWTV/O656pVgZ3CtPqFZyF6hEOnZYO3AQI/pIVXyLur8dmGwZKNoMXXYdh17rkkKXggCkEBwl2zBaOrua0nCWpyfBmiorL/oaNIWla9cmRxBnlfkli85EikwNmpR+mL+rq0qV/XRknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PhLbLkml; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2689e7a941fso3910080fac.3
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 00:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732697917; x=1733302717; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2a1NquYRm428Xk6taKkRe/kN+BcnV15X20uznJxfdTg=;
        b=PhLbLkmlVrHaBbjsLbntYaQDRDDo0TNlOyykDLCPqcEYVqpmops5IObjRYsHEM50CJ
         t8ERIFPTrTWwrKtdBEN3rJPlmR6Zhv/KEkW7GBPk2x5ILmVW9fNp/0Wg5FJa8XmmL3Br
         KGfioluaeJ2vq77vX75QnX52dmDanR+UXQtYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732697917; x=1733302717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2a1NquYRm428Xk6taKkRe/kN+BcnV15X20uznJxfdTg=;
        b=U1FxQqXV+FYjdEiWPBEaQKyEFYIaR8h6SfCnTgNJl4YdwEjKxq9k/Sqp3x9PTATAnZ
         3mvUsimAUTt2ybsczTl3uJO7OugJcPAsU7EV4cBcZjra8/EFh1jfbmWxYJG0CeSBCiDq
         qSMyjagQqpycSQ/qe82HjcgQfYG/VzTLQ+qOcaN55q4+D7MwE9e3JVSUs7DHEUMztgVZ
         J9w0B1OYQIpDrwEt/ZH5hEQVHlqlDnOvFnZeHV+QcUyMSBk5vLfvLxSuCs72/eYzqiHy
         5Qw/hEBt2ouzUUBjdgOx00Eh3QEvxYwRsMyXLVsDhZPk8JLzkid+tw4Ti08e/m13pIqA
         qBJA==
X-Forwarded-Encrypted: i=1; AJvYcCVI/UOp4ekkE/3dsaLtjANcPcadpm3lD11jH9yhXD3qiwl/Fn8ZH5LJnCpvL5++/Yq2o/15ookWqPTIrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9/TdCuCynG1azXtFSTesN7wEBlF2nj4T4MVYfXPtHNKPidvv
	Wv/hmlifnMAlqi8dnrAidIpUHx8Mlo8kdWc1LCEu4UU3XeAF0kpFaPR7uP3Uh3nY0CI4Sbkerio
	=
X-Gm-Gg: ASbGncuVP7V2S4NVgcBtkYAyJ3Rhvejy0LWCuRPjIwPj/q9Ndru53UjjGVY+WzAE4EL
	8fMiK3hGvPZx3niAFwlS+Ce7p60SJmp6wXG4cBKiv3R7hEOSGmapNfK6mj/x74c35h3fvl91IAK
	Ru8RdzzqYQ/Q7flD8Cy4ic72xGMyOxYPETWXEdfLcZZh58kpWUSBfEAOTysyLd9hOc1pjMM3mPl
	xn5pau+0YHDzB/is/ZRYhuFZYG18NbwkuZFvkuQAM3e18AS2ZJfcbwGT2nVTjHr02gIu8wI9RnS
	5UBFjHH8Wnem
X-Google-Smtp-Source: AGHT+IEfHhhD+uxjPZgLZvue/+j2h1IYX/VAmW6emOft0NIPnkqAi85bMzTSOARsvVG28n4j5/ZAjQ==
X-Received: by 2002:a05:6871:b415:b0:29d:c6ef:cf1d with SMTP id 586e51a60fabf-29dc6f037bdmr1064814fac.7.1732697916826;
        Wed, 27 Nov 2024 00:58:36 -0800 (PST)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com. [209.85.210.50])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71c03759c3csm3541225a34.11.2024.11.27.00.58.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 00:58:35 -0800 (PST)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-71d502644e2so1495860a34.0
        for <linux-media@vger.kernel.org>; Wed, 27 Nov 2024 00:58:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9nrrxI2XcJeWk44eLoVQQYDy7uuTm4yy2P4jHcl0wWYlUhPTe15vTOLqLHWpmbmFrKMOCSvqVwEjE7A==@vger.kernel.org
X-Received: by 2002:a05:6808:3087:b0:3ea:4e7c:a91a with SMTP id
 5614622812f47-3ea6dd4a1fbmr2389825b6e.34.1732697913702; Wed, 27 Nov 2024
 00:58:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120-uvc-readless-v4-0-4672dbef3d46@chromium.org>
 <20241120-uvc-readless-v4-1-4672dbef3d46@chromium.org> <20241126180616.GL5461@pendragon.ideasonboard.com>
 <CANiDSCuZkeV7jTVbNhnty8bMszUkb6g9czJfwDvRUFMhNdFp2Q@mail.gmail.com> <20241127083444.GV5461@pendragon.ideasonboard.com>
In-Reply-To: <20241127083444.GV5461@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 27 Nov 2024 09:58:21 +0100
X-Gmail-Original-Message-ID: <CANiDSCvvCtkiHHPCj0trox-oeWeh_rks3Cqm+kS9Hvtp9QC6Yg@mail.gmail.com>
Message-ID: <CANiDSCvvCtkiHHPCj0trox-oeWeh_rks3Cqm+kS9Hvtp9QC6Yg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: uvcvideo: Support partial control reads
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Nov 2024 at 09:34, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Nov 26, 2024 at 07:12:53PM +0100, Ricardo Ribalda wrote:
> > On Tue, 26 Nov 2024 at 19:06, Laurent Pinchart wrote:
> > > On Wed, Nov 20, 2024 at 03:26:19PM +0000, Ricardo Ribalda wrote:
> > > > Some cameras, like the ELMO MX-P3, do not return all the bytes
> > > > requested from a control if it can fit in less bytes.
> > > > Eg: Returning 0xab instead of 0x00ab.
> > > > usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> > > >
> > > > Extend the returned value from the camera and return it.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> > > > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_video.c | 16 ++++++++++++++++
> > > >  1 file changed, 16 insertions(+)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index cd9c29532fb0..482c4ceceaac 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -79,6 +79,22 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > >       if (likely(ret == size))
> > > >               return 0;
> > > >
> > > > +     /*
> > > > +      * In UVC the data is usually represented in little-endian.
> > >
> > > I had a comment about this in the previous version, did you ignore it on
> > > purpose because you disagreed, or was it an oversight ?
> >
> > I rephrased the comment. I added "usually" to make it clear that it
> > might not be the case for all the data types. Like composed or xu.
>
> Ah, that's what you meant by "usually". I read it as "usually in
> little-endian, but could be big-endian too", which confused me.
>
> Data types that are not integers will not work nicely with the
> workaround below. How do you envision that being handled ? Do you
> consider that the device will return too few bytes only for integer data
> types, or that affected devices don't have controls that use compound
> data types ? I don't see what else we could do so I'd be fine with such
> a heuristic for this workaround, but it needs to be clearly explained.

Non integer datatypes might work if the last part of the data is
expected to be zero.
I do not think that we can find a heuristic that can work for all the cases.

For years we have ignored partial reads and it has never been an
issue. I vote for not adding any heuristics, the logging should help
identify future issues (if there is any).

>
> > I also r/package/packet/
> >
> > Did I miss another comment?
> >
> > > > +      * Some devices return shorter USB control packets that expected if the
> > > > +      * returned value can fit in less bytes. Zero all the bytes that the
> > > > +      * device have not written.
> > >
> > > s/have/has/
> > >
> > > And if you meant to start a new paragraph here, a blank line is missing.
> > > Otherwise, no need to break the line before 80 columns.
> >
> > The patch is already in the uvc tree. How do you want to handle this?
>
> The branch shared between Hans and me can be rebased, it's a staging
> area.

I will send a new version, fixing the typo. and the missing new line.
I will also remove the sentence
`* In UVC the data is usually represented in little-endian.`
It is confusing.


>
> > > > +      * We exclude UVC_GET_INFO from the quirk. UVC_GET_LEN does not need to
> > > > +      * be excluded because its size is always 1.
> > > > +      */
> > > > +     if (ret > 0 && query != UVC_GET_INFO) {
> > > > +             memset(data + ret, 0, size - ret);
> > > > +             dev_warn_once(&dev->udev->dev,
> > > > +                           "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> > > > +                           uvc_query_name(query), cs, unit, ret, size);
> > > > +             return 0;
> > > > +     }
> > > > +
> > > >       if (ret != -EPIPE) {
> > > >               dev_err(&dev->udev->dev,
> > > >                       "Failed to query (%s) UVC control %u on unit %u: %d (exp. %u).\n",
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

