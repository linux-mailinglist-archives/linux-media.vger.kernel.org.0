Return-Path: <linux-media+bounces-40648-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27768B30214
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:30:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 860517BC673
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323C7343D8A;
	Thu, 21 Aug 2025 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bZisui7b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D83343D9B;
	Thu, 21 Aug 2025 18:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755801007; cv=none; b=rWlit8GLq9wmjet0UtYymo1d/S+EH6nIbD7ArnGjSdbK57p9YDim52F8NsqOz9y7Iy/WrXIz1Pm6iW3IWb2lLfAmZRVmGob/ftVDw3R2mOybSwzolu71PpGNKTi7KBmX7SkRGP++AD7JXhIx++b1/Ll2GR4JZnp8su7h2oD8Z5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755801007; c=relaxed/simple;
	bh=36dpRi3ObSG31rrMm06KK+ZYSjy4DpX62AmDiq+P6hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIzUOxQp6hvUpb3EKiprsGKe/asbiPuy0JFEUq1Y/9ivM3qzybvBonyE/mm1YlBjB4WXNpiJYLeL8KJ7pgOq5pohUKLzpgV6h53b1gQYDMAai7/cl5ECbIjT0jwuK8Hn27TZ2WXXMchuJlhGTYr6SihXlwQ7YnnvHn0honYpC0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bZisui7b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-51-28.net.vodafone.it [5.90.51.28])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D284B7F0;
	Thu, 21 Aug 2025 20:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755800944;
	bh=36dpRi3ObSG31rrMm06KK+ZYSjy4DpX62AmDiq+P6hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bZisui7b08AkFQyMwZudiFAhk2okdEd8j3VyIzCve8/BWIinsK1JeyNqNnzjRM2Wr
	 hkEqi8nSIjblbbrM8ls95x+AT0Ktv6C+AUS+RjlmLPl+2k+h9Z4Gqo92PZ1nhW2nJ8
	 l7RirfnrHsBelos71Gk5MyYePdU0jJLF8IBk9gso=
Date: Thu, 21 Aug 2025 20:29:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, stable@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Export missing vsp1_isp_free_buffer symbol
Message-ID: <nmwfwcfhkqwdepueo3ihqgjj5ftwjjdzxtwofbxszmgw2alah2@bykmfe7sfxwy>
References: <20250821154241.24348-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821154241.24348-1-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Thu, Aug 21, 2025 at 06:42:41PM +0300, Laurent Pinchart wrote:
> The vsp1_isp_free_buffer() function implemented by the vsp1 driver is
> part of the API exposed to the rcar-isp driver. All other symbols except
> that one are properly exported. Fix it.
>
> Fixes: d06c1a9f348d ("media: vsp1: Add VSPX support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Ups, thanks for fixing

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_vspx.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> index a754b92232bd..1673479be0ff 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_vspx.c
> @@ -286,6 +286,7 @@ void vsp1_isp_free_buffer(struct device *dev,
>  	dma_free_coherent(bus_master, buffer_desc->size, buffer_desc->cpu_addr,
>  			  buffer_desc->dma_addr);
>  }
> +EXPORT_SYMBOL_GPL(vsp1_isp_free_buffer);
>
>  /**
>   * vsp1_isp_start_streaming - Start processing VSPX jobs
> --
> Regards,
>
> Laurent Pinchart
>

