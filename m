Return-Path: <linux-media+bounces-58911-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBhmKnXx4GkZnwAAu9opvQ
	(envelope-from <linux-media+bounces-58911-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:25:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C1940F8BA
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 16:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA900302D095
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 14:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6643DEAE0;
	Thu, 16 Apr 2026 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GVSoh33F"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855433DDDBC
	for <linux-media@vger.kernel.org>; Thu, 16 Apr 2026 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776349550; cv=none; b=YG3od0xIDjbW05OLZu4nU7Sd1uJIAZ4aX0ukbLwvJ14xy78vASl3fUrxvtLURWJIbU7Z0YZzftXS495TLrTr1vHLXgMOszMBo2hCigYbyRxPkcZ4vU4ahOm9MseOCB9Z6X3tzAvL6eDQiaJzEVLozm+QVKKl4fp/2fd32+N+YuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776349550; c=relaxed/simple;
	bh=MFbYWpupff0Cl0q8J3x6j+D/CwLaZ2PuwSlFwK4umIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/EnVllT9PY6FuQsIusPxsEny9+gIP1/JdWFz4klsn5TDZx1GmAJy7irOrwkkpoAo7dM5ScdBFtuXrjdLJKUuJCB1T8zB5fEkRiAXbtoCDTtdvNEKK+nEYZt4MYgfCbp2Oi5CzFEkHtA9pXj+ybjRaBRAhOqokmSKPw4iUNqUPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GVSoh33F; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 813BE132;
	Thu, 16 Apr 2026 16:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776349450;
	bh=MFbYWpupff0Cl0q8J3x6j+D/CwLaZ2PuwSlFwK4umIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GVSoh33FEA+QRcUmUiV+erjR6kUP8gaI7yY+SMOaz3ska+Nt++ItAxqwyccR2dj+U
	 0/ACfZLZ8fnHs/qgiNtARz5fWMKtJ8F1aQ/Cpa7aplZQi3XigizJLNOg/PbbbWx93N
	 40/qExhXfa1XTElZ3544AG4RYYAYtvdRT4mH0T+4=
Date: Thu, 16 Apr 2026 17:25:43 +0300
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
	"Cao, Bingbu" <bingbu.cao@intel.com>,
	"Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
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
Subject: Re: [PATCH v4 07/29] media: imx219: Rename "binning" as "bin_hv" in
 imx219_set_pad_format
Message-ID: <20260416142543.GE1775831@killaraus.ideasonboard.com>
References: <20260408153939.969381-1-sakari.ailus@linux.intel.com>
 <20260408153939.969381-8-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408153939.969381-8-sakari.ailus@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58911-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,ideasonboard.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,intel.com:email,killaraus.ideasonboard.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 24C1940F8BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari,

Thank you for the patch.

On Wed, Apr 08, 2026 at 06:39:16PM +0300, Sakari Ailus wrote:
> Rename "binning" as "bin_hv" in anticipation of having a variable called
> "binning" for another purpose.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/imx219.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index ca6a5939773d..5a85d76af65a 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -825,7 +825,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	const struct imx219_mode *mode;
>  	struct v4l2_mbus_framefmt *format;
>  	struct v4l2_rect *crop;
> -	u8 bin_h, bin_v, binning;
> +	u8 bin_h, bin_v, bin_hv;
>  	int ret;
>  
>  	format = v4l2_subdev_state_get_format(state, 0);
> @@ -858,11 +858,11 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  	bin_v = min(IMX219_VISIBLE_HEIGHT / format->height, 2U);
>  
>  	/* Ensure bin_h and bin_v are same to avoid 1:2 or 2:1 stretching */
> -	binning = min(bin_h, bin_v);
> +	bin_hv = min(bin_h, bin_v);
>  
>  	crop = v4l2_subdev_state_get_crop(state, 0);
> -	crop->width = format->width * binning;
> -	crop->height = format->height * binning;
> +	crop->width = format->width * bin_hv;
> +	crop->height = format->height * bin_hv;
>  	crop->left = (IMX219_NATIVE_WIDTH - crop->width) / 2;
>  	crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>  
> @@ -872,15 +872,15 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>  
>  		/* Update limits and set FPS to default */
>  		ret = __v4l2_ctrl_modify_range(imx219->vblank,
> -					       (int)(mode->height / binning),
> +					       (int)(mode->height / bin_hv),
>  					       IMX219_FLL_MAX - mode->height, 1,
> -					       (int)(mode->fll_def / binning) -
> +					       (int)(mode->fll_def / bin_hv) -
>  					       (int)mode->height);
>  		if (ret)
>  			return ret;
>  
>  		ret = __v4l2_ctrl_s_ctrl(imx219->vblank,
> -					 (int)(mode->fll_def / binning) -
> +					 (int)(mode->fll_def / bin_hv) -
>  					 (int)mode->height);
>  		if (ret)
>  			return ret;

-- 
Regards,

Laurent Pinchart

