Return-Path: <linux-media+bounces-13680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A0F90E89F
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 12:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A7862841BA
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 10:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA0312FF83;
	Wed, 19 Jun 2024 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Au9JpWnS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206DE75811;
	Wed, 19 Jun 2024 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718794203; cv=none; b=qOKPC2TLsTs6DAqi7nz+df02nORGy64Hjog2e56hYrUoejlwckoLhXOpGF9c4rRfoLXfH1pc7fREGEAHEhgTDp3hhoO/NUOU597X2TPSet7W1KEoKptMhWbXCWZ+Pdw4iYAmPX1jM0It9ua+KOiSl7FDac/UKYIiaisBclRMdAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718794203; c=relaxed/simple;
	bh=T2JL3ZjhOKB//JD0pX68PF8o5G/wZe9nFJhhTObij90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8u8xGGH6jmAGusFcFXuBgA68+T8c5/Jc51aQs38xNrYaUSIhbUHejt7DAIzmgI2TuKNLUtjUFpdIxqqPR5Hv+bcqJVQLD/9a0DVCRLhjJv6qrTdylXMyFEULh7rbMoRyMfXH08eZduK64FqM7veU8sUIuw0jG1qrKrTOWSWpBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Au9JpWnS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85B9A541;
	Wed, 19 Jun 2024 12:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718794182;
	bh=T2JL3ZjhOKB//JD0pX68PF8o5G/wZe9nFJhhTObij90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Au9JpWnS5XFN87HcdrUf1fjYYfXyvnyT33Tr1foJ5D3zPzDz4sOv15Ppfm1D3Ks58
	 Q6bHryfN8aeprQR+zlXEvk8YoDFYbTfnoZccG14MxyLs83acfq/WBPUcl2nYm19V3B
	 tJzkwQiNFDYVyCVWffS53/4bWY+eyLxQi2UF90+A=
Date: Wed, 19 Jun 2024 13:49:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vsp1: Print debug message to diagnose
 validation failure
Message-ID: <20240619104938.GJ21998@pendragon.ideasonboard.com>
References: <20240618194140.26788-1-laurent.pinchart+renesas@ideasonboard.com>
 <wbnjltcntvv2r4fv776lxcecsoihofzudikepvhkuucltf5yrl@577txugeutpe>
 <171878876949.2248009.10006118252023995535@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171878876949.2248009.10006118252023995535@ping.linuxembedded.co.uk>

On Wed, Jun 19, 2024 at 10:19:29AM +0100, Kieran Bingham wrote:
> Quoting Jacopo Mondi (2024-06-19 08:24:09)
> > On Tue, Jun 18, 2024 at 10:41:40PM GMT, Laurent Pinchart wrote:
> > > When formats don't match between a subdev and a connected video device,
> > > starting streaming returns an error without giving the user any
> > > indication as to what went wrong. To help debugging pipeline
> > > misconfigurations, add a debug message that indicates the cause of the
> > > failure.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Doesn't v4l2-subdev.c give you the same information if you enable
> > debug there ?
> 
> I think it would, except that this is being called from streamon - not the
> link-validation.

It does for subdev-to-subdev links validated by
v4l2_subdev_link_validate(). This is for the subdev-to-video link,
validated manually by the driver.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_video.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > index 5a9cb0e5640e..d6f2739456bf 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > > @@ -78,8 +78,14 @@ static int vsp1_video_verify_format(struct vsp1_video *video)
> > >
> > >       if (video->rwpf->fmtinfo->mbus != fmt.format.code ||
> > >           video->rwpf->format.height != fmt.format.height ||
> > > -         video->rwpf->format.width != fmt.format.width)
> > > +         video->rwpf->format.width != fmt.format.width) {
> > > +             dev_dbg(video->vsp1->dev,
> > > +                     "Format mismatch: 0x%04x/%ux%u != 0x%04x/%ux%u\n",
> > > +                     video->rwpf->fmtinfo->mbus, video->rwpf->format.width,
> > > +                     video->rwpf->format.height, fmt.format.code,
> > > +                     fmt.format.width, fmt.format.height);
> > >               return -EINVAL;
> > > +     }
> > >
> > >       return 0;
> > >  }
> > >
> > > base-commit: 91798162245991e26949ef62851719bb2177a9c2

-- 
Regards,

Laurent Pinchart

