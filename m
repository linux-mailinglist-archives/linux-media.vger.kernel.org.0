Return-Path: <linux-media+bounces-21680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C789D3F2A
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 16:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 969E1B279C8
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 15:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B911A9B3B;
	Wed, 20 Nov 2024 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hOcyI2tZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDBF2746D
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 15:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732116380; cv=none; b=LGooF8Jj+Yb6pmGtjtsNZopONYh4Lwz4Q91ZJ+4AHqi1hIRw7qNyUWQlQikhjzHzuWSgnJDKRf0DxXIMIgCR7S6gMaaySt9QyY7/q+IC4qpcxnNCYFulqHYn5I9x0uAzwQUZe0Xcprog7jSmng6Jb9+ddquIGWWIZGuujrbrfwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732116380; c=relaxed/simple;
	bh=aEpeVL2+MvWMIJH2w921LzuXKvdlr+VXZnWB0rIrw7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mlUoq2yh/9lceOdYOFP7Ba6YLfMDhG8biWcUMwe42zxF8yboIPBxRlumAiJrC4+VwpDZ+zfCtQQTF8fhfkkb8m0x68m1ABot/pyqxLhonIBIuT+icLv6IryPP2ZnZY5ktFNvGHbnnx8kQUpORVrp1vM807Wgik22VZrie5KI4jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hOcyI2tZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f3da2c2cb5so1718146a12.2
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 07:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732116378; x=1732721178; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aiMUFCvmVqIUzNlDz47PSTDNdFjqdtwhxW4WFLT6+Bw=;
        b=hOcyI2tZ3BVEJ5xE9jFYEhgU15hOzPi3Ws2g2YZhrTcN19ZUegdJsZY9PaHcHQOpit
         /StXogj6Vh6PiTGywKOBKWBSLhTX5BvpbqjPqG4YgNWcTsepa4QIhiaP9VwVchVzvYgT
         43HcXzvw67Lz8RyekUUhY0YJAnVyznwB50GCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732116378; x=1732721178;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiMUFCvmVqIUzNlDz47PSTDNdFjqdtwhxW4WFLT6+Bw=;
        b=fgmbEpJKZ3ZpFK/Vb8B6rQVSQpikjaqG1HOgJhxukGz86JvhVi5LlzWvLzqC/Ygm4L
         ALdo0Q+vQlVYTTyELQdJjndKR23cnAXq+bGb45opDmbrp3MaOksUmummUEwHHVqHidtD
         cv+U7tY2uUM1pf8Q2+kGDlRwulkq9EKdejcK2pd5w/3B23cI+gI9T424BCcZEHXvF6/v
         yaryzJVFi7iL7NQeDKuzwLZRScGTpZqOQf5GOtEmdVjUbbjCYLOipLac1q7ljvTslPeh
         f1yIuv74nY2fVmxulYK2UaB/Bwi65xbsLd7cg2s6QNbvqubA+G6BCQfuvlkGZWqpR2wZ
         YXHg==
X-Forwarded-Encrypted: i=1; AJvYcCVUEKpGDFKE0rdYNkYmBB77bXfnV51I6wYZK76hN8tiRTdLJQlVPBSbURNExcnlyjCikQmPwQD+ocsFIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+C9nE/JJdMRme6GAgjrGh/+rln5zD6CRpEQYOxHd+jvS2AnvE
	pVbAJIJinfEj5TyrL+A/FuWAI3L/kYZeLxY3s8H91aU1cLQ3TxfAruyVZY6PLP9BSkwGpQt0GGk
	=
X-Gm-Gg: ASbGncuJqfYjrqAYVnb/boi5vInDekUUWfs9EFAEs6Nomw8l3mfR8qJ84QUM4lmDbSn
	Pz5Rg6fX6zJiA5KV/+8ukflS1kSudCiyEr1PCRM4Rs1SCvbPJ1Ht5YIwJ8MOsmpz8e8+oBeYP94
	Yxfn74M4/vHVa6cB3TS0a+xPFQ1uDz7p3jWfD+SdCovo6bZU8Xs0wlF5pumBS5FtXWEDnP9NQmP
	kXQYuZEojwFF5EjE9uzowI4udv+C0ni61rPhYIyTCs5RfvGfQxEeFTyUwSNfynmxXpHQwoS2oJt
	nH2Ap0GINBTpERGq
