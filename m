Return-Path: <linux-media+bounces-13063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32478905748
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 17:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 369401C21EC7
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 15:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2181E16EC13;
	Wed, 12 Jun 2024 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="egqyAzA/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097EC182AF
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718207224; cv=none; b=KOlg5T7mhOpz0XRgIUL9TcT5Jd2GYMMN7/I5t/m68DENoPCBYDE2qdx/GWizzqIKfLRMItTh/awLZAaJqYzepjnvVyHu+Zxsnjd9DwTk6lHBhBON4hlCpUlxaH41rp95IIeqspAep1iM3Jzvu7ct4CS0i0sVlIDmz76DEuzKRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718207224; c=relaxed/simple;
	bh=er7OLfK+yHtAry/YoOy1NBrIy7OlJx+xE0MARyqJf3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGXZ+UcRwP537jveSMT8Yn0A6t9ycH4vYz7u1KlzAeiE/BS7ZL+Jfn/ysjBaSIOjGuwaaAYZYLoswc7WQeZW3IspFDvYam25ZUl674V0sWlBwG8IMTBLGwA2+hyCMHWqV3qzN/WiXe52VVScdEKGmFf6oOHZZx24XJo+U+plaPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=egqyAzA/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5EBE7230;
	Wed, 12 Jun 2024 17:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718207207;
	bh=er7OLfK+yHtAry/YoOy1NBrIy7OlJx+xE0MARyqJf3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=egqyAzA/AlSCy7Jnap8OrFmw0wEkHePzUK5SzqS5I6ATn0MNc4MOslaW3aUW/ICw4
	 Y+iMf2e0Wp5h3e/KNHWpMVN8zYbc8BVB91T/Y0aT8LhgWvHe7qKdMkHRgo5QLFxzzj
	 IFia9TTmpggBJQiqQfwuHfmPsImcY4d8GNdZ2Poo=
Date: Wed, 12 Jun 2024 18:46:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 6/8] media: rkisp1: Propagate pre/post-config errors
Message-ID: <20240612154640.GE15991@pendragon.ideasonboard.com>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-7-jacopo.mondi@ideasonboard.com>
 <109cc53d-fb84-4133-a8e1-5418eb29d352@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <109cc53d-fb84-4133-a8e1-5418eb29d352@ideasonboard.com>

On Wed, Jun 12, 2024 at 02:35:39PM +0100, Daniel Scally wrote:
> Hi Jacopo - thanks for the patch. I think this probably should come
> before 5/8 in the series, and just hardcode return 0 in
> rkisp1_params_pre/post_configure() temporarily.

There should be no need to return errors from those two functions.
They're called at runtime to apply parameters. Validation of the
parameters should happen earlier, at qbuf time.

