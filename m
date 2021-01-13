Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5012F53EF
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 21:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbhAMUOU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 15:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbhAMUOT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 15:14:19 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C4AC0617A2
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 12:13:34 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id r4so2758349wmh.5
        for <linux-media@vger.kernel.org>; Wed, 13 Jan 2021 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fR99G3bt98oEGLiVzUO8INrgnuNbY7tZyZ7pa/Hxs2k=;
        b=ZJSAcPmao6ITatM6teOy8cevdeCg+cdv+lTs2JahLmumtjVZXEoM5ww71qbZ48AV7B
         GGZ4T9+WHCg9zF2L5VMP36vYPqoZCkC4+9Kaetde0DYSQRJ8vyY9gLvC2N3IUBA0Bl6r
         IOcDNgTgv8Rn1dyYr7Jq89kf8VIsdn8ArvBYmPbYqCh1cN1LK5cxuIbikBHgdR+9WnsS
         NWkAfJB68/N3wud+k+LerP6PY/lVXIpJSBaD/iJFkd/9NU03ZfIOoBgUrZQ1iDK1ug97
         jRh3fgzTR6XRV0V5aaQKYOcmfjfLT5Lz/hcAK9qpkoVtX57haFNwtMN7BUdo7y3SB+Fz
         NcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fR99G3bt98oEGLiVzUO8INrgnuNbY7tZyZ7pa/Hxs2k=;
        b=bKmot5Sk/ydD6twkDCOYH1d50opYU1nRwdU2g/gqhqfkXAycL3sS1EFoNu6GzvGN14
         CiZI59/M40LKcbO95JvUq3BRt4dXJS/nRQ9l9N84gwyEhTiKZRwlja8fBhu3MA/AWgNx
         +rHn0nu/eheytrAdG0Uk6fqb3mmQjUHZlyqkSuAZKnou+Er2IbhX6I4nlLXX1BclCQzl
         zVHxbEPFBbll/BkbCEGFrZ4WmF30smeJEVh4z8+rrPNTG5hdL9MDUl4HTnH+Vb1eXzUO
         n2j0/ekV9IJozJy1jayumaeyeNnB6WJdeX+ZxJy7Gm0+CFTJO/yIAhuK0lBYhTXs54IX
         TK7A==
X-Gm-Message-State: AOAM5317nbyOjYyf7fLrJ6e6yHwkxIOFwDlkWOSQwBFL5WYnlPaBO1PD
        VnkJaZJygm5kBVG3Cdi8qBM=
X-Google-Smtp-Source: ABdhPJyOzT0oA3TS7nv5nqA5aYKRW9DE0or/8UwipQhZGrIHH5hLjXKdMcVfiCr4uXkiCdPXbSQpwA==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr769280wmh.131.1610568813438;
        Wed, 13 Jan 2021 12:13:33 -0800 (PST)
Received: from [172.30.88.170] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w21sm4269626wmi.45.2021.01.13.12.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 12:13:32 -0800 (PST)
Subject: Re: [PATCH] media: imx6-mipi-csi2: Call remote subdev get_mbus_config
 to get active lanes
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>
References: <20201229103102.45547-1-ezequiel@collabora.com>
 <cdd4a805-13a7-ab1a-dcf6-1d22c2dde1e5@gmail.com>
 <7c87bf467d44d32a3f8d67dec8c581e82b09eaf7.camel@collabora.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <c1295e6e-091e-efae-7ad8-d7572dc777ec@gmail.com>
