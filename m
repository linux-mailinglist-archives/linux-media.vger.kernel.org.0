Return-Path: <linux-media+bounces-15247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E2938FC4
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 15:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FD491F21B28
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 13:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3159216D4F1;
	Mon, 22 Jul 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OkpjCl7t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D1716938C
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721654258; cv=none; b=dHitMVV746PgtZEs4lXVsq2YYAEXVmEHnJGHLvRjBQVArFgYvQKWNd8fQm/Gg1hLi1pJUH+uqUNpw79VY9o9CreIyvHB7N1Eg4OP+2rJtzXBnCiHRb2/NC3BV0kFIvgz+hSv0/VpnA8djj8CJrDfaiV8mQVxdD/80gk1Oi87h+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721654258; c=relaxed/simple;
	bh=X8Og4cRRjTFTAVcy3iYNTI7NPvrU8WWaBElWujRSza8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjLzrMUH3vWGoOmxr/k9GQ+5C+bBATo1yTXfNSC9IWnVPZnFYt54KD2ql+2Pu43S0hnqs+msJxazOIDnqQ8sbnYumzLR4P5wWuQvEnow+9ZOm/LyBxcGdUQhzuCXsfivXT5DIEJ0QqGSjrfz/ujqscTOsF7djBgUmCKSa3xc2To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OkpjCl7t; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a797c62565aso401965166b.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721654255; x=1722259055; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wTbGlt1EcdcYHcKZI4SFSpYHzZQnoTGlIL/NjhJzDtA=;
        b=OkpjCl7tEiIUKcuOt1PvgphmDtFPmxytkd9lvCAA3Ht2W5CyD9wwjTmcubO/lMWQOc
         iBUn32sYTYfrb3/E/JG9GVdxoa0tqQ8jTBSB7rmt6JRd8bggSg0XjBb9cdpydGzvfyRF
         2PHYU7VcGnTVEgd8uVDyZN/PzYbsDp5UZ6bL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721654255; x=1722259055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wTbGlt1EcdcYHcKZI4SFSpYHzZQnoTGlIL/NjhJzDtA=;
        b=XVK98wfr+mVgemUYmY+ce7QcSp5to1oBs0agqvAg1Swyn8NmILbfQcVQ7BM4f/9bId
         yFXgWprcOZh3Q7IrEHD/Yy7UgpcjujMP2PdsPlcBPqzy5WhFSx7PIQUoG34UiovL6sv3
         SsKSD4dpUwMzTrDC2+GoZ0motYEU7w72ro0My3dWWLjuT6ywCwsnMZpjSW/kXrbZRtba
         yO10ErNmyItRtK/Q527DW5KoYAHtPADjb2YvG3yxKp7BROxXVXkE4bXWBuf51p0DOcq/
         cQa7elBqMKTeKIlcsUKn0DPFde26Y50llLs/erLB7J17HSTWXqitf4w44nVt71c21esr
         p4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXse/5KbQMLuSANABrzt0NqciXfVHPcCeTe2yqqMpWI4Fs/NF+6Z3EBVL5q7x418ClIwOy/pRKTZr3WdJ2MACodDPuWOmGFUQ85DpI=
X-Gm-Message-State: AOJu0Yz+0kYrRVaJvYXizw6tjVr8bdP8D9SsqgQhCnsA1JNRKpzViSeo
	DoJb/eUdzBwGT7sQYYMmQJM4/xuoKU1ZyNeC83OWLLKhMkLNvgPmV9mSwpNzhSct8YFLGYnJAUA
	0Tg==
X-Google-Smtp-Source: AGHT+IEU6lUNPbHG6vcMQ3NMFluF+RJfW54wO07FWt1kT4YzKcbLgBh0ORJPMczuYUaxIvyHh9Fgxg==
X-Received: by 2002:a17:906:b0c3:b0:a79:fb0e:55ab with SMTP id a640c23a62f3a-a7a01147953mr1205762466b.23.1721654255079;
        Mon, 22 Jul 2024 06:17:35 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c91ef3fsm420539866b.182.2024.07.22.06.17.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 06:17:33 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a77e7a6cfa7so429649066b.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 06:17:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoSuy/O+cStQ4w70thtKsM4xn4+1rJZ/eH2Pz3/nsRWjvNAeuEIIIRyK5BH1OQaw9h2olr5wvtmzP++UHbIfwEUsqRRcWA20v3iCU=
