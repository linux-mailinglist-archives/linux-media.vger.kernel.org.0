Return-Path: <linux-media+bounces-20420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D379B31B8
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 14:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00A9AB23609
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 13:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820F61DD0D4;
	Mon, 28 Oct 2024 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RPy4kWLO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A11D5178;
	Mon, 28 Oct 2024 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730122209; cv=none; b=oas6WMMra+4p18INrKqOIm4VVah94f6bq8KL0DE5bpO7LfZvz/5DLVhG5er/CCpZY8E+MdAINtlaFVhU+Se3vZRT3OxovJm5sFDbB9KJKw/Ksqhwbt2nuA0b/Iquv3raTdpAJQlqyrXPtueJSTYYLoowSCUYVOT/w45TvYqAySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730122209; c=relaxed/simple;
	bh=CkORn1lYBNn1JnbUC+lqClf67cvct/hgyHT2fEUq2j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAWnkWBYXY78husZ9tvpZO1MJDBNHp85mdKmAYxJWU99TuJJFZEqtcIxUxxttsrEIibdvB2AiLROGWRRhCunWL4zLSGVw/9U3VSeoof1wcdAP5BJFSvJrA9e8A5BN4NiK6wiECrYTRZPkvqh8rTlmh+uc+yjBY8vxL2ZnSCk3Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RPy4kWLO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 45C5A1A7D;
	Mon, 28 Oct 2024 14:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730122204;
	bh=CkORn1lYBNn1JnbUC+lqClf67cvct/hgyHT2fEUq2j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RPy4kWLODjFqQ+VgrpiwTgtehGGCllR4OxEDOoKZWa7Nvo5ERTyCFQThekLGGG2Ho
	 skf7KbE5yLqHFBSMtH/AL4IgC+sCPGR9LzEDFm5wlDD843fEZZCtF21tg/IIc1iGoJ
	 vsW0AaeSfA/M/70WMlvWIl4SnVnJkM4ChZ2/btxo=
Date: Mon, 28 Oct 2024 15:29:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mt9p031: Refactor format handling for
 different sensor models
Message-ID: <20241028132958.GF6081@pendragon.ideasonboard.com>
References: <20241025221638.127457-1-tarang.raval@siliconsignals.io>
 <Zx9c8gvmy_nY5l7e@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zx9c8gvmy_nY5l7e@kekkonen.localdomain>

On Mon, Oct 28, 2024 at 09:44:18AM +0000, Sakari Ailus wrote:
> Hi Tarang,
> 
> On Sat, Oct 26, 2024 at 03:45:40AM +0530, Tarang Raval wrote:
> > Add new structure 'mt9p031_model_info' to encapsulate format codes for
> > the mt9p031 camera sensor family. This approach enhances code clarity
> > and maintainability.
> > 
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> > ---
> >  drivers/media/i2c/mt9p031.c | 31 ++++++++++++++++++++++++++++---
> >  1 file changed, 28 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> > index f2f52f484044..3576d3066738 100644
> > --- a/drivers/media/i2c/mt9p031.c
> > +++ b/drivers/media/i2c/mt9p031.c
> > @@ -112,6 +112,24 @@
> >  #define MT9P031_TEST_PATTERN_RED			0xa2
> >  #define MT9P031_TEST_PATTERN_BLUE			0xa3
> >  
> > +struct mt9p031_model_info {
> > +	u32 code;
> > +};
> > +
> > +enum mt9p031_model {
> > +	MT9P031_MODEL_BAYER,
> > +	MT9P031_MODEL_MONO,
> > +};
> > +
> > +static const struct mt9p031_model_info mt9p031_models[] = {
> > +	[MT9P031_MODEL_BAYER] = {
> > +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> > +	},
> > +	[MT9P031_MODEL_MONO] = {
> > +		.code = MEDIA_BUS_FMT_Y12_1X12,
> > +	},
> > +};
> > +
> >  struct mt9p031 {
> >  	struct v4l2_subdev subdev;
> >  	struct media_pad pad;
> > @@ -1209,9 +1227,16 @@ static void mt9p031_remove(struct i2c_client *client)
> >  }
> >  
> >  static const struct of_device_id mt9p031_of_match[] = {
> > -	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> > -	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> > -	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
> > +	{
> > +		.compatible = "aptina,mt9p006",
> > +		.data = &mt9p031_models[MT9P031_MODEL_BAYER]
> > +	}, {
> > +		.compatible = "aptina,mt9p031",
> > +		.data = &mt9p031_models[MT9P031_MODEL_BAYER]
> > +	}, {
> > +		.compatible = "aptina,mt9p031m",
> > +		.data = &mt9p031_models[MT9P031_MODEL_MONO]
> 
> Instead using an index into an array, could you add structs for describing
> both separately? See e.g. drivers/media/i2c/ccs/ccs-core.c for an example.

For what it's worth, I prefer the array and indices. I don't care too
much though.

> > +	},
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, mt9p031_of_match);

-- 
Regards,

Laurent Pinchart

