Return-Path: <linux-media+bounces-14568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB69253E5
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 08:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC38B1F25435
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2024 06:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC12A132C3B;
	Wed,  3 Jul 2024 06:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XNN9UU8u"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDF11DA336;
	Wed,  3 Jul 2024 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719989225; cv=none; b=tp0NFmtWVPCs4CyjzGt22RrUR/6dTzLcCVOZ86sN8II2zLwxoIwSMtwFmdPKQTwyOPQ/dsz1XsxW9UtPVshru4fgH0aQxW9Auvdl2XYLqya1HTKDXnRxbztrtttKq/AfB1JZF2Eo0V5yj77tIgcGWfhdF1nVu/N4oPidS+pW93E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719989225; c=relaxed/simple;
	bh=sRH4XX/SpITUzgyYllUEYXThKOpItqyK7CjS72POQzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLAfjRSBvlO0eTWGtxgqiQBbvuXQjRZ2vR5/88ZY9RiEhrt/ALwg5n5dOIMV+pMtwBOjV0ciq+zgZKnmsCgMGgmlzDVELU1A9iW+vOMi8+0oVmhu84/hVESDvmVGrP5PzDifmeK4KO0zv4KNXt+l1pRAqudDRsPCD+ptwfv4x4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XNN9UU8u; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAB1B4CA;
	Wed,  3 Jul 2024 08:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719989192;
	bh=sRH4XX/SpITUzgyYllUEYXThKOpItqyK7CjS72POQzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XNN9UU8usnqMY4/3ZXVWKp3aiBDKyQiPE8/EamYRk1ELogAERnOVeQrnMasGaUN4k
	 lXjMKq2mM63KP6uMwB80FbEDMMpDreKwjVuGoP8hPvG8muYKgbplq2K/8Yff2Ncl+V
	 fXa+1D1gEK3/RQta7EPj0VxLg4yJWqEQ2lluwu7M=
Date: Wed, 3 Jul 2024 09:46:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, paul.elder@ideasonboard.com,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-media@vger.kernel.org>,
	"open list:ROCKCHIP ISP V1 DRIVER" <linux-rockchip@lists.infradead.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] media: rkisp1: Adapt to different SoCs having
 different size limits
Message-ID: <20240703064639.GA19586@pendragon.ideasonboard.com>
References: <20240315230245.1385902-1-megi@xff.cz>
 <5jbzvsoxtm7er6dwjcbswyu7xuaeqnlkbes3sue2hfrsps3ea3@znr2vugn52sq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5jbzvsoxtm7er6dwjcbswyu7xuaeqnlkbes3sue2hfrsps3ea3@znr2vugn52sq>

Hi Ondřej,

On Wed, Jun 12, 2024 at 02:58:02PM +0200, Ondřej Jirman wrote:
> On Sat, Mar 16, 2024 at 12:02:41AM GMT, megi xff wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> > 
> > - RK3399 has input/output limit of main path 4416 x 3312
> > - PX30 has input/output limit of main path 3264 x 2448
> > - i.MX8MP has input/output limit of main path 4096 x 3072
> > 
> > Use rkisp1_info struct to encode the limits.
> 
> It would be nice to get this merged. It's reviewed and ready.

All my apologies for the delay. I'm catching up with my patch queue.
Thanks for the ping, and thanks for upstreaming this change.

> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > ---
> > v2:
> > - adapt to i.MX8MP merged for v6.9
> > 
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h  | 6 ++++--
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c     | 5 +++--
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c     | 6 ++++++
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c     | 9 +++++----
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c | 4 ++--
> >  5 files changed, 20 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index 26573f6ae575..b4c958b93629 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -34,8 +34,6 @@ struct regmap;
> >  #define RKISP1_ISP_SD_SINK			BIT(1)
> >  
> >  /* min and max values for the widths and heights of the entities */

It's the min only now. I'll update this comment in my tree to

/*
 * Minimum values for the width and height of entities. The maximum values are
 * model-specific and stored in the rkisp1_info structure.
 */

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and queued.

