Return-Path: <linux-media+bounces-19857-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F43D9A3E53
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 14:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FBFF285ABE
	for <lists+linux-media@lfdr.de>; Fri, 18 Oct 2024 12:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204291CFA9;
	Fri, 18 Oct 2024 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q9ywZDnh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A548F6B;
	Fri, 18 Oct 2024 12:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729254382; cv=none; b=inJh2zDmgiZFB4/3NpDWbb/EVkjnU96s5HHyTBCkj0Sz0Fah5g/t0gfLHzAFNmNNL1FAQQXrK7cjuWTZqywHw/es/dEdhfC90nDkyX2x18DIKYbR+DGrWg6gwd+9LnggsgmxZcsqV2bOoIhapLqJv74evp4Tk+3HNzhWjPQ/TcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729254382; c=relaxed/simple;
	bh=V/oNUhoruPdZR4f93niyQCJKrqbyk02JdWlMOhZpWjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gt3jCafJA1ku9z1htrOgH+9Et1iUZyw3/fC2RZqBT/mhkk1VNWjXco13iSupBq5RsWetmoB26xcu/kFkdA6bPX8wlEHxOCLgoPIZn/KSsx0OB1Rr9uJ/KwaM10dZaTVPTdfeZ76nb6aLUqKNjbzIiOk8LkGe7Ts25zjxV/rm0uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q9ywZDnh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95D2159C;
	Fri, 18 Oct 2024 14:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729254273;
	bh=V/oNUhoruPdZR4f93niyQCJKrqbyk02JdWlMOhZpWjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9ywZDnhMjJnSHuKN0NU4I2qcP9Aw53tTrlRMtVKoZvzCFLBE8c5RS4KnYy6YvF0F
	 owNE2hUGSjAV+gEUmqmr7zvUC39gfOVQv85K6NeKKt2VbBkoXRFzoicFxlyTP0i2m8
	 G5jmPt56bsE1Uuk1je/mp7QyqlUPwCPhelnLvPjs=
Date: Fri, 18 Oct 2024 15:26:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 15/22] media: rzg2l-cru: Make use of
 v4l2_format_info() helpers
Message-ID: <20241018122611.GN30496@pendragon.ideasonboard.com>
References: <20241011173052.1088341-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241011173052.1088341-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241015103317.GJ5682@pendragon.ideasonboard.com>
 <CA+V-a8tRDhDBFZsMEyxPTbW0juZMpAcJ=bj4rA3Nbsku8y4PxA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tRDhDBFZsMEyxPTbW0juZMpAcJ=bj4rA3Nbsku8y4PxA@mail.gmail.com>

On Fri, Oct 18, 2024 at 12:45:36PM +0100, Lad, Prabhakar wrote:
> On Tue, Oct 15, 2024 at 11:33 AM Laurent Pinchart wrote:
> > On Fri, Oct 11, 2024 at 06:30:45PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Make use of v4l2_format_info() helpers to determine the input and
> > > output formats.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 22 ++++++-------------
> > >  1 file changed, 7 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > index 8932fab7c656..0cc69a7440bf 100644
> > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > @@ -300,21 +300,12 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > >       rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> > >  }
> > >
> > > -static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,
> > > +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > >                                const struct rzg2l_cru_ip_format *ip_fmt,
> > >                                u8 csi_vc)
> > >  {
> > >       u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> > >
> > > -     switch (ip_fmt->code) {
> > > -     case MEDIA_BUS_FMT_UYVY8_1X16:
> > > -             *input_is_yuv = true;
> > > -             break;
> > > -     default:
> > > -             *input_is_yuv = false;
> > > -             break;
> > > -     }
> > > -
> > >       icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
> > >
> > >       /* Set virtual channel CSI2 */
> > > @@ -327,19 +318,17 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
> > >                                          struct v4l2_mbus_framefmt *ip_sd_fmt,
> > >                                          u8 csi_vc)
> > >  {
> > > +     const struct v4l2_format_info *src_finfo, *dst_finfo;
> > >       const struct rzg2l_cru_ip_format *cru_ip_fmt;
> > > -     bool output_is_yuv = false;
> > > -     bool input_is_yuv = false;
> > >       u32 icndmr;
> > >
> > >       cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> > > -     rzg2l_cru_csi2_setup(cru, &input_is_yuv, cru_ip_fmt, csi_vc);
> > > +     rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
> > >
> > >       /* Output format */
> > >       switch (cru->format.pixelformat) {
> > >       case V4L2_PIX_FMT_UYVY:
> > >               icndmr = ICnDMR_YCMODE_UYVY;
> > > -             output_is_yuv = true;
> > >               break;
> > >       default:
> > >               dev_err(cru->dev, "Invalid pixelformat (0x%x)\n",
> > > @@ -347,8 +336,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
> > >               return -EINVAL;
> > >       }
> > >
> > > +     src_finfo = v4l2_format_info(cru_ip_fmt->format);
> > > +     dst_finfo = v4l2_format_info(cru->format.pixelformat);
> >
> > It would be a bit more efficient to add a yuv boolean field to the
> > rzg2l_cru_ip_format structure, as you already have looked up cru_ip_fmt
> > for the IP subdev format.
>
> I will consider this change, when adding support for the RZ/V2H SoC,
> hope that's OK for you.

It's not a blocker, it can be done on top indeed. If you end up
submitting a v6 you could add a patch on top already, but otherwise
later is fine too.

> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > > +
> > >       /* If input and output use same colorspace, do bypass mode */
> > > -     if (output_is_yuv == input_is_yuv)
> > > +     if (v4l2_is_format_yuv(src_finfo) == v4l2_is_format_yuv(dst_finfo))
> > >               rzg2l_cru_write(cru, ICnMC,
> > >                               rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
> > >       else

-- 
Regards,

Laurent Pinchart

