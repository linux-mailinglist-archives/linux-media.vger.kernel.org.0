Return-Path: <linux-media+bounces-64139-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qix+JtduJmrTWQIAu9opvQ
	(envelope-from <linux-media+bounces-64139-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:27:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328165386D
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 09:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=UGjDq4ED;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64139-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64139-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18E163014134
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 07:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3460E38E135;
	Mon,  8 Jun 2026 07:26:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9112F28FF
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 07:26:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903613; cv=none; b=IVbCgPSSbj2e7acar0T4bjo7TZoh8tw/BxMmYvH/BNMzoIvptgUcjX2BaQeCSClSlXhnNj6Yhw2A7LOYQfavRHVL593F/DQn7D7BRBLuua2k9od8vhRy3e2TItYwVcNJI4KK9yJ38zoo04jWK3i5lZ1ixJYVGz0Wy0b9yijISZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903613; c=relaxed/simple;
	bh=naBz08lHg1Sg6+HMY3HcV7GZPAqxcAJ/y4CaIIHflfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNdpKGKQYabIjYL8ZuDEXhs7K2yVR4DG+YEqZr/gUZOFWDtnShbLJhzLNTaJU0MmlDj4M/XDaoqlFSWz3yNbESeY5MndjyRG9OyHqP0QoT5XILaBmDH4APOju7vS+xzC5gCLLUU9Yrv5TSqWHHqY0mubdqmAfam1t+szKHCWURk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UGjDq4ED; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0515A2EE;
	Mon,  8 Jun 2026 09:26:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780903581;
	bh=naBz08lHg1Sg6+HMY3HcV7GZPAqxcAJ/y4CaIIHflfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UGjDq4EDQG+NsVFYAoCpvIxE4NXy4FX5rkC0WpAJzCPfTzEYv32fosWneVuU2QPMv
	 1pPH2P1wberXQzGbtmPGJxvGrDK5HR05oV+zHnSmrELbZFUfJI6klAQQ+Yk8PgYmRA
	 GoLbTAyL8kkRi60Uw9sWgJ4gLODy+89qtDlJUWI4=
Date: Mon, 8 Jun 2026 10:26:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 02/10] media: imx219: Scale the vblank limits
 according to rate_factor
Message-ID: <20260608072646.GC370380@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607215356.842932-3-sakari.ailus@linux.intel.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64139-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:dave.stevenson@raspberrypi.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,killaraus.ideasonboard.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1328165386D

Hi Sakari,

Thank you for the patch.

On Mon, Jun 08, 2026 at 12:53:48AM +0300, Sakari Ailus wrote:
> The limits for vertical blanking (and frame length in pixels) is related
> to the properties of the hardware, it's not in half-line units the driver
> uses.

The driver only uses half-line units when binning in the analog domain.
The commit message would benefit from making this clearer.

> Multiply the vertical blanking limits by the rate_factor to satisty
> hardware requirements.
> 
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753cc93..d8fe7db18b6c 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -878,14 +878,17 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>  
>  	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		unsigned int rate_factor = imx219_get_rate_factor(state);
>  		int exposure_max;
>  		int exposure_def;
>  		int llp_min;
>  		int pixel_rate;
>  
>  		/* Update limits and set FPS to default */
> -		ret = __v4l2_ctrl_modify_range(imx219->vblank, IMX219_VBLANK_MIN,
> -					       IMX219_FLL_MAX - mode->height, 1,
> +		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> +					       IMX219_VBLANK_MIN * rate_factor,
> +					       (IMX219_FLL_MAX - mode->height) *
> +					       rate_factor, rate_factor,

Without judging whether or not dividing LLP by the rate factor in
imx219_set_ctrl() is correct or not, this patch brings the control
limits in line with how the control is applied, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  					       mode->fll_def - mode->height);
>  		if (ret)
>  			return ret;
> @@ -928,8 +931,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  			return ret;
>  
>  		/* Scale the pixel rate based on the mode specific factor */
> -		pixel_rate = imx219_get_pixel_rate(imx219) *
> -			     imx219_get_rate_factor(state);
> +		pixel_rate = imx219_get_pixel_rate(imx219) * rate_factor;
>  		ret = __v4l2_ctrl_modify_range(imx219->pixel_rate, pixel_rate,
>  					       pixel_rate, 1, pixel_rate);
>  		if (ret)

-- 
Regards,

Laurent Pinchart

