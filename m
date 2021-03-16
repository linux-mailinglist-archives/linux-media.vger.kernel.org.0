Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3D333D175
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 11:11:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236501AbhCPKKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 06:10:35 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:33935 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236523AbhCPKKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 06:10:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id M6eXl184B4ywlM6eblAWQR; Tue, 16 Mar 2021 11:10:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615889421; bh=A4H/jKy6PuEINTkJ2arM93JOrTkt6/A/yu/ixrkHPig=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JEHPGKR4uoHQKotS2JSgFagRSKTJBNpGWXSt/zN4fiHY+dIgCqrWau3jqiYHPLZjF
         992C2wO9AMp8clMV9GBbxl7y1pukx+d5/M8OguV0DmoGHtF2Kv44XoP/WNn4iijODn
         5dbvRnIra+2mjG1rZnpHc5sGFVIurA/czeEY5xte+XOzl6qgA8f5+YOW2FETdjrae4
         beUpcRz2LQZNI+1Q2avAs3e5/X/OhUdpe/un7V5fZ9o0LVo5EDfz/CXir5x3zYc8YD
         TvdzE18LHsveryfV5qKZYZjNaQrHs5cfNrCJax3VaCz1S8V84f4RysnL6g206w4pEz
         2vZ8aLh6DVy8A==
Subject: Re: [PATCH v4 08/11] media: uvcvideo: Set unique vdev name based in
 type
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210315173609.1547857-1-ribalda@chromium.org>
 <20210315173609.1547857-9-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <71204460-4bba-4d3d-fb08-88ca74d4eee4@xs4all.nl>
Date:   Tue, 16 Mar 2021 11:10:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210315173609.1547857-9-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGfxtZfuJviB8U7GFENwKwca42HjNlOuC7LJMIJ60fetaqVSFviJNgs/lcr3vNRfLB4c8kb//ELHnD4OR0FtwAxgy7nrL7Wjsgf3NZFGOo6WUX7RI3fk
 8X6HTXwogl0AFJLpQ9izJjdEEOGByCY8mV8bDEas+lcx3BRvB6T7URB2cWB9vCukWOjrrS7fMuOSxfGUy36W2k5XJqFuICny9gWXz1UXf4xKF4AswdL3mOvM
 h0L80XlS40hKlsVErtWa0fTq9Nhzd4WMPwFsaMfJjaDT66F+XBwlTf6+sMmmcDDSSlHsJeJ7y7B86NHWqWorWhjSVDcfM9zdKg2xdwParysiKa8eAzMdLKUS
 MgqW3HzlVYwp4adLAaDv1X2yTa0S6j0cqL8mUArsmkWp1szK0vg=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/03/2021 18:36, Ricardo Ribalda wrote:
> All the entities must have a unique name. We can have a descriptive and
> unique name by appending the function and the entity->id.
> 
> This is even resilent to multi chain devices.
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
>  drivers/media/usb/uvc/uvc_driver.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 35873cf2773d..73ab30891845 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2163,6 +2163,7 @@ int uvc_register_video_device(struct uvc_device *dev,
>  			      const struct v4l2_ioctl_ops *ioctl_ops)
>  {
>  	int ret;
> +	const char *name;
>  
>  	/* Initialize the video buffers queue. */
>  	ret = uvc_queue_init(queue, type, !uvc_no_drop_param);
> @@ -2190,16 +2191,20 @@ int uvc_register_video_device(struct uvc_device *dev,
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>  	default:
>  		vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
> +		name = "Video capture";

capture -> Capture

>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>  		vdev->device_caps = V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STREAMING;
> +		name = "Video output";

output -> Output

>  		break;
>  	case V4L2_BUF_TYPE_META_CAPTURE:
>  		vdev->device_caps = V4L2_CAP_META_CAPTURE | V4L2_CAP_STREAMING;
> +		name = "Metadata";
>  		break;
>  	}
>  
> -	strscpy(vdev->name, dev->name, sizeof(vdev->name));
> +	snprintf(vdev->name, sizeof(vdev->name), "%s %u", name,
> +		 stream->header.bTerminalLink);
>  
>  	/*
>  	 * Set the driver data before calling video_register_device, otherwise
> 

With those changes:

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans
