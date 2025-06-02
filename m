Return-Path: <linux-media+bounces-33885-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 135C4ACABB8
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 11:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A66FF17ACD1
	for <lists+linux-media@lfdr.de>; Mon,  2 Jun 2025 09:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A97C1F180C;
	Mon,  2 Jun 2025 09:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u2nopuCG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050141F0990;
	Mon,  2 Jun 2025 09:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857429; cv=none; b=VE/3MJ4ZeJ7yoJu4ZlRitwgKm6LMsMZ6lfhGweaCU3v3fwPn0HotejBccHoNFZFoDdcKhoUOrJcQb81Jj9ioZqZpQv00uyncCTwFyypJTOKYLZ6b5QSOYyxCAoJpp62ssK7p+KOr+zEmAx4uQDifaIIQ9q4eL9/1LcV+JO+Ty/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857429; c=relaxed/simple;
	bh=NbGhzbu+JOPH83qC3CakGkjGf7XcTe00i/LP621AmfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jl91EOCR1IKPONjfDegzhbp8LWzLCgdHpY0YuyfDcmqWEkuvx+kE1xax7a3rcuGu4iBqDErYykw/2vFxUw8DB1o4I/VkVnNLoynQRdhzmr+WXCbflECJMkYKQdSpOaihcK5dhumn5KrFz7Hl5znp2skXR/4h0Y/JO88lcXdewVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u2nopuCG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B199379;
	Mon,  2 Jun 2025 11:43:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857425;
	bh=NbGhzbu+JOPH83qC3CakGkjGf7XcTe00i/LP621AmfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u2nopuCG0F4Aax/4PNmslqA3r1fC4PuczsHv5vHFs10jcsef24N4iqcfsbCw5xnIg
	 kKIa+RzHoVnLkTrF0avBKI4GP9ZOuKs7/VFcr605vSdVtjlAp2Aw+oDgEOo+YArkv1
	 2ZLhbnYjY+srjlzukQDdApiEi0aiB6e4B1lj0M2A=
Date: Mon, 2 Jun 2025 12:43:38 +0300
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
Subject: Re: [PATCH v3 04/15] media: rcar-csi2: Move
 {enable|disable}_streams() calls
Message-ID: <20250602094338.GF3645@pendragon.ideasonboard.com>
References: <20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com>
 <20250530-rcar-streams-v3-4-026655df7138@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-rcar-streams-v3-4-026655df7138@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, May 30, 2025 at 04:50:33PM +0300, Tomi Valkeinen wrote:
> With multiple streams the operation to enable the CSI-2 hardware and to
> call {enable|disable}_streams() on upstream subdev will need to be
> handled separately.
> 
> Prepare for that by moving {enable|disable}_streams() calls out from
> rcsi2_start() and rcsi2_stop().

Same comments as for 03/15. Maybe this will become clearer in subsequent
patches, but the change should then probably be squashed in those
patches.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index ddbdde23c122..698eb0e60f32 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -1573,20 +1573,12 @@ static int rcsi2_start(struct rcar_csi2 *priv, struct v4l2_subdev_state *state)
>  		return ret;
>  	}
>  
> -	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> -					 BIT_ULL(0));
> -	if (ret) {
> -		rcsi2_enter_standby(priv);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
>  
>  static void rcsi2_stop(struct rcar_csi2 *priv)
>  {
>  	rcsi2_enter_standby(priv);
> -	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
>  }
>  
>  static int rcsi2_enable_streams(struct v4l2_subdev *sd,
> @@ -1608,6 +1600,13 @@ static int rcsi2_enable_streams(struct v4l2_subdev *sd,
>  			return ret;
>  	}
>  
> +	ret = v4l2_subdev_enable_streams(priv->remote, priv->remote_pad,
> +					 BIT_ULL(0));
> +	if (ret) {
> +		rcsi2_stop(priv);
> +		return ret;
> +	}
> +
>  	priv->stream_count += 1;
>  
>  	return ret;
> @@ -1629,6 +1628,8 @@ static int rcsi2_disable_streams(struct v4l2_subdev *sd,
>  	if (priv->stream_count == 1)
>  		rcsi2_stop(priv);
>  
> +	v4l2_subdev_disable_streams(priv->remote, priv->remote_pad, BIT_ULL(0));
> +
>  	priv->stream_count -= 1;
>  
>  	return ret;

-- 
Regards,

Laurent Pinchart

