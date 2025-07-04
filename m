Return-Path: <linux-media+bounces-36866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32967AF9942
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 18:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21A81896A11
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 16:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3151E5B7B;
	Fri,  4 Jul 2025 16:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cpEaqQKY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7832E1474CC;
	Fri,  4 Jul 2025 16:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647631; cv=none; b=QHsTTFu1vk1xFjjW3uFLhuxMtPNYTzuRNpEvoQWs+RjzOvxPMZL7X2lFrSrwArQbBhGDZTDWJXoHjV1Ut0Dbu0krIvBgtm5aZ93c0sqAh82uZVfq3hnmn2OABNIO4mIzvjrMsYnMMaS060Rsh7Sm6qIeDVtVJ7XEv2JuwxZMsDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647631; c=relaxed/simple;
	bh=NiVv7Kuf9NgpmytqRJDAbXBYd6wVLmUwukW9J4qH3Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p9yVaZqPRfKcy362K7ZaE4jyKdE3lXDWoZY/J4VxvGl8tgBSyGMdAScXODjWgknnDdQPLfHsvqqk7tK4h4y2BicPMr6ZTiDQviXX2fLsNLUZDgSuktlZBwqqjrwidSr32sOfE1DChodOFh14WgvLXaUmjcSgT7tEq/ypiOCk080=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cpEaqQKY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C876669;
	Fri,  4 Jul 2025 18:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751647602;
	bh=NiVv7Kuf9NgpmytqRJDAbXBYd6wVLmUwukW9J4qH3Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cpEaqQKYlQ7kJ5rd74YRyKCLyl4gBH/3HIhkw9bZdFGxq1sCDyaPol9jfQHlmrjDq
	 N+EY3OyEDrFh2Lj4s8GcIk6xg+yTvHsr/d1cJ4YWWlmkNH1gGrbcN90m5TnEbyjB45
	 46A3yliCI8o339GOSaaoF015ZDdBWN5q8n59o7cE=
Date: Fri, 4 Jul 2025 18:47:03 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 5/8] media: renesas: vsp1: Fix crop width and height
 clamping on RPF
Message-ID: <236elqi4nr63m5lir45f4o5woqimrkgzkfrvr62qlam4etgruc@diuox3mrcrst>
References: <20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com>
 <20250704001812.30064-6-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250704001812.30064-6-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent

On Fri, Jul 04, 2025 at 03:18:09AM +0300, Laurent Pinchart wrote:
> The vsp1 driver doesn't enforce a minimum value on the RPF crop rectangle
> width and height. Empty rectangles are accepted, leading to incorrect
> hardware behaviour. Fix it by adding minimum width and height
> constraints to the value clamping.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_rwpf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index ffc1b3ab54e2..ccc7608f538d 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -261,9 +261,9 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
>
>  	sel->r.left = clamp_t(int, sel->r.left, 0, format->width - min_width);
>  	sel->r.top = clamp_t(int, sel->r.top, 0, format->height - min_height);
> -	sel->r.width = min_t(unsigned int, sel->r.width,
> +	sel->r.width = clamp(sel->r.width, min_width,
>  			     format->width - sel->r.left);
> -	sel->r.height = min_t(unsigned int, sel->r.height,
> +	sel->r.height = clamp(sel->r.height, min_height,
>  			      format->height - sel->r.top);
>
>  	crop = v4l2_subdev_state_get_crop(state, RWPF_PAD_SINK);
> --
> Regards,
>
> Laurent Pinchart
>
>

