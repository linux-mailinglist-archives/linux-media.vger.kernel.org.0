Return-Path: <linux-media+bounces-9985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5B8B04CE
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 10:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75AE71C22B5D
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 08:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449B8158A10;
	Wed, 24 Apr 2024 08:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QD8aDzUM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1DB1581E0
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713948677; cv=none; b=hgH95U0hZIV+B9F7AAypwmWGQcer8gbeyg8OAcTHBINjji5FCDJauc9GNxvpwVaBn92zgbXzrvMyhOo+U6InpPTu0MGvpGg1itrCyqGixY0h1Dp7zosQBGmPYuw4yXpS4cNUmt5+4hwVzVZRzSoXtDWkA/znFo9ddigtRLs/iCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713948677; c=relaxed/simple;
	bh=O2kxDzqoGVv9IXYHKGrEiTEbnwLL55sD+1PkGXGjaC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1WHyK/UXr6nk1Ef6F6r3PLbrYh7GdVcux3PtsTea+RVIyf8VlOxQd17wtQqqH5bsTTw+mP2oJkzfd0EcLEVUOa7t5+oLr+fsditTAhqGMLCsCl57z8SrXGLnAzRHFHi7bxQHcD6B+K276br7/M7x+v8g5kWUkQLQelP5wr8AsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QD8aDzUM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8341166B;
	Wed, 24 Apr 2024 10:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713948616;
	bh=O2kxDzqoGVv9IXYHKGrEiTEbnwLL55sD+1PkGXGjaC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QD8aDzUMjNXvoZdCa99CcmqdlvWYfJS4unqOWFjy47FHNlR+XqWnIH+8KaPOBac7w
	 866Ioj7XCN0Aue+RUGrxqSgxF9kDRLpuCLHl9lYnX1vmf1quKzyXv1LdJ1csh9EWFg
	 sFeGyPy+fm+L43SxtGbl9GK+Kj26Q+0Px6UlhQEQ=
Date: Wed, 24 Apr 2024 11:51:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v9 42/46] media: ov2740: Add generic sensor fwnode
 properties as controls
Message-ID: <20240424085101.GC12554@pendragon.ideasonboard.com>
References: <20240416193319.778192-1-sakari.ailus@linux.intel.com>
 <20240416193319.778192-43-sakari.ailus@linux.intel.com>
 <20240420094016.GZ6414@pendragon.ideasonboard.com>
 <ZiffE7gofI5Bncsd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZiffE7gofI5Bncsd@kekkonen.localdomain>

On Tue, Apr 23, 2024 at 04:17:23PM +0000, Sakari Ailus wrote:
> On Sat, Apr 20, 2024 at 12:40:16PM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 16, 2024 at 10:33:15PM +0300, Sakari Ailus wrote:
> > > Add generic sensor property information as controĺs by using
> > > v4l2_fwnode_device_parse() and v4l2_ctrl_new_fwnode_properties().
> > > 
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > ---
> > >  drivers/media/i2c/ov2740.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> > > index dc0931308053..e37d824291fe 100644
> > > --- a/drivers/media/i2c/ov2740.c
> > > +++ b/drivers/media/i2c/ov2740.c
> > > @@ -779,6 +779,8 @@ static const struct v4l2_ctrl_ops ov2740_ctrl_ops = {
> > >  
> > >  static int ov2740_init_controls(struct ov2740 *ov2740)
> > >  {
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov2740->sd);
> > > +	struct v4l2_fwnode_device_properties props;
> > >  	struct v4l2_ctrl_handler *ctrl_hdlr;
> > >  	s64 exposure_max, h_blank, pixel_rate;
> > >  	u32 vblank_min, vblank_max, vblank_default;
> > > @@ -789,6 +791,10 @@ static int ov2740_init_controls(struct ov2740 *ov2740)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > +	if (!v4l2_fwnode_device_parse(&client->dev, &props))
> > 
> > If you moved the parsing earlier, you could set the right number of
> > controls when initializing the handler. This being said, maybe we should
> > instead try to get rid of the controls count hint to the handler
> > initialization function.
> 
> I'm not quite sure how that's related.

The move is related because you need to know if
v4l2_fwnode_device_parse() succeeded to know how many controls
v4l2_ctrl_new_fwnode_properties() will add.

> But I'll update the number.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> > > +		v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov2740_ctrl_ops,
> > > +						&props);
> > > +
> > >  	ov2740->link_freq =
> > >  		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov2740_ctrl_ops,
> > >  				       V4L2_CID_LINK_FREQ,

-- 
Regards,

Laurent Pinchart

