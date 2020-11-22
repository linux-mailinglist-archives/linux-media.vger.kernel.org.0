Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1392BC5E0
	for <lists+linux-media@lfdr.de>; Sun, 22 Nov 2020 14:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgKVNsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Nov 2020 08:48:36 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:35488 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726436AbgKVNsf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Nov 2020 08:48:35 -0500
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id 428E2140432
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2020 06:48:34 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id gpjFkUy1IwNNlgpjGkiOdk; Sun, 22 Nov 2020 06:48:34 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=BoezP7f5 c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=_jlGtV7tAAAA:8
 a=hrORAqPlbJHNPmEiJF4A:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3eks95+d1UMwOrtiT/3LHNDTtKeS4LAVq5b8db4eTaA=; b=CE0/QpV9VEirNL+X2UynE4EnnR
        NQRitVCD4ztabBD7bkEzXOTFG1cuSLRxaCEE81BLKnI5CNjwaKJK2zfyMmzU5FjCwZvoz7/BbeOse
        tZeCrLk541XEsskqFfD97kIs41XS4ZgYieqJbblOH6kOrfbvZfmWqyCEWKtd6wS9g9cDGaTYAYt9h
        3vYkCMnywcfuGiCm2u8nKn06lMlh7l3A45H2OsVYiYO/vQ+y88lwc0MUn5GKugB97R9F0BPDCASf/
        EPO3pjkc1eugfHtHkwit41cLBRUAgQ57lcoqVfmy1vE4j8r3jOUBD0d3PCgs49BMfQsKKCsTTKpQI
        +FPMg9XQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44640 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kgpjF-002p32-8q; Sun, 22 Nov 2020 13:48:33 +0000
Date:   Sun, 22 Nov 2020 05:48:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Handle errors from calls to usb_string
Message-ID: <20201122134832.GA4851@roeck-us.net>
References: <20201112181716.194080-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112181716.194080-1-linux@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kgpjF-002p32-8q
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:44640
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ping ...

On Thu, Nov 12, 2020 at 10:17:16AM -0800, Guenter Roeck wrote:
> On a Webcam from Quanta, we see the following error.
> 
> usb 3-5: New USB device found, idVendor=0408, idProduct=30d2, bcdDevice= 0.03
> usb 3-5: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> usb 3-5: Product: USB2.0 HD UVC WebCam
> usb 3-5: Manufacturer: Quanta
> usb 3-5: SerialNumber: 0x0001
> ...
> uvcvideo: Found UVC 1.10 device USB2.0 HD UVC WebCam (0408:30d2)
> uvcvideo: Failed to initialize entity for entity 5
> uvcvideo: Failed to register entities (-22).
> 
> The Webcam reports an entity of type UVC_VC_EXTENSION_UNIT. It reports a
> string index of '7' associated with that entity. The attempt to read that
> string from the camera fails with error -32 (-EPIPE). usb_string() returns
> that error, but it is ignored. As result, the entity name is empty. This
> later causes v4l2_device_register_subdev() to return -EINVAL, and no
> entities are registered as result.
> 
> While this appears to be a firmware problem with the camera, the kernel
> should still handle the situation gracefully. To do that, check the return
> value from usb_string(). If it reports an error, assign the entity's
> default name.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 48 ++++++++++++------------------
>  1 file changed, 19 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index ddb9eaa11be7..15f5a0673237 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1118,10 +1118,8 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>  					       + n;
>  		memcpy(unit->extension.bmControls, &buffer[23+p], 2*n);
>  
> -		if (buffer[24+p+2*n] != 0)
> -			usb_string(udev, buffer[24+p+2*n], unit->name,
> -				   sizeof(unit->name));
> -		else
> +		if (buffer[24+p+2*n] == 0 ||
> +		    usb_string(udev, buffer[24+p+2*n], unit->name, sizeof(unit->name)) < 0)
>  			sprintf(unit->name, "Extension %u", buffer[3]);
>  
>  		list_add_tail(&unit->list, &dev->entities);
> @@ -1246,15 +1244,15 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  			memcpy(term->media.bmTransportModes, &buffer[10+n], p);
>  		}
>  
> -		if (buffer[7] != 0)
> -			usb_string(udev, buffer[7], term->name,
> -				   sizeof(term->name));
> -		else if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA)
> -			sprintf(term->name, "Camera %u", buffer[3]);
> -		else if (UVC_ENTITY_TYPE(term) == UVC_ITT_MEDIA_TRANSPORT_INPUT)
> -			sprintf(term->name, "Media %u", buffer[3]);
> -		else
> -			sprintf(term->name, "Input %u", buffer[3]);
> +		if (buffer[7] == 0 ||
> +		    usb_string(udev, buffer[7], term->name, sizeof(term->name)) < 0) {
> +			if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA)
> +				sprintf(term->name, "Camera %u", buffer[3]);
> +			if (UVC_ENTITY_TYPE(term) == UVC_ITT_MEDIA_TRANSPORT_INPUT)
> +				sprintf(term->name, "Media %u", buffer[3]);
> +			else
> +				sprintf(term->name, "Input %u", buffer[3]);
> +		}
>  
>  		list_add_tail(&term->list, &dev->entities);
>  		break;
> @@ -1286,10 +1284,8 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  
>  		memcpy(term->baSourceID, &buffer[7], 1);
>  
> -		if (buffer[8] != 0)
> -			usb_string(udev, buffer[8], term->name,
> -				   sizeof(term->name));
> -		else
> +		if (buffer[8] == 0 ||
> +		    usb_string(udev, buffer[8], term->name, sizeof(term->name)) < 0)
>  			sprintf(term->name, "Output %u", buffer[3]);
>  
>  		list_add_tail(&term->list, &dev->entities);
> @@ -1311,10 +1307,8 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  
>  		memcpy(unit->baSourceID, &buffer[5], p);
>  
> -		if (buffer[5+p] != 0)
> -			usb_string(udev, buffer[5+p], unit->name,
> -				   sizeof(unit->name));
> -		else
> +		if (buffer[5+p] == 0 ||
> +		    usb_string(udev, buffer[5+p], unit->name, sizeof(unit->name)) < 0)
>  			sprintf(unit->name, "Selector %u", buffer[3]);
>  
>  		list_add_tail(&unit->list, &dev->entities);
> @@ -1344,10 +1338,8 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		if (dev->uvc_version >= 0x0110)
>  			unit->processing.bmVideoStandards = buffer[9+n];
>  
> -		if (buffer[8+n] != 0)
> -			usb_string(udev, buffer[8+n], unit->name,
> -				   sizeof(unit->name));
> -		else
> +		if (buffer[8+n] == 0 ||
> +		    usb_string(udev, buffer[8+n], unit->name, sizeof(unit->name)) < 0)
>  			sprintf(unit->name, "Processing %u", buffer[3]);
>  
>  		list_add_tail(&unit->list, &dev->entities);
> @@ -1375,10 +1367,8 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>  		unit->extension.bmControls = (u8 *)unit + sizeof(*unit);
>  		memcpy(unit->extension.bmControls, &buffer[23+p], n);
>  
> -		if (buffer[23+p+n] != 0)
> -			usb_string(udev, buffer[23+p+n], unit->name,
> -				   sizeof(unit->name));
> -		else
> +		if (buffer[23+p+n] == 0 ||
> +		    usb_string(udev, buffer[23+p+n], unit->name, sizeof(unit->name)) < 0)
>  			sprintf(unit->name, "Extension %u", buffer[3]);
>  
>  		list_add_tail(&unit->list, &dev->entities);
> -- 
> 2.17.1
> 
