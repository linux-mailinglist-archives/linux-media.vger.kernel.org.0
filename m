Return-Path: <linux-media+bounces-13353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F2890A0D7
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 01:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47F8F1F21C81
	for <lists+linux-media@lfdr.de>; Sun, 16 Jun 2024 23:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2149273537;
	Sun, 16 Jun 2024 23:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wVdCxIE1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7CD11CB8;
	Sun, 16 Jun 2024 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718581101; cv=none; b=W+bAuEpT83VmX/WKK9GNg7svEA+GoNJivf/rwGRuvxxkti8PPyv0BfgLP2uOAVXChHg8f+O9pXr7f+FrxQ9KqzvGYk5NMRDOZ3WpLtB+dMA6Er4SJUYuSSBm3oymmUBs2pNE6Ej1cHGPvdCRRDblfCz4jDVDrV5PImhNdtQWgV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718581101; c=relaxed/simple;
	bh=OPUcVYb7V1caFX1Fw7zHFYbtkajd47D46iTBQlcJIPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaHAs7o8b2F/wUqLQZhuJqCgbnjwJk0dm/dWPafYJ257B0w5DWNqNSxpSbRgoVVD3Ae4V0TDKdgl6M1tKafdMrXx2/xDrR6Zmu4GSo+PmrNQbzMtPw1ceI8fcv72/wVmvjmxZLIfIHErFXokC8QE1Q84JR5KZ2mlPqJWsgCuSPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wVdCxIE1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A753D2D5;
	Mon, 17 Jun 2024 01:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718581081;
	bh=OPUcVYb7V1caFX1Fw7zHFYbtkajd47D46iTBQlcJIPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wVdCxIE1mcLw75nUa2NHoCOY3HPGAcoCHuKEabkU72pwsgOnysylu2qLGSup+/WbM
	 JxzjBTktWMHghl3T+Qtb9C4E62j7KtG+bkqQFf9irS9CdQlIPAPVCJrWSGZ3zemyxO
	 l91Z4gmdB0bqdEyZgmDgsivymV5rSVOjdsejOOf4=
Date: Mon, 17 Jun 2024 02:37:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"hn.chen" <hn.chen@sunplusit.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] media/uvcvideo: add quirk for invalid dev_sof in
 Logitech C920
Message-ID: <20240616233756.GK4782@pendragon.ideasonboard.com>
References: <20240325142611.15550-1-oleksandr@natalenko.name>
 <6046664.lOV4Wx5bFT@natalenko.name>
 <20240404011120.GH23803@pendragon.ideasonboard.com>
 <CANiDSCu5-coAyJZeiL5q3cPOdJ9Xaf1oE3VP90Sj_EycGr_QRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCu5-coAyJZeiL5q3cPOdJ9Xaf1oE3VP90Sj_EycGr_QRQ@mail.gmail.com>

On Thu, Apr 04, 2024 at 08:35:14AM +0200, Ricardo Ribalda wrote:
> On Thu, 4 Apr 2024 at 03:11, Laurent Pinchart wrote:
> > On Mon, Apr 01, 2024 at 06:45:16PM +0200, Oleksandr Natalenko wrote:
> > > On pondělí 25. března 2024 15:26:11, CEST Oleksandr Natalenko wrote:
> > > > Similarly to Logitech C922, C920 seems to also suffer from a firmware
> > > > bug that breaks hardware timestamping.
> > > >
> > > > Add a quirk for this camera model too.
> > > >
> > > > Before applying the quirk:
> > > >
> > > > ```
> > > > 100 (4) [-] none 100 200717 B 212.919114 213.079004 33.727 fps ts mono/SoE
> > > > 101 (5) [-] none 101 200889 B 213.003703 213.114996 11.822 fps ts mono/SoE
> > > > 102 (6) [-] none 102 200926 B 213.035571 213.146999 31.379 fps ts mono/SoE
> > > > 103 (7) [-] none 103 200839 B 213.067424 213.179003 31.394 fps ts mono/SoE
> > > > 104 (0) [-] none 104 200692 B 213.293180 213.214991 4.430 fps ts mono/SoE
> > > > 105 (1) [-] none 105 200937 B 213.322374 213.247001 34.254 fps ts mono/SoE
> > > > 106 (2) [-] none 106 201013 B 213.352228 213.279005 33.496 fps ts mono/SoE
> > > > …
> > > > ```
> > > >
> > > > After applying the quirk:
> > > >
> > > > ```
> > > > 154 (2) [-] none 154 192417 B 42.199823 42.207788 27.779 fps ts mono/SoE
> > > > 155 (3) [-] none 155 192040 B 42.231834 42.239791 31.239 fps ts mono/SoE
> > > > 156 (4) [-] none 156 192213 B 42.263823 42.271822 31.261 fps ts mono/SoE
> > > > 157 (5) [-] none 157 191981 B 42.299824 42.303827 27.777 fps ts mono/SoE
> > > > 158 (6) [-] none 158 191953 B 42.331835 42.339811 31.239 fps ts mono/SoE
> > > > 159 (7) [-] none 159 191904 B 42.363824 42.371813 31.261 fps ts mono/SoE
> > > > 160 (0) [-] none 160 192210 B 42.399834 42.407801 27.770 fps ts mono/SoE
> > > > ```
> > > >
> > > > Link: https://lore.kernel.org/lkml/5764213.DvuYhMxLoT@natalenko.name/
> > > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > Signed-off-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> > > > ---
> > > >  drivers/media/usb/uvc/uvc_driver.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > > index 723e6d5680c2e..444d7089885ea 100644
> > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > @@ -2573,7 +2573,8 @@ static const struct usb_device_id uvc_ids[] = {
> > > >       .bInterfaceClass      = USB_CLASS_VIDEO,
> > > >       .bInterfaceSubClass   = 1,
> > > >       .bInterfaceProtocol   = 0,
> > > > -     .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT) },
> > > > +     .driver_info          = UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
> > > > +                                          | UVC_QUIRK_INVALID_DEVICE_SOF) },
> > > >     /* Logitech HD Pro Webcam C922 */
> > > >     { .match_flags          = USB_DEVICE_ID_MATCH_DEVICE
> > > >                             | USB_DEVICE_ID_MATCH_INT_INFO,
> > > >
> > >
> > > Gentle ping on this one.
> >
> > Ricardo, could you include this in the next version of your hw timestamp
> > series ?
> 
> There are no outstanding comments on the series
> https://patchwork.linuxtv.org/project/linux-media/list/?series=12485
> 
> Do you need me to send a v11 with this patch? or you can take that
> directly from your tree?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> > > Also, should I have added:
> > >
> > > Fixes: 5d0fd3c806b9 ("[media] uvcvideo: Disable hardware timestamps by default")
> > >
> > > ?
> >
> > I don't think that's needed, no.
> >
> > > (it's not that this change re-enables HW timestamping, but
> > > 5d0fd3c806b9 explicitly mentions C920 as affected)

-- 
Regards,

Laurent Pinchart

