Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF0D3AD2EE
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 21:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbhFRTfu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Jun 2021 15:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhFRTfu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Jun 2021 15:35:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21FAC061574;
        Fri, 18 Jun 2021 12:33:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 584DB3F0;
        Fri, 18 Jun 2021 21:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624044817;
        bh=RdBQEyYkLMGT4SV7oleHkLRgAIkCH+o6FLpmjBd2wgU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DD97TBsZgqiPh5X5pNDVwbKFtkLJC0T4yWEKzbKTOH7RlRzXSVBkwiooWJlx7gDbB
         yED3bWw+CRg2K+fOmIXob+EGIbpVy4tiI0LeX2Zd5xQtc+9DfjzfuAaO/D8nJ6/tKc
         mBgxOAGPQt5IWCUGJmq+/gdqc1E04L6Qeh6d4rZU=
Date:   Fri, 18 Jun 2021 22:33:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] media: vsp1: Simplify DRM UIF handling
Message-ID: <YMz0+aiRDqHfWarV@pendragon.ideasonboard.com>
References: <20210618190905.580258-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618190905.580258-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, Jun 18, 2021 at 08:09:05PM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> In commit 6732f3139380 ("media: v4l: vsp1: Fix uif null pointer access")
> the handling of the UIF was over complicated, and the patch applied
> before review.
> 
> Simplify it to keep the conditionals small.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> 
> Another one that I had lying around in my tree for too long ....

It seems to have survived bitrot quite well.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> index 06f74d410973..0c2507dc03d6 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -455,6 +455,10 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
>  		dev_err(vsp1->dev, "%s: failed to setup UIF after %s\n",
>  			__func__, BRX_NAME(pipe->brx));
>  
> +	/* If the DRM pipe does not have a UIF there is nothing we can update. */
> +	if (!drm_pipe->uif)
> +		return 0;
> +
>  	/*
>  	 * If the UIF is not in use schedule it for removal by setting its pipe
>  	 * pointer to NULL, vsp1_du_pipeline_configure() will remove it from the
> @@ -462,9 +466,9 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
>  	 * make sure it is present in the pipeline's list of entities if it
>  	 * wasn't already.
>  	 */
> -	if (drm_pipe->uif && !use_uif) {
> +	if (!use_uif) {
>  		drm_pipe->uif->pipe = NULL;
> -	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {
> +	} else if (!drm_pipe->uif->pipe) {
>  		drm_pipe->uif->pipe = pipe;
>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
>  	}

-- 
Regards,

Laurent Pinchart
