Return-Path: <linux-media+bounces-36322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E1AAEE275
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 17:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C15F7ACDBA
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 15:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A7E28F527;
	Mon, 30 Jun 2025 15:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t8r/XTh3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E62623E35B;
	Mon, 30 Jun 2025 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297421; cv=none; b=Tmoq3lrQ0WGA/OpdQBMCby09OjiFXhSQECkXHyL411ouw1ioBbgrB2ypnftcEUho7OJWooDKy6Sv6wF0BZiC+n5z1KAsLJOh84OxMsuFT/Q/ZxqGD6u/PltZRHVjogXa/I+gWDnkMSZ3IeQ/qJQA3oFG4QckBM3dvZMb9034M5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297421; c=relaxed/simple;
	bh=ByB0TJN8UfaSE0raJya+PITY78sQiH2Iukf2fD+Ie5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHsDtGfCXL5V2yloyGF26Ym+NQaiQEgOegseIN8y7k2H2bD8JKRrfb7o/yDfLXUBg0ZWfylE8+5TmJ36vnahZN1/hTqs6rQH3VfQInCBTgyiZ1dnJGRmExXQctzftFBrNu0tB0UEDMwT5RQWjo46byC/jXsFNyeVCjPRqV4x4RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t8r/XTh3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8027E928;
	Mon, 30 Jun 2025 17:29:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751297396;
	bh=ByB0TJN8UfaSE0raJya+PITY78sQiH2Iukf2fD+Ie5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t8r/XTh3bChfF7Wto2gfkMYHICJlIvznOwAjiYrUORyXO8VXe5tUQYWSGNeWQUxvQ
	 UETcyXvldLV9ZZbnQyhAEwjnCsoJ54zmMqc9MLcjDfj1pwoNZmtX+REPmVPDDXR6ge
	 anoj2x9chcbxJMT/s5lA3RDV6ItATh/eoUJk8NXQ=
Date: Mon, 30 Jun 2025 18:29:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Desnes Nunes <desnesn@redhat.com>, hansg@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: fix build error in uvc_ctrl_cleanup_fh
Message-ID: <20250630152952.GG24861@pendragon.ideasonboard.com>
References: <20250630150107.23421-1-desnesn@redhat.com>
 <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCu83Ky-604gu2Yt34Wj1Km6Xh+TcPYzQxKZJNWdT7=m8A@mail.gmail.com>

On Mon, Jun 30, 2025 at 05:15:38PM +0200, Ricardo Ribalda wrote:
> Hi Desdes
> 
> How did you trigger this build warning? I believe we use C11
> 
> https://www.kernel.org/doc/html/latest/process/programming-language.html

Note that the local declaration of the loop counter shadows the global
one. I would have expected a different compiler warning though.

The shadowing was introduced by

commit 10acb9101355484c3e4f2625003cd1b6c203cfe4
Author: Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu Mar 27 21:05:29 2025 +0000

    media: uvcvideo: Increase/decrease the PM counter per IOCTL

and I think it should be fixed (while at it, with an unsigned int local
loop counter instead of a signed int) as it's not a good practice.

> On Mon, 30 Jun 2025 at 17:07, Desnes Nunes <desnesn@redhat.com> wrote:
> >
> > This fixes the following compilation failure: "error: ‘for’ loop
> > initial declarations are only allowed in C99 or C11 mode"
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 221cd51efe45 ("media: uvcvideo: Remove dangling pointers")
> > Signed-off-by: Desnes Nunes <desnesn@redhat.com>
> > ---
> >  drivers/media/usb/uvc/uvc_ctrl.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> > index 44b6513c5264..532615d8484b 100644
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -3260,7 +3260,7 @@ int uvc_ctrl_init_device(struct uvc_device *dev)
> >  void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >  {
> >         struct uvc_entity *entity;
> > -       int i;
> > +       unsigned int i;
> >
> >         guard(mutex)(&handle->chain->ctrl_mutex);
> >
> > @@ -3268,7 +3268,7 @@ void uvc_ctrl_cleanup_fh(struct uvc_fh *handle)
> >                 return;
> >
> >         list_for_each_entry(entity, &handle->chain->dev->entities, list) {
> > -               for (unsigned int i = 0; i < entity->ncontrols; ++i) {
> > +               for (i = 0; i < entity->ncontrols; ++i) {
> >                         if (entity->controls[i].handle != handle)
> >                                 continue;
> >                         uvc_ctrl_set_handle(handle, &entity->controls[i], NULL);

-- 
Regards,

Laurent Pinchart

