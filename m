Return-Path: <linux-media+bounces-21645-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 767C89D3DD1
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37F83284B4A
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6131B5EB0;
	Wed, 20 Nov 2024 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V2eiVaol"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E0A1AD5DE
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732113819; cv=none; b=beEbqBlhUbpZTKkyTFQi6B95ogz/GzGs9L5KMS1Ki0GCfjzNNDUmixJh1mQMrmohMN+/PfcSWsgE6/RAjrDmUwC3P6hLc3sDTluum31pa4O/66LPA5y0GnjMq64DjrqTRpyc++W9jzjohw9XvOrKSYMBATqYT7rft7gcr1VIKGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732113819; c=relaxed/simple;
	bh=3H0qJXOUKg7BZKQpQxV+nwwmTnCQUnU4BeIQFsGiWSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrfCrcgT+UOXraKcKGRylT2emqFDdM3afG5zQrMd3dbfPENVit+kxubtPPYRrWVNdggVB70qyAKlbdhlSXaaXb+1730r+M+fMDjaOtRs4WF4pjUpFnkAtz7PRsWeik54lPB7hdr7KlBFE2zAVrU3tOthD1c/0aSzQl4pMAV4SQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V2eiVaol; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-723db2798caso5513353b3a.0
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 06:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732113816; x=1732718616; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r2sFP2NARD2FOImCkIlq0O7UZoSIEEdwWYR8ebMsnZM=;
        b=V2eiVaolQu4fccQ3F50ghvTq/VMQjUFyb0Bs+/xs1wgMDepi3QiziyjxEVb9d9QoCe
         lUWL7BxcYCKdYrfuJ2mNwjhOct80YAjcQ+EAAPzZt6z8Pq7I3gT/ciJPIvrkSzfff7Xx
         tqtfKBy1IfA6j6aRiN9QyyiR5Xv0MKgYlIpoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732113816; x=1732718616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2sFP2NARD2FOImCkIlq0O7UZoSIEEdwWYR8ebMsnZM=;
        b=FjjR8ehxNMQ/7ruP2kOlDvWsmWDOKyhKlXHMRRL7paO0yKysrDqZWSFoFk9ZAaiL9s
         tMzyBfvs2pTWdgYd+xdWbopN9/sCOVGwEv7I05LAVq8zHRzmiEtZh6qOqLUI5HlnNe2e
         bPocooyZDsvV8lMdX0HLXhE4G6xn4RlII1QFSHzRoOpx1hJk9UJlKCVWwiP94MoOr4jF
         u5qLmTNO7qSJmq1nekZplFFxOvJFS3luH50ipvrAOp3oGdVr0PMrwh9U7KeVTXNZY627
         A1HRezs1IE/wMqwpGu26ZIpT+wEUHg7X+BXNdAFGHBOQsoi1KJXYajF39Mn0hHZfi7AP
         FPfw==
X-Forwarded-Encrypted: i=1; AJvYcCUb+XNKeSN5ORP1fKwt+Pm248kqnZvAbMvFaPtdct/vZT1wbHYDhI3PoWCvO/yZaai1P0D3GbrUSdwIfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpA713gTkVl/QUeIuQZd5BygfznnYyC+NPLQ9HMIQ59z4u34Fz
	hR7sXTmYiOcgud312qnjhDAOw53s97NWraLoDS8cyEBAEtsLWN/j5sZDsVTeuFnsGHBbnqlnO8E
	=
X-Google-Smtp-Source: AGHT+IH/GbKpwJdnN/YzjSNvQDJ4nSOJP7sGZLk8G8YoO4KB0VRGBqSg95knPsC31kVgo3OlXZVaFw==
X-Received: by 2002:a05:6a00:ac8:b0:71e:587d:f268 with SMTP id d2e1a72fcca58-724bec87c0bmr4237450b3a.4.1732113816008;
        Wed, 20 Nov 2024 06:43:36 -0800 (PST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befe9a91sm1750239b3a.183.2024.11.20.06.43.34
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 06:43:34 -0800 (PST)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso4638490a12.3
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 06:43:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+AzdnzRtZ/8SZakV84ge43gpM19wwWW3MX/ZoQbxfZhyAXvrzRJrQV4WIqggyCrdNSszgDZ54OR+7CQ==@vger.kernel.org
X-Received: by 2002:a05:6a20:9f09:b0:1db:d980:440e with SMTP id
 adf61e73a8af0-1ddae5e0c52mr4938722637.14.1732113813781; Wed, 20 Nov 2024
 06:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
 <20241118-uvc-readless-v3-1-d97c1a3084d0@chromium.org> <20241120140526.GW12409@pendragon.ideasonboard.com>
In-Reply-To: <20241120140526.GW12409@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 20 Nov 2024 15:43:22 +0100
X-Gmail-Original-Message-ID: <CANiDSCvazZ4Y3OZ9X7chU-_N-4HbeQKUh23eOWkmkAxGaks2QA@mail.gmail.com>
Message-ID: <CANiDSCvazZ4Y3OZ9X7chU-_N-4HbeQKUh23eOWkmkAxGaks2QA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Support partial control reads
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Wed, 20 Nov 2024 at 15:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Mon, Nov 18, 2024 at 05:16:51PM +0000, Ricardo Ribalda wrote:
> > Some cameras, like the ELMO MX-P3, do not return all the bytes
> > requested from a control if it can fit in less bytes.
> > Eg: Returning 0xab instead of 0x00ab.
> > usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> >
> > Extend the returned value from the camera and return it.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_video.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > index cd9c29532fb0..e165850397a0 100644
> > --- a/drivers/media/usb/uvc/uvc_video.c
> > +++ b/drivers/media/usb/uvc/uvc_video.c
> > @@ -76,8 +76,22 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> >
> >       ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> >                               UVC_CTRL_CONTROL_TIMEOUT);
> > -     if (likely(ret == size))
> > +     if (ret > 0) {
> > +             if (size == ret)
> > +                     return 0;
>
> Why is this within the ret > 0 block ? I would write
>
>         if (likely(ret == size))
>                 return 0;
>
>         if (ret > 0) {
>
> > +
> > +             /*
> > +              * In UVC the data is represented in little-endian by default.
>
> By default, or always ?
>
> > +              * Some devices return shorter control packages that expected
>
> What's a "control package" ?

usb control transfers.
>
> I think you meants "than expected", not "that expected".
>
> > +              * if the return value can fit in less bytes.
> > +              * Zero all the bytes that the device have not written.
> > +              */
>
> Do we want to apply this workaround to GET_INFO and GET_LEN, or can we
> restrict it to GET_CUR, GET_MIN, GET_MAX and GET_RES ?

I believe that the original behaviour before
a763b9fb58be ("media: uvcvideo: Do not return positive errors in
uvc_query_ctrl()")
was used for all types. I think the safest thing to do is to go back
to the old behaviour.

Let me know what you prefer.


>
> > +             memset(data + ret, 0, size - ret);
> > +             dev_warn_once(&dev->udev->dev,
> > +                           "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> > +                           uvc_query_name(query), cs, unit, ret, size);
> >               return 0;
> > +     }
> >
> >       if (ret != -EPIPE) {
> >               dev_err(&dev->udev->dev,
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

