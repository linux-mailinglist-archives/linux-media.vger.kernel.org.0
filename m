Return-Path: <linux-media+bounces-9826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC38ABF52
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 15:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF094281AAC
	for <lists+linux-media@lfdr.de>; Sun, 21 Apr 2024 13:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BAF168A8;
	Sun, 21 Apr 2024 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qqL0lMLH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8560CA64;
	Sun, 21 Apr 2024 13:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713707201; cv=none; b=k1cM8wfMdDDw3P071aYZb6vBIP0g5JlqvjEt8yjYVvHrPMzDvQ+f40P8o6vTiNwLeblIaYWGnUb6ZgS39wM1DC5HTKdWI7OAB1FzqmiWDSAfmMcdjHlDBJdaM2hWayJZ3s37Drss0geDfJMCvdvz18+gBUbfhyHuHhi/uwfHcE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713707201; c=relaxed/simple;
	bh=ElWicUkggdeUnrR8dCJlVFr39q2mm/1nM4trwaLFtLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/XtKHHwqPlVOTN0D0QCRTk7CSOW7RViJtI/u8sZfi2yK15fxwE2b/2Qh/SgNYhUTrIhfdkFt/7OICT3wsRuBUnrHGCSgqOr8DmmMdNFXXZOhSjSC/x5Q9Vfd+EYW/nv2Jklz4oHPZVIBF4zmDbsawJzuvkSArvemhVzul0YBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qqL0lMLH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 095CF674;
	Sun, 21 Apr 2024 15:45:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713707148;
	bh=ElWicUkggdeUnrR8dCJlVFr39q2mm/1nM4trwaLFtLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqL0lMLHL0EoK0mWdAnpPCZOdZz3Lh3z30+iT4SUYE+GI0L7BDfxmpT3IypXL7mDQ
	 13xbc0H1PEUubTHmPeLl3lpDmll8ksti4Wbttbyo2DMFbb0FN1XugTwFfi5LWavry+
	 0l1m5SIEi04r/3m0xAyV4Fw7og5u+UD2VMLyc8hY=
Date: Sun, 21 Apr 2024 16:46:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to rzg2l_cru_video_register()
Message-ID: <20240421134630.GA29222@pendragon.ideasonboard.com>
References: <20240219180544.526537-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWO7n4oBr=U-DK2aa+S68kLX=VuzpuYDeA8KymzdnggNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWO7n4oBr=U-DK2aa+S68kLX=VuzpuYDeA8KymzdnggNg@mail.gmail.com>

On Thu, Apr 18, 2024 at 11:06:27AM +0200, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> On Mon, Feb 19, 2024 at 7:05 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Move request_irq() to rzg2l_cru_video_register(), in order to avoid
> > requesting IRQ during device start which happens frequently.
> >
> > Suggested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> 
> > @@ -1011,6 +1000,7 @@ void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru)
> >  {
> >         media_device_unregister(&cru->mdev);
> >         video_unregister_device(&cru->vdev);
> > +       free_irq(cru->image_conv_irq, cru);
> >  }
> >
> >  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
> > @@ -1018,6 +1008,13 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
> >         struct video_device *vdev = &cru->vdev;
> >         int ret;
> >
> > +       ret = request_irq(cru->image_conv_irq, rzg2l_cru_irq,
> > +                         IRQF_SHARED, KBUILD_MODNAME, cru);
> > +       if (ret) {
> > +               dev_err(cru->dev, "failed to request irq\n");
> > +               return ret;
> > +       }
> > +
> >         if (video_is_registered(&cru->vdev)) {
> 
> How can this happen? Perhaps rzg2l_cru_video_register() can be called
> multiple times through the rzg2l_cru_group_notify_complete() notifier?

The notifier completion handler shouldn't be called multiple times, no.
There's however a possibility (I think) that a subdev could disappear of
the device is unbound from its driver. If the device is later rebound,
the notifier completion handler could be called again.

The issue is that rzg2l_cru_video_unregister() is called from .remove().
I think a better fix would be to request the IRQ at probe time (or did
we discuss that previously and concluded it could cause issues ?). I
would also argue that the video devices should be registered at probe
time, not in the notifier completion handler.

> If that is true, the request_irq() should be moved after this block,
> just before the call to video_register_device() below.
> 
> >                 struct media_entity *entity;
> >
> > @@ -1032,14 +1029,18 @@ int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru)
> >         ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> >         if (ret) {
> >                 dev_err(cru->dev, "Failed to register video device\n");
> > -               return ret;
> > +               goto err_request_irq;
> >         }
> >
> >         ret = media_device_register(&cru->mdev);
> > -       if (ret) {
> > -               video_unregister_device(&cru->vdev);
> > -               return ret;
> > -       }
> > +       if (ret)
> > +               goto err_video_unregister;
> >
> >         return 0;
> > +
> > +err_video_unregister:
> > +       video_unregister_device(&cru->vdev);
> > +err_request_irq:
> > +       free_irq(cru->image_conv_irq, cru);
> > +       return ret;
> >  }

-- 
Regards,

Laurent Pinchart

