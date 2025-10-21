Return-Path: <linux-media+bounces-45147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3222BF7C4B
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 18:46:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E79AA4F65CE
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 16:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BEFC346E7C;
	Tue, 21 Oct 2025 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rldnopNS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7457346E73;
	Tue, 21 Oct 2025 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761065157; cv=none; b=Fa37l+hWkiziXsTHTdNAEouY5JQAVjZn1BXT8NCVh0GZDXx2tnhH2ybRgKBegz6dcBabBZ90vLvtxaKuzPK9Cx2JdHLjoizbSsCYJZvOJyn3Kb3CKGgBZOlncVTOH5xBxpGa1D1BUhaJ1m2rEiPnT5BuG/TsygY2OdjjZPdsO8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761065157; c=relaxed/simple;
	bh=U+bAyEa/s/ufg7GQfiphb9pILU1hUMBXSa5h/33VtQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xe809V8hW0TyJIdh2R3vzXgYv/xetqFUGU9epCEHl6wFRhTEOwNil9M2oGKrVAKckg1daa/pt15oDeEznt3If5MmQWWU1i/Sx5TMztSfeoXVc74iOR6cEJBKLAnagBiaGkwUBj4XKcIpQ40DBiI8mmf8PtdMsEnFxC+nm0grJdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rldnopNS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9CFE46F9;
	Tue, 21 Oct 2025 18:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761065050;
	bh=U+bAyEa/s/ufg7GQfiphb9pILU1hUMBXSa5h/33VtQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rldnopNShKVoV6xVlUVcDd4w951MjEQxvBt1M8s491tZSp9Tkcw5p0HepHhV/ayIS
	 Slh+gWxwYjyAcIV0Y6TpV2p0udkt6YYnyWNPQIK+7kHhsmadM8F80zfO725Q62Vrjw
	 O5yj0xC2iNPsSu4xU0OWe6gWqryjeRe6yIeR6MYY=
Date: Tue, 21 Oct 2025 19:45:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	Angel4005 <ooara1337@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: uvcvideo: Use heuristic to find stream entity
Message-ID: <20251021164542.GB727@pendragon.ideasonboard.com>
References: <20251021-uvc-grandstream-v2-1-6a74a44f4419@chromium.org>
 <b282f6ef-fd91-44ea-bf51-187cf2c56fc6@kernel.org>
 <CANiDSCvr-BR7wZVK2gW0wYEQjyFHTpZv7nnR4JVi6bMUyGNCoQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANiDSCvr-BR7wZVK2gW0wYEQjyFHTpZv7nnR4JVi6bMUyGNCoQ@mail.gmail.com>

On Tue, Oct 21, 2025 at 06:15:54PM +0200, Ricardo Ribalda wrote:
> Hi Hans(es)
> 
> On Tue, 21 Oct 2025 at 18:07, Hans de Goede <hansg@kernel.org> wrote:
> >
> > Hi,
> >
> > On 21-Oct-25 12:36, Ricardo Ribalda wrote:
> > > Some devices, like the Grandstream GUV3100 webcam, have an invalid UVC
> > > descriptor where multiple entities share the same ID, this is invalid
> > > and makes it impossible to make a proper entity tree without heuristics.
> > >
> > > We have recently introduced a change in the way that we handle invalid
> > > entities that has caused a regression on broken devices.
> > >
> > > Implement a new heuristic to handle these devices properly.
> > >
> > > Reported-by: Angel4005 <ooara1337@gmail.com>
> > > Closes: https://lore.kernel.org/linux-media/CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com/
> > > Fixes: 0e2ee70291e6 ("media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID")
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >
> > Thanks, patch looks good to me:
> >
> > Reviewed-by: Hans de Goede <hansg@kernel.org>
> 
> Thanks for the prompt reply.
> 
> @Hverkil I think you are planning to push to /fixes soon. I believe
> this patch should also land there.

Review is still ongoing :-) I've just sent comments, let's finish the
discussion first.

