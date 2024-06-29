Return-Path: <linux-media+bounces-14382-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7593A91CC67
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 13:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C747BB21513
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 11:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3199E4D8B6;
	Sat, 29 Jun 2024 11:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="cARyEhYw"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91AD1CF8D
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 11:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719660858; cv=pass; b=cmQImj5wk3lDeukjwav1fwBFE8S/N/KGrpIn6PBkiQBnMV+QA3B6Ui7FV0x9Wd2QD5sELuOYtwwbKSgOZ7WZLc1MHKQziC2sLygqjPK8ic1miEaN/BWuaGFAE5h9bmkrhD57d2Bhckbk4HDB6XNxm5rp1P/9Tw+J2/Vu6YL19ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719660858; c=relaxed/simple;
	bh=7aDlHYzwj0u8PYcPWJjVfUGYSZVDmkkhvPNhg3khAs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gf0V6vy3GbLL9C60VdBxKf6wq2XrXrid9jWdByQ/Yq0aK2q79/AWVhmgCkhiqo+r8INWSh+tsuIvFq2Aii9AEMeI7i5WS2LikKl1rnUTKLJcqP+IuX+MRr+7FzxuG+RnKI30GXOedpe8LnMkyfWcxiMBi55QIfzgrXmu2FDk1rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=cARyEhYw; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WB9F038d7z49Q35
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 14:34:12 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719660852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQ7Ynapc3gGPPd3L4dd0T6F0pI3En7QcWdR11Us7jXU=;
	b=cARyEhYw7uWRpMv2+Cvv6nk4jpVH3poiyl2tj4JqZDT+VLUGL9gzPKtdbayrnRbwqeqD1D
	XQNYRc6AbFhUf52GEWehJxXUnhioKNPxo2qo3QJJ3XAd9q+rW1d5OmLhsbQiwYdseZmj31
	M05nwW1Wt9fgE3vudKBk8pMm2VcK8X8YXDWr5tQPS2kgAnbUYbaBmLI9ThIVlr9mwyxu3O
	U7hud8zkMLa/X/g1/D33P0GlZ2sl2jcvKG3wzO9mGXF/FnLU88jGGCbG39wa64PRfB5yqL
	qum8UIC5CgkepxYV3aUBH+girLSznd2FJB3heXK9WhC3gFEe8D+j7NpD5e6t6A==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719660852; a=rsa-sha256;
	cv=none;
	b=f7nHDHWTZs3WQ2glsXea2Wb1VerK8TEHOHzSwZNq0hGAmFQWu6Irwgui2doQP/TuYmc1Al
	X2UZMJPeZVExmWbZOexzXnTug1m0jke+2Dj7Q6duCDE8H9FUxTGU2kbY/f43ojJur/4VoK
	F2vRKYXlkZgYscu2cLtijyNqJNk+Kgco8hXOVP6iLzJkirIoVsFtJB2khRPJT3uLdz+HZk
	/MekyAoSpDBbSN3qcQFMQPXerVrcyaQ2h3Uhzjb3L08oN+gyD8bafg51SJRQvlpDvrA+p2
	V0Olp2HdLli3h7MiGsIAGLRuFt6ub2yWCJPSH5fjyFF/cUo7qAqLrkyWcrWWmg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719660852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TQ7Ynapc3gGPPd3L4dd0T6F0pI3En7QcWdR11Us7jXU=;
	b=tJ+Vw4H12vzKUqAb4t5poNW3wMyoL6YDL4CuK2Ulm7nNbSzD7EIGF3vh2qcfOsIwgnrNjZ
	2LN1Ob8PO2pZJnlbaJxtpRqNEe+zBcHSmUywkgueW9pCl6qc5RgsxgTqzDwIx4ocCsT5kg
	OeiVQ/Irm8Y0xbGiWeBDe581MGCaHpuwoXrjhx5J3EdY3WuBfcFkI6fcyASc4iIICqu7uf
	UaSV9Fpsmu6WoeHucJtzFSK39MtU5jZcpEcWjsTD9jonWJ2vTAO7OJwxNZLImO2m//QymL
	KnPeXh5P4mSTHF4j55F1QNGxID7NEKTt61bsrFYH61E5HeF5uS1vPnUVciI/AQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C517F634C93;
	Sat, 29 Jun 2024 14:34:11 +0300 (EEST)
