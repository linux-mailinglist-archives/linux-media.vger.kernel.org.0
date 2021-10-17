Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F08430A05
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 17:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343939AbhJQP3u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 11:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237062AbhJQP3t (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 11:29:49 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F097BC06161C
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 08:27:39 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id u21so58387951lff.8
        for <linux-media@vger.kernel.org>; Sun, 17 Oct 2021 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4iOXAxtnBdxbtfsJPAKFyIDN8OvVdv96f8g6hJyajEI=;
        b=piSxSl/VZ6Z92btBz20q79WxnckIKoANm1BVgHCB9GQ4JkbaI0Lou8NBNC4456ZQYH
         vTn6uxQcJs4NfETziSp+24THlHF53jjp6EtNWaHisnRn+jSXfMCKVpBDff7gn0ok5T7x
         NhDDVxO3Vm/pwHt0dOy2vWuhhTWsRyzHPIN2vjI5MkzA5AhFpLSeBQkAIaV2kAsLQOMe
         heNWg/vz4XNYJCs8q2OfqE5u9+C34Aom8Is5rjhr1puJroi12VCNHUO+5kv8NkGSTcVC
         bqftjWnStZxrBa+uRwrNa5xowTCDnaKnI3LQESQAtg2nrJbk3z9bmD2hLRHTJcqpzbAD
         kWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4iOXAxtnBdxbtfsJPAKFyIDN8OvVdv96f8g6hJyajEI=;
        b=eqq5IIymEnV0loTKUNyP/5Jn7UyJdRTfbC9WmXo02DTG4a0nkdzbP1DIJAA4KR+CB3
         +Zg9nJ54Crn9ugOTxEAmjnszrnmrg39xwOWRhCsEMX/cOS/sxkzjOu14UbW8z5N0oyhj
         BzHNHgZvEJyV3oE3L2ADJJbjctJjRwKNfFRgFRL08tdpba5BNuf3paacVtmRGUU4k/oS
         jaXksY2K/WRIAVf+UHsMTqFxKAKCUa3oxMX0EueR6jLKcWt+beXtmsl1+5m2mJP/g3IC
         FEVpW/7YrErUAhUrt98M9BkUMVXzf7xvkbA1h29+2URzuLjx5liWRJWeT5JlenhndJCo
         yqiw==
X-Gm-Message-State: AOAM530vDknJgT/YG0qWTJbYbG3bwwNvN8X+WHusPAnZW8eMP0QCiAIS
        YQ6597NJmas46OLgSXBhcqeMCnbYZts=
X-Google-Smtp-Source: ABdhPJydzma5Ye9hrF/UTugrBnmwxKYpnN0hTyPnkuRcpl9lvcNEeCrNfH1118HVyy3r6AioeTv7GQ==
X-Received: by 2002:a05:6512:3d88:: with SMTP id k8mr24337774lfv.137.1634484458115;
        Sun, 17 Oct 2021 08:27:38 -0700 (PDT)
Received: from ?IPv6:2a00:1370:8125:c9ee:24d8:26d5:4ca6:4b98? ([2a00:1370:8125:c9ee:24d8:26d5:4ca6:4b98])
        by smtp.googlemail.com with ESMTPSA id d17sm1130835lfg.190.2021.10.17.08.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 08:27:37 -0700 (PDT)
From:   "Yuriy M. Kaminskiy" <yumkam@gmail.com>
Subject: Re: [PATCH 1/1] media: uvcvideo: Add quirk for exponential exposure
To:     Scott K Logan <logans@cottsay.net>
Cc:     subscribers-only <linux-uvc-devel@lists.sourceforge.net>,
        linux-media@vger.kernel.org
References: <20211003023554.885815-1-logans@cottsay.net>
 <20211003023554.885815-2-logans@cottsay.net>
Message-ID: <04052599-3fd8-1a36-d0b9-f82fd16cce26@gmail.com>
Date:   Sun, 17 Oct 2021 15:27:36 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0
MIME-Version: 1.0
In-Reply-To: <20211003023554.885815-2-logans@cottsay.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/03/21 02:37 , Scott K Logan wrote:
> At least some of the Microsoft LifeCam series of webcams exhibit a
> behavior which requires a 'quirk' to be handled properly. When
> configuring the absolute exposure value of the image, there are only a
> handful of values which will result in a consistent change to the image
> exposure, while all other values appear to result in a maximum
> exposure.
> The valid values appear to follow an exponential pattern from the
> maximum value (10000) down to the minimum, yielding less than 15
> possible values depending on the device's reported minimum.

FTR, I have not tested patch (yet), but I checked

  idVendor           0x045e Microsoft Corp.
  idProduct          0x0810 LifeCam HD-3000
  bcdDevice            1.08
  iManufacturer           1 
  iProduct                2 
  iSerial                 0 

and it exhibit same behavior (only (1e4>>i) works, other values
interpreted as max), so you may want to add chunk below

> Signed-off-by: Scott K Logan <logans@cottsay.net>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c   | 41 ++++++++++++++++++++++++++++++
>  drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++++++
>  drivers/media/usb/uvc/uvcvideo.h   |  1 +
>  3 files changed, 60 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 30bfe9069a1f..2dfc70597858 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -2142,6 +2142,40 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  	return 0;
>  }
>  
> +/* --------------------------------------------------------------------------
> + * Quirks
> + */
> +
> +static s32 uvc_ctrl_get_abs_exposure_exponential(
> +	struct uvc_control_mapping *mapping, u8 query, const u8 *data)
> +{
> +	s32 i;
> +	s32 value = uvc_get_le_value(mapping, query, data);
> +
> +	switch (query) {
> +	case UVC_GET_CUR:
> +	case UVC_GET_MIN:
> +	case UVC_GET_MAX:
> +	case UVC_GET_DEF:
> +		for (i = 0; i < 14; ++i) {
> +			if (10000 >> i <= value)
> +				break;
> +		}
> +		return 14 - i;
> +	case UVC_GET_RES:
> +		return 1;
> +	default:
> +		return value;
> +	}
> +}
> +
> +static void uvc_ctrl_set_abs_exposure_exponential(
> +	struct uvc_control_mapping *mapping, s32 value, u8 *data)
> +{
> +	value = 10000 >> (14 - value);
> +	uvc_set_le_value(mapping, value, data);
> +}
> +
>  /* --------------------------------------------------------------------------
>   * Control and mapping handling
>   */
> @@ -2210,6 +2244,13 @@ static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
>  		}
>  	}
>  
> +	if ((chain->dev->quirks & UVC_QUIRK_EXPONENTIAL_EXPOSURE) &&
> +	    ctrl->info.selector == UVC_CT_EXPOSURE_TIME_ABSOLUTE_CONTROL) {
> +		uvc_dbg(chain->dev, CONTROL, "Applying exponential exposure quirk\n");
> +		map->get = uvc_ctrl_get_abs_exposure_exponential;
> +		map->set = uvc_ctrl_set_abs_exposure_exponential;
> +	}
> +
>  	list_add_tail(&map->list, &ctrl->info.mappings);
>  	uvc_dbg(chain->dev, CONTROL, "Adding mapping '%s' to control %pUl/%u\n",
>  		uvc_map_get_name(map), ctrl->info.entity,
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7c007426e082..fa34802dfb33 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -2718,6 +2718,24 @@ static const struct usb_device_id uvc_ids[] = {
>  	  .bInterfaceSubClass	= 1,
>  	  .bInterfaceProtocol	= 0,
>  	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },
> +	/* Microsoft Lifecam HD-5000 */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x045e,
> +	  .idProduct		= 0x076d,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },

