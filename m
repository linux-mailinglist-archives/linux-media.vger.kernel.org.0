Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7363220F82B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 17:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389357AbgF3PXG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 11:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389250AbgF3PXG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 11:23:06 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C601C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 08:23:06 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 173762A4A99
Subject: Re: [RFC v4 4/8] v4l2: add support for colorspace conversion API
 (CSC) for video capture and subdevices
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     helen.koike@collabora.com, ezequiel@collabora.com,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org, skhan@linuxfoundation.org,
        Hans Verkuil <hans.verkuil@cisco.com>
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
 <20200605172625.19777-5-dafna.hirschfeld@collabora.com>
 <973edb0c-4c52-c29c-4b22-54a05eca6f7a@xs4all.nl>
 <e55548ad47eacd9acf3aa94cc98a46b3f4924cd9.camel@pengutronix.de>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <8fd5417b-970d-e9d5-824a-31658fe50c99@collabora.com>
Date:   Tue, 30 Jun 2020 17:23:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e55548ad47eacd9acf3aa94cc98a46b3f4924cd9.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 26.06.20 14:22, Philipp Zabel wrote:
> Hi Dafna,
> 
> On Mon, 2020-06-08 at 12:00 +0200, Hans Verkuil wrote:
> [...]
>>> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
>>> index 123a231001a8..0f916278137a 100644
>>> --- a/include/uapi/linux/v4l2-mediabus.h
>>> +++ b/include/uapi/linux/v4l2-mediabus.h
>>> @@ -16,6 +16,8 @@
>>>   #include <linux/types.h>
>>>   #include <linux/videodev2.h>
>>>   
>>> +#define V4L2_MBUS_FRAMEFMT_SET_CSC	0x0001
>>> +
>>>   /**
>>>    * struct v4l2_mbus_framefmt - frame format on the media bus
>>>    * @width:	image width
>>> @@ -36,7 +38,8 @@ struct v4l2_mbus_framefmt {
>>>   	__u16			ycbcr_enc;
>>>   	__u16			quantization;
>>>   	__u16			xfer_func;
>>> -	__u16			reserved[11];
>>> +	__u16			flags;
>>> +	__u16			reserved[10];
>>>   };
> 
> The the flags field should also be added to the kerneldoc comment.

Hi, Which kerneldoc comment do you mean?
I added to the doc of the v4l2-mbus-framefmt:

     * - __u16
       - ``flags``
       - flags See:  :ref:v4l2-mbus-framefmt-flags
  

> 
>>>   
>>>   #ifndef __KERNEL__
>>> diff --git a/include/uapi/linux/v4l2-subdev.h b/include/uapi/linux/v4l2-subdev.h
>>> index 5d2a1dab7911..972e64d8b54e 100644
>>> --- a/include/uapi/linux/v4l2-subdev.h
>>> +++ b/include/uapi/linux/v4l2-subdev.h
>>> @@ -65,6 +65,8 @@ struct v4l2_subdev_crop {
>>>   	__u32 reserved[8];
>>>   };
>>>   
>>> +#define V4L2_SUBDEV_MBUS_CODE_CSC_YCBCR_ENC	0x00000001
>>> +#define V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION	0x00000002
>>>   /**
>>>    * struct v4l2_subdev_mbus_code_enum - Media bus format enumeration
>>>    * @pad: pad number, as reported by the media API
>>> @@ -77,7 +79,8 @@ struct v4l2_subdev_mbus_code_enum {
>>>   	__u32 index;
>>>   	__u32 code;
>>>   	__u32 which;
>>> -	__u32 reserved[8];
>>> +	__u32 flags;
>>> +	__u32 reserved[7];
>>>   };
> 
> Same as above.

Same questions as above.

Thanks,
Dafna

> 
> regards
> Philipp
> 
