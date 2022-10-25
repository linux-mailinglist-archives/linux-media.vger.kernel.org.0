Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD97D60D44F
	for <lists+linux-media@lfdr.de>; Tue, 25 Oct 2022 21:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbiJYTCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Oct 2022 15:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbiJYTCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Oct 2022 15:02:31 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7906F7EFC8
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 12:02:26 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id n83so15495423oif.11
        for <linux-media@vger.kernel.org>; Tue, 25 Oct 2022 12:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zWgodYHBNF4nDiZyhVUWVrRNWdYYoD9pojILnKNsciA=;
        b=hMV5FE5OHWOhNtTiu7UE085KbtFYsx5qmjGTrYfPEPfSJOK2B+UUbA5AKJjCThmXwQ
         OChuDYTojHt6IaySAGiBW1NAgwa6tHHO7zOtXQeTaSs69si/JYxzOA2AY9kcg+ubcd1B
         QNVROV3ilPNCPURppNwKxfyddCVMWUPNAV6FEwfXNjY29MPicSddJhcClgAKyIGVoc7z
         OZj0amQ2JB3biDxi/YcI2xwMC11WslVz7RmQPjOpOhXjW2d3XjF6um6lnFDf4PT0V3DL
         /jE/2upoums7WSR7Kjqpm/kViUXoSUE7nwxjCvjn5Stxj7b/EJ2wPAeviXI0XgnWZIJ6
         DG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zWgodYHBNF4nDiZyhVUWVrRNWdYYoD9pojILnKNsciA=;
        b=nFz0GdFCib140R3T9yHBSpHIXmhZWSOx6oR9FXma1f75e3odxjRLkQDloMxaDRkxQf
         QCgwIIN4T5Q6jPveaIfxY63xEa+5SgIe9G78Ldzakvpro8cwJcpHdoakAOVEVmBjS64a
         98Kzut43dgljlv449u+MGBcrtmycNmbJmkwzd2U8XcdDsqkcnK3qOZl5x/XiClGUSmj6
         Gwco/S0+kWBxtAmInqBD3+WG8JwkPm59UGjghtc1/v7Jq/lwl7QsXvzBmYynCR2kc6wG
         XIrLng4u/SL9LVUNAn58T3d0Xt997Qi6YRmR3bdPpEnepIqptFVeXrn+PgH0IPpaIMkR
         aZEA==
X-Gm-Message-State: ACrzQf2e565hOvQWYvfbP5DliYSiIOQclHJ+Tcjsq7z8zlPCXxi5lqm4
        4zFS9TKjze94/0kAdvDDjaE=
X-Google-Smtp-Source: AMsMyM5vXE4JP6Sc9Tf0kNtIyxT/LMReDIQQVy/z5ODxJ1Ge3jnabr7cyJN5IIKHvsPm4MzIOa6zrA==
X-Received: by 2002:a05:6808:11c7:b0:345:7251:7276 with SMTP id p7-20020a05680811c700b0034572517276mr19631210oiv.5.1666724545949;
        Tue, 25 Oct 2022 12:02:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g4-20020a4ab044000000b0044b0465bd07sm1411246oon.20.2022.10.25.12.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 12:02:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <36a968e1-e640-aae4-aad7-8389fca000bb@roeck-us.net>
Date:   Tue, 25 Oct 2022 12:02:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] media: uvcvideo: Factor out usb_string() calls
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
References: <20221025184724.6170-1-laurent.pinchart@ideasonboard.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221025184724.6170-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/25/22 11:47, Laurent Pinchart wrote:
> When parsing UVC descriptors to instantiate entity, the driver calls
> usb_string() to retrieve the entity name from the device, and falls back
> to a default name if the string can't be retrieved. This code pattern
> occurs multiple times. Factor it out to a separate helper function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Ricardo, Guenter, this applies on top of "media: uvcvideo: Handle errors
> from calls to usb_string". Any opinion ?

