Return-Path: <linux-media+bounces-18715-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3BE988C70
	for <lists+linux-media@lfdr.de>; Sat, 28 Sep 2024 00:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDD5A1C21596
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 22:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCD3188A22;
	Fri, 27 Sep 2024 22:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bXQYjsHZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A0188583;
	Fri, 27 Sep 2024 22:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727475985; cv=none; b=f9vupxDjUK4soQ7zcjgsgVFLFGHMHr2YJBgqo5cct9sRsf/3paqYV0Fu3+aA/zjU6Tw47XJ54R98oa5HYz8lNxYYtJ7B8D/Wc5kMTaH+iEB0+zzPv5Li7ZQa8FhsnHb91E7yFYUYcK+C+QQM0yNwno46Rd575zV/iNB9RBG87Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727475985; c=relaxed/simple;
	bh=XEu/u3dP99hYjrXIrOPI/biRdqByD23BLfzPX0DoQdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkZsNyy/1RIN9ZIvACx5AGrkcJNOr6xQHu7+Au29OU4zAaWJg9PTJ1LdVl66/VSGikwE/Iu1wTkFQmEdC3+CPIiqAB7wh/8xdj6g62FWhdnqWEtdEvsgYOijA4przXJbg+QoX1byrhfiOEFGATjOmTxWaXJRDFHySU7ofrtgjWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bXQYjsHZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DBF2161;
	Sat, 28 Sep 2024 00:24:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727475893;
	bh=XEu/u3dP99hYjrXIrOPI/biRdqByD23BLfzPX0DoQdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXQYjsHZ1fmPgyYpilZleq3aoTamtkr6yVruiSJLlrSaovmg987BtLqjSAlikvwS2
	 xN1tYphvq7YjmGzBM1tgc5twkjlUkHCy0E9JApmrjK5Zb9wVHvjBzN8BqprpIQlLrg
	 iGEuP0PBjYkrTN9qmfKQ8B3+mowzZ/u9oZ4dWmGw=
Date: Sat, 28 Sep 2024 01:26:20 +0300
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
Subject: Re: [PATCH v2 04/16] media: platform: rzg2l-cru: rzg2l-csi2: Make
 use of NR_OF_RZG2L_CSI2_PAD
Message-ID: <20240927222620.GF12322@pendragon.ideasonboard.com>
References: <20240910175357.229075-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240910175357.229075-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910175357.229075-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Tue, Sep 10, 2024 at 06:53:45PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Make use of NR_OF_RZG2L_CSI2_PAD enum entry in media_entity_pads_init()
> instead of magic number.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 2f4c87ede8bf..10b8b0c87c1f 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -804,7 +804,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	 */
>  	csi2->pads[RZG2L_CSI2_SOURCE].flags = MEDIA_PAD_FL_SOURCE |
>  					      MEDIA_PAD_FL_MUST_CONNECT;
> -	ret = media_entity_pads_init(&csi2->subdev.entity, 2, csi2->pads);
> +	ret = media_entity_pads_init(&csi2->subdev.entity, NR_OF_RZG2L_CSI2_PAD, csi2->pads);

Better, I would use ARRAY_SIZE

	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
				     csi2->pads);

With this (and an updated commit message),

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	if (ret)
>  		goto error_pm;
>  

-- 
Regards,

Laurent Pinchart

