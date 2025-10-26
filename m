Return-Path: <linux-media+bounces-45588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC69C0B5E4
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 23:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33D62189AF60
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 22:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F239D2FDC3F;
	Sun, 26 Oct 2025 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="razqeGsB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8F1F4CAE;
	Sun, 26 Oct 2025 22:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761517726; cv=none; b=iTVy+trKzmx32QFpJROOf+FTlyByB5MJ5nLYP/wXhANDu9vBqiwcK/O8NB+6b7TXA2Yla++TKvXIfszg1ILVg5KMAtSlII5rqLmUXfQ+j98bBLcUGay9TbAvwjPJ4f/SNR/5gz9Tv5XbLYUvEXJ3bZb8skz1R8B/ltsiJy36SSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761517726; c=relaxed/simple;
	bh=VKQFo2wPNIL18CuB3qiB0jANg2tkXXNSpvhyiVgRsMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzC0ZZwAg4kOL3eLSj0+s8QBycapg1Q77Al0c+Wu0QVFAj1gNxVvbAYv+slIagB9GtbzxIMgPVFeahWYepU3aJQLSFRVDz4pRX4sQBixKXJPcqlNgAVr4UlCeB6xTmvZMVoS7nbvbX0XNVSUer2pDztnffT2EIW8ZAmSq8edUW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=razqeGsB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C0CFF1F0E;
	Sun, 26 Oct 2025 23:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761517614;
	bh=VKQFo2wPNIL18CuB3qiB0jANg2tkXXNSpvhyiVgRsMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=razqeGsBxSglcceb1F4Gdb98xf7ZRp6vHkqCOab9W65FnNoegiSim+m2Fk8fj/49C
	 MrM6YyoR7BoGpLT0pWLToks4e4XLehxL1gMaMbf2ifuo7vwxdXtfqEk5x0cK7Xt1FF
	 Th5s1naHJYqOzkVLYsfVdGGHKcErOyyYxSKhqZ8U=
Date: Mon, 27 Oct 2025 00:28:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/4] media: imx8mq-mipi-csi2: Add output filed in
 csi2_pix_format
Message-ID: <20251026222826.GJ13023@pendragon.ideasonboard.com>
References: <20250820-csi2_imx8mq-v5-0-e04a6fc593bd@nxp.com>
 <20250820-csi2_imx8mq-v5-2-e04a6fc593bd@nxp.com>
 <aKXcPVQnQzCx6C5z@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKXcPVQnQzCx6C5z@lizhi-Precision-Tower-5810>

On Wed, Aug 20, 2025 at 10:31:25AM -0400, Frank Li wrote:
> On Wed, Aug 20, 2025 at 07:04:57PM +0800, Guoniu Zhou wrote:
> > Add output filed in csi2_pix_format since the format on the
> > source pad might change due to unpacking.
> 
> Nit: wrap at 75 chars position
> 
> Add output filed in csi2_pix_format since the format on the source pad

s/filed/field/

> might change due to unpacking.
> 
> Treat 0 as meaning the output uses the same format as the input.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 85700655ecad334c61e9b5f9f073e10b6db2618f..ad7adc677e389e0f35b0cf63195279e197907f8c 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -139,6 +139,7 @@ struct csi_state {
> >

A kerneldoc block would be good here to document the fields, it's not
very clear from the name what the output field is.

> >  struct csi2_pix_format {
> >  	u32 code;
> > +	u32 output;
> >  };
> >
> >  /* -----------------------------------------------------------------------------
> > @@ -634,6 +635,9 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
> >  	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SOURCE);
> >  	*fmt = sdformat->format;
> >
> > +	/* The format on the source pad might change due to unpacking. */
> > +	fmt->code = csi2_fmt->output ? : csi2_fmt->code;
> > +
> >  	return 0;
> >  }
> >

-- 
Regards,

Laurent Pinchart

