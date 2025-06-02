Return-Path: <linux-media+bounces-33882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D92D9ACABA8
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:43:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA2B07A39B6
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D721E3793;
	Mon,  2 Jun 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B/Uo1/zM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D681A285;
	Mon,  2 Jun 2025 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857412; cv=none; b=utWOqku1fc/nSmpG77W1jb0huZPffGS2STELOO82PCTkkGOZfAgsuxB6MTCe39z5UAXAF+cS3OWt76r6C0oBI5Ada4hfwdjA4HXa5HKABgmZ9uyBCB5c4jdx7REDXcZ+4H9wKByBhAmTPWMhyvtw2DRxgqEWCzLwkb69RA/F4FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857412; c=relaxed/simple;
	bh=211WdzpmIskyHdh/+Y9nsfPwlU8FMWvUuUbOZ0uXRfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GESxrU8VNLBhsnnCqbltNBFQj/8XKubzJPyNnQ0Fngk8KuT83Ia/iq9rqbJMLVagecOy/FrwKuUZZQehFblN6k58yjyTGmFMEVCNstmg3/RvbkqHTGcom8UKWLHrGyifxqpapqUPY15xyvL4lf7ARRQtaLA731T0ICNUMj6BysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B/Uo1/zM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 724B0379;
	Mon,  2 Jun 2025 11:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857408;
	bh=211WdzpmIskyHdh/+Y9nsfPwlU8FMWvUuUbOZ0uXRfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/Uo1/zMoELIxGOU+O235CoyXDmHR8BVwBcg/Pw/V+cJvASsfDBmMV7XpzC0w2z6s
	 un0h+Qrc7lwZx62OKxpMY0/wLr70yNUDQVP0Nles3LJj55aJH5BIU94uVJZqVBU0wi
	 fUT2A5OIl/QU2tZFFQKZKzDpoHFdMDjU7KkNwUpE=
Date: Mon, 2 Jun 2025 12:43:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v3 01/15] media: rcar-csi2: Use the pad version of
 v4l2_get_link_freq()
Message-ID: <20250602094321.GD3645@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-1-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-1-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:30PM +0300, Tomi Valkeinen wrote:
> Use the new version of v4l2_get_link_freq() which supports media_pad as
> a parameter.

The commit message should explain why. With that fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 9979de4f6ef1..ddbdde23c122 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -954,6 +954,7 @@ static int rcsi2_set_phypll(struct rcar_csi2 *priv, unsigned int mbps)
>  static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  			   unsigned int lanes)
>  {
> +	struct media_pad *remote_pad;
>  	struct v4l2_subdev *source;
>  	s64 freq;
>  	u64 mbps;
> @@ -962,8 +963,9 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp,
>  		return -ENODEV;
>  
>  	source = priv->remote;
> +	remote_pad = &source->entity.pads[priv->remote_pad];
>  
> -	freq = v4l2_get_link_freq(source->ctrl_handler, bpp, 2 * lanes);
> +	freq = v4l2_get_link_freq(remote_pad, bpp, 2 * lanes);
>  	if (freq < 0) {
>  		int ret = (int)freq;
>  

-- 
Regards,

Laurent Pinchart

