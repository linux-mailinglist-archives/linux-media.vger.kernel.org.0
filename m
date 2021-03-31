Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE4034FE2F
	for <lists+linux-media@lfdr.de>; Wed, 31 Mar 2021 12:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbhCaKiR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Mar 2021 06:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20679 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234976AbhCaKiM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Mar 2021 06:38:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617187092;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s8qO9aJt1Ewg4CxvO0dgmRB96mWbB/RaImJrf7xnxKc=;
        b=a74IkMBYhUkYqUjmgfmvK3NcFYO8aXr/38m5oEXLG4jfQdt0WlKShy0+dmoecYnPWevjcd
        KjxWvaAtH/aDFXnGLxTNZxWSFtm6AF0avuME/eu/9ncDcH+tB4mC20hWGulgxPm84n+E+n
        6sS44UwaPcmqtLRN72i4YtW6vKQaZ8w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-pCQAnPFNOIi28tNLSbXQBQ-1; Wed, 31 Mar 2021 06:38:09 -0400
X-MC-Unique: pCQAnPFNOIi28tNLSbXQBQ-1
Received: by mail-ed1-f71.google.com with SMTP id q25so869467eds.16
        for <linux-media@vger.kernel.org>; Wed, 31 Mar 2021 03:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s8qO9aJt1Ewg4CxvO0dgmRB96mWbB/RaImJrf7xnxKc=;
        b=HqaneDBnOg//S0vvdOmWmUdFtb43oT8ZQww2qzB/CtyfOe6Iel+5nIvmUYoaJ0Aeat
         4VMmR7/xU5Z1f4FsMi0sENcXhgiyPZ0XO7BQs8C9XcE3heWEnYlSMygScK2HS0NGD3KU
         BoOvHTUPbLEYZ7gcJvpabUrm+0WJ5JsPfxwXitPihcogKYd4aO6I3sTpcze6KB/eDbop
         B6uS0VAXncPQ95gdj2vnJSzok1ktaQKxKi9OAawoIlF7k8NMcgEIDMQoUu12OhePCYyH
         zfMVzw66Fa604ZhZm0fllGANuzdo7e+MxmJFXxLb2Bj86SXF1DlfN3olxe7LE0+2+YXi
         amVw==
X-Gm-Message-State: AOAM5322mW3TBXRW5CnPAx4jOj8RmSGSKN3u+MocSG5g62F7sg8oYrwy
        5rJ5oUdCS7DwthCi11l80CSrKku42we8RfFSLjqcQOO/QnOELSF4EhNZNEiv67lxsJ+C3RGLoYY
        hkOZyUSpoWfR5owWeU7xJVZY=
X-Received: by 2002:a17:906:32da:: with SMTP id k26mr2748535ejk.483.1617187088655;
        Wed, 31 Mar 2021 03:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk2b+1jNoZ3mhDq+p41B7mHh8KTNyIJJKszk3McLRMkfCxf0HXpumEjZc25f/96dU8IoOC5g==
X-Received: by 2002:a17:906:32da:: with SMTP id k26mr2748519ejk.483.1617187088500;
        Wed, 31 Mar 2021 03:38:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id s20sm1237339edu.93.2021.03.31.03.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Mar 2021 03:38:07 -0700 (PDT)
Subject: Re: [PATCH 1/1] media: uvcvideo: Support devices that report an OT as
 an entity source
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, John Nealy <jnealy3@yahoo.com>
References: <20210308103128.33173-1-hdegoede@redhat.com>
 <20210308103128.33173-2-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7974a22b-8b84-845e-4d2c-3650254a1a86@redhat.com>
Date:   Wed, 31 Mar 2021 12:38:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308103128.33173-2-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

On 3/8/21 11:31 AM, Hans de Goede wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Some devices reference an output terminal as the source of extension
> units. This is incorrect, as output terminals only have an input pin,
> and thus can't be connected to any entity in the forward direction. The
> resulting topology would cause issues when registering the media
> controller graph. To avoid this problem, connect the extension unit to
> the source of the output terminal instead.
> 
> While at it, and while no device has been reported to be affected by
> this issue, also handle forward scans where two output terminals would
> be connected together, and skip the terminals found through such an
> invalid connection.
> 
> Reported-and-tested-by: John Nealy <jnealy3@yahoo.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Ping? This is a bug-fix which fixes a WARN triggering, causing many
users to see a backtrace in their kernel-logs and reporting bugs about this:

https://bugzilla.redhat.com/buglist.cgi?quicksearch=mc-entity.c

Currently shows 12 open bugs for this and this is not counting all the
ones which have already been triaged and matched as dups.

As such it would be really good if we can get this merged and on
its way to 5.12-rc# as a fix for 5.12 (and to be backported to the
stable series).

Regards,

Hans




> ---
>  drivers/media/usb/uvc/uvc_driver.c | 32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index 30ef2a3110f7..8df58f04dac6 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -1716,6 +1716,31 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  				return -EINVAL;
>  			}
>  
> +			/*
> +			 * Some devices reference an output terminal as the
> +			 * source of extension units. This is incorrect, as
> +			 * output terminals only have an input pin, and thus
> +			 * can't be connected to any entity in the forward
> +			 * direction. The resulting topology would cause issues
> +			 * when registering the media controller graph. To
> +			 * avoid this problem, connect the extension unit to
> +			 * the source of the output terminal instead.
> +			 */
> +			if (UVC_ENTITY_IS_OTERM(entity)) {
> +				struct uvc_entity *source;
> +
> +				source = uvc_entity_by_id(chain->dev,
> +							  entity->baSourceID[0]);
> +				if (!source) {
> +					uvc_dbg(chain->dev, DESCR,
> +						"Can't connect extension unit %u in chain\n",
> +						forward->id);
> +					break;
> +				}
> +
> +				forward->baSourceID[0] = source->id;
> +			}
> +
>  			list_add_tail(&forward->chain, &chain->entities);
>  			if (!found)
>  				uvc_dbg_cont(PROBE, " (->");
> @@ -1735,6 +1760,13 @@ static int uvc_scan_chain_forward(struct uvc_video_chain *chain,
>  				return -EINVAL;
>  			}
>  
> +			if (UVC_ENTITY_IS_OTERM(entity)) {
> +				uvc_dbg(chain->dev, DESCR,
> +					"Unsupported connection between output terminals %u and %u\n",
> +					entity->id, forward->id);
> +				break;
> +			}
> +
>  			list_add_tail(&forward->chain, &chain->entities);
>  			if (!found)
>  				uvc_dbg_cont(PROBE, " (->");
> 