> On 05/06/2024 17:54, Jacopo Mondi wrote:
> > The support for the extensible parameters format introduces the
> > possibility of failures in handling the parameters buffer.
> >
> > Errors in parsing the configuration parameters are not propagated
> > to the rkisp1_config_isp() and the rkisp1_isp_start() functions.
> >
> > Propagate any possible errors to the callers to report it to userspace.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >   .../media/platform/rockchip/rkisp1/rkisp1-common.h | 10 +++++-----
> >   .../media/platform/rockchip/rkisp1/rkisp1-isp.c    | 14 +++++++++-----
> >   .../media/platform/rockchip/rkisp1/rkisp1-params.c | 14 +++++++++-----
> >   3 files changed, 23 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 0bddae8dbdb1..f9df5ed96c98 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -591,10 +591,10 @@ const struct rkisp1_mbus_info *rkisp1_mbus_info_get_by_code(u32 mbus_code);
> >    * It applies the initial ISP parameters from the first params buffer, but
> >    * skips LSC as it needs to be configured after the ISP is started.
> >    */
> > -void rkisp1_params_pre_configure(struct rkisp1_params *params,
> > -				 enum rkisp1_fmt_raw_pat_type bayer_pat,
> > -				 enum v4l2_quantization quantization,
> > -				 enum v4l2_ycbcr_encoding ycbcr_encoding);
> > +int rkisp1_params_pre_configure(struct rkisp1_params *params,
> > +				enum rkisp1_fmt_raw_pat_type bayer_pat,
> > +				enum v4l2_quantization quantization,
> > +				enum v4l2_ycbcr_encoding ycbcr_encoding);
> >   
> >   /*
> >    * rkisp1_params_post_configure - Configure the params after stream start
> > @@ -604,7 +604,7 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
> >    * This function is called by the ISP entity just after the ISP gets started.
> >    * It applies the initial ISP LSC parameters from the first params buffer.
> >    */
> > -void rkisp1_params_post_configure(struct rkisp1_params *params);
> > +int rkisp1_params_post_configure(struct rkisp1_params *params);
> >   
> >   /* rkisp1_params_disable - disable all parameters.
> >    *			   This function is called by the isp entity upon stream start
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index 91301d17d356..05227c6a16fe 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -310,12 +310,16 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
> >   		rkisp1_params_disable(&rkisp1->params);
> >   	} else {
> >   		const struct v4l2_mbus_framefmt *src_frm;
> > +		int ret;
> >   
> >   		src_frm = v4l2_subdev_state_get_format(sd_state,
> >   						       RKISP1_ISP_PAD_SOURCE_VIDEO);
> > -		rkisp1_params_pre_configure(&rkisp1->params, sink_fmt->bayer_pat,
> > -					    src_frm->quantization,
> > -					    src_frm->ycbcr_enc);
> > +		ret = rkisp1_params_pre_configure(&rkisp1->params,
> > +						  sink_fmt->bayer_pat,
> > +						  src_frm->quantization,
> > +						  src_frm->ycbcr_enc);
> > +		if (ret)
> > +			return ret;
> >   	}
> >   
> >   	isp->sink_fmt = sink_fmt;
> > @@ -458,9 +462,9 @@ static int rkisp1_isp_start(struct rkisp1_isp *isp,
> >   	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
> >   
> >   	if (src_info->pixel_enc != V4L2_PIXEL_ENC_BAYER)
> > -		rkisp1_params_post_configure(&rkisp1->params);
> > +		ret = rkisp1_params_post_configure(&rkisp1->params);
> >   
> > -	return 0;
> > +	return ret;
> 
> I think ret could be returned uninitialised in some circumstances in this function now - if it's not 
> the IMX8MP version and the pixel encoding is bayer...or am I missing something?
> 
> >   }
> >   
> >   /* ----------------------------------------------------------------------------
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index 3d78e643d0b8..c081fd490b2b 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -2123,10 +2123,10 @@ static const struct rkisp1_cif_isp_afc_config rkisp1_afc_params_default_config =
> >   	14
> >   };
> >   
> > -void rkisp1_params_pre_configure(struct rkisp1_params *params,
> > -				 enum rkisp1_fmt_raw_pat_type bayer_pat,
> > -				 enum v4l2_quantization quantization,
> > -				 enum v4l2_ycbcr_encoding ycbcr_encoding)
> > +int rkisp1_params_pre_configure(struct rkisp1_params *params,
> > +				enum rkisp1_fmt_raw_pat_type bayer_pat,
> > +				enum v4l2_quantization quantization,
> > +				enum v4l2_ycbcr_encoding ycbcr_encoding)
> >   {
> >   	struct rkisp1_cif_isp_hst_config hst = rkisp1_hst_params_default_config;
> >   	struct rkisp1_buffer *buf;
> > @@ -2187,9 +2187,11 @@ void rkisp1_params_pre_configure(struct rkisp1_params *params,
> >   
> >   unlock:
> >   	spin_unlock_irq(&params->config_lock);
> > +
> > +	return ret;
> >   }
> >   
> > -void rkisp1_params_post_configure(struct rkisp1_params *params)
> > +int rkisp1_params_post_configure(struct rkisp1_params *params)
> >   {
> >   	struct rkisp1_buffer *buf;
> >   	int ret = 0;
> > @@ -2227,6 +2229,8 @@ void rkisp1_params_post_configure(struct rkisp1_params *params)
> >   
> >   unlock:
> >   	spin_unlock_irq(&params->config_lock);
> > +
> > +	return ret;
> >   }
> >   
> >   /*

-- 
Regards,

Laurent Pinchart

