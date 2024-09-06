Return-Path: <linux-media+bounces-17834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9F96FE9F
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 02:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABA4B1F23C9A
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2024 00:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35CC15B55D;
	Fri,  6 Sep 2024 23:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IKQUVH1+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938AB158A30;
	Fri,  6 Sep 2024 23:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725667196; cv=none; b=BGrVfE+CG0pXjHr5bQSJbLmIjaZaYEDkUDbM1LH562bLNa3DiyuUS7GMORNA1/DqiGgwq7noWL+y8ilOkCtJDwSC7tSvb+gd7UqxXO5s58W5MPebHcJdlnQawzaZ2m6inkjVIDuGM4tUhorflcAz2U1bui6leSnxJVSb/RDpmFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725667196; c=relaxed/simple;
	bh=NcEl31WsaV5JI6lNZE7Tn7k8tXTCUiy+8qQ3QOWJq70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwkXQwYlhdq7rFFW4vgJkdDV79Wqo/+E9IBk0I9GPE83ysRJM6GeIQRoyOHZYFbuWxw+QCejPLA3PO2Lqrvi9e05u0gQMOvor0cBP+OaYVEqiq7ObeM6eE4ZEz8ScTx72Da+vgarlVuNPT3C3kK9rRriV0f+BjKAFpscw8VgKjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IKQUVH1+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 118CA3D5;
	Sat,  7 Sep 2024 01:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725667117;
	bh=NcEl31WsaV5JI6lNZE7Tn7k8tXTCUiy+8qQ3QOWJq70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKQUVH1+cVAG7IBP/qhsH/gCINZjE/dYAPYHQkZAm/9RMIYPSnvyzlsza6JMVwRuO
	 TkSMEyj2BrgVZ8eE3Gh33Xy9xV2ri0M1teV0RYDa8JOAUDKLwUbE3a53om5aJt7i4y
	 k0TwsmQlSyqI0X5iozwMJTaNQIklEnsAtIfF2ObE=
Date: Sat, 7 Sep 2024 02:59:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: platform: rzg2l-cru: rzg2l-video: Set AXI burst
 max length
Message-ID: <20240906235948.GH27086@pendragon.ideasonboard.com>
References: <20240905111828.159670-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905111828.159670-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Thu, Sep 05, 2024 at 12:18:26PM +0100, Biju Das wrote:
> As per the hardware manual section 35.2.3.26 'AXI Master Transfer Setting
> Register for CRU Image Data;, it is mentioned that to improve the transfer

s/;/'/

> performance of CRU, it is recommended to use AXILEN value '0xf' for AXI
> burst max length setting for image data.
> 
> Signed-off-by: Hien Huynh <hien.huynh.px@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 374dc084717f..d17e3eac4177 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -52,6 +52,11 @@
>  #define AMnMBS				0x14c
>  #define AMnMBS_MBSTS			0x7
>  
> +/* AXI Master Transfer Setting Register for CRU Image Data */
> +#define AMnAXIATTR			0x158
> +#define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
> +#define AMnAXIATTR_AXILEN		(0xf)
> +
>  /* AXI Master FIFO Pointer Register for CRU Image Data */
>  #define AMnFIFOPNTR			0x168
>  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> @@ -278,6 +283,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
>  static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  {
>  	unsigned int slot;
> +	u32 amnaxiattr;
>  
>  	/*
>  	 * Set image data memory banks.
> @@ -287,6 +293,11 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  
>  	for (slot = 0; slot < cru->num_buf; slot++)
>  		rzg2l_cru_fill_hw_slot(cru, slot);
> +
> +	/* Set AXI burst max length to recommended setting */
> +	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
> +	amnaxiattr |= AMnAXIATTR_AXILEN;
> +	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);

It would be more efficient to just write

	rzg2l_cru_write(cru, AMnAXIATTR, AMnAXIATTR_AXILEN);

the hardware manual however doesn't make it clear if this is safe or
not. The rest of the register is reserved, and writes as documented as
ignored, but the reset value is non-zero. If it's not safe to write the
reserved bits to 0,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
>  static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru, bool *input_is_yuv,

-- 
Regards,

Laurent Pinchart

