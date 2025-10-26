Return-Path: <linux-media+bounces-45583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4076DC0B3F3
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 22:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D619E4E7233
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 21:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E665283FE3;
	Sun, 26 Oct 2025 21:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lVMYW7vs"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133BB72633;
	Sun, 26 Oct 2025 21:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761513089; cv=none; b=ZbzuLD4sQ+UGvWNcS+/KjVTR6ps+TKzgI6O3+oh8oo8OpvC50byku/D+8ITSF/hEoGraQpodJRQxUvG3tvIdOQ7yJuFWZXGpqwhBUoQ2mVJORuBY7zs4YLK8WhbKcCufl72SQMAUtf14tOt9zrOOmZtO6Cphi8f89LFJxzIWp3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761513089; c=relaxed/simple;
	bh=ObOOH9WDscvwAqkjW2Oryk+fDasfzz/CdPqG1NC+8vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sr49LjboAkKZfo0hvg5BrwZtiqJ1qNd155eUiSdqBO8J+bESMvyYMq0U+BRbRCn5yCkWXtR1sZn/8eHs7twmWsv9ZSTpdLEgDQ+S6D7dWlYhBUm/PAglgu07qLPck93EFcy3/M1cilUJtWycaSlRX+mp3LXWE0V/gOsWkZ/WHEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lVMYW7vs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CAC8F21B1;
	Sun, 26 Oct 2025 22:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761512975;
	bh=ObOOH9WDscvwAqkjW2Oryk+fDasfzz/CdPqG1NC+8vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVMYW7vswqx2wA3X+nZlRRw/8m2pGFWq22EnlY7+9HV9FFhGjUxF8DtUc70y1Djyn
	 xE5Y1qiRWUglDb4wfE4pVM5+P5cgPqrA4Gh4LlOOLEJFdbOXQAJfkM9iRENIUQ8/yu
	 zPBeAvHwSrBBFc+FAF9WCJKSyf5OyDPrFwJ/W32I=
Date: Sun, 26 Oct 2025 23:11:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org,
	rmfrfs@gmail.com, martink@posteo.de, kernel@puri.sm,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank.Li@nxp.com
Subject: Re: [PATCH v5 4/4] media: imx-mipi-csis: Support active data lanes
 differing from maximum
Message-ID: <20251026211107.GF1025@pendragon.ideasonboard.com>
References: <20251022102228.275627-1-isaac.scott@ideasonboard.com>
 <20251022102228.275627-5-isaac.scott@ideasonboard.com>
 <aPi8RXHVBMB7vHQ2@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aPi8RXHVBMB7vHQ2@kekkonen.localdomain>

On Wed, Oct 22, 2025 at 02:13:09PM +0300, Sakari Ailus wrote:
> On Wed, Oct 22, 2025 at 11:22:28AM +0100, Isaac Scott wrote:
> > Call on v4l2_get_active_data_lanes() to check if the driver reports that
> > the number of lanes actively used by the MIPI CSI transmitter differs to
> > the maximum defined in device tree.
> > 
> > If the number of active data lanes reported by the driver is invalid, or
> > the operation is not supported, fall back to the number of allowed data
> > lanes.
> > 
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index 838a1ad123b5..637ef6e614fa 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -1034,6 +1034,10 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
> >  	format = v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> >  	csis_fmt = find_csis_format(format->code);
> >  
> > +	ret = v4l2_get_active_data_lanes(csis->source.pad,
> > +					 csis->bus.num_data_lanes);
> > +	csis->num_data_lanes = ret < 0 ? csis->bus.num_data_lanes : ret;
> 
> I guess this works but should we return an error here instead?
> 
> Alternatively, the function could always return some number of lanes as
> well (with a printed warning on error). I think I'd do the former though.

Agreed, I would return an error.

> > +
> >  	ret = mipi_csis_calculate_params(csis, csis_fmt);
> >  	if (ret < 0)
> >  		goto err_unlock;

-- 
Regards,

Laurent Pinchart

