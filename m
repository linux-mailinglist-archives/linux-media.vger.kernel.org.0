Return-Path: <linux-media+bounces-18516-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27263984804
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 16:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 812101F2184D
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 14:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F551AAE1A;
	Tue, 24 Sep 2024 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qyvw/JIx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345361B85F0
	for <linux-media@vger.kernel.org>; Tue, 24 Sep 2024 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727189497; cv=none; b=Tiu2e5nDjZ08Ypbg0Zz1RbMc0fcloNdg6V4hwk330Rt6JoFQmSW4HPV9SUnRoE3OLZYVdf0WtN5erIKRo/cvfOvlIeT6dPif88c5wgnfI0xhWA67LGFLYE+9aNS7FSvVZupP4hDJnDkqKUEblrDnp8ejnrh65C1P/mzE64VsMmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727189497; c=relaxed/simple;
	bh=fQ0uzDFWoE4ETJI3R0wjIgvEXA01wecFgh95iFng7nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfeXBn/0pCJ0LeVHc9S6scGT3myQKPqZg3MMtHSuZLCvku/mCJfhmcNxhrW0vTocu3m/60HmQo9JCYZDqzGQvl9k9p91YL3ZfD3KfrjfJkkc26coq+gkWGQl7ssh/qbufA84MI3Ai9chTPyzfQLP8TwNQLoeJ9vXKkTvwUsOP00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Qyvw/JIx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47AC9A8F;
	Tue, 24 Sep 2024 16:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727189406;
	bh=fQ0uzDFWoE4ETJI3R0wjIgvEXA01wecFgh95iFng7nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qyvw/JIxp25ExHI5PMmuUR4TgOzvZ4czw96Mo4nO3JbZ/Ah4htYVOpLOoKqMgfrdM
	 iizln4Ic5HzqdSd7msEi1MBqlfvHl4Q+a3eJHuPyk9MlZ5eUgJ5u3MeoMHatM4CBPC
	 /GkF/e2d5f3G/IPN0sBxn45IKocBELh6Bd2+2z0M=
Date: Tue, 24 Sep 2024 17:51:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>
Subject: Re: [PATCH 4/4] media: platform: rzg2l-cru: Add support for
 RAW10/12/14 data
Message-ID: <20240924145101.GG20255@pendragon.ideasonboard.com>
References: <20240920124115.375748-1-dan.scally@ideasonboard.com>
 <20240920124115.375748-5-dan.scally@ideasonboard.com>
 <k6nxxivka2abylkncwrvukra5xr3wambnroop5wxe6dyg3gkci@au6kxu6oigkp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <k6nxxivka2abylkncwrvukra5xr3wambnroop5wxe6dyg3gkci@au6kxu6oigkp>

On Tue, Sep 24, 2024 at 04:21:03PM +0200, Jacopo Mondi wrote:
> Hi Dan
> 
> On Fri, Sep 20, 2024 at 01:41:15PM GMT, Daniel Scally wrote:
> > From: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> >
> > Add support to the rzg2l-cru driver to capture 10/12/14 bit bayer
> > data and output it into the CRU's 64-bit packed pixel format.
> >
> > Signed-off-by: Daniel Scally <dan.scally+renesas@ideasonboard.com>
> 
> Maybe I'm missing something for some previous series, but I see
> rzg2l_cru_csi2_setup() programming ICnMC with the UserDefined data
> type ?

The function should use rzg2l_cru_ip_format.datatype << 16 (with an
appropriate register macro). I think I've commented on that in a
previous CRU patch series from Prabhakar, but I don't recall if the
comment has been addressed yet.

> > ---
> >  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 12 ++++
> >  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 72 +++++++++++++++++++
> >  2 files changed, 84 insertions(+)
> >
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > index 9609ca2a2f67..6b83f317919f 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> > @@ -192,6 +192,18 @@ static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
> >  	{ .code = MEDIA_BUS_FMT_SGBRG8_1X8, .bpp = 8, },
> >  	{ .code = MEDIA_BUS_FMT_SGRBG8_1X8, .bpp = 8, },
> >  	{ .code = MEDIA_BUS_FMT_SRGGB8_1X8, .bpp = 8, },
> > +	{ .code = MEDIA_BUS_FMT_SBGGR10_1X10, .bpp = 10, },
> > +	{ .code = MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, },
> > +	{ .code = MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, },
> > +	{ .code = MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, },
> > +	{ .code = MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, },
> > +	{ .code = MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12, },
> > +	{ .code = MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12, },
> > +	{ .code = MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, },
> > +	{ .code = MEDIA_BUS_FMT_SBGGR14_1X14, .bpp = 14, },
> > +	{ .code = MEDIA_BUS_FMT_SGBRG14_1X14, .bpp = 14, },
> > +	{ .code = MEDIA_BUS_FMT_SGRBG14_1X14, .bpp = 14, },
> > +	{ .code = MEDIA_BUS_FMT_SRGGB14_1X14, .bpp = 14, },
> >  };
> >
> >  static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
> > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > index f2fea3a63444..65b1cf9e553f 100644
> > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> > @@ -42,6 +42,78 @@ static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
> >  		.datatype = MIPI_CSI2_DT_RAW8,
> >  		.icndmr = 0,
> >  	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
> > +		.format = V4L2_PIX_FMT_CRU_SBGGR10,
> > +		.datatype = MIPI_CSI2_DT_RAW10,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
> > +		.format = V4L2_PIX_FMT_CRU_SGBRG10,
> > +		.datatype = MIPI_CSI2_DT_RAW10,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
> > +		.format = V4L2_PIX_FMT_CRU_SGRBG10,
> > +		.datatype = MIPI_CSI2_DT_RAW10,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> > +		.format = V4L2_PIX_FMT_CRU_SRGGB10,
> > +		.datatype = MIPI_CSI2_DT_RAW10,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
> > +		.format = V4L2_PIX_FMT_CRU_SBGGR12,
> > +		.datatype = MIPI_CSI2_DT_RAW12,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
> > +		.format = V4L2_PIX_FMT_CRU_SGBRG12,
> > +		.datatype = MIPI_CSI2_DT_RAW12,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> > +		.format = V4L2_PIX_FMT_CRU_SGRBG12,
> > +		.datatype = MIPI_CSI2_DT_RAW12,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
> > +		.format = V4L2_PIX_FMT_CRU_SRGGB12,
> > +		.datatype = MIPI_CSI2_DT_RAW12,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
> > +		.format = V4L2_PIX_FMT_CRU_SBGGR14,
> > +		.datatype = MIPI_CSI2_DT_RAW14,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
> > +		.format = V4L2_PIX_FMT_CRU_SGBRG14,
> > +		.datatype = MIPI_CSI2_DT_RAW14,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
> > +		.format = V4L2_PIX_FMT_CRU_SGRBG14,
> > +		.datatype = MIPI_CSI2_DT_RAW14,
> > +		.icndmr = 0,
> > +	},
> > +	{
> > +		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
> > +		.format = V4L2_PIX_FMT_CRU_SRGGB14,
> > +		.datatype = MIPI_CSI2_DT_RAW14,
> > +		.icndmr = 0,
> > +	},
> >  };
> >
> >  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)

-- 
Regards,

Laurent Pinchart