+	/* Microsoft Lifecam HD-3000 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x045e,
+	  .idProduct		= 0x0810,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },

> +	/* Microsoft Lifecam Studio */
> +	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
> +				| USB_DEVICE_ID_MATCH_INT_INFO,
> +	  .idVendor		= 0x045e,
> +	  .idProduct		= 0x0772,
> +	  .bInterfaceClass	= USB_CLASS_VIDEO,
> +	  .bInterfaceSubClass	= 1,
> +	  .bInterfaceProtocol	= 0,
> +	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_EXPONENTIAL_EXPOSURE) },
>  	/* Logitech Quickcam Fusion */
>  	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
>  				| USB_DEVICE_ID_MATCH_INT_INFO,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 2e5366143b81..b6d5ae0b1c90 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -209,6 +209,7 @@
>  #define UVC_QUIRK_RESTORE_CTRLS_ON_INIT	0x00000400
>  #define UVC_QUIRK_FORCE_Y8		0x00000800
>  #define UVC_QUIRK_FORCE_BPP		0x00001000
> +#define UVC_QUIRK_EXPONENTIAL_EXPOSURE	0x00002000
>  
>  /* Format flags */
>  #define UVC_FMT_FLAG_COMPRESSED		0x00000001
> -- 
>
> 2.31.1