Great cleanup. Looks good to me.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>   drivers/media/usb/uvc/uvc_driver.c | 59 ++++++++++++++++++------------
>   1 file changed, 35 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index bd3716a359b0..6eb011f452e5 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -813,6 +813,27 @@ static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>   	return entity;
>   }
>   
> +static void uvc_entity_set_name(struct uvc_device *dev, struct uvc_entity *entity,
> +				const char *type_name, u8 string_id)
> +{
> +	int ret;
> +
> +	/*
> +	 * First attempt to read the entity name from the device. If the entity
> +	 * has no associated string, or if reading the string fails (most
> +	 * likely due to a buggy firmware), fall back to default names based on
> +	 * the entity type.
> +	 */
> +	if (string_id) {
> +		ret = usb_string(dev->udev, string_id, entity->name,
> +				 sizeof(entity->name));
> +		if (!ret)
> +			return;
> +	}
> +
> +	sprintf(entity->name, "%s %u", type_name, entity->id);
> +}
> +
>   /* Parse vendor-specific extensions. */
>   static int uvc_parse_vendor_control(struct uvc_device *dev,
>   	const unsigned char *buffer, int buflen)
> @@ -879,9 +900,7 @@ static int uvc_parse_vendor_control(struct uvc_device *dev,
>   					       + n;
>   		memcpy(unit->extension.bmControls, &buffer[23+p], 2*n);
>   
> -		if (buffer[24+p+2*n] == 0 ||
> -		    usb_string(udev, buffer[24+p+2*n], unit->name, sizeof(unit->name)) < 0)
> -			sprintf(unit->name, "Extension %u", buffer[3]);
> +		uvc_entity_set_name(dev, unit, "Extension", buffer[24+p+2*n]);
>   
>   		list_add_tail(&unit->list, &dev->entities);
>   		handled = 1;
> @@ -899,6 +918,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>   	struct usb_interface *intf;
>   	struct usb_host_interface *alts = dev->intf->cur_altsetting;
>   	unsigned int i, n, p, len;
> +	const char *type_name;
>   	u16 type;
>   
>   	switch (buffer[2]) {
> @@ -1004,15 +1024,14 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>   			memcpy(term->media.bmTransportModes, &buffer[10+n], p);
>   		}
>   
> -		if (buffer[7] == 0 ||
> -		    usb_string(udev, buffer[7], term->name, sizeof(term->name)) < 0) {
> -			if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA)
> -				sprintf(term->name, "Camera %u", buffer[3]);
> -			if (UVC_ENTITY_TYPE(term) == UVC_ITT_MEDIA_TRANSPORT_INPUT)
> -				sprintf(term->name, "Media %u", buffer[3]);
> -			else
> -				sprintf(term->name, "Input %u", buffer[3]);
> -		}
> +		if (UVC_ENTITY_TYPE(term) == UVC_ITT_CAMERA)
> +			type_name = "Camera";
> +		else if (UVC_ENTITY_TYPE(term) == UVC_ITT_MEDIA_TRANSPORT_INPUT)
> +			type_name = "Media";
> +		else
> +			type_name = "Input";
> +
> +		uvc_entity_set_name(dev, term, type_name, buffer[7]);
>   
>   		list_add_tail(&term->list, &dev->entities);
>   		break;
> @@ -1045,9 +1064,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>   
>   		memcpy(term->baSourceID, &buffer[7], 1);
>   
> -		if (buffer[8] == 0 ||
> -		    usb_string(udev, buffer[8], term->name, sizeof(term->name)) < 0)
> -			sprintf(term->name, "Output %u", buffer[3]);
> +		uvc_entity_set_name(dev, term, "Output", buffer[8]);
>   
>   		list_add_tail(&term->list, &dev->entities);
>   		break;
> @@ -1068,9 +1085,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>   
>   		memcpy(unit->baSourceID, &buffer[5], p);
>   
> -		if (buffer[5+p] == 0 ||
> -		    usb_string(udev, buffer[5+p], unit->name, sizeof(unit->name)) < 0)
> -			sprintf(unit->name, "Selector %u", buffer[3]);
> +		uvc_entity_set_name(dev, unit, "Selector", buffer[5+p]);
>   
>   		list_add_tail(&unit->list, &dev->entities);
>   		break;
> @@ -1099,9 +1114,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>   		if (dev->uvc_version >= 0x0110)
>   			unit->processing.bmVideoStandards = buffer[9+n];
>   
> -		if (buffer[8+n] == 0 ||
> -		    usb_string(udev, buffer[8+n], unit->name, sizeof(unit->name)) < 0)
> -			sprintf(unit->name, "Processing %u", buffer[3]);
> +		uvc_entity_set_name(dev, unit, "Processing", buffer[8+n]);
>   
>   		list_add_tail(&unit->list, &dev->entities);
>   		break;
> @@ -1128,9 +1141,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
>   		unit->extension.bmControls = (u8 *)unit + sizeof(*unit);
>   		memcpy(unit->extension.bmControls, &buffer[23+p], n);
>   
> -		if (buffer[23+p+n] == 0 ||
> -		    usb_string(udev, buffer[23+p+n], unit->name, sizeof(unit->name)) < 0)
> -			sprintf(unit->name, "Extension %u", buffer[3]);
> +		uvc_entity_set_name(dev, unit, "Extension", buffer[23+p+n]);
>   
>   		list_add_tail(&unit->list, &dev->entities);
>   		break;