Date: Sat, 29 Jun 2024 11:34:11 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ccs: Fix link frequency control range update
Message-ID: <Zn_xM9CnR_iRklz3@valkosipuli.retiisi.eu>
References: <20240628212603.5870-1-laurent.pinchart@ideasonboard.com>
 <Zn_MKWM-5vIKXnyR@valkosipuli.retiisi.eu>
 <20240629105222.GX30900@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240629105222.GX30900@pendragon.ideasonboard.com>

Hi Laurent,

On Sat, Jun 29, 2024 at 01:52:22PM +0300, Laurent Pinchart wrote:
> On Sat, Jun 29, 2024 at 08:56:09AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> > 
> > Thanks for the patch.
> > 
> > On Sat, Jun 29, 2024 at 12:26:03AM +0300, Laurent Pinchart wrote:
> > > When updating the link frequency control range in response to a format
> > > change, the minimum value passed to the __v4l2_ctrl_modify_range()
> > > function is hardcoded to 0, while there's no guarantee that the first
> > > link frequency in the menu is valid for the selected format. Fix it by
> > > getting using the index of the first bit set in the valid link
> > > frequencies mask.
> > 
> > Is this a problem? The bitmask does tell which ones are valid, doesn't it?
> 
> I noticed that the new range wasn't applied in my sensor driver when the
> minimum was set to 0 and the mask didn't include that bit. However,
> that's because I had the default value wrong, which caused
> __v4l2_ctrl_modify_range() to error out. I thought the same applied to
> the minimum, but that doesn't seem to be the case. Isn't it still
> clearer to set the correct minimum, given that it is already computed
> anyway, to be used as a default value ?

I guess from user space point of view this could be helpful, yes. I'm fine
with changing this.

> 
> > The minimum value will also be zero after control initialisation before
> > this function gets called. This should be also taken into account.
> > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > > I noticed this issue in the CCS driver while working on a different
> > > sensor driver. I haven't tested this patch.
> > > ---
> > >  drivers/media/i2c/ccs/ccs-core.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> > > index e1ae0f9fad43..5257dc4912ae 100644
> > > --- a/drivers/media/i2c/ccs/ccs-core.c
> > > +++ b/drivers/media/i2c/ccs/ccs-core.c
> > > @@ -2143,6 +2143,7 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
> > >  		*old_csi_format = sensor->csi_format;
> > >  	unsigned long *valid_link_freqs;
> > >  	u32 code = fmt->format.code;
> > > +	unsigned int min, max;
> > >  	unsigned int i;
> > >  	int rval;
> > >  
> > > @@ -2179,10 +2180,13 @@ static int ccs_set_format_source(struct v4l2_subdev *subdev,
> > >  		&sensor->valid_link_freqs[sensor->csi_format->compressed
> > >  					  - sensor->compressed_min_bpp];
> > >  
> > > -	__v4l2_ctrl_modify_range(
> > > -		sensor->link_freq, 0,
> > > -		__fls(*valid_link_freqs), ~*valid_link_freqs,
> > > -		__ffs(*valid_link_freqs));
> > > +	min = __ffs(*valid_link_freqs);
> > > +	man = __fls(*valid_link_freqs);
> > > +
> > > +	ret = __v4l2_ctrl_modify_range(sensor->link_freq, min, max,
> > > +				       ~*valid_link_freqs, min);
> > 
> > As this doesn't effect any actual change the applying of which could fail,
> > you'd have to have an issue with the argument values themselves. I wouldn't
> > add a check here. Although if you do, the sensor configuration should be
> > returned to the state before the call which would probably be worth a new
> > patch.
> 
> The lack of a similar check caused my driver to silently keep the
> current range, and it took me a while to debug that. I however agree
> that, if the arguments are right, the check isn't needed. Maybe it can
> be dropped, as the arguments are correct.

Alternatively there should be a dev_warn(), too, that this is a driver bug.

> 
> > > +	if (ret)
> > > +		return ret;
> > >  
> > >  	return ccs_pll_update(sensor);
> > >  }
> > > 
> > > base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326
> 

-- 
Kind regards,

Sakari Ailus