> > > ---
> > > I have managed to get my hands into a Grandstream GUV3100 and
> > > implemented a new heuristics. (Thanks Yunke and Hidenori!).
> > >
> > > With this heuristics we can use this camera again (see the /dev/video0
> > > in the topology).
> > >
> > > I have tested this change in a 6.6 kernel. Because the notebook that I
> > > used for testing has some issues running master. But for the purpose of
> > > this change this test should work.
> > >
> > > ~ # media-ctl --print-topology
> > > Media controller API version 6.6.99
> > >
> > > Media device information
> > > ------------------------
> > > driver          uvcvideo
> > > model           GRANDSTREAM GUV3100: GRANDSTREA
> > > serial
> > > bus info        usb-0000:00:14.0-9
> > > hw revision     0x409
> > > driver version  6.6.99
> > >
> > > Device topology
> > > - entity 1: GRANDSTREAM GUV3100: GRANDSTREA (1 pad, 1 link)
> > >             type Node subtype V4L flags 1
> > >             device node name /dev/video0
> > >         pad0: SINK
> > >                 <- "Extension 3":1 [ENABLED,IMMUTABLE]
> > >
> > > - entity 4: GRANDSTREAM GUV3100: GRANDSTREA (0 pad, 0 link)
> > >             type Node subtype V4L flags 0
> > >             device node name /dev/video1
> > >
> > > - entity 8: Extension 3 (2 pads, 2 links, 0 routes)
> > >             type V4L2 subdev subtype Unknown flags 0
> > >         pad0: SINK
> > >                 <- "Processing 2":1 [ENABLED,IMMUTABLE]
> > >         pad1: SOURCE
> > >                 -> "GRANDSTREAM GUV3100: GRANDSTREA":0 [ENABLED,IMMUTABLE]
> > >
> > > - entity 11: Processing 2 (2 pads, 3 links, 0 routes)
> > >              type V4L2 subdev subtype Unknown flags 0
> > >         pad0: SINK
> > >                 <- "Camera 1":0 [ENABLED,IMMUTABLE]
> > >         pad1: SOURCE
> > >                 -> "Extension 3":0 [ENABLED,IMMUTABLE]
> > >                 -> "Extension 4":0 [ENABLED,IMMUTABLE]
> > >
> > > - entity 14: Extension 4 (2 pads, 1 link, 0 routes)
> > >              type V4L2 subdev subtype Unknown flags 0
> > >         pad0: SINK
> > >                 <- "Processing 2":1 [ENABLED,IMMUTABLE]
> > >         pad1: SOURCE
> > >
> > > - entity 17: Camera 1 (1 pad, 1 link, 0 routes)
> > >              type V4L2 subdev subtype Sensor flags 0
> > >         pad0: SOURCE
> > >                 -> "Processing 2":0 [ENABLED,IMMUTABLE]
> > > ---
> > > Changes in v2:
> > > - Fix : invalid reference to the index variable of the iterator.
> > > - Link to v1: https://lore.kernel.org/r/20251021-uvc-grandstream-v1-1-801e3d08b271@chromium.org
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 15 ++++++++++++++-
> > >  1 file changed, 14 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..ee4f54d6834962414979a046afc59c5036455124 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -167,13 +167,26 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
> > >
> > >  static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
> > >  {
> > > -     struct uvc_streaming *stream;
> > > +     struct uvc_streaming *stream, *last_stream;
> > > +     unsigned int count = 0;
> > >
> > >       list_for_each_entry(stream, &dev->streams, list) {
> > > +             count += 1;
> > > +             last_stream = stream;
> > >               if (stream->header.bTerminalLink == id)
> > >                       return stream;
> > >       }
> > >
> > > +     /*
> > > +      * If the streaming entity is referenced by an invalid ID, notify the
> > > +      * user and use heuristics to guess the correct entity.
> > > +      */
> > > +     if (count == 1 && id == UVC_INVALID_ENTITY_ID) {
> > > +             dev_warn(&dev->intf->dev,
> > > +                      "UVC non compliance: Invalid USB header. The streaming entity has an invalid ID, guessing the correct one.");
> > > +             return last_stream;
> > > +     }
> > > +
> > >       return NULL;
> > >  }
> > >
> > >
> > > ---
> > > base-commit: ea299a2164262ff787c9d33f46049acccd120672
> > > change-id: 20251021-uvc-grandstream-05ecf0288f62

-- 
Regards,

Laurent Pinchart

