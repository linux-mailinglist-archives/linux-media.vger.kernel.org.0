Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B796CF238
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 20:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjC2Shc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 14:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjC2Sha (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 14:37:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE052108
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 11:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680115003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hngQVU0oLMQxvv+u8vuy/0tao+EP9VOUUrq5Ry57HH0=;
        b=NfawVM0UTrCFNn4aijnuwGS0LbdxcPKUgBJE9lISadnSPcJgyi7UeVvJulNVcaY23ZYKql
        96OIxqfNmmR1EycKIjCshA9RFV1xJwqLO4byXlvmccKQFChKwivh2mrbfIegFEN5g8c5uo
        olvngEOtPPTzBmmB24fC0n5ZU8vrKUk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-sn7DrJLAPwaOxqYiWca-hg-1; Wed, 29 Mar 2023 14:36:36 -0400
X-MC-Unique: sn7DrJLAPwaOxqYiWca-hg-1
Received: by mail-ed1-f71.google.com with SMTP id t14-20020a056402240e00b004fb36e6d670so23457585eda.5
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 11:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680114996;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hngQVU0oLMQxvv+u8vuy/0tao+EP9VOUUrq5Ry57HH0=;
        b=i0uw+uGKJaj3SXvjgS7fjIb6HMlVjtiiZXYNjI7Sw9/PAEh0vQSowGcsihf2GfZNzK
         e14asVTvqMozaeZOeUiFr/Kn87MHjRaJVRQmCWJ6vtzvQ8mTXWGEjVSfRw9nUfMSHw92
         Bm7i5L795bwZWmtOa4ykf682dLLZLvZnloFxsrL7mvjrclNeCmlWrANkZJ0l1BogyFVl
         7eX29tZiMm5VOylUFZ6UVlSASp0isbX80rdi5I1G0SX3QhvOdxwU9STaJHqdRZ6k8VjZ
         rX99qEAD3YYIjBitPvBbdIAp+8EJguVFhmRr7xYND86Hr24AtSDepF8T9EbZy3A0UOzj
         DFGw==
X-Gm-Message-State: AAQBX9cP0sXbAEuZMa0nSzOUMy71ZYWa1MWwQOBLhe3Tmbmmy8Obm+KL
        NfbgcbnWvMGBZbvvbCw2S6JdLL5wrO3JOMCkviGaoCR3mLOpLyC3BkherEpM7vgv2uSb5F9ztY9
        y8GmBvMRtQYM9v94yBuGKXHM=
X-Received: by 2002:aa7:d806:0:b0:4fc:3777:f630 with SMTP id v6-20020aa7d806000000b004fc3777f630mr20222277edq.0.1680114995917;
        Wed, 29 Mar 2023 11:36:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgAX3gSQ0Z/vFKnB7klGJAaJ5a7qzVG7cAkRa+s694WTIbr4FbtGfu5jYyUuzo6PEfwjSlBw==
X-Received: by 2002:aa7:d806:0:b0:4fc:3777:f630 with SMTP id v6-20020aa7d806000000b004fc3777f630mr20222267edq.0.1680114995671;
        Wed, 29 Mar 2023 11:36:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m10-20020a50998a000000b004e48f8df7e2sm17522994edb.72.2023.03.29.11.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 11:36:34 -0700 (PDT)
Message-ID: <ffdf7e17-580c-ed13-c37a-bd795e116427@redhat.com>
Date:   Wed, 29 Mar 2023 20:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: usb: uvc: fill in description for unknown
 pixelformats
Content-Language: en-US, nl
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     regressions@lists.linux.dev,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
References: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4b1bc0d5-808b-816d-d7de-5baa8851e74f@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 3/29/23 14:28, Hans Verkuil wrote:
> If the fcc is 0 (indicating an unknown GUID format), then fill in the
> description field in ENUM_FMT. Otherwise the V4L2 core will WARN.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Fixes: 50459f103edf ("media: uvcvideo: Remove format descriptions")

Thanks, patch looks good to me:

FWIW:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 7aefa76a42b3..2f1ced1212cd 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -256,6 +256,9 @@ static int uvc_parse_format(struct uvc_device *dev,
>  		} else {
>  			dev_info(&streaming->intf->dev,
>  				 "Unknown video format %pUl\n", &buffer[5]);
> +			snprintf(format->name, sizeof(format->name), "%pUl\n",
> +				 &buffer[5]);
> +
>  			format->fcc = 0;
>  		}
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 35453f81c1d9..fc6f9e7d8506 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -713,6 +713,10 @@ static int uvc_ioctl_enum_fmt(struct uvc_streaming *stream,
>  	if (format->flags & UVC_FMT_FLAG_COMPRESSED)
>  		fmt->flags |= V4L2_FMT_FLAG_COMPRESSED;
>  	fmt->pixelformat = format->fcc;
> +	if (format->name[0])
> +		strscpy(fmt->description, format->name,
> +			sizeof(fmt->description));
> +
>  	return 0;
>  }
> 
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 9a596c8d894a..22656755a801 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -264,6 +264,8 @@ struct uvc_format {
>  	u32 fcc;
>  	u32 flags;
> 
> +	char name[32];
> +
>  	unsigned int nframes;
>  	struct uvc_frame *frame;
>  };
> 

