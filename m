Return-Path: <linux-media+bounces-17994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 603CF971A0B
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 14:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB5801F2389D
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 12:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED5A1B81DE;
	Mon,  9 Sep 2024 12:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NKsEpgSL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38111B2529;
	Mon,  9 Sep 2024 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886470; cv=none; b=eKc+vfSZjlwCqo8RguJrF7hu6ftp3oqZFKESn+heSBpST7m4r8C+2P0A/vqUpM6vE9w9GaTp95mcQu6RnVVFmCRgqoJMk6PrldDccOJilxigpbhwwfYb4kfNIcbigroTFHJZ7h/5ipYrecupCnbfN4z0yhxQwIdZfxVmywOITgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886470; c=relaxed/simple;
	bh=txW1654y94X29FXMN4GClRGV1MDVbTcNImneVY/pVf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWHpJc6aCSKwq3N09+T1oVhPHo+LyivPNHLXBWeIVM/If3UyHChYpRptoB/2XLrj+PrLetPYS+eFrg23P9cIET29xoPl7s9Z8fjLxy28CTsaHhm8os5t00AmdjclqJiomN3BRECBV3xRwCgu/v0H8JsFBK3+LYSIQeyWwxxM4FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NKsEpgSL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-229-8-243.static.upcbusiness.at [213.229.8.243])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA73D3DA;
	Mon,  9 Sep 2024 14:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725886391;
	bh=txW1654y94X29FXMN4GClRGV1MDVbTcNImneVY/pVf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKsEpgSLOPB1qhSKxi951O7k2CmyMjRZRpuRZRLM0xHHnDd/XHKkOaNkRVYn3pt+W
	 nUuFPjLMl0ece0VU873fHPCTDDVDi3rJ5nq5mJJ4QUToiGp69UbUMNo7UdZQL6tNp3
	 SJ1Bm4FSs6/8Qq6FhIqzwjSkEr66OfDxVsbv3AYk=
Date: Mon, 9 Sep 2024 15:54:23 +0300
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
Message-ID: <20240909125423.GB13983@pendragon.ideasonboard.com>
References: <20240906173947.282402-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906173947.282402-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240906231038.GC12915@pendragon.ideasonboard.com>
 <CA+V-a8vsmYSOWgoiHnO5xWdn-wo-eda6hdxGz5X_Hc5s-yVv6g@mail.gmail.com>
 <20240908223905.GG15491@pendragon.ideasonboard.com>
 <CA+V-a8sEgOmL5P=YDZB4EnFy=RSFWjCVVPuBFYr39qSB83D_qQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8sEgOmL5P=YDZB4EnFy=RSFWjCVVPuBFYr39qSB83D_qQ@mail.gmail.com>

Hi Prabhakar,

On Mon, Sep 09, 2024 at 10:57:59AM +0100, Lad, Prabhakar wrote:
> On Sun, Sep 8, 2024 at 11:39 PM Laurent Pinchart wrote:
> > On Sat, Sep 07, 2024 at 10:09:10PM +0100, Lad, Prabhakar wrote:
> > > On Sat, Sep 7, 2024 at 12:10 AM Laurent Pinchart wrote:
> > > > On Fri, Sep 06, 2024 at 06:39:46PM +0100, Prabhakar wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > The RZ/G2L CRU needs to configure the ICnMC.VCSEL bits to specify which
> > > > > virtual channel should be processed from the four available VCs. To
> > > > > retrieve this information from the connected subdevice, the
> > > > > .get_frame_desc() function is called.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 29 +++++++++++++++++++
> > > > >  1 file changed, 29 insertions(+)
> > > > >
> > > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > index bbf4674f888d..6101a070e785 100644
> > > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > > @@ -433,12 +433,41 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> > > > >       spin_unlock_irqrestore(&cru->qlock, flags);
> > > > >  }
> > > > >
> > > > > +static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> > > > > +{
> > > > > +     struct v4l2_mbus_frame_desc fd = { };
> > > > > +     struct media_pad *pad;
> > > > > +     int ret;
> > > > > +
> > > > > +     pad = media_pad_remote_pad_unique(&cru->ip.pads[1]);
> > > >
> > > > It would be nice to use RZG2L_CRU_IP_SOURCE here instead of hardcoding
> > > > the pad number. That would require moving rzg2l_csi2_pads to the shared
> > > > header. You can do that on top.
> > >
> > > With the below comment we dont need to move rzg2l_csi2_pads into the
> > > shared header.
> > >
> > > > An now that I've said that, is it really the source pad you need here ?
> > >
> > > Ouch you are right.
> > >
> > > > > +     if (IS_ERR(pad))
> > > > > +             return PTR_ERR(pad);
> > > >
> > > > Can this happen, or would the pipeline fail to validate ? I think you
> > > > can set the MUST_CONNECT flag on the sink pad, then you'll have a
> > > > guarantee something will be connected.
> > >
> > > After adding the MUST_CONNECT flag, I wouldn't need the  above
> > > media_pad_remote_pad_unique()...
> > >
> > > > > +
> > > > > +     ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc,
> > > > > +                            pad->index, &fd);
> > >
> > > ... and here I can use '0' instead
> >
> > Can you ? You need to call the operation on the pad of the connected
> > entity that is connected to tbe sink pad of the IP entity. That would be
> > the source pad of the CSI-2 RX in this case, but it can't be hardcoded
> > as it could also bethe source pad of a parallel sensor (once support for
> > that will be implemented). I think you therefore need to keep the
> > media_pad_remote_pad_unique() call.
>
> media pipeline for RZ/G2L is [0].
> 
> Calling media_pad_remote_pad_unique() with sink pad of IP entity will
> return source pad of CSI-Rx, where the pad index will be '1', passing
> pad index '1' to .get_frame_desc to CSI subdev and then OV5645 subdev
> would return -EINVAL.

Why does it return -EINVAL ?

> I need to update patch [1] instead of just forwarding the pad index to
> remote subdev I'll need to do the same as done IP subdev ie in CSI
> subdev call media_pad_remote_pad_unique() on sink pad of CSI which
> will return OV5465 source pad, and this will have a pad index of '0'.

Ah, that's why it returns -EINVAL :-)

You're right, the pad number can't be propagated as-is.

> The CSI get_frame_desc() will look something like below:
> 
> static int rzg2l_csi2_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
>                      struct v4l2_mbus_frame_desc *fd)
> {
>     struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
>     struct media_pad *remote_pad;
> 
>     if (!csi2->remote_source)
>         return -ENODEV;
> 
>     remote_pad = media_pad_remote_pad_unique(&csi2->pads[RZG2L_CSI2_SINK]);
>     if (IS_ERR(remote_pad)) {
>         dev_err(csi2->dev, "can't get source pad of %s (%ld)\n",
>             csi2->remote_source->name, PTR_ERR(remote_pad));
>         return PTR_ERR(remote_pad);
>     }
>     return v4l2_subdev_call(csi2->remote_source, pad, get_frame_desc,
> remote_pad->index, fd);
> }
> 
> For the parallel input case I plan to implement something similar to
> R-Car vin with bool flag 'is_csi' where we skip calling
> 'rzg2l_cru_get_virtual_channel'.
> 
> [0] https://postimg.cc/rz0vSMLC
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240906173947.282402-2-prabhakar.mahadev-lad.rj@bp.renesas.com/

-- 
Regards,

Laurent Pinchart

