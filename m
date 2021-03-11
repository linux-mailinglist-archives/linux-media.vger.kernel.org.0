Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBAE33819A
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 00:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhCKXjo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 18:39:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40260 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbhCKXjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 18:39:12 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 50BCF88F;
        Fri, 12 Mar 2021 00:39:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615505950;
        bh=fw/n3IZ4fanGGTX+wTV6jjdehOt5caL7Q4+gBp33ZjE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sE6hmjw20h2oCw7jWQGvpmJBQFEno0hFBE9UISTepPKbysHVwD0auAN005J07gJM4
         ZAiM9NTWZsTMAJqO23w9lWZNl+HBvCs46qDzHKfGSAxt3BnhB//GxlBv42y9nvpJjc
         A0Ulo6lUoE/Tcn7X1DlKLDOoegMrO/5ODvmLtpwo=
Date:   Fri, 12 Mar 2021 01:38:36 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ricardo Ribalda <ribalda@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 6/6] media: uvcvideo: Set a different name for the
 metadata entity
Message-ID: <YEqp/EkIUwOQhAN5@pendragon.ideasonboard.com>
References: <20210311221946.1319924-1-ribalda@chromium.org>
 <20210311221946.1319924-7-ribalda@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210311221946.1319924-7-ribalda@chromium.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ricardo,

Thank you for the patch.

On Thu, Mar 11, 2021 at 11:19:46PM +0100, Ricardo Ribalda wrote:
> All the entities must have a unique name.
> 
> Fixes v4l2-compliance:
> Media Controller ioctls:
>                 fail: v4l2-test-media.cpp(205): v2_entity_names_set.find(key) != v2_entity_names_set.end()
>         test MEDIA_IOC_G_TOPOLOGY: FAIL
>                 fail: v4l2-test-media.cpp(394): num_data_links != num_links
> 	test MEDIA_IOC_ENUM_ENTITIES/LINKS: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 30ef2a3110f7..47efa9a9be99 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2199,7 +2199,10 @@ int uvc_register_video_device(struct uvc_device *dev,
>  		break;
>  	}
>  
> -	strscpy(vdev->name, dev->name, sizeof(vdev->name));
> +	if (type == V4L2_BUF_TYPE_META_CAPTURE)
> +		strscpy(vdev->name, "Metadata Videodev", sizeof(vdev->name));
> +	else
> +		strscpy(vdev->name, dev->name, sizeof(vdev->name));

A UVC device could contain multiple output terminals (either in the same
chain or in different chains), which would still result in multiple
entities having the same name. Could this be fixed at the same time ?
You can use the unit ID of the output terminal to create unique names
(and it would be nice if the video and metadata nodes has similar names,
with "video" and "metadata" being the only difference between them).

>  
>  	/*
>  	 * Set the driver data before calling video_register_device, otherwise

-- 
Regards,

Laurent Pinchart
