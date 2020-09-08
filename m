Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF32260EB5
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 11:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728490AbgIHJdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 05:33:06 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49304 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727995AbgIHJdF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Sep 2020 05:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599557582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TWRBEZKMCc5VGF75ZN1/AgJxL+3qKsaBfwiLkDmrWck=;
        b=GYmKkxceI0i+pov4d6JnUnHKrg6tsvY+KOVCWIkUWmY2PEtKJdEhgLxic4VjZS6v7dfn5L
        a1bzfXVnutFNkb4J81g1slajHgzGm3qRtXvH0EExEmyO91BfshT14/3x01FuN3+EzDOZDd
        S2+j1pPaAJ+g69EBHVGBtbN6PkrUCmY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-F8Ksw4HXNsSF7QFitKOx9w-1; Tue, 08 Sep 2020 05:33:01 -0400
X-MC-Unique: F8Ksw4HXNsSF7QFitKOx9w-1
Received: by mail-ej1-f72.google.com with SMTP id jz22so6484684ejb.4
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 02:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TWRBEZKMCc5VGF75ZN1/AgJxL+3qKsaBfwiLkDmrWck=;
        b=VPXsSQedZ0/3pZ1IhZAqGkcHIFTj7H5Ca4uIq0SKRm7AN144nC0vWvfqJBzbJECvul
         fpClSPp7kiTVvNCTfzWgFV5QxSiBfyqfkIpjMhXkPF+0bLZjvMY+VDqI+mehoq7vGm/c
         LyRUFxQW8YtRBCAUKGxSd1zpdoFZZwXWQDFUJ9UckOf21ZgjqUMfRTmqmgLrkY+Je3Xt
         7MxmpfIn1KuOpWRm42YQorI4mRD0lvyeSr2HBUlMMXOM4CEntLB5keciA/hAjO1s9a00
         o6BHiIUxQ7t0yAZAuASBN7unz8xpVnmTdnMb4cqvDPVhPzf577e/J9tHlPlQwrghztU9
         N/KQ==
X-Gm-Message-State: AOAM5325v9l8AEMg+VK7dPy5R7sJdPIgMP4ZnSCyNnpSVGd2GpXyMggE
        NF2ZMcajQTL9CoimX5AfZ2Z/V7MYc51cA3cmS4rkMDoys+p6TiOPeZMLfxEEmVj/DCPz+Zf2z4P
        nhQgwDoHRc6G3S/nPo+CTEys=
X-Received: by 2002:a17:906:fa8a:: with SMTP id lt10mr24474902ejb.307.1599557579879;
        Tue, 08 Sep 2020 02:32:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmxPal4Zwdn9IOiQzmqIei2WO84Yv/Jo5FJKgA4YRkRq+EbDsFl5vx5q/vfyhf72J6POOomA==
X-Received: by 2002:a17:906:fa8a:: with SMTP id lt10mr24474889ejb.307.1599557579679;
        Tue, 08 Sep 2020 02:32:59 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t10sm10432369edw.86.2020.09.08.02.32.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 02:32:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] media: uvcvideo: Fix uvc_ctrl_fixup_xu_info() not
 having any effect
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, stable@vger.kernel.org
References: <20200728112209.26207-1-hdegoede@redhat.com>
 <20200728195818.GO13753@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b393a148-12a4-e995-6ff2-a79104097776@redhat.com>
Date:   Tue, 8 Sep 2020 11:32:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728195818.GO13753@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 7/28/20 9:58 PM, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Tue, Jul 28, 2020 at 01:22:08PM +0200, Hans de Goede wrote:
>> uvc_ctrl_add_info() calls uvc_ctrl_get_flags() which will override
>> the fixed-up flags set by uvc_ctrl_fixup_xu_info().
>>
>> uvc_ctrl_init_xu_ctrl() already calls uvc_ctrl_get_flags() before
>> calling uvc_ctrl_add_info(), so the uvc_ctrl_get_flags() call in
>> uvc_ctrl_add_info() is not necessary for xu ctrls.
>>
>> This commit moves the uvc_ctrl_get_flags() call for normal controls
>> from uvc_ctrl_add_info() to uvc_ctrl_init_ctrl(), so that we no longer
>> call uvc_ctrl_get_flags() twice for xu controls and so that we no longer
>> override the fixed-up flags set by uvc_ctrl_fixup_xu_info().
>>
>> This fixes the xu motor controls not working properly on a Logitech
>> 046d:08cc, and presumably also on the other Logitech models which have
>> a quirk for this in the uvc_ctrl_fixup_xu_info() function.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The first patch in this series is a bug-fix for a real-world issue,
and I'm still not seeing this in -next, let alone in a fixed branch for Linus.

Can we get these 2 patches merged please?

Regards,

Hans



> 
>> ---
>> Changes in v2:
>> - Move the uvc_ctrl_get_flags() call for normal controls to uvc_ctrl_init_ctrl()
>> ---
>>   drivers/media/usb/uvc/uvc_ctrl.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>> index e399b9fad757..b78aba991212 100644
>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>> @@ -2024,13 +2024,6 @@ static int uvc_ctrl_add_info(struct uvc_device *dev, struct uvc_control *ctrl,
>>   		goto done;
>>   	}
>>   
>> -	/*
>> -	 * Retrieve control flags from the device. Ignore errors and work with
>> -	 * default flag values from the uvc_ctrl array when the device doesn't
>> -	 * properly implement GET_INFO on standard controls.
>> -	 */
>> -	uvc_ctrl_get_flags(dev, ctrl, &ctrl->info);
>> -
>>   	ctrl->initialized = 1;
>>   
>>   	uvc_trace(UVC_TRACE_CONTROL, "Added control %pUl/%u to device %s "
>> @@ -2253,6 +2246,13 @@ static void uvc_ctrl_init_ctrl(struct uvc_device *dev, struct uvc_control *ctrl)
>>   		if (uvc_entity_match_guid(ctrl->entity, info->entity) &&
>>   		    ctrl->index == info->index) {
>>   			uvc_ctrl_add_info(dev, ctrl, info);
>> +			/*
>> +			 * Retrieve control flags from the device. Ignore errors
>> +			 * and work with default flag values from the uvc_ctrl
>> +			 * array when the device doesn't properly implement
>> +			 * GET_INFO on standard controls.
>> +			 */
>> +			uvc_ctrl_get_flags(dev, ctrl, &ctrl->info);
>>   			break;
>>   		 }
>>   	}
> 

