Return-Path: <linux-media+bounces-33883-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D6ACABAE
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3EB97A61A1
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160CE1E9B39;
	Mon,  2 Jun 2025 09:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KCdi6FCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E564F1E9B12;
	Mon,  2 Jun 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857418; cv=none; b=lMmL+AHMWjtwoBXXqdgTl134QQ33lPI1MU32DvbJVlTjqRn9UDWKDiaRD5rh7grhPcTR+F9A6jr6CSHthpcqSOPfuA6tng++xIhX/2cT2Jm+FQ/bANllWKrMqvQS46FE+K8tjx/VUeGlT8bLGRLJHls4VItxYs41MEMs8AoM63Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857418; c=relaxed/simple;
	bh=ciAQ/QFAB/Dy3peI/CH8gS0dki5tqvqjyR0dbpJIDNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IktRW5wu6lSPZjgDzftMF3AAOV1xAHZdbLF+MVWEfCnxRe+4Usvbi4fzWNpjvibVPPIU0iZNrRaIwdPgB31smlBOzxp92Pc5iZ8rZLDMda+ELQnA7sG+nn+gdzZ4KIWUK74NGf7BJ2t2rXohpXvLXnAQp0ClSdDmzu6fnL9iQ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KCdi6FCQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F91516CB;
	Mon,  2 Jun 2025 11:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857414;
	bh=ciAQ/QFAB/Dy3peI/CH8gS0dki5tqvqjyR0dbpJIDNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCdi6FCQIF1gm9ShkLo16s/N2hzWKodK4MUuWsQkXCBI+RCm5iH5l3eyJuGSIGg9G
	 D5uCa2EWQmOsanBwNLGScTPipNyaSqvcUR27BWvF6lnyUh130mp9xeU0BJ96WS9vFR
	 E1zxikSOKrN8UGojitN3XPXIs39Fc14S8Z3qFgaY=
Date: Mon, 2 Jun 2025 12:43:27 +0300
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
Subject: Re: [PATCH v3 02/15] media: rcar-isp: Improve
 ISPPROCMODE_DT_PROC_MODE_VC
Message-ID: <20250602094327.GE3645@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-2-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-2-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:31PM +0300, Tomi Valkeinen wrote:
> Instead of having four macros for ISPPROCMODE_DT_PROC_MODE_VC[0123](pm),
> have just one ISPPROCMODE_DT_PROC_MODE_VCn(vc, pm).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index 1eb29a0b774a..8fb2cc3b5650 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -28,10 +28,7 @@
>  #define ISPSTART_STOP					0x0000
>  
>  #define ISPPROCMODE_DT_REG(n)				(0x1100 + (0x4 * (n)))
> -#define ISPPROCMODE_DT_PROC_MODE_VC3(pm)		(((pm) & 0x3f) << 24)
> -#define ISPPROCMODE_DT_PROC_MODE_VC2(pm)		(((pm) & 0x3f) << 16)
> -#define ISPPROCMODE_DT_PROC_MODE_VC1(pm)		(((pm) & 0x3f) << 8)
> -#define ISPPROCMODE_DT_PROC_MODE_VC0(pm)		((pm) & 0x3f)
> +#define ISPPROCMODE_DT_PROC_MODE_VCn(vc, pm)		(((pm) & 0x3f) << (8 * (vc)))
>  
>  #define ISPCS_FILTER_ID_CH_REG(n)			(0x3000 + (0x0100 * (n)))
>  
> @@ -263,10 +260,10 @@ static int risp_start(struct rcar_isp *isp, struct v4l2_subdev_state *state)
>  
>  	/* Setup processing method. */
>  	risp_write_cs(isp, ISPPROCMODE_DT_REG(format->datatype),
> -		      ISPPROCMODE_DT_PROC_MODE_VC3(format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VC2(format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VC1(format->procmode) |
> -		      ISPPROCMODE_DT_PROC_MODE_VC0(format->procmode));
> +		      ISPPROCMODE_DT_PROC_MODE_VCn(3, format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VCn(2, format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VCn(1, format->procmode) |
> +		      ISPPROCMODE_DT_PROC_MODE_VCn(0, format->procmode));
>  
>  	/* Start ISP. */
>  	risp_write_cs(isp, ISPSTART_REG, ISPSTART_START);

-- 
Regards,

Laurent Pinchart

