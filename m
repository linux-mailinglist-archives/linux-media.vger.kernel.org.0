Return-Path: <linux-media+bounces-35483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB8AE19D4
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 13:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24DB35A48E6
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 11:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB5F280328;
	Fri, 20 Jun 2025 11:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oCGG95rt"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4EE221260
	for <linux-media@vger.kernel.org>; Fri, 20 Jun 2025 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418196; cv=none; b=drRs+2wwPwQ43io49CWAkybksQ2cXe5GkZ1xOV/PQBX3n9uU6ZLTbd92K42mkifyQaMeyvIX7/WkOqaDMAImNMIMhFKVlZIDEZtv8KDvpAJA7OiZhRtCQ3zi8jMtag/Hr5R3rhEyUlQIrxONCfAkMggY9jZMZvQmegMvrUWoE+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418196; c=relaxed/simple;
	bh=vvEZpQZeXLwbk0w2SZnCcEJWZ5AnwYeylJ+CkQGk2aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jG+p+mlU5bZovwsQvfVSILWhErYgQaM6D0kM8BpEGDE9lnN7WDZsIpdtMv2Um3M580G2ffZoWbjMF+KFXnDzv99SwY+1L9OHOy1eQZyM2R9QNvAYuzF0OpOagqFeKukiw2THiJoC92H2wMJ4QsawDOT6lRzf5cgIy/n9TsQHGYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oCGG95rt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2665C0B;
	Fri, 20 Jun 2025 13:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750418176;
	bh=vvEZpQZeXLwbk0w2SZnCcEJWZ5AnwYeylJ+CkQGk2aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCGG95rtUsqgRyu4i1X+DkUvkpRFrYX8fL3F/s7cjIUUFE1RM0lmitB8rjFueS8pS
	 be14lRFAhorGX/zJMwnoEmSx04xfsu2zITzZ/UnUFgoJ9z2/L+Oj5c7gCIWEJWvVXQ
	 Y2ImSic2REwtSzwUCbHoMBrbKCE6I2/OqMkzkWoM=
Date: Fri, 20 Jun 2025 13:16:28 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Alexander Shiyan <eagle.alexander923@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Julien Massot <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>, 
	"Yan, Dongcheng" <dongcheng.yan@intel.com>, "Cao, Bingbu" <bingbu.cao@intel.com>, 
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Ricardo Ribalda Delgado <ribalda@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v10 14/64] media: v4l2-mc: Ignore internal pads in
 finding source sub-devices
Message-ID: <5nyzj7i6w5sajnxjzh6b3ssoozuuwcw5ckyx6gnuazvlcymzeq@rqomj3versqi>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-15-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619115836.1946016-15-sakari.ailus@linux.intel.com>

Hi Sakari

On Thu, Jun 19, 2025 at 02:57:46PM +0300, Sakari Ailus wrote:
> Routes to internal sink pads do not indicate a sub-device would have
> further links to upstream sub-devices. Ignore them.

Isn't the route -originating- from an INTERNAL_PAD ? why has it to be
ignored ?

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index e593d00f7d70..7247f9f30917 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -636,6 +636,10 @@ __v4l2_mc_pipeline_enabled(struct v4l2_subdev_state *state,
>  		if (!(BIT_ULL(route->source_stream) & __src_streams))
>  			continue;
>
> +		if (state->sd->entity.pads[route->sink_pad].flags &
> +		    MEDIA_PAD_FL_INTERNAL)
> +			continue;
> +
>  		if (!has_sink_pad) {
>  			has_sink_pad = true;
>  			sink_pad = route->sink_pad;
> --
> 2.39.5
>
>

