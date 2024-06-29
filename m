Return-Path: <linux-media+bounces-14387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C6291CC9B
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 13:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1412B1F22279
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 11:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D6E78C7D;
	Sat, 29 Jun 2024 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="WlWCTdxt"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D214820B35
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719662322; cv=pass; b=rEW95V+K9iufbBEWRdMLnOD6YuPHFgjFuV4mPqYv+rfwD910DDa2wC/GfW1I57XXUzLtD4FtygCMLYaLI/axPcx5OogvqTuq7qoTQZYjo5oKrGrAH3kKTnihdO/0ft99eGAyY1XacNFgMONqQE7iAqfdjlnyy83kjclEDceVGos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719662322; c=relaxed/simple;
	bh=hY/pOkj+Cen/+NR0k7CBSxrT/6Ep22iIHl7u9MsIxzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5VDGa3+KxESP80tp92fmm7bhWIIeuO7PXGBsA2fPafQmK3KDkL5lB1JVlvap1EcIRJzQ/knuKN691ldnJswmMWSrCrIu8/XN/z3+qT6T7JkdGorQpGATNA3MOWd/qvdIyZ2LYQhp6hJ/7lZbsAVKVjzfeRy4ye9UaIXJAp40Jk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=WlWCTdxt; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4WB9n83WqszykW;
	Sat, 29 Jun 2024 14:58:36 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1719662317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4QUjijjax0IJphvykRTvJ8GxtfWTSmUV3/+xJ2rBuZY=;
	b=WlWCTdxthoEKBSaf2zY7PWH3HjXpWBvPRnaATKB3N8pD7T+pnwfoAiPZaDWlXhnEu/D5QN
	hEetz/joZ2SNZ4l0yyZcOtGDahd19c7lIptnj6cJIkZrfc/nxpNSlfe8581RTy1zV3xsd3
	stpe8ZXv5N90QyxT5i/bi3Ap4WeP33Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1719662317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4QUjijjax0IJphvykRTvJ8GxtfWTSmUV3/+xJ2rBuZY=;
	b=j6KoqI3eGVT77KnaZrcfSZYlz5NbI7pg9V1ud1k+X0+H7Z7TO3h0EnDx9jlyGI01bywNX6
	WvO2RvAAusPdfNKDhFlUit1JAzmVI9K2yDV2z/QjXOgLNuM4RxodeFpvBGIsFzkZsVHoWK
	IyolmiiQ62Ql1JxXKcs1h0LrA2z6KZI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1719662317; a=rsa-sha256; cv=none;
	b=ZL03lqIBf2Hp1b/1JoxFFvA9WVXFb8edbhPgAHPtPULRvpS5VppgOaf1fSPQHPn/kMNXzU
	Mop+iumtnKHBn3nx8NEZYeDXXKiDmyAutfJG7EqbZwx5aJqpsb1UwcnrUs90Vvky7Me9Yy
	KMnXq7y6M4cewLKk73y3KK6y1ckvQ/I=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 24DD4634C93;
	Sat, 29 Jun 2024 14:58:36 +0300 (EEST)
Date: Sat, 29 Jun 2024 11:58:35 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH] media: i2c: ccs: Fix link frequency control range update
Message-ID: <Zn_26ybRP2dyvlwv@valkosipuli.retiisi.eu>
References: <20240628212603.5870-1-laurent.pinchart@ideasonboard.com>
 <Zn_MKWM-5vIKXnyR@valkosipuli.retiisi.eu>
 <20240629105222.GX30900@pendragon.ideasonboard.com>
 <Zn_xM9CnR_iRklz3@valkosipuli.retiisi.eu>
 <20240629115204.GA30900@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240629115204.GA30900@pendragon.ideasonboard.com>

