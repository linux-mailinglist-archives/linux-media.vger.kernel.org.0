Return-Path: <linux-media+bounces-40636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4149B2FF54
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 17:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75651B00A4D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 15:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DD33277A4;
	Thu, 21 Aug 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PNjKbrh/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816BE3376AA;
	Thu, 21 Aug 2025 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755791099; cv=none; b=DDQka5javJ2mMQgRF0LP1H/rrSl6Gd6WhuRDoaMKnaSq/7aMNaLfbFyiy0GRZx+tPTBL/qnMISbSwi8i56j7ZUpsqd0s/OS9afYxVohRHoA71js/HoEVW6EfD/gX4L/HKsc1LWmxT1XnIb/Rnb5XapbIx95RuAhBHZZ6iLpC+6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755791099; c=relaxed/simple;
	bh=6cNE3u3j5QI47w0oDtuojswNnENPUhE4eeZEZt9BAYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mB/LAZQv0mGVI2iLKk7yATXrF1c5ZezG+VqkkTW0QHUNJOKea/YIvBYlQ/rlcfEa33tpzjjEqLwJUXGEWhd7NJoJOX44O++KvShTvp9vn8L7lRxPsEQjlLKO/oPHVxfvsPWe+Rss8y5jMTurPtvQeV/uFAoqZviVsVSEui02sMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PNjKbrh/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 75A5E605;
	Thu, 21 Aug 2025 17:43:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755791033;
	bh=6cNE3u3j5QI47w0oDtuojswNnENPUhE4eeZEZt9BAYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNjKbrh/xyUKrUDG/NqLXH1guYREo8PgzB0DbmstuuqbMs+f/4qDudezy7oK1IW/p
	 B2/lBTLJFfjsMuYbLMWb9F5Txu1AxX7RIOB6YD+K0IORoejY6i3yanbBBImL5dMiVu
	 Y8JL4xn4de5b1t2cLWoN1zhejuWqsx5pxJyi3Ngg=
Date: Thu, 21 Aug 2025 18:44:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/12] media: imx-mipi-csis: Simplify access to source
 pad
Message-ID: <20250821154429.GC25098@pendragon.ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
 <20250821000944.27849-3-laurent.pinchart@ideasonboard.com>
 <aKc27pzVlhPUW8bd@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aKc27pzVlhPUW8bd@lizhi-Precision-Tower-5810>

On Thu, Aug 21, 2025 at 11:10:38AM -0400, Frank Li wrote:
> On Thu, Aug 21, 2025 at 03:09:34AM +0300, Laurent Pinchart wrote:
> > The mipi_csis_calculate_params() function needs to access the pad of the
> > connected source. The pad is already available in csis->source.pad, but
> > the function takes a convoluted path by getting the pad index and
> > indexing the source subdev's pads array. Simplify it.
> 
> Generally, I like add "No functionality change" in commit message to help
> reviewer or developer direct skip this commit when bisect commit to
> indentify problem.

Good point. I'll add

"No functional change is intended."

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> Frank Li
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 2beb5f43c2c0..46f93cd677e3 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -579,13 +579,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
> >  static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
> >  				      const struct csis_pix_format *csis_fmt)
> >  {
> > -	struct media_pad *src_pad =
> > -		&csis->source.sd->entity.pads[csis->source.pad->index];
> >  	s64 link_freq;
> >  	u32 lane_rate;
> >
> >  	/* Calculate the line rate from the pixel rate. */
> > -	link_freq = v4l2_get_link_freq(src_pad, csis_fmt->width,
> > +	link_freq = v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
> >  				       csis->bus.num_data_lanes * 2);
> >  	if (link_freq < 0) {
> >  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",

-- 
Regards,

Laurent Pinchart

