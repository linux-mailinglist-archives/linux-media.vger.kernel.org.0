Return-Path: <linux-media+bounces-11802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB28CD0C8
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 13:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A41E01F21696
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658F2140394;
	Thu, 23 May 2024 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="i7RKgAnh"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753B13D53F
	for <linux-media@vger.kernel.org>; Thu, 23 May 2024 10:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716461993; cv=pass; b=Ns4oWENvzq5ArcLgeHYKhFL3+oHYyhXxzZCpvUZNh31jOJR624ezfkdFWm1AKKvijRG+SuMgQsAG13nPw5vyc0UYXRee0wRYLNiJ2Ml965r96m8PV4PNc+Mu67T8Y/XvHsRRMllK1YefN5P3acogCmdPIAEHVLI6mYUYh2GmZbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716461993; c=relaxed/simple;
	bh=hbTmTwHFEUPtSNuNQxEFHDyVQR8D3LbYKtalIZNzYCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHqj697c3pXVBMbHCFojYCbz+g1S3nWigtfX/EnZ9oePjfmqh98l1KyuPOjJxfqPAIhQmHu4a9nxJ56G8CTNkkW5vilJ5LIs4XstymJfvE8KZF25f3+msurZiBxJQjk5rg1oZFXMSejo1zPjqgfWWAyz1Woxd4fdOyEzk7jKdcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=i7RKgAnh; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4VlQDN5fKjz49Pyk;
	Thu, 23 May 2024 13:59:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1716461989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5/L+bfg/LN6WonEAOyAH4T4sH3r/5ecz3g06cIpYZc=;
	b=i7RKgAnhldfX8t5+YttzFIYnTCOMOMsVurIXRmmVJ/Jzpuak0tvzUptrAUXSACWV638d79
	jAbZre1OMX/RHozA3vwj6irDvTvpHL7mBUxTowHIKxf+R/AzlkQCx31ii0dTRuY75AJ0RA
	BbnVmf4kLgCSZQk80nOqr5WWFJ3F3BqCNQ+QEtZeG7CHjF0jesj7SbHTGfFD26jmp/899N
	vuNz0YahpxNOIt2KdI8c2OlsZB+mLZJSHA+WD4zL49r/z3z7Iy7wxHcAQ8Lmds+OmPqW55
	lgBnsjQ82H6MySOFDuGxRop80VtL6MZoJC7doi/6n7a/GgpaX5mBnWzXkXjjHQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1716461989; a=rsa-sha256;
	cv=none;
	b=X3Q50RlaANkucTgi8FLoTgcuYbJi24udK7RBlDTgM0zAWwmkPXUJ9DMV5N0FHpkV4Dv0kH
	o1RCp2RG4z/a4P/oIXHgZLQnl3k+bQZBKcddXFEbiyj25Ps3hGL48flwH7aSX+x7OM8Vj2
	bpqSnwGkMGyBGu8iureM5ufRdRTE/3AQWFqgbSLSVBoiUsrdpnLdgiLXs4dOr9blUDdo9U
	8bq/Pr0oanFdOGEAawgEtuLGmLR32lvyQL7dOcNJhvh2mwlphacpcGvCTH6uNhLsuaSyFp
	rL8AXOoRZma7DEaFS9UOJYwzknBOMjdxCYkbODEjoDNTjT/dUJNK2e9Zgruetg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1716461989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5/L+bfg/LN6WonEAOyAH4T4sH3r/5ecz3g06cIpYZc=;
	b=JqofncM3aDKl8MjCof+jSwfExKDJiXieyyA6QuVjN4I2nbcdwnfscQrK4HoK//LyB7tclg
	eTv+smpb+3ab57hIzDqc6hmpLI0XpzrlC0nZWfRo+IPgbtcH30PKJk+NlK+82xxNLjLs5g
	vXpz/nTghtcy8NXu2j0V14rfESfW60bEOgc3k7wJoBsrzX2S6d5tFpoUPRLnxKteD5cgkd
	T0cRqkTLKZs/3t9y+r3oSKRM+DEFbq5nIPaxNw9vYpxska5IKm5qCVhbi7sEVGIiPp1hVc
	zJSI/3RTCEKOwTUgYJdH9owoXTk23eSJGFgriwis65dOlwANohBKPOpoSuf+PQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id E6931634C94;
	Thu, 23 May 2024 13:57:09 +0300 (EEST)
Date: Thu, 23 May 2024 10:57:09 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v6 1/7] media: uapi: pixfmt-luma: Document MIPI CSI-2
 packing
Message-ID: <Zk8hBTLghjVAOaG-@valkosipuli.retiisi.eu>
References: <20240502110503.38412-1-jacopo.mondi@ideasonboard.com>
 <20240502110503.38412-2-jacopo.mondi@ideasonboard.com>
 <Zk8eo4OZs8gu_k2Q@valkosipuli.retiisi.eu>
 <20240523105722.GG6640@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523105722.GG6640@pendragon.ideasonboard.com>

On Thu, May 23, 2024 at 01:57:22PM +0300, Laurent Pinchart wrote:
> On Thu, May 23, 2024 at 10:46:59AM +0000, Sakari Ailus wrote:
> > Hi Jacopo,
> > 
> > On Thu, May 02, 2024 at 01:04:56PM +0200, Jacopo Mondi wrote:
> > > The Y10P, Y12P and Y14P format variants are packed according to
> > > the RAW10, RAW12 and RAW14 formats as defined by the MIPI CSI-2
> > > specification. Document it.
> > > 
> > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Reviewed-by: Naushir Patuck <naush@raspberrypi.com>
> > > ---
> > >  Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > index b3c5779521d8..f02e6cf3516a 100644
> > > --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> > > @@ -209,3 +209,7 @@ are often referred to as greyscale formats.
> > >      For Y012 and Y12 formats, Y012 places its data in the 12 high bits, with
> > >      padding zeros in the 4 low bits, in contrast to the Y12 format, which has
> > >      its padding located in the most significant bits of the 16 bit word.
> > > +
> > > +    The 'P' variations of the Y10, Y12 and Y14 formats are packed according to
> > > +    the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI CSI-2
> > > +    specification.
> > 
> > The CSI-2 specification isn't publicly available. I think you'll need to
> > add similar examples of the packing the packed raw formats have.
> 
> Would referencing the CSI-2-packed bayer formats be acceptable ?
> Otherwise we'll essentially duplicate documentation.

I'm fine with that but the packing should be then documented independently
of formats. I'd prefer referring to component numbers (1 to 4) so this
could be re-used with Bayer formats.

The documentation from the Bayer formats should be usable for this almost
as-is.

-- 
Sakari Ailus

