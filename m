Return-Path: <linux-media+bounces-35587-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A38DAE386C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 10:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6377B188E175
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 08:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC7B22DA0A;
	Mon, 23 Jun 2025 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TJ+iWq0U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898AB22D4C0
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667693; cv=none; b=YDtgGqIu6wgxbsoIfuwDC6Z5N9TbgWEe3sy2xT32Ok8YhjQ5+xwKnvLVEGsXq7Ru7aax+OrR/7OXuo6kzhAsHHrdkYzIPG7n1I+7o8vw0e3/BtMVTQPT66saO25fKpL1QJHDsE00RDIscCioHSbfYUMy0BUVKGMKJOv6M7JZW3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667693; c=relaxed/simple;
	bh=n0bqNIY/e/eEU4dOlzKen5mxWybdRE5RQ2ZjArVkxoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hU5q/bjorfpwTESwaJhOEv9OaYXSNVWQeTZlN4IsxzS7rBS96rGt4sWuoDw0KuUouGaakSkEpEI4ZASTvdGUEn2acqCZLA2u5V7P4F61C7HEbcX+QehFtHywHtx8YB+EMp1wu8uHWbqq7UzN8aUzmqVBAsRgdblRK2Lv53MAskw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TJ+iWq0U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-136-88.net.vodafone.it [5.90.136.88])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAD27D77;
	Mon, 23 Jun 2025 10:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750667672;
	bh=n0bqNIY/e/eEU4dOlzKen5mxWybdRE5RQ2ZjArVkxoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TJ+iWq0Up0OKQjqLXbQIUN6aLWpH2x/dyJ6e2FR5RkEzTuDCFQ0LLxV37MGbaEKo0
	 T9uN/YmJH8o5CnLHPMfhfwZTYEkDiBTGY2G91d14arC+NrTXmaZP++IFebUJkIz72I
	 fcFift2sH/qrHToMyEfSHxqp2lZ+Psba4gP85IS4=
Date: Mon, 23 Jun 2025 10:34:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Julien Massot <julien.massot@collabora.com>, 
	Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hans@jjverkuil.nl>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/5] media: i2c: ds90ub913: Drop check on number of
 active routes
Message-ID: <bpj2o5ai6iedpnmrsrii2irvawysbapk76ewoqg4hegp446k46@uij24ozbfv7f>
References: <20250619204712.16099-1-laurent.pinchart@ideasonboard.com>
 <20250619204712.16099-3-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619204712.16099-3-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Thu, Jun 19, 2025 at 11:47:09PM +0300, Laurent Pinchart wrote:
> The subdev core now limits the number of active routes to
> V4L2_FRAME_DESC_ENTRY_MAX. Drop the duplicated check in the ds90ub913
> driver.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/i2c/ds90ub913.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> index fd2d2d5272bf..61920d34efc5 100644
> --- a/drivers/media/i2c/ds90ub913.c
> +++ b/drivers/media/i2c/ds90ub913.c
> @@ -316,14 +316,6 @@ static int _ub913_set_routing(struct v4l2_subdev *sd,
>  	unsigned int i;
>  	int ret;
>
> -	/*
> -	 * Note: we can only support up to V4L2_FRAME_DESC_ENTRY_MAX, until
> -	 * frame desc is made dynamically allocated.
> -	 */
> -
> -	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
> -		return -EINVAL;
> -
>  	ret = v4l2_subdev_routing_validate(sd, routing,
>  					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
>  	if (ret)
> --
> Regards,
>
> Laurent Pinchart
>
>

