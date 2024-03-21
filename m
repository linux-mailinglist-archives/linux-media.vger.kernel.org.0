Return-Path: <linux-media+bounces-7525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4F885F32
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 18:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86D7CB23388
	for <lists+linux-media@lfdr.de>; Thu, 21 Mar 2024 17:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D34F135408;
	Thu, 21 Mar 2024 16:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hawTli8h"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2671332B3
	for <linux-media@vger.kernel.org>; Thu, 21 Mar 2024 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711040382; cv=none; b=kvxWm9K02h9G0RjPQ1Nmg142ybpBhXk5Eq+482s6UZuNe3+WoUK/wSrvMVWENuTzeH+Bz/JfWdUNz3vK32Ad+0SnoiMT59jphPjv+L+PcMRYGXtcSuhZUdTX/9/GunCi228oK2h0zMT4txfCPBWmrrRvaK/37ihSkYk1VaeHmLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711040382; c=relaxed/simple;
	bh=yHVYg7onHCoQieFterKJuJ0SRBhvZDPeWKVij3YcZ5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LT6Lb++YvPZjpVP1MQ3Ax9rRxQPCEh/UtepKne31d459tvNkFdXjBswr9ehbODQbmCHE1xRMV5jvf1HSLMqZnhF4nIxQXNGYO5hgnxyNR2s33qPnS53Q/l7N1uTlkxPJu3+lI8jTkecZv1NhlEhQ7sgmOo2Brvl19Yo4HWmvusA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hawTli8h; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFDF5672;
	Thu, 21 Mar 2024 17:59:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711040351;
	bh=yHVYg7onHCoQieFterKJuJ0SRBhvZDPeWKVij3YcZ5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hawTli8hvXgO9X+FXgAhysMLn5vZ6dNH8xaXQcGk7+P3zz1es3WziIDjx1DmIZye2
	 Vl6TrPwFhlP1Turn6uQELDTNw2is4IYbdUUO0G8lUvvGqu76nQuyVv/oQV7UtVazeZ
	 PzQewjtyqHwbsijdfeInSrjTWPRFXIj1nTg/7Sh0=
Date: Thu, 21 Mar 2024 18:59:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 37/38] media: ccs: Add IMMUTABLE route flag
Message-ID: <20240321165935.GI9582@pendragon.ideasonboard.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-38-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240313072516.241106-38-sakari.ailus@linux.intel.com>

Hi Sakari,

Thank you for the patch.

On Wed, Mar 13, 2024 at 09:25:15AM +0200, Sakari Ailus wrote:
> Add immutable route flag to the routing table.

I would write here that the metadata stream route is immutable as CCS
sensors don't offer a way to disable embedded data. Or if they do, that
it's currently unimplemented :-) I would then also possibly add a todo
comment to the code.

> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/i2c/ccs/ccs-core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 838daab212f2..5205d1ecf8f2 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3368,12 +3368,14 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
>  			.sink_pad = CCS_PAD_SINK,
>  			.source_pad = CCS_PAD_SRC,
>  			.source_stream = CCS_STREAM_PIXEL,
> -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>  		}, {
>  			.sink_pad = CCS_PAD_META,
>  			.source_pad = CCS_PAD_SRC,
>  			.source_stream = CCS_STREAM_META,
> -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>  		}
>  	};
>  	struct v4l2_subdev_krouting routing = {

-- 
Regards,

Laurent Pinchart

