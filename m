Return-Path: <linux-media+bounces-21864-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340F9D6BAD
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 22:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37728281A00
	for <lists+linux-media@lfdr.de>; Sat, 23 Nov 2024 21:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2E01A01C3;
	Sat, 23 Nov 2024 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="B+AkBKl1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E02EADC;
	Sat, 23 Nov 2024 21:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732398005; cv=none; b=pOf3+j2iJX5Xq5UFYvDP0TcQejwZSdxAH9LaUZsbog42xKE0cB0X7GpXj8H/TEdth7KIRtV+gyvvsvD53xrJfTCzCwLVDbCRa+9Bw6bzJup6tB3PnCxjJAC+Ch7jmGvV9fPJhBi0hAGfmqUIrZQTdCHZjQBkafUryIEIrcA2s7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732398005; c=relaxed/simple;
	bh=eQG6kS5xyA2hRLqlVVVneOw2SiXBU3SFxXnAvjEdobY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaQEHy4Y+hfB1GV3JBt5ohZLT/a/uhNPfRpOXm6jFOlNwMAPCzMCMViU+1n5lVYNaDEXWeSwpDtzrfThE38nOjsknKe2cTq3WKoZGPLFLawwQj3FtHUZBNrxbY1Ogkvhe7qQ4CKCzWFTQc2eLgfSpXD1ayVYms/hMxirAtx/k5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=B+AkBKl1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DAB6594;
	Sat, 23 Nov 2024 22:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732397981;
	bh=eQG6kS5xyA2hRLqlVVVneOw2SiXBU3SFxXnAvjEdobY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+AkBKl1u+UJtcZo7wWUt6mnaELBd4cBOCC7B7hXGstQ6qufZv4m4bbVEO1icEOUI
	 P3+dW3w6Cj63hPtUKreXm8p433iCbbU4WFdVNpgzqwQqDi/SOlqySLQTmdeCPCDQ6C
	 AmBfyoZrlZPAWOLEZraw493oJ52RjTwwkApjxUSw=
Date: Sat, 23 Nov 2024 23:39:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] v4l2: mc: fix endpoint iteration
Message-ID: <20241123213952.GD19573@pendragon.ideasonboard.com>
References: <20241122145525.194253-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122145525.194253-1-demonsingur@gmail.com>

Hi Cosmin,

Thank you for the patch.

On Fri, Nov 22, 2024 at 04:55:24PM +0200, Cosmin Tanislav wrote:
> When creating links from a subdev to a sink, the current logic tries to
> iterate over the endpoints of dev's fwnode.
> 
> This might not be correct when the subdev uses a different fwnode
> compared to the dev's fwnode.
> 
> If, when registering, the subdev's fwnode is not set, the code inside
> v4l2_async_register_subdev will set it to the dev's fwnode.
> 
> To fix this, just use the subdev's fwnode.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Fixes: 0d3c81e82da9 ("media: v4l2-mc: add v4l2_create_fwnode_links helpers")

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-mc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mc.c b/drivers/media/v4l2-core/v4l2-mc.c
> index 4bb91359e3a9a..937d358697e19 100644
> --- a/drivers/media/v4l2-core/v4l2-mc.c
> +++ b/drivers/media/v4l2-core/v4l2-mc.c
> @@ -329,7 +329,7 @@ int v4l2_create_fwnode_links_to_pad(struct v4l2_subdev *src_sd,
>  	if (!(sink->flags & MEDIA_PAD_FL_SINK))
>  		return -EINVAL;
>  
> -	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
> +	fwnode_graph_for_each_endpoint(src_sd->fwnode, endpoint) {
>  		struct fwnode_handle *remote_ep;
>  		int src_idx, sink_idx, ret;
>  		struct media_pad *src;

-- 
Regards,

Laurent Pinchart