> > -#define RKISP1_ISP_MAX_WIDTH			4032
> > -#define RKISP1_ISP_MAX_HEIGHT			3024
> >  #define RKISP1_ISP_MIN_WIDTH			32
> >  #define RKISP1_ISP_MIN_HEIGHT			32
> >  
> > @@ -140,6 +138,8 @@ enum rkisp1_feature {
> >   * @isr_size: number of entries in the @isrs array
> >   * @isp_ver: ISP version
> >   * @features: bitmask of rkisp1_feature features implemented by the ISP
> > + * @max_width: maximum input frame width
> > + * @max_height: maximum input frame height
> >   *
> >   * This structure contains information about the ISP specific to a particular
> >   * ISP model, version, or integration in a particular SoC.
> > @@ -151,6 +151,8 @@ struct rkisp1_info {
> >  	unsigned int isr_size;
> >  	enum rkisp1_cif_isp_version isp_ver;
> >  	unsigned int features;
> > +	unsigned int max_width;
> > +	unsigned int max_height;
> >  };
> >  
> >  /*
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > index 4202642e0523..841e58c20f7f 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
> > @@ -307,6 +307,7 @@ static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
> >  			      struct v4l2_subdev_state *sd_state,
> >  			      struct v4l2_subdev_format *fmt)
> >  {
> > +	struct rkisp1_csi *csi = to_rkisp1_csi(sd);
> >  	const struct rkisp1_mbus_info *mbus_info;
> >  	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
> >  
> > @@ -326,10 +327,10 @@ static int rkisp1_csi_set_fmt(struct v4l2_subdev *sd,
> >  
> >  	sink_fmt->width = clamp_t(u32, fmt->format.width,
> >  				  RKISP1_ISP_MIN_WIDTH,
> > -				  RKISP1_ISP_MAX_WIDTH);
> > +				  csi->rkisp1->info->max_width);
> >  	sink_fmt->height = clamp_t(u32, fmt->format.height,
> >  				   RKISP1_ISP_MIN_HEIGHT,
> > -				   RKISP1_ISP_MAX_HEIGHT);
> > +				   csi->rkisp1->info->max_height);
> >  
> >  	fmt->format = *sink_fmt;
> >  
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index bb0202386c70..0535ce57e862 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -510,6 +510,8 @@ static const struct rkisp1_info px30_isp_info = {
> >  	.features = RKISP1_FEATURE_MIPI_CSI2
> >  		  | RKISP1_FEATURE_SELF_PATH
> >  		  | RKISP1_FEATURE_DUAL_CROP,
> > +	.max_width = 3264,
> > +	.max_height = 2448,
> >  };
> >  
> >  static const char * const rk3399_isp_clks[] = {
> > @@ -531,6 +533,8 @@ static const struct rkisp1_info rk3399_isp_info = {
> >  	.features = RKISP1_FEATURE_MIPI_CSI2
> >  		  | RKISP1_FEATURE_SELF_PATH
> >  		  | RKISP1_FEATURE_DUAL_CROP,
> > +	.max_width = 4416,
> > +	.max_height = 3312,
> >  };
> >  
> >  static const char * const imx8mp_isp_clks[] = {
> > @@ -551,6 +555,8 @@ static const struct rkisp1_info imx8mp_isp_info = {
> >  	.isp_ver = RKISP1_V_IMX8MP,
> >  	.features = RKISP1_FEATURE_MAIN_STRIDE
> >  		  | RKISP1_FEATURE_DMA_34BIT,
> > +	.max_width = 4096,
> > +	.max_height = 3072,
> >  };
> >  
> >  static const struct of_device_id rkisp1_of_match[] = {
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > index e45a213baf49..f787a7e91e3e 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> > @@ -517,6 +517,7 @@ static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
> >  				      struct v4l2_subdev_state *sd_state,
> >  				      struct v4l2_subdev_frame_size_enum *fse)
> >  {
> > +	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
> >  	const struct rkisp1_mbus_info *mbus_info;
> >  
> >  	if (fse->pad == RKISP1_ISP_PAD_SINK_PARAMS ||
> > @@ -539,9 +540,9 @@ static int rkisp1_isp_enum_frame_size(struct v4l2_subdev *sd,
> >  		return -EINVAL;
> >  
> >  	fse->min_width = RKISP1_ISP_MIN_WIDTH;
> > -	fse->max_width = RKISP1_ISP_MAX_WIDTH;
> > +	fse->max_width = isp->rkisp1->info->max_width;
> >  	fse->min_height = RKISP1_ISP_MIN_HEIGHT;
> > -	fse->max_height = RKISP1_ISP_MAX_HEIGHT;
> > +	fse->max_height = isp->rkisp1->info->max_height;
> >  
> >  	return 0;
> >  }
> > @@ -772,10 +773,10 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
> >  
> >  	sink_fmt->width = clamp_t(u32, format->width,
> >  				  RKISP1_ISP_MIN_WIDTH,
> > -				  RKISP1_ISP_MAX_WIDTH);
> > +				  isp->rkisp1->info->max_width);
> >  	sink_fmt->height = clamp_t(u32, format->height,
> >  				   RKISP1_ISP_MIN_HEIGHT,
> > -				   RKISP1_ISP_MAX_HEIGHT);
> > +				   isp->rkisp1->info->max_height);
> >  
> >  	/*
> >  	 * Adjust the color space fields. Accept any color primaries and
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > index 6f3931ca5b51..e22cc2db24cf 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-resizer.c
> > @@ -494,10 +494,10 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
> >  
> >  	sink_fmt->width = clamp_t(u32, format->width,
> >  				  RKISP1_ISP_MIN_WIDTH,
> > -				  RKISP1_ISP_MAX_WIDTH);
> > +				  rsz->rkisp1->info->max_width);
> >  	sink_fmt->height = clamp_t(u32, format->height,
> >  				   RKISP1_ISP_MIN_HEIGHT,
> > -				   RKISP1_ISP_MAX_HEIGHT);
> > +				   rsz->rkisp1->info->max_height);
> >  
> >  	/*
> >  	 * Adjust the color space fields. Accept any color primaries and

-- 
Regards,

Laurent Pinchart