X-Google-Smtp-Source: AGHT+IGVKPxpEF1XiMqHFkNiJhzMZDi4ZbkO96llYZWrn1nahzRI9TVUypgtYQ5Gnp3OcdXdDXkfzQ==
X-Received: by 2002:a05:6a20:9f90:b0:1d8:a13d:d6b2 with SMTP id adf61e73a8af0-1ddae9b99d9mr4802409637.10.1732116378041;
        Wed, 20 Nov 2024 07:26:18 -0800 (PST)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com. [209.85.210.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724beefcf55sm1745342b3a.52.2024.11.20.07.26.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 07:26:16 -0800 (PST)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so1857557b3a.2
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 07:26:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXn2gS9qQ7dauUasDqubRBWdVTJqmV60SpkeDXbvUyP8HrOVYpsF0VFZl2XpH76VDdJfvujDXNPljDOZQ==@vger.kernel.org
X-Received: by 2002:a05:6a00:2355:b0:71d:eb7d:20d5 with SMTP id
 d2e1a72fcca58-724beca42camr4163959b3a.8.1732116376003; Wed, 20 Nov 2024
 07:26:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118-uvc-readless-v3-0-d97c1a3084d0@chromium.org>
 <20241118-uvc-readless-v3-1-d97c1a3084d0@chromium.org> <20241120140526.GW12409@pendragon.ideasonboard.com>
 <CANiDSCvazZ4Y3OZ9X7chU-_N-4HbeQKUh23eOWkmkAxGaks2QA@mail.gmail.com> <20241120145341.GX12409@pendragon.ideasonboard.com>
In-Reply-To: <20241120145341.GX12409@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 20 Nov 2024 16:26:04 +0100
X-Gmail-Original-Message-ID: <CANiDSCtX9pPS=YLmeCLerbcuvQEwbNiGX4uod=iLSNJnQ9-tQg@mail.gmail.com>
Message-ID: <CANiDSCtX9pPS=YLmeCLerbcuvQEwbNiGX4uod=iLSNJnQ9-tQg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] media: uvcvideo: Support partial control reads
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2024 at 15:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Nov 20, 2024 at 03:43:22PM +0100, Ricardo Ribalda wrote:
> > On Wed, 20 Nov 2024 at 15:05, Laurent Pinchart wrote:
> > > On Mon, Nov 18, 2024 at 05:16:51PM +0000, Ricardo Ribalda wrote:
> > > > Some cameras, like the ELMO MX-P3, do not return all the bytes
> > > > requested from a control if it can fit in less bytes.
> > > > Eg: Returning 0xab instead of 0x00ab.
> > > > usb 3-9: Failed to query (GET_DEF) UVC control 3 on unit 2: 1 (exp. 2).
> > > >
> > > > Extend the returned value from the camera and return it.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: a763b9fb58be ("media: uvcvideo: Do not return positive errors in uvc_query_ctrl()")
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_video.c | 16 +++++++++++++++-
> > > >  1 file changed, 15 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> > > > index cd9c29532fb0..e165850397a0 100644
> > > > --- a/drivers/media/usb/uvc/uvc_video.c
> > > > +++ b/drivers/media/usb/uvc/uvc_video.c
> > > > @@ -76,8 +76,22 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
> > > >
> > > >       ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
> > > >                               UVC_CTRL_CONTROL_TIMEOUT);
> > > > -     if (likely(ret == size))
> > > > +     if (ret > 0) {
> > > > +             if (size == ret)
> > > > +                     return 0;
> > >
> > > Why is this within the ret > 0 block ? I would write
> > >
> > >         if (likely(ret == size))
> > >                 return 0;
> > >
> > >         if (ret > 0) {
> > >
> > > > +
> > > > +             /*
> > > > +              * In UVC the data is represented in little-endian by default.
> > >
> > > By default, or always ?
> > >
> > > > +              * Some devices return shorter control packages that expected
> > >
> > > What's a "control package" ?
> >
> > usb control transfers.
>
> Ah, did you mean "packet" instead of "package" ?
>
> > > I think you meants "than expected", not "that expected".
> > >
> > > > +              * if the return value can fit in less bytes.
> > > > +              * Zero all the bytes that the device have not written.
> > > > +              */
> > >
> > > Do we want to apply this workaround to GET_INFO and GET_LEN, or can we
> > > restrict it to GET_CUR, GET_MIN, GET_MAX and GET_RES ?
> >
> > I believe that the original behaviour before
> > a763b9fb58be ("media: uvcvideo: Do not return positive errors in
> > uvc_query_ctrl()")
> > was used for all types. I think the safest thing to do is to go back
> > to the old behaviour.
>
> I don't see how reverting that commit would help, or how that's related
> to the question at hand.
>
> I understand the device you're dealing with shortens transfers for
> integer values when they would contain leading 0x00 bytes. The
> workaround should be OK when retrieving the control value or its limits
> and resolution. I wonder if it would be dangerous for GET_INFO, which
> retrieves a bitmask. Does the device you've tested this with skip the
> MSB for GET_INFO as well ?

I have not seen it mangling GET_INFO. Let's exclude GET_INFO it from
the quirk then.



>
> Conceptually GET_LEN could be similarly excluded from the workaround,
> but it will never take this code path as it's a 1 byte value.
>
> > Let me know what you prefer.
> >
> > > > +             memset(data + ret, 0, size - ret);
> > > > +             dev_warn_once(&dev->udev->dev,
> > > > +                           "UVC non compliance: %s control %u on unit %u returned %d bytes when we expected %u.\n",
> > > > +                           uvc_query_name(query), cs, unit, ret, size);
> > > >               return 0;
> > > > +     }
> > > >
> > > >       if (ret != -EPIPE) {
> > > >               dev_err(&dev->udev->dev,
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

