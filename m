Return-Path: <linux-media+bounces-13661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C729290E6CB
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 11:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BB8A1F21A8D
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 09:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5839F8002E;
	Wed, 19 Jun 2024 09:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vlpLgTvo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392E879DC7;
	Wed, 19 Jun 2024 09:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718788775; cv=none; b=F1FlxEPSgHTv9dwQ2juaJL0mdnty7E45+UvG/6DFqNYI+gtS0zkmfVZbZGgO26kVVwQTBMSwP0FS1WCrFMNX/zwewipcRhycHdoO3xCYNw0xGKtlV6GZH3OjF+kLsc+n02iOj7Rq0bps/PEhi+JkOoCI6uGl32bs+A7YToVX2ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718788775; c=relaxed/simple;
	bh=hin/385B6x/YEXqkUmrBN52PXnSZB+1y5Au+GdbYio4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=tq2h30Sc8egoW4pt7LMq4xh0hespjsY2QYBiV7l9V8COhxcRVOt8vpMReLdMDUW1xcdfmXTyhAMBLMFFDqOnVJqlxXgVBLidJjfwMc945mjCYZOFH07FKQOlyhYtrVIL/BIo6Jo2rw2zQqxrbdRJRMsOBn1vxTPYa94L2bA7tHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vlpLgTvo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A76EAE4;
	Wed, 19 Jun 2024 11:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718788754;
	bh=hin/385B6x/YEXqkUmrBN52PXnSZB+1y5Au+GdbYio4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vlpLgTvogSVMqvhI3JD6NzmH6zZWDn5u8a8WLLk5Eml8wdPP1qGpQ/jxoeWlRL2D+
	 1ESQ0kYL7TuxrJWpYuQAWK0/V1cfy7e0rPdVrFdRaCNP5q8c9u0YlcOP7fRDYdQeKG
	 vbu4yHjd6ynqlxqdoeuUWq+whLRL53vNIZX3Ny5c=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <wbnjltcntvv2r4fv776lxcecsoihofzudikepvhkuucltf5yrl@577txugeutpe>
References: <20240618194140.26788-1-laurent.pinchart+renesas@ideasonboard.com> <wbnjltcntvv2r4fv776lxcecsoihofzudikepvhkuucltf5yrl@577txugeutpe>
Subject: Re: [PATCH] media: renesas: vsp1: Print debug message to diagnose validation failure
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Date: Wed, 19 Jun 2024 10:19:29 +0100
Message-ID: <171878876949.2248009.10006118252023995535@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Jacopo Mondi (2024-06-19 08:24:09)
> Hi Laurent
>=20
> On Tue, Jun 18, 2024 at 10:41:40PM GMT, Laurent Pinchart wrote:
> > When formats don't match between a subdev and a connected video device,
> > starting streaming returns an error without giving the user any
> > indication as to what went wrong. To help debugging pipeline
> > misconfigurations, add a debug message that indicates the cause of the
> > failure.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
>=20
> Doesn't v4l2-subdev.c give you the same information if you enable
> debug there ?

I think it would, except that this is being called from streamon - not the
link-validation.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_video.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_video.c b/drivers=
/media/platform/renesas/vsp1/vsp1_video.c
> > index 5a9cb0e5640e..d6f2739456bf 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_video.c
> > @@ -78,8 +78,14 @@ static int vsp1_video_verify_format(struct vsp1_vide=
o *video)
> >
> >       if (video->rwpf->fmtinfo->mbus !=3D fmt.format.code ||
> >           video->rwpf->format.height !=3D fmt.format.height ||
> > -         video->rwpf->format.width !=3D fmt.format.width)
> > +         video->rwpf->format.width !=3D fmt.format.width) {
> > +             dev_dbg(video->vsp1->dev,
> > +                     "Format mismatch: 0x%04x/%ux%u !=3D 0x%04x/%ux%u\=
n",
> > +                     video->rwpf->fmtinfo->mbus, video->rwpf->format.w=
idth,
> > +                     video->rwpf->format.height, fmt.format.code,
> > +                     fmt.format.width, fmt.format.height);
> >               return -EINVAL;
> > +     }
> >
> >       return 0;
> >  }
> >
> > base-commit: 91798162245991e26949ef62851719bb2177a9c2
> > --
> > Regards,
> >
> > Laurent Pinchart
> >

