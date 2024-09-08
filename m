Return-Path: <linux-media+bounces-17888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FF970A77
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 00:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EF3F1F21E12
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2024 22:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7D6178CF6;
	Sun,  8 Sep 2024 22:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H2IVnZlS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF630F9EC;
	Sun,  8 Sep 2024 22:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725835158; cv=none; b=fKc6qezJ0pYJT90tDh+VU5PpK5cvuYWflD+chN3YV/BhlGBzlnjwaRUopD9Et4iBpyOMZoOZxCMM0qloK9NfjZwUtfZlT9kpt5glZJXWq3bmi6WVW4Ldc+rBjiKcmzwOPUhLzICKeafR4A11k9f6FkTaM/xeHf6aers5mndMvxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725835158; c=relaxed/simple;
	bh=oKBzCVtgHJg7DdDPVdriKTlHZHHU34KAuqI25QTmZmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYJMC2skZh7Y5zDnZ9/B5/QndVdhdLe4bOTgLAFoWT6kDe6UyXiHnv7sP1wO7OKXlxQ65guH1xqLrLHwUzEpOP6bNgZG2d1EJ2ju3GAR/bfi5C+4DwSKub6hQ8qNSZ9mc0N5CV7vAD64jfP46mTTtLWwkAZbV5IRzUcNjD2CMi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H2IVnZlS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91B985A4;
	Mon,  9 Sep 2024 00:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725835072;
	bh=oKBzCVtgHJg7DdDPVdriKTlHZHHU34KAuqI25QTmZmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2IVnZlSh8pEU3KW7Gz4vSVm67eN0dlFtz/gUGfVcWR9vjvOoolcNP9ykJh/k5n5X
	 6XjMrzipiV06ujtXy2i75+UHRtFCtlVRXUgKUUA9fdAgbfZogZY1IwRwNigKwSnyHJ
	 JKT8VxvREUyNxtLedg3FURFwh08oDhG3VDohAn4g=
Date: Mon, 9 Sep 2024 01:39:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] media: platform: rzg2l-cru: rzg2l-video: Retrieve
 virtual channel information
Message-ID: <20240908223905.GG15491@pendragon.ideasonboard.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906231038.GC12915@pendragon.ideasonboard.com>
 <CA+V-a8vsmYSOWgoiHnO5xWdn-wo-eda6hdxGz5X_Hc5s-yVv6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vsmYSOWgoiHnO5xWdn-wo-eda6hdxGz5X_Hc5s-yVv6g@mail.gmail.com>

Hi Prabhakar,

On Sat, Sep 07, 2024 at 10:09:10PM +0100, Lad, Prabhakar wrote:
> On Sat, Sep 7, 2024 at 12:10 AM Laurent Pinchart wrote:
> > On Fri, Sep 06, 2024 at 06:39:46PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify which
> > > virtual channel should be processed from the four available VCs. To
> > > retrieve this information from the connected subdevice, the
> > > .get_frame_desc() function is called.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 29 +++++++++++++++++++
> > >  1 file changed, 29 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index bbf4674f888d..6101a070e785 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -433,12 +433,41 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> > >       spin_unlock_irqrestore(&cru->qlock, flags);
> > >  }
> > >
> > > +static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> > > +{
> > > +     struct v4l2_mbus_frame_desc fd = { };
> > > +     struct media_pad *pad;
> > > +     int ret;
> > > +
> > > +     pad = media_pad_remote_pad_unique(&cru->ip.pads[1]);
> >
> > It would be nice to use RZG2L_CRU_IP_SOURCE here instead of hardcoding
> > the pad number. That would require moving rzg2l_csi2_pads to the shared
> > header. You can do that on top.
>
> With the below comment we dont need to move rzg2l_csi2_pads into the
> shared header.
> 
> > An now that I've said that, is it really the source pad you need here ?
>
> Ouch you are right.
> 
> > > +     if (IS_ERR(pad))
> > > +             return PTR_ERR(pad);
> >
> > Can this happen, or would the pipeline fail to validate ? I think you
> > can set the MUST_CONNECT flag on the sink pad, then you'll have a
> > guarantee something will be connected.
>
> After adding the MUST_CONNECT flag, I wouldn't need the  above
> media_pad_remote_pad_unique()...
> 
> > > +
> > > +     ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc,
> > > +                            pad->index, &fd);
>
> ... and here I can use '0' instead

Can you ? You need to call the operation on the pad of the connected
entity that is connected to tbe sink pad of the IP entity. That would be
the source pad of the CSI-2 RX in this case, but it can't be hardcoded
as it could also bethe source pad of a parallel sensor (once support for
that will be implemented). I think you therefore need to keep the
media_pad_remote_pad_unique() call.

> or do you prefer RZG2L_CRU_IP_SINK
> (I say because we are calling into remote subdev of IP which is CSI so
> the RZG2L_CRU_IP_SINK wont make sense)?
> 
> > > +     if (ret < 0 && ret != -ENOIOCTLCMD)
> >
> > Printing an error message would help debugging.
> >
> OK, I will add.
> 
> > > +             return ret;
> > > +     /* If remote subdev does not implement .get_frame_desc default to VC0. */
> > > +     if (ret == -ENOIOCTLCMD)
> > > +             return 0;
> > > +
> > > +     if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> >
> > An error message would help here too I think.
> >
> OK, I will add.
> 
> > > +             return -EINVAL;
> > > +
> > > +     return fd.num_entries ? fd.entry[0].bus.csi2.vc : 0;
> >
> > I think you should return an error if fd.num_entries is 0, that
> > shouldn't happen.
> >
> OK, I will add.
> 
> > > +}
> > > +
> > >  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > >  {
> > >       struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
> > >       unsigned long flags;
> > >       int ret;
> > >
> > > +     ret = rzg2l_cru_get_virtual_channel(cru);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +     cru->csi.channel = ret;
> >
> > How about passing the value to the function that needs it, instead of
> > storing it in cru->csi.channel ? You can do that on top and drop the
> > csi.channel field.
> >
> OK, let me check if this can be done.

-- 
Regards,

Laurent Pinchart

