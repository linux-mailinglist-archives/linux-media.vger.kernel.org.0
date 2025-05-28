Return-Path: <linux-media+bounces-33534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 024E6AC6C64
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 17:01:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5F8517BB1B
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 15:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B4D28853F;
	Wed, 28 May 2025 15:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jBDLVoGy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23EA27454;
	Wed, 28 May 2025 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444465; cv=none; b=XFgc5Psaxrph+Bb1Cebi4RYtcSIh+MN0aTyM3+1vcsbGeWHGARZmcDIwPkGuOc+OgSA8sjNVKfcpDDlRLDKFchO0DIZ99j63TxE3FttPUIeUUEWkMZDbIti3cj15zrVOUyaEGGrWJeGyIk6s7czjShKcNfd5GkIuKIUPbRvBULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444465; c=relaxed/simple;
	bh=lG4nYndUvi/JCmkKprPKq8twY4fRunX2opl/ker12YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAEnneZiLFjBZlUHUpSqIuSsBu9mKytlZopEEkRi7BO3RYO+ogmtRy4pSwYldg3okuKi99sT7G3Lc0eLMhtlmHRutmtwjjlyloFRJC7N3rKMSHNUbCA1UzANs76AkT4SC8H6ygDOHCGaM92aLV94VzmzkAjA0034bsZWJ1TBoV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jBDLVoGy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-143-118.net.vodafone.it [5.90.143.118])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E91EFE;
	Wed, 28 May 2025 17:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748444435;
	bh=lG4nYndUvi/JCmkKprPKq8twY4fRunX2opl/ker12YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBDLVoGyhCyoqnKeK9IxQ3UqWv9xyQtig/4OD7ofU9qG83gFJtKjf40XSU7WIYszd
	 ciMk6Un1WwlLsJoTxP+HnSaZG5Q0fctYlvkWrBwbaN6P/zLSKakdpfB/Y2uPHJAvev
	 SSz+QD1oTmjkbCPcYiFvf/cU9Un4VHDvlYH9cLXc=
Date: Wed, 28 May 2025 17:00:58 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 6/7] media: renesas: vsp1: Fix format propagation on the
 BRX
Message-ID: <7wflt52nkxfxonl6kjkw75wnp7f6ed4v6tetwgjsxqxf5po7ra@qgunmdedsmi4>
References: <20250429235322.29826-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250429235322.29826-7-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429235322.29826-7-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Wed, Apr 30, 2025 at 02:53:21AM +0300, Laurent Pinchart wrote:
> The format width and height is never propagated to the BRX source pad,
> leaving its initial configuration invalid. Propagate the whole format
> from the first sink pad to the source pad instead of only propagating
> the media bus code. This fixes compliance with the subdev format
> propagation rules.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> index dd651cef93e4..911359faa600 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -156,14 +156,20 @@ static int brx_set_format(struct v4l2_subdev *subdev,
>  		compose->height = format->height;
>  	}
>
> -	/* Propagate the format code to all pads. */
> +	/*
> +	 * Propagate the format code to all pads, and the whole format to the
> +	 * source pad.
> +	 */
>  	if (fmt->pad == BRX_PAD_SINK(0)) {
>  		unsigned int i;
>
> -		for (i = 0; i <= brx->entity.source_pad; ++i) {
> +		for (i = 0; i < brx->entity.source_pad; ++i) {
>  			format = v4l2_subdev_state_get_format(state, i);
>  			format->code = fmt->format.code;
>  		}
> +
> +		format = v4l2_subdev_state_get_format(state, i);
> +		*format = fmt->format;

nice catch
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  	}
>
>  done:
> --
> Regards,
>
> Laurent Pinchart
>
>

