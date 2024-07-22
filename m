Return-Path: <linux-media+bounces-15243-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A22938E2D
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 13:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32EAC1F21D12
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 11:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64AF16D306;
	Mon, 22 Jul 2024 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fuos9wN1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A617597;
	Mon, 22 Jul 2024 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721648657; cv=none; b=tKytiFVPZUB2t63fgke7yHzwDvGK2vZQTLwJ7amkkOPAJqglQZXjOmneqkeiwCh584FAGWWiBYu6SPk29p0QyuL79EVvpJQccog+tRz/xhdVg/f3nMEjSRP+LokSgNYzEHZagXTocK+shMWbrejj/F5u7NyZEErT4ONjJUutrfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721648657; c=relaxed/simple;
	bh=pPQlCbJfh8RvldYR2ao9QDdb0XigxOlzDalrLf12DjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jg7pBr2yA/42NmZtlbRVSFNWV9RgLdBfQccuwzKtcCrfKDcMs8lmt6E0TL9S/xpiH9sO4QvlN/AYbetHo44d03z3f6LBGUzdgtQit8dImlP5LkqsRHkG4pVjLIlIlrTJwfcQqFRoHs+PVcQnDgbVS0swVLmiChsbt4voqi/DHMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fuos9wN1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 598852B3;
	Mon, 22 Jul 2024 13:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721648612;
	bh=pPQlCbJfh8RvldYR2ao9QDdb0XigxOlzDalrLf12DjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuos9wN1+ff26XufeyqVnkTtBZ/ybrcBAmEPuynFs7VV+s8q5FrBUtlRPIgwgRtFx
	 c/sx34m/mc4OlNUfUKuf+V7hMWcOjxWEwTFLadvWkZNzTaxnHz5qIH7LnZkH6OZAly
	 ad4Q1phw2q+hYB0OZgKb9cHI6GlC/nviYHoPlmW8=
Date: Mon, 22 Jul 2024 14:43:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pmenzel@molgen.mpg.de, stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix custom control mapping probing
Message-ID: <20240722114355.GF13497@pendragon.ideasonboard.com>
References: <20240722-fix-filter-mapping-v1-1-07cc9c6bf4e3@chromium.org>
 <20240722113836.GE13497@pendragon.ideasonboard.com>
 <CANiDSCsvoiUFPMDatH0OiENtscHYysiRJdCpxVCiK-WtQZS-DQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCsvoiUFPMDatH0OiENtscHYysiRJdCpxVCiK-WtQZS-DQ@mail.gmail.com>

On Mon, Jul 22, 2024 at 01:41:14PM +0200, Ricardo Ribalda wrote:
> On Mon, 22 Jul 2024 at 13:39, Laurent Pinchart wrote:
> > On Mon, Jul 22, 2024 at 07:59:43AM +0000, Ricardo Ribalda wrote:
> > > Custom control mapping introduced a bug, where the filter function was
> > > applied to every single control.
> > >
> > > Fix it so it is only applied to the matching controls.
> > >
> > > Reported-by: Paul Menzen <pmenzel@molgen.mpg.de>
> > > Closes: https://lore.kernel.org/linux-media/518cd6b4-68a8-4895-b8fc-97d4dae1ddc4@molgen.mpg.de/T/#t
> > > Cc: stable@vger.kernel.org
> > > Fixes: 8f4362a8d42b ("media: uvcvideo: Allow custom control mapping")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > > Paul, could you check if this fixes your issue, thanks!
> > > ---
> > >  drivers/media/usb/uvc/uvc_ctrl.c | 8 +++++---
> > >  1 file changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > > index 0136df5732ba..06fede57bf36 100644
> > > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > > @@ -2680,6 +2680,10 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> > >       for (i = 0; i < ARRAY_SIZE(uvc_ctrl_mappings); ++i) {
> > >               const struct uvc_control_mapping *mapping = &uvc_ctrl_mappings[i];
> > >
> > > +             if (!(uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> > > +                 ctrl->info.selector == mapping->selector))
> > > +                     continue;
> >
> > I have a slight preference for
> >
> >                 if (!uvc_entity_match_guid(ctrl->entity, mapping->entity) ||
> >                     ctrl->info.selector != mapping->selector)
> >                         continue;
> >
> > If that's fine with you, I can handle that when applying the patch.
> 
> That looks also good. I can send a v2 if you prefer. I would also add
> the error messages to the commit message.
> Let me know what do you prefer, I have time today

If you can send a v2 with an improved commit message that would be nice.
I'll apply it right away.

> > This change means that the entity and selector test will use the
> > original mapping, not the mapping returned by the filtering function. I
> > think that's fine, both mappings should have the same entity and
> > selector, only the menu mask is meant to change.
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > > +
> > >               /* Let the device provide a custom mapping. */
> > >               if (mapping->filter_mapping) {
> > >                       mapping = mapping->filter_mapping(chain, ctrl);
> > > @@ -2687,9 +2691,7 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
> > >                               continue;
> > >               }
> > >
> > > -             if (uvc_entity_match_guid(ctrl->entity, mapping->entity) &&
> > > -                 ctrl->info.selector == mapping->selector)
> > > -                     __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> > > +             __uvc_ctrl_add_mapping(chain, ctrl, mapping);
> > >       }
> > >  }
> > >
> > >
> > > ---
> > > base-commit: 68a72104cbcf38ad16500216e213fa4eb21c4be2
> > > change-id: 20240722-fix-filter-mapping-18477dc69048

-- 
Regards,

Laurent Pinchart

