Return-Path: <linux-media+bounces-17835-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2724296FEA0
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 02:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4216C286633
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 00:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D3D1139E;
	Sat,  7 Sep 2024 00:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aXqLnjTY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E223360;
	Sat,  7 Sep 2024 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725667480; cv=none; b=r4OLeoGAXY5uE4MDRynYNHSZtLL/B7boXU1L7/b9VrjQcFRidmIOK3CoXECGSOeEg8TfY+xDNUI2NwmBy1Z2CO1mk27ywc3j6DFDX8vCUyZBy+q6M8sck0YSqZQV079toqIAt6tbEdQMUPrYTt7S++XXNuCwMOgUmGx03ZUt71g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725667480; c=relaxed/simple;
	bh=7L2tLx9jdRlt+S6dM03WooAfOMIZNX1Tb95L6Vo/ha4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8wYjxdS+1rXRvJSkz7v+KsVkaiQupAKOFGcoIOlrze37vlbvUgvwJB7VRTOaorwZbEBpZ+5gLXL1lXBAs0xKAhOeMjGPe0B2gw2YbQU8k9teO04W8ihYW/aRxwz/r3mc6xjfJgCBXQilpf7YkYI4WWIg+JrZmEBikxbDCBjBsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aXqLnjTY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C48E3D5;
	Sat,  7 Sep 2024 02:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725667402;
	bh=7L2tLx9jdRlt+S6dM03WooAfOMIZNX1Tb95L6Vo/ha4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aXqLnjTYt+cJ26FQvvqgYDNqfijinTdTPKgCMofQ5vlDZWnkhDTxlJiwRS3rLtx2l
	 WsCkZrgrEi5/mO+qSDF2eFqfvM5CF+uD6+umcOrBzBXNr1d08TooXFTSxzWbZoZwbI
	 tlkCOIJ6bmZi/khrY40vRwl3tPWHTu0y9RJcBDyU=
Date: Sat, 7 Sep 2024 03:04:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Hien Huynh <hien.huynh.px@renesas.com>, linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Fix the comment
 in rzg2l_cru_start_streaming_vq()
Message-ID: <20240907000434.GI27086@pendragon.ideasonboard.com>
References: <20240905112508.160560-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905112508.160560-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Thu, Sep 05, 2024 at 12:25:05PM +0100, Biju Das wrote:
> Replace "buffer." -> "buffer", for consistency with rest of the
> comment blocks in rzg2l_cru_start_streaming_vq().

I usually go the other way around, sentences should end with a period.
You can go either way as it's your driver.

> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZtWNFuw70nkB37EK@duo.ucw.cz/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch have merge dependency on [1]
> [1] https://lore.kernel.org/all/20240826110740.271212-1-biju.das.jz@bp.renesas.com/
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index bbf4674f888d..d17e3eac4177 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -648,7 +648,7 @@ static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count
>  		goto assert_aresetn;
>  	}
>  
> -	/* Allocate scratch buffer. */
> +	/* Allocate scratch buffer */
>  	cru->scratch = dma_alloc_coherent(cru->dev, cru->format.sizeimage,
>  					  &cru->scratch_phys, GFP_KERNEL);
>  	if (!cru->scratch) {

-- 
Regards,

Laurent Pinchart

