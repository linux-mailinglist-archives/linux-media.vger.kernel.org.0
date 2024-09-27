Return-Path: <linux-media+bounces-18721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E61C988CC7
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52CF8280C18
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438A91B6535;
	Fri, 27 Sep 2024 23:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ggBHIXMv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF2B17E01D;
	Fri, 27 Sep 2024 23:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727478165; cv=none; b=bcTOxdmWcyfU2WjdRR6qI8lMfgvrPSJcRXdKQkklmaiE7r32xPfieFBnp/viID33AJ6Kqep3n7bF4N7SaADN1ilSW882AtGxRID8L6YQAWqhacanDPbpbk902nTNhzq2dY1i6shJSM7bjMr3HB3pcQ+pnIi+yHNHhLjyTMMBnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727478165; c=relaxed/simple;
	bh=KtDtI67O/T5NmvNP3sdnrOdHn0o03XVj0MzD4XEC5Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxOZAr6CkANXezuwXwHuOLyvWvUcV+KJA+LJR2pHWZY5P04iojQqe5w36xAJ6NL/l2Ua9qbF1cnlk5ZYDCcM0JAFDEkThlP/jUIkjsDJ5ahMqSFNLYg7LhhhEZta7ZG6+x328Zy/BN/Y39cVGRDAQvaCTIHZ0ewVK3RgJ5/7em0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ggBHIXMv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D28F9EC;
	Sat, 28 Sep 2024 01:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727478073;
	bh=KtDtI67O/T5NmvNP3sdnrOdHn0o03XVj0MzD4XEC5Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ggBHIXMvqVQV1PFdXyo+qRqaZEZdOqX87YNjt4ftEUEaH8/NOa7L6zSbY81fywbFU
	 609knYL9KBswQOnq5I/H3RaGjZT1pnzbI7zLKucVi0/INh7dKZ/aiO+/qdoD3vamIa
	 LG7XpxRd8En/29qpNhvL4STe0FIk27iEb1Cjvuik=
Date: Sat, 28 Sep 2024 02:02:39 +0300
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
Subject: Re: [PATCH v2 12/16] media: platform: rzg2l-cru: rzg2l-csi2: Remove
 unused datatype field from rzg2l_csi2_format
Message-ID: <20240927230239.GL12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-13-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:53PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Remove the unused `datatype` field from the `rzg2l_csi2_format` struct and
> update the `rzg2l_csi2_formats[]` array to reflect the updated structure.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 26953499f305..79d99d865c1f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -183,12 +183,11 @@ static const struct rzg2l_csi2_timings rzg2l_csi2_global_timings[] = {
>  
>  struct rzg2l_csi2_format {
>  	u32 code;
> -	unsigned int datatype;
>  	unsigned int bpp;
>  };
>  
>  static const struct rzg2l_csi2_format rzg2l_csi2_formats[] = {
> -	{ .code = MEDIA_BUS_FMT_UYVY8_1X16,	.datatype = 0x1e, .bpp = 16 },
> +	{ .code = MEDIA_BUS_FMT_UYVY8_1X16, .bpp = 16 },
>  };
>  
>  static inline struct rzg2l_csi2 *sd_to_csi2(struct v4l2_subdev *sd)

-- 
Regards,

Laurent Pinchart

