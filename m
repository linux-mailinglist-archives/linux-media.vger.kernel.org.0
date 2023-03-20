Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D26E6C0DE3
	for <lists+linux-media@lfdr.de>; Mon, 20 Mar 2023 10:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCTJ5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Mar 2023 05:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjCTJ45 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Mar 2023 05:56:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762A28A70
        for <linux-media@vger.kernel.org>; Mon, 20 Mar 2023 02:56:16 -0700 (PDT)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43B0D1257;
        Mon, 20 Mar 2023 10:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679306174;
        bh=OWDNCBLljGPAlrJjHJVZym/+pKJfCAenKUQxItuUDNI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=i1BUWYZhb3aShkQds8mwyVWWbHldVpeiEWuIfwjVXzIxxvksiuNQqoUJQcPZG/Nwg
         cxiCNm2y8J4CYsaYcPF+6vXUJ3wYwPHBzqs5K1ehfKRMLRtc4hYQYWDqeZlH/Ydg75
         zyL/n7s9+BDZC/QIMZE1aXRbw9LCyZBY+31mB8u0=
Message-ID: <91a5309d-9d88-e0e3-7536-9ceb5a7240ca@ideasonboard.com>
Date:   Mon, 20 Mar 2023 11:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: v4l2-subdev: Add new ioctl for client capabilities
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>
References: <20230228154023.208465-1-tomi.valkeinen@ideasonboard.com>
 <20230312131134.GG2545@pendragon.ideasonboard.com>
 <1e3faadb-bb57-74f8-10bb-3a7267916398@ideasonboard.com>
 <20230319144037.GO10144@pendragon.ideasonboard.com>
 <ZBgWMfqVeW7E20NG@kekkonen.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZBgWMfqVeW7E20NG@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/03/2023 10:15, Sakari Ailus wrote:
> Hi Laurent,
> 
> On Sun, Mar 19, 2023 at 04:40:37PM +0200, Laurent Pinchart wrote:
>>>>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
>>>>> index 654d659de835..9f863240a458 100644
>>>>> --- a/include/uapi/linux/v4l2-subdev.h
>>>>> +++ b/include/uapi/linux/v4l2-subdev.h
>>>>> @@ -233,6 +233,26 @@ struct v4l2_subdev_routing {
>>>>>    	__u32 reserved[6];
>>>>>    };
>>>>>    
>>>>> +/*
>>>>> + * The client is aware of streams. Setting this flag enables the use of streams
>>>>> + * and routing related ioctls and fields. If this is not set (which is the
>>>>> + * default), all the 'stream' fields referring to the stream number will be
>>>>> + * forced to 0 by the kernel, and routing related ioctls will return
>>>>> + * -ENOIOCTLCMD.
>>>>
>>>> Do we need the latter ? Surely if userspace calls routing ioctls, it
>>>> should be stream-aware.
>>>
>>> I think it makes the API more consistent. I don't think there's much use
>>> for the routing ioctls without the stream field.
>>>
>>> I guess it depends on what V4L2_SUBDEV_CLIENT_CAP_STREAMS means. I
>>> thought it means "client wants to use streams", but if we define it to
>>> mean "client is aware of streams and has cleared the 'stream' fields",
>>> then we can only do the field clearing.
>>
>> I would go for the second option, as that's the need we have at the
>> moment, ensuring backward compatibility with the introduction of the
>> streams field.
> 
> I'd prefer this, too. Defining it clearly what this actually means is
> better as is configuring exactly what's needed --- in order to make it
> easier to avoid passing garbage both ways between the user and the kernel
> (where it may be a security issue as well).

I think this makes sense. I'll simplify the patch regarding this flag.

  Tomi

