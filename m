Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED9E1701BD
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgBZPAO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:00:14 -0500
Received: from retiisi.org.uk ([95.216.213.190]:45628 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726345AbgBZPAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:00:14 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 285D4634C89;
        Wed, 26 Feb 2020 16:59:00 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1j6y9M-0002KL-P0; Wed, 26 Feb 2020 16:59:00 +0200
Date:   Wed, 26 Feb 2020 16:59:00 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2-core: fix entity initialization in
 device_register_subdev
Message-ID: <20200226145900.GL5023@valkosipuli.retiisi.org.uk>
References: <20200226121545.19880-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226121545.19880-1-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Wed, Feb 26, 2020 at 02:15:45PM +0200, Eugen Hristev wrote:
> The check for parameters is done below in the function.
> Initialize the entity variable properly, after the parameters
> have been checked.
> 
> Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/media/v4l2-core/v4l2-device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
> index 63d6b147b21e..6e33132ebb19 100644
> --- a/drivers/media/v4l2-core/v4l2-device.c
> +++ b/drivers/media/v4l2-core/v4l2-device.c
> @@ -112,7 +112,7 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
>  				struct v4l2_subdev *sd)
>  {
>  #if defined(CONFIG_MEDIA_CONTROLLER)
> -	struct media_entity *entity = &sd->entity;
> +	struct media_entity *entity;
>  #endif
>  	int err;
>  
> @@ -141,6 +141,7 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
>  		goto error_module;
>  
>  #if defined(CONFIG_MEDIA_CONTROLLER)
> +	entity = &sd->entity;
>  	/* Register the entity. */
>  	if (v4l2_dev->mdev) {
>  		err = media_device_register_entity(v4l2_dev->mdev, entity);

Thanks for the patch.

Instead of keeping a shorthand for entity locally, I'd just refer to
&sd->entity. It's more simple, and gets away with one pair of #if / #endif
as well.

-- 
Regards,

Sakari Ailus
