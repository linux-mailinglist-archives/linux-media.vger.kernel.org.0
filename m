Return-Path: <linux-media+bounces-13571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 014DF90D8A7
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 18:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F666B37911
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 15:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59BD39AEC;
	Tue, 18 Jun 2024 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="whx/m/r3"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23C01DA53
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723688; cv=none; b=ODvNiZSYxlpoVt43ac6egaRXvJJZYBVVbZhTZb8AwvuFdCPE31fs+/1Yed1Ggxy4kkEGa0giJl+yq5l0AQV5fr8zM32Dd8v9pxdKy7qm4zHoKBd+OhORomhAJXUgL1C/18l0hCXJMvcGzUqyvBjn7E8tM0a9oLlrUVbi+Ac7dQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723688; c=relaxed/simple;
	bh=UC74Sgo3DdupjFWAcEXfPpj0OkaNM1m83CJC2lz0pFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG1EtGkUxM7nrK1xmBYTyAhjKhO02AKrYRboszbUc9zz8Pr6BY3EygvsFaTMBpV3/SxMHN+aw1sht5LKuzowcbH6cuT7FLbR4sQ6WJD1gi8P1T8ViFVVyWBST7uIVSWBGGPaaqjs5jE1+MI+MHYFUWj/arDltaLUthTajO0pyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=whx/m/r3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5F815908;
	Tue, 18 Jun 2024 17:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718723667;
	bh=UC74Sgo3DdupjFWAcEXfPpj0OkaNM1m83CJC2lz0pFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=whx/m/r3t7Wei++PVvuZpHxspZM1pVXVuYl8eR1Bg64FgXGVbLj7g3nHMXjJTVddJ
	 ZzugriK9lszST54ib68/2pjAdUu3+TumxLihiIgG/auX3VlydOgZwqLtL4lxOmGbiH
	 fvU/4FeSC/J0n6uIXEBHzIrrOa+qIUgSTIpJAyzY=
Date: Tue, 18 Jun 2024 18:14:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v1 1/2] media: v4l2-subdev: Drop unreacheable warning
Message-ID: <20240618151421.GD22767@pendragon.ideasonboard.com>
References: <20231113101718.6098-1-laurent.pinchart+renesas@ideasonboard.com>
 <20231113101718.6098-2-laurent.pinchart+renesas@ideasonboard.com>
 <ZVH9iO5XPay8In_R@valkosipuli.retiisi.eu>
 <20231113105016.GA24338@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231113105016.GA24338@pendragon.ideasonboard.com>

Hi Sakari,

On Mon, Nov 13, 2023 at 12:50:16PM +0200, Laurent Pinchart wrote:
> On Mon, Nov 13, 2023 at 10:42:16AM +0000, Sakari Ailus wrote:
> > On Mon, Nov 13, 2023 at 12:17:17PM +0200, Laurent Pinchart wrote:
> > > The v4l2_subdev_link_validate_get_format() function warns if the pad
> > > given as argument belongs to a non-subdev entity. This can't happen, as
> > > the function is called from v4l2_subdev_link_validate() only (indirectly
> > > through v4l2_subdev_link_validate_locked()), and that function ensures
> > > that both ends of the link are subdevs.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-subdev.c | 8 --------
> > >  1 file changed, 8 deletions(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > > index be86b906c985..67d43206ce32 100644
> > > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > > @@ -1184,14 +1184,6 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
> > >  	struct v4l2_subdev *sd;
> > >  	int ret;
> > >  
> > > -	if (!is_media_entity_v4l2_subdev(pad->entity)) {
> > > -		WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
> > > -		     "Driver bug! Wrong media entity type 0x%08x, entity %s\n",
> > > -		     pad->entity->function, pad->entity->name);
> > > -
> > > -		return -EINVAL;
> > > -	}
> > > -
> > >  	sd = media_entity_to_v4l2_subdev(pad->entity);
> > 
> > It'd be good to check sd is non-NULL here, although pad presumably is
> > always a pad of a sub-device entity.
> 
> It's guaranteed by the caller. Is there a specific reason you think a
> check would be good ?

Would you still want a check ?

> > >  
> > >  	fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;

-- 
Regards,

Laurent Pinchart

