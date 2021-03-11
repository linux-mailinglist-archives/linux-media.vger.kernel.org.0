Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32163375BF
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 15:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhCKObW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 09:31:22 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:50679 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233671AbhCKObK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 09:31:10 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id KMLAlPR5r5C8yKMLDlemq4; Thu, 11 Mar 2021 15:31:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615473068; bh=RPFh02Icl3EXFV0VeXw72AQNSRDvrqTnaEo+Tpgea5U=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TsuRyopstGjl2ohBmuxEY5d+riuLCRCvewmI5yca72iYJCFOVJj9mdiYhxedfxNY9
         bguHZ4OrjasSqgXLtP8jpnwMupce3ibuDi3JRj9JqT5yRrYW8fwiYb3wTR8wscGJiJ
         gZmoT0Xf/e0IGG6/lS8kQGJzHdUFL4J3iidpgFZS8TTdW964vqB2ji2uakrX46If7c
         y4ui2uSbJYIvr1IhocwGUShsSJclqrBeL8cicfWVfhj4XzraiI00ctQYotWoxBsWqO
         YvFM+AIjjDGf5sAiMlfkDbu3LlF8+s2ngUBEjC2HuwnSsQ9sK0u9YdNiTfo/WRNW0o
         JCkrwtEGH95fQ==
Subject: Re: [PATCH 10/10] media: uvcvideo: Populate only active control
 classes
To:     Ricardo Ribalda <ribalda@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
References: <20210311122040.1264410-1-ribalda@chromium.org>
 <20210311122040.1264410-12-ribalda@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f2341e0e-e9c9-a1f6-2d9f-4355e232cf4a@xs4all.nl>
Date:   Thu, 11 Mar 2021 15:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311122040.1264410-12-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJzQz5Pcd+zPDO1slDapenr7kmw+xVrwbjO0w02j2YNMAK+uNIrrlW02iKXsP8gD78ZrmIFcUSaRJGcylFFPvB7IHrUDKV5Zb7FDS1hLolKlwTOabONb
 aA1CEHmbylDGOC8mFtkGAUVRIpGKkIe/fUbJlJDk+87ioMKngz++/7rZAt2r642D/ELVDIr3RHBrQDpDREW8ZNqb30eHIiLiIVO5ymzSu6YbWZpSJQk5uiwS
 EaebGx8zWr3MQSkopGcT8Y3HYJKNBk6GQNDSmrAvNlRowhQCo79avGMjNav40pYBJ5ICzqRVWICIDL/z2szVOy7qNm5G0BmXkWoivAhYzxYSO1J3Xf2EMMIQ
 q6oav/fgb2vBvUov+LfxL0AVnt3Pp8ZtODtDlVMrpspCtM7AgLRE9qQyy+GT0+YWpi+xqT8e
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/03/2021 13:20, Ricardo Ribalda wrote:
> Do not create Control Classes for empty classes.

Shouldn't this be squashed with patch 06/10?

Regards,

	Hans

> 
> Fixes v4l2-compliance:
> 
> Control ioctls (Input 0):
> 	                fail: v4l2-test-controls.cpp(255): no controls in class 009d0000
> 	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 11 +++++++++++
>  drivers/media/usb/uvc/uvc_driver.c |  1 -
>  drivers/media/usb/uvc/uvcvideo.h   |  1 -
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 433342efc63f..5efbb3b5aa5b 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2128,6 +2128,17 @@ static int __uvc_ctrl_add_mapping(struct uvc_device *dev,
>  	if (map->set == NULL)
>  		map->set = uvc_set_le_value;
>  
> +	switch (V4L2_CTRL_ID2WHICH(map->id)) {
> +	case V4L2_CTRL_ID2WHICH(V4L2_CID_CAMERA_CLASS):
> +		dev->ctrl_class_unit->ctrl_class.bmControls[0] |=
> +						BIT(UVC_CC_CAMERA_CLASS);
> +		break;
> +	case V4L2_CTRL_ID2WHICH(V4L2_CID_USER_CLASS):
> +		dev->ctrl_class_unit->ctrl_class.bmControls[0] |=
> +						BIT(UVC_CC_USER_CLASS);
> +		break;
> +	}
> +
>  	list_add_tail(&map->list, &ctrl->info.mappings);
>  	uvc_dbg(dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
>  		map->name, ctrl->info.entity, ctrl->info.selector);
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 996e8bd06ac5..4f368ab3a1f1 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1501,7 +1501,6 @@ static int uvc_ctrl_class_parse(struct uvc_device *dev)
>  
>  	unit->ctrl_class.bControlSize = 1;
>  	unit->ctrl_class.bmControls = (u8 *)unit + sizeof(*unit);
> -	unit->ctrl_class.bmControls[0] = (1 << (UVC_CC_LAST_CLASS + 1)) - 1;
>  	unit->get_info = uvc_ctrl_class_get_info;
>  	strncpy(unit->name, "Control Class", sizeof(unit->name) - 1);
>  
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 1d59ac10c2eb..cc573d63e459 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -186,7 +186,6 @@
>   */
>  #define UVC_CC_CAMERA_CLASS	0
>  #define UVC_CC_USER_CLASS	1
> -#define UVC_CC_LAST_CLASS	UVC_CC_USER_CLASS
>  
>  /* ------------------------------------------------------------------------
>   * Driver specific constants.
> 