On Sat, Jun 29, 2024 at 02:52:04PM +0300, Laurent Pinchart wrote:
> On Sat, Jun 29, 2024 at 11:34:11AM +0000, Sakari Ailus wrote:
> > On Sat, Jun 29, 2024 at 01:52:22PM +0300, Laurent Pinchart wrote:
> > > On Sat, Jun 29, 2024 at 08:56:09AM +0000, Sakari Ailus wrote:
> > > > Hi Laurent,
> > > > 
> > > > Thanks for the patch.
> > > > 
> > > > On Sat, Jun 29, 2024 at 12:26:03AM +0300, Laurent Pinchart wrote:
> > > > > When updating the link frequency control range in response to a format
> > > > > change, the minimum value passed to the __v4l2_ctrl_modify_range()
> > > > > function is hardcoded to 0, while there's no guarantee that the first
> > > > > link frequency in the menu is valid for the selected format. Fix it by
> > > > > getting using the index of the first bit set in the valid link
> > > > > frequencies mask.
> > > > 
> > > > Is this a problem? The bitmask does tell which ones are valid, doesn't it?
> > > 
> > > I noticed that the new range wasn't applied in my sensor driver when the
> > > minimum was set to 0 and the mask didn't include that bit. However,
> > > that's because I had the default value wrong, which caused
> > > __v4l2_ctrl_modify_range() to error out. I thought the same applied to
> > > the minimum, but that doesn't seem to be the case. Isn't it still
> > > clearer to set the correct minimum, given that it is already computed
> > > anyway, to be used as a default value ?
> > 
> > I guess from user space point of view this could be helpful, yes. I'm fine
> > with changing this.
> 
> Another option would be for the control framework to adjust the minimum
> and maximum based on the mask.

I wonder what Hans (now cc'd) thinks. I think it's actually a good idea,
given that the minimum and maximum could change dynamically anyway.

> 
> > > > The minimum value will also be zero after control initialisation before
> > > > this function gets called. This should be also taken into account.
> > > > 
> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > > ---
> > > > > I noticed this issue in the CCS driver while working on a different
> > > > > sensor driver. I haven't tested this patch.
> > > > > ---
> > > > >  drivers/media/i2c/ccs/ccs-core.c | 12 ++++++++----
> > > > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > > > > index e1ae0f9fad43..5257dc4912ae 100644
> > > > > --- a/drivers/media/i2c/ccs/ccs-core.c
> > > > > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > > > > @@ -2143,6 +2143,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
> > > > >  		*old_csi_format = sensor->csi_format;
> > > > >  	unsigned long *valid_link_freqs;
> > > > >  	u32 code = fmt->format.code;
> > > > > +	unsigned int min, max;
> > > > >  	unsigned int i;
> > > > >  	int rval;
> > > > >  
> > > > > @@ -2179,10 +2180,13 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
> > > > >  		&sensor->valid_link_freqs[sensor->csi_format->compressed
> > > > >  					  - sensor->compressed_min_bpp];
> > > > >  
> > > > > -	__v4l2_ctrl_modify_range(
> > > > > -		sensor->link_freq, 0,
> > > > > -		__fls(*valid_link_freqs), ~*valid_link_freqs,
> > > > > -		__ffs(*valid_link_freqs));
> > > > > +	min = __ffs(*valid_link_freqs);
> > > > > +	man = __fls(*valid_link_freqs);
> > > > > +
> > > > > +	ret = __v4l2_ctrl_modify_range(sensor->link_freq, min, max,
> > > > > +				       ~*valid_link_freqs, min);
> > > > 
> > > > As this doesn't effect any actual change the applying of which could fail,
> > > > you'd have to have an issue with the argument values themselves. I wouldn't
> > > > add a check here. Although if you do, the sensor configuration should be
> > > > returned to the state before the call which would probably be worth a new
> > > > patch.
> > > 
> > > The lack of a similar check caused my driver to silently keep the
> > > current range, and it took me a while to debug that. I however agree
> > > that, if the arguments are right, the check isn't needed. Maybe it can
> > > be dropped, as the arguments are correct.
> > 
> > Alternatively there should be a dev_warn(), too, that this is a driver bug.
> 
> Do you think we should add the warning to the __v4l2_ctrl_modify_range()
> function, or are there use cases where it could fail during normal
> operation ?

If modifying the range results in changing the control value, then this
results in (on I²C devices) an I²C write that can fail.

The CCS driver writes the configuration to the sensor when streaming starts
so there's no actual write operation resulting from this.

> 
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > >  
> > > > >  	return ccs_pll_update(sensor);
> > > > >  }
> > > > > 
> > > > > base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326
> 

-- 
Sakari Ailus

