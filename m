Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA09920F924
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 18:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgF3QLL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 12:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgF3QLK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 12:11:10 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2986CC061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 09:11:10 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 23A3F265B28
Subject: Re: [RFC v3 1/2] v4l2: add support for colorspace conversion for
 video capture
To:     Tomasz Figa <tfiga@chromium.org>,
        Hans Verkuil <HansVerkuil@cisco.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, sakari.ailus@linux.intel.com,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200416145605.12399-1-dafna.hirschfeld@collabora.com>
 <20200604173901.GA76282@chromium.org>
 <dba58521-a619-91fe-2b60-ea5ce85a9fa2@collabora.com>
 <20200610133411.GA192932@chromium.org>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <a4754496-2074-046a-1532-f9d697e200c1@collabora.com>
Date:   Tue, 30 Jun 2020 18:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610133411.GA192932@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 10.06.20 15:34, Tomasz Figa wrote:
> On Fri, Jun 05, 2020 at 12:11:33PM +0200, Dafna Hirschfeld wrote:
>> Hi,
>>
>> On 04.06.20 19:39, Tomasz Figa wrote:
>>> Hi Dafna,
>>>
>>> On Thu, Apr 16, 2020 at 04:56:04PM +0200, Dafna Hirschfeld wrote:
>>>> From: Philipp Zabel <p.zabel@pengutronix.de>
>>>>
>>>> For video capture it is the driver that reports the colorspace,
>>>> Y'CbCr/HSV encoding, quantization range and transfer function
>>>> used by the video, and there is no way to request something
>>>> different, even though many HDTV receivers have some sort of
>>>> colorspace conversion capabilities.
>>>>
>>>
>>> Thanks for working on this! Please see my comments inline.
>>>
>>>> For output video this feature already exists since the application
>>>> specifies this information for the video format it will send out, and
>>>> the transmitter will enable any available CSC if a format conversion has
>>>> to be performed in order to match the capabilities of the sink.
>>>>
>>>> For video capture we propose adding new pix_format flag:
>>>> V4L2_PIX_FMT_FLAG_HAS_CSC. The flag is set by the application,
>>>> the driver will interpret the ycbcr_enc/hsv_enc, and quantization fields
>>>> as the requested colorspace information and will attempt to
>>>> do the conversion it supports.
>>>>
>>>> Drivers set the flags
>>>> V4L2_FMT_FLAG_CSC_YCBCR_ENC,
>>>> V4L2_FMT_FLAG_CSC_HSV_ENC,
>>>> V4L2_FMT_FLAG_CSC_HSV_QUANTIZATION,
>>>
>>> Do we need this level of granularity? The drivers would ignore
>>> unsupported encoding/quantization settings and reset them to supported
>>> ones anyway, so if one doesn't support changing given parameter, it
>>> would just return back the original stream parameter.
>>
>> I think this granularity allows userspace to know ahead what is supported
>> and what is not so it doesn't have to guess.
>>
> 
> The userspace needs to guess anyway, because there is no way to
> enumerate the supported target parameters. For example, even if the
> CSC_YCBCR_ENC bit is set, only only DEFAULT, 601 and BT2020 could be
> supported. If the userspace wants to get the 709 encoding, it needs to
> explicitly try setting it and see if the TRY_FMT/S_FMT operation accepts
> the setting.

yes, indeed, Hans Verkuil suggested those flags. Maybe it is indeed enough
to have one flag.

> 
> [snip]
>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> index a376b351135f..51e009936aad 100644
>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>> @@ -477,6 +477,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>>>    	case VIDIOC_SUBDEV_S_FMT: {
>>>>    		struct v4l2_subdev_format *format = arg;
>>>> +		if (!(format->format.flags & V4L2_MBUS_FRAMEFMT_HAS_CSC)) {
>>>> +			format->format.colorspace = V4L2_COLORSPACE_DEFAULT;
>>>> +			format->format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
>>>> +			format->format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>>>> +			format->format.quantization = V4L2_QUANTIZATION_DEFAULT;
>>>> +		}
>>>
>>> Wouldn't this break setting the colorspaces on the sink pads, for which
>>> the flag isn't required? Actually there is some unfortunate statement in
>>> the documentation related to this:
>>>
>>> "This information supplements the colorspace and must be set by the
>>> driver for capture streams and by the application for output streams,
>>> see Colorspaces."
>>>
>>> However, I don't think there is any notion of "capture" and "output" for
>>> subdevices, right? Instead, the pad direction would have to be checked,
>>> but AFAICT there is no access to this kind of information from this
>>> wrapper.
>>
>> Actually in coming v4 there is no new code added accept of the new fields and
>> macros of the API. I think there is no need to change any code.
>>
>>
> 
> Agreed.
> 
>>>
>>>> +
>>>>    		memset(format->reserved, 0, sizeof(format->reserved));
>>>>    		memset(format->format.reserved, 0, sizeof(format->format.reserved));
>>>>    		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
>>>> diff --git a/include/uapi/linux/v4l2-mediabus.h b/include/uapi/linux/v4l2-mediabus.h
>>>> index 123a231001a8..89ff0ad6a631 100644
>>>> --- a/include/uapi/linux/v4l2-mediabus.h
>>>> +++ b/include/uapi/linux/v4l2-mediabus.h
>>>> @@ -16,6 +16,8 @@
>>>>    #include <linux/types.h>
>>>>    #include <linux/videodev2.h>
>>>> +#define V4L2_MBUS_FRAMEFMT_HAS_CSC	0x0001
>>>> +
>>>>    /**
>>>>     * struct v4l2_mbus_framefmt - frame format on the media bus
>>>>     * @width:	image width
>>>> @@ -36,7 +38,8 @@ struct v4l2_mbus_framefmt {
>>>>    	__u16			ycbcr_enc;
>>>>    	__u16			quantization;
>>>>    	__u16			xfer_func;
>>>> -	__u16			reserved[11];
>>>> +	__u16			flags;
>>>
>>> Are we okay with a u16 for flags?
>>
>> I am fine with it, though don't mind changing it if there are objections.
>>
> 
> I'd suggest making it a u32 to be a bit more future-proof.

ok, I see that just changing the type to __u32 and the reserved array
to 'reserved[9]' increases the struct size from 48 to 52 because of padding.
There are two ways to solve it,
- move the flags field to be just above 'ycbcr_enc'
- change reserve to 'reserve[8]'

Is moving fields order in a struct ok? If so it save us 2 bytes.

Thanks,
Dafna

> 
> Best regards,
> Tomasz
> 
