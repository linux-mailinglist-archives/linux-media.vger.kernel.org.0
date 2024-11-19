Return-Path: <linux-media+bounces-21567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA289D20A4
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 08:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B43B282987
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 07:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FA181531D2;
	Tue, 19 Nov 2024 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a+cqY/N+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02C68F64
	for <linux-media@vger.kernel.org>; Tue, 19 Nov 2024 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732000820; cv=none; b=GGsI4lgsj5Le0oTj/9ah6fNloEu+0M7TZtQqW5Y/8Iibj/dVY9hgHk+hxyQ19oDmN5e8JE1buCjm1DEupRB48BvIOGbZrEacMCGiVKcQ8ggKvCRhUXs+pN5Eh2b4x/WQmAhQDemxRafUE8UNqsYU72CdqgWZHLaHrJhYq095lU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732000820; c=relaxed/simple;
	bh=vDfNpBATbqiohLBZZWbOT3dDbOnebLdmZGrBs9Z9iOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpJhW9w1urB0897AtpdAt/n8+CRHndASMZ/wvH6d4ClC+lJvz0/Fu5WyZiZImR2wXXnyjsp/ohG2fBWvqhOpZC3Cw0ROOQYGhPJpL0rPu8AhQYCp66j/waumN6kQLksbnXN+Lr/iREaI1SIeH4RPRQioQ5gJWT5lsocdH/KpUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a+cqY/N+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66B9F1230;
	Tue, 19 Nov 2024 08:19:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732000796;
	bh=vDfNpBATbqiohLBZZWbOT3dDbOnebLdmZGrBs9Z9iOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+cqY/N+eyeEL9tz7k/ChklS5HgOTWSam83Tgzmbx/1H+G9X0/1KMwgQex4wVlJDC
	 vzdHYz5Y50DPwyH9Ug7AUXxX7GNBv3GZ1QjwqL8jHtdEjKID0KskJWQ9hrXag6azwH
	 am6z3Gv0Qm4tLs/RBVl7T76YwR5qZaM3hjYkYKsc=
Date: Tue, 19 Nov 2024 09:20:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Hans de Goede as USB VIDEO CLASS
 co-maintainer
Message-ID: <20241119072002.GN12409@pendragon.ideasonboard.com>
References: <20241116113855.50976-1-hdegoede@redhat.com>
 <20241117213837.GJ12409@pendragon.ideasonboard.com>
 <20241118071801.51894f08@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118071801.51894f08@foz.lan>

Hi Mauro,

On Mon, Nov 18, 2024 at 07:18:01AM +0100, Mauro Carvalho Chehab wrote:
> Em Sun, 17 Nov 2024 23:38:37 +0200 Laurent Pinchart escreveu:
> > On Sat, Nov 16, 2024 at 12:38:55PM +0100, Hans de Goede wrote:
> > > Add myself as co-maintainer for the UVC driver.  
> > 
> > Thanks for volunteering to help.
> > 
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>  
> > 
> > Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > ---
> > >  MAINTAINERS | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 91d0609db61b..1da403e89159 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -24063,6 +24063,7 @@ F:	drivers/usb/host/uhci*
> > >  
> > >  USB VIDEO CLASS
> > >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > +M:	Hans de Goede <hdegoede@redhat.com>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  W:	http://www.ideasonboard.org/uvc/  
> > 
> > I think we should update the git tree entry as well, as we're using
> > https://gitlab.freedesktop.org/linux-media/users/uvc/. As that's
> > temporary until we can merge patches directly in the multi-committers
> > tree, it may however not be worth it. What do you think ?
> 
> The official tree is now at:
> 
> 	git://linuxtv.org/media.git
> 
> Such tree is not expected to be rebased, so IMO the best is to point
> to it. I just submitted a patch mass-updating the references to
> media_tree.git to it. Such patch has to be backported, as even
> stable versions should be pointing to an existing tree (and we may
> soon get rid of the media_tree.git and media_stage.git trees).
> 
> Assuming that we have a smooth process, I don't expect that patches
> at the uvc merge tree to be there for a long time. Also, this is
> meant to be a short-lived tree with the migration to media-committers
> (which is a tree that can be rebased).
> 
> So, IMO, it is not worth pointing to the uvc merge tree.

The migration to the multi-committers tree is the main reason why I
don't think it's worth it to point to
https://gitlab.freedesktop.org/linux-media/users/uvc/, assuming we start
using the multi-committers model very soon. Once done, the git tree
entry should point to that tree.

-- 
Regards,

Laurent Pinchart

