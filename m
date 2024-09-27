Return-Path: <linux-media+bounces-18718-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD510988C91
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 00:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F36B81C20DAD
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 22:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5BD1B3F3E;
	Fri, 27 Sep 2024 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fq2nxFTA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E061B29CD;
	Fri, 27 Sep 2024 22:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727477076; cv=none; b=jgKns/BZUVx51LXeybumuN37bHcfpjKZtxo1EsJ7CteURcImXRDcNrpFVW9gzsDQTJmvLPIIHq85F7nw07WqnRAWwG+gFOY1gqJHluxcgJDWk4xDc4JA4u2MBE6iwjLog4xLsYbV/jikkpFNKLL6DcMD/lB9zK3A48ls1QXjBzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727477076; c=relaxed/simple;
	bh=fybOp8zcpYHLEQ8DAIELXG2rpOwSwndz83OF/mLwNX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3seAR0BqDfi/BTUu5DgkiNloH20rEX+hfWm0ZdTnHO9qgDrAogfs6d56b7uFe/AOF4JTGzc9i4TZC3dz7woWuE4XIB1BVnmoLZb1j/4BamWlcNvk2VVrEMTU1I4ChNnl+89G1whm/aW9tFX5AO+6CJ+bZk5a2Xw+wFO+ZBZOCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fq2nxFTA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09457161;
	Sat, 28 Sep 2024 00:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727476984;
	bh=fybOp8zcpYHLEQ8DAIELXG2rpOwSwndz83OF/mLwNX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fq2nxFTAnghbKBtsFW77sFGE0RWctmDKMBQyxPipyYgB64rFx6lIu1oZJfYCJB80O
	 rwGdhb6/KBCM72fx3+/BHWwVQhxuHQusbGRc7mtolxzRoeTX9iUsaeW2iute0BQL5W
	 yKHBBMDGmZ6Ry/qBiQN52M4/kwoEhAIPMwqT0vT4=
Date: Sat, 28 Sep 2024 01:44:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 09/16] media: platform: rzg2l-cru: Remove unused
 fields from rzg2l_cru_ip_format struct
Message-ID: <20240927224430.GI12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-10-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:50PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Simplified the `rzg2l_cru_ip_format` struct by removing the unused
> `datatype` and `bpp` fields from the structure in `rzg2l-ip.c`.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 75c3c4f1d10b..cc297e137f3e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -10,12 +10,10 @@
>  
>  struct rzg2l_cru_ip_format {
>  	u32 code;
> -	unsigned int datatype;
> -	unsigned int bpp;
>  };
>  
>  static const struct rzg2l_cru_ip_format rzg2l_cru_ip_formats[] = {
> -	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, },
>  };
>  
>  static const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code)

-- 
Regards,

Laurent Pinchart

