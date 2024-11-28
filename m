Return-Path: <linux-media+bounces-22266-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561B9DBD59
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 22:35:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3877164990
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 21:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43B91C3F3B;
	Thu, 28 Nov 2024 21:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YCwJC1fe"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC813B2A4
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 21:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732829696; cv=none; b=F8Tqzy+Qxrzj7HOXsqH2+tQ+gxvmqEhvH3Q8hRVqEmJFLCRPPjXWjapaNWyVkHbwYe/WU7FLsnnP9HWPMVxgrn82NO7XW2jyZrFGCc3k2RsxTQhSLURz9YyAKqQgpU95jWrEKoNlSO8X/EvNWOG+8VcHVy1fR6oMX4Ps6eXXlIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732829696; c=relaxed/simple;
	bh=zG32356MJsh3JnWSmMLcSv/tq2Qpt12J6lc5ueIzQ3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ku/KarDu9g4I80zjlFe3y/vAkHUfo8bwYzbYsDQdNStqWRloa64F61DtQnX5tdMM+3xN3YLI6UQI6T+GdETFJFScBzoNZ5NzPIQqcNFIc6Sw13jiWNM3kIAx32bf4VQxP7atE3ActUQA333w0MRbyK/IQxRuTA0YfitRYMZ8nrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YCwJC1fe; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-212884028a3so7653945ad.0
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 13:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732829694; x=1733434494; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VZ3B52zWQdNOd8F/nW1HrBtSmyEx9e8pcGYpxy7g/fg=;
        b=YCwJC1feAMjg9SLhLCAB+6thkuYWTFDH1MRivAKOsa+/IuMEhlS+tsh8cbdg/3M/1a
         OXgrGv+63CbT3JEFiI4j+S06jP2Uh3i/Q68b0iyD7rNQDwv5gEePVAR5hJOjSRchAJYy
         SN00OXGhWIJOQVx2drWb2uZEZYHxc/wCkQkVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732829694; x=1733434494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZ3B52zWQdNOd8F/nW1HrBtSmyEx9e8pcGYpxy7g/fg=;
        b=IJ1XPDmfeC7UrfQs2ToBLxiWIr1vuHdVF1U7yPVHKCA3EFW4k8jhcGzkU0CZljMydN
         H5WVhUJLyqdKVl604vWCnBzVVcMcU7fgMoMIcPt/dh9LEMz0zOIqskb+fxEdGNrxRsrj
         2hWHOfF4DRKaxOOtTbLAaxi3v9jyS5qxxeqlyE4qx4NNHiOrZi8L9UwmahMHzLnWu4IL
         qT2PycoJBZjm6rEOLY7NS42mkTrPLlzIskKUJGmVBfOILo0YgZAF9ruVWGohUvVxbBEo
         u8MAwtE99aaYXcPEGDbqQyyZn2o/QQKo13qoPsLY/n6u9zGvBsPZ97y92X8ae6wQaXMg
         bQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCUi6HUwFYz3XhOoDIPueKnGgSNmGqTwqgBFD1wmeGfuF3Y6GkMKONW4bARS5SBHBDnBLF5mezKgICtgcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQwtwpajmmOlq02NP1FZLoNg8hnakMuqnIZCVJK6LoO+FHFrA
	NioLs+3aKXO+0naRfHPmUAaLq4oQCHwc7gjrzTNr7NK/I/Jwm+EzIR9nL5pDADLX/5xuS1aC99Q
	=
X-Gm-Gg: ASbGncsnzjAEIblD//gIZ8LCHQdF89dFnRzAZPF7FcV/IuTP7HgZNPaV7KSYgxguL2R
	KkC007jr8qyt7ldiFvHM0CNMuneed5xBa/eIzFo8d8k/9sU2X5TQmSSsfs26yoZqS1jqZyWe5DG
	ynLMBG79dPph83nGD/ciI4OpcUyW16Jyc8yt6seZWoBWUQel7+Ot6g05blDGOYqmN/j2CwNbbwF
	krQTLjHonUejlCvGgWBsGDN8Oy7x1l6bz/P3MzHeLVmUCntdjqcy1etAKamYY+ko7XOUnZ1E4+h
	ucFPk0mV7b0F
X-Google-Smtp-Source: AGHT+IGRKjWNq9Qw7VVYsaZu2C78qh4aM9Hsh+38CIC7vtOrN0zN8osvMmXW3P8I+5C0wzvLPrJqtQ==
X-Received: by 2002:a17:902:f541:b0:215:1c60:77bb with SMTP id d9443c01a7336-2151d318a24mr77478805ad.8.1732829693986;
        Thu, 28 Nov 2024 13:34:53 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219050b7sm18291165ad.83.2024.11.28.13.34.52
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 13:34:53 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e9ff7a778cso1715924a91.1
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 13:34:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGml0WdnwCQMxSSWlv7Wm0by1HLc3dkW0bMTHwRzoiv4axS4bDhhj/U4dYastbHKV8JH4b4uXv03z3GA==@vger.kernel.org
X-Received: by 2002:a17:90b:3902:b0:2ea:49a8:9169 with SMTP id
 98e67ed59e1d1-2ee25ae1094mr8025818a91.7.1732829691639; Thu, 28 Nov 2024
 13:34:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127-uvc-fix-async-v2-0-510aab9570dd@chromium.org>
 <20241127-uvc-fix-async-v2-4-510aab9570dd@chromium.org> <20241128212628.GD25731@pendragon.ideasonboard.com>
In-Reply-To: <20241128212628.GD25731@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 Nov 2024 22:34:38 +0100
X-Gmail-Original-Message-ID: <CANiDSCvb8OCGJjggermRPeD6R2Rt79hMuwF6xc6YQvvSqUNObA@mail.gmail.com>
Message-ID: <CANiDSCvb8OCGJjggermRPeD6R2Rt79hMuwF6xc6YQvvSqUNObA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: uvcvideo: Remove redundant NULL assignment
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, 28 Nov 2024 at 22:26, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> Thank you for the patch.
>
> On Wed, Nov 27, 2024 at 12:14:52PM +0000, Ricardo Ribalda wrote:
> > ctrl->handle will only be different than NULL for controls that have
> > mappings. This is because that assignment is only done inside
> > uvc_ctrl_set() for mapped controls.
>
> That seems right. I checked the unplug paths, and the mappings are
> destroyed from uvc_delete(), after all file handles get closed.
>
> I think this patch should go first in the series, as otherwise there's a
> temporary state where you rely on handle never being touched without
> holding the proper lock, and this code path violates that requirement.
> Is there anything I may be missing that would cause issues with
> bisection if I move this patch at the beginning of the series ?
>

You probably want to add the Cc: stable and Fixes: tags if you make
this patch the first one.

> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 99ddc5e9dff8..b9c9ff629ab6 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1645,10 +1645,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
> >       struct uvc_device *dev = chain->dev;
> >       struct uvc_ctrl_work *w = &dev->async_ctrl;
> >
> > -     if (list_empty(&ctrl->info.mappings)) {
> > -             ctrl->handle = NULL;
> > +     if (list_empty(&ctrl->info.mappings))
> >               return false;
> > -     }
> >
> >       w->data = data;
> >       w->urb = urb;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

