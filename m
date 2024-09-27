Return-Path: <linux-media+bounces-18720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE0988CB9
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 01:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50213B21B89
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 23:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A557D1B6552;
	Fri, 27 Sep 2024 23:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F14eKevW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3091D18787E;
	Fri, 27 Sep 2024 23:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727478067; cv=none; b=sbSr3ZkshKW0Fi/cSp+T1rs+Mj1SUOkjDyyQQHEN52SNjysCHv76YZIcjeNT9G61DhwXoGGqy9XU06ZyGEE375f5/jp2kFWa1uUWx2GFJjnstl3E+fpJJQmWJhSvYQ9DMieSy5tEHKNGHv70zoVCCAMA5wz/P2400T/qODQcP5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727478067; c=relaxed/simple;
	bh=3+sgUJ37CFAWr+Ko4hpLYJm61jqQTk4R4TSoJbZ5UJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZU8LY6gT5fDUC57TRYLUiFglqF/pMYfJj8BUuUhNqcopahRviZo1AWrXZ3TDxfgtnichS0xI7Us/5GgoEZ8HgJnVAgT2jTlVGFvoHeO2J3hkCj/J1jVXwWnQnmY3wPj6mi950/2K9TRPWsgE6QgfZcF8/VZvo6JFvM9w2DmRjYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F14eKevW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8FCCD161;
	Sat, 28 Sep 2024 00:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727477971;
	bh=3+sgUJ37CFAWr+Ko4hpLYJm61jqQTk4R4TSoJbZ5UJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F14eKevWkaFYkuYk53AnKqyDhngTG5SyMtE8STKbF4Zs5MluNn5Ygcifhi+HtCkDF
	 BcC6QofxgMvvW7iYaWhN85bTjmBU+32Eq+WfA7jmdDtsxbAdz8W4jnpAqNOPbyeJoB
	 ej1hzP6itBPLT+1WGt7xx0IcinwoQgYKCI+h9Q7s=
Date: Sat, 28 Sep 2024 02:00:57 +0300
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
Subject: Re: [PATCH v2 11/16] media: platform: rzg2l-cru: rzg2l-ip: Use
 `rzg2l_cru_ip_formats` array in enum_frame_size callback
Message-ID: <20240927230057.GK12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-12-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:52PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Use the `rzg2l_cru_ip_formats` array in `rzg2l_cru_ip_enum_frame_size()`
> to validate the index range and format code.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> index 2d3b985b7b0d..c7bc82bf3f14 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
> @@ -162,10 +162,10 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
>  					struct v4l2_subdev_state *state,
>  					struct v4l2_subdev_frame_size_enum *fse)
>  {
> -	if (fse->index != 0)
> +	if (fse->index >= ARRAY_SIZE(rzg2l_cru_ip_formats))

This isn't right, the index is related to frame sizes, not frame
formats. You should keep the code as-is.

>  		return -EINVAL;
>  
> -	if (fse->code != MEDIA_BUS_FMT_UYVY8_1X16)
> +	if (!rzg2l_cru_ip_code_to_fmt(fse->code))
>  		return -EINVAL;

This is good.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;

-- 
Regards,

Laurent Pinchart

