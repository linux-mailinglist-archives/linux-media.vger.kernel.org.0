Return-Path: <linux-media+bounces-38472-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1060FB11F1F
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 15:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABC151CE399F
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 13:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E852ED87B;
	Fri, 25 Jul 2025 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R9i9/3qp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4A32ED169
	for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 13:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753448493; cv=none; b=cEXz0rMNvO2QkaNSL2PNwq+0sDSndR00K3N8FYpb05KDS4zQ8oGlkyvL+FYvlN4SaRNXrqBwZn5rvsW2/5IaoqGts/yKt0cWKJ+x12/6CPARSQ5Kw/LnZiRCRfzPgo7/piiVIdPxCqLsuJxmD5m2N0G+uLBcg5+2YQk68tj2D1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753448493; c=relaxed/simple;
	bh=jZfI/jZo/CFIe92zR3Hl3kPSV3ETk+fIXrCk/bLV0s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k0zTzhUaS7h2s9BQ86pKhspzFymgSnYJI4X0dTnF5hQO2zlyfgqdGYJmDWMKrc5mawPsENLuuAF6wygpzQut8TudOiIRtsVgcLjC7HUG4k6AYxWWMspy+gj2Ac/XQFCG5tvJfEsVB3GSKZ0eUVHak2FN8aU8gPFdQkXmJPgt+A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R9i9/3qp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so2858096e87.0
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753448489; x=1754053289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I2P4xcgVB0EtFaxRQaZIR9o/BHYp+7Qg3ScZYe53eyg=;
        b=R9i9/3qp1n536x0Y6qGWEjCqENRC39k8kjhyVz91Kjr0jMYYWDjMi6qWLPhtv/v7hu
         X1Ht0njUcNLsY/GDpaFdnuvfepFCLZUv/j8TO2s1rrnd5VA81krDmooAnt7nol0qZ2a6
         yloyS2PWrwTjhU/zeI3+5DXefveVD6LztBsuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753448489; x=1754053289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2P4xcgVB0EtFaxRQaZIR9o/BHYp+7Qg3ScZYe53eyg=;
        b=JBwCJzKWLSlQ0VasIdckRME3ZNiTL6Sq3q9LjKZVm78ezvunErgNw4hsfnN2vdcZG3
         0K5BszDkCmMF4Y0IBHiadmzVUYmZiMxaJaHEfk26MsCOqrnBoj0SD4sPOXYQiWYbYGui
         xRP6iS4ikzBwdb4IzjnCqRv6g3ecjnoyskIUmuNPmCSAxVvlqnpkTIw1neSpG7SI4Nby
         yQmfv3tSeHOL1XoY2qIuc+30/8QVBcPC4alpGdVTGBFq9i1o048Cdx2zh+FFXvceuHyW
         DmlQTZrULSR1r720gGFbSFaTomiVuKQMeWB2/8BuObNubF/C7eWvhLyVj9HJzNqP7WN/
         is3w==
X-Forwarded-Encrypted: i=1; AJvYcCW51fJlXcN8ax+Pk87rAM/kMyOyEuxHY+kdXGhFO4WX4jjK8yAllx7BXUsMGN6cSrViVwSIVTfI2i2MJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Dm3HwBtTR3CED/BrNEpbbfqFIJXVLyHeHacQK/9+gWeUwOK5
	Lkq4iL+wA2vAlw6cdyDs4nKWOi7vyYze/oyLHuijjD9aC0JJvh8lQmPP6laa9tvnlUP5tDHcPPX
	KfCg=
X-Gm-Gg: ASbGncvUVs1YdEWiu7mXXu6xg/9ACTCeaO05NUQBxi41/8anDU3g7XAWRpG/zn8Jn7Q
	U99eZofubCaJuzh4xggzCxtZBi7UYP2Cyd1A6daZbxhH+/osnsQhbKtHWWZY4FOMmffT87cDmS7
	DXeYyjjtEdoOKHfH1UjuCbGZq1edaQTb28qKq+k8iLMPqEOarLEYBc0rL3DkxbFO+9vg8y1bMNL
	TUgGgmTwXnjzLaemFZCAkZr99xq2ASoG+f6nPYmuZsrtmhr4zKKDLVmJwoyzR7tH9HkK4kRGeWE
	Qj7CkXhIpvcuK/4lhssnZ1/+T8HpDQyBL5mgpy1NGPi/2s887M0/KPQbGhWqbs5n5YP8B9zwepQ
	7PnfYR8t/am0qwvNv8KvjiokD793c3ncvBx3RxLYq8l9n3uT2NQxMVyGfb84G+GQ8
X-Google-Smtp-Source: AGHT+IFrXgBr30aw/VtB/lDimdwLtv7yDC7yvB8sdXh7g6Ds5viP0XUVn0tTvfM666HvP+iG5mu4rQ==
X-Received: by 2002:a05:6512:685:b0:55b:5993:4595 with SMTP id 2adb3069b0e04-55b5f4769f1mr488037e87.27.1753448488018;
        Fri, 25 Jul 2025 06:01:28 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b22053sm919250e87.10.2025.07.25.06.01.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 06:01:27 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-33097e1133fso20636031fa.1
        for <linux-media@vger.kernel.org>; Fri, 25 Jul 2025 06:01:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVAJNNnV0TvxJg2GwbZlY2yL0MrNdUhWjK12GMb7jogtk3P72bO6WnPNZQpPbVf/5Ji+TW/DkIvqSETFw==@vger.kernel.org
X-Received: by 2002:a05:651c:4096:b0:32a:8855:f214 with SMTP id
 38308e7fff4ca-331ee825fe7mr3660911fa.27.1753448484875; Fri, 25 Jul 2025
 06:01:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250725-uvc-nousbdev-v1-0-28f5a1fdf544@chromium.org>
 <20250725-uvc-nousbdev-v1-2-28f5a1fdf544@chromium.org> <20250725112659.GC11202@pendragon.ideasonboard.com>
In-Reply-To: <20250725112659.GC11202@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 25 Jul 2025 15:01:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCvJwbhxBbc=Wkbj9MG44sWnJ8pZi4vKYK4Akvm4iQH4TQ@mail.gmail.com>
X-Gm-Features: Ac12FXy-sx-xZRO0nUXAykeQ5qxinWl9sJcG-93KqvB8TDIZ-39fWSG3McaeDBo
Message-ID: <CANiDSCvJwbhxBbc=Wkbj9MG44sWnJ8pZi4vKYK4Akvm4iQH4TQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: uvcvideo: Do not re-reference dev->udev
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Fri, 25 Jul 2025 at 13:27, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jul 25, 2025 at 11:01:30AM +0000, Ricardo Ribalda wrote:
> > dev->udev is already referenced by the variable udev. Let's use it.
>
> The variable is used in a single location. I would probably have dropped
> it instead, but I don't have a strong preference. If you prefer it this
> way,
>

I believe that it is used twice.

Anything works for me. Feel free to change it the way you prefer
when/if you merge it, or land it as is.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Please let me know if you will send a patch to drop the variable
> instead, or if I should merge this one.
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index d09d1286da0f61d5953125df23ed92555585e8f2..209cedeff59e8be2e96ce79c3d395a5a85a336c6 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -882,7 +882,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
> >       unsigned int n, p;
> >       int handled = 0;
> >
> > -     switch (le16_to_cpu(dev->udev->descriptor.idVendor)) {
> > +     switch (le16_to_cpu(udev->descriptor.idVendor)) {
> >       case 0x046d:            /* Logitech */
> >               if (buffer[1] != 0x41 || buffer[2] != 0x01)
> >                       break;
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

