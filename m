Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB14249FC1D
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 15:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245327AbiA1Otm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 09:49:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244950AbiA1Otm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 09:49:42 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43409C061714
        for <linux-media@vger.kernel.org>; Fri, 28 Jan 2022 06:49:42 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 34BFF471;
        Fri, 28 Jan 2022 15:49:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643381379;
        bh=VXx/xwMMErnkZJ+iy2FMUb3APvQAcOFnJkoG0cGGTn8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=m8eDNgDcc6U3L6DcrX7wo2lvPny+5/dw29KCkk8KRqotq12GZvTvelBk6AggBH58H
         C+fJGwJRUcLelCiEoVs2SykNZFIMiaWFoQ9xFRD3nfQJSXAtkQtDbYAC2CoSd5O0aP
         TzbzlRtdvbZebScFtDvRcUUIVjjgCaz30gyqRf20=
Date:   Fri, 28 Jan 2022 16:49:17 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl
Subject: Re: [PATCH v2 1/4] mc: Remove redundant documentation
Message-ID: <YfQCbW2X/lSbhd9T@pendragon.ideasonboard.com>
References: <20220128083309.213122-1-sakari.ailus@linux.intel.com>
 <20220128083309.213122-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220128083309.213122-2-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Jan 28, 2022 at 10:33:06AM +0200, Sakari Ailus wrote:
> Remove redundant kerneldoc documentation in mc-device.c. The functions are
> already documented in media-device.h.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-device.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index cf5e459b1d96..094647fdb866 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -608,11 +608,6 @@ static void __media_device_unregister_entity(struct media_entity *entity)
>  	entity->graph_obj.mdev = NULL;
>  }
>  
> -/**
> - * media_device_register_entity - Register an entity with a media device
> - * @mdev:	The media device
> - * @entity:	The entity
> - */

Looks good.

>  int __must_check media_device_register_entity(struct media_device *mdev,
>  					      struct media_entity *entity)
>  {
> @@ -691,16 +686,6 @@ void media_device_unregister_entity(struct media_entity *entity)
>  }
>  EXPORT_SYMBOL_GPL(media_device_unregister_entity);
>  
> -/**
> - * media_device_init() - initialize a media device
> - * @mdev:	The media device
> - *
> - * The caller is responsible for initializing the media device before
> - * registration. The following fields must be set:
> - *
> - * - dev must point to the parent device
> - * - model must be filled with the device model name

This is not captured in media-device.h. With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> - */
>  void media_device_init(struct media_device *mdev)
>  {
>  	INIT_LIST_HEAD(&mdev->entities);

-- 
Regards,

Laurent Pinchart
