Return-Path: <linux-media+bounces-35517-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE8AE27FB
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 10:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31FE0175F52
	for <lists+linux-media@lfdr.de>; Sat, 21 Jun 2025 08:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90241DE3C0;
	Sat, 21 Jun 2025 08:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="e0VS+zhv"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A564146B8
	for <linux-media@vger.kernel.org>; Sat, 21 Jun 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750494185; cv=pass; b=tdUFEAD7nms61nPx8EVVhG54g7K/m4lgy7OczcdW2EFU46r9euJmWEU3oJcmf1j0AfY0i5NrP+5RGlK3lRppb0Ask4yu4IwS04OgitSyQXF4rt8cgiFkfBOO3AVBrzj3DbWK74qlPswbUKML7/UBLox982B4ng793a111TaSKDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750494185; c=relaxed/simple;
	bh=6CaKlMO+qpssXfN+dMRKWuK+S+AEKzQxxoxGX5FNsOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiXsHaQ578hpJBbU9r9h4pjFWFOl7gLQoTunsBLguysLA2fBB7zdqgVYUBxqhac9mY5uKzQJc9Zuk4hsJ3plo4FZACht8tidpqeCLQIOWvTOR0n287d8aLfg4knLA79kK/lxB0SHnlby+/KL+xU3176EO3PwDEeAdXF7eUz5uEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=e0VS+zhv; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-127c-61ff-fee2-b97e.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:127c:61ff:fee2:b97e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bPS5X6dLRz49Q3m;
	Sat, 21 Jun 2025 11:22:56 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1750494177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3PKKVyd6zxkL+u0305VNVkJpP873+pd6XkgyIehxeg=;
	b=e0VS+zhvtC7g0E+lw7XBSA6fp8D48nYHJy8lLNMy0WlBDU5JzZdCtb2hgPcZvDOSrALrVy
	xE35Bc2B9/BevYr0x79dLyWtN/CmLYOaai+pN2FwR/hv0iMdXw4AksbjLiNmZZJiOX0iU+
	TP7ZTQRvgV4Ey7xsroSlNB/LeAjD8f17Nuo2rmV6k0Rlu9pm72etOeyYh21qgHOqCC6WN9
	cKjeRIPfhTee5eYqC6IEVRNeWOcnvYr6zD67HrkCSxk+K8hDaHTLKTVqtWT0B3OtcHCqFg
	JHcbVMp+YUo1+mGPbY8MJCTOIVcfrmre6NuYuZ+6wkwbLyzISW/GyG4WWWqxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1750494177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l3PKKVyd6zxkL+u0305VNVkJpP873+pd6XkgyIehxeg=;
	b=cB13DWtWRt5dS1ekRMBpc4UM4cMed6IwR/ZSRQS3ciYTzDoNPI1AadndlORmc/OZkKRncA
	bcMQjr+UjW7dQQQ/OVlPUZ3jgTY/hcm3cd74gmVW+3Z/nWfAKCIAkjDM+AcIw7oATPZ6CN
	9qE+ZmOi+b/MNryqF6T61lX0Aol1ODmwnQas3XzCbPHFEMhmyvFCxyPDB15EcqTrrqpkC0
	ymbYnoylursoHLUBA38HxHcYq2xWNNrdnaWX9jBi4uKfenOcrIvKR7V0Q7AC8kQFsLquqk
	aRdcnN6V2KuFRk8dNn/kH4721183twEPf1+p+mPkAPAUewSN6Nk8l8by6ASWGw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1750494177; a=rsa-sha256;
	cv=none;
	b=fUG7aaJs1VNkpPF6wni6OnkF7ALQc7VRBlA6RfyuKDCqd7cL+Io9yW1FfZ1iYDKglGJPIM
	yI7Qju8+VzkOOaUvgA+37R+Mme73+uVsGIrU3SmUq8PtULdQgxHLpCuNVXRDYLaOYniFwx
	zSmmr54mhi8nIlxkdxRNdUC0e3nn/ddNxiK6lqw+rwbhNB7UwGFKO1FO4kU9rlE/gHRb6H
	7LEX4o9DTUVietwzEMLi6vYsJcrtvOa4goVzbGIY2rfxknSG15oUfe4jOkENXozC2WNXN9
	XkQibHbly+bNU5rIsQSjJdDKiMyN5F9Mv242XxXoF0w/2/Fz1JsgTv4IWOl2gA==
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 880B3634C93;
	Sat, 21 Jun 2025 11:22:56 +0300 (EEST)
Date: Sat, 21 Jun 2025 08:22:56 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, hans@jjverkuil.nl,
	laurent.pinchart@ideasonboard.com,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
	"Wang, Hongju" <hongju.wang@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 14/64] media: v4l2-mc: Ignore internal pads in
 finding source sub-devices
Message-ID: <aFZr4OtoirFUnfHu@valkosipuli.retiisi.eu>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-15-sakari.ailus@linux.intel.com>
 <5nyzj7i6w5sajnxjzh6b3ssoozuuwcw5ckyx6gnuazvlcymzeq@rqomj3versqi>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5nyzj7i6w5sajnxjzh6b3ssoozuuwcw5ckyx6gnuazvlcymzeq@rqomj3versqi>

Hi Jacopo,

Thank you for the review.

On Fri, Jun 20, 2025 at 01:16:28PM +0200, Jacopo Mondi wrote:
> Hi Sakari
> 
> On Thu, Jun 19, 2025 at 02:57:46PM +0300, Sakari Ailus wrote:
> > Routes to internal sink pads do not indicate a sub-device would have
> > further links to upstream sub-devices. Ignore them.
> 
> Isn't the route -originating- from an INTERNAL_PAD ? why has it to be
> ignored ?

The purpose here is to find a source sub-device where the streams
originate. If an enabled route has an internal sink pad, there's not going
to be a link from that pad that could be searched, is there?

But your question made me think of another possibility: a sub-device that
has an internal sink pad but also external sink pads. Can the routes to the
two be enabled simultaneously? This needs to be taken into account, first
probably documenting them in the limitations of v4l2_mc_pipeline_enabled().

> 
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-mc.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> > index e593d00f7d70..7247f9f30917 100644
> > --- a/drivers/media/v4l2-core/v4l2-mc.c
> > +++ b/drivers/media/v4l2-core/v4l2-mc.c
> > @@ -636,6 +636,10 @@ __v4l2_mc_pipeline_enabled(struct v4l2_subdev_state *state,
> >  		if (!(BIT_ULL(route->source_stream) & __src_streams))
> >  			continue;
> >
> > +		if (state->sd->entity.pads[route->sink_pad].flags &
> > +		    MEDIA_PAD_FL_INTERNAL)
> > +			continue;
> > +
> >  		if (!has_sink_pad) {
> >  			has_sink_pad = true;
> >  			sink_pad = route->sink_pad;

-- 
Kind regards,

Sakari Ailus