X-Received: by 2002:a17:906:ce57:b0:a72:b055:3de0 with SMTP id
 a640c23a62f3a-a7a01116219mr1036992766b.6.1721654252644; Mon, 22 Jul 2024
 06:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240722-fix-filter-mapping-v2-1-7ed5bb6c1185@chromium.org> <20240722122211.GF5732@pendragon.ideasonboard.com>
In-Reply-To: <20240722122211.GF5732@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Jul 2024 15:17:17 +0200
X-Gmail-Original-Message-ID: <CANiDSCs1nuvG1XF1XUAJVvkrbe_bVnvqyTR7gvHDdQ8k0M4pLA@mail.gmail.com>
Message-ID: <CANiDSCs1nuvG1XF1XUAJVvkrbe_bVnvqyTR7gvHDdQ8k0M4pLA@mail.gmail.com>
Subject: Re: [PATCH v2] media: uvcvideo: Fix custom control mapping probing
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pmenzel@molgen.mpg.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jul 2024 at 14:22, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jul 22, 2024 at 11:52:26AM +0000, Ricardo Ribalda wrote:
> > Custom control mapping introduced a bug, where the filter function was
> > applied to every single control.
> >
> > Fix it so it is only applied to the matching controls.
> >
> > The following dmesg errors during probe are now fixed:
> >
> > usb 1-5: Found UVC 1.00 device Integrated_Webcam_HD (0c45:670c)
> > usb 1-5: Failed to query (GET_CUR) UVC control 2 on unit 2: -75 (exp. 1).
> > usb 1-5: Failed to query (GET_CUR) UVC control 3 on unit 2: -75 (exp. 1).
> > usb 1-5: Failed to query (GET_CUR) UVC control 6 on unit 2: -75 (exp. 1).
> > usb 1-5: Failed to query (GET_CUR) UVC control 7 on unit 2: -75 (exp. 1).
> > usb 1-5: Failed to query (GET_CUR) UVC control 8 on unit 2: -75 (exp. 1).
> > usb 1-5: Failed to query (GET_CUR) UVC control 9 on unit 2: -75 (exp. 1).
> > usb 1-5: Failed to query (GET_CUR) UVC control 10 on unit 2: -75 (exp. 1).
> >
> > Reported-by: Paul Menzen <pmenzel@molgen.mpg.de>
> > Closes: https://lore.kernel.org/linux-media/518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de/T/#t
> > Cc: stable@vger.kernel.org
> > Fixes: 8f4362a8d42b ("media: uvcvideo: Allow custom control mapping")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> I'll add
>
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
> from v1 and fix the reported-by tag.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>

Thanks :)

> > ---
> > Paul, could you check if this fixes your issue, thanks!
> > ---
> > Changes in v2:
> > - Replace !(A && B) with (!A || !B)
> > - Add error message to commit message
> > - Link to v1: https://lore.kernel.org/r/20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 0136df5732ba..4fe26e82e3d1 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -2680,6 +2680,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> >       for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
> >               const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
> >
> > +             if (!uvc_entity_match_guid(ctrl->entity, mapping->entity) ||
> > +                 ctrl->info.selector != mapping->selector)
> > +                     continue;
> > +
> >               /* Let the device provide a custom mapping. */
> >               if (mapping->filter_mapping) {
> >                       mapping = mapping->filter_mapping(chain, ctrl);
> > @@ -2687,9 +2691,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> >                               continue;
> >               }
> >
> > -             if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> > -                 ctrl->info.selector == mapping->selector)
> > -                     __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> > +             __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> >       }
> >  }
> >
> >
> > ---
> > base-commit: 68a72104cbcf38ad16500216e213fa4eb21c4be2
> > change-id: 20240722-fix-filter-mapping-18477dc69048
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

