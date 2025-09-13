Return-Path: <linux-media+bounces-42484-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 295D5B56133
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 15:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 782011BC4EB2
	for <lists+linux-media@lfdr.de>; Sat, 13 Sep 2025 13:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B9C2EFD8F;
	Sat, 13 Sep 2025 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u9bKJf8K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E17182B4;
	Sat, 13 Sep 2025 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757770965; cv=none; b=YCdtAcXAnD5/BI0hgQZ9yAgygZxGwBZTidztpHRNplPwtzJNPBVGUYlhxv80jqL11rkpOoUMUz+bup7b6h/4TkUhZ4I8ekgdXYKwxKdzloBBTMTGujL96tESKyYDb74S8SmuL8+fEI7e2Q+j03rKBY8uXCTqfmzkIV8w/jHK/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757770965; c=relaxed/simple;
	bh=nLO1F8+f5KOWc4rLVGDrhuASC8iN5AllB+IaQ48VKMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0ZJEHMZDLQ4wBMCtXYjf0SGLBWgjsvpFIs+h43BkZG2MAV2TdfTLGUDQaMNzElslPJvbcb3IJt8XNxI9fTiR0gFa+j7RRFMAfjK4F8CocCrb9xqUiJ2SQwhkKSpoWQOq2L+krWE/KJ7YSCpEcjar9K8B2g6t7rn6x44cc0c/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u9bKJf8K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5720E6F3;
	Sat, 13 Sep 2025 15:41:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757770885;
	bh=nLO1F8+f5KOWc4rLVGDrhuASC8iN5AllB+IaQ48VKMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9bKJf8KXJuQ+Ly/3qOXIlTGLpGdkCj8vskYd0elr4fwROmyR0JlDBTt1KaPcENgF
	 YpK8LVcvZw0xwHgBvqb7EflCXMEilfW2xcR6+jD70N3o56Ad/xKcJ8/OOzFveboaW+
	 GtG6bDI5pfqdiyFQ4VgXv8qfeTuwS/OTyDFFUgls=
Date: Sat, 13 Sep 2025 16:42:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/4] media: uvcvideo: Run uvc_ctrl_init_ctrl for all
 controls
Message-ID: <20250913134216.GA10328@pendragon.ideasonboard.com>
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
 <20250818-uvc-iq-switch-v1-3-f7ea5e740ddd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250818-uvc-iq-switch-v1-3-f7ea5e740ddd@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, Aug 18, 2025 at 08:15:38PM +0000, Ricardo Ribalda wrote:
> The function uvc_ctrl_init_ctrl() is called for every control for every
> entity, but it exits early if the entity is a extension unit. The comment
> claims that this is done to avoid querying XU controls during probe.
> 
> We only query a control if its entity GUIDs and index matches the
> uvc_ctrls list. There are only controls for the following GUIDs:
> UVC_GUID_UVC_PROCESSING, UVC_GUID_UVC_CAMERA and
> UVC_GUID_EXT_GPIO_CONTROLLER.
> 
> In other words, XU controls will not be queried even without this
> condition.

Looking at the commit that introduced this code

commit 52c58ad6f95ff60343bf0c517182d5f649ca0403
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Wed Sep 29 16:03:03 2010 -0300

    [media] uvcvideo: Delay initialization of XU controls

we see it contains the following change

-       /* Query XU controls for control information */
-       if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT) {
-               struct uvc_control_info info;
-               int ret;
-
-               ret = uvc_ctrl_fill_xu_info(dev, ctrl, &info);
-               if (ret < 0)
-                       return;
-
-               ret = uvc_ctrl_add_info(dev, ctrl, &info);
-               if (ret < 0) {
-                       /* Skip the control */
-                       uvc_trace(UVC_TRACE_CONTROL, "Failed to initialize "
-                               "control %pUl/%u on device %s entity %u\n",
-                               info.entity, info.selector, dev->udev->devpath,
-                               ctrl->entity->id);
-                       memset(ctrl, 0, sizeof(*ctrl));
-               }
+       /* XU controls initialization requires querying the device for control
+        * information. As some buggy UVC devices will crash when queried
+        * repeatedly in a tight loop, delay XU controls initialization until
+        * first use.
+        */
+       if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
                return;
-       }


This is followed by

        for (; info < iend; ++info) {
                if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
                    ctrl->index == info->index) {
                        uvc_ctrl_add_info(dev, ctrl, info);
                        break;
                 }
        }

        if (!ctrl->initialized)
                return;

(this loops over uvc_ctrls). As uvc_ctrls doesn't contain any non-XU
control, you're right that the function never calls uvc_ctrl_add_info()
for XU controls. The ctrl->initialized check then causes the function to
return, as uvc_ctrl_add_info() wasn't called and initialized is false.
The entity type check was therefore not needed, and can be removed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> In future patches we want to add ChromeOS XU controls that need to the
> initialized. We will make sure that all cameras with ChromeOS XU can
> be queried at probe time.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index efe609d7087752cb2ef516eef0fce12acd13e747..ff975f96e1325532e2299047c07de5d1b9cf09db 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -3181,15 +3181,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
>  {
>  	unsigned int i;
>  
> -	/*
> -	 * XU controls initialization requires querying the device for control
> -	 * information. As some buggy UVC devices will crash when queried
> -	 * repeatedly in a tight loop, delay XU controls initialization until
> -	 * first use.
> -	 */
> -	if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
> -		return;
> -
>  	for (i = 0; i < ARRAY_SIZE(uvc_ctrls); ++i) {
>  		const struct uvc_control_info *info = &uvc_ctrls[i];
>  

-- 
Regards,

Laurent Pinchart

