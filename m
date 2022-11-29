Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB18763BEB3
	for <lists+linux-media@lfdr.de>; Tue, 29 Nov 2022 12:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbiK2LPR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Nov 2022 06:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiK2LPP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Nov 2022 06:15:15 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F054FFB3;
        Tue, 29 Nov 2022 03:15:14 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ABA124DA;
        Tue, 29 Nov 2022 12:15:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669720512;
        bh=6ymnuxC73Bi+XxxsJo1TuShFF+5Hw8ToW16HXWGnwvk=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=krzFuGlb2VAKdyjutf31+7QPQuRviHxuekQRTjsBX1xALDM1d+PveC54rSO5Kz3ae
         7yTEAWj1teiHDYYVBSZNGVSZn+Xwl0L70mkDT5A6YvrPeOPTYLLKCS1bphU+/RDPM+
         0yqtcl5EAL6v9ocum7GV8cMx2bQmYeQhtWpHL7pY=
Message-ID: <2e28fbab-2367-5d00-6e46-37879fd046e5@ideasonboard.com>
Date:   Tue, 29 Nov 2022 11:15:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Michael Grzeschik <mgr@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org, kernel@pengutronix.de
References: <20221128103124.655264-1-m.grzeschik@pengutronix.de>
 <Y4V4IED+SBhUR7Su@pendragon.ideasonboard.com>
 <20221129102308.GO18924@pengutronix.de>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v7] usb: gadget: uvc: add validate and fix function for
 uvc response
In-Reply-To: <20221129102308.GO18924@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 29/11/2022 10:23, Michael Grzeschik wrote:
> On Tue, Nov 29, 2022 at 05:10:24AM +0200, Laurent Pinchart wrote:
>> Hi Michael,
>>
>> (CC'ing Dan)
>>
>> Thank you for the patch.
>>
>> On Mon, Nov 28, 2022 at 11:31:25AM +0100, Michael Grzeschik wrote:
>>> When the userspace gets the setup requests for UVC_GET_CUR UVC_GET_MIN,
>>> UVC_GET_MAX, UVC_GET_DEF it will fill out the ctrl response. This data
>>> needs to be validated. Since the kernel also knows the limits for valid
>>> cases, it can fixup the values in case the userspace is setting invalid
>>> data.
>>
>> Why is this a good idea ?
>
> Why is it not? We don't want the userspace to communicate other things
> to the host than what is configured in the configfs. If you only object
> the explanation, then I will improve the commit message and send an
> fixed v8. If you have more objections please share your doubts, thanks.


I'm also not really sure of the benefit; wouldn't this result in 
userspace streaming data that's configured differently to what the host 
is expecting?

>>>  static int
>>>  uvc_send_response(struct uvc_device *uvc, struct uvc_request_data 
>>> *data)
>>>  {
>>> @@ -192,6 +253,21 @@ uvc_send_response(struct uvc_device *uvc, 
>>> struct uvc_request_data *data)
>>>
>>>      memcpy(req->buf, data->data, req->length);
>>>
>>> +    /* validate the ctrl content and fixup */
>>> +    if (!uvc->event_setup_out) {
>>> +        struct uvc_streaming_control *ctrl = req->buf;
>>> +
>>> +        switch (uvc->streaming_request) {
>>> +        case UVC_GET_CUR:
>>> +        case UVC_GET_MIN:
>>> +        case UVC_GET_MAX:
>>> +        case UVC_GET_DEF:
>>> +            uvc_validate_streaming_ctrl(uvc, ctrl);
>>> +        default:
>>> +            break;
>>> +        }
>>> +    }
>>> +


What about read requests for controls that aren't for the streaming 
interface?

>>>      return usb_ep_queue(cdev->gadget->ep0, req, GFP_KERNEL);
>>>  }
>>>
>>
>> -- 
>> Regards,
>>
>> Laurent Pinchart
>>
>