Date:   Wed, 13 Jan 2021 12:13:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7c87bf467d44d32a3f8d67dec8c581e82b09eaf7.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On 1/11/21 7:11 AM, Ezequiel Garcia wrote:
> Hi Steve,
>
> On Fri, 2021-01-08 at 11:10 -0800, Steve Longerbeam wrote:
>> On 12/29/20 2:31 AM, Ezequiel Garcia wrote:
>>> Currently, the CSI2 subdevice is using the data-lanes from the
>>> neareast endpoint to config the CSI2 lanes.
>>>
>>> While this may work, the proper way to configure the hardware is
>>> to obtain the remote subdevice in v4l2_async_notifier_operations.bound(),
>>> and then call get_mbus_config using the remote subdevice to get
>>> the active lanes.
>>>
>>> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
>>> ---
>>>    drivers/staging/media/imx/TODO             |  12 ---
>>>    drivers/staging/media/imx/imx6-mipi-csi2.c | 101 ++++++++++++++++++---
>>>    2 files changed, 90 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/imx/TODO b/drivers/staging/media/imx/TODO
>>> index 9cfc1c1e78dc..c575f419204a 100644
>>> --- a/drivers/staging/media/imx/TODO
>>> +++ b/drivers/staging/media/imx/TODO
>>> @@ -2,18 +2,6 @@
>>>    - The Frame Interval Monitor could be exported to v4l2-core for
>>>      general use.
>>>    
>>> -- The CSI subdevice parses its nearest upstream neighbor's device-tree
>>> -  bus config in order to setup the CSI. Laurent Pinchart argues that
>>> -  instead the CSI subdev should call its neighbor's g_mbus_config op
>>> -  (which should be propagated if necessary) to get this info. However
>>> -  Hans Verkuil is planning to remove the g_mbus_config op. For now this
>>> -  driver uses the parsed DT bus config method until this issue is
>>> -  resolved.
>> This TODO was actually referring to the fwnode endpoint parsing in
>> imx-media-csi.c, not imx6-mipi-csi2.c.
>>
> Ah, OK.
>
>> But the same conversion to call .get_mbus_config() instead of endpoint
>> parsing could be done in imx-media-csi.c, but there is one imx6
>> constraint that is preventing this from happening. The imx6 reference
>> manual states that if the CSI is receiving from an input parallel bus
>> that is 16-bits wide, the data must go directly to memory via the SMFC
>> and not be sent to the IPU's Image Converter ("passthrough" mode):
>>
>> "37.4.3.9 16 bit camera support
>>
>> Devices that support 16 bit data bus can be connected to the CSI. This
>> can be done in one
>> of the following ways.
>>
>> 16 bit YUV422
>> In this mode the CSI receives 2 components per cycle. The CSI is
>> programmed to
>> accept the data as 16 bit generic data. The captured data will be stored
>> in the memory
>> through the SMFC. The IDMAC needs to be programmed to store 16bit
>> generic data.
>> When the data is read back from the memory for further processing in the
>> IPU it will
>> be read as YUV422 data."
>>
>> Same is said for RGB data to the CSI.
>>
>> I'm not sure if this restriction is real or not. If this restriction
>> were ignored, the fwnode endpoint check "ep->bus.parallel.bus_width >=
>> 16" could be removed and the only remaining info required to determine
>> passthrough mode is available from 'struct v4l2_mbus_config' and the
>> input mbus codes, thus allowing the conversion to .get_mbus_config().
>>
> For the sound of this, the above doesn't affect this patch, right?

Correct, the conversion to .get_mbus_config() in imx-media-csi.c can be 
a separate patch.

> Also, note there's a v2 submitted:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20210103154155.318300-1-ezequiel@collabora.com/
>
> Now, there's something I'm not exactly sure about these .get_mbus_config
> conversions, being described in the TODO file.
>
> The TODO file should only list what's missing to move the driver
> out of staging. Converting to newer APIs doesn't seem a blocker:
> there are a ton of drivers using old APIs out there, which is
> a natural consequence of how the kernel evolve APIs all the time.
>
> I'm wondering if the other TODO items apply as well, moving
> the Frame Interval Monitor to the v4l2-core is something we
> can always do at any later point. It shouldn't be a requirement
> for destaging.
>
> There's one thing that we must resolve before de-staging.
> The media controller topology, which is a form of ABI should
> be settled, as that's difficult to change later.
>
> However, this item is not mentioned in the TODO.
>
> So, I was thinking we should remove all the current TODO
> items and add something about the media controller topology
> stability requirements.
>
> What do you think?

The only suggestion I see that would affect the MC topology is Laurent's 
patch that paves the way to make a few of the imx6 media links 
immutable. That's not really a topology change but I agree it needs 
settling before moving out of staging.

Steve

