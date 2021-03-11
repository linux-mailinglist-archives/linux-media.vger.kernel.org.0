Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73D533722F
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhCKMM5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:12:57 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47182 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233038AbhCKMMw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:12:52 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C21F879;
        Thu, 11 Mar 2021 13:12:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615464771;
        bh=Rj/yrF+diHTzNf5CuvC7ZD2cxuXLvvdQMekISlKbrJw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ALaK1z209PgmK5aUDOuC0T0Xl03W16YpIkeh48IERg0Hfvn/9eDw8QWQIgFjb+h8P
         Y9w23YfPi+ieJ974Zjl4YlZC0a0VtRV/C3lltFb1QZ2oxOeyjg8r4lxh8XX4F49bhS
         FxutHCv5Bvh/ZQJWTzmR9mDkIE7BRtacQi6ARfEU=
Date:   Thu, 11 Mar 2021 14:12:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 06/13] vsp1/vsp1_drm.h: add missing 'struct' kernel-doc
 keyword
Message-ID: <YEoJIZp2MKe3hTgp@pendragon.ideasonboard.com>
References: <20210311102022.96954-1-hverkuil-cisco@xs4all.nl>
 <20210311102022.96954-7-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311102022.96954-7-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Thu, Mar 11, 2021 at 11:20:15AM +0100, Hans Verkuil wrote:
> The kernel-doc documentation for two structs was missing the
> 'struct' keyword.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Should I take this in my tree, or will you merge them with your series ?

> ---
>  drivers/media/platform/vsp1/vsp1_drm.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.h b/drivers/media/platform/vsp1/vsp1_drm.h
> index e85ad4366fbb..ab8b7e3161a2 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.h
> +++ b/drivers/media/platform/vsp1/vsp1_drm.h
> @@ -18,7 +18,7 @@
>  #include "vsp1_pipe.h"
>  
>  /**
> - * vsp1_drm_pipeline - State for the API exposed to the DRM driver
> + * struct vsp1_drm_pipeline - State for the API exposed to the DRM driver
>   * @pipe: the VSP1 pipeline used for display
>   * @width: output display width
>   * @height: output display height
> @@ -47,7 +47,7 @@ struct vsp1_drm_pipeline {
>  };
>  
>  /**
> - * vsp1_drm - State for the API exposed to the DRM driver
> + * struct vsp1_drm - State for the API exposed to the DRM driver
>   * @pipe: the VSP1 DRM pipeline used for display
>   * @lock: protects the BRU and BRS allocation
>   * @inputs: source crop rectangle, destination compose rectangle and z-order

-- 
Regards,

Laurent Pinchart
