Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E963224C25B
	for <lists+linux-media@lfdr.de>; Thu, 20 Aug 2020 17:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729034AbgHTPiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 11:38:52 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:52829 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728622AbgHTPiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 11:38:51 -0400
Received: by mail-pj1-f68.google.com with SMTP id kr4so1130724pjb.2
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2020 08:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zdwKW1CjRrIglBMIO9o4XAsume0MxCq9sQmXonoEhLU=;
        b=b/QTL64/Bt505lv6ie5V9oR6I8x8PIdx5AHOAhjqC8CWxSExW3DePOUfsxnLD+lK5z
         IzCQdge9jdQlgFNreabWjiXu/9OeiaTQToRk/lYFJDpi6LgMFAt5t5tdyxvOzo6bZDfQ
         ST8SdK2zh+DeSePOcxL4yTlbfuRiGgMDVC6dBuyOfHBBIS3KTqKXvJUPPFvY7GGT3ec1
         BQxg6rX8rUyZ0ihHmtuwfoxUDaBfUmrj0JY8tY8TlowqCEFHkb27l30XzRTnesYt3GF2
         Ftx8hZDmdwZlhpFqoFrGAqGedNbTMapedNtkNpDpMyXpPTeT06wQbM8TUh9gnZ5RvX2/
         TCqw==
X-Gm-Message-State: AOAM533N1yuY8bZpNa2Ih4ocXnfgEugE0R6XAp6prun55eZhRgDfEByy
        fbM0IBlhCgU5AiPbvpm2fPE=
X-Google-Smtp-Source: ABdhPJxr2y1JsRThdYJmysQKMQgMCDJm6l8ccrP1/pItgZI5yoGAM/XCTcwumUHD933sQSocltFr9g==
X-Received: by 2002:a17:902:cb91:: with SMTP id d17mr2924772ply.223.1597937930269;
        Thu, 20 Aug 2020 08:38:50 -0700 (PDT)
Received: from [192.168.50.110] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id w82sm3373210pff.7.2020.08.20.08.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 08:38:49 -0700 (PDT)
Subject: Re: [PATCH] media: uvc: Silence shift-out-of-bounds warning
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
References: <20200818235406.GE2360@pendragon.ideasonboard.com>
 <20200819000340.11616-1-laurent.pinchart@ideasonboard.com>
 <68984fef-1e18-9394-9e68-becabf83c85f@acm.org>
 <20200820103746.GD6593@pendragon.ideasonboard.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <f6c0ef92-866d-3e4e-8b0a-ad2fe42717e6@acm.org>
Date:   Thu, 20 Aug 2020 08:38:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820103746.GD6593@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/20/20 3:37 AM, Laurent Pinchart wrote:
> Hi Bart,
> 
> On Wed, Aug 19, 2020 at 08:25:27PM -0700, Bart Van Assche wrote:
>> On 2020-08-18 17:03, Laurent Pinchart wrote:
>>> UBSAN reports a shift-out-of-bounds warning in uvc_get_le_value(). The
>>> report is correct, but the issue should be harmless as the computed
>>> value isn't used when the shift is negative. This may however cause
>>> incorrect behaviour if a negative shift could generate adverse side
>>> effects (such as a trap on some architectures for instance).
>>>
>>> Regardless of whether that may happen or not, silence the warning as a
>>> full WARN backtrace isn't nice.
>>>
>>> Reported-by: Bart Van Assche <bvanassche@acm.org>
>>> Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>   drivers/media/usb/uvc/uvc_ctrl.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
>>> index 6c37aa018ad5..b2cdee0f7763 100644
>>> --- a/drivers/media/usb/uvc/uvc_ctrl.c
>>> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
>>> @@ -773,12 +773,16 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
>>>   	offset &= 7;
>>>   	mask = ((1LL << bits) - 1) << offset;
>>>   
>>> -	for (; bits > 0; data++) {
>>> +	while (1) {
>>>   		u8 byte = *data & mask;
>>>   		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
>>>   		bits -= 8 - (offset > 0 ? offset : 0);
>>> +		if (bits <= 0)
>>> +			break;
>>> +
>>>   		offset -= 8;
>>>   		mask = (1 << bits) - 1;
>>> +		data++;
>>>   	}
>>>   
>>>   	/* Sign-extend the value if needed. */
>>
>> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
>>
>> Thanks for having addressed this quickly!
> 
> You're welcome. Would you be able to test the patch to ensure it fixes
> the issue on your system (and that there are no observable side effects)
> ?

This patch works fine on top of kernel v5.8.2 with UBSAN enabled (videocalls
still work fine), hence:

Tested-by: Bart Van Assche <bvanassche@acm.org>
